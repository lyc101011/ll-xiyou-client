-- @Author: baidwwy
-- @Date:   2024-03-03 22:16:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-03-04 17:29:35
local tp,jhzts
local insert = table.insert

local 场景类_剑会寻找对手 = class()
function 场景类_剑会寻找对手:初始化(根)
	self.ID = 192
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "剑会寻找对手"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	jhzts = tp.字体表.普通字体
end

function 场景类_剑会寻找对手:关闭()
	self.资源组=nil
	self.可视 = false
	self.等待=nil
	return
end

function 场景类_剑会寻找对手:打开()
	if self.可视 then
		self:关闭()
		return
	else
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		insert(tp.窗口_,self)
        self.资源组 = {
        	[1] = 自适应.创建(0,1,378,164,3,9),
        	[2] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"离开队列"),
        }
        self.等待={秒=0,time=0}
		self.x = (全局游戏宽度/2)-313
		self.y = (全局游戏高度/2)-160
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_剑会寻找对手:显示(dt,x,y)
	---------------------
	素材位置调整()
	ax=AFCHX
	ay=AFCHY
	-- self.资源组[1] = tp._自适应.创建(0,1,ax,ay,3,9)
	---------------------
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	if os.time() - self.等待.time > 0 then
		self.等待.time = os.time()
		self.等待.秒 = self.等待.秒 + 1
	end
	jhzts:置颜色(白色):显示(self.x+164,self.y+3,"寻找对手")
	jhzts:显示(self.x+18,self.y+38,"系统正在帮你寻找合适的对手，你已经在队列中等待了")
	jhzts:置颜色(黄色):显示(self.x+156,self.y+86,os.date("%M:%S",self.等待.秒))
	self.资源组[2]:更新(x,y)
	self.资源组[2]:显示(self.x+287,self.y+133)
	if self.资源组[2]:事件判断() then
		发送数据(400,{操作="离开队列"})
	end
end

function 场景类_剑会寻找对手:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 场景类_剑会寻找对手:初始移动(x,y)
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

function 场景类_剑会寻找对手:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_剑会寻找对手