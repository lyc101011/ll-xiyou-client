local 场景类_坐骑统御 = class()
local tp
local bwh = require("gge包围盒")
local bw1 = bwh(0,0,130,20)
local box = 引擎.画矩形
local floor = math.floor
local min = math.min
local ceil = math.ceil
function 场景类_坐骑统御:初始化(根)
	self.ID = 78
	self.x = 400
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "坐骑统御"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,169,270,3,9),
		[2] = 按钮(根.资源:载入('aaa.wdf',"网易WDF动画",0x1343E13),0,0,4),
		[3] = 根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,200,2),
		[5] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"  确定"),
		[6] = 自适应.创建(34,1,149,200,3,9),
	}
	for i=2,2 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[3]:置起始点(0)
	self.窗口时间 = 0
	self.选中召唤兽 = 0
	self.加入 = 0
	self.人物 = {}
	self.召唤数量 = {}
	tp = 根
end

function 场景类_坐骑统御:打开(认证码,统御召唤兽,统御编号)
	if self.可视 then
		self.加入 = 0
		self.选中召唤兽 = 0
		self.人物 = {宝宝列表={}}
		self.召唤数量 = {}
		self.可视 = false
	else
		table.insert(tp.窗口_,self)
		self.加入 = 0
		self.选中召唤兽 = 0
		self.人物 = tp.队伍[1]
		self.坐骑认证码 = 认证码
		self.召唤数量 = 统御召唤兽
		self.统御位置 = 统御编号
		self.可视 = true
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间

	end
end

function 场景类_坐骑统御:更新(dt,x,y)
	self:检查点(x,y)
	if self.可视 then
		self.焦点 = false

	end
end

function 场景类_坐骑统御:显示(dt,x,y)
	if self.可视 then
		self.资源组[1]:显示(self.x,self.y)
		引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"召唤兽选择")
		self.资源组[2]:更新(x,y)
		self.资源组[5]:更新(x,y,self.选中召唤兽 ~= 0)
		if not self.鼠标 then
			self.资源组[2].焦点 = 0
			-- if self.选中召唤兽 ~= 0 then
			-- 	self.资源组[5].焦点 = 0
			-- else
			-- 	self.资源组[5].焦点 = 3
			-- end
		end
		self.资源组[6]:显示(self.x + 10,self.y + 31,true)
		self.资源组[2]:显示(self.x + 148,self.y + 3)
		self.资源组[5]:显示(self.x + 45,self.y + 239,true)
		if self.鼠标 then
			if self.资源组[2]:事件判断()  then
				self:打开()
			end
			if self.资源组[5]:事件判断() and self.选中召唤兽 ~= 0 then
				if self:取是否召唤(self.人物.宝宝列表[self.选中召唤兽].认证码) then
					tp.常规提示:打开("#Y/该召唤兽已经统驭过了")
					return
				else
					发送数据(59,{认证码=self.人物.宝宝列表[self.选中召唤兽].认证码,位置 = self.统御位置,坐骑认证码 = self.坐骑认证码})
					self:打开()
					return
				end
			end
			if tp.按钮焦点 then
				self.焦点 = true
			end
		end
		if #self.人物.宝宝列表 > 6 then
			self.资源组[3]:置高度(min(floor(200/(#self.人物.宝宝列表-6)),80))
			self.加入 = min(ceil((#self.人物.宝宝列表-6)*self.资源组[3]:取百分比()),#self.人物.宝宝列表-6)
			self.资源组[3]:显示(self.x+149,self.y+31,x,y,self.鼠标)
		end
		for m=1,6 do
			if self.人物.宝宝列表[m] ~= nil then
				bw1:置坐标(self.x+14,self.y+20 + m * 30)
				if self.选中召唤兽~=m + self.加入 then
					if bw1:检查点(x,y) then
						self.焦点=true
						box(self.x+10,self.y+15 + m * 30,self.x+145,self.y+40 + m * 30,-2097481216)
						if 引擎.鼠标按住(0) then
							self.选中召唤兽 = self.加入 + m
						end
					end
				else
					box(self.x+10,self.y+15 + m * 30,self.x+145,self.y+40 + m * 30,-9670988)
				end

				tp.字体表.普通字体:置颜色(0xFF222222):显示(self.x+20 ,self.y+20 + m * 30,self.人物.宝宝列表[m + self.加入].名称)
				if self.人物.宝宝列表[m + self.加入].统御~=nil then
				    tp.字体表.普通字体:置颜色(0xff009933):显示(self.x+80 ,self.y+20 + m * 30,"（统御中）")
				end

			end
		end
		if self.资源组[6]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
			self.资源组[3]:置起始点(self.资源组[3]:取百分比转换(self.加入-1,6,#self.人物.宝宝列表))
		elseif self.资源组[6]:是否选中(x,y) and 引擎.取鼠标滚轮() ==-1 and self.加入 < #self.人物.宝宝列表 - 6 then--鼠标下滚动
			self.资源组[3]:置起始点(self.资源组[3]:取百分比转换(self.加入+1,6,#self.人物.宝宝列表))
		end

		-- local 偏移x = 26
		-- local 偏移y = 20
		-- for m=1,12 do
		-- 	if self.人物.宝宝列表[m] ~= nil then
		-- 		if((m + self.加入) <= (5 + self.加入)) then
		-- 			if(mx - self.x > 10 and my - self.y+4 > 偏移y + 20*m and mx - self.x < 130 and my - self.y + 4 < 偏移y + 20*(m+1) ) and self.鼠标 and not 文本栏焦点 then
		-- 				if (mx - self.x > 10 and my - self.y+4 > 偏移y + 20*m and mx - self.x < 130 and my - self.y + 4 < 偏移y + 20*(m+1) ) and self.人物.宝宝列表[m] ~= nil and not 文本栏焦点 then
		-- 					if 引擎.鼠标弹起(0) then
		-- 						self.选中召唤兽 = m + self.加入
		-- 					end
		-- 					for n=1,19 do
		-- 						引擎.画线(self.x-3 + 偏移x,self.y + 偏移y + 30 * m - 3 + n,self.x + 130,self.y + 偏移y + 30 * m - 3 + n,ARGB(255,201,207,109))
		-- 					end
		-- 					self.焦点 = true
		-- 				end
		-- 			end
		-- 		end
		-- 	end
		-- end
		-- if (self.选中召唤兽 - self.加入) > 0  and (self.选中召唤兽 - self.加入 <= 5) then
		-- 	for n=1,19 do
		-- 		引擎.画线(self.x-3 + 偏移x,self.y + 偏移y + 30 * (self.选中召唤兽 - self.加入) - 3 + n,self.x + 130,self.y + 偏移y + 30 * (self.选中召唤兽 - self.加入) - 3 + n,ARGB(255,91,90,219))
		-- 	end
		-- end
		-- for n=1,12	do
		-- 	if((n + self.加入) <= (5 + self.加入)) and self.人物.宝宝列表[n + self.加入]~=nil then
		-- 		local 颜色 = ARGB(255,0,0,0)
		-- 		if self.人物.宝宝列表[n + self.加入] ==  self.人物.参战宝宝 then
		-- 			颜色 = ARGB(255,255,255,0)
		-- 		end
		-- 		if self:取是否召唤(self.人物.宝宝列表[n + self.加入].认证码)==false then
		-- 			tp.字体表.普通字体:置颜色(颜色):显示(self.x + 偏移x,self.y + 偏移y + n * 30,self.人物.宝宝列表[n + self.加入].名称)
		-- 		else
		-- 			tp.字体表.普通字体:置颜色(红色):显示(self.x + 偏移x,self.y + 偏移y + n * 30,self.人物.宝宝列表[n + self.加入].名称)
		-- 		end
		-- 	end
		-- end
	end
end
function 场景类_坐骑统御:取是否召唤(id)
	for n=1,#self.召唤数量 do
		if self.召唤数量[n]==id then
			return true
		end
	end
	return false


end

function 场景类_坐骑统御:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_坐骑统御:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
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

function 场景类_坐骑统御:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_坐骑统御