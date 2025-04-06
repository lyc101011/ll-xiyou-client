-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-17 03:17:08
-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:52
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-17 03:16:35
--======================================================================--
local 勾魂索 = class()
local tp,zts
local mousea = 引擎.鼠标弹起
local insert = table.insert
function 勾魂索:初始化(根)
	self.ID = 124
	self.x = 354
	self.y = 119
	self.xx = 0
	self.yy = 0
	self.注释 = "勾魂索一"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.右键关闭 = 1
	self.可移动 = false
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 资源:载入('wzife.wd3',"网易WDF动画",4254597813),
	}
	self.计时数字={}
	for n=1,10 do
		self.计时数字[n] = 资源:载入('wzife.wd3',"网易WDF动画",1569576563)
		self.计时数字[n].当前帧 = n-1
		self.计时数字[n]:更新纹理()
	end
	self.窗口时间 = 0
	tp = 根

end

function 勾魂索:打开()
	if self.可视 then
		self.sss=100------------决斗开始前等待时间
		self.可视 = false
	else
		insert(tp.窗口_,self)
	    self.sss=100------------决斗开始前等待时间
		self.时间=os.time()
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 勾魂索:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:更新(dt)
	self.资源组[1]:显示(全局游戏宽度/2-10,121)
	self.结果=os.time()-self.时间
    if self.结果>=1 then
    	self.时间=os.time()
    	self.sss=self.sss-1
    end
    local 百位 = 0
    local 十位 = 0
    local 个位 = 0
    if self.sss>=100 then
        百位=math.floor(self.sss/100%10)
        十位=math.floor(self.sss/10%10)
        个位=math.floor(self.sss/1%10)
        self.计时数字[百位+1]:显示(全局游戏宽度/2-56,128)
		self.计时数字[十位+1]:显示(全局游戏宽度/2-26,128)
		self.计时数字[个位+1]:显示(全局游戏宽度/2+4,128)
	elseif self.sss<100 and self.sss>=10 then
		十位=math.floor(self.sss/10%10)
        个位=math.floor(self.sss/1%10)
		self.计时数字[十位+1]:显示(全局游戏宽度/2-35,128)
		self.计时数字[个位+1]:显示(全局游戏宽度/2-5,128)
	elseif self.sss<10 then
        个位=math.floor(self.sss/1%10)
		self.计时数字[个位+1]:显示(全局游戏宽度/2-25,128)
		if self.sss<0 then
			发送数据(6563)
			self:打开()
			return
	    end
    end
    if self.资源组[1]:是否选中(x,y) then
        if mousea(0) then
            if 引擎.场景.窗口.勾魂索二.可视==false then
				引擎.场景.窗口.勾魂索二:打开()
			end
        end
    end

end


function 勾魂索:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 勾魂索:初始移动(x,y)
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

function 勾魂索:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 勾魂索