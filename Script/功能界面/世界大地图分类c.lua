local 场景类_世界大地图分类c = class()
local tp
local insert = table.insert
function 场景类_世界大地图分类c:初始化(根)
	self.ID = 67
	self.x = 137
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "世界大地图分类c"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应= 根._自适应
	self.资源组 = {
	    [1] = 自适应.创建(0,1,670,510,3,9),--黑色条纹背景
		[2] = 资源:载入('wzife.wd1',"网易WDF动画",0x26E89B1F),
		[3] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭按钮
		[4] = 按钮.创建(资源:载入('wzife.wd1',"网易WDF动画",0x6B27F57F),0,0,1,true,true),--花果山
		[5] = 按钮.创建(资源:载入('wzife.wd1',"网易WDF动画",0x6BF13E64),0,0,1,true,true),--女儿村
		[6] = 按钮.创建(资源:载入('wzife.wd1',"网易WDF动画",0xCCB7A7C3),0,0,1,true,true),--傲来国
		[7] = 按钮.创建(资源:载入('wzife.wd1',"网易WDF动画",0xA9BC7D93),0,0,1,true,true),--蓬莱仙岛
	}
	for i=3,7 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	tp = 根
	self.窗口时间 = 0
	self.坐标 = {[1]={x=70,y=140},[2]={x=195,y=140},[3]={x=320,y=140},[4]={x=70,y=290},[5]={x=195,y=290},[6]={x=320,y=290}}
end

function 场景类_世界大地图分类c:打开(道具名称)
	if self.可视 then
		self.可视 = false
		return
	else
		self.道具名称 = 道具名称--超级合成旗
		insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_世界大地图分类c:显示(dt,x,y)
	for i=3,7 do
	   self.资源组[i]:更新(x,y)
		if self.资源组[i]:是否选中(x,y) then
			self.资源组[i]:置高亮()
		else
			self.资源组[i]:取消高亮()
		end
	end
	self.焦点 = false
	if self.鼠标 then
		if self.资源组[3]:事件判断() then--关闭按钮
			self:打开()
		    return
		elseif self.资源组[4]:事件判断() then--花果山
			self:打开()
			tp.窗口.世界地图分类小地图:打开(1514,self.道具名称)
			return
		elseif self.资源组[5]:事件判断() then--女儿村
			self:打开()
			tp.窗口.世界地图分类小地图:打开(1142,self.道具名称)
			return
		elseif self.资源组[6]:事件判断() then--傲来国
			self:打开()
			tp.窗口.世界地图分类小地图:打开(1092,self.道具名称)
			return
		elseif self.资源组[7]:事件判断() then--蓬莱仙岛
			self:打开()
			tp.窗口.世界地图分类小地图:打开(1207,self.道具名称)
			return
		end
	end

	self.资源组[1]:显示(self.x-15,self.y-15)
	self.资源组[2]:显示(self.x,self.y)
	self.资源组[3]:显示(self.x+635,self.y-10)
	self.资源组[4]:显示(self.x + 263,self.y + 10,true)--花果山
	self.资源组[5]:显示(self.x + 211,self.y + 160,true)--女儿村
	self.资源组[6]:显示(self.x + 344,self.y + 272,true)--傲来国
	self.资源组[7]:显示(self.x + 149,self.y + 312,true)--蓬莱仙岛

end

function 场景类_世界大地图分类c:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_世界大地图分类c:初始移动(x,y)
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

function 场景类_世界大地图分类c:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_世界大地图分类c