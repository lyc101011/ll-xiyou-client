local 场景类_好友列表 = class()
local floor = math.floor
local tp,zts,zts1,cks
local tx = 引擎.取头像
local bwh = require("gge包围盒")
local bw = bwh(0,0,153,58)
-- local bw1 = bwh(0,0,140,30)
local mouseb = 引擎.鼠标弹起
local box = 引擎.画矩形
local insert = table.insert

function 场景类_好友列表:初始化(根)
	self.ID = 80
	self.x = 全局游戏宽度-200
	self.y = 55
	self.xx = 0
	-- 全局游戏宽度-26,全局游戏高度-34
	self.yy = 0
	-- self.右键关闭=1
	self.注释 = "好友列表"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true

	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	cks = tp.人物仓库

	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("查找名称输入",350 + 53,150 + 40,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(12)
	self.输入框:置文本("")
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.输入框1 = 总控件:创建输入("查找id输入",350 + 222,150 + 40,100,14)
	self.输入框1:置数字模式()
	self.输入框1:置可视(false,false)
	self.输入框1:置限制字数(11)
	self.输入框1:屏蔽快捷键(true)
	self.输入框1:置光标颜色(-16777216)
	self.输入框1:置文字颜色(-16777216)
	self.包围盒={}
	for n=1,4 do
		self.包围盒[n] 	= require("gge包围盒")(self.x,self.y,60,20)
	end

	self.名称盒子={}
	for n=1,8 do
		self.名称盒子[n] 	= require("gge包围盒")(self.x,self.y,100,20)
	end
end

function 场景类_好友列表:打开(内容)
	if self.可视 then
		self.可视 = false
	else
		cks = tp.人物仓库
		insert(tp.窗口_,self)
		self.选中 = 0
		self.加入 = 0
		self.数据=内容
		if self.资源组==nil then
		    local 资源 = tp.资源
			local 按钮 = tp._按钮
			local 自适应 = tp._自适应
			self.资源组 = {
				[1] = 自适应.创建(0,1,188,386,3,9),
				[3] = 自适应.创建(34,1,172,295,3,9),
				[4] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
				[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"快速添加"),
				[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"在线查询"),
				[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 下一页"),
				[8] = 资源:载入('wzife.wdf',"网易WDF动画",0X60D3F930),
				[9] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"查找"),
				[10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"添加好友"),
				[11] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"临时好友"),
				[12] = 按钮.创建(自适应.创建(12,3,72,22,1,3),0,0,4,true,true,"黑名单"),
				[13] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
				[14] = 资源:载入('wzife.wdf',"网易WDF动画",0X3D5D95E9),
				[15] = 资源:载入('wzife.wdf',"网易WDF动画",0X39496AA9),
				[16] = 按钮.创建(自适应.创建(12,4,52,22,1,3),0,0,4,true,true,"消息"),
				[17] = 按钮.创建(自适应.创建(12,4,52,22,1,3),0,0,4,true,true,"好友"),
				[18] = 按钮.创建(自适应.创建(12,4,52,22,1,3),0,0,4,true,true," 群"),
				[19] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true), --+号

			}
			-- 自适应.创建(34,1,173,182,3,9),
			--'wzife.wdf' 909815579 头像底图 909815579
			self.头像背景 = 资源:载入('pic/txbj.png',"图片")
		    self.右 = 资源:载入("pic/聊天框/右.png","图片")
		    -- self.下 = 资源:载入("pic/聊天框/下.png","图片")

			for i=4,7 do
				self.资源组[i]:绑定窗口_(self.ID)
			end
			for i=9,13 do
				self.资源组[i]:绑定窗口_(self.ID)
			end
			for i=16,18 do
				self.资源组[i]:置偏移(2,0)
			end
		end
-- 巨魔王
-- 骨精灵
-- 羽灵神
		-- local ces = {"狐美人","剑侠客","羽灵神","飞燕女","巨魔王","骨精灵"}
		-- for i=1,6 do
		-- 	self.数据.好友[#self.数据.好友+1]={模型=ces[i],名称="的法国人威威",在线=true}
		-- end
		for n=1,#self.数据["好友"] do
			if self.数据["好友"][n].在线 then
				self.在线排序=true
			end
		end
		if self.在线排序 then
			table.sort(self.数据["好友"],function(a,b) return a.在线 and b.在线==nil end )
		end


		self.头像组 = {}
        local 资源 = tp.资源
        self.名称=tp.队伍[1].名称
        self.梦幻精灵 = 资源:载入("pic/聊天框/mhjl.png","图片")
		local xx = tx(tp.队伍[1].模型)
		self.主角 = 资源:载入(xx[9],"网易WDF动画",xx[8])
		-- self.偏移x,self.偏移y = 等比例缩放公式(30,30,self.主角.宽度,self.主角.高度)
		for i=1,#self.数据.好友 do
			local xsw = tx(self.数据.好友[i].模型) --self.数据.好友[i].模型
			self.头像组[i]=资源:载入(xsw[9],"网易WDF动画",xsw[8])
		end

		self.高度偏移 = 0
		self.x = 全局游戏宽度-188
		if 全局游戏高度==768 then
		    self.资源组[1]:置宽高(188,560)
		    self.资源组[3]:置宽高(173,470)
		    self.高度偏移 = 172
		else
			self.资源组[1]:置宽高(188,560-46)
		    self.资源组[3]:置宽高(173,470-46)
		    self.高度偏移=126
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.当前类型=""

		self.查找开关=false
		self.查找结果={}
		self.排序行数=0
		self.对话开关=false
		self.显示信息={}
		-- self.在线排序=false
	end
end

function 场景类_好友列表:查找显示(dt,x,y)
	self.资源组[8]:显示(350,150)
	self.资源组[9]:更新1(x,y)
	self.资源组[10]:更新1(x,y)
	self.资源组[11]:更新1(x,y)
	self.资源组[12]:更新1(x,y)
	self.资源组[13]:更新1(x,y)
	self.资源组[9]:显示(370,376)
	self.资源组[10]:显示(420,376)
	self.资源组[11]:显示(500,376)
	self.资源组[12]:显示(580,376)
	self.资源组[13]:显示(640,153)
	if self.资源组[8]:是否选中(x,y) and 引擎.鼠标弹起(右键) then
		self.查找开关=false
	elseif self.资源组[13]:事件判断() then
		self.查找开关=false
		self.输入框:置可视(false,false)
		self.输入框:置文本("")
		self.输入框1:置可视(false,false)
		self.输入框1:置文本("")
	elseif self.资源组[9]:事件判断() then
		if self.输入框:取文本()=="" and self.输入框1:取文本()==""  then
			tp.常规提示:打开("#Y请先输入要查找的角色名称或ID")
			return
		else
			发送数据(6957,{名称=self.输入框:取文本(),id=self.输入框1:取文本()})
			-- 发送数据(17,{名称=self.输入框:取文本(),id=self.输入框1:取文本()})
		end
	elseif self.资源组[10]:事件判断() then
		if self.输入框:取文本()=="" and self.输入框1:取文本()==""  then
			tp.常规提示:打开("#Y请先输入要添加的角色名称或ID")
			return
		else
			发送数据(6958,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),类型=1})
			-- 发送数据(18,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),类型=1})
		end
 elseif self.资源组[11]:事件判断() then
		if self.输入框:取文本()=="" and self.输入框1:取文本()==""  then
			tp.常规提示:打开("#Y请先输入要添加的角色名称或ID")
			return
		else
			-- 发送数据(18,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),类型=2})
			发送数据(6958,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),类型=2})
		end
	elseif self.资源组[12]:事件判断() then
		if self.输入框:取文本()=="" and self.输入框1:取文本()==""  then
			tp.常规提示:打开("#Y请先输入要添加的角色名称或ID")
			return
		else
			-- 发送数据(18,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),类型=3})
			发送数据(6958,{名称=self.输入框:取文本(),id=self.输入框1:取文本(),类型=3})
		end
	end
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	if #self.查找结果~=0 then
		zts:置颜色(黑色)
		zts:显示(350+42,150+110,"昵称："..self.查找结果[1])
		zts:显示(350+42,150+130,"I  D："..self.查找结果[2])
		zts:显示(350+42,150+150,"等级："..self.查找结果[3])
		zts:显示(350+42,150+170,"门派："..self.查找结果[4])
	end
end

function 场景类_好友列表:显示(dt,x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y,self.选中 ~= 0)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y,self.加入 < #cks - 4)
	self.资源组[16]:更新(x,y)
	self.资源组[17]:更新(x,y)
	self.资源组[18]:更新(x,y)
	self.资源组[19]:更新(x,y)
	if self.资源组[4]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[5]:事件判断() then
		if #tp.队伍 < 5 then
			table.insert(tp.队伍,tp.人物仓库[self.选中])
			table.remove(tp.人物仓库,self.选中)
			for i=1,6 do
				if tp.队伍[#tp.队伍].装备[i] then
					if tp.队伍[#tp.队伍].装备[i].名称 == nil then
						tp.队伍[#tp.队伍].装备[i] = nil
					end
				end
			end
			self.选中 = 0
		else
			tp.常规提示:打开("#Y/队伍人物已满，不可以再加入队员了")
		end
	elseif self.资源组[6]:事件判断() or self.资源组[19]:事件判断() then
		if self.查找开关 then
			self.查找开关=false
			self.输入框:置可视(false,false)
			self.输入框:置文本("")
			self.输入框1:置可视(false,false)
			self.输入框1:置文本("")
		else
			self.查找开关=true
			self.输入框:置可视(true,true)
			self.输入框:置文本("")
			self.输入框1:置可视(true,true)
			self.输入框1:置文本("")
		end
	elseif self.资源组[7]:事件判断() then
		self.加入 = self.加入 + 4
	end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"好友聊天")
	self.资源组[4]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x+7,self.y+29+27)
	self.资源组[6]:显示(self.x+19+25-13,self.y+335+24+self.高度偏移)
	self.资源组[5]:显示(self.x+109+25-11-8-5,self.y+335+24+self.高度偏移)
	self.资源组[16]:显示(self.x+8,self.y+29)
	self.资源组[17]:显示(self.x+22+59-13,self.y+29,nil,nil,nil,true,2)
	self.资源组[18]:显示(self.x+22+59+59-13,self.y+29)
	self.资源组[19]:显示(self.x+8,self.y+335+27+self.高度偏移)
	self.梦幻精灵:显示(self.x+11,self.y+63)
	self.主角:显示(self.x+11,self.y+65+36)
	zts:置颜色(0xFF111111):显示(self.x+42,self.y+65+36+8,self.名称)

	self.包围盒[1]:置坐标(self.x+25,self.y+80+37+20)
	self.包围盒[2]:置坐标(self.x+25,self.y+120+37+self:取好友行数("临时")*33)
	self.包围盒[3]:置坐标(self.x+25,self.y+140+37+self:取好友行数("最近")*33)
	self.包围盒[4]:置坐标(self.x+25,self.y+160+37+self:取好友行数("黑名单")*33)
	-- self.包围盒[5]:置坐标(self.x+25,self.y+160+37+self:取好友行数("黑名单")*20)
	for n=1,#self.包围盒 do
		if self.包围盒[n]:检查点(x,y) then
			box(self.x + 20,self.y+105+30+self:包围一坐标(n), self.x +165,self.y+105+18+30+self:包围一坐标(n),-3551379)
			if 引擎.鼠标弹起(左键) then
				self:打开表头(n)
			end
		end
	end
	self.右:显示(self.x+14,self.y+100+40)
	self.右:显示(self.x+14,self.y+120+40+self:取好友行数("临时")*33)
	self.右:显示(self.x+14,self.y+140+40+self:取好友行数("最近")*33)
	self.右:显示(self.x+14,self.y+160+40+self:取好友行数("黑名单")*33)
	zts:置颜色(0xFF111111):显示(self.x+25,self.y+100+37,"我的好友("..#self.数据["好友"]..")")
	zts:置颜色(0xFF111111):显示(self.x+25,self.y+120+37+self:取好友行数("临时")*33,"临时好友"..self:取数量("临时"))
	zts:置颜色(0xFF111111):显示(self.x+25,self.y+140+37+self:取好友行数("最近")*33,"最近联系人"..self:取数量("最近"))
	zts:置颜色(0xFF222222):显示(self.x+25,self.y+160+37+self:取好友行数("黑名单")*33,"黑名单"..self:取数量("黑名单"))
	if self.查找开关 then
		self:查找显示(dt,x,y)
	end
	if self.当前类型~="" then
		self:好友显示(x,y)
	end
end

function 场景类_好友列表:好友显示(x,y)

	local 计次=0
	for n=1,self.结束值 do
		if self.数据[self.当前类型][n]~=nil then
			计次=计次+1
			local 初始y=self.y+152+self.初始行数*20+计次*32
			self.名称盒子[计次]:置坐标(self.x+26,初始y-6)
			if self.名称盒子[计次]:检查点(x,y) then --只显示8位好友
				tp.禁止关闭 = true
				self.焦点=true
				box(self.x + 26,初始y-7, self.x + 168,初始y+30-7,-9670988)
				if 引擎.鼠标弹起(左键) then
					tp.窗口.好友消息:打开(self.数据[self.当前类型][n].名称,self.数据[self.当前类型][n].id,self.数据[self.当前类型][n].好友度,self.数据[self.当前类型][n].等级,self.数据[self.当前类型][n].模型,1)
				elseif 引擎.鼠标弹起(右键) then
					tp.窗口.好友查看:打开(self.数据,self.当前类型,n)
				end
			end
			local 好友偏移x,好友偏移y=nil,nil
			if self.头像组[n] then
				if self.头像组[n].宽度 and self.头像组[n].宽度>30 then
				    好友偏移x,好友偏移y=等比例缩放公式(30,30,self.头像组[n].宽度,self.头像组[n].高度)
				end
				self.头像背景:显示(self.x+26,初始y-6)
				self.头像组[n]:显示(self.x+26,初始y-6,好友偏移x,好友偏移y)
				if self.数据[self.当前类型][n].在线 and self.当前类型=="好友" then
					zts:置颜色(0xff009933):显示(self.x+60,初始y,self.数据[self.当前类型][n].名称)
				else
					self.头像组[n]:灰度级()
					zts:置颜色(黑色):显示(self.x+60,初始y,self.数据[self.当前类型][n].名称)
				end
			end



		end
	end
	self.排序行数=计次
end
function 场景类_好友列表:打开消息栏(id) end

function 场景类_好友列表:取数量(类型)
	local 在线=0
	local 总计=#self.数据[类型]
	for n=1,#self.数据[类型] do
		if self.数据[类型][n].在线 then
			在线=在线+1
		end
	end
	return string.format("(%s/%s)",在线,总计)
end

function 场景类_好友列表:打开表头(序列)
	local 类型=""
	-- if 序列==1 then --梦幻精灵
	-- elseif 序列==2 then
	-- 	类型="好友"
	-- elseif 序列==3 then
	-- 	类型="临时"
	-- elseif 序列==4 then
	-- 	类型="最近"
	-- elseif 序列==5 then
	-- 	类型="黑名单"
	-- end
	if 序列==1 then
		类型="好友"
	elseif 序列==2 then
		类型="临时"
	elseif 序列==3 then
		类型="最近"
	elseif 序列==4 then
		类型="黑名单"
	end
	if 类型=="" then

	else
		if 类型==self.当前类型 then
			self.当前类型=""
			self.排序行数=0
		else
			self.结束值=9-序列
			self.初始行数=序列-2
			self.当前类型=类型
		end
	end
end

function 场景类_好友列表:包围一坐标(n)
	if n==1 then
	    return 0
    elseif n==2 then
	    return self:取好友行数("临时")*33+20
    elseif n==3 then
	    return self:取好友行数("最近")*33+40
	end
	return self:取好友行数("黑名单")*33+60
end

function 场景类_好友列表:取好友行数(类型)
	if self.当前类型=="" then
		return self.排序行数
	elseif  类型=="临时" and self.当前类型=="好友" then
		return self.排序行数
	elseif  类型=="最近" and (self.当前类型=="好友" or self.当前类型=="临时" ) then
		return self.排序行数
	elseif  类型=="黑名单" and (self.当前类型=="好友" or self.当前类型=="临时"  or self.当前类型=="最近" ) then
		return self.排序行数
	else
		return 0
	end
end

function 场景类_好友列表:检查点(x,y)
	if self.可视 and (self.资源组[1]:是否选中(x,y) or (self.查找开关 and self.资源组[8]:是否选中(x,y)))  then
		return true
	end
end

function 场景类_好友列表:初始移动(x,y)
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

function 场景类_好友列表:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_好友列表