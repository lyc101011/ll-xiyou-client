-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:34
local 场景类_人物称谓栏 = class()
local bw = require("gge包围盒")(0,0,190,18)
local box = 引擎.画矩形
local format = string.format
local mouse = 引擎.鼠标弹起
local fonts
local names,tp
local move = table.move
local insert = table.insert

function 场景类_人物称谓栏:初始化(根)
	self.ID = 2
	self.x = 375
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "人物称谓栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,251,360,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
		[3] = 按钮.创建(自适应.创建(12,4,71,22,1,3),0,0,4,true,true,"改 变"),
		[4] = 按钮.创建(自适应.创建(12,4,71,22,1,3),0,0,4,true,true,"隐藏称谓"),
		[5] = 按钮.创建(自适应.创建(12,4,71,22,1,3),0,0,4,true,true,"删除称谓"),
		[6] = 自适应.创建(103,1,159,22,1,3,nil,18),
		[7] = 自适应.创建(37,1,227,146,3,nil),
		[8] = 自适应.创建(78,1,227,95,3,9),
		[9] = 根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,120,2),

	}
	self.资源组[3]:置偏移(9,0)
	self.加入 = 0
	self.选中 = 0
	for n=2,5 do
	   self.资源组[n]:绑定窗口_(2)
	end
	self.介绍文本 = 根._丰富文本(210,139,根.字体表.普通字体)
	tp = 根
	fonts = tp.字体表.普通字体
	self.窗口时间 = 0
	self.开始=1
	self.结束=5
end

function 场景类_人物称谓栏:打开()
	if self.可视 then
		self.介绍文本:清空()
		self.开始=1
		self.结束=5
		self.资源组[9]:置起始点(0)
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.加入 = 0
		self.选中 = 0
		-- for i=1,10 do
		-- 	tp.称谓[i+1]="测试称谓"..i
		-- end
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    names = tp.称谓
	end
end

function 场景类_人物称谓栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.选中 ~= 0)
	self.资源组[4]:更新(x,y,tp.当前称谓 ~= "无称谓" and tp.称谓[self.选中]==tp.当前称谓)
	self.资源组[5]:更新(x,y,self.选中 ~= 0 and asni)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then --改变
		tp.当前称谓 = tp.称谓[self.选中]
		tp.场景.人物:更改称谓()
		发送数据(31,{称谓ID=self.选中})
	elseif self.资源组[4]:事件判断() then --隐藏
		tp.当前称谓 = "无称谓"
		发送数据(31,{称谓ID=0})
	elseif self.资源组[5]:事件判断() then --删除
		发送数据(74,{称谓=tp.称谓[self.选中]})
		if tp.队伍[1].称谓[self.选中] == nil then
			self:打开()
			return false
		end
		if tp.队伍[1].称谓[self.选中] == tp.当前称谓 or tp.队伍[1].称谓[self.选中] == "无称谓" then
			tp.当前称谓 = "无称谓"
			tp.队伍[1].当前称谓 = tp.当前称谓
			self:打开()
			return false
		end

		self.介绍文本:清空()
		table.remove(tp.队伍[1].称谓, self.选中)
		tp.常规提示:打开("#Y删除成功")
		self.选中 = 0
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"角色称谓")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	self.资源组[3]:显示(self.x + 14,self.y + 328,true)
	self.资源组[4]:显示(self.x + 92,self.y + 328,true)
	self.资源组[5]:显示(self.x + 169,self.y + 328,true)
	self.资源组[6]:显示(self.x + 81,self.y + 33)
	self.资源组[7]:显示(self.x + 11,self.y + 68)
	self.资源组[8]:显示(self.x + 11,self.y + 223)
	fonts:置颜色(白色)
	fonts:显示(self.x + 16,self.y + 37,"当前称谓")
	fonts:显示(self.x + 95,self.y + 74,"拥有称谓")
	fonts:显示(self.x + 87, self.y + 37,tp.当前称谓)
	fonts:置颜色(-16777216)
	if #names>5 then
	    self.资源组[9]:置高度(math.min(math.floor(120/(#names-5)),80))
		self.加入 = math.min(math.ceil((#names-5)*self.资源组[9]:取百分比()),#names-5)
		self.资源组[9]:显示(self.x+227,self.y+94,x,y,self.鼠标)
	end
	if self.资源组[1]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
		self.资源组[9]:置起始点(self.资源组[9]:取百分比转换(self.加入-1,5,#names))
	elseif self.资源组[1]:是否选中(x,y) and 引擎.取鼠标滚轮() ==-1 and self.加入 < #names - 5 then--鼠标下滚动
		self.资源组[9]:置起始点(self.资源组[9]:取百分比转换(self.加入+1,5,#names))
	end

	for m=1,5 do
		if names[m] ~= nil then
			bw:置坐标(self.x + 23,self.y + 80 + m * 22)
			if self.选中 ~= m + self.加入 then
				if bw:检查点(x,y) then
					box(self.x + 12,self.y + 74 + m * 22,self.x + 225,self.y + 98 + m * 22,-3551379)
					if mouse(0) then
						self.选中 = m + self.加入
						self.介绍文本:清空()
						self.介绍文本:添加文本(format("#N/%s",tp:取称谓说明(tp.称谓[self.选中])))
					end
					self.焦点 = true
				end
			else
				local ys = -10790181
				if bw:检查点(x,y) then
					ys = -9670988
					self.焦点 = true
				end
				box(self.x + 12,self.y + 74 + m * 22,self.x + 225,self.y + 98 + m * 22,ys)
			end
			fonts:显示(self.x + 23,self.y + 80 + m * 22,names[m+ self.加入])
		end
	end
	self.介绍文本:显示(self.x + 20,self.y + 225)
end

function 场景类_人物称谓栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_人物称谓栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_人物称谓栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_人物称谓栏