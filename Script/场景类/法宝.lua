-- @Author: 小神QQ190909219
-- @Date:   2023-08-31 22:54:45
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-10 09:23:44
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-12-31 16:27:24
--======================================================================--
local 场景类_法宝 = class()

local floor = math.floor
local tp,zts1,zts
local insert = table.insert
local min = math.min
local max = math.max
local ceil = math.ceil
local mousea = 引擎.鼠标弹起


function 场景类_法宝:初始化(根)
	self.ID = 36
	self.x = 209
	self.y = 114
	self.xx = 0
	self.yy = 0
	self.注释 = "锦衣"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 资源:载入('aaa.wdf',"网易WDF动画",0x1F73D091), -- 背景
		[2] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x81DD40D3),0,0,3,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"使用"),
		[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"修炼"),
--		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"补充灵气"),
		[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"法宝"),
		[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"神器"),
		[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"灵宝"),
		[9] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"装备"),
		[10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"修复"),
		[11] = 按钮.创建(自适应.创建(17,4,80,22,1,3),0,0,4,true,true,"  道具"),
		[12] = 按钮.创建(自适应.创建(17,4,80,22,1,3),0,0,4,true,true,"  行囊"),
		[13] = 按钮.创建(自适应.创建(17,4,30,22,1,3),0,0,4,true,true,"1"),
		[14] = 按钮.创建(自适应.创建(17,4,30,22,1,3),0,0,4,true,true,"2"),
		[15] = 按钮.创建(自适应.创建(17,4,30,22,1,3),0,0,4,true,true,"3"),
		[16] = 按钮.创建(自适应.创建(17,4,30,22,1,3),0,0,4,true,true,"看"),
		-- [17] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
		-- [18] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
		[19] =  根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,179,2),
		[20] = 资源:载入('aaa.wdf',"网易WDF动画",0x1F73D097),
		[21] = 资源:载入('aaa.wdf',"网易WDF动画",0x1F73D096),
	}
	for i=13,15 do
		self.资源组[i]:置偏移(3,0)
	end
	self.资源组[16]:置偏移(2,0)
	self.资源组[11]:置偏移(5,0)
	self.资源组[12]:置偏移(5,0)
	self.物品格子背景 = 自适应.创建(34,1,272,212,3,9)
	for n=2,16 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	for n=2,10 do
		if n ~= 5 then self.资源组[n]:置偏移(13,0) end
	end

	self.物品 = {}
	self.法宝佩戴 = {}
	self.灵宝佩戴 = {}
	self.灵宝物品 = {}
	local 格子 = 根._物品格子
	for i=1,4 do
		self.法宝佩戴[i] = 格子.创建(0,0,i,"法宝佩戴_法宝")
	end
	for i=1,2 do
		self.灵宝佩戴[i] = 格子.创建(0,0,i,"法宝佩戴_灵宝")
	end
	for i=1,100 do
		self.物品[i] = 格子(0,0,i,"法宝背包_法宝")
	end
	for i=1,20 do
		self.灵宝物品[i] = 格子(0,0,i,"法宝背包_灵宝")
	end
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.窗口时间 = 0
	self.开始 = 1
	self.结束 = 100
	self.加入 = 0
end

function 场景类_法宝:打开(x,y)
	if self.可视 then
		for i=1,100 do
			self.物品[i]:置物品(nil)
		end
		self.资源组[19]:置起始点(0)
		self.加入 = 0
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.开始 = 1
		self.结束 = 100
		self.加入 = 0
		self.点击类型="法宝"
		self.选择类型="法宝"
		self.法宝选中=0
		self.灵宝选中=0
		self.法宝数量 = 0
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_法宝:刷新()
	for q=self.开始,self.结束 do
		self.物品[q]:置物品(tp.法宝列表[q])
		if self.物品[q].物品 ~= nil then
		    self.法宝数量 = self.法宝数量 + 1
		end

	end
	self.法宝选中=0
	for i=1,4 do
		self.法宝佩戴[i]:置物品(tp.法宝佩戴[i])
	end
	for q=1,20 do
		self.灵宝物品[q]:置物品(tp.灵宝列表[q])
	end
	self.灵宝选中=0
	for i=1,2 do
		self.灵宝佩戴[i]:置物品(tp.灵宝佩戴[i])
	end
end
function 场景类_法宝:更新法宝经验(数据)
	if self.物品[数据.id]~=nil and self.物品[数据.id].物品~=nil then
		self.物品[数据.id].物品.当前经验=数据.当前经验
		self.物品[数据.id].物品.升级经验=数据.升级经验
		self.物品[数据.id].物品.气血=数据.境界
		self.物品[数据.id].物品.魔法=数据.灵气
	end
end

function 场景类_法宝:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[6]:更新(x,y,self.选择类型~="法宝")
	self.资源组[7]:更新(x,y,self.选择类型~="神器")
	self.资源组[8]:更新(x,y,self.选择类型~="灵宝")
	self.资源组[13]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.资源组[16]:更新(x,y)

	if self.资源组[6]:事件判断() then
		self.法宝选中 = 0
		self.灵宝选中 = 0
		self.选择类型 ="法宝"
	elseif self.资源组[7]:事件判断() then
		self.法宝选中 = 0
		self.灵宝选中 = 0
		self.点击类型 ="神器"
		self.选择类型 ="神器"
	elseif self.资源组[8]:事件判断() then
		self.法宝选中 = 0
		self.灵宝选中 = 0
		self.点击类型="灵宝"
		self.选择类型 ="灵宝"
	elseif self.资源组[2]:事件判断() then
		self:打开()
	end

	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+519,self.y+10)
	-- tp.窗口标题背景_:置区域(0,0,40,20)
	-- tp.窗口标题背景_:显示(self.x+237,self.y+1)
	zts1:置字间距(3)
	zts1:显示(self.x+251,self.y+14,"法宝")
	zts1:置字间距(0)
	self.资源组[6]:显示(self.x+265,self.y+32+15,nil,nil,nil,self.选择类型=="法宝",2)
	self.资源组[7]:显示(self.x+265+88,self.y+32+15,nil,nil,nil,self.选择类型=="神器",2)
	self.资源组[8]:显示(self.x+265+88*2,self.y+32+15,nil,nil,nil,self.选择类型=="灵宝",2)
	self.资源组[13]:显示(self.x+92,self.y+32+15)
	self.资源组[14]:显示(self.x+92+36,self.y+32+15)
	self.资源组[15]:显示(self.x+92+36*2,self.y+32+15)
	self.资源组[16]:显示(self.x+92+36*3,self.y+32+15)
	zts:显示(self.x+17,self.y+33+18,"已装备法宝")
	for h=1,4 do
		self.资源组[20]:显示(self.x+14+(h*58-58),self.y+62+15)
		self.法宝佩戴[h]:置坐标(self.x+16+(h*58-58),self.y+62+15)
		self.法宝佩戴[h]:显示(dt,x,y,self.鼠标)
		 if self.法宝佩戴[h].焦点 and not tp.消息栏焦点 then
			if self.法宝佩戴[h].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.法宝佩戴[h].物品)
			end
			if 引擎.鼠标弹起(右键) and self.选择类型 =="法宝" then
				发送数据(3734,{序列=h})
			elseif tp.场景.抓取物品ID~=nil and 引擎.鼠标弹起(左键) and self.选择类型 =="法宝" then
				发送数据(3735,{序列=tp.场景.抓取物品ID,序列1=h})
				 tp.场景.抓取物品 = nil
				 tp.场景.抓取物品ID = nil
				 tp.场景.抓取物品注释 = nil
				 self.物品[self.法宝选中].确定=false
				 self.物品[self.法宝选中]:置物品(tp.法宝列表[self.法宝选中])
			end
		end
	end
	if self.选择类型 =="法宝" then
		self.物品格子背景:显示(self.x+260-4,self.y+75-11+15)
		for h=1,4 do
			for l=1,5 do
				self.资源组[20]:显示(l * 51+ self.x+260-53,h * 51+ self.y+68-51+15) --物品单格子
			end
		end

		zts:置颜色(0xFFFFFFFF)
		self.资源组[3]:更新(x,y,not(self.法宝选中==0),2)
		self.资源组[4]:更新(x,y,not(self.法宝选中==0),2)
		self.资源组[5]:更新(x,y,not(self.法宝选中==0),2)
		self.资源组[11]:更新(x,y)
		self.资源组[12]:更新(x,y)
		-- self.资源组[17]:更新(x,y,self.加入 > 1)
		-- self.资源组[18]:更新(x,y,self.加入 < self.结束 - 20)

		if self.资源组[3]:事件判断() then
			if self.法宝选中==0 then
				tp.常规提示:打开("#Y/请先选中要使用的法宝")
				return
			elseif self.物品[self.法宝选中]~=nil and self.物品[self.法宝选中].物品~=nil then
				发送数据(3736,{序列=self.法宝选中})
			end
		elseif self.资源组[4]:事件判断() then
			if self.法宝选中==0 then
				tp.常规提示:打开("#Y/请先选中要修炼的法宝")
				return
			elseif self.物品[self.法宝选中]~=nil and self.物品[self.法宝选中].物品~=nil and self.物品[self.法宝选中].物品.当前经验~=nil then
				发送数据(3733,{序列=self.法宝选中})
			else
				tp.常规提示:打开("#Y/你没有这样的法宝")
			end
		elseif self.资源组[5]:事件判断() then--补充灵气
			if self.法宝选中==0 then
				tp.常规提示:打开("#Y/请先选中要补充灵气的法宝")
				return
			elseif self.物品[self.法宝选中]~=nil and self.物品[self.法宝选中].物品~=nil and self.物品[self.法宝选中].物品.当前经验~=nil then
				发送数据(3733.1,{序列=self.法宝选中})
			else
				tp.常规提示:打开("#Y/你没有这样的法宝")
			end
		elseif self.资源组[11]:事件判断() and  tp.场景.抓取物品 and tp.场景.抓取物品ID == self.法宝选中 and tp.场景.抓取物品注释  == "法宝背包_法宝" then
			发送数据(3746,{序列=self.法宝选中,放置类型="道具",抓取类型="法宝",})
			tp.场景.抓取物品 = nil
			tp.场景.抓取物品ID = nil
			tp.场景.抓取物品注释 = nil
		elseif self.资源组[12]:事件判断() and  tp.场景.抓取物品 and tp.场景.抓取物品ID == self.法宝选中 and tp.场景.抓取物品注释  == "法宝背包_法宝" then
			发送数据(3746,{序列=self.法宝选中,放置类型="行囊",抓取类型="法宝",})
			tp.场景.抓取物品 = nil
			tp.场景.抓取物品ID = nil
			tp.场景.抓取物品注释 = nil
		end
		self.资源组[3]:显示(self.x+18,self.y+289+15)
		self.资源组[4]:显示(self.x+18+77,self.y+289+15)
		self.资源组[5]:显示(self.x+18+77*2,self.y+289+15)
		self.资源组[11]:显示(self.x+356,self.y+289+15)
		self.资源组[12]:显示(self.x+450,self.y+289+15)
		self.资源组[21]:显示(self.x+80,self.y+158+15)
		self.资源组[21]:显示(self.x+80,self.y+158+40+15)
		self.资源组[21]:显示(self.x+80,self.y+158+40*2+15)
		-- self.资源组[17]:显示(self.x+517,self.y+68)
		-- self.资源组[18]:显示(self.x+517,self.y+260)
		zts:显示(self.x+19,self.y+159+20,"法宝名称")
		zts:显示(self.x+19,self.y+159+40+20,"升级经验")
		zts:显示(self.x+19,self.y+159+40*2+20,"修炼经验")
		zts:显示(self.x+261,self.y+292+16,"把法宝移动至")
		self.加入 = min(ceil((self.结束-20)*self.资源组[19]:取百分比()),self.结束-25)
		-- if self.资源组[17]:事件判断() then--上滚动
		-- 	self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.加入-5,20,self.结束))
		-- elseif self.资源组[18]:事件判断() then--下滚动
		-- 	self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.加入+5,20,self.结束))
		-- if self.资源组[1]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
		-- 	self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.加入-5,20,self.结束))
		-- elseif self.资源组[1]:是否选中(x,y)  and 引擎.取鼠标滚轮() ==-1 and self.加入 < self.结束 - 25 then--鼠标下滚动
		-- 	self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.加入+5,20,self.结束))
		-- end
		self.资源组[19]:显示(self.x+518,self.y+82,x,y,self.鼠标)
		zts:置颜色(0xFFFFFF00)
		zts:显示(self.x+259,self.y+320+16,"左键抓取，右键确定")
		zts:置颜色(绿色):显示(self.x+452,self.y+320+16,"法宝总数："..self.法宝数量)
		--zts:显示(self.x+440,self.y+320,"法宝总数："..#tp.法宝列表 )
		local o = self.开始-1
		if self.法宝选中~=0 then
			if self.物品[self.法宝选中]~=nil and self.物品[self.法宝选中].物品~=nil and self.物品[self.法宝选中].物品.当前经验~=nil then
			   zts:置颜色(白色)
			   zts:显示(self.x+92,self.y+162+17,self.物品[self.法宝选中].物品.名称)
			   zts:显示(self.x+92,self.y+162+40+17,self.物品[self.法宝选中].物品.升级经验)
			   zts:显示(self.x+92,self.y+162+40*2+17,self.物品[self.法宝选中].物品.当前经验)
			end
		end
		for h=1,4 do
			for l=1,5 do
				o = o + 1
				self.物品[o+self.加入]:置坐标(l * 51+ self.x+260-51,h * 51+ self.y+68-51+15)
				self.物品[o+self.加入]:显示(dt,x,y,self.鼠标)
				if self.物品[o+self.加入].焦点 and not tp.消息栏焦点 then
					if self.物品[o+self.加入].物品 ~= nil then
						tp.提示:道具行囊(x,y,self.物品[o+self.加入].物品)
					end
					self.焦点 = true
				end
				if tp.场景.地图.抓取物品 == nil and self.物品[o+self.加入].焦点 and self.物品[o+self.加入].物品 ~= nil  then
					if mousea(1) then
						if self.物品[self.法宝选中]~=nil then
						  self.物品[self.法宝选中].选中=nil
						end
						if self.法宝选中~=o+self.加入 then
						 self.法宝选中=o+self.加入
						 self.物品[o+self.加入].选中=true
						end
					end
				end
				if self.物品[o+self.加入].事件 then
					if tp.场景.抓取物品 == nil and self.物品[o+self.加入].物品 ~= nil and 引擎.鼠标弹起(0x00) then
						self.法宝选中=o+self.加入
						tp.场景.抓取物品 = self.物品[o+self.加入].物品
						tp.场景.抓取物品ID = o+self.加入
						tp.场景.抓取物品注释 = self.物品[o+self.加入].注释
						self.物品[tp.场景.抓取物品ID].确定 = true
						self.物品[o+self.加入]:置物品(nil)
						self.抓取类型=self.点击类型
					elseif tp.场景.抓取物品 ~= nil and self.物品[o+self.加入].物品 == nil and tp.场景.抓取物品ID ~= o+self.加入 and tp.场景.抓取物品注释 == "法宝背包_法宝" then
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o+self.加入,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.物品[o+self.加入].物品 ~= nil and tp.场景.抓取物品注释 == "法宝背包_法宝"  then
						local jy = self.物品[o].物品
						local jy1 = tp.场景.抓取物品
						local jy2 = tp.场景.抓取物品ID
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o+self.加入,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.物品[o+self.加入].物品 == nil and tp.场景.抓取物品ID == o+self.加入 and tp.场景.抓取物品注释 == "法宝背包_法宝" then
						self.物品[tp.场景.抓取物品ID]:置物品(tp.场景.抓取物品)
						self.物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					end
				end
			end
		end
	elseif self.选择类型 =="灵宝" then
		zts:置颜色(0xFFFFFFFF)
		self.资源组[4]:更新(x,y,not(self.灵宝选中==0),2)
		self.资源组[5]:更新(x,y,not(self.灵宝选中==0),2)
		self.资源组[4]:显示(self.x+18,self.y+317)
		self.资源组[5]:显示(self.x+175,self.y+317)
		self.资源组[21]:显示(self.x+80,self.y+230)
		self.资源组[21]:显示(self.x+80,self.y+230+32)
		self.资源组[21]:显示(self.x+80,self.y+230+32*2)
		zts:显示(self.x+19,self.y+128,"已装备灵宝")
		zts:显示(self.x+19,self.y+231,"灵宝名称")
		zts:显示(self.x+19,self.y+231+32,"升级经验")
		zts:显示(self.x+19,self.y+231+32*2,"修炼经验")
		zts:置颜色(0xFFFFFF00)
		zts:显示(self.x+259,self.y+320,"左键抓取，右键确定")
		zts:置颜色(0xFF00FF00)
		--zts:显示(self.x+440,self.y+320,"灵宝总数："..#tp.灵宝列表)
		if self.资源组[4]:事件判断() then
			if self.灵宝选中==0 then
				tp.常规提示:打开("#Y/请先选中要修炼的法宝")
				return
			elseif self.灵宝物品[self.灵宝选中]~=nil and self.灵宝物品[self.灵宝选中].物品~=nil and self.灵宝物品[self.灵宝选中].物品.当前经验~=nil then
				发送数据(3752,{序列=self.灵宝选中})
			else
				tp.常规提示:打开("#Y/你没有这样的法宝")
			end
		end
		if self.灵宝选中~=0 then
			if self.灵宝物品[self.灵宝选中]~=nil and self.灵宝物品[self.灵宝选中].物品~=nil and self.灵宝物品[self.灵宝选中].物品.当前经验~=nil then
			   zts:置颜色(-16777216)
			   zts:显示(self.x+92,self.y+234,self.灵宝物品[self.灵宝选中].物品.名称)
			   zts:显示(self.x+92,self.y+234+32,self.灵宝物品[self.灵宝选中].物品.升级经验)
			   zts:显示(self.x+92,self.y+234+32*2,self.灵宝物品[self.灵宝选中].物品.当前经验)
			end
		end
		for h=1,4 do
			for l=1,5 do
				self.资源组[20]:显示(l * 51+ self.x+260-51,h * 51+ self.y+68-51)
			end
		end
		for h=1,2 do
			self.资源组[20]:显示(self.x+16+(h*58-58),self.y+149)
			self.灵宝佩戴[h]:置坐标(self.x+16+(h*58-58),self.y+149)
			self.灵宝佩戴[h]:显示(dt,x,y,self.鼠标)
			 if self.灵宝佩戴[h].焦点 and not tp.消息栏焦点 then
				if self.灵宝佩戴[h].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.灵宝佩戴[h].物品)
				end
				if 引擎.鼠标弹起(右键) and self.选择类型 =="灵宝" then
					发送数据(3753,{序列=h})
				elseif tp.场景.抓取物品ID~=nil and 引擎.鼠标弹起(左键) and self.选择类型 =="灵宝" then
					发送数据(3754,{序列=tp.场景.抓取物品ID,序列1=h})
					tp.场景.抓取物品 = nil
					tp.场景.抓取物品ID = nil
					tp.场景.抓取物品注释 = nil
					self.灵宝物品[self.灵宝选中].确定=false
					self.灵宝物品[self.灵宝选中]:置物品(tp.法宝列表[self.灵宝选中])
				end
			end
		end
		local o = 0
		for h=1,4 do
			for l=1,5 do
				o = o + 1
				self.灵宝物品[o+self.加入]:置坐标(l * 51+ self.x+260-51,h * 51+ self.y+68-51)
				self.灵宝物品[o+self.加入]:显示(dt,x,y,self.鼠标)
				if self.灵宝物品[o+self.加入].焦点 and not tp.消息栏焦点 then
					if self.灵宝物品[o+self.加入].物品 ~= nil then
						tp.提示:道具行囊(x,y,self.灵宝物品[o+self.加入].物品)
					end
					self.焦点 = true
				end
				if tp.场景.地图.抓取物品 == nil and self.灵宝物品[o+self.加入].焦点 and self.灵宝物品[o+self.加入].物品 ~= nil  then
					if mousea(1) then
						if self.灵宝物品[self.灵宝选中]~=nil then
						  	self.灵宝物品[self.灵宝选中].选中=nil
						end
						if self.灵宝选中~=o+self.加入 then
						 	self.灵宝选中=o+self.加入
						 	self.灵宝物品[o+self.加入].选中=true
						end
					end
				end
				if self.灵宝物品[o+self.加入].事件 then
					if tp.场景.抓取物品 == nil and self.灵宝物品[o+self.加入].物品 ~= nil and 引擎.鼠标弹起(0x00) then
						self.灵宝选中=o+self.加入
						tp.场景.抓取物品 = self.灵宝物品[o+self.加入].物品
						tp.场景.抓取物品ID = o+self.加入
						tp.场景.抓取物品注释 = self.灵宝物品[o+self.加入].注释
						self.灵宝物品[tp.场景.抓取物品ID].确定 = true
						self.灵宝物品[o+self.加入]:置物品(nil)
						self.抓取类型=self.点击类型
					elseif tp.场景.抓取物品 ~= nil and self.灵宝物品[o+self.加入].物品 == nil and tp.场景.抓取物品ID ~= o+self.加入 and tp.场景.抓取物品注释 == "法宝背包_灵宝" then
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o+self.加入,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.灵宝物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.灵宝物品[o+self.加入].物品 ~= nil and tp.场景.抓取物品注释 == "法宝背包_灵宝"  then
						local jy = self.灵宝物品[o].物品
						local jy1 = tp.场景.抓取物品
						local jy2 = tp.场景.抓取物品ID
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o+self.加入,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.灵宝物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.灵宝物品[o+self.加入].物品 == nil and tp.场景.抓取物品ID == o+self.加入 and tp.场景.抓取物品注释 == "法宝背包_灵宝" then
						self.灵宝物品[tp.场景.抓取物品ID]:置物品(tp.场景.抓取物品)
						self.灵宝物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					end
				end
			end
		end
	elseif self.选择类型 =="神器" then

	end
end

function 场景类_法宝:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_法宝:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
		self.窗口时间 = tp.运行时间
	end
	if not self.焦点 and self.资源组[19]:是否选中(x,y) == false then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_法宝:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_法宝