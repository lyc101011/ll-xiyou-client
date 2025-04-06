-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-13 16:34:19
local 场景类_梦幻指引 = class()
local floor = math.floor
local tp,ztszts1
local xxx = 0
local yyy = 0
local min = math.min
local max = math.max
local ceil = math.ceil
local max = 1
local insert = table.insert
local mouseb = 引擎.鼠标弹起

function 场景类_梦幻指引:初始化(根)
	self.ID = 34
	self.x = 107
	self.y = 85
	self.xx = 0
	self.yy = 0
	self.注释 = "梦幻指引"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 自适应 = 根._自适应
	local 按钮 = 根._按钮
	self.资源组 = {
		[1] = 资源:载入('org.rpk',"网易WDF动画",16777553),
		[2] = 自适应.创建(1,1,521,18,1,3,nil,18),
		[3] = 自适应.创建(2,1,495,345,3,9),
		[4] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x81DD40D3),0,0,3,true,true),
		[5] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777544),0,0,4,true,true,"节日活动"),
		[6] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777544),0,0,4,true,true,"日常任务"),
		[7] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x335CECBC),0,0,4,true,true),
		[8] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0xB7F2FF5E),0,0,4,true,true),
		[11] = 根._滑块(资源:载入('org.rpk',"网易WDF动画",16777568),4,14,215,2),
		[12] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777544),0,0,4,true,true,"挑战竞技"),
		[13] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777544),0,0,4,true,true,"副本任务"),
		-- [14] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777544),0,0,4,true,true,"节日活动"),
		[15] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x335CECBC),0,0,4,true,true),
		[16] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0xB7F2FF5E),0,0,4,true,true),
		[17] = 根._滑块(资源:载入('org.rpk',"网易WDF动画",16777568),4,14,215,2),
		[18] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x335CECBC),0,0,4,true,true),
		[19] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0xB7F2FF5E),0,0,4,true,true),
		[20] = 根._滑块(资源:载入('org.rpk',"网易WDF动画",16777568),4,14,215,2),
		[21] = 资源:载入('wzife.wd1',"网易WDF动画",0xE6490543),
		[22] = 资源:载入('wzife.wd1',"网易WDF动画",0x5FD1F401),
		[23] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777557),0,0,4,true,true),
		[24] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777552),0,0,4,true,true),
		[25] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777552),0,0,4,true,true),
		[26] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777552),0,0,4,true,true),
		[27] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777552),0,0,4,true,true),
		[28] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777556),0,0,4,true,true),
		[29] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777555),0,0,4,true,true),
		[30] =  按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777554),0,0,4,true,true),
		[31] =  资源:载入('common/wzife.wdf',"网易WDF动画",1429362074),
	}
	for i=4,8 do
	   self.资源组[i]:绑定窗口_(self.ID)
	end
	-- self.资源组[4]:置偏移(25,0)
	self.资源组[5]:置偏移(30,0)
	self.资源组[6]:置偏移(30,0)
	for i=12,13 do
		self.资源组[i]:置偏移(30,0)
	   self.资源组[i]:绑定窗口_(self.ID)
	end
	for i=15,20 do
	   self.资源组[i]:绑定窗口_(self.ID)
	end
	for i=23,30 do
	   self.资源组[i]:绑定窗口_(self.ID)
	end
	self.节日活动={}
	self.日常任务={}
	self.挑战竞技={}
	self.副本任务={}
	self.节日加入 = 0
	self.日常加入 = 0
	self.挑战加入 = 0
	self.副本加入 = 0
	self.节日选中 = 0
	self.日常选中 = 0
	self.挑战选中 = 0
	self.副本选中 = 0
	self.状态 = 1
	self.子类状态 = 1
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.活跃=0
	self.资源组[11]:置起始点(0)
end

function 场景类_梦幻指引:打开(sj)
	if self.可视 then
		self.可视 = false
		self.节日加入 = 0
		self.日常加入 = 0
		self.挑战加入 = 0
		self.副本加入 = 0
		self.节日选中 = 0
		self.日常选中 = 0
		self.挑战选中 = 0
		self.副本选中 = 0
		self.资源组[11]:置起始点(0)
		self.活跃=0
		self.节日活动={}
		self.日常任务={}
		self.挑战竞技={}
		self.副本任务={}
	else
		insert(tp.窗口_,self)

		-- for k,v in pairs(sj.指引) do
		-- 	local 临时编号 = 0
		-- 	for i,o in pairs(sj.指引[k]) do
		-- 		临时编号 = 临时编号+1
		-- 		self[k][临时编号]:置数据(sj.指引[k][i])
		-- 		self[k][临时编号].当前次数= sj.每日[k][i] or 0
		-- 	end
		-- end

		table.print(sj.指引)
		for k,v in pairs(sj.指引) do
			local 临时编号 = 0
			for i,o in pairs(sj.指引[k]) do
				临时编号 = 临时编号+1
				if not self[k][临时编号] then
					self[k][临时编号]=tp._每日格子(0,0,临时编号,k,tp)
				end
				self[k][临时编号]:置数据(sj.指引[k][i])
				-- self[k][临时编号].当前次数= sj.每日[k][i] or 0 --玩法指引报错
			end
		end

		self.状态 = 2
		self.加入 = 0
		self.子类状态 = 1
		self.活跃=sj.每日.活跃度.当前
		tp.运行时间 = tp.运行时间 + 1
	    	self.窗口时间 = tp.运行时间
	    	self.可视 = true
	end
end

function 场景类_梦幻指引:显示(dt,x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y,self.状态 ~= 1)
	self.资源组[6]:更新(x,y,self.状态 ~= 2)
	self.资源组[12]:更新(x,y,self.状态 ~= 3)
	self.资源组[13]:更新(x,y,self.状态 ~= 4)
	self.资源组[23]:更新(x,y)
	self.资源组[24]:更新(x,y,self.活跃>=10)
	self.资源组[25]:更新(x,y,self.活跃>=25)
	self.资源组[26]:更新(x,y,self.活跃>=40)
	self.资源组[27]:更新(x,y,self.活跃>=60)
	self.资源组[28]:更新(x,y)
	self.资源组[29]:更新(x,y)
	self.资源组[30]:更新(x,y)
	--self.资源组[14]:更新(x,y,self.状态 ~= 5)
	if self.资源组[4]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[5]:事件判断() then
		self.状态 = 1
		self.子类状态 = 1
	elseif self.资源组[6]:事件判断() then
		self.状态 = 2
		self.子类状态 = 1
	elseif self.资源组[12]:事件判断() then
		self.状态 = 3
		self.子类状态 = 1
	elseif self.资源组[13]:事件判断() then
		self.状态 = 4
		self.子类状态 = 1
	elseif self.资源组[24]:事件判断() then
		发送数据(81,{类型=1})
	elseif self.资源组[25]:事件判断() then
		发送数据(81,{类型=2})
	elseif self.资源组[26]:事件判断() then
		发送数据(81,{类型=3})
	elseif self.资源组[27]:事件判断() then
		发送数据(81,{类型=4})
	end
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	zts1:置字间距(2)
	zts1:置字间距(0)
	self.资源组[4]:显示(self.x+640,self.y-3)
	self.资源组[5]:显示(self.x+55,self.y+41,nil,nil,nil,self.状态 == 1,2)
	self.资源组[6]:显示(self.x+203,self.y+41,nil,nil,nil,self.状态 == 2,2)
	self.资源组[12]:显示(self.x+352,self.y+41,nil,nil,nil,self.状态 == 3,2)
	self.资源组[13]:显示(self.x+503,self.y+41,nil,nil,nil,self.状态 == 4,2)
	self.资源组[23]:显示(self.x+57-5,self.y+386)
	self.资源组[24]:显示(self.x+164-3,self.y+391,true)
	self.资源组[25]:显示(self.x+246-3,self.y+391,true)
	self.资源组[26]:显示(self.x+330-3,self.y+391,true)
	self.资源组[27]:显示(self.x+426-3,self.y+391,true)
	--self.资源组[28]:显示(self.x+470-5,self.y+388)
	self.资源组[29]:显示(self.x+557-5,self.y+389)
	self.资源组[30]:显示(self.x+609-5,self.y+389)
	self.资源组[31]:显示(self.x+65,self.y+346)
	self.资源组[31]:显示(self.x+342,self.y+346)
	if self.资源组[24]:是否选中(x,y) then
		tp.提示:自定义(x,y,"经验1000000，银子150000，金银锦盒x5")
	elseif self.资源组[25]:是否选中(x,y) then
		tp.提示:自定义(x,y,"经验1500000，银子200000，金银锦盒x10")
	elseif self.资源组[26]:是否选中(x,y) then
		tp.提示:自定义(x,y,"经验2000000，银子250000，修炼果x1")
	elseif self.资源组[27]:是否选中(x,y) then
		tp.提示:自定义(x,y,"经验3000000，银子300000，神兜兜x1")
	end

		tp.字体表.通用字体14:置颜色(绿色)
		tp.字体表.通用字体14:显示(self.x+450,self.y+395,"活跃度: "..self.活跃)

	--self.资源组[14]:显示(self.x+441,self.y+35,nil,nil,nil,self.状态 == 5,2)
	if self.状态==1 then
	  	zts:置颜色(4294967295)
		self.资源组[7]:更新(x,y,self.节日加入 > 0)
		self.资源组[8]:更新(x,y,self.节日加入 < #self.节日活动 - 6)
		self.资源组[7]:显示(self.x+626,self.y+75)
		self.资源组[8]:显示(self.x+626,self.y+307)
		if #self.节日活动 > 6 then
			self.节日加入 = min(ceil((#self.节日活动-6)*self.资源组[11]:取百分比()),#self.节日活动-6)
		end
		if self.资源组[7]:事件判断() then--上滚动
			self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.节日加入-1,6,#self.节日活动))
		elseif self.资源组[8]:事件判断() then--下滚动
			self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.节日加入+1,6,#self.节日活动))
		elseif(self.资源组[1]:是否选中(x,y) or self.资源组[7]:是否选中(x,y) or self.资源组[11]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.节日加入 > 0 then--鼠标上滚动
			self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.节日加入-1,6,#self.节日活动))
		elseif (self.资源组[1]:是否选中(x,y) or self.资源组[8]:是否选中(x,y) or self.资源组[11]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.节日加入 < #self.节日活动 - 6 then--鼠标下滚动
			self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.节日加入+1,6,#self.节日活动))
		end
		if #self.节日活动 > 6 then
			self.资源组[11]:显示(self.x+626,self.y+90,x,y,self.鼠标)
		end
		local xx = 0
		local yy = 0
		for i=1,6 do
			if self.节日活动[i+self.节日加入] ~= nil then
				self.节日活动[i+self.节日加入]:置坐标(self.x+59+(xx*285),self.y+84+(yy*81))
				self.节日活动[i+self.节日加入]:显示(x,y,self.鼠标)
				if self.节日活动[i+self.节日加入].焦点 then
				end
			end
			xx = xx + 1
			if xx > 1 then
				xx = 0
				yy = yy + 1
			end
		end
	elseif self.状态 == 2 then
		zts:置颜色(4294967295)
		self.资源组[7]:更新(x,y,self.日常加入 > 0)
		self.资源组[8]:更新(x,y,self.日常加入 < #self.日常任务 - 6)
		self.资源组[7]:显示(self.x+626,self.y+75)
		self.资源组[8]:显示(self.x+626,self.y+307)
		if #self.日常任务 > 6 then
			self.日常加入 = min(ceil((#self.日常任务-6)*self.资源组[11]:取百分比()),#self.日常任务-6)
		end
		if self.资源组[7]:事件判断() then--上滚动
			self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.日常加入-1,6,#self.日常任务))
		elseif self.资源组[8]:事件判断() then--下滚动
			self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.日常加入+1,6,#self.日常任务))
		elseif(self.资源组[1]:是否选中(x,y) or self.资源组[7]:是否选中(x,y) or self.资源组[11]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.日常加入 > 0 then--鼠标上滚动
			self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.日常加入-1,6,#self.日常任务))
		elseif (self.资源组[1]:是否选中(x,y) or self.资源组[8]:是否选中(x,y) or self.资源组[11]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.日常加入 < #self.日常任务 - 6 then--鼠标下滚动
			self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.日常加入+1,6,#self.日常任务))
		end
		if #self.日常任务 > 6 then
			self.资源组[11]:显示(self.x+626,self.y+90,x,y,self.鼠标)
		end
		local xx = 0
		local yy = 0
		for i=1,6 do
			if self.日常任务[i+self.日常加入] ~= nil then
				self.日常任务[i+self.日常加入]:置坐标(self.x+59+(xx*285),self.y+84+(yy*81))
				self.日常任务[i+self.日常加入]:显示(x,y,self.鼠标)
				if self.日常任务[i+self.日常加入].焦点 then
				end
			end
			xx = xx + 1
			if xx > 1 then
				xx = 0
				yy = yy + 1
			end
		end
	elseif self.状态 == 3 then
		zts:置颜色(4294967295)
		self.资源组[15]:更新(x,y,self.挑战加入 > 0)
		self.资源组[16]:更新(x,y,self.挑战加入 < #self.挑战竞技 - 6)
		self.资源组[15]:显示(self.x+626,self.y+75)
		self.资源组[16]:显示(self.x+626,self.y+307)
		if #self.挑战竞技 > 6 then
			self.挑战加入 = min(ceil((#self.挑战竞技-6)*self.资源组[17]:取百分比()),#self.挑战竞技-6)
		end
		if self.资源组[15]:事件判断() then--上滚动
			self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.挑战加入-1,6,#self.挑战竞技))
		elseif self.资源组[16]:事件判断() then--下滚动
			self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.挑战加入+1,6,#self.挑战竞技))
		elseif(self.资源组[1]:是否选中(x,y) or self.资源组[15]:是否选中(x,y) or self.资源组[17]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.挑战加入 > 0 then--鼠标上滚动
			self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.挑战加入-1,6,#self.挑战竞技))
		elseif (self.资源组[1]:是否选中(x,y) or self.资源组[16]:是否选中(x,y) or self.资源组[17]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.挑战加入 < #self.挑战竞技 - 6 then--鼠标下滚动
			self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.挑战加入+1,6,#self.挑战竞技))
		end
		if #self.挑战竞技 > 6 then
			self.资源组[17]:显示(self.x+626,self.y+90,x,y,self.鼠标)
		end
		local xx = 0
		local yy = 0
		for i=1,6 do
			if self.挑战竞技[i+self.挑战加入] ~= nil then
				self.挑战竞技[i+self.挑战加入]:置坐标(self.x+59+(xx*285),self.y+84+(yy*81))
				self.挑战竞技[i+self.挑战加入]:显示(x,y,self.鼠标)
			end
			xx = xx + 1
			if xx > 1 then
				xx = 0
				yy = yy + 1
			end
		end
	elseif self.状态 == 4 then
		zts:置颜色(4294967295)
		self.资源组[18]:更新(x,y,self.副本加入 > 0)
		self.资源组[19]:更新(x,y,self.副本加入 < #self.副本任务 - 6)
		self.资源组[18]:显示(self.x+626,self.y+75)
		self.资源组[19]:显示(self.x+626,self.y+307)
		if #self.副本任务 > 6 then
			self.副本加入 = min(ceil((#self.副本任务-6)*self.资源组[20]:取百分比()),#self.副本任务-6)
		end
		if self.资源组[18]:事件判断() then--上滚动
			self.资源组[20]:置起始点(self.资源组[20]:取百分比转换(self.副本加入-1,6,#self.副本任务))
		elseif self.资源组[19]:事件判断() then--下滚动
			self.资源组[20]:置起始点(self.资源组[20]:取百分比转换(self.副本加入+1,6,#self.副本任务))
		elseif(self.资源组[1]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) or self.资源组[20]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.副本加入 > 0 then--鼠标上滚动
			self.资源组[20]:置起始点(self.资源组[20]:取百分比转换(self.副本加入-1,6,#self.副本任务))
		elseif (self.资源组[1]:是否选中(x,y) or self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.副本加入 < #self.副本任务 - 6 then--鼠标下滚动
			self.资源组[20]:置起始点(self.资源组[20]:取百分比转换(self.副本加入+1,6,#self.副本任务))
		end
		if #self.副本任务 > 6 then
			self.资源组[20]:显示(self.x+626,self.y+90,x,y,self.鼠标)
		end
		local xx = 0
		local yy = 0
		for i=1,6 do
			if self.副本任务[i+self.副本加入] ~= nil then
				self.副本任务[i+self.副本加入]:置坐标(self.x+59+(xx*285),self.y+84+(yy*81))
				self.副本任务[i+self.副本加入]:显示(x,y,self.鼠标)
			end
			xx = xx + 1
			if xx > 1 then
				xx = 0
				yy = yy + 1
			end
		end
	end
	if self.资源组[11].接触 then
		self.焦点 = true
	end
end

function 场景类_梦幻指引:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_梦幻指引:初始移动(x,y)
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

function 场景类_梦幻指引:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_梦幻指引