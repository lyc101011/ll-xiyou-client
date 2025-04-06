
local 场景类_法术认证 = class()
local floor = math.floor
local zts,tp
local insert = table.insert
local tx = 引擎.取头像
local rzjn = {"雷击","落岩","水攻","烈火","奔雷咒","泰山压顶","水漫金山","地狱烈火","上古灵符"}
local mouseb = 引擎.鼠标弹起
function 场景类_法术认证:初始化(根)
	self.ID = 97
	self.x = 374
	self.y = 56
	self.xx = 0
	self.yy = 0
	self.注释 = "法术认证"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	tp = 根
	self.资源组 = {
		[1] = 自适应.创建(0,1,209,209,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"认证"),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true),
		[6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true),
		[7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true),
		[8] = 资源:载入('org.rpk',"网易WDF动画",0x1000368),
	}

	for i=3,7 do
		self.资源组[i]:绑定窗口_(97)
	end
	self.技能 = {}
	local jn = 根._技能格子
	for i=1,36 do
	    self.技能[i] = jn(0,0,i,"召唤兽资质技能")
	end
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	self.技能下一页 = false
	self.技能下一页1 = false
	self.选中技能 = 0
	self.召唤兽序号 = 0
end

function 场景类_法术认证:打开(sj,xh)
	if self.可视 then
		self.可视 = false
	else
		self.选中技能 = 0
		self.技能下一页 = false
		self.技能下一页1 = false
		for i=1,36 do
		    local 临时技能=tp._技能.创建()
		    临时技能:置对象(sj[i],2)
		    self.技能[i]:置技能(sj[i])
		end
		self.召唤兽序号 = xh
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_法术认证:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.选中技能 ~= 0)
	self.资源组[4]:更新(x,y,self.技能下一页 == true)
	self.资源组[5]:更新(x,y,self.技能下一页 == false)
	self.资源组[6]:更新(x,y,self.技能下一页1 == true)
	self.资源组[7]:更新(x,y,self.技能下一页1 == false)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		if self.选中技能 ~= 0 and self.召唤兽序号 ~= 0 then
			local fhz = false
			for i=1,#rzjn do
				if rzjn[i] == self.技能[self.选中技能].技能.名称 then
					fhz = true
				end
			end
			if fhz == true then
			    发送数据(5012,{序列=self.选中技能,序列1=self.召唤兽序号,序列2=self.技能[self.选中技能].技能.名称})
			else
				tp.常规提示:打开("#Y/这个技能无法认证")
			end
		end
	elseif self.资源组[4]:事件判断() then
		self.技能下一页 = false
	elseif self.资源组[5]:事件判断() then
		self.技能下一页 = true
	elseif self.资源组[6]:事件判断() then
		self.技能下一页1 = false
	elseif self.资源组[7]:事件判断() then
		self.技能下一页1 = true
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"法术认证")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+6)
	self.资源组[3]:显示(self.x+140,self.y+175)
	local xx = 0
	local yy = 0
	if self.技能下一页 == false then
		for i=1,12 do
			local jx = self.x+20+(xx*41)
			local jy = self.y+35+(yy*41)
			self.资源组[8]:显示(jx,jy)

			self.资源组[5]:显示(self.x+190,self.y+415-274)
		    self.技能[i]:置坐标(jx+3,jy+2)
	   	    self.技能[i]:显示(x,y,self.鼠标)
	   	    if self.技能[i].焦点 and self.技能[i].技能 ~= nil then
	   	    	if mouseb(0) then
	   	    		self.选中技能 = i
	   	    	end
	   	    	tp.提示:技能(x,y,self.技能[i].技能)
	   	    end
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
	else
		self.资源组[6]:显示(self.x+190,self.y+415)
		if self.技能下一页1 == false then
		    for i=13,24 do
				local jx = self.x+20+(xx*41)
				local jy = self.y+35+(yy*41)
				self.资源组[8]:显示(jx,jy)
			self.资源组[4]:显示(self.x+190,self.y+319-274)
			self.资源组[7]:显示(self.x+190,self.y+415-274)
			    self.技能[i]:置坐标(jx+3,jy+2)
		   	    self.技能[i]:显示(x,y,self.鼠标)
		   	    if self.技能[i].焦点 and self.技能[i].技能 ~= nil then
		   	    	if mouseb(0) then
	   	    			self.选中技能 = i
	   	    		end
		   	    	tp.提示:技能(x,y,self.技能[i].技能)
		   	    end
				xx = xx + 1
				if xx > 3 then
					xx = 0
					yy = yy + 1
				end
			end
		else
			 for i=25,36 do
				local jx = self.x+20+(xx*41)
				local jy = self.y+35+(yy*41)
				self.资源组[8]:显示(jx,jy)
			    self.技能[i]:置坐标(jx+3,jy+2)
		   	    self.技能[i]:显示(x,y,self.鼠标)
		   	    if self.技能[i].焦点 and self.技能[i].技能 ~= nil then
		   	    	if mouseb(0) then
		   	    		self.选中技能 = i
		   	    	end
		   	    	tp.提示:技能(x,y,self.技能[i].技能)
		   	    end
				xx = xx + 1
				if xx > 3 then
					xx = 0
					yy = yy + 1
				end
			end
		end
	end
	if self.选中技能 ~= 0 then
		zts:显示(self.x+15,self.y+177,"认证："..self.技能[self.选中技能].技能.名称)
	end
end

function 场景类_法术认证:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_法术认证:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if  self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_法术认证:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_法术认证