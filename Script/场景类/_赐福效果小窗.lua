-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:33
local _赐福效果小窗 = class()
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local tp,lsdh

function _赐福效果小窗:初始化(根)
 	self.ID = 183
	self.x = 158
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "_赐福效果小窗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = false
	self.窗口时间 = 0
	tp = 根
end

function _赐福效果小窗:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	lsdh = tp.字体表.普通字体
	self.资源组 = {
		[1] = 自适应.创建(6,1,208,96,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 资源:载入('赐福小窗纹.png',"图片"),--要复制素材文件
		[4] = 按钮.创建(资源:载入('wzcf.npk',"网易WDF动画","大问号a"),0,0,4,true,true)
	}
	self.资源组[2]:绑定窗口_(self.ID)
end

function _赐福效果小窗:关闭()
	self.可视 = false
	self.资源组=nil
	self.技能=nil
	self.bb=nil
	return
end

function _赐福效果小窗:打开(bb,ax,ay,窗口) --超级技能2.6 改
 	if self.可视 then
		self:关闭()
		return
	else
		insert(tp.窗口_,self)
		self.bb=bb
		self:加载资源()
		self:置赐福技能()
		self.x = ax+25
		self.y = ay+225
		self.窗口 = 窗口 --超级技能2.6 加
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function _赐福效果小窗:显示(dt,x,y)
	----------------------
	-- 素材位置调整()
	-- ax=AFCHX
	-- ay=AFCHY
	-- self.资源组[1] = tp._自适应.创建(6,1,ax,ay,3,9)
	------------------------
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[3]:显示(self.x+44,self.y+16)
	self.资源组[4]:更新(x,y)
	self.资源组[4]:显示(self.x+171,self.y+16)
	------------------------------超级技能2.6 加
	-- lsdh:置颜色(白色):显示(self.x+76,self.y+20,"赐福效果") --原删
	if self.窗口 == "_丸子赐福" then
		lsdh:置颜色(白色):显示(self.x+69,self.y+20,"原赐福效果")
	else
		lsdh:置颜色(白色):显示(self.x+76,self.y+20,"赐福效果")
	end
	for n=1,4 do
		if self.技能[n]~=nil then
			self.技能[n]:显示(self.x + 12 + (n-1)*48,self.y + 44)
			if self.技能[n]:是否选中(x,y) then
				tp.提示:超级技能(x,y+20,self.技能[n].名称,self.技能[n].超级,nil,true)
			end
		end
	end
    if self.资源组[4]:是否选中(x,y) then
    	tp.提示:自定义(x-30,y+20,"召唤兽获得赐福效果：入场时，随机下列技能中的一个进化为更高级的技能。\n#G/召唤兽未携带的技能（含套装效果）无法进化")
    end
    local 选中窗口 = tp:取鼠标所在窗口(x,y)
	if self.资源组[2]:事件判断() or tp.窗口_[选中窗口]==nil or tp.窗口_[选中窗口].ID~=self.ID then
		self:关闭()
	end
	lsdh:置颜色(白色)
end

function _赐福效果小窗:置赐福技能() --超级技能2.8 大改
	if self.bb==nil or self.bb.丸子技能 == nil then return end
	self.技能={}
	for k,v in pairs(self.bb.丸子技能) do
		-----------------超级技能2.8 加
		local qgjjn,sfyjn=取技能是否有高级(self.bb,v.名称)
		-----------------
		if sfyjn then
			local qtb=引擎.取技能(qgjjn)
			local xbh=#self.技能+1
			self.技能[xbh]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
			self.技能[xbh].名称=qgjjn
			self.技能[xbh].超级=true
		else
		    local qtb=引擎.取技能(qgjjn)
			local xbh=#self.技能+1
			self.技能[xbh]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
			self.技能[xbh]:灰度级()
			self.技能[xbh].名称=qgjjn
			self.技能[xbh].超级=false
		end
	end
	for n=1,4 do
		if self.技能[n]==nil then
			local qmc=丸子赐福技能a[取随机数(1,#丸子赐福技能a)]
			local qtb=引擎.取技能(丸子赐福技能a[取随机数(1,#丸子赐福技能a)])
		    self.技能[n]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
		    self.技能[n]:灰度级()
		    self.技能[n].名称=qmc
		    self.技能[n].超级=false
		end
	end
end

function _赐福效果小窗:初始移动(x,y)
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

function _赐福效果小窗:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy


	end
end
function _赐福效果小窗:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
return _赐福效果小窗