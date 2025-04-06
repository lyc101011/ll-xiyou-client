-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:33
local _丸子保存技能 = class()
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local tp,lsdh
local 丸子赐福技能={"必杀","毒","盾气","法术暴击","法术波动","法术抵抗","法术连击","反击","反震","防御","飞行","否定信仰","感知","合纵","慧根","火属性吸收","进击必杀","进击法暴",
"精神集中","雷属性吸收","连击","敏捷","冥思","魔之心","强力","驱鬼","神迹","水属性吸收","偷袭","土属性吸收","吸血","幸运","夜战","遗志","隐身","永恒","再生","招架",
"高级必杀","高级毒","高级盾气","高级法术暴击","高级法术波动","高级法术抵抗","高级法术连击","高级反击","高级反震","高级防御","高级飞行","高级否定信仰","高级感知","高级合纵","高级慧根",
"高级火属性吸收","高级进击必杀","高级进击法暴","高级精神集中","高级雷属性吸收","高级连击","高级敏捷","高级冥思","高级魔之心","高级强力","高级驱鬼","高级神迹","高级水属性吸收",
"高级偷袭","高级土属性吸收","高级吸血","高级幸运","高级夜战","高级遗志","高级隐身","高级永恒","高级再生","高级招架","奔雷咒","壁垒击破","地狱烈火","水漫金山","泰山压顶"}

function _丸子保存技能:初始化(根) --超级技能2.6 整个_丸子保存.lua文件新增
 	self.ID = 182
	self.x = 158
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "_丸子保存技能"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
end

function _丸子保存技能:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local bbs = tp.队伍[1].宝宝列表
	lsdh = tp.字体表.普通字体
	self.资源组 = {
		[1] = 自适应.创建(0,1,309,285,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 自适应.创建(2,1,285,175,3,9),
		[4] = 按钮.创建(自适应.创建(12,4,63,22,1,3),0,0,4,true,true," 确 定"),
		[5] = 按钮.创建(自适应.创建(12,4,63,22,1,3),0,0,4,true,true," 取 消"),
	}
	self.资源组[2]:绑定窗口_(self.ID)
	self.资源组[4]:绑定窗口_(self.ID)
	self.资源组[5]:绑定窗口_(self.ID)
	self.原赐福={}
	self.本次赐福={}
	if bbs[self.数据.bh] ~= nil and bbs[self.数据.bh].丸子技能 then
		for n=1,4 do
			if bbs[self.数据.bh].丸子技能[n] ~= nil then
				-----------------超级技能2.8 加
				local qgjjn=取技能是否有高级(bbs[self.数据.bh],bbs[self.数据.bh].丸子技能[n].名称)
				-----------------
				if bbs[self.数据.bh].丸子技能[n].生效 then
					local qtb=引擎.取技能(qgjjn) --超级技能2.8 改
					self.原赐福[n]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
					self.原赐福[n].名称 = qgjjn --超级技能2.8 改
					self.原赐福[n].超级=true
				else
					local qtb=引擎.取技能(qgjjn) --超级技能2.8 改
					self.原赐福[n]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
					self.原赐福[n]:灰度级()
					self.原赐福[n].名称 = qgjjn --超级技能2.8 改
					self.原赐福[n].超级=false
				end
			end
		end
	end
	if self.数据.技能 then
		for n=1,4 do
			if self.数据.技能[n] ~= nil then
				local yjn=false
				-----------------超级技能2.8 加
				local qgjjn=取技能是否有高级(bbs[self.数据.bh],self.数据.技能[n])
				-----------------
				for k,v in pairs(bbs[self.数据.bh].技能) do
					if v.名称 == qgjjn then
						yjn=true
					end
				end
				-----------------超级技能2.8 加
				local qgjjn=取技能是否有高级(bbs[self.数据.bh],self.数据.技能[n])
				-----------------
				local qtb=引擎.取技能(qgjjn) --超级技能2.8 改
				self.本次赐福[n]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
				self.本次赐福[n].名称=qgjjn --超级技能2.8 改
				if yjn==false then
					self.本次赐福[n]:灰度级()
				end
			end
		end
	end
end

function _丸子保存技能:关闭()
	self.可视 = false
	self.资源组=nil
	self.数据=nil
	self.原赐福=nil
    self.本次赐福=nil
	return
end

function _丸子保存技能:打开(数据)
 	if self.可视 then
		self:关闭()
		return
	else
		insert(tp.窗口_,self)
		self.数据={}
		self.数据 = 数据
		self:加载资源()
		self.x = (全局游戏宽度/2)-400
		self.y = (全局游戏高度/2)-232
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function _丸子保存技能:显示(dt,x,y)
	self.焦点 = false
	local bbs = tp.队伍[1].宝宝列表
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	self.资源组[4]:更新(x,y)
    self.资源组[5]:更新(x,y)
    self.资源组[2]:显示(self.x+288,self.y+2)
    self.资源组[3]:显示(self.x+12,self.y+52)
    self.资源组[4]:显示(self.x+76,self.y+242)
    self.资源组[5]:显示(self.x+169,self.y+242)
    lsdh:置颜色(黄色):显示(self.x+118,self.y+3,"保存赐福效果")
    lsdh:置颜色(白色)
    lsdh:显示(self.x+13,self.y+31,"确定要保存本次赐福效果吗？")
    lsdh:置颜色(黑色)
    lsdh:显示(self.x+116,self.y+64,"原赐福效果")
    lsdh:显示(self.x+110,self.y+153,"本次赐福效果")
    for n=1,4 do
    	tp.技能格子背景_:显示(self.x+49+(n-1)*55,self.y+85)
    	tp.技能格子背景_:显示(self.x+49+(n-1)*55,self.y+175)
    	if self.原赐福[n]~= nil then
    		self.原赐福[n]:显示(self.x+50+(n-1)*55,self.y+86)
    	end
    	if self.本次赐福[n]~= nil then
    		self.本次赐福[n]:显示(self.x+50+(n-1)*55,self.y+176)
    	end
		if self.原赐福[n]~= nil and self.原赐福[n]:是否选中(x,y) then
			tp.提示:超级技能(x,y+20,self.原赐福[n].名称,self.原赐福[n].超级,nil,true)
		elseif self.本次赐福[n] ~= nil and self.本次赐福[n]:是否选中(x,y) then
			tp.提示:超级技能(x,y+20,self.本次赐福[n].名称,"不显示",nil,true)
		end
    end
	if self.资源组[2]:事件判断() or self.资源组[5]:事件判断() or tp.窗口._丸子赐福.可视==false then
		self:关闭()
	elseif self.资源组[4]:事件判断()	then
		if bbs[self.数据.bh]~=nil and self.数据.认证码 == bbs[self.数据.bh].认证码 then
			发送数据(3903,{bb=self.数据.bh,认证码=bbs[self.数据.bh].认证码,锁定=table.copy(self.数据.锁定),技能=self.数据.技能})
		else
		    tp.常规提示:打开("#Y/选择的BB已变更，禁止作操")
		end
	end
	lsdh:置颜色(白色)
end


function _丸子保存技能:初始移动(x,y)
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

function _丸子保存技能:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy


	end
end
function _丸子保存技能:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
return _丸子保存技能