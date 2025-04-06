local 摊位出售类 = class()
local tp,zts,zts1,zts2
local insert = table.insert
local xxx = 0
local yyy = 0
local floor = math.floor
local min = math.min
local max = math.max
local ceil = math.ceil
local tx = 引擎.取头像
local 字体
local 字体1
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取摊位金钱颜色
local mouseb = 引擎.鼠标弹起
local bw = require("gge包围盒")(0,0,210,40)
local bw1 = require("gge包围盒")(0,0,240,25)
local bw2 = require("gge包围盒")(0,0,240,30)
local box = 引擎.画矩形

function 摊位出售类:初始化(根)
	self.ID = 89
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "摊位出售类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.队伍坐标 = {14,133,252,371,490}
	self.选中人物 = 0
	self.窗口时间 = 0
	tp = 根
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("摊位输入",0,0,100,14,根,根.字体表.华康14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(12)
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.输入框1 = 总控件:创建输入("价格输入",0,0,100,14,根,根.字体表.华康14)
	self.输入框1:置数字模式()
	self.输入框1:置可视(false,false)
	self.输入框1:置限制字数(11)
	self.输入框1:屏蔽快捷键(true)
	self.输入框1:置光标颜色(-16777216)
	self.输入框1:置文字颜色(-16777216)
	self.加入 = 0
	-- zts1 = tp.字体表.描边字体
	字体 = tp.字体表.普通字体
	字体1 = tp.字体表.普通字体_
	zts2 = tp.字体表.普通字体__
	btcsmszt = tp.字体表.描边字体
end

function 摊位出售类:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	-- self.选中背景=资源:载入("Lib/imge/001/125-1.png","图片")
	-- self.选中背景=tp.资源:载入('wzife.wdf',"网易WDF动画",0x10921CA7)
	self.资源组 = {
		[1] = 自适应.创建(0,1,580,344,3,9),
		-- [2] = 自适应.创建(1,1,550,18,1,3,nil,18),
		-- [3] = 资源:载入('nice.rpk',"网易WDF动画",0xCC166220),
		[4] = 自适应.创建(3,1,100,20,1,3),
		[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 物品类"),
		[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"召唤兽类"),
		[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 制造类"),
		[9] = 按钮.创建(自适应.创建(12,4,58,22,1,3),0,0,4,true,true," 收摊"),
		[10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"摆摊记录"),
		[11] = 按钮.创建(自适应.创建(12,4,58,22,1,3),0,0,4,true,true," 上架"),
		[12] = 按钮.创建(自适应.创建(12,4,58,22,1,3),0,0,4,true,true," 改名"),
		[13] = 自适应.创建(37,1,1,1,3,nil),--自适应.创建(4,1,1,1,3,nil),
		[16] = 自适应.创建(37,1,1,1,3,nil),--自适应.创建(4,1,1,1,3,nil),
		[14] = 按钮.创建(自适应.创建(12,4,38,22,1,3),0,0,4,true,true," >"),
		[15] = 资源:载入('pic/tanwei1.png',"图片"),--按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--
		-- [16] = --按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--
		[17] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[18] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[19] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,154,2),
		[20] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
		[21] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"下架"),
		[22] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[23] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[24] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,234,2),
		[25] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[26] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[27] = 自适应.创建(40,1,80,19,1,3),
	}
	for i=5,26 do
		if i~= 13 and i~=19 and i~=20 and i~=24 and i~=15 and i~=16 then
	    	self.资源组[i]:绑定窗口_(89)
	    end
	end
	-- self.队伍格子 = {}
	self.头像组 = {}
	self.上架头像组 = {}
	self.制造组 = {}
	-- local 格子 = require("script/系统类/队伍_格子")
	-- for i=1,5 do
	-- 	self.队伍格子[i] = 格子.创建(0,0,i,tp)
	-- end
	self.物品={}
	for i=1,20 do
		self.物品[i] = tp._物品格子.创建(0,0,i,"给予_物品")
	end
end

function 摊位出售类:刷新(名称,角色名称,id,物品数据,bb数据,制造数据)
	self.上架物品=物品数据
	self.上架bb=bb数据
	self.上架制造=制造数据
	for q=1,20 do
		self.物品[q]:置物品(tp.道具列表[q])
		if self.上架物品[q]~=nil then
			self.物品[q]:置灰色()
		end
	end
	self.资源组[11].按钮文字=" 下架"
end


function 摊位出售类:打开(名称,角色名称,id,物品数据,bb数据,制造数据)
	if self.可视 then
		self.选中人物 = 0
		self.可视 = false
		self.加入 = 0
		self.输入框:置可视(false,false)
		-- self.选中背景=nil
		self.资源组=nil
		-- self.队伍格子 = nil
		self.头像组 = nil
		self.上架头像组 = nil
		self.制造组 = nil
		self.物品=nil

		self.上架物品=nil
		self.上架bb=nil
		self.上架制造=nil
		self.对象名称=nil
		self.对象等级=nil
		self.对象类型=nil
		self.摊主名称=nil
		self.bb=nil
		-- 资源 = nil
	 --    按钮 = nil
	 --    自适应= nil

		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
 		self.x = (全局游戏宽度/2)-290
		self.y = (全局游戏高度/2)-175
		self.上架物品=物品数据
		self.上架bb=bb数据
		self.上架制造=制造数据
		local wp = tp._物品
		for q=1,20 do
			self.物品[q]:置根(tp)
			self.物品[q]:置物品(tp.道具列表[q])
			if self.上架物品[q]~=nil then
				self.物品[q]:置灰色()
			end
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.选中人物=0
		self.加入 = 0
		self.召唤兽数量 = 0
		self.物品数量 = 0
		self.上架召唤兽数量 = 0
		self.上架物品数量 = 0
		self.制造加入 = 0
		self.制造总数 = 0
		self.对象名称=名称
		self.对象等级=等级
		self.对象类型=类型
		self.资源组[19]:置起始点(0)
		self.资源组[24]:置起始点(0)
		self.格子={}
		self.头像组 = {}
		self.上架头像组 = {}
		self.制造组 = {}
		self.bb=tp.队伍[1].宝宝列表
		self.显示类型="物品"
		self.输入框:置可视(true,true)
		self.输入框:置文本(名称)
		self.输入框1:置可视(true,true)
		self.输入框1:置文本("")
		self.摊主名称=角色名称
		self.摊主id=id
		self.bb选中=0
		self.物品选中=0
		self.制造选中=0
		self.制造子类选中=0
		self.制造类型=nil

	end
end

function 取指定门派技能(名称)
	local 等级=0
  	for n=1,#tp.队伍[1].师门技能 do
   		for i=1,#tp.队伍[1].师门技能[n].包含技能 do
	  		if tp.队伍[1].师门技能[n].包含技能[i].名称==名称 and tp.队伍[1].师门技能[n].包含技能[i].学会 then
	  			if tp.队伍[1].额外技能等级[tp.队伍[1].师门技能[n].名称]~=nil then
	  				等级=tp.队伍[1].额外技能等级[tp.队伍[1].师门技能[n].名称]
	  			end
	  			等级=等级+tp.队伍[1].师门技能[n].等级
				return 等级--tp.队伍[1].师门技能[n].等级
			end
	 	end
	end
 	return 0
end

function 取门派技能()
	local 门派=tp.队伍[1].门派
	local 技能 = nil
	local 等级 = 0
	if 门派=="龙宫" then
		技能="龙附"
		等级=取指定门派技能(技能)
	elseif 门派=="大唐官府" then
		技能="嗜血"
		等级=取指定门派技能(技能)
	elseif 门派=="化生寺" then
		技能="拈花妙指"
		等级=取指定门派技能(技能)
	elseif 门派=="女儿村" then
		技能="轻如鸿毛"
		等级=取指定门派技能(技能)
	elseif 门派=="天宫" then
		技能="浩然正气"
		等级=取指定门派技能(技能)
	elseif 门派=="五庄观" then
		技能="一气化三清"
		等级=取指定门派技能(技能)
	elseif 门派=="普陀山" then
		技能="莲华妙法"
		等级=取指定门派技能(技能)
	elseif 门派=="阴曹地府" then
		技能="尸气漫天"
		等级=取指定门派技能(技能)
	elseif 门派=="盘丝洞" then
		技能="盘丝舞"
		等级=取指定门派技能(技能)
	elseif 门派=="魔王寨" then
		技能="魔王护持"
		等级=取指定门派技能(技能)
	elseif 门派=="狮驼岭" then
		技能="神力无穷"
		等级=取指定门派技能(技能)
	elseif 门派=="无底洞" then
		技能="元阳护体"
		等级=取指定门派技能(技能)
	elseif 门派=="神木林" then
		技能="神木呓语"
		等级=取指定门派技能(技能)
	elseif 门派=="方寸山" then
		技能="神兵护法"
		等级=取指定门派技能(技能)
	elseif 门派=="花果山" then
		技能="担山赶月"
		等级=取指定门派技能(技能)
	elseif 门派=="凌波城" then
		技能="穿云破空"
		等级=取指定门派技能(技能)
	end
	return {名称=技能,等级=等级,类别="其他类"}
end

function 取辅助技能()
	return {[1]={名称="打造",等级=tp.队伍[1].辅助技能[7].等级,类别="打造类"},[2]={名称="裁缝",等级=tp.队伍[1].辅助技能[8].等级,类别="打造类"},[3]={名称="炼金",等级=tp.队伍[1].辅助技能[9].等级,类别="打造类"}}
end

function 取修理技能()
	return {[1]={名称="打造修理类",等级=tp.队伍[1].辅助技能[7].等级,类别="修理类"},[2]={名称="裁缝修理类",等级=tp.队伍[1].辅助技能[8].等级,类别="修理类"},[3]={名称="炼金修理类",等级=tp.队伍[1].辅助技能[9].等级,类别="修理类"}}
end

function 摊位出售类:更新(dt)

end

function 摊位出售类:物品显示(dt,x,y)
	local wps = 0
	self.资源组[14]:更新(x,y)
	-- self.资源组[3]:显示(self.x+310,self.y+60)
	tp.物品界面背景_:显示(self.x+310,self.y+63)
	self.资源组[14]:显示(self.x+535,self.y+277)
	字体:置颜色(白色):显示(self.x + 45,self.y + 67,"物品名")
	字体:置颜色(白色):显示(self.x + 105,self.y + 67,"数量")
	字体:置颜色(白色):显示(self.x + 155,self.y + 67,"单价")
 	local xx = 0
 	local yy = 0
 	local tip = {x=0,y=0}
 	tip.x=self.x+24
 	tip.y=self.y+15
	for i=1,20 do
	 	if self.物品[i].格子==nil then
		 	self.物品[i]:置坐标(self.x + xx * 51 + 312,self.y + yy * 51 + 62)
		 	local xq = nil
			if self.物品[i].物品~=nil then
				if self.物品[i].物品.名称=="魔兽要诀" or self.物品[i].物品.名称=="高级魔兽要诀" or self.物品[i].物品.名称=="点化石" or self.物品[i].物品.名称=="召唤兽内丹" or self.物品[i].物品.名称=="高级召唤兽内丹" then
					xq=取兽诀缩写(self.物品[i].物品.附带技能)
				end
				if self.物品[i].物品.名称=="召唤兽内丹" or self.物品[i].物品.名称=="高级召唤兽内丹" then
				    if self.物品[i].物品.特效 then
					    xq=self.物品[i].物品.特效
					end
				end
				if self.物品[i].物品.名称=="百炼精铁" or self.物品[i].物品.名称=="制造指南书" or self.物品[i].物品.名称=="元灵晶石" or self.物品[i].物品.名称=="灵饰指南书" then
					if self.物品[i].物品.子类 then
					    xq=self.物品[i].物品.子类.."级"
					end
				end
				if self.物品[i].物品.总类==5 and self.物品[i].物品.分类==6 then
					if self.物品[i].物品.级别限制 then
					    xq=self.物品[i].物品.级别限制.."级"
					end
				end
			end
		 	self.物品[i]:显示(dt,x,y,self.鼠标,nil,nil,nil,1,xq)

		 	if self.物品选中==i then
			  	tp.物品格子确定_:显示(self.x + xx * 51 + 313,self.y + yy * 51 + 64)
			end
		 	if self.物品[i].焦点 then
 	 			tp.物品格子焦点_:显示(self.x + xx * 51 + 312 ,self.y + yy * 51 + 63)
 	 		end

		 	if self.物品[i].焦点 and not tp.消息栏焦点 then
				if self.物品[i].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[i].物品)
					if 引擎.鼠标弹起(左键) then
						if self.物品[i].物品.加锁 then
							tp.常规提示:打开("#Y/该物品已加锁，无法进行出售。")
							return
						else
						    -- self.输入框1:置文本("") --注释的这里
							self.物品选中=i
							if self.上架物品[i]~=nil then
								self.输入框1:置文本(self.上架物品[i].价格)
								self.资源组[11].按钮文字=" 下架"
							else
								self.资源组[11].按钮文字=" 上架"
							end
						end
					end
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
	btcsmszt:置样式(0)
	local 上架物品组 = {}
	for k,v in pairs(self.上架物品) do
	    if v~=nil then
	    	wps = wps + 1
	    	上架物品组[#上架物品组+1] = v
	    end
	end
	local wps = #上架物品组
	if wps > 6 then
		self.上架物品数量 = min(ceil((wps-6)*self.资源组[24]:取百分比()),wps-6)
		self.资源组[24]:显示(self.x+271,self.y+87,x,y,self.鼠标)
	end
	-- self.资源组[15]:更新(x,y,self.上架物品数量 > 0)
	-- self.资源组[16]:更新(x,y,self.上架物品数量 < wps - 6)
	-- tp.画线:置区域(0,0,15,210)
	-- tp.画线:显示(self.x+270,self.y+95)
	-- self.资源组[15]:置区域(0,0,16,240-7)
	-- self.资源组[15]:显示(self.x+265+4,self.y+90-3)
	-- self.资源组[16]:显示(self.x+265,self.y+300)
	if self.资源组[13]:是否选中(x,y) then
		if 引擎.取鼠标滚轮() ==1 and self.上架物品数量 > 0 then
			self.资源组[24]:置起始点(self.资源组[24]:取百分比转换(self.上架物品数量-1,6,wps))
			self.头像组 = {}
		elseif 引擎.取鼠标滚轮() ==-1 and self.上架物品数量 < wps - 6 then
			self.资源组[24]:置起始点(self.资源组[24]:取百分比转换(self.上架物品数量+1,6,wps))
			self.头像组 = {}
		end
	end
	for n=1,6 do
		if 上架物品组[n+self.上架物品数量]~=nil then
			字体1:置样式(1)
			字体1:置颜色(黑色):显示(self.x+65,self.y+60+n*39,上架物品组[n+self.上架物品数量].名称)
			字体1:置颜色(黑色):显示(self.x+120,self.y+60+n*39,上架物品组[n+self.上架物品数量].数量 or 1)
			字体1:置样式(0)
			字体:置样式(1)
			字体:置颜色(引擎.取摊位金钱颜色(上架物品组[n+self.上架物品数量].价格)):显示(self.x+170,self.y+60+n*39,上架物品组[n+self.上架物品数量].价格)
			字体:置颜色(红色):显示(self.x+240,self.y+60+n*39,"已上架")
			字体:置样式(0)
		end
	end
	-- if wps > 6 then
	-- 	self.资源组[24]:显示(self.x+267,self.y+109-23,x,y,self.鼠标)
	-- end
end



function 摊位出售类:bb显示(dt,x,y)
	local 上架宝宝数量 = 0
	字体:置颜色(白色):显示(self.x + 60,self.y + 67,"召唤兽名")
	字体:置颜色(白色):显示(self.x + 150,self.y + 67,"价格")
	self.资源组[16]:置宽高(256,209)
	self.资源组[16]:显示(self.x+310,self.y+61)
	字体:置颜色(白色):显示(self.x + 360,self.y + 67,"召唤兽名")
	字体:置颜色(白色):显示(self.x + 480,self.y + 67,"等级")
	local bbsa = #tp.队伍[1].宝宝列表
	if bbsa > 4 then
		self.资源组[19]:置高度(min(floor(143/(bbsa-4)),104))
		self.召唤兽数量 = min(ceil((bbsa-4)*self.资源组[19]:取百分比()),bbsa-4)
	end
	self.资源组[17]:更新(x,y,self.召唤兽数量 > 0)
	self.资源组[18]:更新(x,y,self.召唤兽数量 < bbsa - 4)
	-- tp.画线:置区域(0,0,15,160)
	-- tp.画线:显示(self.x+554,self.y+95)
	self.资源组[17]:显示(self.x+554,self.y+88)
	self.资源组[18]:显示(self.x+554,self.y+255)
	if bbsa > 4 then
		self.资源组[19]:显示(self.x+555,self.y+87+16,x,y,self.鼠标)
	end
	if self.资源组[16]:是否选中(x,y) then
		if self.资源组[18]:事件判断() or (引擎.取鼠标滚轮() ==-1 and self.召唤兽数量 < bbsa - 4) then
			self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.召唤兽数量+1,4,bbsa))
			self.头像组 = {}
		elseif self.资源组[17]:事件判断() or (引擎.取鼠标滚轮() ==1 and self.召唤兽数量 >0) then
			self.资源组[19]:置起始点(self.资源组[19]:取百分比转换(self.召唤兽数量-1,4,bbsa))
			self.头像组 = {}
		end
	end
 	for n=1,4 do
 		if tp.队伍[1].宝宝列表[n+self.召唤兽数量] ~= nil then
			bw:置坐标(self.x+315,self.y+50+n*44)
			if bw:检查点(x,y) then
				tp.禁止关闭 = true
				box(self.x+315,self.y+50+n*44,self.x+535,self.y+89+n*44,-2097481216)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					if tp.队伍[1].宝宝列表[n+self.召唤兽数量].加锁 then
						tp.常规提示:打开("#Y/该召唤兽已加锁，无法进行出售。")
						return
					else
					    self.输入框1:置文本("")
						self.bb选中=n+self.召唤兽数量
						if self:是否上架(tp.队伍[1].宝宝列表[self.bb选中].认证码) then
							for k,v in pairs(self.上架bb) do
								if tp.队伍[1].宝宝列表[self.bb选中].认证码==v[2] then
									self.输入框1:置文本(v[1])
									self.资源组[11].按钮文字=" 下架"
								end
							end
						else
							self.资源组[11].按钮文字=" 上架"
						end
					end
				elseif 引擎.鼠标弹起(1) and self.鼠标 and not tp.消息栏焦点 then
					tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[n+self.召唤兽数量])
				end
			end
			if self:是否上架(tp.队伍[1].宝宝列表[n+self.召唤兽数量].认证码) then
				if self.bb选中==n+self.召唤兽数量 then
					box(self.x+315,self.y+50+n*44,self.x+535,self.y+89+n*44,-9670988)
				end
				字体:置颜色(红色):显示(self.x+360,self.y+62+n*44,tp.队伍[1].宝宝列表[n+self.召唤兽数量].名称)
				字体:置颜色(红色):显示(self.x+485,self.y+62+n*44,tp.队伍[1].宝宝列表[n+self.召唤兽数量].等级)
			elseif self.bb选中==n+self.召唤兽数量 then
				box(self.x+315,self.y+50+n*44,self.x+535,self.y+89+n*44,-9670988)
			 	字体:置颜色(蓝色):显示(self.x+360,self.y+62+n*44,tp.队伍[1].宝宝列表[n+self.召唤兽数量].名称)
				字体:置颜色(蓝色):显示(self.x+485,self.y+62+n*44,tp.队伍[1].宝宝列表[n+self.召唤兽数量].等级)
		   	else
				字体:置颜色(黑色):显示(self.x+360,self.y+62+n*44,tp.队伍[1].宝宝列表[n+self.召唤兽数量].名称)
				字体:置颜色(黑色):显示(self.x+485,self.y+62+n*44,tp.队伍[1].宝宝列表[n+self.召唤兽数量].等级)
			end
			if self.头像组[n+self.召唤兽数量] == nil then
				local t = tx(tp.队伍[1].宝宝列表[n+self.召唤兽数量].模型)
				self.头像组[n+self.召唤兽数量] = tp.资源:载入(t[7],"网易WDF动画",t[1])
			end
			self.资源组[20]:显示(self.x+319,self.y+50+n*44)
			self.头像组[n+self.召唤兽数量]:显示(self.x+322,self.y+54+n*44)
		end
 	end
 	local 上架组 = {}
 	self.上架头像组 = {}
	for k,v in pairs(self.上架bb) do
		if v~=nil then
			if self.上架头像组[#self.上架头像组+1] == nil then
				local t = tx(self.上架bb[k][3])
				self.上架头像组[#self.上架头像组+1] = tp.资源:载入(t[7],"网易WDF动画",t[1])
			end
			上架组[#上架组+1] = v
		end
	end
	for i=1,5 do
		if self.上架头像组[i+self.上架召唤兽数量]~=nil and 上架组[i+self.上架召唤兽数量]~=nil then
		    self.资源组[20]:显示(self.x+27,self.y+50+i*45)
			self.上架头像组[i+self.上架召唤兽数量]:显示(self.x+30,self.y+54+i*45)
			字体1:置颜色(黑色):显示(self.x+65,self.y+63+i*45,上架组[i+self.上架召唤兽数量][4])
			字体:置颜色(引擎.取摊位金钱颜色(上架组[i+self.上架召唤兽数量][1])):显示(self.x+150,self.y+63+i*45,上架组[i+self.上架召唤兽数量][1])
			字体:置颜色(红色):显示(self.x+220,self.y+63+i*45,"已上架")
		end
	end
	local bbsj = #self.上架头像组
	if bbsj > 5 then
		self.上架召唤兽数量 = min(ceil((bbsj-5)*self.资源组[24]:取百分比()),bbsj-5)
		self.资源组[24]:显示(self.x+271,self.y+87,x,y,self.鼠标)
	end
	if self.资源组[13]:是否选中(x,y) then
		if 引擎.取鼠标滚轮() ==-1 and self.上架召唤兽数量 < bbsj - 5 then
			self.资源组[24]:置起始点(self.资源组[24]:取百分比转换(self.上架召唤兽数量+1,5,bbsj))
			self.上架头像组 = {}
		elseif 引擎.取鼠标滚轮() ==1 and self.上架召唤兽数量 >0 then
			self.资源组[24]:置起始点(self.资源组[24]:取百分比转换(self.上架召唤兽数量-1,5,bbsj))
			self.上架头像组 = {}
		end
	end

end


function 摊位出售类:制造显示(dt,x,y)
	local 制造技能组 = {}
	self.制造组 = {}
	制造技能组.门派技能信息 = 取门派技能()
	制造技能组.辅助技能信息 = 取辅助技能()
	制造技能组.辅助修理信息 = 取修理技能()
	if 制造技能组.门派技能信息.名称~=nil and 制造技能组.门派技能信息.等级~=0 then
		self.制造组[#self.制造组+1] = 制造技能组.门派技能信息
	end
	for n=1,3 do
		if 制造技能组.辅助技能信息[n].等级~=0 then
			self.制造组[#self.制造组+1] = 制造技能组.辅助技能信息[n]
		end
	end
	for n=1,3 do
		if 制造技能组.辅助修理信息[n].等级~=0 then
			self.制造组[#self.制造组+1] = 制造技能组.辅助修理信息[n]
		end
	end
	字体:置颜色(白色):显示(self.x + 50,self.y + 67,"技能等级")
	字体:置颜色(白色):显示(self.x + 140,self.y + 67,"价格")
	字体:置颜色(白色):显示(self.x + 215,self.y + 67,"状态")
	self.资源组[13]:置宽高(256,209)
	self.资源组[13]:显示(self.x+310,self.y+61)
	字体:置颜色(白色):显示(self.x + 335,self.y + 67,"制造类别")
	字体:置颜色(白色):显示(self.x + 420,self.y + 67,"熟练度")
	字体:置颜色(白色):显示(self.x + 490,self.y + 67,"技能等级")
	-- self.资源组[25]:更新(x,y,self.制造加入 > 0)
	-- self.资源组[26]:更新(x,y,self.制造加入 + 6 < self.制造总数)
	-- if self.资源组[25]:事件判断() then
	-- 	if self.制造加入 > 0 then
	-- 		self.制造加入 = self.制造加入 - 1
	-- 	else
	-- 	    self.制造加入 = 0
	-- 	end
	-- 	self.输入框1:置文本("")
	-- elseif self.资源组[26]:事件判断() then
	-- 	if self.制造加入 + 6 < self.制造总数 then
	-- 		self.制造加入 = self.制造加入 + 1
	-- 	else
	-- 	    self.制造加入 = self.制造总数 - 6
	-- 	end
	-- 	self.输入框1:置文本("")
	-- end
	-- tp.画线:置区域(0,0,15,210)
	-- tp.画线:显示(self.x+270,self.y+95)
	-- self.资源组[25]:显示(self.x+265,self.y+90)
	-- self.资源组[26]:显示(self.x+265,self.y+300)
	for n=1,#self.制造组 do
		bw1:置坐标(self.x+315,self.y+64+n*25)
		if bw1:检查点(x,y) then
			self.焦点=true
			box(self.x+315,self.y+64+n*25,self.x+560,self.y+88+n*25,-2097481216)
			if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
				self.资源组[11].按钮文字=" 上架"
				self.输入框1:置文本("")
				self.制造选中=n
				self.制造子类选中=0
			end
		end
		if self.制造选中==n then
			box(self.x+315,self.y+64+n*25,self.x+560,self.y+88+n*25,-9670988)
		end
		if self.制造组[n]~=nil then
			字体:置样式(1)
			字体:置颜色(黑色):显示(self.x+365,self.y+69+n*25,self.制造组[n].名称)
			字体:置颜色(黑色):显示(self.x+440,self.y+69+n*25,0)
			字体:置颜色(黑色):显示(self.x+520,self.y+69+n*25,self.制造组[n].等级)
			字体:置样式(0)
		end
		if self.上架制造[n+self.制造加入] ~= nil then
			字体:置样式(1)
			-- 字体:置颜色(红色):显示(self.x+365,self.y+69+n*25,self.制造组[n+self.制造加入].名称)
			-- 字体:置颜色(红色):显示(self.x+440,self.y+69+n*25,0)
			-- 字体:置颜色(红色):显示(self.x+520,self.y+69+n*25,self.制造组[n+self.制造加入].等级)
			字体:置样式(0)
		end
	end
	if self.制造子类选中~=0 then
		box(self.x+25,self.y+60+self.制造子类选中*30,self.x+265,self.y+90+self.制造子类选中*30,-9670988)
	end
	if self.制造选中~=0 then
		if self.制造组[self.制造选中].类别 == "打造类" then
			self.制造总数 = math.floor(self.制造组[self.制造选中].等级/10) - 6
		else
		    self.制造总数 = 0
		end
		local js = 1
		if self.制造组[self.制造选中].类别 == "其他类" then
			self.资源组[27]:显示(self.x+115,self.y+67+js*30)
			bw2:置坐标(self.x+25,self.y+60+js*30)
			if bw2:检查点(x,y) then
				self.焦点=true
				box(self.x+25,self.y+60+js*30,self.x+265,self.y+90+js*30,-2097481216)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					self.制造子类选中=js
					if  self.上架制造[self.制造选中]~= nil and self.上架制造[self.制造选中][js] ~= nil then
						self.输入框1:置文本(self.上架制造[self.制造选中][js][1])
						self.资源组[11].按钮文字=" 下架"
					else
					    self.输入框1:置文本("")
					    self.资源组[11].按钮文字=" 上架"
					end
				end
			end
			if self.上架制造[self.制造选中]~= nil and self.上架制造[self.制造选中][js+self.制造加入] ~= nil then
				字体:置颜色(红色):显示(self.x+68,self.y+70+js*30,self.制造组[self.制造选中].等级)
				字体:置颜色(tos(tonumber(self.上架制造[self.制造选中][js+self.制造加入]["价格"]))):显示(self.x+123,self.y+70+js*30,self.上架制造[self.制造选中][js+self.制造加入][1])
				字体:置颜色(红色):显示(self.x+210,self.y+70+js*30,"已上架")
			else
				字体:置颜色(黑色):显示(self.x+68,self.y+70+js*30,self.制造组[self.制造选中].等级)
			end
		else
			if math.floor(self.制造组[self.制造选中].等级/10) > 11 and math.floor(self.制造组[self.制造选中].等级/10) - 6 - self.制造加入 >= 6 then
				for n=math.floor(self.制造组[self.制造选中].等级/10) - self.制造加入,math.floor(self.制造组[self.制造选中].等级/10) - 6 - self.制造加入,-1 do
					self.资源组[27]:显示(self.x+115,self.y+67+js*30)
					bw2:置坐标(self.x+25,self.y+60+js*30)
					if bw2:检查点(x,y) then
						self.焦点=true
						box(self.x+25,self.y+60+js*30,self.x+265,self.y+90+js*30,-2097481216)
						if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
							self.制造子类选中=js
							if self.上架制造[self.制造选中]~= nil and self.上架制造[self.制造选中][js+self.制造加入] ~= nil then
								self.输入框1:置文本(self.上架制造[self.制造选中][js+self.制造加入][1])
								self.资源组[11].按钮文字=" 下架"
							else
							    self.输入框1:置文本("")
							    self.资源组[11].按钮文字=" 上架"
							end
						end
					end
					if  self.上架制造[self.制造选中]~= nil and self.上架制造[self.制造选中][js+self.制造加入] ~= nil then
						字体:置颜色(红色):显示(self.x+68,self.y+70+js*30,n*10)
						字体:置颜色(tos(tonumber(self.上架制造[self.制造选中][js+self.制造加入]["价格"]))):显示(self.x+123,self.y+70+js*30,self.上架制造[self.制造选中][js+self.制造加入]["价格"])
						字体:置颜色(红色):显示(self.x+210,self.y+70+js*30,"已上架")
					else
						字体:置颜色(黑色):显示(self.x+68,self.y+70+js*30,n*10)
					end
					js = js + 1
				end
			else
			    for n=math.floor(self.制造组[self.制造选中].等级/10),6,-1 do
					self.资源组[27]:显示(self.x+115,self.y+67+js*30)
					bw2:置坐标(self.x+25,self.y+60+js*30)
					if bw2:检查点(x,y) then
						self.焦点=true
						box(self.x+25,self.y+60+js*30,self.x+265,self.y+90+js*30,-2097481216)
						if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
							self.制造子类选中=js
							if self.上架制造[self.制造选中]~= nil and self.上架制造[self.制造选中][js+self.制造加入] ~= nil then
								self.输入框1:置文本(self.上架制造[self.制造选中][js+self.制造加入][1])
								self.资源组[11].按钮文字=" 下架"
							else
							    self.输入框1:置文本("")
							    self.资源组[11].按钮文字=" 上架"
							end
						end
					end
					if self.上架制造[self.制造选中]~= nil and self.上架制造[self.制造选中][js+self.制造加入] ~= nil then
						字体:置颜色(红色):显示(self.x+68,self.y+70+js*30,n*10)
						字体:置颜色(tos(tonumber(self.上架制造[self.制造选中][js+self.制造加入]["价格"]))):显示(self.x+123,self.y+70+js*30,self.上架制造[self.制造选中][js+self.制造加入][1])
						字体:置颜色(红色):显示(self.x+210,self.y+70+js*30,"已上架")
					else
						字体:置颜色(黑色):显示(self.x+68,self.y+70+js*30,n*10)
					end
					js = js + 1
				end
			end
		end
	end
	if self.输入框1:取文本()~="" and self.制造子类选中~=0 then
		字体:置颜色(tos(tonumber(self.输入框1:取文本()))):显示(self.x+123,self.y+70+self.制造子类选中*30,self.输入框1:取文本())
	end
end


function 摊位出售类:是否上架(id)
	for n, v in pairs(self.上架bb) do
		if  id==v[2] then return true end
	end
	return false
end
function 摊位出售类:取是否选中(id)
	for n, v in pairs(self.上架bb) do
		if id==n then return true end
	end
	return false
 end
function 摊位出售类:显示(dt,x,y)
	-- if tp.窗口.摆摊打造.可视 then
 --        tp.窗口.摆摊打造:打开()
 --    end
 --    if tp.窗口.宠物合宠栏.可视 then
 --    	tp.窗口.宠物合宠栏:打开()
 --    end
 --    if tp.窗口.宠物洗练栏.可视 then
 --    	tp.窗口.宠物洗练栏:打开()
 --    end
 --    if tp.窗口.摊位购买.可视 then
 --        tp.窗口.摊位购买:打开()
 --    end
 --    if tp.窗口.仓库类.可视 then
 --        tp.窗口.仓库类:打开()
 --    end
	self.焦点=false
	self.资源组[1]:显示(self.x,self.y)
 	-- self.资源组[2]:显示(self.x+6,self.y+3)
 	tp.窗口标题背景_:显示(self.x-80+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,"我的摊位")


 	self.资源组[4]:显示(self.x+85,self.y+33)
 	self.资源组[4]:显示(self.x+370,self.y+277)
 	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y,self.显示类型~="物品")
	self.资源组[7]:更新(x,y,self.显示类型~="bb")
	self.资源组[8]:更新(x,y,self.显示类型~="制造")
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[12]:更新(x,y)
	self.资源组[5]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[6]:显示(self.x+310,self.y+32,nil,nil,nil,self.显示类型=="物品",2)
	self.资源组[7]:显示(self.x+400,self.y+32,nil,nil,nil,self.显示类型=="bb",2)
	self.资源组[8]:显示(self.x+490,self.y+32,nil,nil,nil,self.显示类型=="制造",2)
	self.资源组[9]:显示(self.x+460,self.y+310)
	self.资源组[10]:显示(self.x+360,self.y+310)
	self.资源组[11]:显示(self.x+475,self.y+277)
	self.资源组[12]:显示(self.x+195,self.y+32)
	self.输入框:置坐标(self.x + 95,self.y + 36)
	self.输入框1:置坐标(self.x + 380,self.y + 280)
	self.资源组[13]:置宽高(265,260)
	self.资源组[13]:显示(self.x+20,self.y+61)
	self.资源组[15]:显示(self.x+265+4,self.y+90-3)

	if self.资源组[5]:事件判断() then
		self:打开()
		return
	elseif self.资源组[6]:事件判断() then
		self.输入框1:置文本("")
		self.显示类型="物品"
	elseif self.资源组[7]:事件判断() then
		self.输入框1:置文本("")
		self.显示类型="bb"
	elseif self.资源组[8]:事件判断() then
		self.输入框1:置文本("")
		self.显示类型="制造"
	elseif self.资源组[12]:事件判断() and self.输入框:取文本()~="" then
		发送数据(3721,{名称=self.输入框:取文本()})
	elseif self.资源组[9]:事件判断()  then
		发送数据(3724)
	end

	if self.显示类型=="物品" then
		self:物品显示(dt,x,y)
	elseif self.显示类型=="制造" then
		self:制造显示(dt,x,y)
	else
		self:bb显示(dt,x,y)
	end
	--更新金钱颜色变化显示
	-- self.输入框1:置文字颜色(引擎.取摊位金钱颜色(tonumber(self.输入框1:取文本())))
	self.输入框1:置文字颜色(引擎.取摊位金钱颜色(tonumber(self.输入框1:取文本())or 0))
	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end

	if self.输入框1._已碰撞 then
		self.焦点 = true
	end
	if self.资源组[19].接触 or self.资源组[24].接触 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)
	字体:置颜色(白色):显示(self.x + 24,self.y + 35,"摊位招牌")
	字体:置颜色(白色):显示(self.x + 310,self.y + 280,"出售单价")
	if self.资源组[11]:事件判断() then
		if self.显示类型=="bb" then
			if self.bb选中==0 then
				tp.常规提示:打开("#Y/请先设置要出售的召唤兽")
				return
			end
		elseif self.显示类型=="物品" then
			if self.物品选中==0 then
				tp.常规提示:打开("#Y/请先设置要出售的物品")
				return
			end
		end

		if self.资源组[11].按钮文字==" 上架" then
			if self.输入框1:取文本()=="" or self.输入框1:取文本()+0<=0 then
				tp.常规提示:打开("#Y/请先设置商品的单价")
				return
			end
			if self.显示类型=="bb" then
				发送数据(3722,{bb=self.bb选中,价格=self.输入框1:取文本()})
			elseif self.显示类型=="制造" then
				if self.制造子类选中==0 or self.制造选中==0 then
					tp.常规提示:打开("#Y/请先选择需要上架的制造技能与等级")
					return
				else
				    发送数据(3722,{制造={[1]=self.制造选中,[2]=self.制造子类选中 + self.制造加入},制造组=self.制造组,价格=self.输入框1:取文本()})
				end
			else
				发送数据(3722,{道具=self.物品选中,价格=self.输入框1:取文本()})
			end
		else
			if self.显示类型=="bb" then
				发送数据(3723,{bb=self.bb选中})
			else
				发送数据(3723,{道具=self.物品选中})
			end
		end
	end

end

function 摊位出售类:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
function 摊位出售类:初始移动(x,y)
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

function 摊位出售类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 摊位出售类