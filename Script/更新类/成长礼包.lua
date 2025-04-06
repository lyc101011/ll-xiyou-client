-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-11 09:56:15
-- @Author: baidwwy
-- @Date:   2023-10-29 20:33:38
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-26 23:58:38
--======================================================================--

--======================================================================--
local 成长礼包 = class()
local tp
local insert = table.insert
local wp={
         [1]={名称="神秘伴手礼金"},
         [2]={名称="神秘伴手礼丹"},
         [3]={名称="神秘伴手礼骑"},
         [4]={名称="神秘伴手礼宝"},
         [5]={名称="神秘伴手礼旗"},

         [6]={名称="神秘伴手礼金"},
         [7]={名称="神秘伴手礼丹"},
         [8]={名称="神秘伴手礼骑"},
         [9]={名称="神秘伴手礼宝"},
         [10]={名称="神秘伴手礼旗"},

         [11]={名称="神秘伴手礼金"},
         [12]={名称="神秘伴手礼丹"},
         [13]={名称="神秘伴手礼骑"},
         [14]={名称="神秘伴手礼宝"},
         [15]={名称="神秘伴手礼旗"},

         [16]={名称="神秘伴手礼金"},
         [17]={名称="神秘伴手礼丹"},
         [18]={名称="神秘伴手礼骑"},
         [19]={名称="神秘伴手礼宝"},
         [20]={名称="神秘伴手礼旗"},

         [21]={名称="神秘伴手礼金"},
         [22]={名称="神秘伴手礼丹"},
         [23]={名称="神秘伴手礼骑"},
         [24]={名称="神秘伴手礼宝"},
         [25]={名称="神秘伴手礼旗"},
        }
function 成长礼包:初始化(根)
	self.ID = 134
	self.x = 全局游戏宽度/2-180
	self.y = 94--全局游戏高度/2-160
	self.xx = 0
	self.yy = 0
	self.注释 = "成长礼包"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.普通字体

end

function 成长礼包:打开(内容)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		self.物品组={}
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,497,440,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
			[3] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"领取"),
			[4] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"领取"),
			[5] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"领取"),
			[6] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"领取"),
			[7] = 按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"领取"),
			[8] = 资源:载入('nice.wdf',"网易WDF动画",0x0683C414), --已领取
		}
		self.线 = tp.资源:载入("wzife.wd1","网易WDF动画",999600305)
		self.线:置区域(0,0,467,2)
	    self.资源组[3]:置偏移(5,0)
	    self.资源组[4]:置偏移(5,0)
	    self.资源组[5]:置偏移(5,0)
	    self.资源组[6]:置偏移(5,0)
	    self.资源组[7]:置偏移(5,0)
	    self.物品组={}
	    self:加载物品(内容)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 成长礼包:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.礼包序列.礼包一==false)
	self.资源组[4]:更新(x,y,self.礼包序列.礼包二==false)
	self.资源组[5]:更新(x,y,self.礼包序列.礼包三==false)
	self.资源组[6]:更新(x,y,self.礼包序列.礼包四==false)
	self.资源组[7]:更新(x,y,self.礼包序列.礼包五==false)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"成长礼包")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	self.资源组[3]:显示(self.x+428,self.y+49)
	self.资源组[4]:显示(self.x+428,self.y+49+1*84)
	self.资源组[5]:显示(self.x+428,self.y+49+2*84)
	self.资源组[6]:显示(self.x+428,self.y+49+3*84)
	self.资源组[7]:显示(self.x+428,self.y+49+4*84)
	zts:置颜色(黄色):显示(self.x+20,self.y+55,"20级")
	zts:置颜色(黄色):显示(self.x+20,self.y+55+1*84,"30级")
	zts:置颜色(黄色):显示(self.x+20,self.y+55+2*84,"40级")
	zts:置颜色(黄色):显示(self.x+20,self.y+55+3*84,"50级")
	zts:置颜色(黄色):显示(self.x+20,self.y+55+4*84,"60级")
	zts:置颜色(白色)
	local xx = 0
	local yy = 0
	for i=1,25 do
		tp.物品格子背景_:显示(self.x+68+57+25+(xx-1)*70,self.y+35+yy*84)
		xx = xx + 1
		if xx==5 then
		    xx=0
		    yy=yy+1
		end
	end
	for i=0,3 do
		self.线:显示(self.x+20,self.y+35+65+i*84)
	end
    for k,v in pairs(self.物品组) do
    	if k<=5 then
            local wx = k*70
			v.名称.小动画:显示(self.x+61+wx-50,self.y+37)
			if self.礼包序列.礼包一 then
				v.名称.小动画:灰度级()
				self.资源组[8]:显示(self.x+61+wx-50-146,self.y+37-380)
			end
			if v.名称.名称=="九转金丹" then
			   v.名称.品质=300
			end
			if v.名称.小动画:是否选中(x,y) then
		    	tp.提示:商城提示(self.x-150+wx,self.y-90,v.名称.名称,v.名称.说明,v.名称.大动画,v.名称.备注)
		    end
    	end
    	if k<=10 and k>5 then
            local wx =(k-5)*70
			v.名称.小动画:显示(self.x+61+wx-50,self.y+37+1*84)
			if self.礼包序列.礼包二 then
				v.名称.小动画:灰度级()
				self.资源组[8]:显示(self.x+61+wx-50-146,self.y+37+1*84-380)
			end
			if v.名称.小动画:是否选中(x,y) then
		    	tp.提示:商城提示(self.x-150+wx,self.y-10,v.名称.名称,v.名称.说明,v.名称.大动画,v.名称.备注)
		    end
    	end
    	if k<=15 and k>10 then
            local wx =(k-10)*70
			v.名称.小动画:显示(self.x+61+wx-50,self.y+37+2*84)
			if self.礼包序列.礼包三 then
				v.名称.小动画:灰度级()
				self.资源组[8]:显示(self.x+61+wx-50-146,self.y+37+2*84-380)
			end
			if v.名称.小动画:是否选中(x,y) then
		    	tp.提示:商城提示(self.x-150+wx,self.y+90,v.名称.名称,v.名称.说明,v.名称.大动画,v.名称.备注)
		    end
    	end
    	if k<=20 and k>15 then
            local wx =(k-15)*70
			v.名称.小动画:显示(self.x+61+wx-50,self.y+37+3*84)
			if self.礼包序列.礼包四 then
				v.名称.小动画:灰度级()
				self.资源组[8]:显示(self.x+61+wx-50-146,self.y+37+3*84-380)
			end
			if v.名称.小动画:是否选中(x,y) then
		    	tp.提示:商城提示(self.x-150+wx,self.y+170,v.名称.名称,v.名称.说明,v.名称.大动画,v.名称.备注)
		    end
    	end
    	if k<=25 and k>20 then
            local wx =(k-20)*70
			v.名称.小动画:显示(self.x+61+wx-50,self.y+37+4*84)
			if self.礼包序列.礼包五 then
				v.名称.小动画:灰度级()
				self.资源组[8]:显示(self.x+61+wx-50-146,self.y+37+4*84-380)
			end
			if v.名称.小动画:是否选中(x,y) then
		    	tp.提示:商城提示(self.x-150+wx,self.y+250,v.名称.名称,v.名称.说明,v.名称.大动画,v.名称.备注)
		    end
    	end
	end
	if self.资源组[2]:事件判断() then
	    self:打开()
		return
	elseif self.资源组[3]:事件判断() then --20
		if tp.队伍[1].等级>=20 then --测试模式
		    发送数据(94,{礼包=20})
	    else
			tp.常规提示:打开("#Y/等级未达到要求！")
		end
	elseif self.资源组[4]:事件判断() then --30
		if tp.队伍[1].等级>=30 then
		    发送数据(94,{礼包=30})
	    else
			tp.常规提示:打开("#Y/等级未达到要求！")
		end
	elseif self.资源组[5]:事件判断() then --40
		if tp.队伍[1].等级>=40 then
		    发送数据(94,{礼包=40})
	    else
			tp.常规提示:打开("#Y/等级未达到要求！")
		end
	elseif self.资源组[6]:事件判断() then --50
		if tp.队伍[1].等级>=50 then
		    发送数据(94,{礼包=50})
	    else
			tp.常规提示:打开("#Y/等级未达到要求！")
		end
	elseif self.资源组[7]:事件判断() then --60
		if tp.队伍[1].等级>=60 then
		    发送数据(94,{礼包=60})
	    else
			tp.常规提示:打开("#Y/等级未达到要求！")
		end
	end
end

function 成长礼包:加载物品(数据)
	self.礼包序列 =数据.是否领取
	for k,v in pairs(wp) do
		if self.物品组[k]==nil then
		   self.物品组[k]={}
		end
		for i,n in pairs(v) do
			if self.物品组[k][i]== nil then
				self.物品组[k][i]={}
			end
			local 资源=引擎.取物品(n)
			self.物品组[k][i].小动画=tp.资源:载入(资源[11],"网易WDF动画",资源[12])
			self.物品组[k][i].大动画=tp.资源:载入(资源[11],"网易WDF动画",资源[13])
			self.物品组[k][i].名称=n
			self.物品组[k][i].说明=资源[1]
		end
	end
end

function 成长礼包:更新礼包(sj)
    self.礼包序列.礼包一=sj.内容.礼包一
    self.礼包序列.礼包二=sj.内容.礼包二
    self.礼包序列.礼包三=sj.内容.礼包三
    self.礼包序列.礼包四=sj.内容.礼包四
    self.礼包序列.礼包五=sj.内容.礼包五
end

function 成长礼包:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 成长礼包:初始移动(x,y)
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

function 成长礼包:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 成长礼包