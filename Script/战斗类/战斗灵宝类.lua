-- @Author: baidwwy
-- @Date:   2023-10-29 20:33:38
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-06-18 16:49:40
-- @Author: ASUS
-- @Date:   2021-10-05 15:37:16
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-10-30 21:55:44
local 场景类_战斗灵宝栏 = class()

function 场景类_战斗灵宝栏:初始化(根)
	self.ID = 110
	self.x = 158
	self.y = 142
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗灵宝栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[0] = 自适应.创建(77,1,486,18,1,3,nil,18), -- 背景
		[1] = 自适应.创建(76,1,490,315,3,9), -- 横条
		[2] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000271),0,0,4),
		[3] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777558),0,0,4,nil,nil,"  使用"),
		[4] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777558),0,0,4,nil,nil,"  使用"),
		[5] = 资源:载入('org.rpk',"网易WDF动画",16777536),
		[6] = 自适应.创建(2,1,221,242,3,9),
		}
	self.灵宝佩戴 = {}
	-- for i=2,4 do
	-- 	self.资源组[i]:绑定窗口_(self.ID)
	-- end
	local 格子 = 根._物品格子
	for i=1,2 do
		self.灵宝佩戴[i] = 格子.创建(0,0,i,"战斗灵宝")
	end
	self.介绍文本 = 根._丰富文本(205,90,根.字体表.普通字体)
	self.介绍文本2 = 根._丰富文本(205,90,根.字体表.普通字体)
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
end

function 场景类_战斗灵宝栏:打开(sj)
	if self.可视 then
		self.介绍文本:清空()
		self.介绍文本2:清空()
		self.可视 = false
	else
		self.数据=sj
		for i=1,2 do
			self.灵宝佩戴[i]:置物品(self.数据.灵宝佩戴[i])
		end
		if self.灵宝佩戴[1].物品 then
			self.介绍文本:添加文本(self.灵宝佩戴[1].物品.介绍)
		end
		if self.灵宝佩戴[2].物品 then
			self.介绍文本2:添加文本(self.灵宝佩戴[2].物品.介绍)
		end
		self.可视 = true
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间

	end
end

function 场景类_战斗灵宝栏:更新(dt,x,y)
	self.鼠标=self:检查点(x,y)
end

function 场景类_战斗灵宝栏:显示(dt,x,y)
	if not self.可视 then
		return false
	end
	self.焦点 = false
	if self.鼠标 then
		self.资源组[2]:更新(x,y)
		self.资源组[3]:更新(x,y,not (self.灵宝佩戴[1].物品== nil),2)
		self.资源组[4]:更新(x,y,not (self.灵宝佩戴[2].物品== nil),2)
		if self.资源组[2]:事件判断() then
			self:打开()
		elseif self.资源组[3]:事件判断() then
			 战斗类.战斗指令:设置灵宝参数(1,self:取可用道具(self.灵宝佩戴[1].物品.名称))
		elseif self.资源组[4]:事件判断() then
			 战斗类.战斗指令:设置灵宝参数(2,self:取可用道具(self.灵宝佩戴[2].物品.名称))
		end
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[0]:显示(self.x+2,self.y+1)
	self.资源组[2]:显示(self.x + 460,self.y + 2,true)
	self.资源组[6]:显示(self.x + 16,self.y + 56)
	self.资源组[6]:显示(self.x + 253,self.y + 56)
	self.资源组[3]:显示(self.x + 90,self.y + 260,true)
	self.资源组[4]:显示(self.x + 330,self.y + 260,true)
	tp.窗口标题背景_:置区域(0,0,90,18)
	tp.窗口标题背景_:显示(self.x+217,self.y)
	zts1:置字间距(3)
	zts1:显示(self.x+221,self.y+1,"选择灵宝")
	zts1:置字间距(0)
	zts:置颜色(0xFFFFFFFF)
	zts:显示(self.x+130,self.y+30, string.format("当前剩余灵元:%s(%s回合后增加1点)",self.数据.灵元.数值,self.数据.灵元.回合))
	zts:置颜色(0xFF000000)
	for h=1,2 do
		self.资源组[5]:显示(self.x + 97+((h-1)*216),self.y + 75)
		self.灵宝佩戴[h]:置坐标(self.x + 97+((h-1)*216),self.y+75)
		self.灵宝佩戴[h]:显示(dt,x,y,self.鼠标)
	end
	if self.灵宝佩戴[1].物品 then
		self.介绍文本:显示(self.x + 25,self.y + 150)
		zts:显示(self.x+90,self.y+240,"消耗灵元："..self.数据.灵元.数值)
	end
	if self.灵宝佩戴[2].物品 then
		self.介绍文本2:显示(self.x + 260,self.y + 150)
		zts:显示(self.x+330,self.y+240,"消耗灵元：")
	end
	if tp.按钮焦点 then
		self.焦点 = true
	end
	if 引擎.鼠标弹起(1)  and not tp.禁止关闭 and self.鼠标 then
		self:打开()
	end
end

function 场景类_战斗灵宝栏:取可用道具(名称)
	---  99-敌我双方都可以用  3-我方   4-敌方
	if 名称=="风舞心经" or 名称=="寒霜盾戟"  or 名称=="战神宝典" or 名称=="定神仙琴" then
		return 2
	elseif 名称=="断穹巨剑" or 名称=="相思寒针" or 名称=="锢魂命谱" or 名称=="青狮獠牙"  or 名称=="冥火炼炉" or 名称=="缚仙蛛丝" or 名称=="煞魂冥灯" or 名称=="九霄龙锥" or 名称=="化怨清莲"
		or 名称=="天雷音鼓" or 名称=="乾坤金卷" or 名称=="乾坤木卷" or 名称=="乾坤水卷" or 名称=="乾坤火卷" or 名称=="乾坤土卷" or 名称=="惊兽云尺"  then
		return 4
	elseif 名称=="静心禅珠" or 名称=="宁心道符" or 名称=="护体灵盾" or 名称=="赤炎战笛" or 名称=="真阳令旗" then
		return 3
	end
	return 0
 end

function 场景类_战斗灵宝栏:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
	return false
end

function 场景类_战斗灵宝栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
		self.窗口时间 = tp.运行时间
	end
	if not self.焦点 then
		tp.场景.战斗.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗灵宝栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗灵宝栏