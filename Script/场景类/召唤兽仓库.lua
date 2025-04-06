-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:18:26
local 场景类_召唤兽仓库 = class()

local floor = math.floor
local tp,zts,zts1,bba,bbc,zts2
local bw = require("gge包围盒")(0,0,138,20)
local box = 引擎.画矩形
local mouseb = 引擎.鼠标弹起
local move = table.move
local insert = table.insert

function 场景类_召唤兽仓库:初始化(根)
	self.ID = 13
	self.x = 314
	self.y = 158
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽仓库"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.焦点1 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,382,305,3,9),
		[3] = 自适应.创建(4,1,155,220,3,nil),
		[4] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[5] = 自适应.创建(3,1,47,19,1,3),
		[6] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取出"),
		[7] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"存入"),
		[8] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"上页"),
		[9] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"下页"),

	}
	self.资源组[4]:绑定窗口_(13)
	self.资源组[6]:绑定窗口_(13)
	self.资源组[7]:绑定窗口_(13)
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.人物字体_
	zts1 = tp.字体表.描边字体
	zts2 = tp.字体表.普通字体
end

function 场景类_召唤兽仓库:打开()
	if self.可视 then
		self.可视 = false
	else
		bba = tp.召唤兽仓库
		bbc = tp.队伍[1].宝宝列表
		insert(tp.窗口_,self)
		self.选中 = 0
		self.选中1 = 0
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.仓库页数=1
	end
end

function 场景类_召唤兽仓库:显示(dt,x,y)

	self.资源组[4]:更新(x,y)
	self.资源组[6]:更新(x,y,self.选中1 ~= 0)
	self.资源组[7]:更新(x,y,self.选中 ~= 0 and #bbc > 0)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	if self.资源组[4]:事件判断() then
		self:打开()
		return
	elseif self.资源组[6]:事件判断() then --取出
		if self.选中1 ~= 0 then
			发送数据(53,{类型="取",选中=self.选中1,验证=tp.召唤兽仓库[self.选中1].认证码})
		end
		--self.选中1 = 0
	elseif self.资源组[7]:事件判断() then
		if self.选中 ~= 0 then
			发送数据(53,{类型="存",选中=self.选中,验证=tp.队伍[1].宝宝列表[self.选中].认证码})
		end
		--[[local bb = tp.队伍[1].宝宝列表[self.选中]
		if bb == tp.队伍[1].参战宝宝 then
			tp.队伍[1].参战宝宝 = {}
			bb.参战信息 = nil
		end
		if tp.窗口.召唤兽属性栏.可视 then
			if tp.队伍[1].宝宝列表[tp.窗口.召唤兽属性栏.选中+tp.窗口.召唤兽属性栏.加入] == bb then
				tp.窗口.召唤兽属性栏.名称输入框:置可视(false,false)
				tp.窗口.召唤兽属性栏.加入 = math.max(tp.窗口.召唤兽属性栏.加入 - 1,0)
				tp.窗口.召唤兽属性栏:置形象()
				if tp.窗口.道具行囊.可视 and tp.窗口.道具行囊.窗口 == "召唤兽" then
					if bb == tp.队伍[1].宝宝列表[tp.窗口.道具行囊.选中召唤兽] then
						tp.窗口.道具行囊.选中召唤兽 = 0
						tp.窗口.道具行囊.资源组[4] = nil
						for s=1,3 do
							tp.窗口.道具行囊.召唤兽装备[s]:置物品(nil)
						end
					end
				end
			end
			if tp.窗口.召唤兽资质栏.可视 then
				tp.窗口.召唤兽资质栏:打开()
			end
			tp.窗口.召唤兽属性栏.选中 = tp.窗口.召唤兽属性栏.选中 - 1
		end
		table.insert(bba,tp.队伍[1].宝宝列表[self.选中])
		table.remove(tp.队伍[1].宝宝列表, self.选中)
		self.选中 = 0 --]]
	end
	self.焦点 = false
	self.焦点1 = nil
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y+1)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"召唤兽仓库")
	self.资源组[4]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x+22,self.y+39)
	self.资源组[3]:显示(self.x+202,self.y+39)
	self.资源组[5]:显示(self.x+15,self.y+271)
	self.资源组[6]:显示(self.x+210,self.y+270)
	self.资源组[7]:显示(self.x+291,self.y+270)
	self.资源组[8]:显示(self.x+80,self.y+270)
	self.资源组[9]:显示(self.x+140,self.y+270)
	for i=1,#bba do
		zts:置颜色(-16777216)
		local jx = self.x+34
		local jy = self.y+55+i*22
		bw:置坐标(jx-4,jy-3)
		if i ~= self.选中1 then
			if bw:检查点(x,y) then
				box(jx-5,jy-6,jx+138,jy+15,-3551379)
				self.焦点 = true
				if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
					self.选中1 = i
				end
			end
		else
			local ys = -10790181
			if bw:检查点(x,y) then
				ys = -9670988
				self.焦点1 = true
				self.焦点 = true
				if mouseb(1) and self.鼠标 and not tp.消息栏焦点 then
					tp.窗口.召唤兽查看栏:打开(bba[i])
				end
			end
			box(jx-5,jy-6,jx+138,jy+15,ys)
		end
		zts:显示(jx,jy-2,bba[i].名称)
	end
	for i=1,#bbc do
		if bbc[i].参战信息 == nil then
			zts:置颜色(-16777216)
		else
		    zts:置颜色(-65536)
		end
		local jx = self.x+213
		local jy = self.y+55+i*22
		bw:置坐标(jx-4,jy-3)
		if i ~= self.选中 then
			if bw:检查点(x,y) then
				box(jx-5,jy-6,jx+138,jy+15,-3551379)
				self.焦点 = true
				if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
					self.选中 = i
				end
			end
		else
			local ys = -10790181
			if bw:检查点(x,y) then
				ys = -9670988
				self.焦点 = true
				self.焦点1 = true
				if mouseb(1) and self.鼠标 and not tp.消息栏焦点 then
					tp.窗口.召唤兽查看栏:打开(bbc[i])
				end
			end
			box(jx-5,jy-6,jx+138,jy+15,ys)
		end
		zts:显示(jx,jy-2,bbc[i].名称)
	end
	zts2:置颜色(-16777216)
	zts2:显示(self.x+24,self.y+274,self.仓库页数)
end

function 场景类_召唤兽仓库:存(编号)
	if tp.窗口.召唤兽属性栏.可视 == true then
		tp.窗口.召唤兽属性栏:打开()
	end
	table.insert(tp.召唤兽仓库,tp.队伍[1].宝宝列表[编号])
	table.remove(tp.队伍[1].宝宝列表,编号)
	bba = tp.召唤兽仓库
	bbc = tp.队伍[1].宝宝列表
end

function 场景类_召唤兽仓库:取(编号)
	if tp.窗口.召唤兽属性栏.可视 == true then
		tp.窗口.召唤兽属性栏:打开()
	end
	table.insert(tp.队伍[1].宝宝列表,tp.召唤兽仓库[编号])
	table.remove(tp.召唤兽仓库,编号)
	bba = tp.召唤兽仓库
	bbc = tp.队伍[1].宝宝列表
end


function 场景类_召唤兽仓库:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_召唤兽仓库:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_召唤兽仓库:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_召唤兽仓库