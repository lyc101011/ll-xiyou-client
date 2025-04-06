-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:26
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-23 15:19:03
local 场景类_更多属性 = class()
local tp,zts,zts1,zts2,zts3,zts4
-- local mousea = 引擎.鼠标弹起
local insert = table.insert
-- local bw = require("gge包围盒")(0,0,242,24)
-- local box = 引擎.画矩形
local floor = math.floor
local ceil = math.ceil
local min = math.min
-- local max = math.max
local wbxx = {"灵    力","躲    避","固定伤害","治疗能力","穿刺等级","狂暴等级","仙法伤害","仙法防御","格 挡 值","仙法暴击等级","物理暴击等级","法术暴击等级","封印命中等级","抵抗封印等级","气血回复效果","法术伤害结果","抗物理暴击等级","抗法术暴击等级"}
local sxxx = {"灵力","物理暴击等级","穿刺等级","狂暴等级","法术暴击等级","法术伤害结果","封印命中等级","固定伤害","治疗能力"}
local kxxx = {"抗物理暴击等级","格挡值","抗法术暴击等级","抵抗封印等级","气血回复效果","躲避"}
local xxxz = {"全部","物理","法术","辅助"}
function 场景类_更多属性:初始化(根)
	self.ID = 91
	self.x = 291
	self.y = 117
	self.xx = 0
	self.yy = 0
	self.焦点 = false
	self.注释 = "更多属性"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	tp = 根
	zts = tp.字体表.普通字体__
	-- zts1 = tp.字体表.普通字体
	local 按钮 = require("script/系统类/按钮")
	self.资源组 = {
		[1] = 资源:载入('aaa.wdf',"网易WDF动画",83),
		-- [2] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
		-- [3] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
		[4] =  根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,125,2),
		-- [5] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		-- [6] = 小型选项栏.创建(自适应.创建(8,1,201,115,3,9),"输出选项"),
		-- [7] = 自适应.创建(103,1,197,22,1,3,nil,18),--下拉框开始
	}
	self.资源组[1]:置颜色(ARGB(220,255,255,255))
	self.资源组[4].滑块:置颜色(ARGB(150,255,255,255))
	-- for i=2,5 do
		-- self.资源组[5]:绑定窗口_(self.ID)
	-- end
	self.窗口时间 = 0
	self.加入 = 0
	self.资源组[4]:置起始点(0)
end

function 场景类_更多属性:打开()
	if self.可视 then
		self.可视 = false
		self.加入 = 0
		self.资源组[4]:置起始点(0)
	else
		if tp.战斗中 then
		    insert(tp.战斗窗口_,self)
		else
			insert(tp.窗口_,self)
		end
		self.选项="全部"
		self.x = tp.窗口.人物状态栏.x-256
		self.y =tp.窗口.人物状态栏.y
	   	tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    	self.可视 = true
	end
end

function 场景类_更多属性:显示(dt,x,y)
	if tp.队伍==nil or (tp.队伍~=nil and tp.队伍[1]==nil) then
		self.可视 = false
	    return
	end
	local bbsa = #sxxx
	-- self.资源组[2]:更新(x,y,self.加入 > 0)
	-- self.资源组[3]:更新(x,y,self.加入 < bbsa - 5)
	-- self.资源组[5]:更新(x,y)
	if bbsa > 5 then
		self.资源组[4]:置高度(min(floor(125/(bbsa-5)),125))
		self.加入 = min(ceil((bbsa-5)*self.资源组[4]:取百分比()),bbsa-5)
	end
	-- if self.资源组[2]:事件判断() then--上滚动
	-- 	self.资源组[4]:置起始点(self.资源组[4]:取百分比转换(self.加入-1,5,bbsa))
	-- elseif self.资源组[3]:事件判断() then--下滚动
	-- 	self.资源组[4]:置起始点(self.资源组[4]:取百分比转换(self.加入+1,5,bbsa))
	if(self.资源组[1]:是否选中(x,y)  or self.资源组[4]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
		self.资源组[4]:置起始点(self.资源组[4]:取百分比转换(self.加入-1,5,bbsa))
	elseif (self.资源组[1]:是否选中(x,y) or self.资源组[4]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.加入 < bbsa - 5 then--鼠标下滚动
		self.资源组[4]:置起始点(self.资源组[4]:取百分比转换(self.加入+1,5,bbsa))
	-- elseif self.资源组[5]:事件判断() then
	-- 	self.资源组[6]:打开(xxxz)
	-- 	self.资源组[6]:置选中(self.选项)
	end

	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	for i=1,5 do
		if tp.队伍[1][sxxx[i+self.加入]] ~= nil then
			local jx = self.x+18
			local jy = self.y+(i*25)-5
			zts:置颜色(0xFFFFFFFF)
			zts:显示(jx+3,jy+50,sxxx[i+self.加入])
			if sxxx[i+self.加入] == "物理暴击等级" or sxxx[i+self.加入] == "法术暴击等级" then
				zts:显示(jx+109,jy+50,tp.队伍[1][sxxx[i+self.加入]].."("..string.format("%.2f",tp.队伍[1][sxxx[i+self.加入]]*10/tp.队伍[1].等级).."%)")
			elseif sxxx[i+self.加入] == "封印命中等级" then
				zts:显示(jx+109,jy+50,tp.队伍[1][sxxx[i+self.加入]].."("..string.format("%.2f",tp.队伍[1][sxxx[i+self.加入]]*10/(tp.队伍[1].等级+25)).."%)")
			elseif sxxx[i+self.加入] == "穿刺等级" then
				zts:显示(jx+109,jy+50,tp.队伍[1][sxxx[i+self.加入]].."("..string.format("%.2f",tp.队伍[1][sxxx[i+self.加入]]*0.007).."%)")
			elseif sxxx[i+self.加入] == "狂暴等级" then
				zts:显示(jx+109,jy+50,tp.队伍[1][sxxx[i+self.加入]].."("..string.format("%.2f",tp.队伍[1][sxxx[i+self.加入]]*0.005).."%)")
			else
				zts:显示(jx+109,jy+50,tp.队伍[1][sxxx[i+self.加入]])
			end
		end
	end
	for i=1,6 do
		if tp.队伍[1][kxxx[i]] ~= nil then
			local jx = self.x+18
			local jy = self.y+(i*25)+177
			zts:置颜色(0xFFFFFFFF)
			zts:显示(jx+3,jy+50,kxxx[i])
			if kxxx[i] == "抗物理暴击等级" or kxxx[i] == "抗法术暴击等级" then
				zts:显示(jx+109,jy+50,tp.队伍[1][kxxx[i]].."("..string.format("%.2f",tp.队伍[1][kxxx[i]]*10/tp.队伍[1].等级).."%)")
			elseif kxxx[i] == "抵抗封印等级" then
				zts:显示(jx+109,jy+50,tp.队伍[1][kxxx[i]].."("..string.format("%.2f",tp.队伍[1][kxxx[i]]*10/(tp.队伍[1].等级+25)).."%)")
			else
				zts:显示(jx+109,jy+50,tp.队伍[1][kxxx[i]])
			end
		end
	end
	-- self.资源组[2]:显示(self.x+221,self.y+58)
	-- self.资源组[3]:显示(self.x+221,self.y+173)
	-- if bbsa > 5 then
		self.资源组[4]:显示(self.x+208,self.y+72-9,x,y,self.鼠标)
	-- end
	-- self.资源组[7]:显示(self.x+23,self.y+38)
	-- self.资源组[5]:显示(self.x+200,self.y+38)
	-- self.资源组[6]:显示(self.x+24,self.y+54,x,y,self.鼠标)
	zts:显示(self.x+21,self.y+42,self.选项)
	zts:置颜色(0xFF000000)
	-- zts:显示(self.x+33,self.y+40,self.选项)
end

function 场景类_更多属性:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_更多属性:初始移动(x,y)
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

function 场景类_更多属性:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_更多属性