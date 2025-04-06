-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:34
local 场景类_任务追踪栏 = class()

local floor = math.floor
local format = string.format
local insert = table.insert
local remove = table.remove
local tp
local xxx = 0
local yyy = 0
local box = 引擎.画矩形
local min = math.min
local max = math.max
local ceil = math.ceil
local mousea = 引擎.鼠标按下
local mouseb = 引擎.鼠标弹起

function 场景类_任务追踪栏:初始化(根)
	self.x = 全局游戏宽度-200
	self.y = 119
	self.xx = 0
	self.yy = 0
	self.焦点 = false
	self.移动窗口 = false
	self.可移动窗口 = false
	local 资源 = 根.资源
	local 按钮 = require("script/系统类/按钮")
	tp = 根
	self.资源组 = {
		[1] = 根._自适应.创建(71,1,165,23,3,9),--资源:载入('org.rpk',"网易WDF动画",16777748),
		[2] = 按钮(资源:载入('common/wzife.wdf',"网易WDF动画",0xD465F50F),0,0,4),
		[3] = 按钮(资源:载入('common/wzife.wdf',"网易WDF动画",0x44F2D2D3),0,0,4),
		[4] = 按钮(资源:载入('org3.rpk',"网易WDF动画",0x1000066),0,0,4),
		[5] = 按钮(资源:载入('common/wzife.wdf',"网易WDF动画",0x335CECBC),0,0,4),
		[6] = tp._滑块(资源:载入('common/wzife.wdf',"网易WDF动画",0x7F027E7B),4,10,139,2),
		[7] = 按钮(资源:载入('common/wzife.wdf',"网易WDF动画",0xB7F2FF5E),0,0,4),
		[8] = 按钮(资源:载入('common/wzife.wdf',"网易WDF动画",0x36DDB607),0,0,4),
		[9] = 根._自适应.创建(71,1,160,170,3,9), --91
		[10] = 按钮(资源:载入('org3.rpk',"网易WDF动画",0x1000067),0,0,4),
		[11] = 按钮(资源:载入('org3.rpk',"网易WDF动画",0x1000065),0,0,4),
		[12] = 按钮(资源:载入('org3.rpk',"网易WDF动画",0x1000068),0,0,4),
	}
	-- self.战斗图标=资源:载入('pic/zd.png',"图片")
	-- self.资源组[9]:置宽高(160,170)
	self.状态 = 2
	self.介绍加入 = 0
	self.窗口时间 = 0
	self.介绍文本 = 根._丰富文本(153,170,nil,0,10)
	self.数据记录={}
	-- self.wz文字 = require("gge文字类").创建(wdf配置.."/font/hyh1gjm.ttf",21,false,true,false)
	self.背景表={}
end

-- function 场景类_任务追踪栏:修改内容(名称,内容,描述,取中间数据_)
-- 	for i=1,#self.数据记录 do
-- 		if self.数据记录[i].名称 == 名称 then
-- 			self.数据记录[i].介绍 = 内容
-- 			self.数据记录[i].描述 = 描述
-- 			self:刷新当前()
-- 			break
-- 		end
-- 	end
-- end

function 场景类_任务追踪栏:删除(名称)
	for i=1,#self.数据记录 do
		if self.数据记录[i].名称 == 名称 then
			remove(self.数据记录,i)
			self:刷新当前()
			break
		end
	end
end


function 场景类_任务追踪栏:刷新当前()
	self.介绍文本:清空()
	-- local num = #self.数据记录
	for i=1,#self.数据记录 do
		if self.数据记录[i].名称=="摄妖香" and self.数据记录[i].取中间数据~=nil then
			引擎.场景.窗口.人物框:加入小图标信息("摄妖香","绿色","摄妖香剩余:","分",self.数据记录[i].取中间数据,"摄妖香")
			-- 摄妖香=true
			remove(self.数据记录,i)
		elseif self.数据记录[i].名称=="罗羹效果"  then
			if self.数据记录[i].取中间数据[1] ~= nil and self.数据记录[i].取中间数据[1] >0 then
				引擎.场景.窗口.人物框:加入小图标信息("红罗羹","橙色","储备气血剩余:",nil,self.数据记录[i].取中间数据[1],"丹药黄")
				-- 红罗羹=true
			end
			if self.数据记录[i].取中间数据[3] ~= nil and self.数据记录[i].取中间数据[3] >0 then
				引擎.场景.窗口.人物框:加入小图标信息("绿芦羹","橙色","储备魔法剩余:",nil,self.数据记录[i].取中间数据[3],"丹药蓝")
				-- 绿芦羹=true
			end
			remove(self.数据记录,i)
		elseif self.数据记录[i].名称=="变身卡"  then
			引擎.场景.窗口.人物框:加入小图标信息("变身卡","绿色","变身卡剩余:","分",self.数据记录[i].取中间数据,"变身卡")
			-- 变身卡=true
			remove(self.数据记录,i)
		end
	end
	for i=1,#self.数据记录 do
		-- self.介绍文本:添加文本(format("#G/%s\n◆%s",self.数据记录[i].名称,self.数据记录[i].介绍))
		self.介绍文本:添加文本(format("#G/%s\n%s",self.数据记录[i].名称,self.数据记录[i].介绍))
		if i < #self.数据记录 then
			self.介绍文本:添加文本("")
		end
	end
	self:背景计算()
end

function 场景类_任务追踪栏:刷新(名称,介绍,描述,取中间数据_)
	self.数据记录[#self.数据记录+1]={名称=名称,介绍=介绍,描述=描述_,取中间数据=取中间数据_}
	self.介绍文本:清空()

	for i=1,#self.数据记录 do
		if self.数据记录[i].名称=="摄妖香" and self.数据记录[i].取中间数据~=nil then
			引擎.场景.窗口.人物框:加入小图标信息("摄妖香","绿色","摄妖香剩余:","分",self.数据记录[i].取中间数据,"摄妖香")
			-- 摄妖香=true
			remove(self.数据记录,i)
		elseif self.数据记录[i].名称=="罗羹效果"  then
			if self.数据记录[i].取中间数据[1] ~= nil and self.数据记录[i].取中间数据[1] >0 then
				引擎.场景.窗口.人物框:加入小图标信息("红罗羹","橙色","储备气血剩余:",nil,self.数据记录[i].取中间数据[1],"丹药黄")
				-- 红罗羹=true
			end
			if self.数据记录[i].取中间数据[3] ~= nil and self.数据记录[i].取中间数据[3] >0 then
				引擎.场景.窗口.人物框:加入小图标信息("绿芦羹","橙色","储备魔法剩余:",nil,self.数据记录[i].取中间数据[3],"丹药蓝")
				-- 绿芦羹=true
			end
			remove(self.数据记录,i)
		elseif self.数据记录[i].名称=="变身卡"  then
			引擎.场景.窗口.人物框:加入小图标信息("变身卡","绿色","变身卡剩余:","分",self.数据记录[i].取中间数据,"变身卡")
			-- 变身卡=true
			remove(self.数据记录,i)
		end
	end

	for i=1,#self.数据记录 do
		-- self.介绍文本:添加文本(format("#G/%s\n◆%s",self.数据记录[i].名称,self.数据记录[i].介绍))
		self.介绍文本:添加文本(format("#G/%s\n%s",self.数据记录[i].名称,self.数据记录[i].介绍))
		if i < #self.数据记录 then
			self.介绍文本:添加文本("")
		end
	end

	-- for i=1,#self.介绍文本.显示表 - 10 do
	-- 	self.介绍文本:滚动(1)
	-- end
	-- if #self.介绍文本.显示表 > 10 and self.介绍加入 ~= 0 then
	-- 	self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入+1,10,#self.介绍文本.显示表))
	-- 	self.介绍加入 = min(ceil((#self.介绍文本.显示表-10)*self.资源组[6]:取百分比()),#self.介绍文本.显示表-10)
	-- 	self.介绍文本.加入 = self.介绍加入
	-- end
	self:背景计算()
end

function 场景类_任务追踪栏:背景计算()
	self.背景表={}
	local 临时行数 = 0
	local 临时行数1 = 0
	for i=1,#self.介绍文本.显示表 do
		临时行数 = 临时行数 + self.介绍文本.显示表[i].高度
		临时行数1 = 临时行数1 + self.介绍文本.显示表[i].高度
		if self.介绍文本.显示表[i][1].内容 == "" then
			self.背景表[#self.背景表+1] = {}
			self.背景表[#self.背景表][1]= 临时行数
			self.背景表[#self.背景表][2]= 临时行数1-2
			临时行数1 = 0
		end
		if i == #self.介绍文本.显示表 then
			self.背景表[#self.背景表+1] = {}
			self.背景表[#self.背景表][1]= 临时行数+1
			self.背景表[#self.背景表][2]= 临时行数1+8
			临时行数1 = 0
		end
	end
end

function 场景类_任务追踪栏:显示(dt,x,y)
	if not tp.剧情开关.任务追踪 then
		self.x = 全局游戏宽度-162
		self.焦点 = false
		self.资源组[4]:更新(x,y)
		self.资源组[4]:显示(self.x+146,self.y-1)
		if self.资源组[4]:事件判断(x,y) then
			self.资源组[4]:置翻转()
			tp.剧情开关.任务追踪 = true
		end
		return
	end
	self.x = 全局游戏宽度-162
	self.焦点 = false
	self.资源组[self.状态]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[12]:更新(x,y)
	self.介绍文本:更新(x,y)
	if self.资源组[4]:事件判断(x,y) then
		tp.剧情开关.任务追踪 = false
		self.资源组[4]:置翻转(true)
	end
	self.资源组[1]:显示(self.x-3,self.y-5)
	for i=1,#self.背景表 do
		local pyzb = 0
		if i ~= 1 then
			pyzb = self.背景表[i-1][1]+(i-1)*6.5 --决定显示高度
		end
		self.资源组[9]:置宽高(160,self.背景表[i][2]+6.5)
		self.资源组[9]:显示(self.x,self.y+20+pyzb)
	end


	引擎.场景.字体表.标题字体:显示(self.x+88,self.y,"任务追踪")
	-- self.wz文字:置字间距(1)
	-- self.wz文字:置颜色(0xFFFFFFFF)
	-- self.wz文字:显示(self.x+5,self.y+5-5,"任务追踪")
	self.介绍文本:置高度(self.介绍文本.行数量*16)
	self.资源组[4]:显示(self.x+146,self.y-1)
	self.资源组[10]:显示(self.x+7,self.y-4)
	self.资源组[11]:显示(self.x+32,self.y-3)
	self.资源组[12]:显示(self.x+122,self.y-1)
	-- self.战斗图标:显示(self.x+122-3,self.y-1+19)
	-- if #self.介绍文本.显示表 > 10 then
	-- 	self.资源组[5]:更新(x,y,self.介绍加入 > 0)
	-- 	self.资源组[7]:更新(x,y,self.介绍加入 < #self.介绍文本.显示表 - 10)
	-- 	if self.资源组[5]:事件判断()  then
	-- 		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入-1,10,#self.介绍文本.显示表))
	-- 	elseif self.资源组[7]:事件判断() then
	-- 		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入+1,10,#self.介绍文本.显示表))
	-- 	elseif self.资源组[9]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.介绍加入 > 0 then
	-- 		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入-1,10,#self.介绍文本.显示表))
	-- 	elseif self.资源组[9]:是否选中(x,y) and 引擎.取鼠标滚轮() ==-1 and self.介绍加入 < #self.介绍文本.显示表 - 10 then
	-- 		self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.介绍加入+1,10,#self.介绍文本.显示表))
	-- 	end
	-- 	self.资源组[5]:显示(self.x+148,self.y+31)
	-- 	box(self.x+148,self.y+44,self.x+158,self.y+183,ARGB(160,30,30,30))
	-- 	self.资源组[6]:显示(self.x+148,self.y+44,x,y,true)
	-- 	self.资源组[7]:显示(self.x+148,self.y+183)
	-- 	self.介绍加入 = min(ceil((#self.介绍文本.显示表-10)*self.资源组[6]:取百分比()),#self.介绍文本.显示表-10)
	-- 	self.介绍文本.加入 = self.介绍加入
	-- end
 --    local num = #self.背景表
	-- if num<=2 then
	--     num=2
	-- end
	self.介绍文本:显示(self.x+3,self.y+25,4294967295)
	if tp.按钮焦点 then
		self.焦点 = true
	end
	-- if self.可移动窗口 and self:检查点(x,y) then
	-- 	if mousea(0) then
	-- 		self:初始移动(x,y)
	-- 	end
	-- 	if self.移动窗口 and not tp.隐藏UI and not tp.消息栏焦点 then
	-- 		self:开始移动(x,y)
	-- 	end
	-- end
	-- if self.移动窗口 and (mouseb(0) or tp.隐藏UI or tp.消息栏焦点) then
	-- 	self.移动窗口 = false
	-- end
end

function 场景类_任务追踪栏:检查点(x,y)
	if not tp.战斗中 and tp.剧情开关.任务追踪 and ((self.可移动窗口 and self.资源组[1]:是否选中(x,y) ) or self.焦点) or self.资源组[6]:是否选中(x,y)  then--or self.资源组[9]:是否选中(x,y)
		return true
	end
end

function 场景类_任务追踪栏:初始移动(x,y)
	if tp.消息栏焦点 then
		return
	end
	if not self.焦点 then
		self.移动窗口 = true
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_任务追踪栏:开始移动(x,y)
	self.x = x - self.xx
	self.y = y - self.yy
end

return 场景类_任务追踪栏