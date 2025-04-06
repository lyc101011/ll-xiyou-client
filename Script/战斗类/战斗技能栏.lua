-- @Author: baidwwy
-- @Date:   2024-03-05 15:36:12
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-31 16:44:21
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-05-18 11:23:18
--======================================================================--
local 场景类_战斗技能栏 = class()
local tp
local ARGB = ARGB

function 场景类_战斗技能栏:初始化(根)
	self.ID = 58
	self.x = 392
	self.y = 105
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 资源:载入("pic/jn1.png","图片"),
		[2] = 资源:载入("pic/jn2.png","图片"),
		-- [3] = 资源:载入("pic/pjzr.png","图片"),
	}
	-- 392290334
	--3993750410 虚线  --3939290082扣这玩意儿
	self.技能 = {}
	self.大唐技能 = {}
	self.随机技能 = {}
	self.如意神通={}
	self.神通技能={}
	local 格子 = 根._技能格子
	for i=1,20 do
		self.技能[i] = 格子(0,0,i,"战斗技能栏")
	end
	for i=1,5 do
		self.大唐技能[i] = 格子(0,0,i,"战斗技能栏")
		self.随机技能[i] = 格子(0,0,i,"战斗技能栏")
	end
	for i=1,20 do
		self.如意神通[i] = 格子(0,0,i,"战斗技能栏")
	end
	-- self.资源组[3]:绑定窗口_(self.ID)
	self.背景 = 1
	self.窗口时间 = 0
	self.上回合 = nil
	self.上回合人物 = nil
	self.上回合宠物 = nil
	self.上回合人物特技 = nil
	self.偏移 = 0
	tp = 根
	self.披坚执锐显示=nil
	self.如意神通显示=nil
	self.可用编号=nil
	self.可选编号=nil
	self.昂扬 = nil
	self.当前类型=nil
	self.法术类型=nil
end

function 场景类_战斗技能栏:打开(技能组,法术类型,人物或宠物,追加法术)--,如意神通
	if self.可视 then
		self.背景 = 1
		self.可视 = false
		-- self.如意神通=nil
		self.披坚执锐显示=nil
		self.如意神通显示=nil
		self.可选编号=nil
		self.可用编号=nil
		self.昂扬 = nil
		self.当前类型=nil
		self.法术类型=nil
		战斗类.战斗指令.法术开关=false
	else
		self.当前类型=人物或宠物
		self.法术类型=法术类型
		self.背景 = 1
		local i = 0

		for w=1,20 do
			self.技能[w]:置技能(nil)
	        if 技能组[w]~=nil then
	        	local sylqhh = 技能组[w].剩余冷却回合
			  	local 临时技能=require("script/显示类/技能")()
              	临时技能:置对象(技能组[w].名称)
              	local 临时等级=技能组[w].等级
              	技能组[w]=临时技能
              	技能组[w].等级=临时等级
              	技能组[w].剩余冷却回合 = sylqhh
            end
            if 技能组[w] ~= nil then
            	if 技能组[w].如意神通~=nil then
	            	self.如意神通[w]:置技能(nil)
	                self.如意神通[w]:置技能(技能组[w])
					self.如意神通[w].剩余冷却回合 = 技能组[w].剩余冷却回合
					self.如意神通显示=1
				else
					self.技能[w]:置技能(技能组[w])
					self.技能[w].剩余冷却回合 = 技能组[w].剩余冷却回合
					i = i + 1
				end
            end
		end

		if 追加法术 then
			self.资源组[3] = tp.资源:载入("pic/pjzr.png","图片")
		    self:披坚执锐(追加法术)
		elseif self.如意神通显示~=nil then
			local z = 1
			for w=1,20 do
				if self.如意神通[w].技能~=nil and self.如意神通[w].剩余冷却回合 == nil then
					self.神通技能[z]=self.如意神通[w].技能.名称
					z = z + 1
				end
			end

			self.资源组[1] = tp.资源:载入("pic/hgs1.png","图片") --披坚执锐参考这个，给他也弄过来
			self.资源组[4] = tp.资源:载入("pic/hgs2.png","图片")
		end
		self.适配xy={x=0,y=0}

		if i > 10 then --大于10技能的时候
			self.背景 = 2
			if 全局游戏宽度==1024 then
			    self.适配xy={x=0,y=-15}
			else
				self.适配xy={x=-97,y=-60}
			end
		else
			self.偏移=2
			if 全局游戏宽度==1024 then
			    self.适配xy={x=15,y=60}
			else
				self.适配xy={x=-97,y=0}
			end
		end

		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	  	self.可视 = true
	  	战斗类.战斗指令.法术开关=true
	end
end

function 场景类_战斗技能栏:披坚执锐(数据)
	for w=1,5 do
		self.大唐技能[w]:置技能(nil)
        if 数据[w]~=nil then
		  	local 临时技能=require("script/显示类/技能")()
          	临时技能:置对象(数据[w].名称)
          	数据[w]=临时技能
        end
		if 数据[w] ~= nil then
			self.大唐技能[w]:置技能(数据[w])
		end
	end
	for w=1,5 do
		self.随机技能[w]:置技能(nil)
        if 数据[w]~=nil then
		  	local 临时技能=require("script/显示类/技能")()
          	临时技能:置对象(数据[w].名称)
          	数据[w]=临时技能
        end
		if 数据[w] ~= nil then
			self.随机技能[w]:置技能(数据[w])
		end
	end
	if 数据.昂扬~=nil then
	    self.昂扬 = 1
	end

	self.可选编号=数据.可选编号
	self.可用编号=数据.可用编号
	self.披坚执锐显示=1
end

function 场景类_战斗技能栏:更新()
end



function 场景类_战斗技能栏:显示(dt,x,y)
	if not self.可视 then
		return
	end

	self:检查点(x,y)
	self.焦点 = false
	self.资源组[self.背景]:显示(self.x+self.适配xy.x,self.y+self.适配xy.y)

	if self.披坚执锐显示~=nil then
		tp.技能格子背景_:显示(self.x+self.适配xy.x-115,self.y+self.适配xy.y+200)
		self.随机技能[self.可用编号]:置坐标(self.x+self.适配xy.x-115,self.y+self.适配xy.y+200) --随机出来的技能
		self.随机技能[self.可用编号]:显示(x,y,true or self.鼠标)
	    self.资源组[3]:显示(self.x+self.适配xy.x-177,self.y+self.适配xy.y)
	    local x1 = 0
		local y1 = 0
	    for w=1,5 do
	    	self.大唐技能[w]:置坐标(self.x+self.适配xy.x-147+x1*68,self.y+self.适配xy.y+34+y1*42)
			self.大唐技能[w]:显示(x,y,true or self.鼠标)
			if self.大唐技能[w].技能 ~= nil and self.大唐技能[w].焦点 then --self.鼠标 没写在下面就不会有鼠标
				tp.提示:技能(x,y,self.大唐技能[w].技能)
			end
			if self.昂扬 ~=nil then
				self.大唐技能[w].技能.模型:灰度级()
			else
			    if w~=self.可选编号 and self.大唐技能[w].技能 then
				    self.大唐技能[w].技能.模型:灰度级()
			    else
			    	if self.大唐技能[w].事件 and self.大唐技能[w].焦点 then--self.鼠标 then
			    		if tp.选中战斗窗口~=nil and tp.选中战斗窗口~=0 then --测试模式 修改战斗中显示窗口时更改
						else
							战斗类.战斗指令:设置披坚执锐(self.大唐技能[w].技能,w)
							self:打开()
						end
					end
				end
			end
			x1 = x1 + 1
			if x1 > 1 then
				x1 = 0
				y1 = y1 + 1
			end
	    end
	elseif self.如意神通显示~=nil then
		local x2 = 0
		local y2 = 0
		self.资源组[4]:显示(self.x+self.适配xy.x-177,self.y+self.适配xy.y)
		for w=1,20 do
			if self.如意神通[w].技能~=nil then
			    self.如意神通[w]:置坐标(self.x+self.适配xy.x-150+x2*68,self.y+self.适配xy.y+34+y2*42)
				self.如意神通[w]:显示(x,y,true or self.鼠标)
				if self.如意神通[w].技能 ~= nil and self.如意神通[w].焦点 then
					tp.提示:技能(x,y,self.如意神通[w].技能)
					if self.如意神通[w].事件 and self.如意神通[w].剩余冷却回合 == nil then  --self.鼠标 没写在下面就不会有鼠标
						if tp.选中战斗窗口~=nil and tp.选中战斗窗口~=0 then --测试模式 修改战斗中显示窗口时更改
						else
							战斗类.战斗指令:设置法术参数(self.如意神通[w].技能)
							self:打开()
						end
					end
				end
				x2 = x2 + 1
				if x2 > 1 then
					x2 = 0
					y2 = y2 + 1
				end
			end
		end
		tp.字体表.普通字体:置颜色(白色)
		tp.字体表.普通字体:显示(self.x+self.适配xy.x-160,self.y+self.适配xy.y+264,"如意神通：")
		tp.字体表.普通字体:显示(self.x+self.适配xy.x-91,self.y+self.适配xy.y+264,self.神通技能[1].."，")
		tp.字体表.普通字体:显示(self.x+self.适配xy.x-160,self.y+self.适配xy.y+279,self.神通技能[2].."，")
		tp.字体表.普通字体:显示(self.x+self.适配xy.x-91,self.y+self.适配xy.y+279,self.神通技能[3].."。")
	end

	local xx = 0
	local yy = 0
	for w=1,20 do
		if self.技能[w].技能 ~= nil then
			self.技能[w]:置坐标(self.x+self.适配xy.x+32+xx*86,self.y+self.适配xy.y+32+yy*41.5+self.偏移)
			self.技能[w]:显示(x,y,true or self.鼠标)
			if self.技能[w].焦点 then
				tp.提示:技能(x,y,self.技能[w].技能)--,self.技能[w].剩余冷却回合
				if tp.选中战斗窗口~=nil and tp.选中战斗窗口~=0 then --测试模式 修改战斗中显示窗口时更改
				else
					if self.技能[w].事件 and self.鼠标 and self.技能[w].剩余冷却回合 == nil then
						if tp.选中战斗窗口~=nil and tp.选中战斗窗口~=0 then --测试模式 修改战斗中显示窗口时更改
						else
							战斗类.战斗指令:设置法术参数(self.技能[w].技能)
							self:打开()
						end
					elseif 引擎.鼠标弹起(右键) and self.技能[w].剩余冷却回合 == nil then
						if self.当前类型=="人物" and self.法术类型=="法术" then
							self.上回合人物=w
							战斗类.战斗快捷键法术=w
						elseif self.当前类型=="宠物" and self.法术类型=="法术" then
							self.上回合宠物=w
							战斗类.宠物战斗快捷键法术=w--self.技能[w]
						end
						战斗类.战斗指令:设置法术参数(self.技能[w].技能)
						self:打开()
					end
					self.焦点 = true
				end
			end
			xx = xx + 1
			if xx > 1 then
				xx = 0
				yy = yy + 1
			end
		end

		---旧版
		-- self.技能[w]:置坐标(self.x+self.适配xy.x+32+xx*86,self.y+self.适配xy.y+32+yy*41.5+self.偏移)
		-- self.技能[w]:显示(x,y,true or self.鼠标)
		-- if self.技能[w].技能 ~= nil and self.技能[w].焦点 then
		-- 	tp.提示:技能(x,y,self.技能[w].技能,self.技能[w].剩余冷却回合)
		-- 	if self.技能[w].事件 and self.鼠标 and self.技能[w].剩余冷却回合 == nil then
		-- 		--tp.场景.战斗.窗口.指令栏.指令 = 2
		-- 		--tp.场景.战斗.窗口.指令栏.技能 = w
		-- 		--tp.场景.战斗.提示 = self.技能[w].技能.名称
		-- 		--self.可视 = false
		-- 		--break
		-- 		-- 战斗类.战斗快捷键法术=self.技能[w]
		-- 		战斗类.战斗指令:设置法术参数(self.技能[w].技能)
		-- 		self:打开()
		-- 	elseif 引擎.鼠标弹起(右键) and self.技能[w].剩余冷却回合 == nil then
		-- 		--tp.场景.战斗.窗口.指令栏.指令 = 2
		-- 		--tp.场景.战斗.窗口.指令栏.技能 = w
		-- 		--tp.场景.战斗.提示 = self.技能[w].技能.名称
		-- 		--self.可视 = false
		-- 		--break
		-- 		if self.当前类型=="人物" and self.法术类型=="法术" then
		-- 			self.上回合人物=w
		-- 			战斗类.战斗快捷键法术=w
		-- 		elseif self.当前类型=="宠物" and self.法术类型=="法术" then
		-- 			self.上回合宠物=w
		-- 			战斗类.宠物战斗快捷键法术=w--self.技能[w]
		-- 		end
		-- 		战斗类.战斗指令:设置法术参数(self.技能[w].技能)
		-- 		self:打开()
		-- 	end
		-- 	self.焦点 = true
		-- end
		-- xx = xx + 1
		-- if xx > 1 then
		-- 	xx = 0
		-- 	yy = yy + 1
		-- end
		---旧版
	end
	local yyy = 0
	if self.背景 == 2 then
	    yyy = 200
	end
	if self.技能 then
	           if self.上回合人物 ~= nil and self.当前类型=="人物" and self.法术类型=="法术" and self.技能[self.上回合人物].技能 then
			tp.字体表.普通字体:置颜色(-256):显示(self.x+self.适配xy.x+70,self.y+self.适配xy.y+280+yyy,self.技能[self.上回合人物].技能.名称)
		elseif  self.上回合宠物 ~= nil  and self.当前类型=="宠物" and self.法术类型=="法术" and self.技能[self.上回合宠物].技能 then
			tp.字体表.普通字体:置颜色(-256):显示(self.x+self.适配xy.x+70,self.y+self.适配xy.y+280+yyy,self.技能[self.上回合宠物].技能.名称)
		end
	end

	if tp.按钮焦点 then
		self.焦点 = true
	end
	if 引擎.鼠标弹起(1) and not tp.禁止关闭 and self.鼠标 then
		self:打开()
	end
end

function 场景类_战斗技能栏:检查点(x,y)
	-- if self.可视 and (self.资源组[self.背景]:是否选中(x,y) or self.资源组[3]:是否选中(x,y))  then
	if self.可视 and self.资源组[self.背景]:是否选中(x,y) then
		self.鼠标=true
		return true
   else
   	    self.鼠标=false
   	    return false
	end
end

function 场景类_战斗技能栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		-- tp.场景.战斗.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗技能栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗技能栏