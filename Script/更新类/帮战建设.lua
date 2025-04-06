local tp,zts,zts1,zts2
local insert = table.insert
local 帮战建设 = class()

function 帮战建设:初始化(根)
	self.ID = 149
	self.x = 全局游戏宽度/2-140
	self.y = 62
	self.xx = 0
	self.yy = 0
	self.注释 = "帮战建设"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.华康15粗
	zts1 = tp.字体表.猫猫字体2
end

function 帮战建设:加载资源()
	local 资源 = tp.资源
	-- local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
	    [0] = 自适应.创建(71,1,275,126,3,9),
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",2826591150), --左蓝
		[2] = 资源:载入('wzife.wdf',"网易WDF动画",3176627420),  --右红
		[3] = 资源:载入('wzife.wdf',"网易WDF动画",1714563470), --报
		[4] = 资源:载入('wzife.wdf',"网易WDF动画",1659194143),  --蓝线
        [5] = 资源:载入('wzife.wdf',"网易WDF动画",591158514),  --黄竖线 995421108
	}
end

function 帮战建设:打开(内容)
	if self.可视 then
		self.可视 = false
		self.蓝方=nil
		self.红方=nil
		return
	else
		insert(tp.窗口_,self)
		if self.资源组==nil then
		    self:加载资源()
		end
		self.类型=内容.类型
		self.蓝方=内容.蓝方
		self.红方=内容.红方
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 帮战建设:显示(dt,x,y)
	self.焦点= false
	self.资源组[5]:显示(self.x+146,self.y+42)
	self.资源组[0]:显示(self.x+20,self.y+19)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+160,self.y)
	self.资源组[3]:显示(self.x+129,self.y)
	self.资源组[4]:显示(self.x+22,self.y+141)
	self.资源组[4]:显示(self.x+192,self.y+141)
	zts:置颜色(白色)
	zts:置样式(1)
	zts:显示(self.x+44+33,self.y+44,self.蓝方.帮派名称)
	zts:显示(self.x+210+33,self.y+44,self.红方.帮派名称)
	zts:置样式(0)
	if self.类型=="砍树" then
	    zts1:显示(self.x+63,self.y+71,"完成度："..self.蓝方.完成度)
		zts1:显示(self.x+206,self.y+71,"完成度："..self.红方.完成度)
	else
		zts1:显示(self.x+49,self.y+71,"夺旗数量："..self.蓝方.完成度)
		zts1:显示(self.x+192,self.y+71,"夺旗数量："..self.红方.完成度)
	end
	zts1:显示(self.x+49,self.y+91,"参战人数："..self.蓝方.参战)
	zts1:显示(self.x+49,self.y+111,"击败人数："..self.蓝方.击败)
	zts1:显示(self.x+192,self.y+91,"参战人数："..self.红方.参战)
	zts1:显示(self.x+192,self.y+111,"击败人数："..self.红方.击败)
end


function 帮战建设:检查点(x,y)
	if self.可视 and self.资源组[0]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 帮战建设:初始移动(x,y)
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

function 帮战建设:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 帮战建设