-- @Author: baidwwy
-- @Date:   2024-04-14 22:22:15
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-04 18:29:45
--======================================================================--
local 宝宝进阶 = class()
local tp,zts
local mousea = 引擎.鼠标弹起
local ani = 引擎.取战斗模型
local insert = table.insert
function 宝宝进阶:初始化(根)
	self.ID = 137
	self.x = 83
	self.y = 90
	self.xx = 0
	self.yy = 0
	self.注释 = "宝宝进阶"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,608,330,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,54,22,1,3),0,0,4,true,true,"使用"),
		[4] = 按钮.创建(自适应.创建(12,4,68,22,1,3),0,0,4,true,true,"保留旧的"),
		[5] = 按钮.创建(自适应.创建(12,4,68,22,1,3),0,0,4,true,true,"保留新的"),
		[6] = 资源:载入('pic/hb.png',"图片"),
		[7] = 自适应.创建(78,1,105,130,3,9),
		[8] = 自适应.创建(3,1,67,19,1,3),

	}
	for i=2,5 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.物品 = {}
	self.右侧物品 = {}
	local 格子 = 根._物品格子
	for i=1,20 do
		self.物品[i] = 格子(0,0,i,"左侧物品")
	end
	for i=1,5 do
		self.右侧物品[i] = 格子(0,0,i,"右侧物品")
	end
	self.资源组[3]:置偏移(5,0)
	self.资源组[4]:置偏移(-2,0)
	self.资源组[5]:置偏移(-2,0)
	self.动画={}
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
end

function 宝宝进阶:打开(内容)
	if self.可视 then
		self.bb = nil
		self.动画={}
		self.进阶属性={}
		self.发送={}
		self.选中编号=0
		for i=1,20 do
			self.物品[i]:置物品(nil)
		end
		for i=1,5 do
			self.右侧物品[i]:置物品(nil)
		end
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.bb = 内容.宝宝
		self.镶嵌满 = false
		self.已使用 = false
		self.选中物品 = 0
		self.发送={}
		for i=1,20 do
			self.物品[i]:置物品(tp.道具列表[i])
		end
		self:置形象()
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true

	end
end

function 宝宝进阶:显示(dt,x,y)
	self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:更新(x,y)
    self.资源组[3]:更新(x,y,self.镶嵌满)
    self.资源组[4]:更新(x,y,self.已使用)
    self.资源组[5]:更新(x,y,self.已使用)
    if self.资源组[2]:事件判断() then
        self:打开()
		return
    end
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,"召唤兽进阶")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	tp.物品界面背景_:显示(self.x+15,self.y+30)

	self.资源组[6]:显示(self.x+288,self.y+136)
	self.资源组[3]:显示(self.x+414,self.y+110)
	self.资源组[4]:显示(self.x+442,self.y+285)
	self.资源组[5]:显示(self.x+520,self.y+285)
	self.资源组[7]:显示(self.x+298,self.y+146)
	local xx = 0
	local yy = 0
	for i=1,10 do
		self.资源组[8]:显示(self.x+442+xx*78,self.y+146+yy*28)
		xx=xx+1
		if xx>=2 then
		    xx=0
		    yy=yy+1
		end
	end
	if self.bb  ~= nil then
		tp.影子:显示(self.x+347,self.y+250)
	    if self.动画.主体~=nil then
			self.动画.主体:更新()
			self.动画.主体:显示(self.x+347,self.y+250)
			if self.动画.身体~=nil then
				self.动画.身体:更新()
				self.动画.身体:显示(self.x+347,self.y+250)
			end
			if self.动画.饰品 ~= nil then
				self.动画.饰品:更新()
				self.动画.饰品:显示(self.x+347,self.y+250)
			end
		end
		zts:置颜色(黑色)
		zts:显示(self.x+453,self.y+150,self.bb.体质)
		zts:显示(self.x+453,self.y+150+1*28,self.bb.魔力)
		zts:显示(self.x+453,self.y+150+2*28,self.bb.力量)
		zts:显示(self.x+453,self.y+150+3*28,self.bb.耐力)
		zts:显示(self.x+453,self.y+150+4*28,self.bb.敏捷)
		if self.bb.进阶属性 and self.bb.进阶属性.力量>0 then
			zts:置颜色(0xFFFF00FF)
		    zts:显示(self.x+453+(#tostring(self.bb.体质)*7)+3,self.y+150,"+"..self.bb.进阶属性.体质)
			zts:显示(self.x+453+(#tostring(self.bb.魔力)*7)+3,self.y+150+1*28,"+"..self.bb.进阶属性.魔力)
			zts:显示(self.x+453+(#tostring(self.bb.力量)*7)+3,self.y+150+2*28,"+"..self.bb.进阶属性.力量)
			zts:显示(self.x+453+(#tostring(self.bb.耐力)*7)+3,self.y+150+3*28,"+"..self.bb.进阶属性.耐力)
			zts:显示(self.x+453+(#tostring(self.bb.敏捷)*7)+3,self.y+150+4*28,"+"..self.bb.进阶属性.敏捷)
		end
		if self.已使用 then
			zts:置颜色(黑色)
		    zts:显示(self.x+531,self.y+150,self.bb.体质)
			zts:显示(self.x+531,self.y+150+1*28,self.bb.魔力)
			zts:显示(self.x+531,self.y+150+2*28,self.bb.力量)
			zts:显示(self.x+531,self.y+150+3*28,self.bb.耐力)
			zts:显示(self.x+531,self.y+150+4*28,self.bb.敏捷)
			if self.bb.临时进阶 and self.bb.临时进阶.力量>0 then
				zts:置颜色(0xFFFF00FF)
				zts:显示(self.x+531+(#tostring(self.bb.体质)*7)+3,self.y+150,"+"..self.bb.临时进阶.体质)
				zts:显示(self.x+531+(#tostring(self.bb.魔力)*7)+3,self.y+150+1*28,"+"..self.bb.临时进阶.魔力)
				zts:显示(self.x+531+(#tostring(self.bb.力量)*7)+3,self.y+150+2*28,"+"..self.bb.临时进阶.力量)
				zts:显示(self.x+531+(#tostring(self.bb.耐力)*7)+3,self.y+150+3*28,"+"..self.bb.临时进阶.耐力)
				zts:显示(self.x+531+(#tostring(self.bb.敏捷)*7)+3,self.y+150+4*28,"+"..self.bb.临时进阶.敏捷)
			end
		end
		zts:置颜色(白色)
		zts:显示(self.x+338,self.y+288,self.bb.名称)
	end
	zts:置颜色(白色)
	zts:显示(self.x+309,self.y+91,"木")
	zts:显示(self.x+17,self.y+238,"只要在对应五行之位放入清灵仙露，至于")
	zts:显示(self.x+17,self.y+238+1*20,"能获多大提升冥冥之中自有定数。")
	zts:显示(self.x+17,self.y+238+2*20,"（如果不满意新的成长结果，可以选择保")
	zts:显示(self.x+17,self.y+238+3*20,"留旧的属性）")
	zts:显示(self.x+309,self.y+91,"木")
	zts:显示(self.x+309+1*63,self.y+91,"火")
	zts:显示(self.x+309+2*63,self.y+91,"金")
    zts:显示(self.x+309+3*63,self.y+91,"土")
	zts:显示(self.x+309+4*63,self.y+91,"水")
	zts:显示(self.x+411,self.y+150,"体质")
	zts:显示(self.x+411,self.y+150+1*28,"法力")
	zts:显示(self.x+411,self.y+150+2*28,"力量")
	zts:显示(self.x+411,self.y+150+3*28,"耐力")
	zts:显示(self.x+411,self.y+150+4*28,"敏捷")
	local is = 0
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51-35 + self.x,h * 51 + self.y - 23)
			self.物品[is]:显示(dt,x,y,self.鼠标,nil) --{2,2} 总类 分类
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				self.焦点 = true
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and  self.鼠标 then
					if self.物品[self.选中编号]~=nil then
					  	self.物品[self.选中编号].选中=nil
					end
					self.选中编号 = is
					self.物品[self.选中编号].选中=true
				end
			end
			if self.物品[is].事件 then
				if tp.场景.抓取物品 == nil and self.物品[is].物品 ~= nil and 引擎.鼠标弹起(0x00) then
					if self.物品[is].物品.名称=="初级清灵仙露" or self.物品[is].物品.名称=="中级清灵仙露" or self.物品[is].物品.名称=="高级清灵仙露" then
					    self.选中物品=is
						tp.场景.抓取物品 = self.物品[is].物品
						tp.场景.抓取物品ID = is
						tp.场景.抓取物品注释 = self.物品[is].注释
						-- self.物品[tp.场景.抓取物品ID].确定 = true
						-- self.物品[is]:置物品(nil)
						if self.物品[is].物品.数量<=1 then
						    self.物品[is]:置物品(nil)
						else
							self.物品[is].物品.数量=self.物品[is].物品.数量-1
						end
					end
				end
			end
		end
	end
    local go = true
	for h=1,5 do
        tp.物品格子背景_:显示(self.x+288+(h-1)*63,self.y+31)
		self.右侧物品[h]:置坐标(self.x+289+(h-1)*63,self.y+31)
		self.右侧物品[h]:显示(dt,x,y,self.鼠标,nil,nil,nil,nil,nil,true)
		if self.右侧物品[h].焦点 and not tp.消息栏焦点 then
			if self.右侧物品[h].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.右侧物品[h].物品)
				if 引擎.鼠标弹起(右键) then
				    self.物品[self.发送[h]]:置物品(tp.道具列表[self.发送[h]])
				    self.右侧物品[h]:置物品(nil)
				    local sl = self.物品[self.发送[h]].物品.数量
				    for i=1,5 do
				    	if self.右侧物品[i].物品 then
				    	    if self.右侧物品[i].物品.识别码==tp.道具列表[self.发送[h]].识别码 and self.右侧物品[i].物品.名称==tp.道具列表[self.发送[h]].名称 and self.右侧物品[i].物品.灵气==tp.道具列表[self.发送[h]].灵气 then
				    	        sl = sl -1
				    	    end
				    	end
				    end
				    self.物品[self.发送[h]].物品.数量=sl
				end
			end
			if tp.场景.抓取物品ID~=nil and 引擎.鼠标弹起(左键) then
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
				-- self.右侧物品[h].确定=false
				-- self.发送[h]=tp.道具列表[self.选中物品]
				-- self.发送[h]=self.选中物品
				self.发送[h]=self.选中物品
				self.右侧物品[h]:置物品(tp.道具列表[self.选中物品])
			end
		end
		if self.右侧物品[h].物品==nil then
		    go = false
		end
	end

	if go then
	    self.镶嵌满=true
	else
		self.镶嵌满=false
	end

	if tp.场景.抓取物品ID~=nil and 引擎.鼠标弹起(右键) then
		tp.禁止关闭 = true
		self.物品[tp.场景.抓取物品ID]:置物品(tp.场景.抓取物品)
		self.物品[tp.场景.抓取物品ID].物品.数量=tp.道具列表[tp.场景.抓取物品ID].数量
		-- self.物品[tp.场景.抓取物品ID].确定 = false
		tp.场景.抓取物品 = nil
		tp.场景.抓取物品ID = nil
		tp.场景.抓取物品注释 = nil
	end
	if self.资源组[3]:事件判断() then
		发送数据(3762,{位置=self.发送})
	elseif self.资源组[4]:事件判断() then --保留旧的
		发送数据(5016,{保留="旧",认证码=self.bb.认证码})
	elseif self.资源组[5]:事件判断() then --保留新的
		发送数据(5016,{保留="新",认证码=self.bb.认证码})
	end
end

function 宝宝进阶:刷新进阶(数据)
	self.bb = 数据
	self.已使用 = false
end

function 宝宝进阶:刷新(数据)
	self.bb = 数据.宝宝
	for i=1,20 do
		self.物品[i]:置物品(tp.道具列表[i])
	end
	for h=1,5 do
		self.右侧物品[h]:置物品(nil)
	end
	self.已使用 = true
end

function 宝宝进阶:置形象()
	self.动画={}
	if self.bb  ~= nil then
		local n = ani(self.bb.模型)
		self.动画.主体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		self.动画.主体:置方向(0)
		n = ani(self.bb.模型.."_身体")
		if n[6] ~= nil then
			self.动画.身体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			self.动画.身体:置方向(0)
		end
		if self.bb.饰品 ~= nil then
			n = ani(self.bb.模型.."_饰品")
			if n[6] ~= nil then
				self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				if self.bb.饰品颜色 then
				    self.动画.饰品:置颜色(self.bb.饰品颜色,-1)
				end
				self.动画.饰品:置方向(0)
			end
		else
			n = ani(self.bb.模型.."_装饰")
			if n[6] ~= nil then
				self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				self.动画.饰品:置方向(0)
			end
		end
		if self.bb.炫彩 ~= nil then
			self.动画.主体:炫彩染色(self.bb.炫彩,self.bb.炫彩组)
			if self.动画.身体 ~= nil then
				self.动画.身体:炫彩染色(self.bb.炫彩,self.bb.炫彩组)
			end
		else
			if self.bb.染色方案 ~= nil and self.bb.染色组~=nil then
				self.动画.主体:置染色(self.bb.染色方案,self.bb.染色组[1],self.bb.染色组[2],self.bb.染色组[3])
				self.动画.主体:置方向(0)
				if self.动画.身体 ~= nil then
					self.动画.身体:置染色(self.bb.染色方案,self.bb.染色组[1],self.bb.染色组[2],self.bb.染色组[3])
					self.动画.身体:置方向(0)
				end
			end
		end
	end
end

function 宝宝进阶:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 宝宝进阶:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
		self.窗口时间 = tp.运行时间
	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 宝宝进阶:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 宝宝进阶