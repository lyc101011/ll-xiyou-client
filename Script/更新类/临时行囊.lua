-- @Author: baidwwy
-- @Date:   2024-01-28 11:40:16
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-14 12:37:28
local 临时行囊 = class()
local tp
local zts1,zts
local wz = require("gge文字类")
function 临时行囊:初始化(根)
	tp = 根
  self.ID = 2017
  self.x = 145+(全局游戏宽度-800)/2
  self.y = 50
	self.xx = 0
	self.yy = 0
	self.注释 = "临时行囊"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	self.页数=0
	self.模式=0
	self.选中=0
end

function 临时行囊:加载()
  local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	zts = wz.创建("wdf/font/hyh1gjm.ttf",15,false,false,true)
	zts1 = wz.创建("wdf/font/hyh1gjm.ttf",14,false,false,true)
	self.资源组 = {
   --[1] = tp._自适应(99,1,500,455,3,9),
   [1] = 自适应.创建(0,1,500,485,3,9),
   [2]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"一键整理"),
   [3]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"杂货道具"),
   [4]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"宝石灵石"),
   [5]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"普通兽诀"),
   [6]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"高级兽诀"),
   [7]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"特殊兽诀"),
   [8]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"打造材料"),
   [9]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"装备道具"),
   [10]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"自动存仓"),
   [11]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"上一页"),
   [12]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"下一页"),
   [13]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"一键存入"),
  [14]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"一键出售"),
  [15]=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"自动出售"),
   [20] = 资源:载入("pic/格子.png","图片"),
     }
     self.物品 = {}
	 local 格子 = tp._物品格子
	 	for i=1,300 do
		self.物品[i] = 格子(0,0,i,"道具小窗口")
	end
	self.类型 = 1
end

function 临时行囊:打开(数据)
	if self.可视 then
		self.可视=false
		self.资源组=nil
		self.类型 = 1
		self.页数=0
		self.模式=0
	else
	table.insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self:加载()
	    self.可视=true
		self.数据 = 数据
		self.类型 = 数据.类型
        for i=1,300 do
		if self.数据[i] ~= nil then
		self.物品[i]:置物品(self.数据[i])
		self.模式=i
		end
		end
	end
end
function 临时行囊:刷新(数据)
self.数据 = 数据
if self.类型 ~= 数据.类型 then
self.页数=0
self.模式=0
end
self.类型 = 数据.类型
for i=1,300 do
self.物品[i]:置物品(nil)
end
for i=1,300 do
	if self.数据[i] ~= nil then
		self.物品[i]:置物品(self.数据[i])
		self.模式=i
		-- if self.物品[i].物品~=nil then
		-- 	print(i,"================65454")
		-- end
	end
	end
end
function 临时行囊:显示(dt,x,y)
	self.焦点=false
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x+self.资源组[1].宽度/2-90,self.y)
    zts1:置颜色(0xFFFFFFFF):显示(self.x+195,self.y+3,"  超 级 仓 房")
	self.资源组[2]:更新(x,y)
	self.资源组[2]:显示(self.x+20,self.y+426)
	self.资源组[10]:更新(x,y)
	self.资源组[13]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.资源组[11]:更新(x,y,self.页数>0)
	self.资源组[12]:更新(x,y,math.floor(self.模式/63) > self.页数)
	self.资源组[10]:显示(self.x+110,self.y+426)
	self.资源组[11]:显示(self.x+210,self.y+426)
	self.资源组[12]:显示(self.x+310,self.y+426)
	self.资源组[13]:显示(self.x+410,self.y+426)
	-- self.资源组[14]:显示(self.x+410,self.y+426+30)
	-- self.资源组[15]:显示(self.x+410-100,self.y+426+30)
	for n=11,12 do
		self.资源组[n]:置偏移(5,-1)
	end
	for n =3,9 do
	self.资源组[n]:更新(x,y,self.类型+2~=n)
	self.资源组[n]:显示(self.x+4+70*(n-3),self.y+24)
	end
			local xx = 0
			local yy = 0
			local qs = 1 + self.页数 * 63
            local js = 63 + self.页数 * 63
            if js > 1000 then
                 js = 1000
            end
			for i=qs,js do
				local jx = xx * 52 + 15
				local jy = yy * 52 + 37 + 17
				self.资源组[20]:显示(self.x + jx,self.y + jy)
				self.物品[i]:置坐标(self.x + jx,self.y + jy)
				self.物品[i]:显示(dt,x,y,self.鼠标)
				xx = xx + 1
				if xx == 9 then
					xx = 0
					yy = yy + 1
				end
			if self.物品[i].焦点 and self.物品[i].物品 ~= nil then
			    tp.提示:道具行囊(x,y,self.物品[i].物品)
			 if self.物品[i].右键 and not tp.消息栏焦点 then
			   发送数据(3833,{序列=self.类型,物品=i})
			end
   end
end
	if self.资源组[2]:事件判断()  then
		发送数据(3835,{序列=self.类型})
	elseif self.资源组[10]:事件判断()  then
		发送数据(3836,{序列=self.类型})
	elseif self.资源组[11]:事件判断()  then
		self.页数 = self.页数 - 1
	elseif self.资源组[12]:事件判断()  then
		self.页数 = self.页数 + 1
	elseif self.资源组[13]:事件判断()  then
		发送数据(3834)
	elseif self.资源组[14]:事件判断()  then
		发送数据(3837,{序列=self.类型})
  elseif self.资源组[15]:事件判断()  then
		发送数据(3838)
	elseif self.资源组[3]:事件判断()  then
		发送数据(3832,{序列=1})
	elseif self.资源组[4]:事件判断()  then
		发送数据(3832,{序列=2})
	elseif self.资源组[5]:事件判断()  then
		发送数据(3832,{序列=3})
	elseif self.资源组[6]:事件判断()  then
		发送数据(3832,{序列=4})
	elseif self.资源组[7]:事件判断()  then
		发送数据(3832,{序列=5})
	elseif self.资源组[8]:事件判断()  then
		发送数据(3832,{序列=6})
	elseif self.资源组[9]:事件判断()  then
		发送数据(3832,{序列=7})
    end
end

function 临时行囊:初始移动(x,y)
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

function 临时行囊:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end
function 临时行囊:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

return 临时行囊