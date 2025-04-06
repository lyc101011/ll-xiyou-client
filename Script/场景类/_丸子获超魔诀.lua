-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:33
local _丸子获超魔诀 = class()
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local tp,lsdh

function _丸子获超魔诀:初始化(根)
 	self.ID = 184
	self.x = 158
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "_丸子获超魔诀"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = false
	self.窗口时间 = 0
	tp = 根
end

function _丸子获超魔诀:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	lsdh = tp.字体表.普通字体__
	self.资源组 = {
		[1] = 资源:载入('wzcf.npk',"网易WDF动画","获超诀圣旨"),
		[2] = 资源:载入('wzcf.npk',"网易WDF动画","获超诀神柚"),
		-- [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		-- [3] = 资源:载入('赐福小窗纹.png',"图片"),--要复制素材文件
		-- [4] = 按钮.创建(资源:载入('wzcf.npk',"网易WDF动画","大问号a"),0,0,4,true,true)
	}
	self.关窗口time=0
end

function _丸子获超魔诀:关闭()
	self.可视 = false
	self.资源组=nil
	self.动画开始=nil
	self.动画开关=nil
	self.关窗口time=nil
	self.获得技能=nil
	return
end

function _丸子获超魔诀:打开(jn) --超级技能2.6 改
 	if self.可视 then
		self:关闭()
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.x = (全局游戏宽度/2)
		self.y = (全局游戏高度/2)
		self.窗口 = 窗口 --超级技能2.6 加
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.动画开始=false
		self.可视 = true
		self.动画开关={[1]=false,[2]=false,[3]=false}
		self.获得技能=""
		self:技能名显示方法(jn)
	end
end

function _丸子获超魔诀:技能名显示方法(jn)
	local jnmcd=string.len(jn)/2
	local lsfj=""
	local dqjnm={[1]={a=1,b=2},[2]={a=3,b=4},[3]={a=5,b=6},[4]={a=7,b=8},[5]={a=9,b=10},[6]={a=11,b=12},[7]={a=12,b=13}}
	if jnmcd >=1 then
		for nv=1,jnmcd do
			if dqjnm[nv]~=nil then
				local lsfjb=string.sub(jn,dqjnm[nv].a,dqjnm[nv].b)
				if lsfjb~=nil then
					lsfj= lsfj ..lsfjb .."\n"
				end
			end
		end
		self.获得技能=lsfj
	end
end

function _丸子获超魔诀:显示(dt,x,y)
	----------------------
	-- 素材位置调整()
	-- ax=AFCHX
	-- ay=AFCHY
	-- self.资源组[1] = tp._自适应.创建(6,1,ax,ay,3,9)
	------------------------
	if tp.窗口._丸子赐福.可视 == false or tp.窗口._丸子赐福.丸子赐福.进程 <= 2 then
		if self.动画开关[1]==false and self.动画开关[2]==false then
			self.动画开始=true
			if self.动画开始 then
				self.动画开关[1]=true
			end
		end
	end
	self.焦点 = false
	if self.动画开关[1] then
		self.资源组[2]:更新(dt*2)
		self.资源组[2]:显示(self.x,self.y)
		local ksz,jsz = self.资源组[2]:取当前帧(self.资源组[2]),self.资源组[2]:取结束帧(self.资源组[2])
		if ksz>=jsz then
			self.资源组[2].当前帧=1
			self.动画开关[1]=false
		elseif ksz > jsz/2 then
		    self.动画开关[2]=true
		end
	end
	if self.动画开关[2] then
		local ksz,jsz = self.资源组[1]:取当前帧(self.资源组[1]),self.资源组[1]:取结束帧(self.资源组[1])
		if ksz < jsz then
			self.资源组[1]:更新(dt)
		else
			if ksz >= jsz then self.动画开关[3]=true end
		    self.关窗口time = self.关窗口time + 1
		end
		if self.关窗口time > 200 then
			self:关闭()
			return
		end
		self.资源组[1]:显示(self.x,self.y)
		if self.动画开关[3] then
			lsdh:置颜色(黄色)
			lsdh:显示(self.x+92,self.y-45,self.获得技能)
		end
	end
	lsdh:置颜色(白色)
end

function _丸子获超魔诀:初始移动(x,y)
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

function _丸子获超魔诀:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy


	end
end
function _丸子获超魔诀:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
return _丸子获超魔诀