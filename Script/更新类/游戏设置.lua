-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-13 08:18:07
local 游戏设置 = class()
local mousea = 引擎.鼠标弹起
local tp,zts1,zts2
local insert = table.insert
function 游戏设置:初始化(根)
	self.ID = 143
	self.x = 310
	self.y = 60
	self.xx = 0
	self.yy = 0
	self.注释 = "游戏设置"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = 0
	tp = 根
	self.窗口时间 = 0
	zts1 = tp.字体表.普通字体
	self.项目={"定时刷怪","游泳比赛","门派闯关","文韵墨香","彩虹争霸","降妖伏魔","帮派迷宫","天降辰星","保卫长安","帮战","镖王活动","剑会"}
	self.标识={"间隔","时，分，秒"}
end

function 游戏设置:打开(内容)
	if self.可视 then
		for i=1,#self.项目 do
			self.输入[self.项目[i]]:置可视(false,false)
		end
		for i=1,#self.右侧 do
			self.shuru[i]:置可视(false,false)
		end
		self.输入={}
		self.SZ={}
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
		self.SZ={}
		for k,v in pairs(内容) do
			if k=="定时刷怪" then
				self.SZ[k]={}
				for a,b in pairs(v) do
					self.SZ[k][a]={}
					self.SZ[k][a].时间=b.时.."，"..b.分.."，"..b.秒
				end
			else
				self.SZ[k]={}
				self.SZ[k].日期=v.大写日期
				self.SZ[k].时间=v.时.."，"..v.分.."，"..v.秒
			end
		end
		if self.资源组==nil then
			self:加载资源()
		end
		self.输入={}
		self.刷怪类型="巡山小妖"
		self:加载输入框()
		self.资源组[1]:置宽高(566,390)
		self.x=取界面坐标(self.资源组[1].宽度)
		self.分类=1
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 游戏设置:加载输入框()
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('srkj')
	总控件:置可视(true,true)
	for i=1,#self.项目 do
		self.输入[self.项目[i]]=总控件:创建输入("时间输入",0,0,96,14,tp)
		self.输入[self.项目[i]]:置可视(false,false)
		self.输入[self.项目[i]]:置限制字数(12)
		self.输入[self.项目[i]]:置光标颜色(0xFFFFFFFF)
		self.输入[self.项目[i]]:置文字颜色(0xFFFFFFFF)
		if self.项目[i]=="定时刷怪" then
			self.输入[self.项目[i]]:置文本(self.SZ[self.项目[i]]["巡山小妖"].时间)
		else
			self.输入[self.项目[i]]:置文本(self.SZ[self.项目[i]].时间)
		end
	end
	self.ID输入={}
	self.ID输入=总控件:创建输入("idsr",0,0,96,14,tp)
	self.ID输入:置可视(true,true)
	self.ID输入:置数字模式()
	self.ID输入:置限制字数(12)
	self.ID输入:置光标颜色(0xFFFFFFFF)
	self.ID输入:置文字颜色(0xFFFFFFFF)
	-- self.ID输入:置文本(self.SZ[self.项目[i]].时间)--self.输入类别[self.项目[i]])
	self.DJ输入={}
	self.DJ输入=总控件:创建输入("dfsr",0,0,500,23,tp)
	self.DJ输入:置可视(true,true)
	self.DJ输入:置限制字数(120)
	self.DJ输入:置光标颜色(黑色)
	self.DJ输入:置文字颜色(黑色)
	-- self.BL输入={}
	-- self.BL输入=总控件:创建输入("dfs5r",0,0,270,23,tp)
	-- self.BL输入:置可视(false,false)
	-- self.BL输入:置限制字数(5000)
	-- self.BL输入:置光标颜色(黑色)
	-- self.BL输入:置文字颜色(黑色)
	self.难度={}
	self.难度=总控件:创建输入("idsr",0,0,75,14,tp)
	self.难度:置可视(false,false)
	-- self.难度:置数字模式()
	self.难度:置限制字数(5)
	self.难度:置光标颜色(0xFFFFFFFF)
	self.难度:置文字颜色(0xFFFFFFFF)
	self.wp概率={}
	self.wp概率=总控件:创建输入("idsr",0,0,75,14,tp)
	self.wp概率:置可视(false,false)
	self.wp概率:置数字模式()
	self.wp概率:置限制字数(5)
	self.wp概率:置光标颜色(0xFFFFFFFF)
	self.wp概率:置文字颜色(0xFFFFFFFF)
			self.右侧={"怪物难度系数：","经验倍数：","银子倍数：","获得物品概率：","书铁等级范围：","宝珠钨金珍珠：","宝石等级范围：","金丹品质范围：","怪物卡片范围："}--,"摄灵珠范围  ："
			self.shuru={}
	for i=1,#self.右侧 do
		self.shuru[i]=总控件:创建输入("idsr",0,0,75,14,tp)
		self.shuru[i]:置可视(false,false)
		-- self.shuru[i]:置数字模式()
		self.shuru[i]:置限制字数(20)
		self.shuru[i]:置光标颜色(0xFFFFFFFF)
		self.shuru[i]:置文字颜色(0xFFFFFFFF)
	end
	self.BL输入={}
	for i=1,20 do
		self.BL输入[i]=总控件:创建输入("dfs25r",0,0,100,14,tp)
		self.BL输入[i]:置可视(false,false)
		self.BL输入[i]:置限制字数(100)
		self.BL输入[i]:置光标颜色(0xFFFFFFFF)
		self.BL输入[i]:置文字颜色(0xFFFFFFFF)
	end
	self.LS输入={}
	for i=1,8 do
		self.LS输入[i]=总控件:创建输入("dfs125r",0,0,100,14,tp)
		self.LS输入[i]:置可视(false,false)
		self.LS输入[i]:置限制字数(20)
		self.LS输入[i]:置光标颜色(0xFFFFFFFF)
		self.LS输入[i]:置文字颜色(0xFFFFFFFF)
	end
end

function 游戏设置:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local 小型选项栏 = tp._小型选项栏
	self.资源组 = {
		[1] = 自适应.创建(0,1,566,390,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"道具处理"),
		[4] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"活动时间"),
		[5] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"活动设置"),
		[6] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"装备处理"),
		[88] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"确定操作"),
		[99] = 自适应.创建(78,1,524,120,3,9),
	}
	for i=3,6 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.DZ资源组 = {
		[1] = 按钮.创建(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"  灵 饰"),
		[2] = 按钮.创建(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"  装 备"),
		[3] = 按钮.创建(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"  宝 宝"),
	}
	for i=1,3 do
		self.DZ资源组[i]:绑定窗口_(self.ID)
	end

	self.资源组[88]:绑定窗口_(self.ID)
	self.选项栏={
		[1] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[2] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[4] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[7] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[8] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[9] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[10] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[11] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[12] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[13] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		-- [14] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),--dz
		-- [15] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),--dz
		-- [16] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),--dz
		-- [17] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),--dz
		-- [18] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),--dz
		[99] = 自适应.创建(103,1,1,1,1,3,nil,18),
	}
	for i=1,13 do
		self.选项栏[i]:绑定窗口_(self.ID)
	end
	self.xiao选项栏={
		[11] = 小型选项栏.创建(自适应.创建(8,1,95,115,3,9),"定时刷怪"),
		[12] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"游泳比赛"),
		[13] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"门派闯关"),
		[14] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"文韵墨香"),
		[15] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"彩虹争霸"),
		[16] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"降妖伏魔"),
		[17] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"帮派迷宫"),
		[18] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"天降辰星"),
		[19] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"保卫长安"),
		[20] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"帮战"),
		[21] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"镖王活动"),
		[22] = 小型选项栏.创建(自适应.创建(8,1,86,115,3,9),"剑会"),
		[23] = 小型选项栏.创建(自适应.创建(8,1,152,160,3,9),"爆率"),
		[24] = 小型选项栏.创建(自适应.创建(8,1,90,115,3,9),"LS"),
	}
	self.确认按钮={
		[1] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[2] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[3] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[4] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[5] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[6] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[7] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[8] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[9] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[10] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[11] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
		[12] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"确认"),
	}

	for i=1,12 do
		self.确认按钮[i]:绑定窗口_(self.ID)
	end
	self.DZ分类=1
	self.LS={mubiao=0,部位="戒指",属性表={"伤害","伤害","伤害","伤害"},属性值={9,9,9,9},专用="否",无级别="是",制造者="否",等级=60}
end

function 游戏设置:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	for i=3,6 do
		self.资源组[i]:更新(x,y)
		self.资源组[i]:显示(self.x-68+83*(i-2),self.y+30,nil,nil,nil,self.分类==i-2,2) --按钮
	end
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"游戏设置")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	if self.分类==1 then--道具
		self:道具显示(dt,x,y)
	elseif self.分类==2 then--活动时间
		self:活动时间显示(dt,x,y)
	elseif self.分类==3 then--爆率设置
		self:爆率显示(dt,x,y)
	elseif self.分类==4 then

		self:DZ显示(dt,x,y)
	end
	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[3]:事件判断() then--道具处理
		for i=1,#self.项目 do
			self.输入[self.项目[i]]:置可视(false,false)
		end
		self.ID输入:置可视(true,true)
		self.DJ输入:置可视(true,true)
		for i=1,20 do
			self.BL输入[i]:置可视(false,false)
		end

		for i=1,#self.右侧 do
			self.shuru[i]:置可视(false,false)
		end
		for i=1,8 do
			self.LS输入[i]:置可视(false,false)
		end
		self.分类=1
		self.资源组[1]:置宽高(566,390)
	elseif self.资源组[4]:事件判断() then--活动时间
		for i=1,#self.项目 do
			self.输入[self.项目[i]]:置可视(true,true)
		end
		self.ID输入:置可视(false,false)
		self.DJ输入:置可视(false,false)
		for i=1,20 do
			self.BL输入[i]:置可视(false,false)
		end
		for i=1,#self.右侧 do
			self.shuru[i]:置可视(false,false)
		end
		for i=1,8 do
			self.LS输入[i]:置可视(false,false)
		end
		self.分类=2
		self.资源组[1]:置宽高(566,390+32+32)
	elseif self.资源组[5]:事件判断() then--爆率设置
		for i=1,#self.项目 do
			self.输入[self.项目[i]]:置可视(false,false)
		end
		self.ID输入:置可视(false,false)
		self.DJ输入:置可视(false,false)
		for i=1,8 do
			self.LS输入[i]:置可视(false,false)
		end

		发送数据(6904)
	elseif self.资源组[6]:事件判断() then--DZ
		for i=1,#self.项目 do
			self.输入[self.项目[i]]:置可视(false,false)
		end
		self.ID输入:置可视(true,true)
		self.DJ输入:置可视(false,false)
		for i=1,20 do
			self.BL输入[i]:置可视(false,false)
		end

		for i=1,#self.右侧 do
			self.shuru[i]:置可视(false,false)
		end
		local asa={self.LS.属性表[1].."="..self.LS.属性值[1],self.LS.属性表[2].."="..self.LS.属性值[2],self.LS.属性表[3].."="..self.LS.属性值[3],self.LS.属性表[4].."="..self.LS.属性值[4],self.LS.等级,self.LS.专用,self.LS.无级别,self.LS.制造者}
		for i=1,8 do
			self.LS输入[i]:置可视(true,true)
			self.LS输入[i]:置文本(asa[i])
		end
		self.分类=4
		self.资源组[1]:置宽高(566,390)
	end
end

function 游戏设置:DZ显示(dt,x,y)
	zts:置颜色(白色)
	zts:显示(self.x+17,self.y+70,"输入ID：")
	self.选项栏[99]:置宽高(105,22)
	self.选项栏[99]:显示(self.x+73,self.y+67)
	self.ID输入:置坐标(self.x+80,self.y+70)
	if self.ID输入._已碰撞 then
		self.焦点 = true
	end
	local aa=false
	if self.ID输入:取文本()~="" then
		local bb=true
		for i=1,8 do
			if self.LS输入[i]:取文本()=="" then
				bb=false
				break
			end
		end
		if bb then
		    aa=true
		end
	end
	self.资源组[88]:更新(x,y,aa)
	self.资源组[88]:显示(self.x+250,self.y+353)--确定操作
	for i=1,3 do
		self.DZ资源组[i]:更新(x,y)
		self.DZ资源组[i]:显示(self.x+100+110*i,self.y+67,nil,nil,nil,self.DZ分类==i,2) --按钮
	end
	if self.DZ分类==1 then
		self.选项栏[99]:置宽高(105,22)
		local sssq = {"部位选择：","主属性：","属性一：","属性二：","属性三：","等级：","专用：","无级别：","制造者："}
		local sasw=0
		for i=1,5 do
			if i==1 then
				sasw=110
			else
				sasw=0
			end
			self.选项栏[99]:显示(self.x+100+sasw,self.y+70+i*40)
			zts:置颜色(绿色)
			zts:显示(self.x+30+sasw,self.y+73+i*40,sssq[i])
		end
		for i=6,9 do
			self.选项栏[99]:显示(self.x+100+210,self.y+70+(i-4)*40)
			zts:置颜色(绿色)
			zts:显示(self.x+30+210,self.y+73+(i-4)*40,sssq[i])
		end

		self.选项栏[1]:更新(x,y)
		self.选项栏[1]:显示(self.x+185+110,self.y+70+1*40) --按钮
		if self.xiao选项栏[24]:事件判断() then
			self.LS.部位=self.xiao选项栏[24].弹出事件
			self.xiao选项栏[24].弹出事件 = nil
		end
		self.xiao选项栏[24]:显示(self.x+185-84+110,self.y+70+42-25+1*40,x,y,self.鼠标)
		if self.选项栏[1]:事件判断() then
			local xx={"戒指","手镯","耳饰","佩饰"}
			self.xiao选项栏[24]:打开(xx)
			self.xiao选项栏[24]:置选中(xx[1])
		end

		zts1:置颜色(白色)
		zts1:显示(self.x+112+110,self.y+113,self.LS.部位)
		for i=1,4 do
			self.LS输入[i]:置坐标(self.x+112,self.y+113+i*40)
			if self.LS输入[i]._已碰撞 then
				self.焦点 = true
			end
		end
		for i=5,8 do
			self.LS输入[i]:置坐标(self.x+112+60+150,self.y+113+(i-4)*40)
			if self.LS输入[i]._已碰撞 then
				self.焦点 = true
			end
		end
		if self.资源组[88]:事件判断() then
			local sx={}
			for i=1,8 do
				sx[i]=self.LS输入[i]:取文本() --zhegbudui
				if i<=4 then
					local sere=分割文本(sx[i],"=")
					self.LS.属性表[i]=sere[1]
					self.LS.属性值[i]=sere[2]+0
				end
			end
			self.LS.等级=sx[5]+0
			self.LS.专用=sx[6]
			self.LS.无级别=sx[7]
			self.LS.制造者=sx[8]
			self.LS.mubiao=self.ID输入:取文本()
			发送数据(6906,self.LS)
		end
	end
end





























function 游戏设置:爆率显示(dt,x,y)
	zts:置颜色(黄色)
	zts:显示(self.x+17+150-28+110,self.y+71,"选择项目：")
	self.选项栏[99]:置宽高(148,22)
	self.选项栏[99]:显示(self.x+73+10+150-28+110,self.y+67)

	zts1:置颜色(白色)
	zts1:显示(self.x+27+68+150-28+100,self.y+71,self.bl选中活动)
	-- zts1:显示(self.x+27+68,self.y+71+100,self.blwb)
	self.选项栏[99]:置宽高(105,22)

	for i=1,#self.右侧 do
		self.选项栏[99]:显示(self.x+425+45,self.y+100+(i-1)*31)
		if i<=3 then
					zts1:置颜色(红色)
		elseif i==4 then
			zts1:置颜色(绿色)
		else
			zts1:置颜色(黄色)
		end
		zts1:显示(self.x+330+45,self.y+104+(i-1)*31,self.右侧[i])
		if self.bl选中活动~="" then
			self.shuru[i]:置坐标(self.x+452+45,self.y+104+(i-1)*31)
			if self.shuru[i]._已碰撞 then
				self.焦点 = true
			end
			-- if self.shuru[i]:取文本()=="" then
			--        go=false
			-- end
		end
	end
	local xxx,yyy=1,1
	for i=1,20 do
		self.选项栏[99]:显示(self.x+60+(xxx-1)*155,self.y+100+(yyy-1)*31)
		zts1:置颜色(绿色)
		zts1:显示(self.x+12+(xxx-1)*157,self.y+104+(yyy-1)*31,"物品"..i)
		if self.bl选中活动~="" then
			self.BL输入[i]:置坐标(self.x+65+(xxx-1)*155,self.y+104+(yyy-1)*31)
			if self.BL输入[i]._已碰撞 then
				self.焦点 = true
			end
		end
		yyy=yyy+1
		if yyy>=11 then
			yyy=1
			xxx=2
		end
	end
	-- self.BL输入:置坐标(self.x+36,self.y+105)
	-- if self.BL输入._已碰撞 then
	--  self.焦点 = true
	-- end
	--self.右侧={"怪物难度系数：","获得物品概率：","书铁等级范围：","宝珠钨金珍珠：","宝石等级范围：","金丹品质范围：","怪物卡片范围："}--,"摄灵珠范围  ："
	local tj=self.bl选中活动~=""
	-- if self.bl选中活动~="" then
	self.资源组[88]:更新(x,y,tj)
	-- self.资源组[6]:更新(x,y,self.bl选中活动~="" ) --清空
	-- end
	-- self.资源组[6]:显示(self.x+340,self.y+353)--清空
	self.资源组[88]:显示(self.x+250,self.y+440)--确定
	self.选项栏[13]:更新(x,y)
	-- self.资源组[99]:置宽高(300,270)
	-- self.资源组[99]:显示(self.x+17,self.y+100)
	if self.选项栏[13]:事件判断() then
		self.xiao选项栏[23]:打开(self.bl活动名称)
		self.xiao选项栏[23]:置选中(self.bl活动名称[1])
	end

	if self.xiao选项栏[23]:事件判断() then
		self.bl选中活动 =self.xiao选项栏[23].弹出事件
		self.xiao选项栏[23].弹出事件 = nil
		self.blwb=self:取爆率(self.bl选中活动)
	end
	self.选项栏[13]:显示(self.x+457,self.y+67) --按钮
	self.xiao选项栏[23]:显示(self.x+316,self.y+85,x,y,self.鼠标) --141   18
	zts1:置颜色(黄色)
	zts1:显示(self.x+5,self.y+325+89,"（无级别、灵饰特效宝珠和神兜兜，概率为n‰）其他概率n％，灵饰、宝宝书铁无需设置等级。")
	if self.资源组[88]:事件判断() then
		local fasong={}
		for i=1,#self.右侧 do
			fasong[i]=self.shuru[i]:取文本() --zhegbudui
		end
		local bl={}
		for i=1,20 do
			if self.BL输入[i]:取文本()~="" then
				 bl[i]=self.BL输入[i]:取文本()
			end
		end
		发送数据(6903,{活动=self.bl选中活动,爆率文本=bl,其他=fasong})
	-- elseif self.资源组[6]:事件判断() then
		-- self.BL输入:置文本("")
	end

end



function 游戏设置:道具显示(dt,x,y)

	zts:置颜色(白色)
	zts:显示(self.x+17,self.y+70,"输入ID：")
	self.选项栏[99]:置宽高(105,22)
	self.选项栏[99]:显示(self.x+73,self.y+67)
	self.资源组[88]:更新(x,y,self.ID输入:取文本()~="" and self.DJ输入:取文本()~="")
	self.资源组[88]:显示(self.x+250,self.y+353)--确定
	self.资源组[99]:置宽高(524,120)
	self.资源组[99]:显示(self.x+17,self.y+109)
	zts1:置颜色(黄色)
	zts1:显示(self.x+162,self.y+325,"注意：“逗号”“，”为中文，英文则不生效")

	self.ID输入:置坐标(self.x+80,self.y+70)
	if self.ID输入._已碰撞 then
		self.焦点 = true
	end
	self.DJ输入:置坐标(self.x+36,self.y+120)
	if self.DJ输入._已碰撞 then
		self.焦点 = true
	end
	if self.资源组[88]:事件判断() then
		发送数据(6902,{mubiao=self.ID输入:取文本(),wup=self.DJ输入:取文本()})
	end
end

function 游戏设置:活动时间显示(dt,x,y)

	for i=1,#self.项目 do
		zts:置颜色(黄色):显示(self.x+18,self.y+65+(i-1)*31,self.项目[i])
		-- self.输入[self.项目[i]]:置可视(true,true)
	end
	zts:置颜色(白色)
	zts:显示(self.x+114,self.y+65,"类型")
	zts:显示(self.x+114+160,self.y+65,"时，分，秒")
	for n=1,#self.项目-1 do
		for i=1,4 do
			zts:显示(self.x+114+160*(i-1),self.y+65+(n)*31,self.标识[i])
		end
	end
	self.选项栏[99]:置宽高(105,22)
	for i=1,#self.项目 do
		self.选项栏[99]:显示(self.x+138+10,self.y+61+(i-1)*31) --灰色显示
		self.选项栏[i]:更新(x,y)
		self.选项栏[i]:显示(self.x+213+10+10,self.y+61+(i-1)*31) --按钮
		self.确认按钮[i]:更新(x,y)
		self.确认按钮[i]:显示(self.x+500,self.y+61+(i-1)*31)
	end
	zts1:置颜色(白色)
	zts1:显示(self.x+138+10+14,self.y+65+(1-1)*31,self.刷怪类型)--self.SZ["定时刷怪"][self.刷怪类型].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(2-1)*31,self.SZ["游泳比赛"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(3-1)*31,self.SZ["门派闯关"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(4-1)*31,self.SZ["文韵墨香"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(5-1)*31,self.SZ["彩虹争霸"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(6-1)*31,self.SZ["降妖伏魔"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(7-1)*31,self.SZ["帮派迷宫"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(8-1)*31,self.SZ["天降辰星"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(9-1)*31,self.SZ["保卫长安"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(10-1)*31,self.SZ["帮战"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(11-1)*31,self.SZ["镖王活动"].日期)
	zts1:显示(self.x+138+10+14,self.y+65+(12-1)*31,self.SZ["剑会"].日期)
	zts1:置颜色(黄色)
	zts1:显示(self.x+45,self.y+368+31+32,"注意：时，分，秒 输入时必须用“逗号”隔开“，”为中文，英文则不生效")
	self.选项栏[99]:置宽高(120,22)
	for i=1,#self.项目 do
		self.选项栏[99]:显示(self.x+345+10,self.y+61+(i-1)*31) --灰色显示
		self.xiao选项栏[10+i]:显示(self.x+213-115+32+18,self.y+61+16+(i-1)*31,x,y,self.鼠标) --选项栏
	end

	if self.选项栏[1]:事件判断() then
		local lx="定时刷怪"
		self.xiao选项栏[11]:打开(self:取分类(lx))
	                         --self.选项栏[11]:置选中(self.SZ[lx][].日期)
	elseif self.选项栏[2]:事件判断() then
		local lx="游泳比赛"
		self.xiao选项栏[12]:打开(self:取分类(lx))
		self.xiao选项栏[12]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[3]:事件判断() then
		local lx="门派闯关"
		self.xiao选项栏[13]:打开(self:取分类(lx))
		self.xiao选项栏[13]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[4]:事件判断() then
		local lx="文韵墨香"
		self.xiao选项栏[14]:打开(self:取分类(lx))
		self.xiao选项栏[14]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[5]:事件判断() then
		local lx="彩虹争霸"
		self.xiao选项栏[15]:打开(self:取分类(lx))
		self.xiao选项栏[15]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[6]:事件判断() then
		local lx="降妖伏魔"
		self.xiao选项栏[16]:打开(self:取分类(lx))
		self.xiao选项栏[16]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[7]:事件判断() then
		local lx="帮派迷宫"
		self.xiao选项栏[17]:打开(self:取分类(lx))
		self.xiao选项栏[17]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[8]:事件判断() then
		local lx="天降辰星"
		self.xiao选项栏[18]:打开(self:取分类(lx))
		self.xiao选项栏[18]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[9]:事件判断() then
		local lx="保卫长安"
		self.xiao选项栏[19]:打开(self:取分类(lx))
		self.xiao选项栏[19]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[10]:事件判断() then
		local lx="帮战"
		self.xiao选项栏[20]:打开(self:取分类(lx))
		self.xiao选项栏[20]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[11]:事件判断() then
		local lx="镖王活动"
		self.xiao选项栏[21]:打开(self:取分类(lx))
		self.xiao选项栏[21]:置选中(self.SZ[lx].日期)
	elseif self.选项栏[12]:事件判断() then
		local lx="剑会"
		self.xiao选项栏[22]:打开(self:取分类(lx))
		self.xiao选项栏[22]:置选中(self.SZ[lx].日期)
	end
	if self.xiao选项栏[11]:事件判断() then
		local xxq=self.xiao选项栏[11].弹出事件
		if xxq=="天罡星" or xxq=="地煞星" or xxq=="封妖" or xxq=="妖王" then
			引擎.场景.常规提示:打开("#Y/该功能暂时无法设置^^已切换为默认【天罡星】")
			xxq="天罡星"
		end
		self.刷怪类型=xxq

		self.输入["定时刷怪"]:置文本(self.SZ["定时刷怪"][self.刷怪类型].时间)
		self.xiao选项栏[11].弹出事件=nil
	elseif self.xiao选项栏[12]:事件判断() then
		local xxq=self.xiao选项栏[12].弹出事件
		-- self.日期["游泳比赛"]=xxq
		self.SZ["游泳比赛"].日期=xxq
		self.xiao选项栏[12].弹出事件=nil
	elseif self.xiao选项栏[13]:事件判断() then
		local xxq=self.xiao选项栏[13].弹出事件
		-- self.日期["门派闯关"]=xxq
		self.SZ["门派闯关"].日期=xxq
		self.xiao选项栏[13].弹出事件=nil
	elseif self.xiao选项栏[14]:事件判断() then
		local xxq=self.xiao选项栏[14].弹出事件
		-- self.日期["文韵墨香"]=xxq
		self.SZ["文韵墨香"].日期=xxq
		self.xiao选项栏[14].弹出事件=nil
	elseif self.xiao选项栏[15]:事件判断() then
		local xxq=self.xiao选项栏[15].弹出事件
		-- self.日期["彩虹争霸"]=xxq
		self.SZ["彩虹争霸"].日期=xxq
		self.xiao选项栏[15].弹出事件=nil
	elseif self.xiao选项栏[16]:事件判断() then
		local xxq=self.xiao选项栏[16].弹出事件
		-- self.日期["降妖伏魔"]=xxq
		self.SZ["降妖伏魔"].日期=xxq
		self.xiao选项栏[16].弹出事件=nil
	elseif self.xiao选项栏[17]:事件判断() then
		local xxq=self.xiao选项栏[17].弹出事件
		self.SZ["帮派迷宫"].日期=xxq
		self.xiao选项栏[17].弹出事件=nil
	elseif self.xiao选项栏[18]:事件判断() then
		local xxq=self.xiao选项栏[18].弹出事件
		self.SZ["天降辰星"].日期=xxq
		self.xiao选项栏[18].弹出事件=nil
	elseif self.xiao选项栏[19]:事件判断() then
		local xxq=self.xiao选项栏[19].弹出事件
		self.SZ["保卫长安"].日期=xxq
		self.xiao选项栏[19].弹出事件=nil
	elseif self.xiao选项栏[20]:事件判断() then
		local xxq=self.xiao选项栏[20].弹出事件
		self.SZ["帮战"].日期=xxq
		self.xiao选项栏[20].弹出事件=nil
	elseif self.xiao选项栏[21]:事件判断() then
		local xxq=self.xiao选项栏[21].弹出事件
		self.SZ["镖王活动"].日期=xxq
		self.xiao选项栏[21].弹出事件=nil
	elseif self.xiao选项栏[22]:事件判断() then
		local xxq=self.xiao选项栏[22].弹出事件
		self.SZ["剑会"].日期=xxq
		self.xiao选项栏[22].弹出事件=nil
	end

	self.输入["定时刷怪"]:置坐标(self.x+385,self.y+65+(1-1)*31)
	if self.输入["定时刷怪"]._已碰撞 then
		self.焦点 = true
	end
	-- self.输入["定时刷怪"]:置文本(self.输入类别["定时刷怪"])
	-- self.输入["定时刷怪"]:置可视(true,true)
	------------------------=================------------------
	self.输入["游泳比赛"]:置坐标(self.x+385,self.y+65+(2-1)*31)
	if self.输入["游泳比赛"]._已碰撞 then
		self.焦点 = true
	end

	------------------------=================------------------
	self.输入["门派闯关"]:置坐标(self.x+385,self.y+65+(3-1)*31)
	if self.输入["门派闯关"]._已碰撞 then
		self.焦点 = true
	end

	------------------------=================------------------
	self.输入["文韵墨香"]:置坐标(self.x+385,self.y+65+(4-1)*31)
	if self.输入["文韵墨香"]._已碰撞 then
		self.焦点 = true
	end

	------------------------=================------------------
	self.输入["彩虹争霸"]:置坐标(self.x+385,self.y+65+(5-1)*31)
	if self.输入["彩虹争霸"]._已碰撞 then
		self.焦点 = true
	end

	------------------------=================------------------
	self.输入["降妖伏魔"]:置坐标(self.x+385,self.y+65+(6-1)*31)
	if self.输入["降妖伏魔"]._已碰撞 then
		self.焦点 = true
	end

	------------------------=================------------------
	self.输入["帮派迷宫"]:置坐标(self.x+385,self.y+65+(7-1)*31)
	if self.输入["帮派迷宫"]._已碰撞 then
		self.焦点 = true
	end

	------------------------=================------------------
	self.输入["天降辰星"]:置坐标(self.x+385,self.y+65+(8-1)*31)
	if self.输入["天降辰星"]._已碰撞 then
		self.焦点 = true
	end

	------------------------=================------------------
	self.输入["保卫长安"]:置坐标(self.x+385,self.y+65+(9-1)*31)
	if self.输入["保卫长安"]._已碰撞 then
		self.焦点 = true
	end

	------------------------=================------------------
	self.输入["帮战"]:置坐标(self.x+385,self.y+65+(10-1)*31)
	if self.输入["帮战"]._已碰撞 then
		self.焦点 = true
	end
	self.输入["镖王活动"]:置坐标(self.x+385,self.y+65+(11-1)*31)
	if self.输入["镖王活动"]._已碰撞 then
		self.焦点 = true
	end
	self.输入["剑会"]:置坐标(self.x+385,self.y+65+(12-1)*31)
	if self.输入["剑会"]._已碰撞 then
		self.焦点 = true
	end
	for i=1,#self.项目 do
		if self.确认按钮[i]:事件判断() then
			if self.项目[i]=="定时刷怪" then
				local 事件 = function()
				-- 发送数据(6901,{类型=self.项目[i],RQ=self.日期[self.项目[i]],TIME=self.输入[self.项目[i]]:取文本()})
				发送数据(6901,{类型=self.项目[i],RQ=self.刷怪类型,TIME=self.输入[self.项目[i]]:取文本()})
				end
				tp.窗口.文本栏:载入("你确定要更改#R"..self.刷怪类型.."#W的时间吗？",nil,true,事件)
			else
				local 事件 = function()
				-- 发送数据(6901,{类型=self.项目[i],RQ=self.日期[self.项目[i]],TIME=self.输入[self.项目[i]]:取文本()})
				发送数据(6901,{类型=self.项目[i],RQ=self.SZ[self.项目[i]].日期,TIME=self.输入[self.项目[i]]:取文本()})
				end
				tp.窗口.文本栏:载入("你确定要更改#R"..self.项目[i].."#W的时间吗？",nil,true,事件)
			end
		end
	end
end





function 游戏设置:取分类(xm)
	local ls = {}
	if xm == "定时刷怪" then
		ls = {"天罡星","地煞星","封妖","妖王","巡山小妖","三打白骨精","狮驼国","真假美猴王"}
	elseif xm == "游泳比赛" then
		ls = {"全天","每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "门派闯关" then
		ls = {"全天","每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "文韵墨香" then
		ls = {"每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "彩虹争霸" then
		ls = {"每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "降妖伏魔" then
		ls = {"每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "帮派迷宫" then
		ls = {"每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "天降辰星" then
		ls = {"每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "保卫长安" then
		ls = {"每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "帮战" then
		ls = {"每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "镖王活动" then
		ls = {"全天","每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	elseif xm == "剑会" then
		ls = {"每天","周135","周246","周一","周二","周三","周四","周五","周六","周日"}
	end
	return ls
end

function 游戏设置:更新爆率(nr)
	self.bl活动名称={}
	self.zbl=nr
	for k,v in pairs(nr) do
		self.bl活动名称[v.排序]=k
	end
	self.bl选中活动=""
	self.分类=3
	self.资源组[1]:置宽高(566+30,390+86)
end
-- local function 显示排序(a,b) return a<b end
function 游戏设置:取爆率(hd)
	if self.zbl then
		local wasd={0,0,0,0,0,0,0}
				local ww=""
				local wenb={}
		for k,v in pairs(self.zbl) do
			if k==hd then
				wasd[1]=v.难度
				wasd[2]=v.经验
				wasd[3]=v.银子
				wasd[4]=v.爆率
				wasd[5]=v.书铁[1].."，"..v.书铁[2]
				wasd[6]=v.宝珠钨金珍珠[1].."，"..v.宝珠钨金珍珠[2]
				wasd[7]=v.宝石[1].."，"..v.宝石[2]
				wasd[8]=v.金丹[1].."，"..v.金丹[2]
				wasd[9]=v.怪物卡片[1].."，"..v.怪物卡片[2]
						for a,b in pairs(v.ITEM) do
							wenb[#wenb+1]=a.."="..b
							-- ww=ww..a.."="..b.."，\n"
						end
						break
			end
		end
		for i=1,#self.右侧 do
			self.shuru[i]:置可视(true,true)
			self.shuru[i]:置文本(wasd[i])
		end
		for i=1,20 do
			self.BL输入[i]:置可视(true,true)
			if wenb[i] then
				self.BL输入[i]:置文本(wenb[i])
			else
				self.BL输入[i]:置文本("")
			end
		end
	end
end


function 游戏设置:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y) then
		return true
	elseif self.xiao选项栏~= nil and (self.xiao选项栏[20]:是否选中(x,y) or self.xiao选项栏[21]:是否选中(x,y) or self.xiao选项栏[22]:是否选中(x,y)) then
		return true
	end
end

function 游戏设置:初始移动(x,y)
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

function 游戏设置:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 游戏设置