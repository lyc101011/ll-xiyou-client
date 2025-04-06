-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:17:05
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Lsafgergt Modified time: 2024-03-05 18:36:42
--======================================================================--
local 助战修炼学习 = class()

local bwh = require("gge包围盒")
local bw2 = bwh(0,0,244,20)
local floor = math.floor
local format = string.format
local min = math.min
local box = 引擎.画矩形
local safgerg = {"攻击修炼","防御修炼","法术修炼","抗法修炼","猎术修炼"}
local sdgdfg = {"攻击控制力","防御控制力","法术控制力","抗法控制力"}
local tp,mmzt,zts1,zts2,zts3
local mousea = 引擎.鼠标弹起
local insert = table.insert
local tostring = tostring

function 助战修炼学习:初始化(根)
	self.ID = 177
	self.x = 132
	self.y = 288
	self.xx = 0
	self.yy = 0
	self.注释 = "人物状态栏"
	self.可视 = false
	self.鼠标 = true
	self.焦点 = false
	self.可移动 = true

	tp = 根
	mmzt =  tp.字体表.猫猫字体3
	zts1 = tp.字体表.普通字体__
	zts2 = tp.字体表.描边字体
	zts3 = tp.字体表.普通字体__
	zts1:置行间距(2.7)

	--self.tszt:置颜色(绿色)
	self.生活选中=0
	self.状态 = 1
	self.子类状态 = 1
	self.特殊技能 = {}
	self.窗口时间 = 0
	self.辅助技能页数 = 0
end

function 助战修炼学习:打开(助战)
	if self.可视 then
		self.状态 = 1
		self.子类状态 = 1
		self.可视 = false
	else
		self.修炼选中1 = 0
		self.修炼选中2 = 0
		self.生活选中=0
		self.剧情选中=0
		self.辅助技能页数 = 0
		self.角色=助战
		self.助战编号=助战.助战编号
		self.角色.助战编号=self.助战编号
		self.助战id=助战.助战id
		if not self.资源组 then
			self:加载资源()
		end
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 助战修炼学习:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,569,218+18,3,9),
		[2] = 资源:载入('pic/xlbj.png',"图片"),--自适应.创建(2,1,130,117,3,9),
		[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
		[34] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"角色学习"),
		[35] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"宝宝学习"),
		[36] = 按钮.创建(自适应.创建(17,4,72,22,1,3),0,0,4,true,true,"设为当前"),
	}
	for i=34,35 do
		if self.资源组[i] then
			self.资源组[i]:绑定窗口_(self.ID)
		end
	end
	-- self.资源组[47]:置偏移(0,-1)
	-- self.资源组[48]:置偏移(0,-1)
	-- self.资源组[29]:置偏移(1,0)
	-- self.资源组[30]:置偏移(1,0)
	-- self.资源组[31]:置偏移(1,0)
	-- for i=47,49 do
	-- 	if i ~= 49 then
	-- 		self.资源组[i]:绑定窗口_(self.ID)
	-- 	end
	-- end
end

function 助战修炼学习:显示(dt,x,y)
	self.焦点 = false
	local 右键点击=false
	-- 变量集合
	local rw = self.角色
	-- 显示集合
	self.资源组[5]:更新(x,y)
	self.资源组[36]:更新(x,y)
	if self.资源组[5]:事件判断() then
		self:打开()
		return false
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-90+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,self.助战id.."修炼")
	self.资源组[5]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	local ms = nil
	zts1:置颜色(4294967295)
	mmzt:置颜色(白色)
	mmzt:显示(self.x+27,self.y+41-13,"伙伴自身修炼  当前："..rw.修炼.当前)
	mmzt:显示(self.x+27+275,self.y+41-13,"召唤兽控制修炼 当前："..rw.bb修炼.当前)
	-- zts:置字间距(0)
	-- self.资源组[2]:置宽高(255,115)
	self.资源组[2]:显示(self.x+17,self.y+77-15-11)
	self.资源组[2]:显示(self.x+17+275,self.y+77-15-11)
	zts3:置颜色(-16777216)
	for i=0,4 do
		local jx = self.x + 24
		local jy = self.y + 64 + i * 26
		bw2:置坐标(jx-6,jy-7)
		local xz = bw2:检查点(x,y)
		if self.修炼选中1 ~= i+1 then
			if xz then
				box(jx-6,jy-6,jx+252,jy+17,-3551379)
				if mousea(0) then
					self.修炼选中1 = i+1
				end
				self.焦点 = true
			end
		else
			local ys = -10790181
			if xz then
				ys = -9670988
				self.焦点 = true
			end
			box(jx-6,jy-6,jx+252,jy+17,ys)
		end--计算修炼等级经验(等级,上限)
		-- zts3:显示(jx,jy,safgerg[i+1].."   等级:"..rw.修炼[safgerg[i+1]][1].."/"..rw.修炼[safgerg[i+1]][3].."  修炼经验:"..rw.修炼[safgerg[i+1]][2]..[[/]]..计算修炼等级经验(rw.修炼[safgerg[i+1]][1],rw.修炼[safgerg[i+1]][3]))
		zts3:显示(jx,jy,safgerg[i+1].."   等级:"..rw.修炼[safgerg[i+1]][1].."/"..rw.修炼[safgerg[i+1]][3])
		zts3:显示(jx+137,jy,"修炼经验 :"..rw.修炼[safgerg[i+1]][2]..[[/]]..计算修炼等级经验(rw.修炼[safgerg[i+1]][1],rw.修炼[safgerg[i+1]][3]))
	end
	for i=0,3 do
		local jx = self.x + 24+275
		local jy = self.y + 64 + i * 26
		bw2:置坐标(jx-9,jy-7)
		local xz = bw2:检查点(x,y)
		if self.修炼选中2 ~= i+1 then
			if xz then
				box(jx-6,jy-6,jx+252,jy+17,-3551379)
				if mousea(0) then
					self.修炼选中2 = i+1
				end
				self.焦点 = true
			end
		else
			local ys = -10790181
			if xz then
				ys = -9670988
				self.焦点 = true
			end
			box(jx-6,jy-6,jx+252,jy+17,ys)
		end--计算修炼等级经验(等级,上限)
		-- zts3:显示(jx,jy,sdgdfg[i+1].."   等级:"..rw.bb修炼[sdgdfg[i+1]][1].."/"..rw.bb修炼[sdgdfg[i+1]][3].."  修炼经验:"..rw.bb修炼[sdgdfg[i+1]][2]..[[/]]..计算修炼等级经验(rw.bb修炼[sdgdfg[i+1]][1],rw.bb修炼[sdgdfg[i+1]][3]))
		zts3:显示(jx,jy,sdgdfg[i+1].." 等级:"..rw.bb修炼[sdgdfg[i+1]][1].."/"..rw.bb修炼[sdgdfg[i+1]][3])
		zts3:显示(jx+137,jy,"修炼经验 :"..rw.bb修炼[sdgdfg[i+1]][2]..[[/]]..计算修炼等级经验(rw.bb修炼[sdgdfg[i+1]][1],rw.bb修炼[sdgdfg[i+1]][3]))
	end
	self.资源组[34]:更新(x,y)
	self.资源组[35]:更新(x,y)
	self.资源组[36]:更新(x,y)
	if not tp.战斗中 then
		if self.资源组[36]:事件判断() then
			local 人物修
			local bb修
			if self.修炼选中1~=nil then
				人物修=safgerg[self.修炼选中1]
			end
			if self.修炼选中2~=nil then
				bb修=sdgdfg[self.修炼选中2]
			end
			发送数据(2017,{人物=人物修,bb=bb修,助战编号=self.助战编号})
		elseif  self.资源组[34]:事件判断() then --学习角色
			发送数据(2018,{人物=true,助战编号=self.助战编号})
		elseif  self.资源组[35]:事件判断() then --bb
			发送数据(2018,{bb=true,助战编号=self.助战编号})
		end
	end
	self.资源组[36]:显示(self.x+190+18+25+10,self.y+41-17+181)
	self.资源组[34]:显示(self.x+190+18+25-210,self.y+41-17+181)
	self.资源组[35]:显示(self.x+190+18+25+275-210+165,self.y+41-17+181)
end

function 助战修炼学习:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 助战修炼学习:初始移动(x,y)
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

function 助战修炼学习:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战修炼学习