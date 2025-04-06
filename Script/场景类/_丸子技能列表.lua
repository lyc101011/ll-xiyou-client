-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:33
local _丸子技能列表 = class()
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local tp,lsdh
local 丸子赐福技能={"必杀","毒","盾气","法术暴击","法术波动","法术抵抗","法术连击","反击","反震","防御","飞行","否定信仰","感知","合纵","慧根","火属性吸收","进击必杀","进击法暴",
"精神集中","雷属性吸收","连击","敏捷","冥思","魔之心","强力","驱鬼","神迹","水属性吸收","偷袭","土属性吸收","吸血","幸运","夜战","遗志","隐身","永恒","再生","招架",
"高级必杀","高级毒","高级盾气","高级法术暴击","高级法术波动","高级法术抵抗","高级法术连击","高级反击","高级反震","高级防御","高级飞行","高级否定信仰","高级感知","高级合纵","高级慧根",
"高级火属性吸收","高级进击必杀","高级进击法暴","高级精神集中","高级雷属性吸收","高级连击","高级敏捷","高级冥思","高级魔之心","高级强力","高级驱鬼","高级神迹","高级水属性吸收",
"高级偷袭","高级土属性吸收","高级吸血","高级幸运","高级夜战","高级遗志","高级隐身","高级永恒","高级再生","高级招架","奔雷咒","壁垒击破","地狱烈火","水漫金山","泰山压顶"}

function _丸子技能列表:初始化(根)
 	self.ID = 182
	self.x = 158
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "_丸子技能列表"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
end

function _丸子技能列表:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	lsdh = tp.字体表.普通字体
	self.资源组 = {
		[1] = 自适应.创建(0,1,309,425,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 资源:载入('wzcf.npk',"网易WDF动画","小紫黄标"), --超级技能2.5 新增 npk要改
	}
	self.资源组[2]:绑定窗口_(self.ID)
end

function _丸子技能列表:关闭()
	self.可视 = false
	self.资源组=nil
	self.可赐福=nil
	self.不可赐福=nil
	return
end

function _丸子技能列表:打开(bh)
 	if self.可视 then
		self:关闭()
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self:技能是否可赐福(bh)
		self.x = (全局游戏宽度/2)-400
		self.y = (全局游戏高度/2)-232
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function _丸子技能列表:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
    self.资源组[2]:显示(self.x+288,self.y+2)
    lsdh:置颜色(黄色):显示(self.x+118,self.y+3,"召唤兽技能")
    lsdh:置颜色(白色)
    lsdh:显示(self.x+118,self.y+30,"可赐福技能")
    lsdh:显示(self.x+113,self.y+226,"不可赐福技能")
    local o = 0
	for h=1,4 do
		for l = 1,7 do
			o = o + 1
			tp.技能格子背景_:显示(self.x+14+(l-1)*40,self.y+52+(h-1)*40)
			tp.技能格子背景_:显示(self.x+14+(l-1)*40,self.y+248+(h-1)*40)
			if self.可赐福[o] ~= nil then
				self.可赐福[o]:显示(self.x+15+(l-1)*40,self.y+53+(h-1)*40)
				----------超级技能2.5 新增
				if self.可赐福[o].超级 then
					self.资源组[3]:显示(self.x+15+(l-1)*40,self.y+53+(h-1)*40)
				end
				----------
			end
			if self.不可赐福[o] ~= nil then
				self.不可赐福[o]:显示(self.x+15+(l-1)*40,self.y+249+(h-1)*40)
			end
			if self.可赐福[o] ~= nil and self.可赐福[o]:是否选中(x,y) then
				tp.提示:超级技能(x,y+20,self.可赐福[o].名称,self.可赐福[o].超级,nil,true) --超级技能2.5 改
			elseif self.不可赐福[o] ~= nil and self.不可赐福[o]:是否选中(x,y) then
				tp.提示:自定义(x,y+20,self.不可赐福[o].名称)
			end
		end
	end
	if self.资源组[2]:事件判断() then
		self:关闭()
	end
	lsdh:置颜色(白色)
end

function _丸子技能列表:技能是否可赐福(bh)
	local bbs = tp.队伍[1].宝宝列表
	local kcf={}
	local bkcf={}
	self.可赐福={}
	self.不可赐福={}
	if bbs[bh] == nil then return end
	local bbjn={}
	for k,v in pairs(bbs[bh].技能) do --超级技能2.8
	    if type(v) == "table" then
	    	bbjn[k] = v
	    end
	end
	for k,v in pairs(bbjn) do
		for n=1,#丸子赐福技能 do
			if v.名称 == 丸子赐福技能[n] then
				kcf[#kcf+1] = v.名称
			end
		end
	end
	for k,v in pairs(kcf) do
		for kv,nv in pairs(bbjn) do
			if nv.名称 == v then
				table.remove(bbjn,kv)
			end
		end
    end
    for k,v in pairs(bbjn) do
    	bkcf[k] = v.名称
	end
	for n=1,24 do
		if kcf[n] ~= nil then
			local qtb=引擎.取技能(kcf[n])
			self.可赐福[n]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
			self.可赐福[n].名称=kcf[n]
			---------------------超级技能2.5 新增
			self.可赐福[n].超级=false
			if bbs[bh].丸子技能~=nil then
				for nvgs=1,4 do
					-----------------超级技能2.19 改
					if bbs[bh].丸子技能[nvgs] ~= nil then
						local qgjjn=取技能是否有高级(bbs[bh],bbs[bh].丸子技能[nvgs].名称)
						if bbs[bh].丸子技能[nvgs]~=nil and qgjjn==self.可赐福[n].名称 then --超级技能2.8 改
							self.可赐福[n].超级=true
						end
					end
					-----------------
				end
			end
			---------------------
		end
		if bkcf[n] ~= nil then
			local qtb=引擎.取技能(bkcf[n])
			self.不可赐福[n]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
			self.不可赐福[n]:灰度级()
			self.不可赐福[n].名称=bkcf[n]
		end
	end
end

function _丸子技能列表:初始移动(x,y)
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

function _丸子技能列表:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy


	end
end
function _丸子技能列表:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
return _丸子技能列表