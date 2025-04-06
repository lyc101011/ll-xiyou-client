local 好友消息类 = class()
local tp
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起
local bw = require("gge包围盒")(0,0,120,20)
local box = 引擎.画矩形
local tx = 引擎.取头像
local min = math.min
local 按钮 = require("script/系统类/按钮")
local 字体
local ceil = math.ceil
local min = math.min

function 好友消息类:初始化(根)
	self.ID = 82
	self.x = 300
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "好友消息类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.丰富文本 =  require("script/系统类/丰富文本")(360,115)
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 滑块 = 根._滑块
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,423,346,3,9),
		[2] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true," 发 送"),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"加为好友"),
		[4] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"下一条"),
		[6] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[7] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[8] = 滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,110,2),
		[9] = 资源:载入('wzife.wdf',"网易WDF动画",0x88e77b7),
		[10] = 自适应.创建(3,1,40,19,1,3), --人物状态灰白
		[11] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1355680296),0,0,4,true,true),
		[12] = 资源:载入("pic/聊天框/lt.png","图片"),
		[13] = 自适应.创建(34,1,395,140,3,9),
		[14] = 自适应.创建(78,1,395,75,3,9),
		[15] = 资源:载入('wzife.wdf',"网易WDF动画",2635218553),
		[16] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"清空消息"),
	}

	--2635218553 彩色
	for i=2,7 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[16]:绑定窗口_(self.ID)
	self.资源组[2]:置偏移(3,0)
	self.窗口时间 = 0
	tp = 根
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("聊天输入",0,0,400,20,根,根.字体表.华康14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(120)
	-- self.输入框:置多行(20)
	-- self.输入框:置自动换行(20)
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	-- self.输入框 = 总控件:创建输入("输入",0,0,400,20,根,根.字体表.华康14)
	-- self.输入框:置可视(false,false)
	-- self.输入框:置限制字数(100)
	-- self.输入框:置光标颜色(-16777216)
	-- self.输入框:置文字颜色(-16777216)
end

function 好友消息类:打开(名称,id,友好,等级,模型,类型,消息)
	self.介绍加入=0
	if 名称==nil then
		self.可视=false
		self.输入框:置可视(false,false)
		return
	end
	insert(tp.窗口_,self)
	tp.运行时间 = tp.运行时间 + 1
	self.窗口时间 = tp.运行时间
	self.可视 = true
	self.名称=名称
	self.id=id
	self.友好=友好
	self.等级=等级
	if self.友好==nil then
		self.友好=0
	end
	self.类型=类型 --1为发送消息  2为接收消息  3 为系统消息
	if 类型==3 then
	    self.丰富文本 =  require("script/系统类/丰富文本")(300,115)
	end
	self.消息=消息
	self.头像=nil
	if 模型~=nil then
		local x = tx(模型)
		self.头像=tp.资源:载入(x[7],"网易WDF动画",x[2])
	end
	if 字体==nil then 字体=tp.字体表.普通字体 end
	self.输入框:置可视(true,true)
	self.输入框:置文本("")
	self.丰富文本:清空()
	if self.类型 == 1 then
		if f函数.文件是否存在([[data/]]..tp.队伍[1].数字id) then
			if f函数.文件是否存在([[data/]]..tp.队伍[1].数字id..[[/]]..id) then
				self.丰富文本:添加文本(读入文件([[data\]]..tp.队伍[1].数字id..[[\]]..id..[[\记录.txt]]))
			else
				os.execute("md "..[[data\]]..tp.队伍[1].数字id..[[\]]..id)
				local file =io.open([[data\]]..tp.队伍[1].数字id..[[\]]..id..[[\记录.txt]],"w")
				file:write("")
				file:close()
			end
		else
			os.execute("md "..[[data\]]..tp.队伍[1].数字id)
			os.execute("md "..[[data\]]..tp.队伍[1].数字id..[[\]]..id)
			local file =io.open([[data\]]..tp.队伍[1].数字id..[[\]]..id..[[\记录.txt]],"w")
			file:write("")
			file:close()
		end
	end
	for i=1,#self.丰富文本.显示表 - 6 do
		self.丰富文本:滚动(1)
	end
	self.资源组[8]:置起始点(0)
end
function 好友消息类:更新(dt) end

function 好友消息类:显示(dt,x,y)
	self.焦点=false
	if self.类型 == 1 then
		if self.头像==nil then return  end
		self.资源组[1]:显示(self.x,self.y)

		self.资源组[4]:显示(self.x-18+self.资源组[1].宽度,self.y+3)--关闭
		tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
		引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"好友聊天")
		self.资源组[12]:显示(self.x+97,self.y+37)
		self.资源组[13]:显示(self.x+15,self.y+92)
		self.资源组[14]:显示(self.x+15,self.y+261)

		self.资源组[2]:显示(self.x+275,self.y+235)
		self.资源组[15]:显示(self.x+285+77,self.y+235)--彩色
		self.资源组[3]:显示(self.x+19,self.y+235)
		self.资源组[16]:显示(self.x+182,self.y+235)--清空

		self.资源组[5]:显示(self.x+97,self.y+235)
		self.资源组[6]:显示(self.x+330+69,self.y+80+13)
		self.资源组[7]:显示(self.x+330+69,self.y+195+23)

		self.资源组[2]:更新(x,y)
		self.资源组[3]:更新(x,y)
		self.资源组[4]:更新(x,y)
		self.资源组[16]:更新(x,y)
		self.资源组[5]:更新(x,y,消息闪烁)
		self.资源组[6]:更新(x,y,self.介绍加入 > 0)
		self.资源组[7]:更新(x,y,self.介绍加入 < #self.丰富文本.显示表 - 13)
		if self.资源组[4]:事件判断() then
			self:打开()
		elseif self.资源组[16]:事件判断() then
			local file =io.open([[data\]]..tp.队伍[1].数字id..[[\]]..self.id..[[\记录.txt]],"w")
			file:write("")
			file:close()
			self.丰富文本:清空()
			tp.常规提示:打开("#Y清理成功~")
		elseif self.资源组[2]:事件判断() or 引擎.按键弹起(KEY.ENTER) then --发送
			if self.输入框:取文本()=="" then
				tp.常规提示:打开("#Y您想说点什么给对方听呢？")
			else
				发送数据(6964,{id=self.id,内容=self.输入框:取文本()})
				-- 发送数据(24,{id=self.id,内容=self.输入框:取文本()})
				self.输入框:置文本("")
			end
		elseif self.资源组[5]:事件判断() and 消息闪烁 then
			-- 发送数据(25)
			发送数据(6965)
		elseif self.资源组[6]:事件判断() then
			self.资源组[8]:置起始点(self.资源组[8]:取百分比转换(self.介绍加入-1,6,#self.丰富文本.显示表))
		elseif self.资源组[7]:事件判断() then
			self.资源组[8]:置起始点(self.资源组[8]:取百分比转换(self.介绍加入+1,6,#self.丰富文本.显示表))
		end
		if self.资源组[13]:是否选中(x,y) then
	        if 引擎.取鼠标滚轮() ==-1 and self.介绍加入 < #self.丰富文本.显示表-6 then --往下滚动
	        	self.资源组[8]:置起始点(self.资源组[8]:取百分比转换(self.介绍加入+1,6,#self.丰富文本.显示表))
	        elseif 引擎.取鼠标滚轮() ==1 and self.介绍加入 > 0 then
	        	self.资源组[8]:置起始点(self.资源组[8]:取百分比转换(self.介绍加入-1,6,#self.丰富文本.显示表))
	        end
	    end
		tp.人物头像背景_:显示(self.x+14,self.y+32)
		self.头像:显示(self.x+17,self.y+35)
		-- 字体:置颜色(黄色)
		-- 字体:显示(self.x+423,self.y+104,"聊")
		-- 字体:显示(self.x+423,self.y+104+20,"天")
		-- 字体:显示(self.x+423,self.y+104+20*2,"监")
		-- 字体:显示(self.x+423,self.y+104+20*3,"控")
		-- 字体:显示(self.x+423,self.y+104+20*4,"中")
		字体:置颜色(黑色)
		字体:显示(self.x+147,self.y+40,self.名称)
		字体:显示(self.x+147,self.y+40+26,self.id)
		字体:显示(self.x+349,self.y+40+26,self.友好)
		字体:显示(self.x+349,self.y+40,self.等级)
		self.控件类:更新(dt,x,y)
		self.控件类:显示(x,y)
		self.输入框:置坐标(self.x + 30,self.y + 268)
		if #self.丰富文本.显示表 > 6 then
			self.介绍加入 = min(ceil((#self.丰富文本.显示表-6)*self.资源组[8]:取百分比()),#self.丰富文本.显示表-6)
			self.丰富文本.加入 = self.介绍加入
			self.资源组[8]:置高度(min(math.floor(113/(#self.丰富文本.显示表-6)),35))
			self.资源组[8]:显示(self.x+400,self.y+107,x,y,self.鼠标) --滑块
		end
		self.丰富文本:显示(self.x+23,self.y+83)
	elseif self.类型 == 3 then --GM消息
		self.资源组[9]:显示(self.x,self.y)
		self.资源组[2]:显示(self.x+272,self.y+215)
		self.资源组[3]:显示(self.x+19,self.y+215)
		-- self.资源组[4]:显示(self.x+341,self.y+5)
		self.资源组[5]:显示(self.x+97,self.y+215)
		-- self.资源组[6]:显示(self.x+330,self.y+80)
		-- self.资源组[7]:显示(self.x+330,self.y+195)
		self.资源组[11]:更新1(x,y)
		self.资源组[5]:更新(x,y,消息闪烁)
		-- self.资源组[6]:更新(x,y,self.介绍加入 > 0)
		-- self.资源组[7]:更新(x,y,self.介绍加入 < #self.丰富文本.显示表 - 13)
		self.资源组[11]:显示(self.x+341,self.y+5)
		self.头像:显示(self.x+15,self.y+30)
		if self.资源组[11]:事件判断() then
			self:打开()
		elseif self.资源组[5]:事件判断() and 消息闪烁 then
			-- 发送数据(25)
			发送数据(6965)
		-- elseif self.资源组[6]:事件判断() then
		-- 	self.资源组[8]:置起始点(self.资源组[8]:取百分比转换(self.介绍加入-1,6,#self.丰富文本.显示表))
		-- elseif self.资源组[7]:事件判断() then
		-- 	self.资源组[8]:置起始点(self.资源组[8]:取百分比转换(self.介绍加入+1,6,#self.丰富文本.显示表))
		end
		字体:置颜色(黑色)
		字体:显示(self.x+120,self.y+38,"系统")
		字体:显示(self.x+120,self.y+62,"G M")
		if #self.丰富文本.显示表 > 6 then
			self.介绍加入 = min(ceil((#self.丰富文本.显示表-6)*self.资源组[8]:取百分比()),#self.丰富文本.显示表-6)
			self.丰富文本.加入 = self.介绍加入
			self.资源组[8]:显示(self.x+331,self.y+100,x,y,self.鼠标)
		end
		self.丰富文本:显示(self.x+23,self.y+90)
	end
end

function 好友消息类:检查点(x,y)
	if self.可视 and (self.资源组[1]:是否选中(x,y) or self.资源组[9]:是否选中(x,y ))then
		return true
	end
end

function 好友消息类:初始移动(x,y)
	-- if 1==1 then return  end
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
		self.窗口时间 = tp.运行时间
	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 好友消息类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 好友消息类