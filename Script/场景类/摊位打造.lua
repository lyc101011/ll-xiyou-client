-- -- @Author: ASUS
-- -- @Date:   2021-05-26 16:18:21
-- -- @Last Modified by:   ASUS
-- -- @Last Modified time: 2022-10-02 18:19:14


-- local 场景类_摆摊打造 = class()

-- local floor = math.floor
-- local insert = table.insert
-- local random = 引擎.取随机整数
-- local mouseb = 引擎.鼠标弹起
-- local zts,tp,zts1
-- local tp
-- local remove = table.remove

-- function 场景类_摆摊打造:初始化(根)
-- 	self.ID = 103
-- 	self.x = 187
-- 	self.y = 129
-- 	self.xx = 0
-- 	self.yy = 0
-- 	self.注释 = "摊位打造"
-- 	self.可视 = false
-- 	self.鼠标 = false
-- 	self.焦点 = false
-- 	self.可移动 = true
-- 	local 资源 = 根.资源
-- 	local 按钮 = 根._按钮
-- 	local 自适应 = 根._自适应
-- 	local 小型选项栏 = 根._小型选项栏
-- 	self.资源组 = {
-- 		[0] = 自适应.创建(1,1,252,18,1,3,nil,18),
-- 		[1] = 自适应.创建(0,1,282,392,3,9),
-- 		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
-- 		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"确定"),
-- 		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消"),
-- 		[5] = 自适应.创建(3,1,74,19,1,3,nil,18),
-- 	}
-- 	for n=2,4 do
-- 		self.资源组[n]:绑定窗口_(self.ID)
-- 	end
-- 	self.物品限制 = {5,204}
-- 	local 格子 = 根._物品格子
-- 	self.材料 = {}
-- 	self.材料[1] = 格子(self.x+4,self.y,1,"打造材料")
-- 	self.材料[2] = 格子(self.x+4,self.y,2,"打造材料")
-- 	self.物品 = {}
-- 	for i=1,20 do
-- 		self.物品[i] = 格子(0,0,i1,"打造")
-- 	end
-- 	self.材料1位置 = nil
-- 	self.材料2位置 = nil
-- 	self.开始 = 1
-- 	self.结束 = 20
-- 	self.总价 = 0
-- 	self.窗口时间 = 0
-- 	tp = 根
-- 	zts = tp.字体表.普通字体
-- 	zts1 = tp.字体表.描边字体
-- end

-- function 场景类_摆摊打造:打开(sj)
-- 	if self.可视 then

-- 		self.开始 = 1
-- 		self.结束 = 20
-- 		self.可视 = false
-- 	else
-- 		insert(tp.窗口_,self)
-- 		self.对方id = sj.对方id
-- 		self.分类标识 = sj.分类标识
-- 		self.功能标识 = sj.功能标识
-- 		self.价格 = sj.价格
-- 		for i=self.开始,self.结束 do
-- 			self.物品[i]:置物品(tp.道具列表[i])
-- 		end
-- 		for i=1,2 do
-- 			self.材料[i]:置物品(nil)
-- 		end
-- 		tp.运行时间 = tp.运行时间 + 1
-- 		self.窗口时间 = tp.运行时间
-- 		self.可视 = true
-- 	end
-- end

-- local function 打造金钱公式(a)
-- 	if a<=7 then return 0 end
-- 	if a <= 40 then
-- 		return floor((a*4500+2000)*1.2)
-- 	elseif a > 40 and a <= 90 then
-- 		return floor(((a-50)*45000+300000)*1.2)
-- 	elseif a >= 100 then
-- 		return floor(((a-100)*450000+3000000)*1.2)
-- 	end
-- end

-- function 场景类_摆摊打造:刷新道具(ss)
-- 	self.开始 = 1
-- 	self.结束 = 20
-- 	for i=self.开始,self.结束 do
-- 		self.物品[i]:置物品(ss[i])
-- 	end
-- 	for i=1,2 do
-- 		self.材料[i]:置物品(nil)
-- 	end
-- end

-- function 场景类_摆摊打造:显示(dt,x,y)
-- 	self.焦点 = false
-- 	self.资源组[2]:更新(x,y)
-- 	self.资源组[3]:更新(x,y)
-- 	self.资源组[4]:更新(x,y)
-- 	self.资源组[1]:显示(self.x,self.y)
-- 	self.资源组[0]:显示(self.x+6,self.y+3)
-- 	tp.窗口标题背景_:置区域(0,0,74,16)
-- 	tp.窗口标题背景_:显示(self.x+105,self.y+3)
-- 	zts1:显示(self.x+119,self.y+3,"制  造")

-- 	self.资源组[2]:显示(self.x + 256,self.y + 6,true)
-- 	self.资源组[3]:显示(self.x + 59,self.y + 356)
-- 	self.资源组[4]:显示(self.x + 153,self.y + 356)
-- 	tp.物品界面背景_:显示(self.x+12,self.y+141)
-- 	tp.物品格子背景_:显示(self.x+12,self.y+52)
-- 	tp.物品格子背景_:显示(self.x+72,self.y+52)
-- 	self.资源组[5]:显示(self.x+195,self.y+30)
-- 	self.资源组[5]:显示(self.x+195,self.y+55)
-- 	self.资源组[5]:显示(self.x+195,self.y+80)
-- 	self.资源组[5]:显示(self.x+195,self.y+105)
-- 	zts1:显示(self.x+135,self.y+31,"支付工钱")
-- 	zts1:显示(self.x+135,self.y+56,"中介费用")
-- 	zts1:显示(self.x+135,self.y+81,"制作费用")
-- 	zts1:显示(self.x+135,self.y+106,"现有金钱")
-- 	if self.资源组[3]:事件判断() then
-- 		发送数据(4501,{序列=self.材料1位置,序列1=self.材料2位置,对方id=self.对方id,分类标识=self.分类标识,功能标识=self.功能标识})
-- 	end
-- 	local is = self.开始 - 1
-- 	for h=1,4 do
-- 		for l=1,5 do
-- 			is = is + 1
-- 			self.物品[is]:置坐标(l * 51-51 + self.x+12,h * 51 + self.y + 88)
-- 			self.物品[is]:显示(dt,x,y,self.鼠标,self.物品限制)
-- 			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
-- 				tp.提示:道具行囊(x,y,self.物品[is].物品)
-- 				if self.物品[is].事件 and self.鼠标 then
-- 					local zl = self.物品[is].物品.子类
-- 					if self.物品[is].物品.总类 == 5 and self.物品[is].物品.分类 == 4 then
-- 						zl = nil
-- 					end
-- 					if self.物品[is].物品.总类 == 2 then
-- 						zl = self.物品[is].物品.级别限制
-- 					end
-- 					if self.材料[1].物品 == nil and self.材料[2].物品 == nil then
-- 						self.材料[1]:置物品(self.物品[is].物品)
-- 						if zl ~= nil then
-- 							self.总价 = 打造金钱公式(zl)
-- 						end
-- 						self.材料1位置 = is
-- 						self.物品[is]:置物品(nil)
-- 					elseif self.材料[1].物品 ~= nil and self.材料[2].物品 == nil then
-- 						self.材料[2]:置物品(self.物品[is].物品)
-- 						if zl ~= nil then
-- 							self.总价 = 打造金钱公式(zl)
-- 						end
-- 						self.材料2位置 = is
-- 						self.物品[is]:置物品(nil)
-- 					elseif self.材料[1].物品 == nil and self.材料[2].物品 ~= nil then
-- 						self.材料[1]:置物品(self.物品[is].物品)
-- 						if zl ~= nil then
-- 							self.总价 = 打造金钱公式(zl)
-- 						end
-- 						self.材料1位置 = is
-- 						self.物品[is]:置物品(nil)
-- 					end
-- 					刷新道具逻辑(self.物品[is].物品,is,true)
-- 				end
-- 			end
-- 			if self.物品[is].焦点 then
-- 				self.焦点 = true
-- 			end
-- 		end
-- 	end
-- 	for ns=1,2 do
-- 		self.材料[ns]:置坐标(self.x+12 + (ns-1)* 63,self.y+52)
-- 		self.材料[ns]:显示(dt,x,y,self.鼠标,false)
-- 		if self.材料[ns].物品 ~= nil and self.材料[ns].焦点 then
-- 			tp.提示:道具行囊(x,y,self.材料[ns].物品)
-- 			if mouseb(0) and self.鼠标 then
-- 				if ns == 1 then
-- 					tp.道具列表[self.材料1位置] = self.材料[ns].物品
-- 					tp.窗口.道具行囊.物品[self.材料1位置]:置物品(tp.道具列表[self.材料1位置])
-- 					刷新道具逻辑(tp.道具列表[self.材料1位置],self.材料1位置,true)
-- 				elseif ns == 2 then
-- 					tp.道具列表[self.材料2位置] = self.材料[ns].物品
-- 					tp.窗口.道具行囊.物品[self.材料2位置]:置物品(tp.道具列表[self.材料2位置])
-- 					刷新道具逻辑(tp.道具列表[self.材料2位置],self.材料2位置,true)
-- 				end
-- 				if ns == 1 then
-- 					self.材料1总价 = 0
-- 				else
-- 					self.材料2总价 = 0
-- 				end
-- 				self.材料[ns]:置物品(nil)
-- 			end
-- 		end
-- 		if self.材料[ns].焦点 then
-- 			self.焦点 = true
-- 		end
-- 	end
-- end

-- function 场景类_摆摊打造:打造成功()
-- 	self.材料[1]:置物品(nil)
-- 	self.材料[2]:置物品(nil)
-- end

-- function 场景类_摆摊打造:检查点(x,y)
-- 	local n = false
-- 	if self.可视 and self.资源组[1]:是否选中(x,y)  then
-- 		n  = true
-- 	end
-- 	return n
-- end

-- function 场景类_摆摊打造:初始移动(x,y)
-- 	tp.运行时间 = tp.运行时间 + 1
-- 	if not tp.消息栏焦点 then
-- 		self.窗口时间 = tp.运行时间
-- 	end
-- 	if not self.焦点 then
-- 		tp.移动窗口 = true
-- 	end
-- 	if self.可视 and self.鼠标 and  not self.焦点 then
-- 		self.xx = x - self.x
-- 		self.yy = y - self.y
-- 	end
-- end

-- function 场景类_摆摊打造:开始移动(x,y)
-- 	if self.可视 and self.鼠标 then
-- 		self.x = x - self.xx
-- 		self.y = y - self.yy
-- 	end
-- end

-- return 场景类_摆摊打造