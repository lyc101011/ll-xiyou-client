-- @Author: baidwwy
-- @Date:   2023-10-25 19:42:10
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-10-26 00:16:05

local 角色查看 = class()


function 角色查看:初始化(根)
	tp = 根
	self.ID = 104
	self.x = 全局游戏宽度/2-600/2
	self.y = 全局游戏高度/2-432/2
	self.xx = 0
	self.yy = 0
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.属性文字 = tp.字体表.通用字体12
	self.可移动 = true
end

function 角色查看:打开(内容)
	if self.可视 then
		self.可视 = false
	else
		table.insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.角色数据 = 内容.角色数据
		self.召唤兽数据 = 内容.召唤兽数据
		self.装备数据  = 内容.装备数据
		self.灵饰数据  = 内容.灵饰数据
		self.背景 = tp.资源:载入('pic111/出售信息.png',"图片")
		self.灵饰格子 = tp.资源:载入('pic111/格子.png',"图片")
		self.宠物tx背景_= tp.资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B)
		self.可视 = true
		self.装备 = {}
		self.灵饰 = {}
		local 格子 = tp._物品格子
		for i=1,6 do
		    if self.装备数据[i] ~= nil then
		    	self.装备[i] = 格子.创建(0,0,i,"藏宝阁出售_物品")
				self.装备[i]:置物品(self.装备数据[i])
		    end
		end
		for i=1,4 do
		    if self.灵饰数据[i] ~= nil then
		    	self.灵饰[i] = 格子.创建(0,0,i,"藏宝阁出售_物品")
				self.灵饰[i]:置物品(self.灵饰数据[i])
		    end
		end
		for i=1,#self.召唤兽数据 do
			local xn = 引擎.取头像(self.召唤兽数据[i].模型)
		    self.召唤兽数据[i].小动画 = tp.资源:载入(xn[7],"网易WDF动画",xn[1])
		end
	end
end


function 角色查看:更新(dt)

end


function 角色查看:显示(dt,x,y)
	self.背景:显示(self.x,self.y)
	self.右键关闭 = nil
	self.焦点 = false
	self.属性文字:置颜色(0xFF007799)

	self.属性文字:显示(self.x+53,self.y+96,self.角色数据.等级)
	self.属性文字:显示(self.x+53,self.y+118,self.角色数据.模型)
	self.属性文字:显示(self.x+53,self.y+118+20,self.角色数据.BPMC)
	self.属性文字:显示(self.x+53,self.y+118+20*2,self.角色数据.门派)
	self.属性文字:显示(self.x+53,self.y+118+20*3,self.角色数据.最大气血)
	self.属性文字:显示(self.x+53,self.y+119+20*4,self.角色数据.最大魔法)
	self.属性文字:显示(self.x+53,self.y+119+20*5,self.角色数据.命中)
	self.属性文字:显示(self.x+53,self.y+121+20*6,self.角色数据.伤害)
	self.属性文字:显示(self.x+53,self.y+120+20*7,self.角色数据.防御)
	self.属性文字:显示(self.x+53,self.y+121+20*8,self.角色数据.速度)
	self.属性文字:显示(self.x+53,self.y+120+20*9,self.角色数据.法伤)
	self.属性文字:显示(self.x+53,self.y+121+20*10,self.角色数据.法防)
	-------------------------------------------------------------
	self.属性文字:显示(self.x+238,self.y+96,self.角色数据.名称)
	self.属性文字:显示(self.x+238,self.y+118,self.角色数据.人气)
	self.属性文字:显示(self.x+238,self.y+118+20,self.角色数据.BG)
	self.属性文字:显示(self.x+238,self.y+118+20*2,self.角色数据.门贡)
	self.属性文字:显示(self.x+238,self.y+118+20*3,self.角色数据.体质)
	self.属性文字:显示(self.x+238,self.y+119+20*4,self.角色数据.魔力)
	self.属性文字:显示(self.x+238,self.y+119+20*5,self.角色数据.力量)
	self.属性文字:显示(self.x+238,self.y+121+20*6,self.角色数据.耐力)
	self.属性文字:显示(self.x+238,self.y+120+20*7,self.角色数据.敏捷)
	self.属性文字:显示(self.x+238,self.y+121+20*8,self.角色数据.潜力)
	-------------------------------------------------------------
	self.属性文字:显示(self.x+448,self.y+96,self.角色数据.修炼.攻击修炼[1] or "0")
	self.属性文字:显示(self.x+448,self.y+118,self.角色数据.修炼.防御修炼[1] or "0")
	self.属性文字:显示(self.x+448,self.y+118+20,self.角色数据.修炼.法术修炼[1] or "0")
	self.属性文字:显示(self.x+448,self.y+118+20*2,self.角色数据.修炼.抗法修炼[1] or "0")
	self.属性文字:显示(self.x+613-30,self.y+96,self.角色数据.bb修炼.攻击控制力[1] or "0")
	self.属性文字:显示(self.x+613-30,self.y+118,self.角色数据.bb修炼.防御控制力[1] or "0")
	self.属性文字:显示(self.x+613-30,self.y+118+20,self.角色数据.bb修炼.法术控制力[1] or "0")
	self.属性文字:显示(self.x+613-30,self.y+118+20*2,self.角色数据.bb修炼.抗法控制力[1] or "0")
	local xx = 0
	local yy = 1

	for i=1,6 do
		 xx = xx + 1
	    if self.装备[i] ~= nil and self.装备[i].物品 ~= nil then
	    	if self.装备[i].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.装备[i].物品)
			end
			self.灵饰格子:显示(self.x +429-38+ xx * 58-49,self.y+385-78-5+ yy * 57-31)
			self.装备[i]:置坐标(self.x +429-38+ xx * 58-46,self.y+385-78-5 + yy * 57-30)
			self.装备[i]:显示(dt,x,y,self.鼠标,nil,0.7)
	    end
	    	if xx >= 3 then
			xx = 0
			yy = yy + 1
		end
	end








	for i=1,4 do
	    if self.灵饰[i] ~= nil and self.灵饰[i].物品 ~= nil then
	    	if self.灵饰[i].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.灵饰[i].物品)
			end
			self.灵饰格子:显示(self.x+429-56+(i-1)*55, self.y+385-5-104)
			self.灵饰[i]:置坐标(self.x+429-53+(i-1)*55, self.y+385-5-104)
			self.灵饰[i]:显示(dt,x,y,self.鼠标)
	    end
	end
	local xx = 0
	local yy = 0
	for i=1,#self.召唤兽数据 do
		self.宠物tx背景_:显示(self.x+410-37+xx*40,self.y+180-57+72+yy*41)
		self.召唤兽数据[i].小动画:显示(self.x+410-34+xx*40,self.y+180-54+72+yy*41)

		if self.召唤兽数据[i].小动画:是否选中(x,y) then
			if 引擎.鼠标弹起(右键) then
				self.右键关闭 = true
				tp.窗口.召唤兽查看栏:打开(self.召唤兽数据[i])
			end
		end
		xx = xx +1
		if xx >= 3 then
			xx = 0
			yy = yy +1
		end
	end

end
function 角色查看:检查点(x,y)
	if self.背景:是否选中(x,y) then
		return true
	end
end

function 角色查看:初始移动(x,y)
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

function 角色查看:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 角色查看