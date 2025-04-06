-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:34
local 场景类_创建帮派 = class()
local tp,zts,zts1,rwa,zts2,zts3
local mousea = 引擎.鼠标弹起
local insert = table.insert
function 场景类_创建帮派:初始化(根)
	self.ID = 8
	self.x = 435
	self.y = 178
	self.xx = 0
	self.yy = 0
	self.注释 = "创建帮派"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
      self.本类开关=false
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,308,220,3,9),
		[5] = 自适应.创建(4,1,278,126,3,9),
		[3] = 按钮(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  创建"),
		[4] = 按钮(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  取消"),
		[7] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),		--关闭按钮
        [8] = 自适应.创建(3,1,224,19,1,3),
	}
	for i=3,4 do
        self.资源组[i]:绑定窗口_(8)
    end
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	-- zts1 = tp.字体表.普通字体__
	-- zts2 = tp.字体表.描边字体
	-- zts3 = tp.字体表.普通字体__


	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('创建帮派')
	总控件:置可视(true,true)
	self.帮派名称 = 总控件:创建输入("输入",0,0,400,15,根,根.字体表.华康14)
	self.帮派名称:置可视(false,false)
	self.帮派名称:置限制字数(12)
	self.帮派名称:置光标颜色(-16777216)
	self.帮派名称:置文字颜色(-16777216)
	self.帮派宗旨1 = 总控件:创建输入("输入",0,0,400,20,根,根.字体表.华康14)
	self.帮派宗旨1:置可视(false,false)
	self.帮派宗旨1:置限制字数(100)
	self.帮派宗旨1:置光标颜色(-16777216)
	self.帮派宗旨1:置文字颜色(-16777216)

	self.帮派宗旨2 = 总控件:创建输入("输入",0,0,400,20,根,根.字体表.华康14)
	self.帮派宗旨2:置可视(false,false)
	self.帮派宗旨2:置限制字数(80)
	self.帮派宗旨2:置光标颜色(-16777216)
	self.帮派宗旨2:置文字颜色(-16777216)


	-- self.帮派宗旨1:置自动换行(1)

end

function 场景类_创建帮派:打开() -- 服饰染色 召唤兽染色
	if self.可视 then
		self.帮派名称:置可视(false,false)
		self.帮派宗旨1:置可视(false,false)
		self.可视 = false
	else
		insert(tp.窗口_,self)
	    self.帮派名称:置可视(true,true)
	    self.帮派名称:置文本("")
	    -- self.帮派宗旨1:置可视(true,true)
	    self.帮派宗旨1:置文本("")
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true

	end
end
function 场景类_创建帮派:显示(dt,x,y)
	self.焦点 = false
	self.帮派名称:置可视(true,true)
	self.帮派宗旨1:置可视(true,true)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.控件类:更新(dt,x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"创建帮派")
	self.资源组[7]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[8]:显示(self.x+60,self.y+26)
	zts:置颜色(白色)
	zts:显示(self.x + 18,self.y + 30,"名称")
	self.资源组[5]:显示(self.x+15,self.y+56)
	self.资源组[3]:显示(self.x+69,self.y+190)
	self.资源组[4]:显示(self.x+173,self.y+190)
		 -- zts:置颜色(-16777216)
		 -- zts:显示(self.x + 100,self.y + 47,tp.金钱)
		 -- zts:显示(self.x + 100,self.y + 77,tp.存银)
	self.控件类:显示(x,y)
	self.帮派名称:置坐标(self.x+70,self.y+29)
	self.帮派宗旨1:置坐标(self.x+26,self.y+86)
	if #self.帮派宗旨1._内容==18 then
		self.帮派宗旨1._按下位置=20
		-- self.帮派宗旨2:置可视(true,true)
	 --    self.帮派宗旨2:置坐标(self.x+26,self.y+86+30)
	end
	-- self.丰富文本:添加文本(self.帮派宗旨1:取文本())
	-- self.丰富文本:显示(self.x+23,self.y+90)
	if self.资源组[7]:事件判断() then
		self:打开()
	end

	if self.资源组[3]:事件判断() then
		if self.帮派名称:取文本()=="" or self.帮派宗旨1:取文本()=="" then
			tp.常规提示:打开("#Y/帮派名称和帮派宗旨1不能为空")
			return 0
		elseif #self.帮派名称:取文本() <6  and #self.帮派名称:取文本()>14 then
			tp.常规提示:打开("#Y/帮派名称至少需要3个文字或者6个字符，最多7个文字14个字符")
			return 0
		elseif #self.帮派宗旨1:取文本() <10 then
			tp.常规提示:打开("#Y/帮派宗旨至少需要10个文字或者20个字符，最多20个文字40个字符")
			return 0
		else
			发送数据(35,{名称=self.帮派名称:取文本(),公告=self.帮派宗旨1:取文本()})--,称谓="帮主"
			self:打开()
		end
	elseif self.资源组[4]:事件判断() then
		self.帮派名称:置文本("")
	    self.帮派宗旨1:置文本("")
		self:打开()
	end
	if self.帮派名称._已碰撞 then
		self.焦点 = true
	end
end

function 场景类_创建帮派:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_创建帮派:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_创建帮派:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_创建帮派