-- @Author: baidwwy
-- @Date:   2024-09-11 20:07:40
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 16:33:41
-- @Author: baidwwy
-- @Date:   2024-03-06 10:54:35
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-03-07 17:18:12
-- @Author: baidwwy
-- @Date:   2024-03-03 22:16:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-03-06 17:38:15
local qmx = 引擎.取模型
local tp,jhzts
local insert = table.insert
local tx = 引擎.取头像

local 场景类_剑会战斗准备 = class()
function 场景类_剑会战斗准备:初始化(根)
	self.ID = 193
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "剑会战斗准备"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	jhzts = tp.字体表.普通字体
end

function 场景类_剑会战斗准备:关闭()
	self.资源组=nil
	self.按钮组=nil
	self.可视 = false
	self.数据=nil
	self.队伍数据=nil
	self.队伍格子=nil
	self.倒计时=nil
	self.记录time=nil
	return
end

function 场景类_剑会战斗准备:打开(内容) --此页为：进入房间需要输入的密码
	if self.可视 then
		self:关闭()
		return
	else
		self.数据=内容
		insert(tp.窗口_,self)
        self:加载资源()
		self.x = (全局游戏宽度/2)-313
		self.y = (全局游戏高度/2)-160
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_剑会战斗准备:加载资源()
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local 资源 = tp.资源
	self.资源组 = {
        	[1] = 自适应.创建(0,1,617,311,3,9),
        	[2] = 自适应.创建(2,1,116,141,3,9), --队员白底
        	[3] = 自适应.创建(3,1,117,19,1,3), --人物信息底
        }
    self.按钮组 = {
    	    [1] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"阵型"),
        	[2] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"对方阵容"),
        	[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"升为队长"),
        	[4] = 按钮.创建(自适应.创建(12,4,99,22,1,3),0,0,4,true,true,"战斗物品设置"),
        	[5] = 按钮.创建(自适应.创建(12,4,99,22,1,3),0,0,4,true,true,"变身效果设置"),
        	[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"准备确认"),
        }
    self.队伍格子={}
    local 格子 = require("script/系统类/队伍_格子_剑会") --麻瓜剑会 要复制这个lua
    if self.数据[1]==nil then
    	self.队伍数据 = tp.队伍数据
    else
    	self.队伍数据=self.数据
        self.按钮组[2].按钮文字="己方阵容"
    end
    for i=1,5 do
		self.队伍格子[i] = 格子.创建(0,0,i,根)
		self.队伍格子[i]:置人物(self.队伍数据[i])
	end
	self.倒计时=tp.剑会战斗准备 - os.time()
	self.记录time=os.time()
end

function 场景类_剑会战斗准备:刷新(内容)
	self.数据={}
	self.数据=内容
	self.队伍数据={}
	if self.数据[1]==nil then
    	self.队伍数据 = tp.队伍数据
    	self.按钮组[2].按钮文字 = "对方阵容"
    else
    	self.队伍数据=self.数据
    	self.按钮组[2].按钮文字 = "己方阵容"
    end
    for i=1,5 do
        self.队伍格子[i]:置人物(self.队伍数据[i])
	end
end

function 场景类_剑会战斗准备:刷新2(内容)
	self.按钮组[6].按钮文字 = 内容
end

function 场景类_剑会战斗准备:显示(dt,x,y)
	---------------------
	-- 素材位置调整()
	-- ax=AFCHX
	-- ay=AFCHY
	-- self.资源组[1] = tp._自适应.创建(0,1,ax,ay,3,9)
	-- self.按钮组[4] = tp._按钮.创建(tp._自适应.创建(12,4,ax,22,1,3),0,0,4,true,true,"战斗物品设置")
	---------------------
	self.焦点 = false
	if os.time() - self.记录time > 0 then
		self.记录time = os.time()
		self.倒计时 = self.倒计时 - 1
	end
	self.资源组[1]:显示(self.x,self.y)
	for n=1,6 do
		self.按钮组[n]:更新(x,y)
	end
	self.按钮组[1]:显示(self.x+15,self.y+28)
	self.按钮组[2]:显示(self.x+458,self.y+28)
	self.按钮组[3]:显示(self.x+534,self.y+28)
	self.按钮组[4]:显示(self.x+15,self.y+280)
	self.按钮组[5]:显示(self.x+118,self.y+280)
	self.按钮组[6]:显示(self.x+405,self.y+280)
	jhzts:置颜色(黄色):显示(self.x+267,self.y+3,"战斗准备界面")
	jhzts:显示(self.x+500,self.y+283,self.倒计时 .."秒后战斗开始")
	jhzts:置颜色(白色):显示(self.x+78,self.y+32,tp.队伍数据.阵型)
	for i=0,4 do
		local jx = 11+i*120
		self.资源组[2]:显示(self.x+jx,self.y+58)
		for n=0,2 do
			self.资源组[3]:显示(self.x+jx,self.y+n*24+206)
		end
        i = i + 1
		self.队伍格子[i]:置坐标(self.x + jx,self.y + 58)
		self.队伍格子[i]:显示(dt,x,y+20,self.鼠标,self.队伍数据)
	end
	if self.按钮组[1]:事件判断() then
		发送数据(4008)
	elseif self.按钮组[2]:事件判断() then
		发送数据(400,{操作=self.按钮组[2].按钮文字})
	elseif self.按钮组[4]:事件判断() then
		发送数据(400,{操作="战斗物品设置"})
	elseif self.按钮组[5]:事件判断() then
		发送数据(400,{操作="变身效果设置"})
	elseif self.按钮组[6]:事件判断() then
		发送数据(400,{操作="最后准备",按钮文字=self.按钮组[6].按钮文字})
	end
end

function 场景类_剑会战斗准备:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 场景类_剑会战斗准备:初始移动(x,y)
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

function 场景类_剑会战斗准备:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_剑会战斗准备