-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-23 05:01:27
local 摊位购买类 = class()
local tp,zts,zts1,zts2
local insert = table.insert
local xxx = 0
local yyy = 0
local min = math.min
local max = math.max
local ceil = math.ceil
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取摊位金钱颜色
local mouseb = 引擎.鼠标弹起
local bw = require("gge包围盒")(0,0,120,20)
local bw1 = require("gge包围盒")(0,0,251,60)
local bw2 = require("gge包围盒")(0,0,160,20)
local box = 引擎.画矩形
local 字体
local tx = 引擎.取头像

function 摊位购买类:初始化(根)
    self.ID = 90
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "给予类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中人物 = 0
	self.窗口时间 = 0
	tp = 根
    self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
   	self.输入框 = 总控件:创建输入("摊位数量输入",0,0,90,14)
   	self.输入框:置数字模式()
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(20)
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	字体 = tp.字体表.普通字体
	字体1 = tp.字体表.普通字体
	zts2 = tp.字体表.普通字体___
	btgmmszt = tp.字体表.描边字体
end

function 摊位购买类:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	-- self.选中背景=资源:载入("Lib/imge/001/125-1.png","图片")
	-- self.选中背景=tp.资源:载入('wzife.wdf',"网易WDF动画",0x10921CA7)
	self.资源组 = {
		[1] = 自适应.创建(0,1,620,420,3,9),
		[2] = 自适应.创建(1,1,590,18,1,3,nil,18),
		[3] = 自适应.创建(2,1,690,345,3,9),
		[4] = 自适应.创建(3,1,108,20,1,3),
		[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
	    [6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 物品类"),
		[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"召唤兽类"),
		[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 制造类"),
		[9] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"收摊"),
	    [10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"查看记录"),
	    [11] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  购买"),
	    -- [12] = 资源:载入('nice.rpk',"网易WDF动画",0xCC166221),
	    [13] = 自适应.创建(3,1,63,20,1,3),
	    [14] = 资源:载入('pic/F221.png',"图片"),--资源:载入('nice.rpk',"网易WDF动画",0xF4E2C110),
	    [15] = 资源:载入('pic/twxz.png',"图片"),--资源:载入('nice.rpk',"网易WDF动画",0xF4E2C111),
	    [16] = 资源:载入('pic/twqd.png',"图片"),--资源:载入('nice.rpk',"网易WDF动画",0xF4E2C112),
	    [17] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
	    [18] = 自适应.创建(4,1,1,1,3,nil),
	 --    [19] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		-- [20] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		-- [21] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		-- [22] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		-- [23] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[24] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[25] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,193,2),
		[26] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,193,2),
		[27] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,193,2),
		[28] = 资源:载入('pic/tanwei1.png',"图片"),
		[29] = 资源:载入('pic/tanwei2.png',"图片"),

	}
	self.选择框组 = {
		[1] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[2] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
	}
	for i=5,11 do
	    self.资源组[i]:绑定窗口_(90)
	end
	-- for i=19,24 do
	--     self.资源组[i]:绑定窗口_(90)
	-- end
	for i=1,2 do
	    self.选择框组[i]:绑定窗口_(90)
	end
	self.选择框显示 = {false,false}
	for i=1,#self.选择框组 do
		self.选择框组[i]:置根(tp)
		self.选择框组[i]:置偏移(-3,2)
	end
	self.物品={}
	for i=1,20 do
		self.物品[i] = tp._物品格子.创建(0,0,i,"给予_物品")
	end
	self.头像组 = {}
	self.销售物品 = {}
end

function 摊位购买类:刷新(名称,角色名称,id,物品数据,bb数据,制造数据)
   	self.上架物品=物品数据
	self.上架bb=bb数据
	self.上架制造=制造数据
	local wp = tp._物品
	self.物品={}
	for i=1,20 do
		self.物品[i] = tp._物品格子.创建(0,0,i,"给予_物品")
	end
	for q=1,20 do
		self.物品[q]:置物品(物品数据[q])
		if 物品数据[q]~=nil then
         	self.物品[q].价格=物品数据[q].价格
		end
	end
    self.对象名称=名称
    self.对象等级=等级
    self.对象类型=类型
    self.bb=bb数据
    self.摊主名称=角色名称
    self.摊主id=id
    self.摊位名称=名称
 end

function 摊位购买类:打开(名称,角色名称,id,物品数据,bb数据,制造数据)
	if self.可视 then
		self.选中人物 = 0
		self.可视 = false
		self.输入框:置可视(false,false)
		self.资源组=nil
		self.物品=nil
		self.头像组 = nil
		self.选择框组=nil
		self.销售物品=nil

		-- self.选中背景=nil
		self.选择框显示=nil
		self.对象名称=nil
	    self.对象等级=nil
	    self.对象类型=nil
	    self.bb=nil
	    self.摊主名称=nil
	    self.摊主id=nil
	    self.摊位名称=nil
	    资源 = nil
	    按钮 = nil
	    自适应= nil
		return
		-- for i=1,#self.选择框组 do
		-- 	self.选择框显示[i] = false
		-- 	self.选择框组[i]:置打勾框(false)
		-- end
		-- for i=1,20 do
		-- 	self.物品[i] = tp._物品格子.创建(0,0,i,"给予_物品")
		-- end
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.上架制造=制造数据
		self.物品={}
		for i=1,20 do
			self.物品[i] = tp._物品格子.创建(0,0,i,"给予_物品")
		end
		local wp = tp._物品
		for q=1,20 do
			self.物品[q]:置根(tp)
			self.物品[q]:置物品(物品数据[q])
			if 物品数据[q]~=nil then
             	self.物品[q].价格=物品数据[q].价格
			end
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.选中人物=0
	    self.对象名称=名称
	    self.对象等级=等级
	    self.对象类型=类型
	    for i=1,#self.选择框组 do
	    	self.选择框显示[i] = false
			self.选择框组[i]:置打勾框(false)
		end
	    self.格子={}
	    self.bb=bb数据
	    self.显示类型="物品"
	    if not 判断是否为空表(物品数据) then
	        self.显示类型="物品"
	    elseif 判断是否为空表(物品数据) and not 判断是否为空表(bb数据) then
	    	self.显示类型="bb"
    	elseif 判断是否为空表(物品数据) and 判断是否为空表(bb数据) and not 判断是否为空表(制造数据) then
    		self.显示类型="制造"
	    end
	    self.摊主名称=角色名称
	    self.摊主id=id
	    self.上架打造数量 = 0
	    self.上架修理数量 = 0
	    self.上架其他数量 = 0
	    self.制造选择类别 = nil
	    self.打造类型 = nil
	   	self.技能名称 = nil
	    self.打造等级 = 0
	    self.打造选中 = 0
	    self.修理选中 = 0
	    self.其他选中 = 0
	    self.bb选中=0
	    self.x = (全局游戏宽度/2)-310
		self.y = (全局游戏高度/2)-210
	    self.物品选中=0
	    self.摊位名称=名称
	    self.商品单价=nil
	    self.商品数量=nil
	    self.输入框:置可视(true,true)
	    self.输入框:置文本("")
	end
end
function 摊位购买类:更新(dt)

end

function 摊位购买类:物品显示(dt,x,y)
 	local xx = 0
	local yy = 0
	local tip = {x=0,y=0}
	tip.x=self.x+24
	tip.y=self.y+20
	self.销售物品 = {}
	for i=1,20 do
		if  self.物品[i].物品~=nil and self.物品[i].物品.名称~=nil then
			table.insert(self.销售物品,i,self.物品[i])
		end
	end
	for k,v in pairs(self.销售物品) do
 	 	self.销售物品[k]:置坐标(self.x + xx * 150 + 18-5,self.y + yy * 60 +30)
 	 	-- self.资源组[12]:显示(self.x + xx * 150 + 15-5,self.y + yy * 60 +30)
 	 	tp.物品格子背景_:显示(self.x + xx * 150 + 15-5,self.y + yy * 60 +30)
 	 	self.资源组[13]:显示(self.x + xx * 150 + 98-5,self.y + yy * 60 +60)
 	 	zts2:置颜色(白色):显示(self.x + xx * 150 + 71-5,self.y + yy * 60 +64,"单价")
 	 	zts2:置颜色(tos(self.销售物品[k].价格)):显示(self.x + xx * 150 + 103-5,self.y + yy * 60 +64,self.销售物品[k].价格)
 	 	local xq = nil
 	 	if self.销售物品[k].物品 ~= nil then
	 	 	if self.销售物品[k].物品.名称=="魔兽要诀" or self.销售物品[k].物品.名称=="高级魔兽要诀" or self.销售物品[k].物品.名称=="点化石" then
				xq=取兽诀缩写(self.销售物品[k].物品.附带技能)
			end
			if self.销售物品[k].物品.名称=="召唤兽内丹" or self.销售物品[k].物品.名称=="高级召唤兽内丹" then
			    if self.销售物品[k].物品.特效 then
				    xq=self.销售物品[k].物品.特效
				end
			end
			if self.销售物品[k].物品.名称=="强化符" or self.销售物品[k].物品.名称=="高级召唤兽内丹" then
			    xq=self.销售物品[k].物品.技能
			end

			if self.销售物品[k].物品.名称=="百炼精铁" or self.销售物品[k].物品.名称=="制造指南书" or self.销售物品[k].物品.名称=="元灵晶石" or self.销售物品[k].物品.名称=="灵饰指南书" then
				if self.销售物品[k].物品.子类 then
				    xq=self.销售物品[k].物品.子类.."级"
				end
			end
			if self.销售物品[k].物品.总类==5 and self.销售物品[k].物品.分类==6 then
				if self.销售物品[k].物品.级别限制 then
				    xq=self.销售物品[k].物品.级别限制.."级"
				end
			end
		end
 	 	self.销售物品[k]:显示(dt,x,y,self.鼠标,nil,nil,nil,1,xq)
 	 	if self.物品选中==k then
          	tp.物品格子确定_:显示(self.x + xx * 150 + 13,self.y + yy * 60 + 32)
 	 	end
 	 	if self.销售物品[k].焦点 then
 	 		tp.物品格子焦点_:显示(self.x + xx * 150 + 15-3,self.y + yy * 60 + 31)
 	 	end
		字体1:置颜色(白色):显示(self.x + xx * 150 + 71-5,self.y + yy * 60 +34,self.销售物品[k].物品.名称)
		if self.销售物品[k].焦点 and not tp.消息栏焦点 then
			if self.销售物品[k].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.销售物品[k].物品)
				-- if 引擎.鼠标弹起(左键) then
				-- 	self.输入框:置文本("1")
				--                     self.物品选中=k
				--                     self.商品单价=self.销售物品[k].价格
				--                     if self.销售物品[k].物品.数量==nil then
				--                     	self.商品数量 = 1
				--                     else
				--                         self.商品数量=self.销售物品[k].物品.数量
				--                     end
				--===============================
				if 引擎.鼠标弹起(左键)  and self.物品选中 ~= k then
				    self.物品选中=k
				    self.商品单价=self.销售物品[k].价格
				    if self.销售物品[k].物品.数量==nil then
				    	self.商品数量 = 1
				    else
				        self.商品数量=self.销售物品[k].物品.数量
				    end
				    self.输入框:置文本(1)
				elseif 引擎.鼠标弹起(左键) and self.物品选中 == k then
					if self.商品数量~=nil and self.输入框:取文本()+1<=self.商品数量 then
						self.输入框:置文本(self.输入框:取文本()+1)
					else
						self.输入框:置文本(self.商品数量)
					end
				elseif 引擎.鼠标弹起(右键) and self.物品选中 == k then
					if self.商品数量~=nil and self.输入框:取文本()-1 > 0 then
						self.输入框:置文本(self.输入框:取文本()-1)
					else
						self.输入框:置文本(self.商品数量)
					end
				end
			end
			self.焦点 = true
		end

   		xx = xx + 1
		if xx == 4 then
			xx = 0
			yy = yy + 1
		end
	end
	btgmmszt:置样式(0)
end

function 摊位购买类:bb显示(dt,x,y)
	local 字体 = tp.字体表.普通字体
	local 序列n=0
	local xx = 0
	local yy = 0
	for n, v in pairs(self.bb) do
		if self:取是否选中(n) then
			字体:置颜色(绿色)
		else
			字体:置颜色(黑色)
		end
		local t = tx(self.bb[n].模型)
		self.头像组[n] = tp.资源:载入(t[7],"网易WDF动画",t[1])
		bw1:置坐标(self.x + xx * 320 + 25,self.y + 40 + yy * 75)
		self.资源组[14]:显示(self.x + xx * 320 + 25,self.y + 40 + yy * 75)
		self.资源组[4]:显示(self.x + xx * 320 + 137,self.y + 72 + yy * 75)
		self.资源组[17]:显示(self.x + xx * 320 + 45,self.y + 51 + yy * 75)
		self.头像组[n]:显示(self.x + xx * 320 + 49,self.y + 55 + yy * 75)
		字体:置颜色(白色):显示(self.x + xx * 320 + 195,self.y + 52 + yy * 75,"等级：")
		字体:置颜色(白色):显示(self.x + xx * 320 + 100,self.y + 75 + yy * 75,"单价")


		if self.bb[n].种类=="变异" then
		字体:置颜色(白色):显示(self.x + xx * 320 + 100,self.y + 52 + yy * 75,"变异"..self.bb[n].模型)
		elseif  self.bb[n].种类=="野生" then
		字体:置颜色(白色):显示(self.x + xx * 320 + 100,self.y + 52 + yy * 75,self.bb[n].模型.."(野生)")
		else
		字体:置颜色(白色):显示(self.x + xx * 320 + 100,self.y + 52 + yy * 75,self.bb[n].模型)
		end


		-- 字体:置颜色(白色):显示(self.x + xx * 320 + 100,self.y + 52 + yy * 75,self.bb[n].模型)
		字体:置颜色(白色):显示(self.x + xx * 320 + 230,self.y + 52 + yy * 75,self.bb[n].等级)
		字体:置颜色(tos(self.bb[n].价格)):显示(self.x + xx * 320 + 145,self.y + 75 + yy * 75,self.bb[n].价格)

		if self.bb选中==n then
			self.资源组[16]:显示(self.x + xx * 320 + 21,self.y + yy * 75 + 37)
		end

		if tp.窗口.召唤兽查看栏.可视==false then
			if bw1:检查点(x,y) then
				tp.禁止关闭 = true
				self.资源组[15]:显示(self.x + xx * 320 + 21,self.y + yy * 75 + 37)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					self.bb选中=n
					self.输入框:置文本("1")
					self.商品单价=self.bb[n].价格
					if self.bb[n].数量==nil then
                    	self.商品数量 = 1
                    else
                        self.商品数量=self.bb[n].数量
                    end
				elseif 引擎.鼠标弹起(1) and self.鼠标 and not tp.消息栏焦点 then
					tp.窗口.召唤兽查看栏:打开(self.bb[n])
				end
			end
		end
		xx = xx + 1
		if xx == 2 then
			xx = 0
			yy = yy + 1
		end
	end
end

function 摊位购买类:制造显示(dt,x,y)
	self.选择框组[1]:更新(x,y)
	self.选择框组[2]:更新(x,y)
	字体:置颜色(白色):显示(self.x + 80,self.y + 30,"装备制造")
	字体:置颜色(白色):显示(self.x + 280,self.y + 30,"装备修理")
	字体:置颜色(白色):显示(self.x + 480,self.y + 30,"其他制造")
	self.资源组[18]:置宽高(175,229)
	self.资源组[18]:显示(self.x+20,self.y+50)
	self.资源组[18]:置宽高(175,229)
	self.资源组[18]:显示(self.x+220,self.y+50)
	self.资源组[18]:置宽高(175,260)
	self.资源组[18]:显示(self.x+420,self.y+50)
	self.资源组[29]:显示(self.x+179,self.y+76)
	self.资源组[29]:显示(self.x+379,self.y+76)
	self.资源组[28]:显示(self.x+583-4,self.y+76)

	-- tp.画线:置区域(0,0,15,210)
	-- tp.画线:显示(self.x+183,self.y+66)
	-- tp.画线:显示(self.x+383,self.y+66)
	-- tp.画线:置区域(0,0,15,230)
	-- tp.画线:显示(self.x+583,self.y+66)
	字体:置颜色(白色):显示(self.x + 30,self.y + 57,"类型")
	字体:置颜色(白色):显示(self.x + 80,self.y + 57,"等级")
	字体:置颜色(白色):显示(self.x + 138,self.y + 57,"价格")
	字体:置颜色(白色):显示(self.x + 230,self.y + 57,"类型")
	字体:置颜色(白色):显示(self.x + 285,self.y + 57,"等级")
	字体:置颜色(白色):显示(self.x + 332,self.y + 57,"价格")
	字体:置颜色(白色):显示(self.x + 430,self.y + 57,"类型")
	字体:置颜色(白色):显示(self.x + 485,self.y + 57,"等级")
	字体:置颜色(白色):显示(self.x + 535,self.y + 57,"价格")
	字体:置颜色(白色):显示(self.x + 55,self.y + 300,"普通打造")
	字体:置颜色(白色):显示(self.x + 155,self.y + 300,"强化打造")
	for i=1,#self.选择框组 do
		self.选择框组[i]:显示(self.x - 80 + i * 100,self.y + 295,true,nil,nil,self.选择框组[i].打勾框,2)
	end
	local 打造类组 = {}
	local 修理类组 = {}
	local 其他类组 = {}
	if self.上架制造.制造组~=nil then
		for n=1,#self.上架制造.制造组 do
			if self.上架制造[n]~=nil then
				local 排序组 = {}
				for k,v in pairs(self.上架制造[n]) do
				    table.insert(排序组,k)
				    table.sort(排序组,function(a,b) return a < b end)
				end
				for h,j in pairs(排序组) do
				    if self.上架制造.制造组[n].类别=="打造类" then
				    	table.insert(打造类组,{名称=self.上架制造.制造组[n].名称,类别=self.上架制造.制造组[n].类别,序号=self.上架制造[n][j]["序号"],等级=math.floor(self.上架制造.制造组[n].等级/10)*10 - (j-1)*10,价格=self.上架制造[n][j]["价格"]})
				    elseif self.上架制造.制造组[n].类别=="修理类" then
				    	table.insert(修理类组,{名称=self.上架制造.制造组[n].名称,类别=self.上架制造.制造组[n].类别,序号=self.上架制造[n][j]["序号"],等级=math.floor(self.上架制造.制造组[n].等级/10)*10 - (j-1)*10,价格=self.上架制造[n][j]["价格"]})
				    elseif self.上架制造.制造组[n].类别=="其他类" then
				    	table.insert(其他类组,{名称=self.上架制造.制造组[n].名称,类别=self.上架制造.制造组[n].类别,序号=self.上架制造[n][j]["序号"],等级=self.上架制造.制造组[n].等级,价格=self.上架制造[n][j]["价格"]})
				    end
				end
			end
		end
		for n=1,10 do
			if self.打造选中==n+self.上架打造数量 then
				box(self.x+25,self.y+58+n*20,self.x+180,self.y+75+n*20,-9670988)
			end
		    if 打造类组[n+self.上架打造数量]~=nil then
		    	bw2:置坐标(self.x+25,self.y+58+n*20)
		    	if bw2:检查点(x,y) then
		    		self.焦点=true
					box(self.x+25,self.y+58+n*20,self.x+180,self.y+75+n*20,-2097481216)
					if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
						for i=1,#self.选择框组 do
					    	self.选择框显示[i] = false
							self.选择框组[i]:置打勾框(false)
						end
						self.其他选中=0
						self.打造选中=n+self.上架打造数量
						self.输入框:置文本("1")
						self.商品数量=1
						self.商品单价 = 打造类组[n+self.上架打造数量].价格
						self.制造选择类别 = 打造类组[n+self.上架打造数量].类别
						self.打造等级 = 打造类组[n+self.上架打造数量].等级
						self.技能名称 = 打造类组[n+self.上架打造数量].名称
						self.选中序号 = 打造类组[n+self.上架打造数量].序号
					end
		    	end
		    	zts2:置样式(1)
		    	zts2:置颜色(蓝色):显示(self.x + 43,self.y + 60 + n * 20,打造类组[n+self.上架打造数量].名称)
		    	zts2:置颜色(蓝色):显示(self.x + 95,self.y + 60 + n * 20,打造类组[n+self.上架打造数量].等级)
		    	zts2:置颜色(tos(打造类组[n+self.上架打造数量].价格)):显示(self.x + 150,self.y + 60 + n * 20,打造类组[n+self.上架打造数量].价格)
		    	zts2:置样式(0)
		    end
		end
		for n=1,10 do
		    if 修理类组[n+self.上架修理数量]~=nil then
		    	zts2:置样式(1)
		    	zts2:置颜色(蓝色):显示(self.x + 253,self.y + 60 + n * 20,修理类组[n+self.上架修理数量].名称)
		    	zts2:置颜色(蓝色):显示(self.x + 298,self.y + 60 + n * 20,修理类组[n+self.上架修理数量].等级)
		    	zts2:置颜色(tos(修理类组[n+self.上架修理数量].价格)):显示(self.x + 347,self.y + 60 + n * 20,修理类组[n+self.上架修理数量].价格)
		    	zts2:置样式(0)
		    end
		end
		for n=1,10 do
			if self.其他选中==n+self.上架其他数量 then
				box(self.x+425,self.y+58+n*20,self.x+577,self.y+75+n*20,-9670988)
			end
		    if 其他类组[n+self.上架其他数量]~=nil then
		    	bw2:置坐标(self.x+423,self.y+58+n*20)
		    	if bw2:检查点(x,y) then
		    		self.焦点=true
					box(self.x+425,self.y+58+n*20,self.x+577,self.y+75+n*20,-2097481216)
					if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
						for i=1,#self.选择框组 do
					    	self.选择框显示[i] = false
							self.选择框组[i]:置打勾框(false)
						end
						self.打造选中=0
						self.其他选中=n+self.上架其他数量
						self.输入框:置文本("1")
						self.商品数量=1
						self.商品单价=其他类组[n+self.上架其他数量].价格
						self.制造选择类别 = 其他类组[n+self.上架其他数量].类别
						self.打造等级 = 其他类组[n+self.上架其他数量].等级
						self.技能名称 = 其他类组[n+self.上架其他数量].名称
						self.选中序号 = 其他类组[n+self.上架其他数量].序号
					end
		    	end
		    	zts2:置样式(1)
		    	zts2:置颜色(蓝色):显示(self.x + 447,self.y + 60 + n * 20,其他类组[n+self.上架其他数量].名称)
		    	zts2:置颜色(蓝色):显示(self.x + 499,self.y + 60 + n * 20,其他类组[n+self.上架其他数量].等级)
		    	zts2:置颜色(tos(其他类组[n+self.上架其他数量].价格)):显示(self.x + 548,self.y + 60 + n * 20,其他类组[n+self.上架其他数量].价格)
		    	zts2:置样式(0)
		    end
		end
	end
	local dz = #打造类组
	local xl = #修理类组
	local qt = #其他类组
	if dz > 10 then
		self.上架打造数量 = min(ceil((dz-10)*self.资源组[25]:取百分比()),dz-10)
		self.资源组[25]:显示(self.x+180,self.y+70,x,y,self.鼠标)
	end
	-- if self.资源组[19]:事件判断() then
	-- 	self.资源组[25]:置起始点(self.资源组[25]:取百分比转换(self.上架打造数量-1,10,dz))
	-- elseif self.资源组[20]:事件判断() then
	-- 	self.资源组[25]:置起始点(self.资源组[25]:取百分比转换(self.上架打造数量+1,10,dz))
	-- end
	if xl > 10 then
		self.上架修理数量 = min(ceil((xl-10)*self.资源组[26]:取百分比()),xl-10)
		self.资源组[26]:显示(self.x+380,self.y+70,x,y,self.鼠标)
	end
	-- if self.资源组[21]:事件判断() then
	-- 	self.资源组[26]:置起始点(self.资源组[26]:取百分比转换(self.上架修理数量-1,10,xl))
	-- elseif self.资源组[22]:事件判断() then
	-- 	self.资源组[26]:置起始点(self.资源组[26]:取百分比转换(self.上架修理数量+1,10,xl))
	-- end

	-- self.资源组[19]:更新(x,y,self.上架打造数量 > 0)
	-- self.资源组[20]:更新(x,y,self.上架打造数量 < dz - 10)
	-- self.资源组[21]:更新(x,y,self.上架修理数量 > 0)
	-- self.资源组[22]:更新(x,y,self.上架修理数量 < xl - 10)
	-- self.资源组[23]:更新(x,y,self.上架其他数量 > 0)
	-- self.资源组[24]:更新(x,y,self.上架其他数量 < qt - 10)
	-- self.资源组[19]:显示(self.x+181,self.y+51+26)
	-- self.资源组[20]:显示(self.x+181,self.y+262+2)
	-- self.资源组[21]:显示(self.x+381,self.y+51+26)
	-- self.资源组[22]:显示(self.x+381,self.y+262+2)
	-- self.资源组[23]:显示(self.x+581,self.y+51+26)
	-- self.资源组[24]:显示(self.x+581,self.y+297)
	if self.选择框组[1]:事件判断() then
		if self.制造选择类别~=nil and self.制造选择类别=="其他类" then
			tp.常规提示:打开("#Y/其他类型不需要选择打造模式")
			return
		elseif self.打造选中 == 0 then
			tp.常规提示:打开("#Y/请先选择制造类别等级")
			return
		end
		self.选择框组[1]:置打勾框(not self.选择框显示[1])
		self.选择框显示[1] = not self.选择框显示[1]
		if self.选择框显示[1] then
			self.打造类型 = 1
			self.选择框组[2]:置打勾框(false)
			self.选择框显示[2] = false
		else
		    self.打造类型 = nil
		end
	elseif self.选择框组[2]:事件判断() then
		if self.制造选择类别~=nil and self.制造选择类别=="其他类" then
			tp.常规提示:打开("#Y/其他类型不需要选择打造模式")
			return
		elseif self.打造选中 == 0 then
			tp.常规提示:打开("#Y/请先选择制造类别等级")
			return
		end
		self.选择框组[2]:置打勾框(not self.选择框显示[2])
		self.选择框显示[2] = not self.选择框显示[2]
		if self.选择框显示[2] then
			self.打造类型 = 2
			self.选择框组[1]:置打勾框(false)
			self.选择框显示[1] = false
		else
		    self.打造类型 = nil
		end
	end
end

function 摊位购买类:取是否选中(id)
 	return false
end

function 摊位购买类:显示(dt,x,y)
 	self.焦点=false
 	self.资源组[1]:显示(self.x,self.y)

	tp.窗口标题背景_:显示(self.x-80+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,self.摊位名称)

 	self.资源组[6]:更新(x,y,self.显示类型~="物品")
 	self.资源组[5]:更新(x,y)
 	self.资源组[7]:更新(x,y,self.显示类型~="bb")
 	self.资源组[8]:更新(x,y,self.显示类型~="制造")
 	self.资源组[11]:更新(x,y)
 	self.资源组[5]:显示(self.x+598,self.y+5)
 	self.资源组[6]:显示(self.x+170,self.y+340,nil,nil,nil,self.显示类型=="物品",2)
 	self.资源组[7]:显示(self.x+260,self.y+340,nil,nil,nil,self.显示类型=="bb",2)
 	self.资源组[8]:显示(self.x+350,self.y+340,nil,nil,nil,self.显示类型=="制造",2)
 	self.资源组[4]:显示(self.x+50,self.y+340)
 	self.资源组[4]:显示(self.x+50,self.y+365)
 	self.资源组[4]:显示(self.x+50,self.y+390)
 	self.资源组[4]:显示(self.x+473,self.y+340)
 	self.资源组[4]:显示(self.x+473,self.y+365)
 	self.资源组[11]:显示(self.x+170,self.y+385)
 	self.输入框:置坐标(self.x + 59,self.y + 344)
 	字体:置颜色(白色)
 	字体:显示(self.x + 15,self.y + 342+2,"数量")
 	字体:显示(self.x + 15,self.y + 367+2,"总价")
 	字体:显示(self.x + 15,self.y + 392+2,"现金")
 	字体:显示(self.x + 440,self.y + 342+2,"摊主")
 	字体:显示(self.x + 440,self.y + 367+2,"ID")
 	if self.商品单价~=nil and self.输入框:取文本()~="" then
 		字体:置颜色(tos(self.商品单价*tonumber(self.输入框:取文本()))):显示(self.x + 59,self.y + 369,self.商品单价*tonumber(self.输入框:取文本()) or "")
 	end
 	if self.物品选中 ~= 0 and self.输入框:取文本()~="" and (tonumber(self.输入框:取文本()) > 99 or tonumber(self.输入框:取文本()) > self.商品数量) then
 		if self.商品数量 >99 then
			self.输入框:置文本(99)
		else
		    self.输入框:置文本(self.商品数量)
		end
	elseif self.bb选中 ~= 0 then
		self.输入框:置文本(1)
	elseif self.打造选中 ~= 0 or self.其他选中 ~= 0 then
		self.输入框:置文本(1)
	end
 	字体:置颜色(tos(tp.金钱)):显示(self.x + 59,self.y + 394,tp.金钱)
 	字体:置颜色(黑色)
 	字体:显示(self.x + 479,self.y + 343,self.摊主名称)
 	字体:显示(self.x + 479,self.y + 369,self.摊主id)

	if self.资源组[5]:事件判断() then
		self:打开()
		return
	elseif self.资源组[6]:事件判断() then
		for i=1,#self.选择框组 do
	    	self.选择框显示[i] = false
			self.选择框组[i]:置打勾框(false)
		end
		self.打造选中=0
		self.其他选中=0
		self.物品选中=0
		self.bb选中=0
		self.输入框:置文本("")
		self.显示类型="物品"
	elseif self.资源组[7]:事件判断() then
		for i=1,#self.选择框组 do
	    	self.选择框显示[i] = false
			self.选择框组[i]:置打勾框(false)
		end
		self.打造选中=0
		self.其他选中=0
		self.物品选中=0
		self.bb选中=0
		self.输入框:置文本("")
		self.显示类型="bb"
	elseif self.资源组[8]:事件判断() then
		for i=1,#self.选择框组 do
	    	self.选择框显示[i] = false
			self.选择框组[i]:置打勾框(false)
		end
		self.打造选中=0
		self.其他选中=0
		self.物品选中=0
		self.bb选中=0
		self.输入框:置文本("")
		self.显示类型="制造"
	end

	if self.显示类型=="物品" then
		self:物品显示(dt,x,y)
	elseif self.显示类型=="bb" then
		self:bb显示(dt,x,y)
	else
		self:制造显示(dt,x,y)
	end

	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	if self.资源组[25].接触 or self.资源组[26].接触 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)

	if self.资源组[11]:事件判断() then
		if self.显示类型=="bb" then
			if self.bb选中==0 then
				tp.常规提示:打开("#Y/请先选择要购买的召唤兽")
				return
			end
		elseif self.显示类型=="物品" then
			if self.物品选中==0 then
				tp.常规提示:打开("#Y/请先选择要购买的物品")
				return
			end
		elseif self.显示类型=="制造" then
			if (self.制造选择类别~=nil and self.制造选择类别=="打造类") or self.制造选择类别==nil then
				if self.打造选中==0 then
					tp.常规提示:打开("#Y/请先选择制造类别等级")
					return
				elseif self.打造类型 == nil then
					tp.常规提示:打开("#Y/请先选择打造模式")
					return
				end
			elseif (self.制造选择类别~=nil and self.制造选择类别=="其他类") or self.制造选择类别==nil then
				if self.其他选中==0 then
					tp.常规提示:打开("#Y/请先选择制造类别等级")
					return
				end
			end
		end
		if self.显示类型=="bb" then
			发送数据(3726,{bb=self.bb选中,摊主id=self.摊主id})
		elseif self.显示类型=="制造" then
			发送数据(3726.1,{制造=self.上架制造,打造模式=self.打造类型,制造类别=self.制造选择类别,等级=self.打造等级,技能名称=self.技能名称,选中序号=self.选中序号,价格=self.商品单价,摊主id=self.摊主id})
		else
			发送数据(3726,{道具=self.物品选中,数量=tonumber(self.输入框:取文本()),摊主id=self.摊主id})
		end

	end

end

function 摊位购买类:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 摊位购买类:初始移动(x,y)
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

function 摊位购买类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 摊位购买类