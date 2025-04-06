-- @Author: baidwwy
-- @Date:   2024-10-20 02:54:35
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-22 06:50:04
-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:52
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:53
--======================================================================--
local 学习辅助技能 = class()
local mousea = 引擎.鼠标弹起
local tp,zts
local insert = table.insert
function 学习辅助技能:初始化(根)
	self.ID = 146
	self.x = 175
	self.y = 83
	self.xx = 0
	self.yy = 0
	self.注释 = "帮派技能学习"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = 0
	tp = 根
	self.窗口时间 = 0
	self.介绍文本 = 根._丰富文本(400,100,根.字体表.普通字体)
	zts = tp.字体表.普通字体
end

function 学习辅助技能:打开(银子,储备,bpjn)
	if self.可视 then
		self.介绍文本:清空()
		self.辅助技能 = nil
		self.生活选中=0
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.帮派技能=bpjn
		self.辅助技能 = {}
		local jn = tp._技能格子
		for i=1,18 do
		    self.辅助技能[i] = jn(0,0,i,"辅助技能")
		end
		local rw = tp.队伍[1]
		-- print(#rw.辅助技能)
		for i=1,#rw.辅助技能 do
			self.辅助技能[i]:置技能(rw.辅助技能[i])
			local 临时消耗=生活技能消耗(self.辅助技能[i].技能.等级+1)
			self.辅助技能[i].技能.原介绍=self.辅助技能[i].技能.介绍
		    self.辅助技能[i].技能.介绍=self.辅助技能[i].技能.介绍
		end
		self.生活选中=0
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 学习辅助技能:加载资源()
	if self.资源组==nil then
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应= tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,505,450,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
			[3] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"学 习"),
			[4] = 自适应.创建(3,1,1,1,1,3),
			[5] = 自适应.创建(78,1,463,77,3,9),
		}
		for n=2,3 do
			self.资源组[n]:绑定窗口_(146)
		end
		self.消耗={"可  用  经  验","学习所需经验","可  用  现  金","学习所需现金","储    备    金","学习所需帮贡"}
	end
	self.资源组[3]:置偏移(10,0)

end

function 学习辅助技能:更新技能(dj)
	if self.生活选中~=0 then
		self.辅助技能[self.生活选中].技能.等级=dj
	end
end

function 学习辅助技能:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.生活选中 ~= 0)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"帮派技能学习")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	self.资源组[4]:置宽高1(66,19)
	for i=1,3 do
		for n=1,7 do
			tp.技能格子背景_:显示(self.x+22+(n-1)*70,self.y+30+(i-1)*76)
			self.资源组[4]:显示(self.x+10+(n-1)*70,self.y+30+48+(i-1)*76)
		end
	end
	self.资源组[5]:显示(self.x+19,self.y+258)
	zts:置颜色(白色)
	local xx=0
	local yy=0
	self.资源组[4]:置宽高1(108,19)
	for i=1,6 do
		zts:显示(self.x+27+xx*237,self.y+346+yy*24,self.消耗[i])
		self.资源组[4]:显示(self.x+135+xx*225,self.y+342+yy*24)
		xx=xx+1
		if xx==2 then
		    xx=0
		    yy=yy+1
		end
	end
	local x2 = 0
	local y2 = 0
	zts:置颜色(黑色)
	for i=1,18 do
		local jx=self.x+23+(x2*70)
		local jy=self.y+32+(y2*76)
		if self.辅助技能[i].技能~=nil then
			self.辅助技能[i]:置坐标(jx,jy)
			self.辅助技能[i]:显示(x,y,true or self.鼠标)
			zts:显示(jx+3,jy+50,self.辅助技能[i].技能.等级.."/"..self.帮派技能[self.辅助技能[i].技能.名称].当前)
			if self.辅助技能[i].焦点 then
				tp.提示:技能(x,y,self.辅助技能[i].技能)
				if self.辅助技能[i].事件 then
					self.生活选中=i
				end
			end
			if self.生活选中~=0 and self.生活选中==i then
			    tp.物品格子确定_:显示(jx-2,jy-3)
			    self.介绍文本:清空()
				self.介绍文本:添加文本("#K"..self.辅助技能[i].技能.名称)
				self.介绍文本:添加文本("#N/【介绍】"..self.辅助技能[i].技能.介绍)
				local 临时消耗=生活技能消耗(self.辅助技能[i].技能.等级+1,self.辅助技能[i].技能.名称)
				zts:显示(self.x+147,self.y+346+0*24,tp.队伍[1].当前经验)
				zts:显示(self.x+147,self.y+346+1*24,tp.金钱)
				zts:显示(self.x+147,self.y+346+2*24,tp.储备)
				zts:显示(self.x+372,self.y+346+0*24,临时消耗.经验)
				zts:显示(self.x+372,self.y+346+1*24,临时消耗.金钱)
				zts:显示(self.x+372,self.y+346+2*24,临时消耗.帮贡.." / "..临时消耗.需求)
			end
			x2 = x2 + 1
			if x2 > 6 then
				x2 = 0
				y2 = y2 + 1
			end
		end
	end
	self.介绍文本:显示(self.x+44,self.y+269)
	self.资源组[3]:显示(self.x+213,self.y+420)
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[3]:事件判断() then
		if self.生活选中~=0 then
            发送数据(45,{序列=self.生活选中})
       	end
	end
end

function 学习辅助技能:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 学习辅助技能:初始移动(x,y)
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

function 学习辅助技能:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 学习辅助技能