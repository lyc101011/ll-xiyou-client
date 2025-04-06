-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:52
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-12 22:35:28
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-11-01 12:21:47
--======================================================================--
local 场景类_战斗道具栏 = class()
local require = require
local tp

function 场景类_战斗道具栏:初始化(根)
	self.ID = 61
	self.x = 376
	self.y = 179
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = require("script/系统类/按钮")
	self.资源组 = {
		[1] = 根.资源:载入('wzife.wdf',"网易WDF动画",0xC6D8094C),
		[2] = 按钮(根.资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4),
		[3] = 按钮(根.资源:载入('wzife.wdf',"网易WDF动画",0xFD3D61F2),0,0,4),
		[4] = 按钮(根.资源:载入('wzife.wdf',"网易WDF动画",0x09217E13),0,0,4),
	}
	self.物品 = {}
	local 格子 = require("script/显示类/物品_格子")
	for n=1,8 do -- 创建十八页
		for h=1,4 do
			for l=1,5 do
				self.物品[#self.物品 + 1] = 格子(l*51-37+self.x+4,h*51+self.y-16,#self.物品 + 1,"战斗道具_物品")
			end
		end
	end
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	tp = 根
end

-- function 场景类_战斗道具栏:打开(人物)
-- 	if self.可视 then
-- 		self.可视 = false
-- 	else
-- 		for n=self.开始,self.结束 do
-- 			self.物品[n]:置物品(tp.道具列表[n])
-- 		end
-- 		self.可视 = true
-- 		tp.运行时间 = tp.运行时间 + 1
-- 	  	self.窗口时间 = tp.运行时间
-- 	end
-- end


function 场景类_战斗道具栏:打开(伙伴id)
	if self.可视 then
		self.可视 = false
	else
		self.伙伴id=伙伴id
		for n=self.开始,self.结束 do
			self.物品[n]:置物品(tp.道具列表[n])
		end
		self.可视 = true
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	end
end

function 场景类_战斗道具栏:更新(dt,x,y)

 self.鼠标=self:检查点(x,y)
end
function 场景类_战斗道具栏:取可用道具(名称,物品)

	-- local 加血道具={"金创药","小还丹","千年保心丹","金香玉","五龙丹","翡翠豆腐","佛跳墙","蛇蝎美人","风水混元丹","定神香","十香返生丸","佛光舍利子","九转回魂丹","珍露酒","虎骨酒","女儿红","蛇胆酒","醉生梦死","梅花酒","百味酒","天不老","紫石英","血色茶花","熊胆","鹿茸","六道轮回","凤凰尾","硫磺草","龙之心屑","火凤之睛","四叶花","天青地白","七叶莲","丁香水","月星子","仙狐涎","地狱灵芝","麝香","血珊瑚","餐风饮露","白露为霜","天龙水","孔雀红","紫丹罗","佛手","旋复花","龙须草","百色花","香叶","白玉骨头","鬼切草","灵脂","曼陀罗花"}
 --    local 暗器道具={"飞刀","飞蝗石","铁蒺黎","无影神针","孔雀翎","含沙射影","回龙镊魂镖","寸阴若梦","魔睛子","顺逆神针"}

	-- for n=1,#加血道具 do
	-- 	if 加血道具[n]==名称 then return 5 end
	-- end
	-- for n=1,#暗器道具 do
	-- 	if 暗器道具[n]==名称 then return 4 end
	-- end
	-- if 名称=="乾坤袋" then
	-- 	return 4
	-- end

	-- if 名称=="乾坤玄火塔" or 名称=="混元伞"  or 名称=="五彩娃娃" or 名称=="万鬼幡" or 名称=="聚妖铃"  or 名称=="苍白纸人" or 名称=="干将莫邪"
	-- 	or 名称=="分水" or 名称=="缩地尺" or 名称=="赤焰" or 名称=="天煞" or 名称=="神木宝鼎" or 名称=="金蟾" or 名称=="九梵清莲" or 名称=="苍灵雪羽" or 名称=="璞玉灵钵" or 名称=="烽火狼烟" then
	-- 	return 2
	-- elseif 名称=="惊魂铃" or 名称=="鬼泣" or 名称=="发瘟匣" or 名称=="断线木偶"  or 名称=="摄魂" or 名称=="无魂傀儡" or 名称=="无尘扇" or 名称=="缚妖索" or 名称=="捆仙绳"
	-- 	or 名称=="缚龙索" or 名称=="现形符" or 名称=="番天印" or 名称=="落雨金钱" or 名称=="照妖镜" or 名称=="落宝金钱" or 名称=="无字经"or 名称=="舞雪冰蝶" or 名称=="紫火如意"
	-- 	or 名称=="番天印" or 名称=="金钱镖" then
	-- 	return 4
	-- elseif 名称=="清心咒" or 名称=="罗汉珠" then
	-- 	return 5
	-- end
	if skill战斗道具[名称] then
	    return skill战斗道具[名称]
	end
	return 0
end

function 场景类_战斗道具栏:可用门派(名称)
 	local 门派 = tp.队伍[1].门派
  	if 名称=="罗汉珠" and 门派~="化生寺" then
	 	return false
	 elseif 名称=="分水" and 门派~="龙宫" then
	 	return false
	 elseif 名称=="赤焰" and 门派~="魔王寨" then
	 	return false
	 elseif 名称=="天煞" and 门派~="凌波城" then
	 	return false
	 elseif 名称=="神木宝鼎" and 门派~="神木林" then
	 	return false
	 elseif 名称=="干将莫邪" and 门派~="大唐官府" then
	 	return false
	 elseif 名称=="金蟾" and 门派~="无底洞" then
	 	return false
	 elseif 名称=="摄魂" and 门派~="阴曹地府" then
	 	return false
	 end
  	return true
 end
function 场景类_战斗道具栏:显示(dt,x,y)
	if not self.可视 then
		return false
	end
	self.焦点 = false

    self.x = 全局游戏宽度/2-200  --这个要检查
	if self.鼠标 then
		self.资源组[2]:更新(x,y)
		--self.资源组[3]:更新(x,y)
		--self.资源组[4]:更新(x,y)
		if self.资源组[2]:事件判断() then
			self:打开()
		elseif self.资源组[3]:事件判断() then
			--[[self.开始 = self.开始 - 20
			self.结束 = self.结束 - 20
			for n=self.开始,self.结束 do
				self.物品[n]:置物品(tp.道具列表[n])
			end --]]
		elseif self.资源组[4]:事件判断() then
			--[[self.开始 = self.开始 + 20
			self.结束 = self.结束 + 20
			for n=self.开始,self.结束 do
				self.物品[n]:置物品(tp.道具列表[n])
			end--]]
		end
	else
		self.资源组[2].焦点 = 0
		if self.开始 ~= 1 then
			self.资源组[3].焦点 = 0
		else
			self.资源组[3].焦点 = 3
		end
		if self.结束 ~= 160 then
			self.资源组[4].焦点 = 0
		else
			self.资源组[4].焦点 = 3
		end
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 286,self.y + 6,true)
	--self.资源组[3]:显示(self.x + 275,self.y + 38,true)
	----self.资源组[4]:显示(self.x + 275,self.y + 221,true)
	local n = self.开始-1
	local c =  false
	for h=1,4 do
		for l=1,5 do
			n = n + 1
			self.物品[n]:置坐标(l*51-37+self.x+4,h*51+self.y-16)
			self.物品[n]:显示(dt,x,y,self.鼠标)--,{1,100} or self.物品[n].物品.名称=="乾坤袋" )
			-- if self.物品[n].物品~=nil then
			-- end
			if self.物品[n].物品~=nil and self.物品[n].物品.名称=="乾坤袋"  then
              self.物品[n]:显示(dt,x,y,self.鼠标)
            elseif self.物品[n].物品~=nil and   self.物品[n].物品.总类==1000 and self.物品[n].物品.使用==1 then
              self.物品[n]:显示(dt,x,y,self.鼠标)
            elseif self.物品[n].物品~=nil and self.物品[n].物品.总类==141  then
              self.物品[n]:显示(dt,x,y,self.鼠标)
            else
            	self.物品[n]:显示(dt,x,y,self.鼠标,{1,100})
				end
			if self.物品[n].物品 ~= nil and self.物品[n].物品.总类 == 100   then
				if tp.场景.战斗.战斗方式 ~= self.物品[n].物品.分类  then
					--tp.物品格子禁止_:显示(self.物品[n].x + 5,self.物品[n].y + 6)
				c = true
				end
			end
			if self.物品[n].物品 ~= nil and self.物品[n].焦点 and self.鼠标 then
				tp.提示:道具行囊(x,y,self.物品[n].物品)
				if 引擎.鼠标弹起(左键) and self:可用门派(self.物品[n].物品.名称) and self:取可用道具(self.物品[n].物品.名称,self.物品[n].物品)~=0 and self.物品[n].物品.回合==nil and self.鼠标 then
					if 1==2 then
          	  		else
          	  			if self.伙伴id then
											战斗类.伙伴zhil:设置道具参数(n,self:取可用道具(self.物品[n].物品.名称),self.伙伴id,self.物品[n].物品.名称)
										else
											战斗类.战斗指令:设置道具参数(n,self:取可用道具(self.物品[n].物品.名称))
										end
               	 		-- 战斗类.战斗指令:设置道具参数(n,self:取可用道具(self.物品[n].物品.名称))
					end
					--[[tp.场景.战斗.窗口.指令栏.物品对象 = 0
					if self.物品[n].物品.总类 == 100 then
						if self.物品[n].物品.名称 == "打狗棒" then
							tp.场景.战斗.窗口.指令栏.物品对象 = 1
						end
					end
					tp.场景.战斗.窗口.指令栏.指令 = 5
					tp.场景.战斗.窗口.指令栏.物品 = self.物品[n].物品
					tp.场景.战斗.提示 = self.物品[n].物品.名称
					tp.场景.战斗.窗口.指令栏.格子 = n
					tp.道具列表[n].数量 = tp.道具列表[n].数量 - 1
					if tp.道具列表[n].数量 <= 0 then
						tp.道具列表[n] = nil
					end
					刷新道具逻辑(tp.道具列表[n],n,true)
					self.可视 = false --]]
				end
			end
		end
	end
	if tp.按钮焦点 then
		self.焦点 = true
	end
-- local keyaz = 引擎.按键按住
-- local keyax = 引擎.按键按下
	if (引擎.鼠标弹起(1) or (引擎.按键按住(KEY.ALT) and 引擎.按键按下(KEY.E))) and not tp.禁止关闭  then --and self.鼠标
		self:打开()
	end
end

function 场景类_战斗道具栏:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
	return false
end

function 场景类_战斗道具栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.场景.战斗.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗道具栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗道具栏