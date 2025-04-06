-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-12 20:08:24
--======================================================================--
local 潜能果 = class()
local mousea = 引擎.鼠标弹起
local tp,zts5,zts
local insert = table.insert
function 潜能果:初始化(根)
	self.ID = 140
	self.x = 310
	self.y = 60
	self.xx = 0
	self.yy = 0
	self.注释 = "潜能果"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = 0
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	zts5 = tp.字体表.普通字体
end

function 潜能果:打开(内容)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		self.可用经验 = nil
		self.已食用潜能果 = nil
		self.剩余潜能果 = nil
		self.下个经验 = nil
		self.伙伴id=nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,443,290,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
			[4] = 自适应.创建(78,1,415,110,3,9),
			[5] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"食用潜能果"),
			[6] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消 "),
		}
		self.资源组[5]:置偏移(5,0)
		for i=2,6 do
			if i~=3 and i~=4 then
			    self.资源组[i]:绑定窗口_(self.ID)
			end
		end
		self.伙伴id=内容.伙伴id
		self.可用经验 = 内容.可用经验
		self.已食用潜能果 = 内容.已食用潜能果
		self.剩余潜能果 = 内容.剩余潜能果
		self.下个经验 = 内容.下个经验
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 潜能果:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)

	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)

	if self.伙伴id then
		引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"伙伴潜能果")
	else
		引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"潜能果")
	end
	-- 引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"潜能果")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	self.资源组[4]:显示(self.x+14,self.y+61-30)
	zts5:置颜色(黑色):显示(self.x+246-208,self.y+389-340,"潜能果是一种能把经验转化为潜力的果子。\n90级＞人物等级≥60级，可食用50个；\n渡劫155级＞人物等级≥90级，可食用100个；\n渡劫170级＞人物等级≥155级，可食用150个；\n人物等级≥渡劫170级，可食用200个。")
	zts:置颜色(白色):显示(self.x+246-208,self.y+389-345+165-55,"当前已食用潜能果：")
	zts:置颜色(白色):显示(self.x+246-208+230,self.y+389-345+165-55,"还能再食用：")
	zts:置颜色(白色):显示(self.x+246-208,self.y+389-345+165+33-55,"当前可用经验点数：")
	zts:置颜色(白色):显示(self.x+246-208,self.y+389-345+165+66-55,"下一个果所需经验：")
	zts:置颜色(黄色):显示(self.x+246-208+125,self.y+389-345+165-55,self.已食用潜能果)
	zts:置颜色(黄色):显示(self.x+246-208+320,self.y+389-345+165-55,self.剩余潜能果)
	zts:置颜色(黄色):显示(self.x+246-208+125,self.y+389-345+165+33-55,self.可用经验)
	zts:置颜色(黄色):显示(self.x+246-208+125,self.y+389-345+165+66-55,self.下个经验)
	self.资源组[5]:显示(self.x+105,self.y+255)
	self.资源组[6]:显示(self.x+130+111,self.y+255)
	-- if self.资源组[5]:事件判断() then
	--     tp.窗口.对话栏:文本("长眉灵猴","老猕猴","你当前已食用"..self.已食用潜能果.."个潜能果，需要消耗"..self.下个经验.."点经验才能食用下一个，你是否需要继续食用？",{"是 ","否"})
	-- end
	if self.资源组[5]:事件判断() then
		local  mc="老猕猴"
		if self.伙伴id then
			mc=""..self.伙伴id
		end
		tp.窗口.对话栏:文本("长眉灵猴",mc,"你当前已食用"..self.已食用潜能果.."个潜能果，需要消耗"..self.下个经验.."点经验才能食用下一个，你是否需要继续食用？",{"是 ","否"})
	end
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	end
end

function 潜能果:更新数据(内容)
	self.可用经验 = 内容.可用经验
	self.已食用潜能果 = 内容.已食用潜能果
	self.剩余潜能果 = 内容.剩余潜能果
	self.下个经验 = 内容.下个经验
end

function 潜能果:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 潜能果:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 潜能果:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 潜能果