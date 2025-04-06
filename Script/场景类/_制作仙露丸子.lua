-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:33
local 制作仙露丸子 = class()
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local tp,lsdh

function 制作仙露丸子:初始化(根)
 	self.ID = 180
	self.x = 158
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "制作仙露丸子"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
end

function 制作仙露丸子:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('制作仙露丸子.png',"图片"),--要复制素材文件
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确认制作"),
	}
	self.资源组[2]:绑定窗口_(self.ID)
	self.资源组[3]:绑定窗口_(self.ID)
	lsdh = tp.字体表.普通字体
	self.体力=tp.队伍[1].体力 or 0
	self.物品={}
	self.材料={}
	self.材料坐标={}
	for i=1,20 do
		self.物品[i] = tp._物品格子.创建(0,0,i,"背包_物品")
	end
	for i=1,2 do
		self.材料[i] = tp._物品格子.创建(0,0,i,"合成材料")
	end
	self.材料坐标[1]={x=125,y=73}
	self.材料坐标[2]={x=37,y=73}
end

function 制作仙露丸子:打开(数据)
 	if self.可视 then
		self.可视 = false
		for i=1,20 do
			self.物品[i]:置物品(nil)
			if i<=2 then
		    	self.材料[i]:置物品(nil)
			end
		end
		self.物品=nil
		self.材料=nil
		self.资源组=nil
		self.体力=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.x = (全局游戏宽度/2)-246
		self.y = (全局游戏高度/2)-185
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		for q=1,20 do
			self.物品[q]:置根(tp)
			self.物品[q]:置物品(数据[q])
		end
		for q=1,2 do
			self.材料[q]:置根(tp)
			self.材料[q]:置物品(nil)
		end
	end
end

function 制作仙露丸子:刷新(数据)
	for q=1,20 do
		self.物品[q]:置根(tp)
		self.物品[q]:置物品(数据[q])
	end
	for n=1,2 do
		if self.材料[n] then
			self.材料[n]:置物品(nil)
		end
	end
	self.体力=tp.队伍[1].体力 or 0
end

function 制作仙露丸子:显示(dt,x,y)
	----------------------
	-- 素材位置调整()
	-- ax=AFCHX
	-- ay=AFCHY
	------------------------
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+452,self.y+3)
	self.资源组[3]:显示(self.x+67,self.y+217)
	lsdh:置颜色(黑色)
	lsdh:显示(self.x+87,self.y+165,"100")
	lsdh:显示(self.x+87,self.y+192,self.体力)
	local is = 0
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51+155 + self.x,h * 51 + self.y -19)
			if self.物品[is].物品 ~= nil then
			  self.物品[is]:显示(dt,x,y,self.鼠标,{0,0,self.物品[is].物品.总类==110 and (self.物品[is].物品.分类==1 or self.物品[is].物品.分类==2)},nil,nil,1)
			end
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 and not tp.消息栏焦点 then
				self.焦点 = true
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and  self.鼠标 then
				    if self.物品[is].物品.总类 == 110 then
				    	if self.物品[is].物品.分类==1 and self.材料[1].物品 == nil then
				    		self.材料[1]:置物品(self.物品[is].物品)
							self.材料[1].物品.格子 = is
							self.物品[is]:置物品(nil)
				    	elseif self.物品[is].物品.分类==2 and self.材料[2].物品 == nil then
				    		self.材料[2]:置物品(self.物品[is].物品)
							self.材料[2].物品.格子 = is
							self.物品[is]:置物品(nil)
				    	end
				    end
				end
			end
			for i=1,2 do
				if self.材料[i].物品 ~= nil then
					self.材料[i]:置坐标(self.x+self.材料坐标[i].x ,self.y+self.材料坐标[i].y)
					self.材料[i]:显示(dt,x,y,self.鼠标,false)
					if self.材料[i].焦点 then
						tp.提示:道具行囊(x,y,self.材料[i].物品)
						if mouseb(0) and self.鼠标 then
							self.物品[self.材料[i].物品.格子]:置物品(tp.道具列表[self.材料[i].物品.格子])
							刷新道具逻辑(tp.道具列表[self.材料[i].物品.格子],self.材料[i].物品.格子,true)
							self.材料[i]:置物品(nil)
						end
					end
				end
			end
		end
	end
	if self.资源组[3]:事件判断() then
		if self.材料[1]~=nil and self.材料[1].物品~=nil and self.材料[2]~=nil and self.材料[2].物品~=nil then
			发送数据(3900,{材料1=self.材料[1].物品.格子,材料2=self.材料[2].物品.格子})
		else
		   tp.常规提示:打开("#Y/请放入两种材料")
		end
	elseif self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	lsdh:置颜色(白色)
end

function 制作仙露丸子:初始移动(x,y)
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

function 制作仙露丸子:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy


	end
end
function 制作仙露丸子:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
return 制作仙露丸子