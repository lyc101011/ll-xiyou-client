--======================================================================--
local 存钱 = class()
local tp,zts
local mousea = 引擎.鼠标弹起
local insert = table.insert
local qjq = 引擎.取摊位金钱颜色
function 存钱:初始化(根)
	self.ID = 145
	self.x = 340
	self.y = 216
	self.xx = 0
	self.yy = 0
	self.注释 = "存钱"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	-- self.资源组[4]:置偏移(-1,0)
	self.窗口时间 = 0
	self.项目={"现    金","存    款","存入金额","取出金额"}
	tp = 根
	zts = tp.字体表.华康14
end

function 存钱:打开(选中)
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		if self.资源组==nil then
			self:加载资源()
		end
		self.控件类 = require("ggeui/加载类")()
		local 总控件 = self.控件类:创建控件('cq')
		总控件:置可视(true,true)
		self.输入={}
		for i=1,2 do
			self.输入[i] = 总控件:创建输入("存取银子",0,0,140,14,tp,tp.字体表.华康14)
			self.输入[i]:置可视(true,true)
			self.输入[i]:置限制字数(11)
			self.输入[i]:置数字模式()
			self.输入[i]:屏蔽快捷键(true)
			self.输入[i]:置光标颜色(-16777216)
			self.输入[i]:置文字颜色(-16777216)
		end
		for i=2,5 do
			self.资源组[i]:绑定窗口_(self.ID)
			if i~=2 then
			    self.资源组[i]:置偏移(10,0)
			end
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 存钱:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,275,286,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"存 入"),
		[4] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"取 出"),
		[5] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"取 消"),
		[6] = 自适应.创建(7,1,160,22,1,3,nil,18),
	}
end
function 存钱:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"银两存取业务")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	zts:置颜色(白色)
	for i=1,4 do
		zts:显示(self.x+24,self.y+46+(i-1)*43,self.项目[i])
		self.资源组[6]:显示(self.x+89,self.y+42+(i-1)*43)
	end
   	zts:置颜色(qjq(tp.金钱)):显示(self.x + 100,self.y+46+(1-1)*43,tp.金钱)
   	zts:置颜色(qjq(tp.存银)):显示(self.x + 100,self.y+46+(2-1)*43,tp.存银)
   	zts:置颜色(白色):显示(self.x+28,self.y+251,"钱庄取款需执行全面解锁操作。")
   	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)
	--
	self.输入[1]:置坐标(self.x+100,self.y+46+(3-1)*43)
	if self.输入[1]._已碰撞 then
		self.焦点 = true
	end
	--
	self.输入[2]:置坐标(self.x+100,self.y+46+(4-1)*43)
	if self.输入[2]._已碰撞 then
		self.焦点 = true
	end
	for i=3,5 do
		self.资源组[i]:更新(x,y)
		self.资源组[i]:显示(self.x+24+(i-3)*78,self.y+213)
	end
	if self.资源组[3]:事件判断() then
		发送数据(48,{类型="存钱",JQ=self.输入[1]:取文本()})
		self:打开()
		return
	elseif self.资源组[4]:事件判断() then
		发送数据(49,{类型="取钱",JQ=self.输入[2]:取文本()})
		self:打开()
		return
	elseif self.资源组[2]:事件判断() or self.资源组[5]:事件判断() then
		self:打开()
		return
	end
end


function 存钱:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 存钱:初始移动(x,y)
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

function 存钱:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 存钱