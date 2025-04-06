local 剑会排行榜 = class()
local insert = table.insert
local ztsd,字体1
function 剑会排行榜:初始化(根)
    self.ID = 159
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "剑会排行榜"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	ztsd = tp.字体表.猫猫字体
	字体1 = tp.字体表.猫猫字体
	self.类型 = 1
	self.翻页 = 0
	self.判断 = true
end

function 剑会排行榜:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.背景=资源:载入('nice.wdf',"网易WDF动画",0x81DD40D1)
	self.关闭= 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x81DD40D3),0,0,3,true,true)
	self.上一页 = 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x81DD40D2),0,0,3,true,true,"上一页")
	self.下一页 = 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x81DD40D2),0,0,3,true,true,"下一页")
	self.剑会排行= 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x81DD40D4),0,0,3,true,true,"剑会排行")
	self.剑会季度= 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x81DD40D4),0,0,3,true,true,"剑会季度")
	self.领取称谓= 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x81DD40D4),0,0,3,true,true,"领取称谓")
	self.领取称谓:置偏移(10,3)
	self.上一页:置偏移(10,1)
	self.下一页:置偏移(10,1)
end

function 剑会排行榜:打开(数据)
	if self.可视 then
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
		if self.资源组==nil then
		    self:加载资源()
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.x = (全局游戏宽度/2)-332
		self.y = (全局游戏高度/2)-242
	    self.数据=数据
	    self.类型=1
	end
end

function 剑会排行榜:剑会显示(dt,x,y)
 	-- 字体1:置样式(1)
 	字体1:置颜色(黑色):显示(self.x+170,self.y+36,"排名")
 	字体1:置颜色(黑色):显示(self.x+251,self.y+36,"名称")
 	字体1:置颜色(黑色):显示(self.x+330,self.y+36,"等级")
 	字体1:置颜色(黑色):显示(self.x+401,self.y+36,"门派")
 	字体1:置颜色(黑色):显示(self.x+464,self.y+36,"单挑积分")
 	字体1:置颜色(黑色):显示(self.x+549,self.y+36,"胜率")
 	ztsd:置样式(1)
 	for n=1,11 do
		local 序列=n
		if self.数据.剑会[序列+self.翻页]~=nil then
			ztsd:置颜色(黑色):显示(self.x+183,self.y+31+n*33,n+self.翻页)
			ztsd:置颜色(黑色):显示(self.x+267,self.y+31+n*33,self.数据.剑会[序列+self.翻页].名称)
			ztsd:置颜色(黑色):显示(self.x+344,self.y+31+n*33,self.数据.剑会[序列+self.翻页].等级)
			ztsd:置颜色(黑色):显示(self.x+416,self.y+31+n*33,self.数据.剑会[序列+self.翻页].门派)
			ztsd:置颜色(黑色):显示(self.x+494,self.y+31+n*33,self.数据.剑会[序列+self.翻页].积分)
			ztsd:置颜色(黑色):显示(self.x+566,self.y+31+n*33,self.数据.剑会[序列+self.翻页].胜率)
	 	else
			self.判断 = false
		end
 	end
 	ztsd:置样式(0)
	self.上一页:更新(x,y,self.翻页~=0)
	self.下一页:更新(x,y,self.判断)
	-- self.上一页:置偏移(10,1)
	-- self.下一页:置偏移(10,1)
	self.上一页:显示(self.x+260,self.y+430)
	self.下一页:显示(self.x+410,self.y+430)
	if self.下一页:事件判断() then
		self.翻页 = self.翻页 + 11
	elseif self.上一页:事件判断() then
		self.翻页 = self.翻页 - 11
		if self.翻页 < 0 then
			self.翻页 = 0
		end
		self.判断 = true
	elseif self.领取称谓:事件判断() then
		发送数据(6583)
	end

end

function 剑会排行榜:赛季显示(dt,x,y)
 	-- 字体1:置样式(1)
 	字体1:置颜色(黑色):显示(self.x+190,self.y+36,"排名")
 	字体1:置颜色(黑色):显示(self.x+280,self.y+36,"名称")
 	字体1:置颜色(黑色):显示(self.x+370,self.y+36,"等级")
 	字体1:置颜色(黑色):显示(self.x+460,self.y+36,"排位分")
 	-- 字体1:置颜色(黑色):显示(self.x+550,self.y+36,"是否领取")
 	-- for n=1,11 do
		-- local 序列=n
		-- if self.数据.季度[序列+self.翻页]~=nil then
		-- 	ztsd:置颜色(黑色):显示(self.x+190,self.y+31+n*33,n+self.翻页)
		-- 	ztsd:置颜色(黑色):显示(self.x+280,self.y+31+n*33,self.数据.季度[序列+self.翻页].名称)
		-- 	ztsd:置颜色(黑色):显示(self.x+370,self.y+31+n*33,self.数据.季度[序列+self.翻页].等级)
		-- 	ztsd:置颜色(黑色):显示(self.x+460,self.y+31+n*33,self.数据.季度[序列+self.翻页].积分)
		-- 	if self.数据.季度[序列+self.翻页].领取 then
		-- 		ztsd:置颜色(黑色):显示(self.x+550,self.y+31+n*33,"已领取")
		-- 	else
		-- 	    ztsd:置颜色(红色):显示(self.x+550,self.y+31+n*33,"未领取")
		-- 	end
	 -- 	else
		-- 	self.判断 = false
		-- end
 	-- end
	self.上一页:更新(x,y,self.翻页~=0)
	self.下一页:更新(x,y,self.判断)
	-- self.上一页:置偏移(10,1)
	-- self.下一页:置偏移(10,1)
	self.上一页:显示(self.x+260,self.y+430)
	self.下一页:显示(self.x+410,self.y+430)
	if self.下一页:事件判断() then
		self.翻页 = self.翻页 + 11
	elseif self.上一页:事件判断() then
		self.翻页 = self.翻页 - 11
		if self.翻页 < 0 then
			self.翻页 = 0
		end
		self.判断 = true
	end
	-- ztsd:置样式(0)
	-- 字体1:置样式(0)
end

function 剑会排行榜:显示(dt,x,y)
	-- local ztsd = tp.字体表.普通字体
	self.剑会排行:更新(x,y)
	self.剑会季度:更新(x,y)
	self.领取称谓:更新(x,y)
	self.关闭:更新(x,y)
 	self.焦点=false
 	self.背景:显示(self.x,self.y)
 	self.关闭:显示(self.x+582,self.y)
 	-- 字体1:置样式(1)
 	引擎.场景.字体表.标题字体:显示(self.x+self.背景.宽度/2,self.y+3,"单挑排行榜")
	if self.类型==1 then
		self.剑会排行:置偏移(10,2)
	else
	    self.剑会排行:置偏移(10,3)
	end
	if self.类型==2 then
		self.剑会季度:置偏移(10,2)
	else
	    self.剑会季度:置偏移(10,3)
	end
	self.剑会排行:显示(self.x+25,self.y+35,nil,nil,nil,self.类型==1,2)
	self.剑会季度:显示(self.x+25,self.y+90,nil,nil,nil,self.类型==2,2)
	self.领取称谓:显示(self.x+25,self.y+145)
 	if self.类型==1 then
     	self:剑会显示(dt,x,y)
    elseif self.类型==2 then
     	self:赛季显示(dt,x,y)
 	end
 	if self.关闭:事件判断() then
		self:打开()
		return
	end
	if self.剑会排行:事件判断() then
 		self.类型=1
 		self.判断 = true
 		self.翻页 = 0
 	elseif self.剑会季度:事件判断() then
 	    self.类型=2
 	    self.判断 = true
 		self.翻页 = 0
 	end
 	-- ztsd:置样式(0)
end

function 剑会排行榜:检查点(x,y)
	if self.可视 and self.背景:是否选中(x,y)  then
		return true
	else
		return false
	end
end
function 剑会排行榜:初始移动(x,y)
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

function 剑会排行榜:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end
return 剑会排行榜