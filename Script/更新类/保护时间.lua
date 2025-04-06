local tp,zts,zts1,zts2
local insert = table.insert
local 保护时间 = class()

function 保护时间:初始化(根)
	self.ID = 150
	self.x = 15
	self.y = 180
	self.xx = 0
	self.yy = 0
	self.注释 = "保护时间"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.右键关闭=1
	tp = 根
	self.窗口时间 = 0
	zts1 = tp.字体表.普通字体
end

function 保护时间:加载资源()
	local 资源 = tp.资源
	self.资源组 = {
		[1] = 资源:载入('wzife.wd2',"网易WDF动画",1952457286), --左蓝
		[2] = 资源:载入('wzife.wd2',"网易WDF动画",3545025022),  --右红
	}
end

function 保护时间:打开(内容)
	if self.可视 then
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
		if self.资源组==nil then
		    self:加载资源()
		end
		self.shij = 160--时间 --55s
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 保护时间:显示(dt,x,y)
	self.焦点= false
	self.资源组[1]:显示(self.x,self.y)
	self.shij=self.shij-0.06
    local jd = self.shij
    self.资源组[2]:置区域(0,0,jd,17.5)
	self.资源组[2]:显示(self.x+4,self.y+5)
	zts1:置颜色(白色):显示(self.x+54,self.y+6,"保护时间")
	if jd<=0 then
	    self:打开()
	    return
	end
end


function 保护时间:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 保护时间:初始移动(x,y)
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

function 保护时间:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 保护时间