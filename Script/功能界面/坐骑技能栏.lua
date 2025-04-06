--======================================================================--
--	☆ 作者：飞蛾扑火 QQ：1415559882
--======================================================================--
local 场景类_坐骑技能栏 = class()
local zts,bb,tp,zts1
local yx = {{68,4},{25,28},{111,28},{24,75},{111,75},{68,97}}
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local 坐骑技能表 = {"忠贯日月","正身清心","延年益寿","开天辟地","破釜沉州","大浪淘沙","炫火乱舞","金刚护身","偃旗息鼓","铜墙铁壁","水来土掩","飞火流星","乾坤借速"}
local function 取升级消耗(dj)
	if dj==0 then
	    return "你确认要将技能提升么？#Y提升技能需要消耗220000经验和1000000金钱，以及1点技能点。"
    elseif dj==1 then
	    return "你确认要将技能提升么？#Y提升技能需要消耗240000经验和1500000金钱，以及1点技能点。"
    elseif dj==2 then
	    return "你确认要将技能提升么？#Y提升技能需要消耗260000经验和2000000金钱，以及1点技能点。"
	else
		return "当前数据不同步，请重新打开坐骑界面再进行技能学习！"
	end
end
function 场景类_坐骑技能栏:初始化(根)
	self.ID = 76
	self.xx = 0
	self.yy = 0
	self.注释 = "坐骑技能栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 滑块 = 根._滑块
	self.资源组 = {
		[1] = 自适应.创建(0,1,315,390,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(17,4,44,22,1,3),0,0,4,true,true,"辅助"), --按钮.创建(自适应.创建(17,4,68,22,1,3),0,0,4,true,true," 取 消"),
		[4] = 按钮.创建(自适应.创建(17,4,44,22,1,3),0,0,4,true,true,"天火"),
		[5] = 按钮.创建(自适应.创建(17,4,44,22,1,3),0,0,4,true,true,"苍雷"),--按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0xCD999F0B),0,0,4,true,true),
		[6] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD),--技能栏
		[7] = 按钮.创建(自适应.创建(17,4,44,22,1,3),0,0,4,true,true,"赤电"),--资源:载入('wzife.wd1',"网易WDF动画",0x7367031D),
		[8] = 按钮.创建(自适应.创建(17,4,44,22,1,3),0,0,4,true,true,"寒水"),--资源:载入('wzife.wd1',"网易WDF动画",0x1E714129),
		[9] = 按钮.创建(自适应.创建(17,4,44,22,1,3),0,0,4,true,true,"疾风"),--资源:载入('wzife.wd1',"网易WDF动画",0xF2FC2425),
		[10] = 自适应.创建(34,1,282-9,165,3,9),--说明框  --资源:载入('wzife.wd2',"网易WDF动画",0x10E2B4A7),
		[11] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动 资源:载入('wzife.wd3',"网易WDF动画",0xC361C087),
		[12] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
		[13] = 自适应.创建(3,1,95,19,1,3),--属性框3 大
		-- [14] = 自适应.创建(1,1,204,18,1,3,nil,18),
		[15] = 自适应.创建(3,1,62,19,1,3),--属性框3 小
		-- [16] = 自适应.创建(0,1,303,380,3,9),--分框2
		[17] = 滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,213,2),
		[18] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true), --++
		-- [19] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		-- [20] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		-- [21] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),

	}
	-- self.资源组[18]:置偏移(0,3)
	self.物品 = {}
	self.技能 = {}
	self.技能2 = {}
	local jn = 根._技能格子
	for i=1,13 do
	    self.技能[i] = jn(0,0,i,"坐骑资质技能")
	end
	for i=1,8 do
	    self.技能2[i] = jn(0,0,i,"坐骑资质技能")
	end
	for i=2,5 do
	    self.资源组[i]:绑定窗口_(self.ID)
	end
	for i=18,18 do
	    self.资源组[i]:绑定窗口_(self.ID)
	end
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.状态 = 1
	self.窗口时间 = 0
	self.介绍文本 = 根._丰富文本(245,200)
	self.介绍加入 = 0
	self.加入 = 0
	self.开始 = 1
	self.开始 = 3
	self.选中 = 0

end

function 场景类_坐骑技能栏:打开(b,编号)
	if self.可视 then
		if b ~= nil and  b ~= bb then
			bb = b
			for i=1,13 do
			    self.技能[i]:置技能(坐骑技能表[i])
			end
			return
		end
		self.状态 = nil
		self.可视 = false
		self.坐骑编号 = 0
		self.介绍文本:清空()
		self.介绍加入 = 0
		self.选中 = 0
		self.认证码=nil

		-- if tp.窗口.坐骑资质栏.可视 then
		-- 	tp.窗口.坐骑资质栏:打开()
		-- end
	else
		insert(tp.窗口_,self)
		bb = b
		self.开始 = 1
		self.结束 = 3
		self.坐骑编号 = 编号

		for i=1,13 do
		    local 临时技能=tp._技能.创建()
		    临时技能:置对象(坐骑技能表[i],2,"坐骑")
		  	self.技能[i]:置技能(临时技能)
		  	self.技能[i].技能.等级 = bb.坐骑技能[self.技能[i].技能.名称]
		end
		self.认证码=bb.认证码

		self.状态 = 1
		self.选中 = 0
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_坐骑技能栏:刷新(内容)
	if bb~=nil then
	    bb = 内容
		if self.选中~=0 and self.技能[self.选中].技能 then
			self.技能[self.选中].技能.等级 = 内容.坐骑技能[self.技能[self.选中].技能.名称]
		    self:修改内容(self.技能[self.选中].技能.名称,self.技能[self.选中].技能.等级,self.技能[self.选中].技能.介绍,bb)
		end
	end

end
-- 1.延年益寿

function 场景类_坐骑技能栏:修改内容(名称,等级,描述,bb)
	if 名称 ~= nil then
		self.介绍文本:清空()
		if 描述 ~= nil then
		-- local 坐骑技能表 = {"忠贯日月","正身清心","延年益寿","开天辟地","破釜沉州","大浪淘沙","炫火乱舞","金刚护身","偃旗息鼓","铜墙铁壁","水来土掩","飞火流星","乾坤借速"}
		-- K=0xffCC0033, --淡红
		-- M=0xFF222222, --淡黑
			self.介绍文本:添加文本("#K/"..名称.."#L/".." 等级: "..等级.."/3")
			local xxx = bb.饱食度
			if xxx>100 then
			    xxx=100
			end
			self.介绍文本:添加文本("#L/".."实际效果(饱食度影响): "..xxx.."%")

			if 名称 == "忠贯日月" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/召唤兽在战斗中忠诚的消耗变为"..(3+等级).."场战斗掉1点忠诚")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/召唤兽在战斗中忠诚的消耗变为"..(3+等级+1).."场战斗掉1点忠诚")
				end
			elseif 名称 == "正身清心" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/每天前"..(等级).."次食用长寿面，豆斋果不会中毒。")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/每天前"..(等级+1).."次食用长寿面，豆斋果不会中毒。")
				end
			elseif 名称 == "延年益寿" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/增加统驭召唤兽食用长寿面、桂花丸和豆斋果时额外再增加寿命"..(等级+1).."%")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭召唤兽食用长寿面、桂花丸和豆斋果时额外再增加寿命"..(等级+2).."%")
				end
			elseif 名称 == "开天辟地" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/增加统驭的召唤兽力量点数*"..((等级)*3).."%的伤害力")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭的召唤兽力量点数*"..((等级+1)*3).."%的伤害力")
				end
			elseif 名称 == "破釜沉州" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/增加统驭的召唤兽致命几率"..(等级).."%，命中率增加"..(等级).."%")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭的召唤兽致命几率"..(等级+1).."%，命中率增加"..(等级+1).."%")
				end
			elseif 名称 == "大浪淘沙" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/增加统驭的召唤兽对（水攻、水漫金山、落岩、泰山压顶）水系土系法术伤害结果减免"..(等级*3+等级).."%")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭的召唤兽对（水攻、水漫金山、落岩、泰山压顶）水系土系法术伤害结果减免"..((等级+1)*3+等级+1).."%")
				end
			elseif 名称 == "炫火乱舞" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/增加统驭的召唤兽对（烈火、地狱烈火、雷、奔雷咒）火系雷系法术伤害结果减免"..(等级*3+等级).."%")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭的召唤兽对（烈火、地狱烈火、雷、奔雷咒）火系雷系法术伤害结果减免"..((等级+1)*3+等级+1).."%")
				end
			elseif 名称 == "金刚护身" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/统驭的召唤兽受到伤害时有"..(等级*20).."%的几率减少4%所受伤害。")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/统驭的召唤兽受到伤害时有"..((等级+1)*20).."%的几率减少4%所受伤害。")
				end
			elseif 名称 == "偃旗息鼓" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/统御的召唤兽受到的所有伤害降低"..(等级*0.8).."%")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/统御的召唤兽受到的所有伤害降低"..((等级+1)*0.8).."%")
				end
			elseif 名称 == "铜墙铁壁" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/敌人对统御的召唤兽物理暴击和法术暴击倍率降低"..((等级)*10).."%")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/敌人对统御的召唤兽物理暴击和法术暴击倍率降低"..((等级+1)*10).."%")
				end
			elseif 名称 == "飞火流星" then
				if 等级~=0 then
				    self.介绍文本:添加文本("#L/当前等级: #M/统驭的召唤兽速度降低"..(等级*3).."%")
				end
				if 等级~=3 then
				    self.介绍文本:添加文本("#L/下一等级: #M/统驭的召唤兽速度降低"..((等级+1)*3).."%")
				end
			elseif 名称 == "乾坤借速" then
				if 等级==0 then
					self.介绍文本:添加文本("#L/下一等级: #M/增加统驭的召唤兽闪躲3%，同时在物理攻击对方目标时有20%几率自身获得提升5%速度效果持续三回合")
				elseif 等级==1 then
					self.介绍文本:添加文本("#L/当前等级: #M/增加统驭的召唤兽闪躲3%，同时在物理攻击对方目标时有20%几率自身获得提升5%速度效果持续三回合")
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭的召唤兽闪躲3%，同时在物理攻击对方目标时有30%几率自身获得提升8%速度效果持续三回合")
			    elseif 等级==2 then
			    	self.介绍文本:添加文本("#L/当前等级: #M/增加统驭的召唤兽闪躲3%，同时在物理攻击对方目标时有30%几率自身获得提升8%速度效果持续三回合")
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭的召唤兽闪躲3%，同时在物理攻击对方目标时有50%几率自身获得提升10%速度效果持续三回合")
			    elseif 等级==3 then
				    self.介绍文本:添加文本("#L/当前等级: #M/增加统驭的召唤兽闪躲3%，同时在物理攻击对方目标时有50%几率自身获得提升10%速度效果持续三回合")
				end
			elseif 名称 == "水来土掩" then
				if 等级==0 then
					self.介绍文本:添加文本("#L/下一等级: #M/增加统驭召唤兽20%的中毒抵抗几率")
				elseif 等级==1 then
					self.介绍文本:添加文本("#L/当前等级: #M/增加统驭召唤兽20%的中毒抵抗几率")
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭召唤兽50%的中毒抵抗几率")
			    elseif 等级==2 then
			    	self.介绍文本:添加文本("#L/当前等级: #M/增加统驭召唤兽50%的中毒抵抗几率")
				    self.介绍文本:添加文本("#L/下一等级: #M/增加统驭召唤兽80%的中毒抵抗几率")
			    elseif 等级==3 then
				    self.介绍文本:添加文本("#L/当前等级: #M/增加统驭召唤兽80%的中毒抵抗几率")
				end
			end



		end
		for i=1,#self.介绍文本.显示表 - 13 do
			self.介绍文本:滚动(1)
		end
		self.资源组[17]:置起始点(0)
		self.介绍加入 = 0
	end
end

function 场景类_坐骑技能栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.状态 ~= 1)
	self.资源组[4]:更新(x,y,self.状态 ~= 2)
	self.资源组[5]:更新(x,y,self.状态 ~= 3)
	self.资源组[7]:更新(x,y,self.状态 ~= 4)
	self.资源组[8]:更新(x,y,self.状态 ~= 5)
	self.资源组[9]:更新(x,y,self.状态 ~= 6)
	self.资源组[11]:更新(x,y,self.介绍加入 > 0)
	self.资源组[12]:更新(x,y,self.介绍加入 < #self.介绍文本.显示表 - 13)
	self.资源组[18]:更新(x,y)

	if self.资源组[2]:事件判断() then
		self:打开()
		-- if tp.窗口.坐骑资质栏.可视 then
		-- 	tp.窗口.坐骑资质栏:打开()
		-- end
		return false
	elseif self.资源组[3]:事件判断() then
		self.状态 = 1
		self.开始 = 1
		self.结束 = 3
	elseif self.资源组[4]:事件判断() then
		self.状态 = 2
		self.开始 = 4
		self.结束 = 5
	elseif self.资源组[5]:事件判断() then
		self.状态 = 3
		self.开始 = 6
		self.结束 = 7
	elseif self.资源组[7]:事件判断() then
		self.状态 = 4
		self.开始 = 8
		self.结束 = 9
	elseif self.资源组[8]:事件判断() then
		self.状态 = 5
		self.开始 = 10
		self.结束 = 11
	elseif self.资源组[9]:事件判断() then
		self.状态 = 6
		self.开始 = 12
		self.结束 = 13
	elseif self.资源组[11]:事件判断() then
		self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.介绍加入-1,13,#self.介绍文本.显示表))
	elseif self.资源组[12]:事件判断() then
		self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.介绍加入+1,13,#self.介绍文本.显示表))
	end
	self.资源组[1]:显示(self.x,self.y)
	-- self.资源组[16]:显示(self.x+8,self.y+64)
	-- self.资源组[14]:显示(self.x+56,self.y+3)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"坐骑技能")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	zts:置颜色(0xFFFFFFFF)
	zts:显示(self.x+23,self.y+29+5,"可用技能点")
	self.资源组[15]:显示(self.x+104,self.y+27+5-2)
	zts:置颜色(-16777216)
	zts:显示(self.x+110,self.y+29+5,bb.可用技能点)
	-- self.资源组[18]:显示(self.x+230,self.y+29,true)
	zts1:置颜色(4294967295)
	zts1:置字间距(0)
	if self.状态 == 1 then
	    self.资源组[3]:显示(self.x+18,self.y+68-8,true,nil,nil,self.状态 == 1,2)
	else
		self.资源组[3]:显示(self.x+18,self.y+70-8,true,nil,nil,self.状态 == 1,2)
	end
	if self.状态 == 2 then
	    self.资源组[4]:显示(self.x+70-5,self.y+68-8,true,nil,nil,self.状态 == 2,2)
	else
		self.资源组[4]:显示(self.x+70-5,self.y+70-8,true,nil,nil,self.状态 == 2,2)
	end
	if self.状态 == 3 then
	    self.资源组[5]:显示(self.x+122-10,self.y+68-8,true,nil,nil,self.状态 == 3,2)
	else
		self.资源组[5]:显示(self.x+122-10,self.y+70-8,true,nil,nil,self.状态 == 3,2)
	end
	if self.状态 == 4 then
	    self.资源组[7]:显示(self.x+174-15,self.y+68-8,true,nil,nil,self.状态 == 4,2)
	else
		self.资源组[7]:显示(self.x+174-15,self.y+70-8,true,nil,nil,self.状态 == 4,2)
	end
	if self.状态 == 5 then
	    self.资源组[8]:显示(self.x+226-20,self.y+68-8,true,nil,nil,self.状态 == 5,2)
	else
		self.资源组[8]:显示(self.x+226-20,self.y+70-8,true,nil,nil,self.状态 == 5,2)
	end
	if self.状态 == 6 then
	    self.资源组[9]:显示(self.x+278-25,self.y+68-8,true,nil,nil,self.状态 == 6,2)
	else
		self.资源组[9]:显示(self.x+278-25,self.y+70-8,true,nil,nil,self.状态 == 6,2)
	end
	self.资源组[10]:显示(self.x+20,self.y+220-8)
	self.资源组[11]:显示(self.x+282,self.y+220-7)
	self.资源组[12]:显示(self.x+282,self.y+220+210-18-48)
	local xx = 0
	local yy = 0
	local xxi = 0
	local yyi = 0
	local yyii = 0
	for i=1,8 do
		yyi=yyi*xxi
		yyii = yyii+1
		local jx = self.x+20+yyi+(xx*41)
		local jy = self.y+100+(yy*41)-8
		if yyii>4 then
		    jy = self.y+100+20+(yy*41)-8
		end
		self.资源组[6]:显示(jx,jy)
	    self.技能2[i]:置坐标(jx+3,jy+2)
   	    self.技能2[i]:显示(x,y,self.鼠标)
		xx = xx + 1
		xxi=xxi+1
		if xxi == 4 then
			yyi=0
			xxi=0
		end
		yyi=35
		if xx > 3 then
			xx = 0
			yy = yy + 1
		end
	end
	local xx = 0
	local yy = 0
	local xxi = 0
	local yyi = 0
	local yyii = 0
	for i=self.开始,self.结束 do
		yyi=yyi*xxi
		yyii=yyii+1
		local jx = self.x+20+yyi+(xx*41)
		local jy = self.y+100+(yy*41)-8
		if yyii>4 then
		    jy = self.y+100+20+(yy*41)-8
		end
		-- self.资源组[6]:显示(jx,jy)
	    self.技能[i]:置坐标(jx+3,jy+2)
   	    self.技能[i]:显示(x,y,self.鼠标)
   	    if self.技能[i].技能 ~= nil then
   	    	if self.选中==i then
	   	        tp.物品格子确定_:显示(jx+1,jy)
	   	        if bb.可用技能点 ~= 0 and self.技能[i].技能.等级<3 then
	   	    		self.资源组[18]:显示(jx+30,jy+30,self.鼠标)
	   	    	end
	   	    end
	   	    if self.技能[i].焦点 then
	   	    	tp.物品格子焦点_:显示(jx,jy)
	   	    	if mouseb(0) then
	   	    		self.选中=i
	   	    		self.认证码=bb.认证码
		   	    	self:修改内容(self.技能[i].技能.名称,self.技能[i].技能.等级,self.技能[i].技能.介绍,bb)
	   	        end
	   	    end
	   	end

		xx = xx + 1
		xxi=xxi+1
		if xxi == 4 then
			yyi=0
			xxi=0
		end
		yyi=35
		if xx > 3 then
			xx = 0
			yy = yy + 1
		end
	end

   	if self.资源组[18]:事件判断() then
   		tp.窗口.对话栏:文本("","",取升级消耗(self.技能[self.选中].技能.等级),{" 确认 "," 取消 "})
   	end



	self.介绍文本:显示(self.x+22,self.y+226)
	if #self.介绍文本.显示表 > 13 then
		self.介绍加入 = min(ceil((#self.介绍文本.显示表-13)*self.资源组[17]:取百分比()),#self.介绍文本.显示表-13)
		self.介绍文本.加入 = self.介绍加入
		self.资源组[17]:显示(self.x+22,self.y+223,x,y,self.鼠标)
	end
	if self.资源组[17].接触 then
		self.焦点 = true
	end
end

function 场景类_坐骑技能栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_坐骑技能栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_坐骑技能栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_坐骑技能栏