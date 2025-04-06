-- @Author: baidwwy
-- @Date:   2024-12-14 19:52:27
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-04-07 00:15:28
-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:36
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-16 09:28:01
-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-07 15:34:08
local 系统类_提示框 = class()
local floor = math.floor
local format = string.format
local remove = table.remove
local insert = table.insert
local jls = nil
local min = math.min
local gxs = 引擎.取物品功效
local tp
local ARGB = ARGB
local pairs = pairs
local 到整数 = math.ceil
local ff
function 系统类_提示框:初始化(根)
	ff = 根._丰富文本
	self.介绍文本 = ff(246,480,根.字体表.道具详情)
	self.道具文本 = ff(194,480,根.字体表.道具详情)
	self.道具文本1 = ff(194,480,根.字体表.道具详情)
	self.道具文本2 = ff(194,480,根.字体表.道具详情)
	self.道具文本3 = ff(194,480,根.字体表.道具详情)
	self.星位文本 = ff(400,480,根.字体表.道具详情)
	self.npc文本 = ff(200,35,根.字体表.道具详情)
	self.小图标文本 = ff(135,35,根.字体表.道具详情)
	self.外部文本 = ff(200,480,根.字体表.道具详情)
	self.每日文本 = ff(240,200,根.字体表.道具详情)
	self.文本 = {}
	self.寄存内容 = {}
	self.寄存高度 = {}
	self.最高 = 0
	jls = 根.提示框
	tp = 根

	self.显示方式=1
	self.每日文本:置行距(16)
end
function 提示(a)
  tp.常规提示:打开(a)
end
function 系统类_提示框:显示(x,y)
	if #self.文本 == 0 then
		return false
	end

	for n=1,#self.文本 do
		if self.文本[n] ~= nil then
			self.文本[n].tiem = self.文本[n].tiem - 1
			if self.文本[n].tiem <= 0 then
				table.remove(self.文本, n)
			end
		end
	end
	for n=1,#self.文本 do
		if self.文本[n] ~= nil then
			local h=self.文本[n].h
			jls:置宽高(322,h+16)
			jls:显示(self.文本[n].x,self.文本[n].y)
			self.文本[n].ffs:显示(self.文本[n].x+6.5,self.文本[n].y+6.5)
		end
	end
end

function 系统类_提示框:写入(txt)
	local x = 0
	if #self.文本 > 8 then
		remove(self.文本, 1)
	end
	local txts = {
		x = 310,
		y = 310, --self.h
		tiem = 150+#self.文本*7,
		ffs =  ff(316,300,tp.字体表.道具详情)
	}
	local ab = txts.ffs:添加文本(txt)
	txts.h = ab-6 --这里调整高度
	if #self.文本 > 0 then
		local cs = 1
		local zgd = 300
		for i=1,#self.文本 do
			zgd = zgd - self.文本[i].h - 18
		end
		for i=1,50 do
			self.文本[cs].y = zgd
			zgd = zgd + self.文本[cs].h +18
			cs = cs + 1
			if cs > #self.文本 then
				break
			end
		end
	end
	insert(self.文本,txts)
end

function 系统类_提示框:道具行囊(x,y,item,jd,lv)
	if item == nil then
		return
	end
	local w = 300
	local h = 18
	local zf = "#W/"
	if jd == nil then
		zf = "#Y/"
	end
	self.道具文本:清空()
	self.道具文本:添加文本("")
	self.道具文本:添加文本(item.介绍)
	local zbwbgd = self.道具文本.显示表.高度+30
	local zls = item.总类

				if item.名称=="淬灵石"  then
				 if item.特性~=nil then
				 	self.道具文本:添加文本(format("#Y/附加特性：%s",item.特性.技能))
				 	self.道具文本:添加文本(format("#Y/附加级别：%s",item.特性.等级))
			else
				self.道具文本:添加文本(format("#Y/暂未使用"))
end
end

	if zls == 1 then
		local gs = ""
		local qgx = gxs(item.名称,item.阶品)
		if item.名称 == "炫彩ID" then
			if item.特效 then
				self.道具文本:添加文本(format("#Y/【特效】#G/%s",item.特效))
			end
		end
		if item.分类 ~= 10 and item.分类 ~= 11 then
			if item.子类==1 and item.分类==4 then
				if item.名称=="包子" then
					self.道具文本:添加文本("【功效】恢复气血100点")
				elseif   item.名称=="女儿红" then
					self.道具文本:添加文本("【功效】恢复愤怒值=20")
					self.道具文本:添加文本("附加昏睡状态")
				elseif item.名称=="臭豆腐" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血=品质*20+200")
					if item.阶品 then
						self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="烤鸭" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血=品质*10+100")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="烤肉" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血=品质*10")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="佛跳墙" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复魔法=品质*10+100")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="桂花丸" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复召唤兽寿命=品质*0.5")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="豆斋果" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复召唤兽寿命=品质*3")
					self.道具文本:添加文本("但有3%几率出现食物中毒而减少某些资质。")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="长寿面" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复召唤兽寿命=品质*2+50")
					self.道具文本:添加文本("但有3%几率出现食物中毒而减少某些资质。")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="翡翠豆腐" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血=品质*15+150")
					self.道具文本:添加文本("魔法=品质*10+100")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="珍露酒" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复愤怒值=品质*0.4+20")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="梅花酒" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复愤怒值=品质*0.6")
					self.道具文本:添加文本("昏睡2~3回合")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="百味酒" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复愤怒值=品质*0.7")
					self.道具文本:添加文本("昏睡2~3回合或附加中毒状态")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="蛇胆酒" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复愤怒值=品质*1")
					self.道具文本:添加文本("减少防御=品质*1.5")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="醉生梦死" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复愤怒值=品质*1")
					self.道具文本:添加文本("附加疯狂状态3~4回合")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="虎骨酒" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复愤怒值=20")
					self.道具文本:添加文本("附加疯狂状态")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="红罗羹" then
					self.道具文本:添加文本("【功效】储有品质*200+15000的气血，每次食用后根据补量扣除相同的数量,到0止。非战斗中使用。")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="绿芦羹" then
					self.道具文本:添加文本("【功效】储有品质*70+5000的魔法，每次食用后根据补量扣除相同的数量,到0止。非战斗中使用。")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="玉露羹" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血=品质*20")
					self.道具文本:添加文本("恢复气血上限=品质*10")
					self.道具文本:添加文本("恢复魔法=品质*15")
					self.道具文本:添加文本("恢复愤怒=品质*0.4")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
				elseif item.名称=="百岁香" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复品质*2+150的体力和活力每天限用一个")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
					-- elseif item.名称=="同心肉脯" then
					-- 	self.道具文本:添加文本("【功效】")
					-- 	self.道具文本:添加文本("食用后可以召唤兽的内丹格子+1内丹格子上限6个格子（召唤兽为进阶时不可以使用）")
					-- 	if item.阶品 then
					--  self.道具文本:添加文本("#Y/品质 "..item.阶品)
					-- end
					-- elseif item.名称=="忠义肉脯" then
					-- 	self.道具文本:添加文本("【功效】")
					-- 	self.道具文本:添加文本("上古妖兽死后被割下的肉，召唤兽使用后可随机领悟一个低级技能")
					-- 	if item.阶品 then
					--  self.道具文本:添加文本("#Y/品质 "..item.阶品)
					-- end
					-- elseif item.名称=="神仙饮" then
					-- 	self.道具文本:添加文本("【功效】")
					-- 	self.道具文本:添加文本("使用后可令怪物丢盔卸甲，跳过战斗环节直接获得经验奖励持续场次=（品质*2）（仅限野外挂机生效）")
					-- 	if item.阶品 then
					--  self.道具文本:添加文本("#Y/品质 "..item.阶品)
					-- end
					-- elseif item.名称=="八珍玉液" then
					-- 	self.道具文本:添加文本("【功效】")
					-- 	self.道具文本:添加文本("储有品质*60+3000的气血上限,每次食用后根据补给量扣除相同的数量,到0即止。非战斗中使用。")
					-- 	if item.阶品 then
					--  self.道具文本:添加文本("#Y/品质 "..item.阶品)
					-- end
					-- elseif item.名称=="五味露" then
					-- 	self.道具文本:添加文本("【功效】")
					-- 	self.道具文本:添加文本("为召唤兽增加经验=品质*召唤兽等级*10+10000。每天每只召唤兽限吃1个。")
					-- 	if item.阶品 then
					--  self.道具文本:添加文本("#Y/品质 "..item.阶品)
					-- end
				elseif item.名称=="福灵沙" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("良用后法宝每次获得灵气量增加1点持续时间=(品质0.3+30分钟。")
					if item.阶品 then
					self.道具文本:添加文本("#Y/品质 "..item.阶品)
					end
					-- elseif item.名称=="千金露" then
					-- 	self.道具文本:添加文本("【功效】")
					-- 	self.道具文本:添加文本("随机增加召唤兽1点属性每只召唤兽限吃等级/20+1)个")
					-- 	if item.阶品 then
					--  self.道具文本:添加文本("#Y/品质 "..item.阶品)
					-- end
				elseif item.名称=="秘制红罗羹"then
					self.道具文本:添加文本("【功效】储有5000000的气血，在每场战斗结束后自动回复人物气血,补满人物魔法时扣除存有的气血量")
					self.道具文本:添加文本("#Y在长安的云来酒店（长安城436,59），酒店老板处兑换不允许交易")
				elseif item.名称=="秘制绿芦羹" then
					self.道具文本:添加文本("【功效】储有5000000的魔法，在每场战斗结束后自动回复人物魔法,补满人物魔法时扣除存有的魔法量")
					self.道具文本:添加文本("#Y在长安的云来酒店（长安城436,59），酒店老板处兑换不允许交易")
				elseif item.名称=="秘制八珍玉液"then
					self.道具文本:添加文本("【功效】储有200000的气血上限，在每场战斗结束后自动回复人物气血上限,补满人物魔法时扣除存有的气血上限量")
					self.道具文本:添加文本("#Y在长安的云来酒店（长安城436,59），酒店老板处兑换不允许交易")
				elseif item.名称=="秘制回梦饮" then
					self.道具文本:添加文本("【功效】储有160点灵气,服用后在副本、抓鬼、神器等任务中可以获得额外经验奖励(约双倍")
					self.道具文本:添加文本("#Y在长安的云来酒店（长安城436,59），酒店老板处兑换不允许交易")
				elseif item.名称=="杂烩粥" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血2500点")
					self.道具文本:添加文本("恢复愤怒10点")
				elseif item.名称=="红烧鲤鱼" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复魔法150点")
					self.道具文本:添加文本("恢复气血1000点")
					self.道具文本:添加文本("恢复愤怒20点")
					self.道具文本:添加文本("恢复爆竹充能20%")
				elseif item.名称=="什锦年糕" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复魔法330点")
					self.道具文本:添加文本("恢复气血1100点")
					self.道具文本:添加文本("恢复愤怒10点")
					self.道具文本:添加文本("恢复爆竹充能12.5%")
				elseif item.名称=="油焖对虾" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血2600点")
				elseif item.名称=="果蔬羹" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复魔法450点")
					self.道具文本:添加文本("恢复愤怒10点")
				elseif item.名称=="白粥" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复愤怒30点")
				elseif item.名称=="饺子" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血500点")
					self.道具文本:添加文本("恢复愤怒10点")
					self.道具文本:添加文本("恢复爆竹充能10%")
				elseif item.名称=="果蔬篮" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复魔法330点")
				elseif item.名称=="烤肉" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复气血2200点")
				elseif item.名称=="药膳粥" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复愤怒10点")
					self.道具文本:添加文本("恢复爆竹充能25%")
				elseif item.名称=="红烧鲫鱼" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复魔法330点")
					self.道具文本:添加文本("恢复气血500点")
					self.道具文本:添加文本("恢复愤怒10点")
				elseif item.名称=="年糕" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复魔法150点")
					self.道具文本:添加文本("恢复愤怒10点")
				elseif item.名称=="苹果果脯" then
					self.道具文本:添加文本("【功效】")
					self.道具文本:添加文本("恢复魔法350点")
				elseif item.名称=="大乱炖" then
					self.道具文本:添加文本("【功效】：神器的各种仙家食材制作而成，可食用于非神兽类召唤兽，重置召唤兽种类。")
				end
			end
			if item.名称=="草果" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("治疗伤势10点")
				self.道具文本:添加文本("#Y/恢复伤势10, 等级:1")
			elseif item.名称=="山药" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血40点，治疗伤势10点")
				self.道具文本:添加文本("#Y/恢复气血40，恢复伤势10, 等级:1")
			elseif item.名称=="九香虫" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("治疗伤势15点")
				self.道具文本:添加文本("#Y/恢复伤势15, 等级:1")
			elseif item.名称=="八角莲叶" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血60点，治疗伤势15点")
				self.道具文本:添加文本("#Y/恢复气血60，恢复伤势15, 等级:1")
			elseif item.名称=="人参" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血80点，治疗伤势20点")
				self.道具文本:添加文本("#Y/恢复气血80，恢复伤势20, 等级:1")
			elseif item.名称=="四叶花" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血40点")
				self.道具文本:添加文本("#Y/恢复气血40, 等级:1")
			elseif item.名称=="天青地白"  then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血80点")
				self.道具文本:添加文本("#Y/恢复气血80, 等级:1")
			elseif item.名称=="七叶莲"  then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血60点")
				self.道具文本:添加文本("#Y/恢复气血60, 等级:1")
			elseif item.名称=="丁香水" or item.名称=="月星子" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复魔法75点")
				self.道具文本:添加文本("#Y/恢复魔法75, 等级:2")
			elseif item.名称=="仙狐涎" or item.名称=="地狱灵芝" or item.名称=="麝香" or item.名称=="血珊瑚" or item.名称=="餐风饮露" or item.名称=="白露为霜"   then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复魔法100点")
				self.道具文本:添加文本("#Y/恢复魔法100, 等级:2")
			elseif item.名称=="天龙水" or item.名称=="孔雀红"    then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复魔法150点")
				self.道具文本:添加文本("#Y/恢复魔法150, 等级:2")
			elseif item.名称=="紫丹罗" or item.名称=="佛手" or item.名称=="旋复花"   then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复魔法20点")
				self.道具文本:添加文本("#Y/恢复魔法20, 等级:1")
			elseif item.名称=="龙须草" or item.名称=="百色花" or item.名称=="香叶"   then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复魔法30点")
				self.道具文本:添加文本("#Y/恢复魔法30, 等级:1")
			elseif item.名称=="白玉骨头" or item.名称=="鬼切草" or item.名称=="灵脂"   then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气魔法40点")
				self.道具文本:添加文本("#Y/恢复魔法40, 等级:1")
			elseif item.名称=="曼陀罗花"   then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复魔法50点")
				self.道具文本:添加文本("#Y/恢复魔法50, 等级:1")
			elseif item.名称=="天不老" or item.名称=="紫石英" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血100点")
				self.道具文本:添加文本("#Y/恢复气血100, 等级:2")
			elseif item.名称=="血色茶花" or item.名称=="鹿茸" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血150点")
				self.道具文本:添加文本("#Y/恢复气血150, 等级:2")
			elseif item.名称=="六道轮回" or item.名称=="熊胆" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血200点")
				self.道具文本:添加文本("#Y/恢复气血200, 等级:2")
			elseif item.名称=="凤凰尾" or item.名称=="硫磺草" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血250点")
				self.道具文本:添加文本("#Y/恢复气血250, 等级:2")
			elseif item.名称=="龙之心屑" or item.名称=="火凤之睛" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血300点")
				self.道具文本:添加文本("#Y/恢复气血300, 等级:2")
			elseif item.名称=="金创药" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血400点")
				self.道具文本:添加文本("#Y/恢复气血400,等级：3")
			elseif item.名称=="金香玉" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血=品质*20+100")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*20+100).."，等级: 3")
				end
			elseif item.名称=="小还丹" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血=品质*15+100")
				self.道具文本:添加文本("治疗伤势=品质+500")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*15+100).."  治疗伤势="..(item.阶品+500).."，等级: 3")
				end
			elseif item.名称=="千年保心丹" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复气血=品质*10+200")
				self.道具文本:添加文本("治疗伤势=品质*8+100")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*10+200).."  治疗伤势="..(item.阶品*8+100).."，等级: 3")
				end
			elseif item.名称=="风水混元丹" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复魔法=品质*13+50")
				self.道具文本:添加文本("恢复灵力=品质*0.3")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复魔法="..(item.阶品*13+50).."，等级: 3")
				end
			elseif item.名称=="定神香" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("解除奇经八脉技能产生的异常状态，恢复魔法=品质*15+50")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复魔法="..(item.阶品*15+50).."，等级: 3")
				end
			elseif item.名称=="蛇蝎美人" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复魔法=品质*15+100")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复魔法="..(item.阶品*15+100).."，等级: 3")
				end
			elseif item.名称=="九转回魂丹" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("复活、恢复气血=品质*10+200")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*10+200).."，等级: 3")
				end
			elseif item.名称=="佛光舍利子" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("复活、恢复气血=品质*10")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*10).."，等级: 3")
				end
			elseif item.名称=="五龙丹" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("解除封类异常状态")
				self.道具文本:添加文本("恢复气血=品质*9")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*9).."，等级: 3")
				end
			elseif item.名称=="十香返生丸" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("解除酒类异常状态")
				self.道具文本:添加文本("恢复魔法=品质*13+50")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复魔法="..(item.阶品*13+50).."，等级: 3")
				end
			elseif item.名称=="紫心玉露丸" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("持续恢复目标当前气血当前回合与下一回合开始时恢复效果为品质*6.5+200")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*6.5+200).."，等级: 3")
				end
			elseif item.名称=="回春龙沙散" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("解除常规异常效果使用时恢复目标气血上限=品质*10+100")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血上限="..(item.阶品*10+100).."，等级: 3")
				end
			elseif item.名称=="生骨续命膏" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("复活、恢复目标当前气血=品质*3+50,气血上限变为品质3+50(不超过上限)。临时提高目标品质*1点物理防御与法术防御,持续回合,效果不回叠加。")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*3+50).."，恢复气血上限="..(item.阶品*3+50).."，物理防御="..(item.阶品*1).."，法术防御="..(item.阶品*1).."，等级: 3")
				end
			elseif item.名称=="百炼金乌丸" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("恢复目标气血=品质*5+100同时分别为本方其他所有成员(包括召唤兽)恢复当前气血=品质*2+50")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血="..(item.阶品*5+100).."，所有成员恢复气血="..(item.阶品*2+50).."，等级: 3")
				end
			elseif item.名称=="金石返魂丹" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("解除常规异常效果使用时恢复目标气血上限=品质*10+100")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复气血上限="..(item.阶品*10+100).."，等级: 3")
				end
			elseif item.名称=="黑玉云苓膏" then
				self.道具文本:添加文本("【功效】")
				self.道具文本:添加文本("从当前回合开始持续三回合恢复目标魔法值与流失的速度。每回合恢复魔法=品质*1.5+100每回合恢复速度=品质*0.1")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品.."，恢复魔法="..(item.阶品*1.5+100).."，恢复速度="..(item.阶品*0.1).."，等级: 3")
				end
			elseif item.名称=="醉仙果" then
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品)
				end
			elseif item.名称=="七珍丸" then
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复魔法"..(item.阶品*3+50)..",等级:3")
				end
			elseif item.名称=="凝气丸" then
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复魔法"..(item.阶品*5+100)..",等级:3")
				end
			elseif item.名称=="舒筋活络丸" then
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血"..(item.阶品*5+100)..",等级:3")
				end
			elseif item.名称=="九转续命丹" then
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血"..(item.阶品*5+100)..",治疗伤势"..(item.阶品*5+100)..",等级:3")
				end
			elseif item.名称=="十全大补丸" then
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血"..(item.阶品*4+200)..",治疗伤势"..(item.阶品*4+100)..",等级:3")
				end
			elseif item.名称=="固本培元丹" then
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质 "..item.阶品..",恢复气血"..(item.阶品*12+150)..",等级:3")
				end
			end
	      if item.附加技能 then
			  	self.道具文本:添加文本("#S/特性： "..item.附加技能)
			  end

		elseif item.分类 == 11 then --月华露
			if item.名称=="月华露" then
				gs=gs..zf.."#W/【功效】增加召唤兽经验=品质*2*服用召唤兽等级"
				self.道具文本:添加文本(gs)
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质:"..item.阶品)
				end
			elseif item.名称=="九转金丹" then
				self.道具文本:添加文本("【功效】增加人物修炼经验=品质*0.5")
				if item.阶品 then
				self.道具文本:添加文本("#Y/品质:"..item.阶品)
				end
			elseif item.名称=="修炼果" then
				self.道具文本:添加文本("【功能】提高某种修炼经验，经验达到要求后可提高修炼等级，从而控制召唤兽发挥出更强的潜力。")
				end
			-- elseif item.子类 == 4 then
			elseif item.分类 == 10 and item.子类 == 2 then
				if item.阶品 then
				self.道具文本:添加文本("【效果】"..item.阶品)
				end
			else
				if qgx.功效 ~= nil then
				gs = gs..qgx.功效
				end
				self.道具文本:添加文本(zf.."【功效】"..gs)
			end
	elseif zls == 2 and item.灵饰 then
		if item.鉴定 then
			self.道具文本:添加文本("【装备条件】等级"..item.级别限制)
			self.道具文本:添加文本("【灵饰类型】"..item.部位类型)
			self.道具文本:添加文本("#Y/等级 "..item.级别限制)
			self.道具文本:添加文本("#Y/"..item.幻化属性.基础.类型.." +"..item.幻化属性.基础.数值)
			if item.修理失败 ~= nil then
				self.道具文本:添加文本("#Y/耐久度 "..到整数((item.耐久 or 500)).."   修理失败 " ..item.修理失败.."次")
			else
				self.道具文本:添加文本("#Y/耐久度 "..到整数(item.耐久 or 500))
			end
			if item.特效 ~= nil then
				self.道具文本:添加文本(format("#S/特效：%s",item.特效))
			end
			if item.幻化等级>0 then   self.道具文本:添加文本("#Y/精炼等级 "..item.幻化等级) end
			for n=1,#item.幻化属性.附加 do
				if item.幻化等级==0 then
					self.道具文本:添加文本("#G/"..item.幻化属性.附加[n].类型.." +"..item.幻化属性.附加[n].数值)
				else
					self.道具文本:添加文本("#G/"..item.幻化属性.附加[n].类型.." +"..item.幻化属性.附加[n].数值.." #F/[+"..item.幻化属性.附加[n].强化.."]")
				end
			end
			if item.特性 then
				self.道具文本:添加文本(string.format("#S/特效：%s(%d级)", item.特性.技能, item.特性.等级))
				local tempdata = PropertyData[item.特性.技能][item.部位类型]

				if tempdata.status == 1 then
					self.道具文本:添加文本(string.format("#S/%s +%d", tempdata.pro, item.特性.等级 * tempdata.rate))
				else
					self.道具文本:添加文本(string.format("#S/" .. tempdata.pro, item.特性.等级 * tempdata.rate))
				end
				local 颜色 = item.特性.套装 and "#S/" or "#gray/"
				local 等级 = item.特性.套装 and item.特性.套装 or 1
				local 尾部 = item.特性.套装 and "#S/(已生效)" or "#gray/(未生效)"
				-- self.道具文本:添加文本("#S/" .. "【套装效果】")
		   --self.道具文本:添加文本(string.format(颜色 .. PropertyData[item.特性.技能].套装.pro .. 尾部,PropertyData[item.特性.技能]["套装" .. 等级]))
			end
			if item.制造者~=nil then
				self.道具文本:添加文本("制造者："..item.制造者)
			end
			if item.专用 ~= nil then
				self.道具文本:添加文本(format("#Y/玩家%s专用",item.专用))
			end
		else
			self.道具文本:添加文本("【装备条件】等级"..item.级别限制)
			self.道具文本:添加文本("【灵饰类型】"..item.部位类型)
			self.道具文本:添加文本("#Y/等级 "..item.级别限制)
			if item.制造者 ~= nil then
				self.道具文本:添加文本(format("#W/制造者：%s",item.制造者))
			end
			if jd == nil  then
				self.道具文本:添加文本("#Y/未鉴定物品")
			end
		end

	elseif zls == 2 and item.召唤兽装备 then
		self.道具文本:添加文本("#W/【装备对象】召唤兽")
		self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
		self.道具文本:添加文本("#Y/等级 "..item.级别限制)

		local 气血 = item.气血
		local 魔法 = item.魔法
		local 命中 = item.命中
		local 伤害 = item.伤害
		local 防御 = item.防御
		local 速度 = item.速度
		local sx = ""
		local fh = "+"
		if 命中 ~= 0  and 命中 ~= nil  then
			sx = sx.."命中率 +"..命中.."%".."  "
		end
		if 防御 ~= 0 and 防御 ~= nil  then
			sx = sx.."防御 +"..防御.." "
		end
		if 速度 ~= 0 and 速度 ~= nil  then
			sx = sx.."速度 +"..速度.." "
		end
		if 伤害 ~= 0 and 伤害 ~= nil    then
			if 伤害<0 then
				fh = ""
			end
			sx = sx.."伤害 "..fh..伤害 .." "
		end
		fh = "+"
		if 气血 ~= 0 and 气血 ~= nil then
			if 气血<0 then
				fh = ""
			end
			sx = sx.."气血 "..fh..气血.." "
		end
		fh = "+"
		if 魔法 ~= 0 and 魔法 ~= nil  then
			if 魔法<0 then
				fh = ""
			end
			sx = sx.."魔法 "..fh..魔法.." "
		end

		if sx ~= "" then
			self.道具文本:添加文本("#Y/"..sx)
		end
		if item.修理失败 ~= nil then
			self.道具文本:添加文本("#Y/耐久度 "..到整数((item.耐久 or 500)).."   修理失败 " ..item.修理失败.."次")
		else
			self.道具文本:添加文本("#Y/耐久度 "..到整数((item.耐久 or 500)))
		end

		local fj = ""
		local 体质 = item.体质
		local 力量 = item.力量
		local 耐力 = item.耐力
		local 魔力 = item.魔力
		local 敏捷 = item.敏捷
		fh = "+"
		if 体质 ~= 0 and 体质 ~= nil    then
			if 体质<0 then
				fh = ""
			end
			fj = fj.."体质 "..fh..体质 .." "
		end
		fh = "+"
		if 力量 ~= 0 and 力量 ~= nil  then
			if 力量<0 then
				fh = ""
			end
			fj = fj.."力量 "..fh..力量.." "
		end
		fh = "+"
		if 耐力 ~= 0 and 耐力 ~= nil  then
			if 耐力<0 then
				fh = ""
			end
			fj = fj.."耐力 "..fh..耐力.." "
		end
		fh = "+"
		if 魔力 ~= 0 and 魔力 ~= nil then
			if 魔力<0 then
				fh = ""
			end
			fj = fj.."魔力 "..fh..魔力.." "
		end
		fh = "+"
		if 敏捷 ~= 0 and 敏捷 ~= nil  then
			if 敏捷<0 then
				fh = ""
			end
			fj = fj.."敏捷 "..fh..敏捷.." "
		end
		if fj ~= "" then
			self.道具文本:添加文本("#G/"..fj)
		end
		if item.套装效果 ~= nil then
			self.道具文本:添加文本(format("#S/套装效果：%s",item.套装效果[1]..item.套装效果[2]))
		end
		if item.制造者 ~= nil then
			self.道具文本:添加文本(format("#W/制造者：%s",item.制造者))
		end
		if item.精魄~=nil and item.精魄等级~=nil then
			local num = 0
			if item.精魄=="躲避" then
				num=20*item.精魄等级
			elseif item.精魄=="速度" then
				num=6*item.精魄等级
			elseif item.精魄=="伤害" then
				num=10*item.精魄等级
			elseif item.精魄=="灵力" then
				num=4*item.精魄等级
			elseif item.精魄=="防御" then
				num=8*item.精魄等级
			elseif item.精魄=="气血" then
				num=30*item.精魄等级
			end
			if item.精魄等级>0 then
				self.道具文本:添加文本("#Y/镶嵌效果")
				self.道具文本:添加文本("#Y/+"..num..item.精魄.." 镶嵌等级: "..item.精魄等级)
			end
		end

	-- elseif zls == 2 and item.灵饰==nil and item.召唤兽装备==nil and item.分类<=14 then -- 人物装备
	-- 	self.道具文本1:清空()
	-- 	self.道具文本1:添加文本("")
	-- 	self.道具文本1:添加文本(item.介绍)
	-- 	self.道具文本2:清空()
	-- 	self.道具文本2:添加文本("")
	-- 	--self.道具文本2:添加文本(item.介绍)
	-- 	self.道具文本3:清空()
	-- 	self.道具文本3:添加文本("")
	-- 	--self.道具文本3:添加文本(item.介绍)
	-- 	if  item.鉴定 then
	-- 		if item.子类 == 911 then
	-- 		  self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
	-- 			self.道具文本1:添加文本("#W/【装备条件】等级"..item.级别限制)
	-- 			local 限制文本 = ''
	-- 			local isFirst = true
	-- 			for k,v in pairs(item.角色限制) do
	-- 				if isFirst then
	-- 		      限制文本 = 限制文本 .. v
	-- 		      isFirst = false
	-- 		    else
	-- 		      限制文本 = 限制文本 .. '、' .. v
	-- 		    end
	-- 			end
	-- 			self.道具文本:添加文本("#W/【装备角色】"..限制文本)
	-- 			self.道具文本1:添加文本("#W/【装备角色】"..限制文本)
	-- 		elseif item.分类 == 3 then
	-- 			self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
	-- 			self.道具文本1:添加文本("#W/【装备条件】等级"..item.级别限制)
	-- 			if item.角色限制[3] == nil and item.角色限制[2] ~= nil  then
	-- 				self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2])
	-- 				self.道具文本1:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2])
	-- 			elseif item.角色限制[2] == nil then
	-- 				self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1])
	-- 				self.道具文本1:添加文本("#W/【装备角色】"..item.角色限制[1])
	-- 			else
	-- 				self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2].."、"..item.角色限制[3])
	-- 				self.道具文本1:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2].."、"..item.角色限制[3])
	-- 			end
	-- 		elseif item.分类 == 1 or item.分类 == 4 then
	-- 			self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
	-- 			self.道具文本1:添加文本("#W/【装备条件】等级"..item.级别限制)
	    -- if item.性别限制 then
	-- 			self.道具文本:添加文本("#W/【装备角色】"..item.性别限制)
	-- 			self.道具文本1:添加文本("#W/【装备角色】"..item.性别限制)
	-- 		elseif item.分类 >= 10 then
	-- 			self.道具文本:添加文本("#W/【装备等级】"..item.级别限制)
	-- 			self.道具文本1:添加文本("#W/【装备等级】"..item.级别限制)
	-- 		else
	-- 			self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
	-- 			self.道具文本1:添加文本("#W/【装备条件】等级"..item.级别限制)
	-- 			self.道具文本:添加文本("#W/【装备角色】无")
	-- 			self.道具文本1:添加文本("#W/【装备角色】无")
	-- 		end
	-- 		zbwbgd = self.道具文本.显示表.高度+30
	-- 		self.道具文本:添加文本("#Y/等级 "..item.级别限制.." 五行 "..item.五行)
	-- 		self.道具文本2:添加文本("#Y/等级 "..item.级别限制.." 五行 "..item.五行)
	-- 		local sx = ""
	-- 		local 气血 = item.气血
	-- 		local 魔法 = item.魔法
	-- 		local 命中 = item.命中
	-- 		local 伤害 = item.伤害
	-- 		local 防御 = item.防御
	-- 		local 速度 = item.速度
	-- 		local 躲避 = item.躲避
	-- 		local 灵力 = item.灵力
	-- 		local 体质 = item.体质
	-- 		local 魔力 = item.魔力
	-- 		local 力量 = item.力量
	-- 		local 耐力 = item.耐力
	-- 		local 敏捷 = item.敏捷
elseif zls == 2 and item.灵饰==nil and item.召唤兽装备==nil and (item.分类<=14 or item.分类==30) then -- 人物装备
		--print(item.鉴定,66)
		self.道具文本1:清空()
		self.道具文本1:添加文本("")
		self.道具文本1:添加文本(item.介绍)
		self.道具文本2:清空()
		self.道具文本2:添加文本("")
		--self.道具文本2:添加文本(item.介绍)
		self.道具文本3:清空()
		self.道具文本3:添加文本("")
		--self.道具文本3:添加文本(item.介绍)
		if  item.鉴定 then
			-- table.print(item)
			if item.分类 == 3 then
				self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
				self.道具文本1:添加文本("#W/【装备条件】等级"..item.级别限制)
				if item.角色限制[3] == nil and item.角色限制[2] ~= nil  then
					self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2])
					self.道具文本1:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2])
				elseif item.角色限制[2] == nil then
					self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1])
					self.道具文本1:添加文本("#W/【装备角色】"..item.角色限制[1])
				else
					self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2].."、"..item.角色限制[3])
					self.道具文本1:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2].."、"..item.角色限制[3])
				end
			elseif item.分类 == 1 or item.分类 == 4 then

				self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
				self.道具文本1:添加文本("#W/【装备条件】等级"..item.级别限制)
				if item.性别限制 then
					self.道具文本:添加文本("#W/【装备角色】"..item.性别限制)
					self.道具文本1:添加文本("#W/【装备角色】"..item.性别限制)
				end
			elseif item.分类 > 6 and  item.分类 < 10 then
				self.道具文本:添加文本("#W/【角色限制】召唤兽")
				self.道具文本1:添加文本("#W/【角色限制】召唤兽")
			elseif item.分类 >= 10 then
				self.道具文本:添加文本("#W/【装备等级】"..item.级别限制)
				self.道具文本1:添加文本("#W/【装备等级】"..item.级别限制)
			else
				self.道具文本:添加文本("#W/【装备条件】等级"..item.级别限制)
				self.道具文本1:添加文本("#W/【装备条件】等级"..item.级别限制)
				self.道具文本:添加文本("#W/【装备角色】无")
				self.道具文本1:添加文本("#W/【装备角色】无")
			end
			zbwbgd = self.道具文本.显示表.高度+30
			self.道具文本:添加文本("#Y/等级 "..item.级别限制.." 五行 "..item.五行)
			self.道具文本2:添加文本("#Y/等级 "..item.级别限制.." 五行 "..item.五行)
			local sx = ""
			local 气血 = item.气血
			local 魔法 = item.魔法
			local 命中 = item.命中
			local 伤害 = item.伤害
			local 防御 = item.防御
			local 速度 = item.速度
			local 躲避 = item.躲避
			local 灵力 = item.灵力
			local 体质 = item.体质
			local 魔力 = item.魔力
			local 力量 = item.力量
			local 耐力 = item.耐力
			local 敏捷 = item.敏捷
				--do
			if  item.宝石属性 ~= nil then
				if (item.宝石属性.气血 ~= nil and item.分类~=4) or (气血 ~= 0 and 气血 ~= nil and item.分类~=4) then
					sx = sx.."气血 +"..(气血 or 0)+(item.宝石属性.气血 or 0).." "
				end
				if (item.宝石属性.魔法 ~= nil )  or (魔法 ~= 0 and 魔法 ~= nil ) then
					sx = sx.."魔法 +"..(魔法 or 0)+(item.宝石属性.魔法 or 0).." "
				end
				if(item.宝石属性.命中 ~= nil and item.分类 ~=1) or (命中 ~= 0  and 命中 ~= nil and item.分类 ~=1) then
					sx = sx.."命中 +"..(命中 or 0)+(item.宝石属性.命中 or 0).." "
				end
				if (item.宝石属性.伤害 ~= nil  and item.分类 ~=1)  or (伤害 ~= 0 and 伤害 ~= nil  and item.分类 ~=1) then
					sx = sx.."伤害 +"..(伤害 or 0)+(item.宝石属性.伤害 or 0) .." "
				end
				if (item.宝石属性.防御 ~= nil) or (防御 ~= 0 and 防御 ~= nil )  then
					sx = sx.."防御 +"..(防御 or 0)+(item.宝石属性.防御 or 0).." "
				end
				if (item.宝石属性.灵力 ~= nil  and item.分类 ~= 4) or (灵力 ~= 0 and 灵力 ~= nil  and item.分类 ~= 4 ) then
					sx = sx.."灵力 +"..(灵力 or 0)+(item.宝石属性.灵力 or 0).." "
				end
				if (item.宝石属性.敏捷~=nil and item.分类 == 6 ) or (敏捷 ~= 0 and 敏捷~=nil and item.分类 == 6) then
					sx = sx.."敏捷 +"..(敏捷 or 0)+(item.宝石属性.敏捷 or 0).." "
				end
			else
				if 气血 ~= 0 and 气血 ~= nil and item.分类~=4 then
					sx = sx.."气血 +"..气血.." "
				end
				if 魔法 ~= 0 and 魔法 ~= nil  then
					sx = sx.."魔法 +"..魔法.." "
				end
				if 命中 ~= 0  and 命中 ~= nil and item.分类 ~=1 then
					sx = sx.."命中 +"..命中.." "
				end
				if 伤害 ~= 0 and 伤害 ~= nil  and item.分类 ~=1  then
					sx = sx.."伤害 +"..伤害 .." "
				end
				if 防御 ~= 0 and 防御 ~= nil  then
					sx = sx.."防御 +"..防御.." "
				end
				if 灵力 ~= 0 and 灵力 ~= nil  and item.分类 ~= 4 then
					sx = sx.."灵力 +"..灵力.." "
				end
				if 敏捷 ~= 0 and 敏捷~=nil and item.分类 == 6  then
					sx = sx.."敏捷 +"..敏捷.." "
				end
			end
			if sx ~= "" then
				self.道具文本:添加文本("#Y/"..sx)
				self.道具文本2:添加文本("#Y/"..sx)
			end
			if item.修理失败 ~= nil then
				self.道具文本:添加文本("#Y/耐久度 "..到整数((item.耐久 or 500)).."   修理失败 " ..item.修理失败.."次")
				self.道具文本2:添加文本("#Y/耐久度 "..到整数((item.耐久 or 500)).."   修理失败 " ..item.修理失败.."次")
			else
				self.道具文本:添加文本("#Y/耐久度 "..到整数((item.耐久 or 500)))
				self.道具文本2:添加文本("#Y/耐久度 "..到整数((item.耐久 or 500)))
			end
			if item.锻炼等级 ~= nil then
				local bsz = ""
				for i=1,#item.镶嵌宝石 do
					local sw = "、"
					if i == #item.镶嵌宝石 then
						sw = ""
					end
					bsz = bsz..item.镶嵌宝石[i]..sw
				end
				self.道具文本:添加文本(format("#Y/锻炼等级 %s  镶嵌宝石 %s",item.锻炼等级,bsz))
				self.道具文本2:添加文本(format("#Y/锻炼等级 %s  镶嵌宝石 %s",item.锻炼等级,bsz))
				if item.分类==1 then
					sx=""
					if item.宝石属性.命中 ~= nil and item.宝石属性.命中 ~= 0 then
						sx = sx.."命中 +"..item.宝石属性.命中.." "
					end
					if item.宝石属性.伤害 ~= nil and item.宝石属性.伤害 ~= 0 then
						sx = sx.."伤害 +"..item.宝石属性.伤害.." "
					end
					if sx ~= "" then
						self.道具文本:添加文本("#G/"..sx)
						self.道具文本2:添加文本("#G/"..sx)
					end
				elseif item.分类==3  then
					sx=""
					if item.宝石属性.躲避 ~= nil and item.宝石属性.躲避 ~= 0 then
						sx = sx.."躲避 +"..item.宝石属性.躲避.." "
					end
					if sx ~= "" then
						self.道具文本:添加文本("#G/"..sx)
						self.道具文本2:添加文本("#G/"..sx)
					end
				elseif item.分类==4 then
					sx=""
					if item.宝石属性.气血 ~= nil and item.宝石属性.气血 ~= 0 then
						sx = sx.."气血 +"..item.宝石属性.气血.." "
					end
					if item.宝石属性.灵力 ~= nil and item.宝石属性.灵力 ~= 0 then
						sx = sx.."灵力 +"..item.宝石属性.灵力.." "
					end
					if sx ~= "" then
						self.道具文本:添加文本("#G/"..sx)
						self.道具文本2:添加文本("#G/"..sx)
					end
				elseif item.分类==5 or item.分类==6 then
					sx=""
					if item.宝石属性.躲避 ~= nil and item.宝石属性.躲避 ~= 0 then
						sx = sx.."躲避 +"..item.宝石属性.躲避.." "
					end
					if item.宝石属性.速度 ~= nil and item.宝石属性.速度 ~= 0 then
						sx = sx.."速度 +"..item.宝石属性.速度.." "
					end
					if sx ~= "" then
						self.道具文本:添加文本("#G/"..sx)
						self.道具文本2:添加文本("#G/"..sx)
					end
				end
			end
			local ds = ""
			local lsb = {"体质","魔力","力量","耐力","敏捷"}
			for i=1,#lsb do
				if item[lsb[i]] ~= nil and item[lsb[i]] ~= 0 then
					if  item[lsb[i]] < 0 then
						ds = ds..lsb[i].." "..item[lsb[i]] .." "
					else
						ds = ds..lsb[i].." +"..item[lsb[i]] .." "
					end
				end
			end
			if ds ~= "" and item.分类~=6 then
				self.道具文本:添加文本("#G/"..ds)
				self.道具文本2:添加文本("#G/"..ds)
			end
			if item.临时附魔 ~= nil then
				local 临时表 = {"气血","魔法","命中","伤害","体质","魔力","耐力","防御","速度","灵力","愤怒","力量","气血回复效果","法伤结果","法术防御","法术伤害","物伤结果"}
				for i=1,#临时表 do
					if item.临时附魔[临时表[i]] ~= nil then
						if 临时表[i]=="气血回复效果" then
							self.道具文本:添加文本(format("#G/临时气血回复".." %s %s",item.临时附魔[临时表[i]].数值 ,os.date("%m/%d %H:%M",item.临时附魔[临时表[i]].时间)))
							self.道具文本2:添加文本(format("#G/临时气血回复".." %s %s",item.临时附魔[临时表[i]].数值 ,os.date("%m/%d %H:%M",item.临时附魔[临时表[i]].时间)))
						else
							self.道具文本:添加文本(format("#G/临时"..临时表[i].." %s %s",item.临时附魔[临时表[i]].数值 ,os.date("%m/%d %H:%M",item.临时附魔[临时表[i]].时间)))
							self.道具文本2:添加文本(format("#G/临时"..临时表[i].." %s %s",item.临时附魔[临时表[i]].数值 ,os.date("%m/%d %H:%M",item.临时附魔[临时表[i]].时间)))
						end
					end
				end
			end
			if item.特技 ~= nil then
				self.道具文本:添加文本(format("#S/特技：%s",item.特技))
				self.道具文本2:添加文本(format("#S/特技：%s",item.特技))
			end
			if item.特效 ~= nil and item.特效[1] then
				self.道具文本:添加文本(format("#S/特效：%s %s %s",item.特效[1],item.特效[2]  or "" ,item.特效[3] or ""))
				self.道具文本2:添加文本(format("#S/特效：%s %s %s",item.特效[1],item.特效[2]  or "" ,item.特效[3] or ""))
			end
			if item.套装效果 ~= nil then
				self.道具文本:添加文本(format("#S/套装效果：%s",item.套装效果[1]..item.套装效果[2]))
				self.道具文本2:添加文本(format("#S/套装效果：%s",item.套装效果[1]..item.套装效果[2]))
			end
			if item.光武拓印 ~= nil then
				self.道具文本:添加文本("#S/光武拓印原造型："..item.光武拓印.原名称)
				self.道具文本2:添加文本("#S/光武拓印原造型："..item.光武拓印.原名称)
				self.道具文本:添加文本("#Y/玩家"..item.光武拓印.id.."专用")
				self.道具文本2:添加文本("#Y/玩家"..item.光武拓印.id.."专用")
			else
				if item.专用 ~= nil then
					-- self.道具文本:添加文本(format("#Y/玩家%s专用",item.专用))
					self.道具文本2:添加文本(format("#Y/玩家%s专用",item.专用))
				end
			end

			if item.新特效 ~= nil and item.新特效数值 ~= nil then
				if item.新特效数值+0>=6 then
					self.道具文本:添加文本(format("#S/%s +%s",item.新特效,item.新特效数值))
					self.道具文本2:添加文本(format("#S/%s +%s",item.新特效,item.新特效数值))
				else
					self.道具文本:添加文本(format("#S/%s +%s％",item.新特效,item.新特效数值))
					self.道具文本2:添加文本(format("#S/%s +%s％",item.新特效,item.新特效数值))
				end
			end
			if item.开运孔数~=nil and item.开运孔数.当前~=0 then
				self.道具文本:添加文本(format("#G/开运孔数： %s",item.开运孔数.当前.."孔/"..item.开运孔数.上限.."孔"))
				self.道具文本3:添加文本(format("#G/开运孔数： %s",item.开运孔数.当前.."孔/"..item.开运孔数.上限.."孔"))
			end
			if item.星位~=nil then
				-- table.print(item.星位)
				for n=1,5 do
					if item.星位[n]~=nil then--and item.星位[n].符石属性 then
						local  组合语句="#G符石："
						for k,v in pairs(item.星位[n].符石属性) do
							组合语句=组合语句..k.." +"..v.." "
						end
						self.道具文本:添加文本(组合语句)
						self.道具文本3:添加文本(组合语句)
					end
				end
			end
			if item.星位组~=nil then
				if item.星位~=nil and item.星位[6] ~= nil then
					local 临时属性 = ""
					for k,v in pairs(item.星位[6].符石属性) do
						临时属性 = k.." +"..v
					end
					self.道具文本:添加文本("#G/星位："..临时属性)
					self.道具文本3:添加文本("#G/星位："..临时属性)
					if item.星位[6].相互~=nil then
						local 临时属性 = ""
						for k,v in pairs(item.星位[6].相互) do
							临时属性 = k.." +"..v
						end
						self.道具文本:添加文本("#G/星相互合："..临时属性)
						self.道具文本3:添加文本("#G/星相互合："..临时属性)
					end
				else
					self.道具文本:添加文本("#G/星位：已开")
					self.道具文本3:添加文本("#G/星位：已开")
				end
			end
			if item.星位~=nil and item.星位.组合~=nil then
				self.道具文本:添加文本(format("#F/符石组合： %s",item.星位.组合))
				self.道具文本:添加文本(format("#F/门派条件： %s",item.星位.门派 or "无"))
				self.道具文本:添加文本(format("#F/部位条件： %s",取符石部位(item.星位.部位)))
				self.道具文本:添加文本(format("#F/%s",取符石组合说明(item.星位.组合,item.星位.组合等级)))
				self.道具文本3:添加文本(format("#F/符石组合： %s",item.星位.组合))
				self.道具文本3:添加文本(format("#F/门派条件： %s",item.星位.门派 or "无"))
				self.道具文本3:添加文本(format("#F/部位条件： %s",取符石部位(item.星位.部位)))
				self.道具文本3:添加文本(format("#F/%s",取符石组合说明(item.星位.组合,item.星位.组合等级)))
			end
			if item.特殊属性 ~= nil then
				self.道具文本:添加文本("#F/"..item.特殊属性.类型.." +"..item.特殊属性.属性)
				self.道具文本2:添加文本("#F/"..item.特殊属性.类型.." +"..item.特殊属性.属性)
			end
			if item.制造者 ~= nil then
				self.道具文本:添加文本(format("#W/制造者：%s",item.制造者))
				self.道具文本2:添加文本(format("#W/制造者：%s",item.制造者))
			end
			if item.装备比赛 ~= nil and  item.装备比赛.开启   then
			self.道具文本:添加文本("#R/┏━━━━━━━━┓")
			self.道具文本:添加文本(format("    #G/神兵打造比试"))
			self.道具文本:添加文本(format("  #G/参与者id：%s",item.装备比赛.参与id))
			self.道具文本:添加文本(format("  #G/制造日期：%s",item.装备比赛.日期))
			self.道具文本:添加文本("#R/┗━━━━━━━━┛")
			end
			if item.铸兵 ~= nil then
				self.道具文本:添加文本("#S/铸兵原始造型："..item.铸兵)
				self.道具文本2:添加文本("#S/铸兵原始造型："..item.铸兵)
			end
		if item.上古残符 ~= nil then
				self.道具文本:添加文本("#Y/┏━━━━━━━━━━━┓")
				self.道具文本2:添加文本("#Y/┏━━━━━━━━━━━┓")
				if  item.分类 == 3 or  item.分类 == 30  then
				local 额外数值=0
				if item.五行~=nil and item.五行==item.上古残符.五行 then
					额外数值=math.floor(item.上古残符.数值*0.5)
				end
				self.道具文本:添加文本("     #F/伤害 + "..item.上古残符.数值)
				self.道具文本2:添加文本("     #F/伤害 + "..item.上古残符.数值)
				if 额外数值>=10 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				elseif  额外数值>=100 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				else
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				end
				self.道具文本:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				self.道具文本2:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				elseif  item.分类 == 1 then
				local 额外数值=0
				if item.五行~=nil and item.五行==item.上古残符.五行 then
					额外数值=math.floor(item.上古残符.数值*0.5)
				end
				self.道具文本:添加文本("     #F/法防 + "..item.上古残符.数值)
				self.道具文本2:添加文本("     #F/法防 + "..item.上古残符.数值)
				if 额外数值>=10 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				elseif  额外数值>=100 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				else
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				end
				self.道具文本:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				self.道具文本2:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				elseif  item.分类 == 2 then
				local 额外数值=0
				if item.五行~=nil and item.五行==item.上古残符.五行 then
					额外数值=math.floor(item.上古残符.数值*0.5)
				end
				self.道具文本:添加文本("     #F/法伤 + "..item.上古残符.数值)
				self.道具文本2:添加文本("     #F/法伤 + "..item.上古残符.数值)
				if 额外数值>=10 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				elseif  额外数值>=100 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				else
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				end
				self.道具文本:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				self.道具文本2:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				elseif  item.分类 == 4 then
				local 额外数值=0
				if item.五行~=nil and item.五行==item.上古残符.五行 then
					额外数值=math.floor(item.上古残符.数值*0.5)
				end
				self.道具文本:添加文本("     #F/防御 + "..item.上古残符.数值)
				self.道具文本2:添加文本("     #F/防御 + "..item.上古残符.数值)
				if 额外数值>=10 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				elseif  额外数值>=100 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				else
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				end
				self.道具文本:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				self.道具文本2:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				elseif  item.分类 == 5 then
				local 额外数值=0
				if item.五行~=nil and item.五行==item.上古残符.五行 then
					额外数值=math.floor(item.上古残符.数值*0.5)
				end
				self.道具文本:添加文本("     #F/气血 + "..item.上古残符.数值)
				self.道具文本2:添加文本("     #F/气血 + "..item.上古残符.数值)
				if 额外数值>=10 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				elseif  额外数值>=100 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				else
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				end
				self.道具文本:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				self.道具文本2:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				elseif  item.分类 == 6 then
				local 额外数值=0
				if item.五行~=nil and item.五行==item.上古残符.五行 then
					额外数值=math.floor(item.上古残符.数值*0.5)
				end
				self.道具文本:添加文本("     #F/速度 + "..item.上古残符.数值)
				self.道具文本2:添加文本("     #F/速度 + "..item.上古残符.数值)
				if 额外数值>=10 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y      古")
				elseif  额外数值>=100 then
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y    古")
				else
				self.道具文本:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				self.道具文本2:添加文本("#Y上   #F/五行 #R"..item.上古残符.五行.."(+"..额外数值..") #Y       古")
				end
				self.道具文本:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				self.道具文本2:添加文本("     #F/剩余可洗次数："..(10-item.上古残符.次数))
				end
				self.道具文本:添加文本("#Y/┗━━━━━━━━━━━┛")
				self.道具文本2:添加文本("#Y/┗━━━━━━━━━━━┛")
			end

			if item.五行镶嵌 ~= nil then
				if item.五行镶嵌[1] then
				self.道具文本:添加文本("#R元素曜石："..item.五行镶嵌[1].属性.." + "..(item.五行镶嵌[1].数值/50).."%")
				self.道具文本2:添加文本("#R元素曜石："..item.五行镶嵌[1].属性.." + "..(item.五行镶嵌[1].数值/50).."%")
				end
				if item.五行镶嵌[2] then
				self.道具文本:添加文本("#R元素曜石："..item.五行镶嵌[2].属性.." + "..(item.五行镶嵌[2].数值/50).."%")
				self.道具文本2:添加文本("#R元素曜石："..item.五行镶嵌[2].属性.." + "..(item.五行镶嵌[2].数值/50).."%")
				end
			end
			if item.熔炼效果~=nil then
				local sx = ""
				local lsb = {"气血","魔法","防御","速度","灵力","体质","魔力","力量","耐力","敏捷"}
				for i=1,#lsb do
					if item.熔炼效果[lsb[i]] ~= nil and item.熔炼效果[lsb[i]]~=0 then
						if item.熔炼效果[lsb[i]] < 0 then
							sx = sx..lsb[i].." "..item.熔炼效果[lsb[i]].." "
						else
							sx = sx..lsb[i].." +"..item.熔炼效果[lsb[i]].." "
						end
					end
				end
				if sx ~= "" then
					self.道具文本:添加文本("#Y/熔炼效果：\n".." #Y/"..sx)
					self.道具文本2:添加文本("#Y/熔炼效果：\n".." #Y/"..sx)
				end
			end
		else
			self.道具文本:添加文本("【装备条件】等级"..item.级别限制)
			if item.分类 == 3 then
				if item.角色限制[2] == nil then
					self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1])
				else
					self.道具文本:添加文本("#W/【装备角色】"..item.角色限制[1].."、"..item.角色限制[2])
				end
			elseif item.分类 == 1 or item.分类 == 4 then
				self.道具文本:添加文本("#W/【装备角色】"..item.性别限制)
			-- elseif item.分类 > 6 then
			-- 	self.道具文本:添加文本("#W/【角色限制】召唤兽")
			-- else
			-- 	self.道具文本:添加文本("#W/【角色限制】无角色限制")
			end
			if item.制造者 ~= nil then
				self.道具文本:添加文本(format("#W/制造者：%s",item.制造者))
			end
			if jd == nil  then
				self.道具文本:添加文本("#Y/未鉴定物品")
			end
		end
	elseif zls == 3 then
		if item.分类 == 1 then
			if item.附带技能==nil then
				item.附带技能="购买后随机生成"
			end
			self.道具文本:添加文本("#Y/所带技能: "..item.附带技能)
		elseif item.分类 == 3 then
			if item.级别限制 then
				self.道具文本:添加文本("#Y/等级 "..item.级别限制)
			else
				self.道具文本:添加文本("#Y/购买后随机生成")
			end
		elseif item.分类 == 10 then --图册
			if item.种类 and item.级别限制 ~= nil then
				self.道具文本:添加文本("#Y/种类 "..item.种类.."，等级 "..item.级别限制)
			else
				self.道具文本:添加文本("#Y/随等级提升而提升")
			end
		elseif item.分类 == 5 then --天眼珠
			if item.种类 and item.级别限制 ~= nil then
				self.道具文本:添加文本("#Y/种类 "..item.种类.."，等级 "..item.级别限制)
			else
				self.道具文本:添加文本("#Y随等级提升而提升")
			end
		elseif item.分类 == 11 then --天眼珠
			self.道具文本:添加文本("#Y/等级 "..item.级别限制.."，灵气 "..item.灵气)
			-- self.道具文本:添加文本("#Y/等级 "..item.级别限制..",灵气 "..item.灵气..",五行 "..item.五行)
		end
	-- elseif zls == 4 then

	elseif zls == 5 then
		if item.分类 == 1 then
			if item.特效 and  item.子类 ~= nil then
				local it = tp:取武器子类(item.特效)
				--self.道具文本:添加文本(format("#Y/种类 %s, 等级 %d",item.子类,item.特效))
				self.道具文本:添加文本("#Y/种类 "..it..", 等级 "..item.子类)
			else
				self.道具文本:添加文本("#Y/购买后随机生成")
			end
		elseif item.分类 == 2 or item.分类 == 21 then
			if item.名称=="随机元灵晶石" and item.子类==nil then
				self.道具文本:添加文本("#Y/购买后随机生成60-100级的元灵晶石")
			else
				if item.子类 ~= nil then
					self.道具文本:添加文本(format("#Y/等级 %d",item.子类))
				else
					self.道具文本:添加文本("#Y/购买后随机生成")
				end
			end
		elseif item.分类 == 3 then
			self.道具文本:添加文本("#Y/功效 用于分解装备获得宝石")
		elseif item.分类 == 4 then
			--self.道具文本:添加文本(format("#Y/功效 %s",item.特效))
		elseif item.分类 == 5 then
			self.道具文本:添加文本(format("#Y/附加技能：%s",item.附带技能))
		elseif item.分类 == 6 and item.名称~="陨铁" then
			if item.名称~="星辉石" and item.名称~="附魔宝珠" and item.名称~="附法宝珠" and item.名称~="钨金"and item.名称~="珍珠"and item.名称~="战魄" and item.名称~="精致碎石锤"  then
				self.道具文本:添加文本(format("#W/【镶嵌装备】%s",item.角色限制))
				self.道具文本:添加文本(format("#W/【镶嵌效果】%s",item.特效))
			end
			if lv then
						self.道具文本:添加文本(format("#Y/等级 %s",lv))
			else
				self.道具文本:添加文本(format("#Y/等级 %s",item.级别限制))
			end
		elseif item.分类 == 7 then
			self.道具文本:添加文本(format("#W/【镶嵌装备】灵饰"))
			if item.特性==nil then
			self.道具文本:添加文本(format("#R/此道具出错请自行丢弃"))
			else
			self.道具文本:添加文本(format("#Y/特性 %s",item.特性))
			self.道具文本:添加文本(format("#Y/等级 %s",item.级别限制))
			end

		elseif item.分类 == 20 then
			if item.特效~=nil and item.子类~=nil then
				self.道具文本:添加文本("#Y/种类 "..item.特效..", 等级 "..item.子类)
			else
				self.道具文本:添加文本("#Y/购买后随机生成60-100级的灵饰指南书")
			end
		end
	elseif zls == 3 then
		if item.分类 == 1 then
			if item.附带技能==nil then
				item.附带技能="购买后随机生成"
			end
			self.道具文本:添加文本("#Y/所带技能: "..item.附带技能)


			if item.名称== "特殊魔兽要诀" then-- or item.名称 =="魔兽要诀" or item.名称=="高级魔兽要诀" or item.名称=="特殊魔兽要诀"  or item.名称=="超级魔兽要诀"
					if item.附带技能 and item.附带技能~=nil or item.附带技能~=0 or item.附带技能~="" then
						  self.道具文本:添加文本("\n#W"..skill取技能[item.附带技能].jns_1)
					end
			end


			-- if item.附带技能=="与生俱来" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:进入战斗时，自动获得自身血量*30%的护盾")
			-- elseif  item.附带技能=="义薄云天" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:施法时增加自身等级*0.55的法术伤害力；战斗中不会触发自动逃跑")
   --    elseif  item.附带技能=="气贯长虹" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:触发连击/高级连击时，伤害提高25%/50%")
			-- elseif  item.附带技能=="柳暗花明" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:每次没有触发法术连击的施法，提升法术连击时50%伤害结果。（最多2层，在触发法术连击时清空）")
			-- elseif  item.附带技能=="无上正真" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:增加力量*0.4的物理伤害力")
			-- elseif  item.附带技能=="灵能激发" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:使用后临时提升自身的法术伤害能力（法力点数越高效果越好，持续5回合）")
			-- elseif  item.附带技能=="理直气壮" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:普通攻击时：有40%几率攻击3次，伤害降低20%")
			-- elseif  item.附带技能=="净台妙谛" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:增加自身体质*成长*2的气血")
			-- elseif  item.附带技能=="凝光炼彩" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:受伤时有25%概率获得护盾，护盾值为所受伤害的50%")
			-- elseif  item.附带技能=="凭风借力" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:每次物理攻击提升必杀时12.5%的总伤害结果。(最多4层，在触发必杀时清空)")
			-- elseif  item.附带技能=="乘胜追击" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:普通攻击或连击达到4次时，额外攻击敌人2次。(额外攻击的伤害结果降低60%)")
			-- elseif  item.附带技能=="出其不意" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:使用本回合己方召唤兽末使用过的技能时，造成的伤害结果提升15%")
			-- elseif  item.附带技能=="龙魂" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:每成功使用3次法术，都可以临时增加自身法术伤害（效果可持续2回合，成功使用法术后状态消失）")
			-- elseif  item.附带技能=="浮云神马" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:在场时，提高自身及主人10%速度，最多持续5回合")
			-- elseif  item.附带技能=="超级神柚复生" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:战斗死亡时有40%的几率复活，同时获得40%生命上限的护盾，如果同时拥有鬼魂术（普通或高级），神佑复生的效果将取消")
			-- elseif  item.附带技能=="风起龙游" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:攻击速度低于自身的目标，提升10%的伤害效果")
			-- elseif  item.附带技能=="从天而降" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:物理攻击造成的伤害结果提升50%，但攻击时有一定几率失败")
   --    elseif  item.附带技能=="桀骜自恃" then
			-- 	self.道具文本:添加文本("#Y/技能介绍:法术暴击几率增加50%，且不会逃跑，不与法爆共存")
			-- end

		elseif item.分类 == 3 then
			if item.级别限制 then
				self.道具文本:添加文本("#Y/等级 "..item.级别限制)
			else
				self.道具文本:添加文本("#Y/购买后随机生成")
			end
		elseif item.分类 == 10 then --图册
			if item.种类 and item.级别限制 ~= nil then
				self.道具文本:添加文本("#Y/种类 "..item.种类.."，等级 "..item.级别限制)
			else
				self.道具文本:添加文本("#Y/随等级提升而提升")
			end
		elseif item.分类 == 5 then --天眼珠
			if item.种类 and item.级别限制 ~= nil then
				self.道具文本:添加文本("#Y/种类 "..item.种类.."，等级 "..item.级别限制)
			else
				self.道具文本:添加文本("#Y随等级提升而提升")
			end
		elseif item.分类 == 11 then --天眼珠
			self.道具文本:添加文本("#Y/等级 "..item.级别限制.."，灵气 "..item.灵气)
			-- self.道具文本:添加文本("#Y/等级 "..item.级别限制..",灵气 "..item.灵气..",五行 "..item.五行)
		end
	-- elseif zls == 4 then
	elseif zls == 5 then
		if item.分类 == 1 then
			if item.特效 and  item.子类 ~= nil then
				local it = tp:取武器子类(item.特效)
				--self.道具文本:添加文本(format("#Y/种类 %s, 等级 %d",item.子类,item.特效))
				self.道具文本:添加文本("#Y/种类 "..it..", 等级 "..item.子类)
			else
				self.道具文本:添加文本("#Y/购买后随机生成")
			end
		elseif item.分类 == 2 or item.分类 == 21 then
			if item.名称=="随机元灵晶石" and item.子类==nil then
				self.道具文本:添加文本("#Y/购买后随机生成60-100级的元灵晶石")
			else
				if item.子类 ~= nil then
					self.道具文本:添加文本(format("#Y/等级 %d",item.子类))
				else
					self.道具文本:添加文本("#Y/购买后随机生成")
				end
			end
		elseif item.分类 == 3 then
			self.道具文本:添加文本("#Y/功效 用于分解装备获得宝石")
		elseif item.分类 == 4 then
			--self.道具文本:添加文本(format("#Y/功效 %s",item.特效))
		elseif item.分类 == 5 then
			self.道具文本:添加文本(format("#Y/附加技能：%s",item.附带技能))


		elseif item.分类 == 6 and item.名称~="陨铁"  then
			if item.名称~="星辉石" and item.名称~="附魔宝珠" and item.名称~="附法宝珠" and item.名称~="战魄" and item.名称~="钨金"and item.名称~="珍珠"and item.名称~="精致碎石锤"  then
				self.道具文本:添加文本(format("#W/【镶嵌装备】%s",item.角色限制))
				self.道具文本:添加文本(format("#W/【镶嵌效果】%s",item.特效))
			end
			if lv and item.名称~="附魔宝珠"and item.名称~="战魄"and item.名称~="钨金" then
						self.道具文本:添加文本(format("#Y/等级 %s",lv))
			else
				self.道具文本:添加文本(format("#Y/等级 %s",item.级别限制))
			end

				if item.名称=="钟灵石"  then
				 if item.技能~=nil then
				 	self.道具文本:添加文本(format("#Y/附加特性：%s",item.技能))
        if item.技能=="心源" then
				  self.道具文本:添加文本("#S/所有部位:本心·万法之源")
		    elseif item.技能=="回春之术" then
		  	  self.道具文本:添加文本("#S/所有部位:增加治疗能力")
			  elseif item.技能=="锐不可当" then
			  	self.道具文本:添加文本("#S/所有部位:增加固定伤害")
			  elseif item.技能=="血气方刚" then
		  	  self.道具文本:添加文本("#S/所有部位:增加气血上限")
			  elseif item.技能=="健步如飞" then
		  	  self.道具文本:添加文本("#S/所有部位:增加速度")
		  	elseif item.技能=="通真达灵" then
		  	  self.道具文本:添加文本("#S/所有部位:增加法术防御")
		  	elseif item.技能=="气壮山河" then
		  	  self.道具文本:添加文本("#S/所有部位:增加气血回复效果")
		  	elseif item.技能=="自我陶醉" then
		  	  self.道具文本:添加文本("#S/所有部位:增加全部属性")
		  	elseif item.技能=="傲娇海星" then
		  	  self.道具文本:添加文本("#S/所有部位:增加全部属性")
		  	elseif item.技能=="163" then
		  	  self.道具文本:添加文本("#S/所有部位:与玩家战斗时如果当前气血值为163，额外提升1%%的灵饰特效等级的伤害输出效果")
		  	elseif item.技能=="心无旁骛" then
		  	  self.道具文本:添加文本("#S/所有部位:增加抵抗封印等级")
       end
		end
 end

		elseif item.分类 == 20 then
			if item.特效~=nil and item.子类~=nil then
				self.道具文本:添加文本("#Y/种类 "..item.特效..", 等级 "..item.子类)
			else
				self.道具文本:添加文本("#Y/购买后随机生成60-100级的灵饰指南书")
			end
		end
	elseif zls == "召唤兽镶嵌" then
		if item.特效 then
			local desc="属性随机"
			if item.特效=="躲避" then
				desc="增加20点躲避"
			elseif item.特效=="速度" then
				desc="增加6点速度"
			elseif item.特效=="伤害" then
				desc="增加10点伤害"
			elseif item.特效=="灵力" then
				desc="增加4点灵力"
			elseif item.特效=="防御" then
				desc="增加8点防御"
			elseif item.特效=="气血" then
				desc="增加30点气血"
			end
			if item.子类<=2 then
				self.道具文本:添加文本("#W/【镶嵌装备】项圈")
				self.道具文本:添加文本("#Y/等级:"..item.级别限制..","..desc)
			elseif item.子类==3 or item.子类==4 then
				self.道具文本:添加文本("#W/【镶嵌装备】护腕")
				self.道具文本:添加文本("#Y/等级:"..item.级别限制..","..desc)
			else
				self.道具文本:添加文本("#W/【镶嵌装备】铠甲")
				self.道具文本:添加文本("#Y/等级:"..item.级别限制..","..desc)
			end
		else
			if lv then
				self.道具文本:添加文本(format("#Y/等级 %s",lv))
			else
				self.道具文本:添加文本("#Y/（购买后随机生成。)")
			end
		end

	elseif zls == 201  then

		if item.名称=="元素曜石·冰" or  item.名称=="元素曜石·风" or  item.名称=="元素曜石·火"  or  item.名称=="元素曜石·雷"  or  item.名称=="元素曜石·水"  or  item.名称=="元素曜石·岩"  then
			if item.部位 then
			self.道具文本:添加文本("#Y/当前部位：#R/"..item.部位)
			self.道具文本:添加文本("#Y/增加数值：#R/"..(item.数值/50).."%")
			self.道具文本:添加文本("#Y/级别限制：#R/"..item.级别限制)
			else
			self.道具文本:添加文本("#Y/右键可直接鉴定宝石，鉴定后宝石将更改为绑定状态！")
			end
		end


	elseif zls == 889 then
		if item.名称=="未激活的符石" then
			self.道具文本:添加文本("【激活方式】鼠标右键点击使用激活")
			self.道具文本:添加文本("#Y/当前状态:#R/未激活")
			self.道具文本:添加文本("#Y/等级 "..item.子类)
			self.道具文本:添加文本("#Y/等级 "..item.颜色)
			local 组合语句="#Y/"
			for k,v in pairs(item.符石属性) do
				组合语句 = 组合语句..k.." +"..v.."  "
			end
			self.道具文本:添加文本(组合语句)
		elseif item.名称=="未激活的星石" then
			self.道具文本:添加文本("#Y/镶嵌部位: "..取星石部位(item.子类))
			self.道具文本:添加文本("#R/激活后为专用，无法转移给他人。")
			self.道具文本:添加文本("【激活方式】鼠标右键点击使用激活")
			self.道具文本:添加文本("#Y/当前状态:#R/未激活")
			self.道具文本:添加文本("#Y/等级 4")
			self.道具文本:添加文本("#G/镶嵌在星位后，激活属性")
		elseif item.分类 == 91 and item.类型==nil then
			self.道具文本:添加文本("#Y/等级 4")
			local ys = 取星位颜色(item.子类)
			self.道具文本:添加文本("#Y/正面颜色: "..ys[1].." 反面颜色: "..ys[2])
			self.道具文本:添加文本("#Y/镶嵌部位: "..取星石部位(item.子类))
			self.道具文本:添加文本("#G/镶嵌于开运装备的星位，穿戴整套镶有星石的装备可触发符石套装效果")
			self.道具文本:添加文本("#Y/耐久 150")
		elseif item.分类 == 91 and item.类型~=nil then
			self.道具文本:添加文本("#Y/等级 4")
			local ys = 取星位颜色(item.子类)
			self.道具文本:添加文本("#Y/颜色: "..ys[item.类型])
			self.道具文本:添加文本("#Y/镶嵌部位: "..取星石部位(item.子类))
			self.道具文本:添加文本("#G/镶嵌于开运装备的星位，左键点击翻转")
			self.道具文本:添加文本("#G/星位: "..item.sx)
			self.道具文本:添加文本("#Y/耐久 150")
		elseif item.名称=="符石卷轴" then
			self.道具文本:添加文本("#w/【说明】需要加入此卷轴才可以合成三级符石，在合成过程中会被消耗。")
		else
			self.道具文本:添加文本("【用途】可镶嵌有开孔数的装备上")
			local 组合语句="#Y/"
			for k,v in pairs(item.符石属性) do
				组合语句 = 组合语句..k.." +"..v.."  "
			end
			self.道具文本:添加文本("#Y/等级 "..item.子类.."  "..item.颜色)
			self.道具文本:添加文本(组合语句)
			self.道具文本:添加文本("#Y/耐久 150")
		end
	elseif zls == 7 then
		if item.分类 == 1 then
			if item.名称=="藏宝图" then
			 self.道具文本:添加文本("#Y/【类型】普通藏宝图")
			else
			 self.道具文本:添加文本("#Y/【类型】高级藏宝图")
			 end
			 if item.地图名称 then
				 self.道具文本:添加文本(format("#Y/【坐标】#G/%s(%s,%s)",item.地图名称,item.x,item.y))
			 end
		end
	elseif zls == 9 then
		if item.分类 == 1 then
			self.道具文本:添加文本("#Y/右键点击使用")
		end
	elseif zls == 99 then
		self.道具文本:添加文本("#Y/使用次数："..(item.次数 or "永久"))
	elseif zls == 10 then
		if item.分类 == 4 then
			self.道具文本:添加文本("#Y/右键点击使用")
		end
	elseif zls == 11 then
		if item.分类==1 then
			if item.地图==nil then
				self.道具文本:添加文本("#Y/右击后定标")
			else
				local map = 取地图名称(item.地图)
				self.道具文本:添加文本(format("#Y/%s(%d,%d)",map,item.x,item.y))
				self.道具文本:添加文本(format("#Y/还可使用%s次",item.次数))
			end
		elseif item.分类==2 then
			self.道具文本:添加文本(format("#Y/场景:%s,还能使用%s次",取地图名称(item.地图),item.次数))
		end
	elseif zls == 12 then
		self.道具文本:添加文本(format("#Y/变化对象：%s",item.子类))
	elseif zls == 13 then
			self.道具文本:添加文本(format("#Y/阵型:%s",item.子类 or "随机阵法"))

	elseif zls == 21 and item.特效 ~= nil then
		self.道具文本:添加文本(format("#Y/说明：%s",item.特效))
	elseif zls == 30 then
		self.道具文本:添加文本(format("#W/卡片类型：%s",item.造型))
		self.道具文本:添加文本(format("#W/技能要求：%s",数字转大写(item.等级).."级变化之术"))
		local 变身卡技能=item.技能
		if 变身卡技能=="" then 变身卡技能="无" end
		self.道具文本:添加文本(format("#W/【附加技能】%s",变身卡技能))
		local 组合语句=""
		if item.属性==0 then
			组合语句="无"
		elseif item.单独==1 then
			if item.正负==1 then
			 组合语句=item.类型.."+"..item.属性
			else
			 组合语句=item.类型.."-"..item.属性
				end
		else
			if item.正负==1 then
			 组合语句=item.类型.."+"..item.属性.."%"
			else
			 组合语句=item.类型.."-"..item.属性.."%"
			end
		end
		self.道具文本:添加文本(format("#W/【属性影响】%s",组合语句))
		self.道具文本:添加文本(format("#Y/等级：%s  剩余使用次数：%s",item.等级,item.次数))
		self.道具文本:添加文本(format("#Y/持续时间：%s分钟","15分钟*(1+变化之术等级)"))
	elseif zls == 170 then
		if item.分类==2 then
			self.道具文本:添加文本(format("#W/卡片类型：%s",item.造型))
			local 变身卡技能=item.技能
			if 变身卡技能=="" then 变身卡技能="无" end
			self.道具文本:添加文本(format("#W/【附加技能】%s",变身卡技能))
			local 组合语句=""
			if item.属性==0 then
				 组合语句="无"
			elseif item.单独==1 then
				if item.正负==1 then
				 组合语句=item.类型.."+"..item.属性
				else
				 组合语句=item.类型.."-"..item.属性
					end
			else
				if item.正负==1 then
				 组合语句=item.类型.."+"..item.属性.."%"
				else
				 组合语句=item.类型.."-"..item.属性.."%"
				end
			end
			self.道具文本:添加文本(format("#W/【属性影响】%s",组合语句))
			self.道具文本:添加文本(format("#Y/等级：%s  剩余使用次数：%s",item.等级,item.次数))
			self.道具文本:添加文本(format("#Y/持续时间：%s分钟","1440"))
		end
	elseif zls == 55 then
		self.道具文本:添加文本("【用途】:可以镶嵌在有开运孔数的装备上")
		self.道具文本:添加文本("#Y/等级 "..item.级别限制.."    "..item.特效)
		local sx = ""
		local 气血 = item.气血
		local 魔法 = item.魔法
		local 命中 = item.命中
		local 伤害 = item.伤害
		local 防御 = item.防御
		local 速度 = item.速度
		local 躲避 = item.躲避
		local 灵力 = item.灵力
		local 体质 = item.体质
		local 魔力 = item.魔力
		local 力量 = item.力量
		local 耐力 = item.耐力
		local 敏捷 = item.敏捷
		local 法术伤害 = item.法术伤害
		local 法术防御 = item.法术防御
		local 固定伤害 = item.固定伤害
		if 气血 ~= 0 and 气血 ~= nil then
			sx = sx.."气血 +"..气血.." "
		end
		if 魔法 ~= 0 and 魔法 ~= nil  then
			sx = sx.."魔法 +"..魔法.." "
		end
		if 命中 ~= 0  and 命中 ~= nil then
			sx = sx.."命中 +"..命中.." "
		end
		if 伤害 ~= 0 and 伤害 ~= nil  then
			sx = sx.."伤害 +"..伤害.." "
		end
		if 防御 ~= 0 and 防御 ~= nil  then
			sx = sx.."防御 +"..防御.." "
		end
		if 速度 ~= 0 and 速度 ~= nil  then
			sx = sx.."速度 +"..速度.." "
		end
		if 躲避 ~= 0 and 躲避 ~= nil  then
			sx = sx.."躲避 +"..躲避.." "
		end
		if 灵力 ~= 0 and 灵力 ~= nil  then
			sx = sx.."灵力 +"..灵力.." "
		end
		if 体质 ~= 0 and 体质 ~= nil  then
			sx = sx.."体质 +"..体质.." "
		end
		if 魔力 ~= 0 and 魔力 ~= nil  then
			sx = sx.."魔力 +"..魔力.." "
		end
		if 力量 ~= 0 and 力量 ~= nil  then
			sx = sx.."力量 +"..力量.." "
		end
		if 耐力 ~= 0 and 耐力 ~= nil  then
			sx = sx.."耐力 +"..耐力.." "
		end
		if 敏捷 ~= 0 and 敏捷 ~= nil  then
			sx = sx.."敏捷 +"..敏捷.." "
		end
		if 法术伤害 ~= 0 and 法术伤害 ~= nil  then
			sx = sx.."法术伤害 +"..法术伤害.." "
		end
		if 法术防御 ~= 0 and 法术防御 ~= nil  then
			sx = sx.."法术防御 +"..法术防御.." "
		end
		if 固定伤害 ~= 0 and 固定伤害 ~= nil  then
			sx = sx.."固定伤害 +"..固定伤害.." "
		end
		if sx ~= "" then
			self.道具文本:添加文本("#Y/"..sx)
		end
	elseif zls == 101 then
		if item.技能=="龙附" or item.技能=="轻如鸿毛" or item.技能=="魔王护持" or item.技能=="盘丝舞" or item.技能=="元阳护体" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.技能.."法术效果在一定时间内强化一件武器"))
		elseif item.技能=="嗜血" or item.技能=="莲华妙法" or item.技能=="担山赶月" then --
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.技能.."法术效果在一定时间内强化一件项链"))
		elseif item.技能=="神兵护法" or item.技能=="尸气漫天" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.技能.."法术效果在一定时间内强化一件帽子"))
		elseif item.技能=="拈花妙指" or item.技能=="神木呓语" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.技能.."法术效果在一定时间内强化一件鞋子"))
		elseif item.技能=="浩然正气" or item.技能=="一气化三清" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.技能.."法术效果在一定时间内强化一件衣服"))
		elseif item.技能=="穿云破空" or item.技能=="神力无穷" then
			self.道具文本:添加文本(format("#Y/以"..item.等级.."级的"..item.技能.."法术效果在一定时间内强化一件腰带"))
		end
	elseif zls == 103 then
		if item.灵气 ~= nil then
			self.道具文本:添加文本("#Y/灵性: "..item.灵气)
		end
	elseif zls == "可使用" then
		if item.灵气 ~= nil then
			self.道具文本:添加文本("#Y/灵气: "..item.灵气)
		end
	elseif zls == "天赋符" then
		if item.属性 ~= nil then
			self.道具文本:添加文本("#Y/临时属性: #R"..item.属性)
		else
			self.道具文本:添加文本("#Y/当前状态: #R未激活")
		end
	elseif zls == 106 then
		if item.附加参数3~= nil then
			self.道具文本:添加文本("#Y/"..item.附加参数3)
		end
	elseif zls == 109 then --如意丹
		if item.灵气 ~= nil then
			self.道具文本:添加文本("#Y/五行 "..item.灵气)
		end
	------------------------超级技能
	elseif zls == 110 then
		local sm={[1]="【用途】在长安城云来酒店可用于制作仙露丸子",[2]="【用途】在长安城云来酒店可用于制作仙露丸子",[3]="【用途】交给长安城(0,0)超级神柚，可用于赐福召唤兽"}
	  if sm[item.分类]~=nil then
		  self.道具文本:添加文本("#Y/" ..sm[item.分类])
		end
	------------------------
	elseif zls == 111 then
		self.道具文本:添加文本("#Y/等级："..item.子类)
	elseif zls == 112 and item.装备坐骑 ~= nil then
		self.道具文本:添加文本("#W/【类型】坐骑装饰品")
		self.道具文本:添加文本("#W/【装备坐骑】"..item.装备坐骑)
		self.道具文本:添加文本(format("#Y/境界%s，耐久%s，战斗中增加统驭召唤兽的%s，需要等级%s",item.气血,item.耐久,item.特技,item.级别限制))
	elseif zls == 154 then
		self.道具文本:添加文本(format("#Y/祖传特制超神秘的#R/%s#Y/的烹饪方法",秘制食谱子类()[item.子类]))
	elseif zls == 160 then
		self.道具文本:添加文本("#Y/礼包内有"..item.子类.."#Y/个"..item.特效.."#Y/。打开礼包身上需要保留"..item.子类.."#Y/个空位。")
	elseif zls == 163 then
		self.道具文本:添加文本("#Y/还可以抵御"..item.次数.."次勾魂索PK。")
		self.道具文本:添加文本(format("#Y/过期时间：%s",os.date("%Y-%m-%d %H:%M:%S",item.限时)))
	elseif zls == 164 then --祈愿宝箱
		self.道具文本:添加文本("#Y/剩余祈愿次数："..item.次数.." \n#Y祈愿物品：高档玩意（以上物品均有几率获得）")
	elseif zls == 199 then --玄灵珠
	  if item.分类==8 and item.级别限制~=nil then
	  	self.道具文本:添加文本("#S/“召唤”召唤兽或孩子时，恢复回春等级*168气血和6点愤怒。")
	  	self.道具文本:添加文本("#Y/等级 " ..item.级别限制)
	  elseif item.分类==9 and item.级别限制~=nil then
	  	self.道具文本:添加文本("#S/“召唤”召唤兽或孩子时，\n#S/有" ..item.级别限制*10 .."%几率使自身造成的伤害提升" ..item.级别限制 .."%，持续到战斗结束。")
	    self.道具文本:添加文本("#Y/等级 " ..item.级别限制)
	  elseif item.分类==6 and item.级别限制~=nil then --空灵
	  	self.道具文本:添加文本("#S/佩戴后战斗中生效，\n#S/增加" ..item.级别限制*1 .."%法伤，持续到战斗结束。")
	    self.道具文本:添加文本("#Y/等级 " ..item.级别限制)
	  elseif item.分类==7 and item.级别限制~=nil then
	  	self.道具文本:添加文本("#S/佩戴后战斗中生效，\n#S/增加" ..item.级别限制*1 .."%固伤伤害，持续到战斗结束。")
	    self.道具文本:添加文本("#Y/等级 " ..item.级别限制)
	  end
	elseif zls == 203 then
		if item.特效 == nil then
			self.道具文本:添加文本("#Y/随机生成内丹")
		else
			self.道具文本:添加文本("#Y/所带内丹技能:"..item.特效)
			self.道具文本:添加文本(self:取内丹介绍(item.特效))
		end
	elseif zls == 204 then
		self.道具文本:添加文本(" ")
		self.道具文本:添加文本("#Y/等级 "..item.级别限制)
		local sx = ""
		local 气血 = item.幻化元身属性.气血
		local 魔法 = item.幻化元身属性.魔法
		local 命中 = item.幻化元身属性.命中
		local 伤害 = item.幻化元身属性.伤害
		local 防御 = item.幻化元身属性.防御
		local 速度 = item.幻化元身属性.速度
		local 躲避 = item.幻化元身属性.躲避
		local 灵力 = item.幻化元身属性.灵力
		local 体质 = item.幻化元身属性.体质
		local 魔力 = item.幻化元身属性.魔力
		local 力量 = item.幻化元身属性.力量
		local 耐力 = item.幻化元身属性.耐力
		local 敏捷 = item.幻化元身属性.敏捷
		if 气血 ~= 0 and 气血 ~= nil then
			sx = sx.."气血 +"..气血.." "
		end
		if 魔法 ~= 0 and 魔法 ~= nil then
			sx = sx.."魔法 +"..魔法.." "
		end
		if 命中 ~= 0  and 命中 ~= nil then
			sx = sx.."命中 +"..命中.." "
		end
		if 伤害 ~= 0 and 伤害 ~= nil then
			sx = sx.."伤害 +"..伤害.." "
		end
		if 防御 ~= 0 and 防御 ~= nil  then
			sx = sx.."防御 +"..防御.." "
		end
		if 速度 ~= 0 and 速度 ~= nil  then
			sx = sx.."速度 +"..速度.." "
		end
		if 灵力 ~= 0 and 灵力 ~= nil  then
			sx = sx.."灵力 +"..灵力.." "
		end
		if 敏捷 ~= 0 and 敏捷~=nil and item.元身序列 == 25 then
			sx = sx.."敏捷 +"..敏捷.." "
		end
		if sx ~= "" then
			self.道具文本:添加文本("#Y/"..sx)
		end

		local ds = ""
		if 体质 ~= nil and 体质 ~= 0 then
			ds = ds..体质.." "
		end
		if 魔力 ~= nil and 魔力 ~= 0  then
			ds = ds..魔力.." "
		end
		if 力量 ~= nil and 力量 ~= 0 then
			ds = ds..力量.." "
		end
		if 耐力 ~= nil and 耐力 ~= 0 then
			ds = ds..耐力.." "
		end
		if 敏捷 ~= nil and 敏捷 ~= 0 and item.元身序列 ~= 25 then
			ds = ds..敏捷.." "
		end
		if ds ~= "" then
			self.道具文本:添加文本("#G/"..ds)
		end
		if item.幻化元身属性.特技 ~= nil then
			self.道具文本:添加文本("#S/"..item.幻化元身属性.特技)
		end
		if item.幻化元身属性.特效 ~= nil then
			self.道具文本:添加文本("#S/"..item.幻化元身属性.特效)
		end
		if item.幻化次数 ~= nil then
			self.道具文本:添加文本("#Y/幻化次数："..item.幻化次数)
		end
		self.道具文本:添加文本(" ")
	elseif zls == "灵犀玉" then
		self.道具文本:添加文本("#Y/等级："..item.子类)
		self.道具文本:添加文本("#Y/【可以用于修复神器】")
		if item.特性~="无" then
			local 组合语句="#S/"
			if item.特性=="蔓延" then
				组合语句=组合语句..item.特性.."：放置于上下位置插槽时，额外提升相邻插槽的效果。"
			elseif item.特性=="天平" then
				组合语句=组合语句..item.特性.."：放置于左右位置插槽时，额外提升左右插槽的效果。"
			elseif item.特性=="相生" then
				组合语句=组合语句..item.特性.."：提升相邻相生插槽的效果。"
			elseif item.特性=="相克" then
				组合语句=组合语句..item.特性.."：提升相邻相克插槽的效果。"
			elseif item.特性=="聚气" then
				组合语句=组合语句..item.特性.."：本区域所有特性带来的加成效果将集中在该插槽。"
			elseif item.特性=="金耀" then
				组合语句=组合语句..item.特性.."：提升区域中每个金属性插槽的效果。"
			elseif item.特性=="木耀" then
				组合语句=组合语句..item.特性.."：提升区域中每个木属性插槽的效果。"
			elseif item.特性=="水耀" then
				组合语句=组合语句..item.特性.."：提升区域中每个水属性插槽的效果。"
			elseif item.特性=="火耀" then
				组合语句=组合语句..item.特性.."：提升区域中每个火属性插槽的效果。"
			elseif item.特性=="土耀" then
				组合语句=组合语句..item.特性.."：提升区域中每个土属性插槽的效果。"
			elseif item.特性=="利金" then
				组合语句=组合语句..item.特性.."：放置于金属性插槽时，提升其效果。"
			elseif item.特性=="利木" then
				组合语句=组合语句..item.特性.."：放置于木属性插槽时，提升其效果。"
			elseif item.特性=="利水" then
				组合语句=组合语句..item.特性.."：放置于水属性插槽时，提升其效果。"
			elseif item.特性=="利火" then
				组合语句=组合语句..item.特性.."：放置于火属性插槽时，提升其效果。"
			elseif item.特性=="利土" then
				组合语句=组合语句..item.特性.."：放置于土属性插槽时，提升其效果。"
			end
			self.道具文本:添加文本(组合语句)
		end
	elseif zls == 1000 then
		self.道具文本:添加文本(format("【法宝类型】：%s",取法宝类型(item.子类)))
		self.道具文本:添加文本(format("【法宝等级】：%s级",数字转大写(item.分类)))
		self.道具文本:添加文本(format("【等级限制】：%s级",item.特技))
		self.道具文本:添加文本(format("#Y/灵气:#G/%d #Y/五行:#G/%s",item.魔法,item.五行))
		self.道具文本:添加文本(format("#G/#Y/修炼境界：第#G/%d#Y/层 %s",item.气血,取境界(item.气血,item.分类)))
		local xz=""
		if item.名称=="月光宝盒" and  item.地图~=nil then
			xz=format("#Y传送至%s(%s,%s),",取地图名称(item.地图),item.x,item.y)
		end
		if item.使用 == 0 then
			xz =xz.."需要佩戴才可在战斗中发挥效用"
		elseif item.使用 ==2 then
			xz = xz.."无需佩戴,非战斗中选择使用"
		else
			xz = xz..format("无需佩戴，在战斗中选择使用，使用回合限制：#G/%d#Y/",item.角色限制)
		end
		self.道具文本:添加文本(format("#Y/%s",xz))
	elseif zls == 1002 then
		local 消耗 = ""
		if item.使用 == 1 then
			消耗="1/3/7"
		elseif item.使用 == 2 then
			消耗="1"
		elseif item.使用 == 3 then
			消耗="全部"
		end
		self.道具文本:添加文本("#W/【使用条件】")
		self.道具文本:添加文本(format("#W/%s门派专用，消耗#G/%s#W点灵元",item.特技,消耗))
		self.道具文本:添加文本("#F/【战斗效果】")
		self.道具文本:添加文本(format("#F/%s",item.效果))
		self.道具文本:添加文本(format("#Y/灵气：#G/%s",item.魔法))
		self.道具文本:添加文本(format("#Y/修炼境界：第#G/%d#Y/层 %s",item.气血,取境界(item.气血,item.分类)))
	elseif zls == 1003 then
		self.道具文本:添加文本(format("#Y/五行:#G/%s",item.五行))
	end
	h = self.道具文本.显示表.高度+10
	if h < 170 then
		h = 170
	end
	if zbwbgd < item.大模型.高度+35 then
		zbwbgd = item.大模型.高度+35
	end
	if h >350 then
		w = 400
		local lsgd = 0
		if self.道具文本2.显示表.高度 > self.道具文本3.显示表.高度 then
			lsgd = self.道具文本2.显示表.高度
		else
			lsgd = self.道具文本3.显示表.高度
		end
		h = zbwbgd+lsgd
	end
	if y +h > 全局游戏高度-30 then
		y = y-40-h
	else
		y = y + 40
	end
	if x -151 < 0 then
		x = 0
	else
		if x +w > 全局游戏宽度 then
			x = 全局游戏宽度 -w-15
		else
			x = x-150
		end
	end
	if w == 400 then
		local ht = tp.资源:载入("wzife.wd1","网易WDF动画",999600305)
		ht:置区域(0,0,370,2)
		self.寄存内容 = {}
		self.寄存内容[1] = {}
		self.寄存内容[1].内容 = item.大模型
		self.寄存内容[1].x = x+43
		self.寄存内容[1].y = y+25
		self.寄存内容[2] = {}
		self.寄存内容[2].内容 = ht
		self.寄存内容[2].x = x+23
		self.寄存内容[2].y = y+zbwbgd
		self.寄存内容[3] = {}
		self.寄存内容[3].内容 = self.道具文本1
		self.寄存内容[3].x = x + 210
		self.寄存内容[3].y = y + 20
		self.寄存内容[4] = {}
		self.寄存内容[4].内容 = self.道具文本2
		self.寄存内容[4].x = x + 10
		self.寄存内容[4].y = y + zbwbgd-5
		self.寄存内容[5] = {}
		self.寄存内容[5].内容 = self.道具文本3
		self.寄存内容[5].x = x + 210
		self.寄存内容[5].y = y + zbwbgd-5
		self.寄存内容[6] = {}
		self.寄存内容[6].文字 = tp.字体表.道具字体
		self.寄存内容[6].颜色 = -256
		self.寄存内容[6].文本 = item.名称
		self.寄存内容[6].坐标 = {[1]=x+210,[2] =y+4}

		--------------------------武器神附----------------------------
			if item.武器神附 and item.武器神附[1]~=nil  then
					--167119350011 淡蓝色
					--黑色 16777216
					-- -222222 粉色
					if item.武器神附[1]=="卓越" then
						self.寄存内容[6].颜色=4278255360
					elseif item.武器神附[1]=="神圣" then
						self.寄存内容[6].颜色=167119350011
					elseif item.武器神附[1]=="完美" then
						self.寄存内容[6].颜色=-62999
					elseif item.武器神附[1]=="神赐" then
						self.寄存内容[6].颜色=-22999
					end


						self.寄存内容[6].文本=self.寄存内容[6].文本.."("..item.武器神附[1]..")"

			end
	else
		self.寄存内容 = {}
		self.寄存内容[1] = {}
		self.寄存内容[1].内容 = item.大模型
		self.寄存内容[1].x = x+3
		self.寄存内容[1].y = y+5
		self.寄存内容[2] = {}
		self.寄存内容[2].内容 = self.道具文本
		self.寄存内容[2].x = x + 118
		self.寄存内容[2].y = y + 15
		self.寄存内容[3] = {}
		self.寄存内容[3].文字 = tp.字体表.道具字体
		self.寄存内容[3].颜色 = -256
		self.寄存内容[3].文本 = item.名称
		self.寄存内容[3].坐标 = {[1]=x+118.8,[2] =y+4}


		--------------------------武器神附----------------------------
			if item.武器神附 and item.武器神附[1]~=nil  then
					--167119350011 淡蓝色
					--黑色 16777216
					-- -222222 粉色
					if item.武器神附[1]=="卓越" then
						self.寄存内容[3].颜色=4278255360
					elseif item.武器神附[1]=="神圣" then
						self.寄存内容[3].颜色=167119350011
					elseif item.武器神附[1]=="完美" then
						self.寄存内容[3].颜色=-62999
					elseif item.武器神附[1]=="神赐" then
						self.寄存内容[3].颜色=-22999
					end


						self.寄存内容[3].文本=self.寄存内容[3].文本.."("..item.武器神附[1]..")"

			end
	end
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true

-----
--------------------------------------------------------------------------------


end

function 系统类_提示框:临时物品提示(x,y,名称,介绍,大动画,等级)
	local x1 = x + 30
	local y1 = y
	local w = 305
	local h = 18
	self.道具文本:清空()
	self.道具文本:添加文本(介绍)
	if 等级~=nil then
		self.道具文本:添加文本("#Y/等级 "..等级)
	end

	h = self.道具文本.显示表.高度+30
	if h < 130 then
		h = 130
	end
	if x1 + w >= 全局游戏宽度-20 then
		x1 = 全局游戏宽度-20 - w
	end
	if y1 + h > 600 then
		y1 = y - (h/2) - 30
	end
	if h >350 then
		w = 400
		h = 400
		self.寄存内容[2].y=y1+35
		self.寄存内容[1].y=y1+110
		self.寄存内容[3].坐标 = {[1]=x1+129,[2] =y1+4}
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = 大动画
	self.寄存内容[1].x = x1+3
	self.寄存内容[1].y = y1+5
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.道具文本
	self.寄存内容[2].x = x1 + 128
	self.寄存内容[2].y = y1 + 35
	self.寄存内容[3] = {}
	self.寄存内容[3].文字 = tp.字体表.道具字体
	self.寄存内容[3].颜色 = -256
	self.寄存内容[3].文本 = 名称
	self.寄存内容[3].坐标 = {[1]=x1+129,[2] =y1+4}
	self.寄存内容.提示坐标 = {[1]=x1,[2]=y1,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:商城提示(x,y,名称,介绍,动画,备注,神兽)
	local x1 = x + 30
	local y1 = y
	local w = 305
	local h = 18
	self.道具文本:清空()
	self.道具文本:添加文本(介绍)
	if 备注~=nil then
		self.道具文本:添加文本("#Y/"..备注)
	end

	h = self.道具文本.显示表.高度+30
	if h < 130 then
		h = 130
	end
	if x1 + w >= 全局游戏宽度-20 then
		x1 = 全局游戏宽度-20 - w
	end
	if y1 + h > 600 then
		y1 = y - (h/2) - 30
	end
	if h >350 then
		w = 400
		h = 400
		self.寄存内容[2].y=y1+35
		self.寄存内容[1].y=y1+110
		self.寄存内容[3].坐标 = {[1]=x1+129,[2] =y1+4}
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = 动画
	self.寄存内容[1].x = x1+3
	self.寄存内容[1].y = y1+5
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.道具文本
	self.寄存内容[2].x = x1 + 128
	self.寄存内容[2].y = y1 + 35
	self.寄存内容[3] = {}
	self.寄存内容[3].文字 = tp.字体表.道具字体
	self.寄存内容[3].颜色 = -256
	self.寄存内容[3].文本 = 名称
	self.寄存内容[3].坐标 = {[1]=x1+129,[2] =y1+4}
	self.寄存内容.提示坐标 = {[1]=x1,[2]=y1,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end
function 系统类_提示框:小地图(x,y,text)
	local x = x + 28
	local y = y
	local w = 86
	local h = 16
	if y - h <= 0 then
		y = 0
	end
	if x + w+18 >= 992 then
		x = 992-w
	end
	if y + h >= 612 then
		y = 612 - h
	end
	jls:置宽高(w+15,h+16)
	jls:显示(x,y)
	tp.字体表.普通字体:置颜色(-256):显示(x + 16,y + 8,text)
end

function 系统类_提示框:其他提示(x,y,f)
	local x = x+25
	local y = y-10
	local w = 105
	local h = 27
	if f ~= nil and f.性别 ~= nil then
		h = 43
	end
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20-w
		if f then
			x = x - (w/1.8)
		end
	end
	jls:置宽高(w+15,h+16)
	jls:显示(x,y)
	local zt = tp.字体表.普通字体
	zt:置颜色(-256)
	if h == 43 then
		zt:显示(x + 7,y + 7,format("气血:%d/%d",f.气血,f.最大气血))
		zt:显示(x + 7,y + 23,format("魔法:%d/%d",f.魔法,f.最大魔法))
		zt:显示(x + 7,y + 39,format("愤怒:%d/150",f.愤怒))
	else
		zt:显示(x + 7,y + 7,format("气血:%d/%d",f.气血,f.最大气血))
		zt:显示(x + 7,y + 23,format("魔法:%d/%d",f.魔法,f.最大魔法))
	end
end
function 系统类_提示框:阵法提示(x,y,ad)
	local x = x - 70
	local y = y - 55
	local w = 118
	local h = 45
	self.道具文本:清空()
	self.道具文本:添加文本(ad)
	if x < 3 then
		x = 3
	end
	if y + h > 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = png
	self.寄存内容[1].x = x+10
	self.寄存内容[1].y = y+10
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.道具文本
	self.寄存内容[2].x = x + 5
	self.寄存内容[2].y = y + 5
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
	ad=nil
end
function 系统类_提示框:自定义(x,y,txt)
	local x = x + 25
	local y = y
	self.介绍文本:清空()
	self.介绍文本:添加文本(txt)
	local w = self.介绍文本.显示表.宽度
	local h = self.介绍文本.显示表.高度
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h >= 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = self.介绍文本
	self.寄存内容[1].x = x + 6
	self.寄存内容[1].y = y + 6
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:超级技能(x,y,mc,sf,sjmc,scts) --超级技能2.5 大改 x,y,名称,是否获得,实际名称,双层提示
	if 丸子技能进化[mc] == nil and sjmc == nil then return end
	local qtb
	local qjnsm
	local bqjnsm=nil
	local jn2tbxy=0
	local jn2tbxy2=0
	if 丸子技能进化[mc] ~= nil then
		qtb=引擎.取技能(丸子技能进化[mc])
		qjnsm=丸子技能进化[mc]
	elseif sjmc then
	  qtb=引擎.取技能(sjmc)
	  qjnsm=sjmc
	else
	    return
	end
  local 技能=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
  local 技能2=nil
  if scts and 丸子技能进化[mc] ~= nil and skill取技能[mc]~=nil then
  	  local bqtb=引擎.取技能(mc)
		  bqjnsm=mc
  	  技能2=tp.资源:载入(bqtb[6],"网易WDF动画",bqtb[7])
  end
	--------------------
		self.介绍文本:清空()
	self.道具文本:清空()
	if skill取技能[qjnsm]~=nil then
		if skill取技能[qjnsm]["jns_1"] then
			self.介绍文本:添加文本("#G/" ..skill取技能[qjnsm]["jns_1"])
		end
	end
	if bqjnsm ~= nil and skill取技能[bqjnsm]~=nil then
		  self.道具文本:添加文本("#G/" ..skill取技能[bqjnsm]["jns_1"])
	end
	if scts and 丸子技能进化[mc] ~= nil and skill取技能[mc]~=nil then
      jn2tbxy=self.介绍文本.显示表.高度+50
  	  jn2tbxy2=46
  end
	local x = x +30
	local y = y
	local w = 247
	h = self.介绍文本.显示表.高度+38+self.道具文本.显示表.高度+jn2tbxy2
	if h < 80 then
	h = 80
	end

	if x < 3 then
		x = 3
	end
	if x + w >= 780 then
		x = 780 - w
	end
	if y + h > 580 then
		y = y - h - 30
	end
	local jc3fj="(进化后获得)"
	if sf=="不显示" then
		jc3fj=""
	elseif sf then
		 jc3fj="(已进化获得)"
	end
	 self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = 技能
	self.寄存内容[1].x = x+5
	self.寄存内容[1].y = y+5
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.介绍文本
	self.寄存内容[2].x = x + 5
	self.寄存内容[2].y = y + 45
	self.寄存内容[3] = {}
	self.寄存内容[3].文字 = tp.字体表.人物字体_
	self.寄存内容[3].颜色 = 0xFFEF2AFA
	self.寄存内容[3].文本 = " " ..qjnsm ..jc3fj --名称
	self.寄存内容[3].坐标 = {[1]=x+45,[2] =y+18}
	------------------------------------------------高级技能提示
	if scts and 技能2 then
		self.寄存内容[4] = {}
		self.寄存内容[4].内容 = 技能2
		self.寄存内容[4].x = x+6
		self.寄存内容[4].y = y+jn2tbxy
		self.寄存内容[5] = {}
		self.寄存内容[5].内容 = self.道具文本
		self.寄存内容[5].x = x + 5
		self.寄存内容[5].y = y+jn2tbxy+42
		self.寄存内容[6] = {}
		self.寄存内容[6].文字 = tp.字体表.人物字体_
		self.寄存内容[6].颜色 = -256
		self.寄存内容[6].文本 = " " ..bqjnsm --名称
		self.寄存内容[6].坐标 = {[1]=x+45,[2] =y+jn2tbxy+13}
	end
	-------------------------------------------------
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:技能(x,y,skill,冷却,ps) --超级技能3.5 function 系统类_提示框:技能(x,y,skill,冷却,ps) 替换了
	local x = x + 30
	local y = y
	local w = 248
	self.介绍文本:清空()
	self.介绍文本:添加文本("")
	self.介绍文本:添加文本("")
	-----------------------
	local 技能
	if tp.队伍[1].奇经八脉~=nil and tp.队伍[1].奇经八脉.当前流派~=nil then
	 local abc = 引擎.取经脉(tp.队伍[1].奇经八脉.当前流派,skill.名称)
	  if abc[10]~=nil then
		 技能 = tp.资源:载入('wdf/audio/jmk/'..tp.队伍[1].门派.."/"..skill.名称..".jpg","图片")
		elseif abc[6] then
			技能 = tp.资源:载入(abc[6],"网易WDF动画",abc[7])
		end
	end
	if 技能 ==nil then
		qtb=引擎.取技能(skill.名称)
	  技能=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
	end
	--------------------------------------超级技能
	local ystj=""
	if 丸子SFCJ[skill.名称] then ystj="#G/" end --超级技能
	--------------------------------------
	if skill.介绍 ~= nil then --超级技能2.7 改
		self.介绍文本:添加文本(ystj ..skill.介绍) --超级技能2.7 改
	end
	if skill.消耗说明 ~= nil then
		self.介绍文本:添加文本("#G/消耗："..skill.消耗说明)
	end
	if skill.使用条件 ~= nil and skill.学会 == false and not tp.战斗中 and not ps then
		self.介绍文本:添加文本(format("#G/条件：%s",skill.使用条件))
	end
	if skill.种类~=nil and skill.种类==55 then
		self.介绍文本:添加文本(format("#Y/条件：%s",skill.使用条件))
	end
	if skill.冷却 ~= nil then
		self.介绍文本:添加文本(format("#G/冷却：%s",skill.冷却))
	end
	if 冷却 ~= nil then
		self.介绍文本:添加文本(format("#R/剩余冷却回合：%d回合",冷却))
	end
	---------------------------------------超级技能
	if 丸子技能进化[skill.名称] ~= nil then
		self.介绍文本:添加文本("#C/按住ALT查看超级技能详情")
	end
	---------------------------------------
	local h = self.介绍文本.显示表.高度+9
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h >= 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[3] = {}
	self.寄存内容[3].内容 = 技能
	self.寄存内容[3].x = x + 5
	self.寄存内容[3].y = y + 5
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = self.介绍文本
	self.寄存内容[1].x = x + 3
	self.寄存内容[1].y = y + 16
	self.寄存内容[2] = {}
	tp.字体表.人物字体_:置阴影颜色(nil)
	self.寄存内容[2].文字 = tp.字体表.人物字体_
	self.寄存内容[2].颜色 = ARGB(255,0,255,0)
	if 丸子SFCJ[skill.名称] ~= nil then self.寄存内容[2].颜色 = 0xFFEF2AFA end --超级技能 增加
	self.寄存内容[2].文本 = skill.名称
	self.寄存内容[2].坐标 = {[1]=x+54,[2] =y+16}
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:飞行坐骑提示(x,y,名称,介绍,动画)
	local x = x + 30
	local y = y
	local w = 187
	local h = 16
	self.道具文本:清空()
	self.道具文本:添加文本(介绍)
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = 动画
	self.寄存内容[1].x = x+6
	self.寄存内容[1].y = y+5
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.道具文本
	self.寄存内容[2].x = x+6
	self.寄存内容[2].y = y + 35
	self.寄存内容[3] = {}
	self.寄存内容[3].文字 = tp.字体表.道具字体
	self.寄存内容[3].颜色 = 白色
	self.寄存内容[3].文本 = 名称
	self.寄存内容[3].坐标 = {[1]=x+20,[2] =y+4}
	h = self.道具文本.显示表.高度+20
	if h < 130 then
		h = 120
	end
	if x + w >= 980 then
		x = 980 - w
	end
	if y + h > 600 then
		y = y-h
		self.寄存内容[2].y=y+135-85
		self.寄存内容[1].y=y+6
		self.寄存内容[3].坐标 = {[1]=x+60,[2] =y+4}
	end
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:特性提示(x,y,jj)--(x,y,ad,ac,aa)
	local ad = jj.特性
	local ac = jj.特性属性
	local kq = jj.开启
	local xa ={}
	local x = x-80
	local y = y+15
	self.介绍文本:清空()
	if ad == "力破" then
		xa ={"#G/"..ac[1].."#Y/","#R/"..(ac[2]*0.1).."％#Y/"} --*0.1
	elseif ad == "识物" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."#Y/"}
	elseif ad == "灵刃" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "瞬击" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "复仇" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "弑神" then
		xa ={"#G/"..ac[1].."#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "吮魔" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "自恋" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."#Y/"}
	elseif ad == "乖巧" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."#Y/"}
	elseif ad == "灵动" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."#Y/"}
	elseif ad == "逆境" then
	   xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "灵断" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "争锋" then
		xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."#Y/"}
	elseif ad == "暗劲" then
	   xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "顺势" then
	   xa ={"#G/"..ac[1].."#Y/","#R/"..ac[2].."#Y/"}
	elseif ad == "阳护" then
	   xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "预知" then
	   xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."#Y/"}
	elseif ad == "识药" then
	   xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "御风" then
	   xa ={"#G/"..ac[1].."#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "瞬法" then
	   xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "灵法" then
	   xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "怒吼" then
	   xa ={"#G/"..ac[1].."#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "洞察" then
	   xa ={"#G/"..ac[1].."％#Y/","#R/"..ac[2].."#Y/"}
	elseif ad == "抗物" then
	   xa ={"#G/"..ac[1].."#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "抗法" then
	   xa ={"#G/"..ac[1].."#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "护佑" then
	   xa ={"#G/"..ac[1].."#Y/","#R/"..ac[2].."％#Y/"}
	elseif ad == "巧劲" then
	   xa ={"#G/"..ac[1].."#Y/","#R/"..ac[2].."％#Y/"}
	end

	local a
	if ad == "灵刃" then
		a ="#Y/第二回合以后进场时，"..xa[1].."概率对自身造成#R/30%#Y/气血上限的伤害并且物理伤害结果提高#R/50%#Y/，持续4回合，防御力，法术防御力降低"..xa[2].."(带有茁壮、欣欣向荣、鬼魂、神佑类技能时，伤害结果只提高10%)"
	elseif ad == "灵法" then
		a="#Y/第二回合进场后，"..xa[1].."几率对自身造成30%气血上限的伤害，并提高50%法术伤害结果。持续#R/4#Y/回合,防御力，法术防御力降低"..xa[2].."(带有茁壮、欣欣向荣、鬼魂、神佑类技能时，伤害结果只提高10%)"
	elseif ad == "预知" then
	  a = "#Y/感受到危险时有"..xa[1].."概率喊话,每场战斗最多3次,全属性降低"..xa[2]
	elseif ad == "灵动" then
		a= "#Y/行动时有"..xa[1].."概率与队友进行交流，每场战斗最多3次，全属性降低"..xa[2]
	elseif ad == "瞬击" then
		a= "#Y/第二回合以后进场时，"..xa[1].."概率对气血百分比最低的单位发动一次攻击，气血上限降低"..xa[2]
	elseif ad == "抗法" then
		a="#Y/在场时，我方所有单位法术防御增加"..xa[1].."，自身受到物理伤害增加"..xa[2]
	elseif ad == "阳护" then
		a="#Y/第二回合以后进场时，"..xa[1].."减少所有我方单位身上“死亡禁锢”状态4回合，防御力下降"..xa[2]
	elseif ad == "识物" then
		a="#Y/召唤兽套装附带的技能为法术技能时，触发概率提高"..xa[1].."全属性降低"..xa[2]
	elseif ad == "洞察" then
		a="#Y/PVP战斗中行动时有"..xa[1].."概率发现什么，全属性降低"..xa[2]
	elseif ad == "弑神" then
		a="#Y/对已经神佑过的召唤兽法术伤害增加"..xa[1].."，普通攻击命中率下降"..xa[2]
	elseif ad == "御风" then
		a="#Y/进场时提高主人的速度"..xa[1].."，倒地或者死亡后无效，持续3回合，受到所有伤害增加"..xa[2]
	elseif ad == "顺势" then
		a="#Y/对气血百分低于#G/70%#Y/的单位法术伤害增加"..xa[1].."，对其余单位法术伤害力降低"..xa[2]
	elseif ad == "复仇" then
		a="#Y/主人被击倒时，有"..xa[1].."概率向敌方单位发动一次攻击，最多生效3次。防御力、法术防御力降低"..xa[2]
	elseif ad == "自恋" then
		a="#Y/普通物理攻击击杀任意单位时有"..xa[1].."概率进行炫耀，每场战斗最多1次，全属性降低"..xa[2]
	elseif ad == "怒吼" then
		a="#Y/第二回合以后进场时，我方伤害最高的单位提高"..xa[1].."伤害力，持续2回合，法术伤害力降低"..xa[2]
	elseif ad == "暗劲" then
		a="#Y/属性法术被吸收时，有"..xa[1].."概率使恢复量不超过1,普通物理攻击命中率下降"..xa[2]
	elseif ad == "逆境" then
		a="#Y/进场时，若已方四个以上单位处于被封印状态，则"..xa[1].."解除我方所有单位异常状态，防御力下降"..xa[2]
	elseif ad == "瞬法" then
		a="#Y/第2回合以后进场时，"..xa[1].."概率对血量百分比最低的单位使用随机法术，气血上限降低"..xa[2]
	elseif ad == "乖巧" then
		a="#Y/使用超级巫医时，耗费的银两降低"..xa[1].."，全属性降低"..xa[2]
	elseif ad == "抗物" then
		a="#Y/在场时，我方所有单位物理防御增加"..xa[1].."，自身受到法术伤害增加"..xa[2]
	elseif ad == "护佑" then
		a="#Y/第2回合进场，我方百分比气血最低的单位受到的伤害降低"..xa[1].."持续2回合，法术伤害力降低#R/"..xa[2]
	elseif ad == "识药" then
		a="#Y/使用药品效果提升"..xa[1].."，受到的所有伤害增加"..xa[2]
	elseif ad == "吮魔" then
		a="#Y/普通物理攻击时，吸取对方损失气血"..xa[1].."的魔法，对当前魔法高于#R/50%#Y/的单位伤害结果少"..xa[2]
	elseif ad == "灵断" then
		a="#Y/第二回合以后进场时，"..xa[1].."几率对自身造成#R/30%#Y/气血上限的伤害，无视敌方神佑、鬼魂类技能，持续#R/4#Y/回合，气血上限降低#G/"..xa[2].."#Y/(带有鬼魂类或者神佑技能时，进场对自己造成#R/60%#Y/气血上限伤害)"
	elseif ad == "争锋" then
		a="#Y/对召唤兽物理伤害结果增加"..xa[1].."对人物伤害结果减少"..xa[2]
	elseif ad == "力破" then
		a="#Y/忽略人物角色#G/"..xa[1].."#Y/防御力".."减少对召唤兽的伤害结果#R"..xa[2].."#Y。对NPC无效果"
	elseif ad == "巧劲" then
		a="#Y/普通攻击伤害结果增加"..xa[1].."，受到的所有伤害增加"..xa[2]
	end
	if kq then
		a=a.."\n#R[左键点击可关闭特性效果]"
	else
		a=a.."\n#R[左键点击可开启特性效果]"
	end
	self.介绍文本:添加文本(a)
	local w = self.介绍文本.显示表.宽度
	local h = self.介绍文本.显示表.高度
	if x + w >= 780 then
		x = 780 - w
	end
	if y + h >= 580 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 =self.介绍文本
	self.寄存内容[1].x = x + 10
	self.寄存内容[1].y = y + 10
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:npc回调(x,y,sj)
	local x = x-150
	local y = y-35
	local djh = 1
	self.npc文本:清空()
	self.npc文本:添加文本("#Y在"..sj.地图.."（"..sj.x.."，"..sj.y..'）处')
	local w = self.npc文本.显示表.宽度
	local h = self.npc文本.显示表.高度
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 =self.npc文本
	self.寄存内容[1].x = x + 5
	self.寄存内容[1].y = y + 5
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
	sj=nil
end

function 系统类_提示框:bz提示(x,y,sj)
	local x = x-150
	local y = y-35
	local djh = 1
	self.npc文本:清空()
	self.npc文本:添加文本("#Y"..sj[1].."（"..sj[2].."）")
	local w = self.npc文本.显示表.宽度
	local h = self.npc文本.显示表.高度
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 =self.npc文本
	self.寄存内容[1].x = x + 5
	self.寄存内容[1].y = y + 5
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:星石(x,y,mc,dj)
	local xa ={}
	local x = x-80
	local y = y+15
	local wb = ""
	self.星位文本:清空()
	if mc == "燃魂" then
		wb = "符石套装效果：【"..mc.."】物理伤害提升4|8|12点；同一回合里，每次损失气血时提升4|6|8点防御和1|2|3点法防，回合结束时效果消失。"
	elseif mc == "锐杀" then
		wb = "符石套装效果：【"..mc.."】物理伤害提升10|20|30点"
	elseif mc == "弘法" then
		wb = "符石套装效果：【"..mc.."】提升6|10|14点防御，金刚护法增加的伤害提升6|12|18点。"
	elseif mc == "佛心" then
		wb = "符石套装效果：【"..mc.."】提升5|8|11点体质，推气过宫恢复气血效果额外增加6|12|18点"
	elseif mc == "灵压" then
		wb = "符石套装效果：【"..mc.."】提升4|6|8点灵力，五雷咒无视目标1%|2%|3%的灵力。"
	elseif mc == "再塑" then
		wb = "符石套装效果：【"..mc.."】复活后2回合内，受攻击减少10|20|30点物理伤害、8|14|20点法术伤害"
	elseif mc == "花药" then
		wb = "符石套装效果：【"..mc.."】提升4|8|12点速度；暗器或技能使人中毒后，中毒者每回合额外损失20|35|50点魔法"
	elseif mc == "花冢" then
		wb = "符石套装效果：【"..mc.."】增加4|6|8点速度，复活时额外恢复200|300|400点气血上限"
	elseif mc == "威压" then
		wb = "符石套装效果：【"..mc.."】对召唤兽额外造成20|30|40点伤害，如果召唤兽气血小于50%，再追加10|20|30点伤害"
	elseif mc == "索命" then
		wb = "符石套装效果：【"..mc.."】对当前气血少于上限40%的目标额外造成20|30|40伤害"
	elseif mc == "蕴气" then
		wb = "符石套装效果：【"..mc.."】提升2|4|6点灵力，飞沙走石额外造成10|18|26点伤害"
	elseif mc == "怒焰" then
		wb = "符石套装效果：【"..mc.."】提升2|4|6点灵力，三昧真火有40%概率额外造成20-40|40-80|60-120点随机伤害"
	elseif mc == "魂附" then
		wb = "符石套装效果：【"..mc.."】提升6|9|12点伤害，使用特技造成伤害时，无视对方20|30|40点防御进行进攻"
	elseif mc == "毒附" then
		wb = "符石套装效果：【"..mc.."】提升6|10|14点防御，尸腐毒使目标每回合额外掉10|20|30点魔法"
	elseif mc == "踏网" then
		wb = "符石套装效果：【"..mc.."】提升8|10|12点速度；姐妹同心命中被魔音摄魂的目标，额外减少100|150|200点魔法"
	elseif mc == "艳妆" then
		wb = "符石套装效果：【"..mc.."】提升4|8|12点速度，魔音摄魂命中后，下一回合提升含情脉脉3%|5%|7%封印命中率"
	elseif mc == "天威" then
		wb = "符石套装效果：【"..mc.."】增加4|8|12点速度；错乱命中后，下一回合自身封印命中率提升2%|4%|6%"
	elseif mc == "凝力" then
		wb = "符石套装效果：【"..mc.."】增加2|4|6点灵力，物理和法术技能攻击额外造11|18|25点伤害(五雷轰顶无效)"
	elseif mc == "招云" then
		wb = "符石套装效果：【"..mc.."】提升2|4|6点灵力；龙卷雨击额外造成目标速度*2%|3%|4%的伤害"
	elseif mc == "腾蛟" then
		wb = "符石套装效果：【"..mc.."】提升2|4|6点灵力，龙腾额外造成(目标魔法上限-当前魔法)×2%|3%|4%伤害"
	elseif mc == "云步" then
		wb = "符石套装效果：【"..mc.."】增加4|8|12点速度，烟雨剑法额外造成(自身力量点数-人物等级)*3%|5%|7%点伤害"
	elseif mc == "清风" then
		wb = "符石套装效果：【"..mc.."】提升4|8|12点速度，提高2%|3%|4%抵抗昏睡能力"
	elseif mc == "法诀" then
		wb = "符石套装效果：【"..mc.."】提升20|30|40点气血；五行伤害法术额外造成10-60|10-80|10-100点随机伤害"
	elseif mc == "莲佑" then
		wb = "符石套装效果：【"..mc.."】提升20|30|40点气血，在战斗中永久提升全体队友法术防御6|9|12点"
	elseif mc == "秋风" then
		wb = "符石套装效果：【"..mc.."】增加2|4|6点灵力，落叶萧萧额外造成10|18|26点伤害"
	elseif mc == "云击" then
		wb = "符石套装效果：【"..mc.."】增加2|4|6点灵力，对目标使用雾杀的当前回合额外造成10|20|30点伤害"
	elseif mc == "狂扫" then
		wb = "符石套装效果：【"..mc.."】提升6|8|10点人物伤害，使用翻江搅海进行攻击时额外造成6|10|14点伤害"
	elseif mc == "怒袭" then
		wb = "符石套装效果：【"..mc.."】提升6|8|10点人物伤害，使用天崩地裂进行攻击时忽略目标8|14|21点防御"
	elseif mc == "山甲" then
		wb = "符石套装效果：【"..mc.."】提升6|10|14点防御，明光宝烛使作用目标受到物理攻击时额外减少6|12|18点伤害"
	elseif mc == "灵决" then
		wb = "符石套装效果：【"..mc.."】提升4|8|12点速度，夺魄令命中后，下一回合提高1%|2%|3%的封印命中"
	elseif mc == "全能" then
		wb = "符石套装效果：【"..mc.."】体质、魔力、力量、耐力、敏捷均+3|5|7点"
	elseif mc == "药香" then
		wb = "符石套装效果：【"..mc.."】提升7|11|15点防御，战斗中服用恢复气血三级药(除佛光舍利子和九转回魂丹)，额外恢复40|60|80点当前气血和气血上限"
	elseif mc == "破杀" then
		wb = "符石套装效果：【"..mc.."】提升4|7|10点伤害，物理攻击时，如目标被保护，则额外造成20|40|60点伤害"
	elseif mc == "法门" then
		wb = "符石套装效果：【"..mc.."】提升4|7|10点灵力，复活后三回合内，临时提升12|20|28点灵力"
	elseif mc == "屠兽" then
		wb = "符石套装效果：【"..mc.."】提升4|7|10点伤害，物理攻击额外无视召唤兽10|20|30点防御"
	elseif mc == "逐兽" then
		wb = "符石套装效果：【"..mc.."】提升4|7|10点灵力，法术攻击对召唤兽额外增加10|20|30点法术伤害"
	elseif mc == "心印" then
		wb = "符石套装效果：【"..mc.."】提升4|7|10点速度，封印召唤兽|孩子提升2%|4%|6%封印命中"
	elseif mc == "聚焦" then
		wb = "符石套装效果：【"..mc.."】提升4|7|10点灵力，法术攻击时，如目标防御状态，额外造成40|70|100点伤害"
	elseif mc == "仙骨" then
		wb = "符石套装效果：【"..mc.."】提升20|30|40点气血，战斗中使用门派技能和特技回复气血时，当前回合额外为自身增加20|40|60点气血"
	end
	local djh = 1
	if dj < 780 and dj >= 540 then
		djh = 2
	elseif dj >= 780 then
		djh = 3
	end
	self.星位文本:添加文本(wb.."   #Y等级:#R"..djh)
	local w = self.星位文本.显示表.宽度
	local h = self.星位文本.显示表.高度
	if x + w >= 780 then
		x = 780 - w
	end
	if y + h >= 580 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 =self.星位文本
	self.寄存内容[1].x = x + 5
	self.寄存内容[1].y = y + 5
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:内丹提示(x,y,png,ad)
	local x = x + 30
	local y = y
	local w = 220
	local h = 75
	self.道具文本:清空()
	self.道具文本:添加文本(ad.介绍)
	if x < 3 then
		x = 3
	end
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if y + h > 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = png
	self.寄存内容[1].x = x+10
	self.寄存内容[1].y = y+10
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.道具文本
	self.寄存内容[2].x = x + 12
	self.寄存内容[2].y = y + 51
	self.寄存内容[3] = {}
	self.寄存内容[3].文字 = tp.字体表.人物字体_
	self.寄存内容[3].颜色 = -256
	self.寄存内容[3].文本 = ad.名称
	self.寄存内容[3].坐标 = {[1]=x+50,[2] =y+21}
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:小图标提示(x,y,png,png2,ad,ad2)
	local x = x + 30
	local y = y
	local w = 188
	local h = 40
	self.小图标文本:清空()
	self.小图标文本:添加文本(ad..(ad2 or ""))
	if x < 3 then
		x = 3
	end
	if x + w >= 全局游戏宽度-20 then
		x = 全局游戏宽度-20 - w
	end
	if self.小图标文本.显示表.高度 > 38 then
		h = self.小图标文本.显示表.高度+10
	end
	if y + h > 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = png
	self.寄存内容[1].x = x+10
	self.寄存内容[1].y = y+5
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = png2
	self.寄存内容[2].x = x+10+6
	self.寄存内容[2].y = y+5+6
	self.寄存内容[3] = {}
	self.寄存内容[3].内容 = self.小图标文本
	self.寄存内容[3].x = x + 56
	self.寄存内容[3].y = y + 5
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end
function 系统类_提示框:外置技能(x,y,ad,ad2,ad3)
	local x = x
	local y = y
	self.外部文本:清空()
	self.外部文本:添加文本(ad)
	self.外部文本:添加文本(ad2)
	self.外部文本:添加文本(ad3)
	local w = self.外部文本.显示表.宽度
	local h = self.外部文本.显示表.高度
	if x + w >= 外部窗口宽度-20 then
		x = 外部窗口宽度-20 - w
	end
	if y + h >= 600 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = self.外部文本
	self.寄存内容[1].x = x + 6
	self.寄存内容[1].y = y + 6
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end
function 系统类_提示框:红尘试炼(x,y,ad)

end

function 系统类_提示框:内丹提示2(x,y,ad,升级提示)
	local x = x +30
	local y = y
	local w = 238
	h = self.介绍文本.显示表.高度+38
	if h < 80 then
	h = 80
	end
	self.介绍文本:清空()
	self.介绍文本:添加文本("#G/"..ad.内丹.等级.."层/5层")
	self.介绍文本:添加文本(ad.内丹.说明)
	self.介绍文本:添加文本("#Y/"..ad.内丹.效果)
	if ad.内丹.等级<5 then
		self.介绍文本:添加文本("#G此技能处于领悟状态，右键点击可以再次学习此技能将其提升到下一层次。")
	end

	if x < 3 then
		x = 3
	end
	if x + w >= 780 then
		x = 780 - w
	end
	if y + h > 580 then
		y = y - h - 30
	end
	 self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 = ad.内丹.小模型
	self.寄存内容[1].x = x+5
	self.寄存内容[1].y = y+5
	self.寄存内容[2] = {}
	self.寄存内容[2].内容 = self.介绍文本
	self.寄存内容[2].x = x + 5
	self.寄存内容[2].y = y + 45
	self.寄存内容[3] = {}
	self.寄存内容[3].文字 = tp.字体表.人物字体_
	self.寄存内容[3].颜色 = -256
	self.寄存内容[3].文本 = ad.内丹.技能
	self.寄存内容[3].坐标 = {[1]=x+45,[2] =y+18}
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:每日提示(x,y,名称)
	local x = x + 30
	local y = y
	self.每日文本:清空()
	self.每日文本:添加文本("")
	if 名称 == "泾河龙王" then
		self.每日文本:添加文本("#Y泾河龙王".."（".."普通副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("副本人数：".."5".."人")
		self.每日文本:添加文本("难度：".."★")
		self.每日文本:添加文本("传送人：".."金銮殿(70,40)魏征")
	elseif 名称 == "车迟斗法" then
		self.每日文本:添加文本("#Y车迟斗法".."（".."普通副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."70".."级")
		self.每日文本:添加文本("副本人数：".."5".."人")
		self.每日文本:添加文本("难度：".."★")
		self.每日文本:添加文本("传送人：".."长寿村(132,67)慧觉和尚")
	-- elseif 名称 == "四季" then
	-- 	self.每日文本:添加文本("#Y四级".."（".."特殊副本".."）")
	-- 	self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
	-- 	self.每日文本:添加文本("副本人数：".."5".."人")
	-- 	self.每日文本:添加文本("难度：".."★")
	-- 	self.每日文本:添加文本("传送人：".."朱紫国(150,6)豆蔻囤文")
	elseif 名称 == "乌鸡国" then
		self.每日文本:添加文本("#Y".."乌鸡国".."（".."普通副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("副本人数：".."5".."人")
		self.每日文本:添加文本("难度：".."★")
		self.每日文本:添加文本("传送人：".."国子监吴举人")
	elseif 名称 == "齐天大圣" then
		self.每日文本:添加文本("#Y".."齐天大圣".."（".."普通副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."80".."级")
		self.每日文本:添加文本("副本人数：".."5".."人")
		self.每日文本:添加文本("难度：".."★★")
		self.每日文本:添加文本("传送人：".."傲来国(193,131金毛猿")
	elseif 名称 == "七绝山" then
		self.每日文本:添加文本("#Y".."七绝山".."（".."普通副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("副本人数：".."5".."人")
		self.每日文本:添加文本("难度：".."★★☆")
		self.每日文本:添加文本("传送人：".."大唐境外(86,75牛将军")
	-- elseif 名称 == "黑风山" then
	-- 	self.每日文本:添加文本("#Y".."黑风山".."（".."侠士副本".."）")
	-- 	self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
	-- 	self.每日文本:添加文本("副本人数：".."5".."人")
	-- 	self.每日文本:添加文本("难度：".."★★★")
	-- 	self.每日文本:添加文本("传送人：".."大唐国境(64.67小二")
	elseif 名称 == "通天河" then
		self.每日文本:添加文本("#Y".."通天河".."（".."侠士副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("副本人数：".."5".."人")
		self.每日文本:添加文本("难度：".."★★★")
		self.每日文本:添加文本("传送人：".."长寿村(50,135蝴蝶女")
	elseif 名称 == "水陆大会" then
		self.每日文本:添加文本("#Y".."水陆大会".."（".."侠士副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("副本人数：".."5".."人")
		self.每日文本:添加文本("难度：".."★★★")
		self.每日文本:添加文本("传送人：".."化生寺(32,15)疥癞和尚")
	elseif 名称 == "红孩儿" then
		self.每日文本:添加文本("#Y".."红孩儿".."（".."侠士副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("副本人数：".."5".."人")
		self.每日文本:添加文本("周一五开启")
		self.每日文本:添加文本("传送人：".."麒麟山(177,36红孩儿")
	elseif 名称 == "大闹天宫" then
		self.每日文本:添加文本("#Y".."大闹天宫".."（".."侠士副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("周一五开启")
		self.每日文本:添加文本("难度：".."★★★")
		self.每日文本:添加文本("传送人：".."长寿村(53,18太白金星")
	elseif 名称 == "秘境降妖" then
		self.每日文本:添加文本("#Y".."秘境降妖".."（".."经验难度副本".."）")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("每周末开启")
		self.每日文本:添加文本("难度：".."★★★☆")
		self.每日文本:添加文本("传送人：".."长安城(102.227御林军左统领")
	elseif 名称 == "钟馗捉鬼" then
		self.每日文本:添加文本("#Y".."钟馗捉鬼")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."地府(44,56)钟道")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."40".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "运镖任务" then
		self.每日文本:添加文本("#Y".."运镖活动")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."长风镖局内郑镖头")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."30".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★")
	elseif 名称 == "鬼王" then
		self.每日文本:添加文本("#Y".."鬼王")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."轮回司(36,15)黑无常")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."100".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "封妖任务" then
		self.每日文本:添加文本("#Y".."封妖任务")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."各场景刷出")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."20".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★")
	elseif 名称 == "江湖任务" then
		self.每日文本:添加文本("#Y".."江湖任务")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."长安城杜少海")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."25".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "门派闯关" then
		self.每日文本:添加文本("#Y".."门派闯关")
		self.每日文本:添加文本("活动时间：周二四六".."20：00~21：30")
		self.每日文本:添加文本("活动NPC：".."长安城门派闯关活动使者")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "皇宫飞贼" then
		self.每日文本:添加文本("#Y".."皇宫飞贼")
		self.每日文本:添加文本("活动时间：".."12：00~14：00")
		self.每日文本:添加文本("活动NPC：".."长安城御林军左统领")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "长安保卫战" then
		self.每日文本:添加文本("#Y".."长安保卫战")
		self.每日文本:添加文本("活动时间：".."17：00~18：30")
		self.每日文本:添加文本("活动NPC：".."长安城御林军右统领")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★★")
	elseif 名称 == "游泳比赛" then
		self.每日文本:添加文本("#Y".."游泳比赛")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."傲来国报名官")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "比武大会" then
		self.每日文本:添加文本("#Y".."比武大会")
		self.每日文本:添加文本("活动时间：周日".."20：00~21：30")
		self.每日文本:添加文本("活动NPC：".."长安城比武大会主持人")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	-- elseif 名称 == "科举" then
	-- 	self.每日文本:添加文本("#Y".."科举")
	-- 	self.每日文本:添加文本("活动时间：".."10：00~20：00")
	-- 	self.每日文本:添加文本("活动NPC：".."长安城礼部侍郎")
	-- 	self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
	-- 	self.每日文本:添加文本("是否组队：".."单人活动")
	-- 	self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "彩虹争霸赛" then
		self.每日文本:添加文本("#Y".."彩虹争霸赛")
		self.每日文本:添加文本("活动时间：周一三五".."17：00~18：30")
		self.每日文本:添加文本("活动NPC：".."帮派土地公公，需帮主开启")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★★")
	elseif 名称 == "帮派迷宫" then
		self.每日文本:添加文本("#Y".."彩虹争霸赛")
		self.每日文本:添加文本("活动时间：".."20：00~21：30")
		self.每日文本:添加文本("活动NPC：".."朱紫国彩虹大使")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★")
	elseif 名称 == "黑无常抓鬼" then
		self.每日文本:添加文本("#Y".."鬼王任务")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."地府轮回司黑无常")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."100".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★")
	elseif 名称 == "雁塔地宫" then
		self.每日文本:添加文本("#Y".."雁塔地宫")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."长安雁塔地宫守卫")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("每天限制30层，一共100层每天下降10层")
		self.每日文本:添加文本("难度：".."★★★★★")
	elseif 名称 == "通天塔" then
		self.每日文本:添加文本("#Y".."挑战镇妖塔999层")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."长安镇塔童子")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("每周可手动重置一次")
		self.每日文本:添加文本("难度：".."★★★★★")
	elseif 名称 == "天降星辰" then
		self.每日文本:添加文本("#Y".."十二元辰")
		self.每日文本:添加文本("活动时间：".."18：00~18：30")
		self.每日文本:添加文本("活动NPC：".."长安游弈灵官")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★★")
	elseif 名称 == "采矿活动" then
		self.每日文本:添加文本("#Y".."采矿活动")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."根据系统提示刷新地图")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("每天20次，积分可在长安采矿大师处兑换奖励")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "武神坛" then
		self.每日文本:添加文本("#Y".."武神坛之战")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."长安武神之战NPC")
		self.每日文本:添加文本("等级限制：需要开通月卡")
		self.每日文本:添加文本("是否组队：".."单人活动，全民PK赛玩法")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "降妖除魔" then
		self.每日文本:添加文本("#Y".."降妖除魔")
		self.每日文本:添加文本("活动时间：".."13：00~14：30")
		self.每日文本:添加文本("活动NPC：".."西凉女国鬼谷道士分身")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动，带好包子和女儿红冲刺吧")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "镖王活动" then
		self.每日文本:添加文本("#Y".."镖王活动")
		self.每日文本:添加文本("活动时间：".."12：00~22：00")
		self.每日文本:添加文本("活动NPC：".."长风镖局郑镖头")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "文韵墨香" then
		self.每日文本:添加文本("#Y".."文韵墨香")
		self.每日文本:添加文本("活动时间：".."15：00~16：30")
		self.每日文本:添加文本("活动NPC：".."长安礼部侍郎")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."50".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "地煞星" then
	  self.每日文本:添加文本("#Y".."地煞1-6星")
		self.每日文本:添加文本("活动时间：".."整点/半点刷新")
		self.每日文本:添加文本("根据系统刷新提示")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★★★★")
	elseif 名称 == "天罡星" then
	  self.每日文本:添加文本("#Y".."天罡1-6星")
		self.每日文本:添加文本("活动时间：".."整点/半点刷新")
		self.每日文本:添加文本("大唐国境")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★★★★★")
	elseif 名称 == "蚩尤挑战" then
	  self.每日文本:添加文本("#Y".."蚩尤元神")
		self.每日文本:添加文本("活动时间：".."每天一次")
		self.每日文本:添加文本("长安圣山传送人-战神山蚩尤元神")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★★★★★★★")
	elseif 名称 == "沉默分身" then
	  self.每日文本:添加文本("#Y".."全服BOSS")
		self.每日文本:添加文本("活动时间：周六日".."19：30~19：45")
		self.每日文本:添加文本("西凉女国85：62，请提前到达指定地点等待刷新")
		self.每日文本:添加文本("任务条件：".."需在15分钟内坚持10回合以上，中途退出或逃跑清空伤害，按照累计造成伤害总和发送奖励")
		self.每日文本:添加文本("是否组队：".."组队活动")
		self.每日文本:添加文本("难度：".."★★★")
	elseif 名称 == "双城记" then
	  self.每日文本:添加文本("#Y".."奇谈副本双城记")
		self.每日文本:添加文本("活动时间：".."周三五")
		self.每日文本:添加文本("活动NPC：".."建邺城癫散班主")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("副本条件：".."需从梨园小贩购买对应戏票")
		self.每日文本:添加文本("难度：".."★★★")
	-- elseif 名称 == "一斛珠" then
	--   self.每日文本:添加文本("#Y".."奇谈副本一斛珠")
	-- 	self.每日文本:添加文本("活动时间：".."周一三")
	-- 	self.每日文本:添加文本("活动NPC：".."建邺城癫散班主")
	-- 	self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
	-- 	self.每日文本:添加文本("副本条件：".."需从梨园小贩购买对应戏票")
	-- 	self.每日文本:添加文本("难度：".."★★★")
	elseif 名称 == "五更寒" then
	  self.每日文本:添加文本("#Y".."奇谈副本五更寒")
		self.每日文本:添加文本("活动时间：".."周二四")
		self.每日文本:添加文本("活动NPC：".."建邺城癫散班主")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("副本条件：".."需从梨园小贩购买对应戏票")
		self.每日文本:添加文本("难度：".."★★★")
	elseif 名称 == "天火之殇上" then
	  self.每日文本:添加文本("#Y".."天火之殇上")
		self.每日文本:添加文本("活动时间：".."周二，周六")
		self.每日文本:添加文本("活动NPC：".."傲来文老伯12,150")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("副本条件：".."需要五人组队")
		self.每日文本:添加文本("难度：".."★★")
	elseif 名称 == "妖王争霸赛" then
	  self.每日文本:添加文本("#Y".."帮战")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."长安帮派竞赛主持人")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("活动介绍：".."13种难度BOSS，尽情击杀吧")
		self.每日文本:添加文本("难度：".."★★★★★★")
	elseif 名称 == "帮战" then
	  self.每日文本:添加文本("#Y".."帮战")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."长安帮派竞赛主持人")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("活动介绍：".."需帮主提前报名")
		self.每日文本:添加文本("难度：".."★★★")
	elseif 名称 == "二十八星宿" then
	  self.每日文本:添加文本("#Y".."二十八星宿")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."系统刷新随机场景")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("活动介绍：".."需要组队")
		self.每日文本:添加文本("难度：".."★★")
	elseif 名称 == "投放怪" then
	  self.每日文本:添加文本("#Y".."狮驼国白骨精美猴王")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."系统刷新随机场景")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("活动介绍：".."需要组队")
		self.每日文本:添加文本("难度：".."★★★★")
	elseif 名称 == "剑会" then
	  self.每日文本:添加文本("#Y".."剑会单挑")
		self.每日文本:添加文本("活动时间：".."21：00-22:30")
		self.每日文本:添加文本("活动NPC：".."长安欧冶子之灵")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("活动介绍：".."单人活动")
		self.每日文本:添加文本("难度：".."★")
	elseif 名称 == "裂风兽" then
	  self.每日文本:添加文本("#Y".."裂风兽")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."每个小时5分刷在墨家禁地")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("活动介绍：".."组队活动")
		self.每日文本:添加文本("难度：".."★★★★★★★★★")
	elseif 名称 == "千年知了王" then
	  self.每日文本:添加文本("#Y".."千年知了王")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."场景刷新")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("活动介绍：".."组队活动")
		self.每日文本:添加文本("难度：".."1-5颗星")
	elseif 名称 == "龙族" then
	  self.每日文本:添加文本("#Y".."龙族")
		self.每日文本:添加文本("活动时间：".."全天")
		self.每日文本:添加文本("活动NPC：".."天宫刷新")
		self.每日文本:添加文本("等级限制：角色等级".."≥".."60".."级")
		self.每日文本:添加文本("活动介绍：".."组队活动")
		self.每日文本:添加文本("难度：".."6颗星")
	end
	local w = self.每日文本.显示表.宽度
	local h = self.每日文本.显示表.高度
	if x + w >= 780 then
		x = 780 - w
	end
	if y + h >= 580 then
		y = y - h - 30
	end
	self.寄存内容 = {}
	self.寄存内容[1] = {}
	self.寄存内容[1].内容 =self.每日文本
	self.寄存内容[1].x = x + 5
	self.寄存内容[1].y = y + 15
	self.寄存内容.提示坐标 = {[1]=x,[2]=y,[3]=w,[4]=h}
	self.寄存内容.开启提示 = true
end

function 系统类_提示框:取内丹介绍(a)
	if a =="迅敏" then
		return "#Y/提升召唤兽伤害力与速度，提升效果受召唤兽自身等级影响。"
	elseif a =="狂怒" then
		return "#Y/在此狂乱状态下必杀的伤害更高，但是受到水、土系法术攻击时承受额外的伤害。"
	elseif a =="阴伤" then
		return "#Y/提升连击/高级连击技能第二次攻击造成的伤害，但是受到火、雷二系法术攻击时将承受额外的伤害。"
	elseif a =="静岳" then
	   return "#Y/提升召唤兽灵力与气血，提升效果受召唤兽自身等级影响。"
	elseif a =="擅咒" then
	   return "#Y/提升召唤兽对目标的法术伤害。"
	elseif a =="灵身" then
	   return "#Y/法术带来的爆发性更强烈，只是受到强力与高强力技能打击时，所受到的伤害增加。"
	elseif a =="矫健" then
	   return "#Y/提升召唤兽气血与速度，提升效果受召唤兽自身等级影响。"
	elseif a =="深思" then
	   return "#Y/高冥思的效果得到加强。"
	elseif a =="坚甲" then
	   return "#Y/拥有反震或高级反震技能的召唤兽能提升对敌人造成的反震伤害。"
	elseif a =="钢化" then
	   return "#Y/带有高级防御、防御技能时的防御值增加，但是所带来的代价是受到法术伤害额外打击。"
	elseif a =="慧心" then
	   return "#Y/提升召唤兽抵抗封印几率。"
	elseif a =="撞击" then
	   return "#Y/物理攻击时命中率得到增加，效果与体质点成正比，同时增加一定的伤害结果。"
	elseif a =="无畏" then
	   return "#Y/提升对拥有反震/高级反震技能目标的物理伤害。"
	elseif a =="愤恨" then
	   return "#Y/提升召唤兽对拥有幸运/高级幸运技能目标的物理伤害。"
	elseif a =="淬毒" then
	   return "#Y/提升毒/高级毒技能的中毒触发几率。"
	elseif a =="狙刺" then
	   return "#Y/提升召唤兽对施法选定目标的法术伤害，提升效果受召唤兽等级影响"
	elseif a =="连环" then
		return "#Y/提升连击/高级连击技能触发连击的几率。"
	elseif a =="圣洁" then
		return "#Y/提升驱鬼/高驱鬼技能对鬼魂召唤兽的法术伤害效果。"
	elseif a =="灵光" then
		return "#Y/提升召唤兽法术伤害，提升效果受召唤兽自身法力点数影响。"
	elseif a =="神机步" then
		return "#Y/入场时你总是活力无限，3回合内极大的增加你的躲避力。"
	elseif a =="腾挪劲" then
		return "#Y/神奇的护盾，有一定几率能够将你所受的一部分物理伤害腾挪到另一个世界。"
	elseif a =="玄武躯" then
		return "#Y/提升召唤兽气血，提升效果受召唤兽等级影响，但是将减少召唤兽所有攻击方式造成的伤害。"
	elseif a =="龙胄铠" then
		return "#Y/提升召唤兽防御，提升效果受召唤兽等级影响，但是将减少召唤兽所有攻击方式造成的伤害。"
	elseif a =="玉砥柱" then
		return "#Y/被壁垒击破、力劈华山、善恶有报、死亡召唤、惊心一剑攻击时，降低一定伤害，但自己所有攻击方式造成的伤害也会减少。"
	elseif a =="碎甲刃" then
		return "#Y/召唤兽普通物理攻击时将有一定几率降低攻击目标的物理防御，效果持续两回合。"
	elseif a =="阴阳护" then
		 return "#Y/降低召唤兽保护其他目标时所承受的伤害。"
	elseif a =="凛冽气" then
		 return "#Y/携带该内丹的召唤兽在场时，可降低本方所有召唤兽的逃跑几率。(包括自身的)"
	elseif a =="舍身击" then
		 return "#Y/提升物理攻击造成的伤害，提升效果受召唤兽自身力量点数影响。"
	elseif a =="电魂闪" then
		 return "#Y/使用单体法术命中目标时有几率驱散目标的某种增益状态。。"
	elseif a =="通灵法" then
		 return "#Y/提升召唤兽忽视目标法术减免效果的能力。"
	elseif a =="双星爆" then
		 return "#Y/提升法术连击/高级法术连击技能触发第二次法术攻击造成的伤害。"
	elseif a =="催心浪" then
		 return "#Y/提升法术波动/高级法术波动技能触发时的伤害波动下限。"
	elseif a =="隐匿击" then
		 return "#Y/降低拥有隐身/高级隐身技能的召唤兽在隐身状态下减少的伤害值，但隐身结束后将消耗额外的魔法。"
	elseif a =="生死决" then
		 return "#Y/提升召唤兽将自身防御的一部分转化为伤害力的几率，提升效果持续到本回合结束。"
	elseif a =="血债偿" then
		return "#Y/本方不带本技能召唤兽每被击飞一次，提升一次拥有本技能召唤兽对目标造成的法术伤害，持续到战斗结束。提升效果最多叠加5次，且受召唤兽自身魔力点数影响，不能与鬼魂和高级鬼魂技能共存。"
	end

end

function 系统类_提示框:清空寄存()
	if #self.寄存内容 ~= 0 then
		self.寄存内容 = {}
	end
end
return 系统类_提示框