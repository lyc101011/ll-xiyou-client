-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-13 22:06:10
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-12-31 10:49:03
--======================================================================--
local 场景类_幻化 = class()

local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts1,tp
local tp
local remove = table.remove

local function 成功率(物品)
	if 物品.幻化次数==nil then
		物品.幻化次数=0
	end
	if 物品.幻化次数 <= 10 then
		return 100
	elseif 物品.幻化次数 <= 20 then
		return 90
	elseif 物品.幻化次数 <= 30 then
		return 85
	elseif 物品.幻化次数 <= 40 then
		return 80
	elseif 物品.幻化次数 <= 50 then
		return 75
	elseif 物品.幻化次数 <= 60 then
		return 70
	elseif 物品.幻化次数 <= 70 then
		return 65
	elseif 物品.幻化次数 <= 80 then
		return 60
	elseif 物品.幻化次数 <= 90 then
		return 55
	elseif 物品.幻化次数 <= 100 then
		return 50
	else
		return 40
	end
end

local function 需要消耗强化石(物品)
	if 物品.幻化次数==nil then
		物品.幻化次数=0
	end
	if 物品.幻化次数 <= 10 then
		return 0
	elseif 物品.幻化次数 <= 20 then
		return 20
	elseif 物品.幻化次数 <= 30 then
		return 30
	elseif 物品.幻化次数 <= 40 then
		return 40
	elseif 物品.幻化次数 <= 50 then
		return 50
	elseif 物品.幻化次数 <= 60 then
		return 60
	elseif 物品.幻化次数 <= 70 then
		return 70
	elseif 物品.幻化次数 <= 80 then
		return 80
	elseif 物品.幻化次数 <= 90 then
		return 90
	elseif 物品.幻化次数 <= 100 then
		return 100
	else
		return 120
	end
end

function 场景类_幻化:初始化(根)
	self.ID = 15
	self.x = 210
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "幻化"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	self.资源组 = {
		[1] = 自适应.创建(0,1,495,300,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),--self.青龙石 +1
		[4] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),--self.白虎石 +1
		[5] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),--self.朱雀石 +1
		[6] =  按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),--self.玄武石 +1
		[7] =  按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),--self.青龙石 -1
		[8] =  按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),--self.白虎石 -1
		[9] =  按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),--self.朱雀石 -1
		[10] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),--self.玄武石 -1
		[11] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"幻化"),
		[12] = 按钮.创建(自适应.创建(12,4,110,22,1,3),0,0,4,true,true,"自动加入强化石"),
		[13] = 自适应.创建(3,1,40,19,1,3,nil,18),
	}
	local 格子 = 根._物品格子
	self.物品 = {}
	for i=1,20 do
		self.物品[i] = 格子(0,0,"幻化")
	end
	self.材料 = {}
	self.材料[1] = 格子(0,0,"幻化装备")
	self.附加 = {
		青龙石={动画=资源:载入("item.wdf","网易WDF动画",2289281503)},
		白虎石={动画=资源:载入("item.wdf","网易WDF动画",2867857574)},
		朱雀石={动画=资源:载入("item.wdf","网易WDF动画",650195920)},
		玄武石={动画=资源:载入("item.wdf","网易WDF动画",727733710)}
		}
	for n=2,12 do
		self.资源组[n]:绑定窗口_(15)
	end
	self.物品限制={2,204}
	self.材料1位置 = 0
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	tp = 根
	zts1 = tp.字体表.猫猫字体3
	self.体活消耗 = 20
	self.成功率 = 0
	self.剩余陨铁 = 0
	self.需要消耗强化石=0
end

function 场景类_幻化:打开()
	if self.可视 then
		self.朱雀石 = 0
		self.白虎石 = 0
		self.青龙石 = 0
		self.玄武石 = 0
		self.可视 = false
	else
		insert(tp.窗口_,self)
		for i=1,20 do
			self.物品[i]:置物品(tp.道具列表[i])
		end
		self.材料[1]:置物品(nil)
		self.成功率 = 0
		self.新增成功率 = 10
		self.剩余陨铁 = 0
		self.材料1位置 = 0
		self.朱雀石 = 0
		self.白虎石 = 0
		self.青龙石 = 0
		self.玄武石 = 0
		self.背包青龙石=取背包物品数量("青龙石")
	    self.背包白虎石=取背包物品数量("白虎石")
	    self.背包朱雀石=取背包物品数量("朱雀石")
	    self.背包玄武石=取背包物品数量("玄武石")
		self.需要消耗强化石 = 0
		tp.运行时间 = tp.运行时间 + 1
    	self.窗口时间 = tp.运行时间
    	self.可视 = true
	end
end

function 场景类_幻化:刷新道具(ss)
	self.开始 = 1
	self.结束 = 20
	for i=self.开始,self.结束 do
		self.物品[i]:置物品(ss[i])
	end
	self.成功率=0
    self.新增成功率=0
	self.需要消耗强化石 = 0
	self.背包青龙石=取背包物品数量("青龙石")
    self.背包白虎石=取背包物品数量("白虎石")
    self.背包朱雀石=取背包物品数量("朱雀石")
    self.背包玄武石=取背包物品数量("玄武石")
    self.剩余陨铁 = 取背包物品数量("陨铁")

	if self.物品[self.材料1位置].物品~=nil then
	    self.材料[1]:置物品(self.物品[self.材料1位置].物品)
		self.成功率 = 成功率(self.材料[1].物品)
		self.物品[self.材料1位置]:置物品(nil)
	else
		self.材料[1]:置物品(nil)
	end
end

function 场景类_幻化:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,100-self.成功率-self.新增成功率>0 and self.材料[1].物品 ~= nil)
	self.资源组[4]:更新(x,y,100-self.成功率-self.新增成功率>0 and self.材料[1].物品 ~= nil)
	self.资源组[5]:更新(x,y,100-self.成功率-self.新增成功率>0 and self.材料[1].物品 ~= nil)
	self.资源组[6]:更新(x,y,100-self.成功率-self.新增成功率>0 and self.材料[1].物品 ~= nil)
	self.资源组[7]:更新(x,y,self.青龙石 ~= 0 and self.材料[1].物品 ~= nil)
	self.资源组[8]:更新(x,y,self.白虎石 ~= 0 and self.材料[1].物品 ~= nil)
	self.资源组[9]:更新(x,y,self.朱雀石 ~= 0 and self.材料[1].物品 ~= nil)
	self.资源组[10]:更新(x,y,self.玄武石 ~= 0 and self.材料[1].物品 ~= nil)
	self.资源组[11]:更新(x,y,self.材料[1].物品 ~= nil)
	self.资源组[12]:更新(x,y,self.材料[1].物品 ~= nil)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"幻化")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	tp.物品界面背景_:显示(self.x+12,self.y+30)
	tp.物品格子背景_:显示(self.x+288,self.y+30) --1
	tp.物品格子背景_:显示(self.x+423,self.y+30) --2
	tp.物品格子背景_:显示(self.x+288,self.y+140) --3
	tp.物品格子背景_:显示(self.x+423,self.y+140) --4
	tp.物品格子背景_:显示(self.x+355,self.y+110)
	self.资源组[3]:显示(self.x+335,self.y+90) --1 +
	self.资源组[4]:显示(self.x+470,self.y+90) --2 +
	self.资源组[5]:显示(self.x+335,self.y+200)--3 +
	self.资源组[6]:显示(self.x+470,self.y+200)--4 +
	self.资源组[7]:显示(self.x+275,self.y+90)--1 -
	self.资源组[8]:显示(self.x+410,self.y+90)--2 -
	self.资源组[9]:显示(self.x+275,self.y+200)--3 -
	self.资源组[10]:显示(self.x+410,self.y+200)--4 -
	self.资源组[13]:置宽高(36,19)
	self.资源组[13]:显示(self.x+295,self.y+87)--1
	self.资源组[13]:显示(self.x+430,self.y+87)--2
	self.资源组[13]:显示(self.x+295,self.y+197)--3
	self.资源组[13]:显示(self.x+430,self.y+197)--4
	self.资源组[13]:置宽高(40,19)
	self.资源组[13]:显示(self.x+82,self.y+240)
	self.资源组[13]:显示(self.x+226,self.y+240)
	self.资源组[13]:显示(self.x+82,self.y+271)
	self.资源组[13]:显示(self.x+226,self.y+271)
	self.资源组[11]:显示(self.x+410,self.y+263)
	self.资源组[12]:显示(self.x+290,self.y+263)
	zts1:置颜色(白色)
	zts1:显示(self.x+14,self.y+244,"体活消耗：")
	zts1:显示(self.x+146,self.y+244,"成功率：")
	zts1:显示(self.x+14,self.y+275,"剩余陨铁：")
	zts1:显示(self.x+146,self.y+275,"强化石消耗：")
	zts1:显示(self.x+275,self.y+226+2,"请选择幻化材料,幻化失败后元身陨铁\n将会")
	zts1:显示(self.x+328,self.y+240+2,",强化石可以提高成功率")
	zts1:置颜色(黄色)
	zts1:显示(self.x+300,self.y+240+2,"消失")
	zts1:置颜色(黑色)
	zts1:显示(self.x+306,self.y+91,self.青龙石)
	zts1:显示(self.x+440,self.y+91,self.白虎石)
	zts1:显示(self.x+306,self.y+202,self.朱雀石)
	zts1:显示(self.x+440,self.y+202,self.玄武石)
	self.附加.青龙石.动画:显示(self.x+289,self.y+33)
	self.附加.白虎石.动画:显示(self.x+403+21+2,self.y+33)
	self.附加.朱雀石.动画:显示(self.x+286,self.y+143)
	self.附加.玄武石.动画:显示(self.x+424,self.y+143)
	if self.资源组[3]:事件判断() then
		if self.背包青龙石 >= self.青龙石 +1 then
			self.青龙石 = self.青龙石 +1
			self.新增成功率 = math.floor((self.青龙石 + self.白虎石 + self.朱雀石 + self.玄武石)/2)
		else
			tp.常规提示:打开("#Y你没有足够数量的青龙石")
		end
	elseif self.资源组[4]:事件判断() then
		if self.背包白虎石 >= self.白虎石 +1 then
			self.白虎石 = self.白虎石 +1
			self.新增成功率 = math.floor((self.青龙石 + self.白虎石 + self.朱雀石 + self.玄武石)/2)
		else
			tp.常规提示:打开("#Y你没有足够数量的白虎石")
		end
	elseif self.资源组[5]:事件判断() then
		if self.背包朱雀石 >= self.朱雀石 +1 then
			self.朱雀石 = self.朱雀石 +1
			self.新增成功率 = math.floor((self.青龙石 + self.白虎石 + self.朱雀石 + self.玄武石)/2)
		else
			tp.常规提示:打开("#Y你没有足够数量的朱雀石")
		end
	elseif self.资源组[6]:事件判断() then
		if self.背包玄武石 >= self.玄武石 +1 then
			self.玄武石 = self.玄武石 +1
			self.新增成功率 = math.floor((self.青龙石 + self.白虎石 + self.朱雀石 + self.玄武石)/2)
		else
			tp.常规提示:打开("#Y你没有足够数量的玄武石")
		end
	elseif self.资源组[7]:事件判断() then
		if self.背包青龙石 >= self.青龙石 -1 then
			self.青龙石 = self.青龙石 -1
			self.新增成功率 = math.floor((self.青龙石 + self.白虎石 + self.朱雀石 + self.玄武石)/2)
		else
			tp.常规提示:打开("#Y你没有足够数量的青龙石")
		end
	elseif self.资源组[8]:事件判断() then
		if self.背包白虎石 >= self.白虎石 -1 then
			self.白虎石 = self.白虎石 -1
			self.新增成功率 = math.floor((self.青龙石 + self.白虎石 + self.朱雀石 + self.玄武石)/2)
		else
			tp.常规提示:打开("#Y你没有足够数量的白虎石")
		end
	elseif self.资源组[9]:事件判断() then
		if self.背包朱雀石 >= self.朱雀石 -1 then
			self.朱雀石 = self.朱雀石 -1
			self.新增成功率 = math.floor((self.青龙石 + self.白虎石 + self.朱雀石 + self.玄武石)/2)
		else
			tp.常规提示:打开("#Y你没有足够数量的朱雀石")
		end
	elseif self.资源组[10]:事件判断() then
		if self.背包玄武石 >= self.玄武石 -1 then
			self.玄武石 = self.玄武石 -1
			self.新增成功率 = math.floor((self.青龙石 + self.白虎石 + self.朱雀石 + self.玄武石)/2)
		else
			tp.常规提示:打开("#Y你没有足够数量的玄武石")
		end
	elseif self.资源组[11]:事件判断() then
		发送数据(4502,{序列=self.材料1位置,材料={青龙石=self.青龙石,白虎石=self.白虎石,朱雀石=self.朱雀石,玄武石=self.玄武石}})
	elseif self.资源组[12]:事件判断() then --自动
		if self.材料[1] == nil or self.材料[1].物品 == nil then
			tp.常规提示:打开("#Y/您还未选择需要幻化的装备。")
		elseif self.材料[1].物品.幻化次数 == nil or self.材料[1].物品.幻化次数 <= 10 then
			if self.材料[1].物品.幻化次数 == nil then
			   self.材料[1].物品.幻化次数 = 0
			end
			local 次数=10-self.材料[1].物品.幻化次数
			tp.常规提示:打开("#Y/您选择的装备有"..次数.."#Y/次免费幻化的机会，不需要添加强化石。")
		else
			self.青龙石=0
			self.白虎石=0
			self.朱雀石=0
			self.玄武石=0
		    self.需要消耗强化石 = 需要消耗强化石(self.材料[1].物品)
		    if self.背包青龙石 >= self.需要消耗强化石 then
		    	self.青龙石=self.需要消耗强化石
		    elseif self.背包白虎石 >= self.需要消耗强化石 then
		    	self.白虎石=self.需要消耗强化石
	    	elseif self.背包朱雀石 >= self.需要消耗强化石 then
		    	self.朱雀石=self.需要消耗强化石
	    	elseif self.背包玄武石 >= self.需要消耗强化石 then
		    	self.玄武石=self.需要消耗强化石
		    else
    		    if self.需要消耗强化石>0 and self.背包青龙石~=0 then
    		    	self.需要消耗强化石=self.需要消耗强化石-self.背包青龙石
    		    	self.青龙石=self.背包青龙石
    		    end
    		    if self.需要消耗强化石>0 and self.背包白虎石~=0 then
    		    	self.需要消耗强化石=self.需要消耗强化石-self.背包白虎石
    		    	self.白虎石=self.背包白虎石
    		    end
    		    if self.需要消耗强化石>0 and self.背包朱雀石~=0 then
    		    	self.需要消耗强化石=self.需要消耗强化石-self.背包朱雀石
    		    	self.朱雀石=self.背包朱雀石
    		    end
    		    if self.需要消耗强化石>0 and self.背包玄武石~=0 then
    		    	self.需要消耗强化石=self.需要消耗强化石-self.背包玄武石
    		    	self.玄武石=self.背包玄武石
    		    end
		    end
		    self.新增成功率 = math.floor((self.青龙石+self.白虎石+self.朱雀石+self.玄武石)/2)
		end
	end

	local is = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标((l-1)* 51 + self.x+12,(h-1) * 51 + self.y + 28)
			self.物品[is]:显示(dt,x,y,self.鼠标,self.物品限制)
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and  self.鼠标 then
					local zl = self.物品[is].物品.子类
					if self.物品[is].物品.总类 == 5 and self.物品[is].物品.分类 == 4 then
						zl = nil
					end
					if self.物品[is].物品.总类 == 2 then
						zl = self.物品[is].物品.级别限制
					end
					if self.物品[is].物品.鉴定==false then
						tp.常规提示:打开("#Y/未鉴定的装备，无法进行操作。")
						return
					end
					if zl~=nil and (zl~=150 and self.物品[is].物品.总类 ~= 204) then
						tp.常规提示:打开("#Y/非150级的装备无法进行幻化。")
						return
					end
					if self.材料[1].物品 == nil then
						self.材料[1]:置物品(self.物品[is].物品)
						self.材料1位置 = is
						self.成功率 = 成功率(self.材料[1].物品)
						self.物品[is]:置物品(nil)
					end
					刷新道具逻辑(self.物品[is].物品,is,true)
					self.剩余陨铁 = 取背包物品数量("陨铁")
				end
			end
			if self.物品[is].焦点 then
				self.焦点 = true
			end
		end
	end
	self.材料[1]:置坐标(self.x+357 ,self.y+110)
	self.材料[1]:显示(dt,x,y,self.鼠标,false)
	if self.材料[1].物品 ~= nil then
		zts1:置颜色(黑色):显示(self.x+92,self.y+244,self.体活消耗)
		zts1:置颜色(0xffCC0033):显示(self.x+234,self.y+244,self.成功率+self.新增成功率)
		zts1:置颜色(黑色):显示(self.x+92,self.y+275,self.剩余陨铁)
		zts1:置颜色(黑色):显示(self.x+234,self.y+275,self.青龙石+self.白虎石+self.朱雀石+self.玄武石)
		if self.材料[1].焦点 then
			tp.提示:道具行囊(x,y,self.材料[1].物品)
			if mouseb(0) and self.鼠标 then
				tp.道具列表[self.材料1位置] = self.材料[1].物品
				tp.窗口.道具行囊.物品[self.材料1位置]:置物品(tp.道具列表[self.材料1位置])
				刷新道具逻辑(tp.道具列表[self.材料1位置],self.材料1位置,true)
				self.材料[1]:置物品(nil)
			end
		end
	end
end

function 场景类_幻化:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_幻化:初始移动(x,y)
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

function 场景类_幻化:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_幻化