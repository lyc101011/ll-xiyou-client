--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-07-03 23:52:00
--======================================================================--
local 场景类_文本栏 = class()
local tp
local insert = table.insert

function 场景类_文本栏:初始化(根)
	self.ID = 62
	self.x = 345
	self.y = 252
	self.xx = 0
	self.yy = 0
	self.注释 = "文本栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,316,140,3,9),
		[2] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"确定"),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取消"),
	}
	self.介绍文本 = 根._丰富文本(305,139,根.字体表.普通字体)
	for n=2,3 do
	   self.资源组[n]:绑定窗口_(self.ID)
	   self.资源组[n]:文本栏按钮_(true)
	end
	self.窗口时间 = 0
	tp = 根
end

function 场景类_文本栏:载入(内容,回调,按钮,事件)
	if  self.可视 then
		self.文本 = nil
		self.介绍文本:清空()
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.文本 = {}
		self.文本.内容 = 内容
		self.文本.回调 = 回调
		self.文本.按钮 = 按钮
		self.文本.事件 = 事件
		self.介绍文本:清空()
		self.时间 = 0
		self.介绍文本:添加文本(内容)
		tp.运行时间 = tp.运行时间 + 3
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_文本栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	if self.资源组[2]:事件判断() then
		if self.文本.事件 ~= nil then
			self.文本.事件()
			self:载入()
			return false
		end
		self:事件逻辑(self.文本.回调)
		self.可视 = false
	elseif self.资源组[3]:事件判断() then
		if self.文本.回调 == "丢弃物品" then
			if tp.场景.抓取物品注释 == "道具行囊_物品" then
				tp.窗口.道具行囊.物品[tp.场景.抓取物品ID]:置物品(tp.场景.抓取物品)
				tp.窗口.道具行囊.物品[tp.场景.抓取物品ID].确定 = false
			elseif tp.场景.抓取物品注释 == "道具行囊_人物装备" then
				tp.窗口.道具行囊.人物装备[tp.场景.抓取物品ID]:置物品(tp.场景.抓取物品)
				tp.窗口.道具行囊.人物装备[tp.场景.抓取物品ID].确定 = false
				tp.队伍[1]:穿戴装备(tp.场景.抓取物品,tp.场景.抓取物品ID)
			elseif tp.场景.抓取物品注释 == "道具行囊_召唤兽装备" then
				tp.窗口.道具行囊.召唤兽装备[tp.场景.抓取物品ID]:置物品(tp.场景.抓取物品)
				tp.窗口.道具行囊.召唤兽装备[tp.场景.抓取物品ID].确定 = false
				tp.队伍[1].宝宝列表[tp.窗口.道具行囊.选中召唤兽]:穿戴装备(tp.场景.抓取物品,tp.场景.抓取物品ID)
			end
			tp.场景.抓取物品 = nil
			tp.场景.抓取物品ID = nil
			tp.场景.抓取物品注释 = nil
		end
		self.可视 = false
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 65,self.y + 100,true)
	self.资源组[3]:显示(self.x + 195,self.y + 100,true)
	self.介绍文本:显示(self.x  + 12,self.y + 28)
end

function 场景类_文本栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_文本栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	self.窗口时间 = tp.运行时间
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end


function 场景类_文本栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

function 场景类_文本栏:事件逻辑(回调)
	if 回调 == "丢弃物品" then
		if tp.道具列表[tp.场景.抓取物品ID] == nil then
			tp.窗口.道具行囊.抓取物品 = nil
			tp.窗口.道具行囊.抓取物品ID = nil
			tp.窗口.道具行囊.抓取物品注释 = nil
		end
		if tp.场景.抓取物品注释 == "道具行囊_物品" then
			if (os.time() - self.时间 > 1 or self.时间 == 0) then
				tp.窗口.道具行囊.物品[tp.场景.抓取物品ID].确定 = false
	    		self.时间 = os.time()
			    发送数据(3702,{物品=tp.场景.抓取物品ID,类型=tp.窗口.道具行囊.点击类型})
			end
		elseif tp.场景.抓取物品注释 == "道具行囊_人物装备" then
			tp.窗口.道具行囊.人物装备[tp.场景.抓取物品ID].确定 = false
		elseif tp.场景.抓取物品注释 == "道具行囊_召唤兽装备" then
			tp.窗口.道具行囊.召唤兽装备[tp.场景.抓取物品ID].确定 = false
		elseif tp.场景.抓取物品注释 == "道具行囊_灵饰" then
			tp.窗口.灵饰.物品[tp.场景.抓取物品ID].确定 = false
		end
		tp.场景.抓取物品 = nil
		tp.场景.抓取物品ID = nil
		tp.场景.抓取物品注释 = nil
	-- elseif self.文本.回调 == "提现人民币" then
	-- 	引擎.场景.窗口.账号管理.账号数据.人民币 = 0
	-- 	发送数据(6404)
		--引擎.场景.常规提示:打开("#Y/提现操作以提交请等待管理员审核,审核成功后回在一个工作日内到账")
	-- elseif self.文本.回调 == "兑换仙玉" then
	-- 	引擎.场景.窗口.账号管理.账号数据.仙玉 = 引擎.场景.窗口.账号管理.账号数据.仙玉+引擎.场景.窗口.账号管理.账号数据.人民币*200
	-- 	引擎.场景.窗口.账号管理.账号数据.仙玉积分 = 引擎.场景.窗口.账号管理.账号数据.仙玉积分+引擎.场景.窗口.账号管理.账号数据.人民币*200
	-- 	引擎.场景.窗口.账号管理.账号数据.累计充值 = 引擎.场景.窗口.账号管理.账号数据.累计充值+引擎.场景.窗口.账号管理.账号数据.人民币*200
	-- 	引擎.场景.窗口.账号管理.账号数据.人民币 = 0
	-- 	发送数据(6405)
	elseif self.文本.回调 == "召唤兽携带上限" then
		发送数据(69)
	end
	if 回调 == "踢出人物" then
		tp.窗口.队伍栏:踢出队伍()
	end
	if 回调 == "储存召唤兽" then
		tp.窗口.召唤兽属性栏:存储()
	end
end

return 场景类_文本栏