-- @Author: baidwwy
-- @Date:   2024-04-14 22:22:14
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-04 18:29:45
local 场景类_合成 = class()

local floor = math.floor
local tp
local insert = table.insert
local zts1,zts2,zts3
local qjq = 引擎.取金钱颜色

function 场景类_合成:初始化(根)
	self.ID = 147
	self.x = 355
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "合成"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.物品 = {}
	local 格子 = 根._物品格子
	for i=1,20 do
		self.物品[i] = 格子(0,0,"背包_物品")
		self.物品[i]:置根(根)
	end
	self.材料 = {}
	for i=1,4 do
		self.材料[i] = 格子(0,0,"合成材料")
	end
	self.材料数量 = 0
	self.材料位置 = {}
	self.窗口时间 = 0
	tp = 根
	zts1 = tp.字体表.普通字体
	zts2 = tp.字体表.普通字体
end

function 场景类_合成:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应

	self.资源组 = {
		[1] = 自适应.创建(0,1,296,406,3,9),
		[3] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[4] = 按钮.创建(自适应.创建(17,4,66,22,1,3),0,0,4,true,true,"合 成"),
		--[5] = 资源:载入('wzife.wdf',"网易WDF动画",0xA393A808),
		--[6] = 资源:载入('nice.rpk',"网易WDF动画",0X1F73D092),
		[7] = 自适应.创建(104,1,92,22,1,3),--输入框背景
		[8] = 资源:载入('pic/标题背景.png',"图片"),

	}
	--self.触摸光环 = 资源:载入('nice.rpk',"网易WDF动画",0x01343E12)
	self.资源组[4]:置偏移(8,0)
	for n = 3,4 do
		self.资源组[n]:绑定窗口_(147)
	end
end

function 场景类_合成:打开()
	if self.可视 then
		self.可视 = false
		self.资源组 = nil
		---self.触摸光环 = nil
		for i=1,20 do
			self.物品[i]:置物品(nil)
			if i<=4 then
		    	self.材料[i]:置物品(nil)
			end
		end
		self.材料数量 = 0
		self.材料位置 = {}
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		for i=1,20 do
			self.物品[i]:置物品(tp.道具列表[i])
		end
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_合成:刷新()
	for i=1,20 do
		self.物品[i]:置物品(nil)
		if i<=4 then
	    	self.材料[i]:置物品(nil)
		end
		self.物品[i]:置物品(tp.道具列表[i])
	end
	self.材料数量=0
	self.材料位置={}
end

function 场景类_合成:显示(dt,x,y)
	self.焦点 = false
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y,true)--self.材料数量 >= 2)
	if self.资源组[3]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[4]:事件判断() then
		发送数据(3803,{材料=self.材料位置})
	end
	self.资源组[1]:显示(self.x,self.y)
	-- self.资源组[2]:显示(self.x+1,self.y+1)
	self.资源组[3]:显示(self.x+278,self.y+2)
	tp.物品界面背景_:显示(self.x+18,self.y+187)
	self.资源组[4]:显示(self.x+164,self.y+156)
	if self.资源组[4]:是否选中(x,y) then
		--\n
		tp.提示:自定义(x,y,"#G/合成规则：\n1、合成2级符石：1个1级符石、2个1-2级符石(有几率失败，随机损失1个符石)\n2、合成3级符石：1个2级符石、1个2-3级符石、1个符石卷轴(有几率失败，损失符石卷轴)\n3、合成新3级符石：2个3级符石，1个符石卷轴（有几率失败，随机损失1个三级符石及符石卷轴）\n4、合成4级符石(星位符石)：1个3级符石、2个1-3级符石、1个符石卷轴(有几率失败，损失符石卷轴)\n\n#G/说明：\n1、合成的符石均需为未激活符石\n2、合成符石无需技能，合成成功与否均为系统随机，与其他因素无关")
	end
	self.资源组[8]:显示(self.x+60,self.y)
	zts1:置颜色(白色):显示(self.x+150,self.y+2,"合  成")
	zts1:置颜色(白色):显示(self.x+28,self.y+38,"- 合成材料 -")
	local dw = 40
	self.资源组[7]:显示(self.x+197,self.y-4+dw)
	self.资源组[7]:显示(self.x+197,self.y+26+dw)
	self.资源组[7]:显示(self.x+197,self.y+56+dw)
	self.资源组[7]:显示(self.x+197,self.y+86+dw)
	zts2:置颜色(白色)
	zts2:显示(self.x+135,self.y+60+dw,"所需体力")
	zts2:显示(self.x+135,self.y+dw,"所需现金")
	zts2:显示(self.x+135,self.y+30+dw,"现有现金")
	zts2:显示(self.x+135,self.y+90+dw,"现有体力")
	--
	if self.材料数量>=2 then
		zts2:置颜色(黑色):显示(self.x+127+75,self.y+dw,0)
		zts2:显示(self.x+127+75,self.y+60+dw,40)
	else
		zts2:置颜色(黑色):显示(self.x+127+75,self.y+dw,0)
		zts2:显示(self.x+127+75,self.y+60+dw,0)
	end
	zts2:置颜色(qjq(tp.金钱)):显示(self.x+127+75,self.y+30+dw,tp.金钱)
	zts2:置颜色(黑色):显示(self.x+127+75,self.y+90+dw,tp.队伍[1].体力)

	local xx1 = 0
	local yy1 = 0
	for i=1,4 do
		tp.物品格子背景_:显示(self.x+14 + xx1 * 55,self.y + 60 + yy1 * 55)
		self.材料[i]:置坐标(self.x+14 + xx1 * 55,self.y + 60 + yy1 * 55)
		self.材料[i]:显示(dt,x,y,self.鼠标,nil,nil,nil,1)
		if self.材料[i].物品~=nil and self.材料[i].焦点 and not tp.消息栏焦点 then
			tp.物品格子焦点_:显示(self.x + 16 + xx1 * 55,self.y + 63 + yy1 * 55)
			tp.提示:道具行囊(x,y,self.材料[i].物品)
			if 引擎.鼠标弹起(左键) and self.鼠标 then
				if 取物品数量() < 20 then
					if self.材料[i].物品.可叠加 then
						增加物品(self.材料[i].物品,nil,self.材料[i].物品.数量,self.材料位置[i])
					else
					    增加物品(self.材料[i].物品,nil,nil,self.材料位置[i])
					end
					self.材料[i]:置物品(nil)
					self.材料数量 = self.材料数量 - 1
					self.材料位置[i] = nil
				else
					tp.常规提示:打开("#Y/包裹已满。请及时清理")
				end
			end
		end
		xx1 = xx1 + 1
		if xx1 == 2 then
			xx1 = 0
			yy1 = yy1 + 1
		end
	end
    local xx = 0
	local yy = 0
	for i=1,20 do
	 	if self.物品[i]~=nil and self.物品[i].物品~=nil then

	     	self.物品[i]:置坐标(self.x + xx * 51 + 25-5 ,self.y + yy * 51 + 189-3)
	     	self.物品[i]:显示(dt,x,y,self.鼠标,{0,0,self.物品[i].物品.总类 == 889 and self.物品[i].物品.分类==89},nil,nil,1)
	     	if self.物品[i].焦点 and not tp.消息栏焦点 then
				tp.物品格子焦点_:显示(self.x + xx * 50 + 22 ,self.y + yy * 51 + 189)
			end
	     	if self.物品[i].焦点 and not tp.消息栏焦点 then
				if self.物品[i].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[i].物品)
					if 引擎.鼠标弹起(左键) and self.物品[i].物品.总类 == 889 and self.物品[i].物品.分类==89 then
						if self.材料数量 < 4 then
							for n=1,4 do
								if self.材料[n].物品 == nil then
									self.材料[n]:置物品(self.物品[i].物品)
									self.材料位置[n] = i
									self.材料数量 = self.材料数量 + 1
									self.物品[i]:置物品(nil)
									break
								end
							end
						end
					end
					刷新道具逻辑(self.物品[i].物品,i,true)
				end
				self.焦点 = true
			end
	   	end
	   	xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
end

function 场景类_合成:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_合成:初始移动(x,y)
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

function 场景类_合成:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_合成