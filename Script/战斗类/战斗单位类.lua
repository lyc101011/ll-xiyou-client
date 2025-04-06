-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-13 04:46:45
local 战斗单位类 = class()
local floor=math.floor
local format = string.format
--local yxs = require("script/资源类/FSB")
local tx = 引擎.取头像
local 按钮 = require("script/系统类/按钮")
function 战斗单位类:初始化()
	self.免疫 = 引擎.场景.免疫文字
	self.反弹 = 引擎.场景.反弹文字
	self.躲避 = 引擎.场景.躲避文字
	self.伤害图片 = tp.战斗文字[1]
	self.回复图片 = tp.战斗文字[2]
	self.暴击图片 = tp.战斗文字[4]
 	self.无穷 = 引擎.场景.无穷文字
 	self.偷袭动画 = {}
	self.偷袭动画.显示=false
	self.偷袭动画.显示2=false
	self.偷袭动画.xy={x=0,y=0}
	self.偷袭动画.xy2={x=0,y=0}
	self.偷袭动画.动画=引擎.场景.资源:载入('wzcf.npk',"网易WDF动画","超偷袭tx")
	self.偷袭动画.动画2=引擎.场景.资源:载入('wzcf.npk',"网易WDF动画","超偷袭tx")
	-- for n=1,4 do
	-- 	self.括号图片 [n]  = tp.资源:载入("pic/括号" .. tostring(n) .. ".png","图片")
	-- end
end
-- local n = {"枪矛","斧钺","剑","双短剑","飘带","爪刺","扇","魔棒","锤","鞭","环圈","刀","法杖","弓弩","宝珠","巨剑","伞","灯笼","头盔","发钗","项链","女衣","男衣","腰带","鞋子"}
local function 取攻击帧(模型,zl)
	local 攻击帧,攻击延迟,终结帧,攻击抖动 = 2,1.25,nil,false
	zl = 引擎.场景:取武器子类(zl)
	if 模型 == "偃无师"  then
		攻击帧 = 1
	    攻击延迟 = 1.5
	    if zl=="巨剑" then
	        攻击帧 = -1
		    攻击延迟 = 1.35
	    end
	elseif 模型 == "鬼潇潇" or 模型 == "桃夭夭" or 模型 == "龙太子" or 模型 == "剑侠客" or 模型 == "真陀护法" then
		攻击帧 = 1
		攻击延迟 = 1.3
		if 模型 == "龙太子" and zl=="扇" then
		    攻击抖动 = true
	    elseif 模型 == "鬼潇潇" and zl=="爪刺" then
	    	攻击抖动 = true
		end
	elseif 模型 == "玄彩娥" or 模型 == "舞天姬" or 模型 == "进阶毗舍童子"or 模型 == "羊头怪" or 模型 == "锦毛貂精" then
		攻击帧 = -1
		攻击延迟 = 1.15
		if 模型 == "舞天姬" and zl=="环圈" then
		    攻击抖动 = true
		end
	elseif 模型 == "虎头怪" or 模型 == "神天兵" or 模型 == "巨魔王" or 模型 == "杀破狼" or 模型 == "持国巡守" or 模型 == "雷鸟人" or 模型 == "金铙僧" or 模型 == "葫芦宝贝" or 模型 == "幽灵"  or 模型 == "凤凰" or 模型 == "野鬼" or 模型 == "帮派妖兽" or 模型 == "修罗傀儡鬼" or 模型 == "踏云兽" or 模型 == "巴蛇" or 模型 == "黑熊"  then
		攻击帧 = 1
		攻击延迟 = 1.2
		if zl ~= nil then
			if zl == "弓弩" or zl == "弓弩1" then
				攻击延迟 = 0.88
			end
		end
		if 模型 == "虎头怪" and zl=="锤" then
		    攻击抖动 = true
	    elseif 模型 == "神天兵" and zl=="枪矛" then
	    	攻击抖动 = true
		end
	elseif 模型 == "强盗" or 模型 == "山贼" or 模型 == "鼠先锋" or 模型 == "增长巡守"or 模型 == "灵灯侍者" or 模型 == "般若天女" or 模型 == "进阶雨师" or 模型 == "进阶如意仙子" or 模型 == "野猪精" or 模型 == "超级玉兔" or 模型 == "幽萤娃娃" or 模型 == "黑熊精" or 模型 == "蚌精"  or 模型 == "机关鸟" or 模型 == "连弩车" or 模型 == "蜃气妖" or 模型 == "蛤蟆精" or 模型 == "虾兵" or 模型 == "蟹将" or 模型 == "兔子怪" or 模型 == "蜘蛛精" or 模型 == "花妖" or 模型 == "狐狸精" or 模型 == "哮天犬" or 模型 == "混沌兽" or 模型 == "蝴蝶仙子" or 模型 == "狼" or 模型 == "老虎" then
		攻击帧 = 2
		攻击延迟 = 1.12
		if 模型 == "强盗" then
		    攻击抖动 = true
		end
	elseif 模型 == "机关人人形" or 模型 == "机关兽" then
		攻击帧 = 2
		攻击延迟 = 1.25
	elseif 模型 == "泡泡" then
		攻击帧 = 2
		攻击延迟 = 2.1
	elseif 模型 == "混沌兽"  then
		攻击延迟 = 1.35
	elseif 模型 == "狂豹人形"  then
		攻击帧 = 1
		攻击延迟 = 1.4
	elseif 模型 == "海毛虫" then
		攻击帧 = 1
		攻击延迟 = 1.35
	elseif 模型 == "吸血鬼" then
		攻击抖动 = true
	elseif 模型 == "大海龟"or 模型 == "骷髅怪" or 模型 == "金身罗汉" or 模型 == "修罗傀儡妖" or 模型 == "曼珠沙华" or 模型 == "幽萤娃娃" then
		攻击帧 = 1
		攻击延迟 = 1.2
	elseif 模型 == "画魂" or 模型 == "羽灵神"  then
		攻击帧 = 1
		攻击延迟 = 1.1
	elseif 模型 == "天兵"or 模型 == "巨力神猿"   then
		攻击帧 = 1
		攻击延迟 = 1.25
	elseif 模型 == "地狱战神" or 模型 == "风伯" or 模型 == "芙蓉仙子" or 模型 == "毗舍童子" or 模型 == "镜妖"  or 模型 == "千年蛇魅"or 模型 == "小龙女"  then
		攻击帧 = 0
		攻击延迟 = 1.25
	elseif 模型 == "芙蓉仙子" or 模型 == "如意仙子" then
		攻击帧 = 0
		攻击延迟 = 1.1
	elseif 模型 == "百足将军"  or 模型 == "天将" or 模型 == "小龙女" or 模型 == "碧水夜叉" or 模型 == "马面" or 模型 == "灵鹤" then
		攻击帧 = 3
		攻击延迟 = 1.23
	elseif 模型 == "鬼将"  or  模型 == "大力金刚"then
		攻击帧 = 4
		攻击延迟 = 1.3
		终结帧 = 1
	elseif 模型 == "赌徒" then
		攻击帧 = 4
		攻击延迟 = 1.1
	elseif 模型 == "牛妖"  then
		攻击帧 = 3
		攻击延迟 = 1.26
	elseif 模型 == "古代瑞兽"  then
		攻击帧 = 4
		攻击延迟 = 1.2
	elseif 模型 == "知了王" then
		攻击帧 = 6
		攻击延迟 = 1.32
	elseif 模型 == "黑山老妖" then
		攻击帧 = 6
		攻击延迟 = 1.2
	elseif 模型 == "炎魔神" then
		攻击帧 = 3
		攻击延迟 = 1.2
	elseif 模型 == "长眉灵猴"  then
		攻击帧 = -1
		攻击延迟 = 1.23
	elseif 模型 == "骨精灵" or 模型 == "狐美人" or 模型 == "剑侠客" or 模型 == "逍遥生" or 模型 == "巫蛮儿" or 模型 == "英女侠" or 模型 == "飞燕女" then
		if zl ~= nil then
			if zl == "魔棒" then
				攻击帧 = -1
				if 模型 == "骨精灵" then
					攻击帧 = 2
				    攻击抖动 = true
				end
			elseif zl == "宝珠" then
				攻击帧 = 2
			elseif 模型 == "英女侠" then
				攻击帧 = 0
			elseif 模型 == "飞燕女" and zl == "双短剑"  then
				攻击帧 = 0
			elseif 模型 == "飞燕女" and zl == "环圈"  then
				攻击帧 = 0
			elseif 模型 == "逍遥生" and (zl == "扇")  then
				攻击帧 = 0
			elseif 模型 == "逍遥生" and (zl == "剑")  then
				攻击帧 = 2
				终结帧 = 1
			elseif 模型 == "巫蛮儿" and (zl == "法杖")  then
				攻击帧 =0
			elseif 模型 == "狐美人" and zl == "爪刺" then
				攻击帧 = 0
			elseif 模型 == "狐美人" and zl == "鞭" then
				攻击帧 = 0
			end
		else
			攻击帧 = 1
		end
		攻击延迟 = 1.25
	end
	攻击延迟 = 攻击延迟 - (攻击延迟*(tp.攻击速度/220))
	攻击帧 = 攻击帧 - (攻击帧*(tp.攻击速度/220))
	return 攻击帧,攻击延迟,终极帧,攻击抖动
end

function 战斗单位类:重置丸子技能(数据)
	self.丸子特效 = {}
	self.丸子time = {开关 = false,时间=os.time() + 7}
	self.丸子进化 = 数据.丸子进化
	self.超反击伤害 = 数据.超反击伤害
	self:增加丸子入场(self.丸子进化)
end

function 战斗单位类:创建单位(数据,队伍id,编号)
	self.编号=编号
	self.数据=数据
	-- self.更新次数=0
	self.动画=战斗动画类()
	self.动画:创建动画(数据.模型,数据.类型,数据.染色方案,数据.染色组,数据.变异,数据.武器,数据.变身数据,数据.显示饰品,数据.饰品颜色,数据.炫彩,数据.炫彩组,数据.锦衣,数据.副武器)
	-- (模型,类型,染色方案,染色组,变异,武器,变身,显示饰品,饰品颜色,炫彩,炫彩组,技能)
	-- self.躲避动画=战斗动画类()
	-- self.躲避动画:创建动画(数据.模型,数据.类型,数据.染色方案,数据.染色组,数据.变异,数据.武器,数据.变身数据)--,数据.显示饰品
	-- self.躲避动画:置颜色(ARGB(165,255,255,255),"待战")
	self.动作="待战"
	self.显示xy={x=100,y=150}
	self.名称 = 数据.名称
	self.名称宽度 = floor(引擎.场景.字体表.人物字体:取宽度(数据.名称) / 2)
	-- self.附加 = {x=0,y=0}
	self.刷新 = {x=0,y=0}
	self.当前 = {x=0,y=0}
	self.单位id = 数据.id
	self.单位类型 = 数据.类型
	self.主动技能=数据.主动技能
	self.侵蚀技能=数据.侵蚀技能
	self.特技技能=数据.特技技能
	self.追加法术=数据.披坚执锐
	self.如意神通=数据.如意神通
	self.助战小号=数据.助战小号
	self.战意=数据.战意
	self.超级战意=数据.超级战意
	self.五行珠=数据.五行珠
	self.人参果=数据.人参果
	self.骤雨=数据.骤雨
	self.气血=数据.气血
	self.队伍=数据.队伍
	self.共生=数据.共生
	self.法宝=数据.法宝
	self.不可操作=数据.不可操作
	self.最大气血=数据.最大气血
	self.气血上限=数据.气血上限
	self.模型=数据.模型
	self.移动坐标={}
	self.移动上限=15
	self.单位消失=false
	self.移动频率=20
	self.攻击特效={}
	self.法术特效={}
	self.状态特效={}
	self.掉血开关=false
	self.伤害序列 = {}
	self.捕捉开关=false
	self.是否显示=true
	self.保护 = false
	self.友伤 = false
	self.护盾 = 0
	self.护盾开关 = false
	--self.武器宽度 = 0
	-- sleq=sleq+1
	self.排序位置 = 数据.位置
	self.招式特效 = 数据.招式特效
	self.丸子特效 = {}
	self.丸子time = {开关 = true,时间=os.time() + 7}
	self.丸子进化 = 数据.丸子进化
	self.超级夜战 = 数据.超级夜战
	self.超反击伤害 = 数据.超反击伤害
	self.超级偷袭 = 数据.超级偷袭
	self.实转圈time=0
	if self.单位类型 == "角色" and self.单位id == 引擎.场景.队伍[1].数字id then
		引擎.场景.队伍[1].愤怒 = 数据.愤怒
	end
	self.门派 = 数据.门派
	self.黎魂 = 数据.黎魂
	self.战鼓 = 数据.战鼓
	--   if self.单位类型 == "角色" then
	--   引擎.场景.队伍[1].气血 = 数据.气血
	--   引擎.场景.队伍[1].最大气血 = 数据.最大气血
	--   引擎.场景.队伍[1].魔法 = 数据.魔法
	--   引擎.场景.队伍[1].最大魔法 = 数据.最大魔法
	--   引擎.场景.队伍[1].愤怒 = 数据.愤怒
	-- elseif self.单位类型 == "bb" then
	--   引擎.场景.队伍[1].参战宝宝.气血=数据.气血
	--   引擎.场景.队伍[1].参战宝宝.最大气血=数据.最大气血
	--   引擎.场景.队伍[1].参战宝宝.魔法=数据.魔法
	--   引擎.场景.队伍[1].参战宝宝.最大魔法=数据.最大魔法
	--   end
	-- end
	-- self.攻击帧,self.攻击延迟,self.终极帧 = 取攻击帧(self.模型,self.武器子类)
	--self.高度 = self.动画.动画["待战"].信息组[0][5]
	--self.宽度 = self.动画.动画["待战"].信息组[0][4]
	self.高度 = self.动画.动画["待战"].高度
	self.宽度 = self.动画.动画["待战"].宽度
	if self.高度 == nil then
		self.高度 = 90
	end
	if self.高度 > 100 then
		self.高度 = 100
	elseif self.高度 < 90 then
		self.高度 = 90
	end
	if 数据.武器~=nil and 数据.变身数据 == nil then
		self.武器子类=数据.武器.子类
		-- if 数据.武器.级别限制 < 90 then
		-- 	self.武器等级 = 1
		-- elseif 数据.武器.级别限制 < 130 then
		-- 	self.武器等级 = 2
		-- else
		-- 	self.武器等级 = 3
		-- end
	end
	self.攻击帧,self.攻击延迟,self.终极帧,self.攻击抖动 = 取攻击帧(self.模型,self.武器子类)

	local 位置
	if 数据.队伍==战斗类.队伍id then
		位置=战斗类.我方位置
		self.初始方向=2
		self.转圈方向=2
		self.实转圈方向=2
		self.敌我=1
		self.逃跑方向=0
	else
		位置=战斗类.敌方位置
		self.初始方向=0
		self.转圈方向=0
		self.实转圈方向=0
		self.敌我=2
		self.逃跑方向=2
	end

	if 数据.附加阵法~="普通" then
		if self.敌我==1 then
			位置=战斗类.阵型位置[数据.附加阵法].我方
		else
			位置=战斗类.阵型位置[数据.附加阵法].敌方
		end
	end
	if 战斗类.单挑模式 then

	    if self.敌我==1 then
			位置=战斗类.阵型位置.单挑.我方
		else
			位置=战斗类.阵型位置.单挑.敌方
		end
	end

	self.方向=self.初始方向

	self.动画:置方向(self.方向,self.动作)
	self.显示xy={x=位置[数据.位置].x,y=位置[数据.位置].y}
	self.浮空动画 = tp:载入特效("浮空")
	self.特殊浮空高度 = 0
	self.浮空高度 = 0
-- if 数据.位置<=5 then
	self.挨打坐标={}
	if self.敌我==1 then
		local C补差X,C补差Y = 0,0
		local R补差X,R补差Y = 0,0
		-- C补差X,C补差Y = -155+(全局游戏宽度/2-400),-2+(全局游戏高度/2-300)
		-- R补差X,R补差Y = -180+(全局游戏宽度/2-400),-25+(全局游戏高度/2-300)
		C补差X,C补差Y = (全局游戏宽度/2-400)-165,(全局游戏高度/2-300)-10
		R补差X,R补差Y = (全局游戏宽度/2-400)-170,(全局游戏高度/2-300)-5
		if 数据.位置<=5 then--角色
			self.显示xy.x,self.显示xy.y=self.显示xy.x+R补差X,self.显示xy.y+ R补差Y
		else--前排 宠物
			self.显示xy.x,self.显示xy.y=self.显示xy.x+ C补差X,self.显示xy.y+C补差Y
		end
		self.躲避参数=8
		self.躲避坐标=2.5
		self.反震误差={x=50,y=10}
		self.逃跑坐标=3
		self.挨打坐标.x = self.显示xy.x - 60
		self.挨打坐标.y = self.显示xy.y - 28
	else
		local C补差X,C补差Y = 0,0
		local R补差X,R补差Y = 0,0
		C补差X,C补差Y = -75+(全局游戏宽度/2-400),12+(全局游戏高度/2-300)
		R补差X,R补差Y = -85+(全局游戏宽度/2-400),2+(全局游戏高度/2-300)
		if 数据.位置<=5 then--前排 宠物
			self.显示xy.x,self.显示xy.y=self.显示xy.x+ R补差X,self.显示xy.y+ R补差Y
		else--前排 宠物
			self.显示xy.x,self.显示xy.y=self.显示xy.x+ C补差X,self.显示xy.y+C补差Y
		end
		self.反震误差={x=-50,y=-10}
		self.躲避坐标=-2.5
		self.躲避参数=-8
		self.逃跑坐标=-3
		self.挨打坐标.x = self.显示xy.x + 60
		self.挨打坐标.y = self.显示xy.y + 28
	end

	-- end
	self.初始xy={}
	self.初始xy.x,self.初始xy.y= self.显示xy.x,self.显示xy.y
	-- if self.单位id == 引擎.场景.队伍[1].数字id and 引擎.场景.队伍[1].门派=="天宫" and 引擎.场景.队伍[1].奇经八脉 and 引擎.场景.队伍[1].奇经八脉.当前流派=="霹雳真君" then
	--     self.动画1=战斗动画类()
	-- 	self.动画1:创建动画(数据.模型,数据.类型,数据.染色方案,数据.染色组,数据.变异,数据.武器,数据.变身数据,数据.显示饰品,数据.饰品颜色,数据.炫彩,数据.炫彩组,数据.技能,数据.锦衣)
	-- 	-- self.动画1:置颜色(ARGB(165,255,255,255),"待战")
	-- 	-- self.动画1=DeepCopy(self.动画)
	-- 	self.动画1:置方向(self.方向,self.动作)
	-- end

	-- self.x,self.y=self.显示xy.x,self.显示xy.y
	self.色相变身=0
	self.特技内容开关=false
	self.披坚开关=false
	self.抖动数据={开关=false,进程=0,x=0,y=0}
	self.法术抖动开关 = nil
	self.法术抖动计时 = 0
	self.法术抖动坐标 = {x = 0,y = 0}

	self.物理抖动开关 = false

	self.逃跑开关=false
	self.逃跑特效=引擎.场景:载入特效("逃跑",self:取txz("逃跑"))
	self.喊话=require("script/显示类/喊话").创建(引擎.场景)
	self.鼠标跟随=false
	self.飞镖开关=false
	self.弓弩开关=false
	self.初始化结束 = true
	self.攻击次数 = 0
	if self.气血 <= 0 then
		if 数据.死亡击飞  then
		else
			self.死亡参数= 2
		end
		self:死亡处理()
	end

	self.战斗提示={开关=false,内容="",停止时间=0}
end

--后期要复验
function 战斗单位类:更改模型(模型,类型,染色方案,染色组,变异,武器,变身,饰品,饰品颜色,炫彩,炫彩组,锦衣,名称)--(模型,类型,染色方案,染色组,变异,武器,变身,饰品,饰品颜色,炫彩,炫彩组,技能,锦衣,名称)
	self.动画=战斗动画类()
	self.动画:创建动画(模型,类型,染色方案,染色组,变异,武器,变身数据,显示饰品,饰品颜色,炫彩,炫彩组,锦衣)
	self.模型=模型
	self.数据.变身数据=模型
	if 名称 then
	    self.名称=名称
	end
	self.攻击帧,self.攻击延迟,self.终极帧 = 取攻击帧(self.模型,self.武器子类)
	self.高度 = self.动画.动画["待战"].信息组[0][3]
	if self.高度 > 120 then
		self.高度 = 120
	elseif self.高度 < 60 then
		self.高度 = 60
	elseif self.高度 < 85 then
		self.高度 = 85
	end
	if self.位置 == 2 then
		self.高度 = self.高度 + 20
	else
		self.高度 = self.高度 + 20
	end
	self.动画:置方向(self.方向,self.动作)
end

function 战斗单位类:设置鼠标跟随(特效)
	if 1==1 then return  end
	if self.鼠标跟随 then
		self.鼠标跟随=false
	else
		self.鼠标跟随=true
	end
end

function 战斗单位类:取移动坐标(类型,攻击编号)
	if 类型 == "挨打" then
		return self.挨打坐标.x , self.挨打坐标.y
		-- if self.敌我==1 then
		-- 	return self.初始xy.x,self.初始xy.y
		-- else
		-- 	return self.初始xy.x,self.初始xy.y
		-- end
	elseif 类型 == "友伤" then
		return self.显示xy.x,self.显示xy.y
	elseif 类型 == "保护" then
		return self.显示xy.x,self.显示xy.y
	elseif 类型 == "返回" then
		return self.初始xy.x,self.初始xy.y
	end
end

function 战斗单位类:取txz(特效)
	if Fighttxz[特效] then
		return Fighttxz[特效]
	end
	if 特效 == "宠物_静" then
		local mt = ptmx(引擎.场景.宠物.模型)
		return 引擎.场景.资源:载入(mt[3],"网易WDF动画",mt[1])
	elseif 特效 == "宠物_走" then
		local mt = ptmx(引擎.场景.宠物.模型)
		return 引擎.场景.资源:载入(mt[3],"网易WDF动画",mt[2])
	end
	return 1.15
end

function 战斗单位类:状态前置(特效)
	if 特效 ~= nil then
		local qianzhi = true
		local py={0,0}
		if 特效=="苍白纸人" and self.敌我~=1 then
			py = {-6,0}
		    qianzhi = true
		    return {cp=qianzhi,py=py}
	    elseif 特效 == "紧箍咒" or 特效 == "爪印" then
			py = {2,-self.高度/2-4}
			return {cp=qianzhi,py=py}
		end
		if Fightztqz[特效] then
			return {cp=Fightztqz[特效].cp,py=Fightztqz[特效].py}
		end
		return {cp=qianzhi,py=py}
	end
end

function 战斗单位类:增加丸子入场(名称)
	if 名称~=nil and 引擎.场景~=nil then
		local qtb = 引擎.取技能(名称)
		if qtb[1]~= nil and qtb[6]~= nil and qtb[7] ~= nil then
			self.丸子特效=引擎.场景.资源:载入(qtb[6],"网易WDF动画",qtb[7]) --超级技能2.8
		end
	end
end

function 战斗单位类:增加状态(名称,回合,层数,颜色,负面状态)
	if 名称~=nil and 引擎.场景~=nil then
	    self.状态特效[名称]=self:状态前置(名称)
		local 名称1=名称
		if Fightdiwo[名称1] then--名称1=="干将莫邪" or 名称1=="苍白纸人" or 名称1=="混元伞" or 名称1=="乾坤玄火塔" or 名称1=="护盾" or 名称1=="无畏布施" or 名称1=="盾气" or 名称1=="高级盾气" then
			if self.敌我==1 then
				名称1=名称1.."_我方"
			else
				名称1=名称1.."_敌方"
			end
		end

		-- self.状态特效[名称]=self:状态前置("状态_"..名称1)
		local qtb = 引擎.取技能(名称)
		if qtb[1]~= nil and qtb[6]~= nil and qtb[7] ~= nil then
			self.状态特效[名称].小图标=引擎.场景.资源:载入(qtb[6],"网易WDF动画",qtb[8])
			-- self.状态特效[名称].介绍=qtb[1]
		else
	    	self.状态特效[名称].小图标=引擎.场景.资源:载入('wzife.wd3',"网易WDF动画",2844166683)
	    	-- self.状态特效[名称].介绍=名称.."这个技能暂时没有添加提示请截图给管理员"
		end
		self.状态特效[名称].回合=回合
		if 层数 then
		    self.状态特效[名称].层数=层数
		end
		if 颜色 then
		    self.状态特效[名称].颜色=颜色
		end
		if 负面状态 then
		    self.状态特效[名称].负面状态=负面状态
		end

		if not self:透明状态("状态_"..名称1) and not self:无需状态(名称1) then
			-- if 引擎.场景.特效缓存["状态_"..名称1] == nil then
			-- 	引擎.场景.特效缓存["状态_"..名称1] = 引擎.场景:载入特效("状态_"..名称1,self:取txz(名称))
			-- end
			self.状态特效[名称].动画=引擎.场景:载入特效("状态_"..名称1,self:取txz(名称))
			if 名称1=="盾气_我方" then
				self.状态特效[名称].动画:置翻转(true)
			end
			--self.状态特效[名称].动画= DeepCopy(引擎.场景.特效缓存["状态_"..名称1])
			--self.状态特效[名称].动画.当前帧 = 0
		end

		if 名称=="护盾" and self.状态特效["铜头铁臂"]~=nil then
			if self.状态特效["铜头铁臂"].颜色=="青" then
			    self.状态特效["护盾"].动画:置颜色(0xFF00FFFF)--青色
		    elseif self.状态特效["铜头铁臂"].颜色=="红" then
		    	self.状态特效["护盾"].动画:置颜色(0xFFFF1111)--红色
			end
		elseif 名称=="炼魂" then
			self.状态特效["炼魂"].动画:置高亮模式(0xFF000FFF) --蓝 0xFF03A89E  0xFF00FFFF
   --      elseif 名称=="雷怒霆激" then
   --      	self.分身类型=1
			-- self.分身显示xy={}
			-- self.分身显示xy.x,self.分身显示xy.y=self.显示xy.x,self.显示xy.y
   --      	self.分身类型1=1
			-- self.分身显示xy1={}
			-- self.分身显示xy1.x,self.分身显示xy1.y=self.显示xy.x,self.显示xy.y
			-- self.分身计时 = os.time()
			-- self.分身开关=true
	    end
	end
end

function 战斗单位类:释放()
	self.动画:释放()
	if #self.攻击特效>0 then
		for i=1,#self.攻击特效 do
			self.攻击特效[i]:释放()
		end
	end
	if #self.法术特效>0 then
		for i=1,#self.法术特效 do
			self.法术特效[i]:释放()
		end
	end
	if #self.状态特效>0 then
		for i=1,#self.状态特效 do
			self.状态特效[i].动画:释放()
		end
	end
end

function 战斗单位类:添加攻击特效(名称,加速)
	local 名称1=名称
	if not self:无需物理特效(名称) then
		local txz = self:取txz(名称)
		if 战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方] ~= nil and  战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方] .招式特效 ~= nil and  战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方] .招式特效[名称]~= nil and 战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方] .招式特效[名称] == true  then
			local lssj = 引擎.特效库("新_"..名称)
			if lssj[1] ~= nil and lssj[2] ~= nil then
				名称1 = "新_"..名称1
			end
		end
			if 战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方] ~= nil and 战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方].单位类型=="角色" and 战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方].数据.锦衣[5]~=nil and 名称1~="法术暴击"  then
				self.攻击特效[#self.攻击特效+1]=引擎.场景:载入特效(名称1,txz,nil,战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方].单位类型=="角色" and 战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方].数据.锦衣[5].名称)
			end
		self.攻击特效[#self.攻击特效+1]=引擎.场景:载入特效(名称1,txz)
		-- self.攻击特效[#self.攻击特效].cp,self.攻击特效[#self.攻击特效].py =self:法术前置(名称)
		self.攻击特效[#self.攻击特效]:置提速(txz)
		self.攻击特效[#self.攻击特效].当前帧 = 0
		-- self.攻击特效[#self.攻击特效].加速 = 1
		if Fight特效加速[名称1] then
		    if Fight特效加速[名称1].加速 then
		        self.攻击特效[#self.攻击特效].加速=Fight特效加速[名称1].加速
		    end
		end
	end
end

function 战斗单位类:添加法术特效(名称,加速)
	local 名称1=名称
	if 名称1=="干将莫邪"  or 名称1=="混元伞"  or 名称1=="断穹巨剑"
	or 名称1=="风舞心经" or 名称1=="赤焰"  or 名称1=="鸿渐于陆" or 名称1=="铜头铁臂" then
		if self.敌我==1 then
			名称1=名称1.."_我方"
		else
			名称1=名称1.."_敌方"
		end
	end
	if 名称=="鲲鹏出场" then
	    战斗类.背景状态 = 1
	end
	if not self:无需法术特效(名称) then
		local txz = self:取txz(名称)
		if 战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方] ~= nil and  战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方].招式特效 ~= nil and  战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方].招式特效[名称]~= nil and 战斗类.战斗单位[ljcs][战斗类.战斗流程[1].攻击方].招式特效[名称] == true  then
			local lssj = 引擎.特效库("新_"..名称)
			if lssj[1] ~= nil and lssj[2] ~= nil then
				名称1 = "新_"..名称1
				txz = 1.5
			end
		end
		self.法术特效[#self.法术特效+1]=引擎.场景:载入特效(名称1,txz)
		self.法术特效[#self.法术特效].附加y=0
		if Fight特效加速[名称1] then
		    self.法术特效[#self.法术特效].附加y=Fight特效加速[名称1].附加y or 0
		    if Fight特效加速[名称1].加速 then
		        self.法术特效[#self.法术特效].加速=Fight特效加速[名称1].加速
		    end
		end
	else
		战斗类.掉血流程=nil
	end
end

function 战斗单位类:加载特效(名称)
	local txz=self:取txz(名称)
	local 名称1=名称
	local cp = 引擎.场景:载入特效(名称1,txz,不显示)
	txz = txz + (txz*(tp.攻击速度/30))
	cp:置提速(txz)
	return cp
 --return 引擎.场景:载入特效(名称,self:取txz(名称))
end

function 战斗单位类:换方向(方向)
	self.动画:置方向(方向,self.动作)
end

function 战斗单位类:取当前帧()
	return self.动画:取当前帧(self.动作)
end

function 战斗单位类:取结束帧()
	return self.动画:取结束帧(self.动作)
end

function 战斗单位类:取开始帧()
	return self.动画:取开始帧(self.动作)
end

function 战斗单位类:取间隔()
	return self.动画.动画[self.动作]:取间隔()
end

function 战斗单位类:取中间()
	return self.动画.动画[self.动作]:取中间()
end

function 战斗单位类:无需状态(效果)
	if skill无需状态[效果] then
	    return true
	end
	return false
end

function 战斗单位类:透明状态(效果)
	if 效果=="状态_金刚护法"  or 效果=="状态_逆鳞"  or 效果=="状态_雷怒霆激" then
		return true
	end
	return false
end

function 战斗单位类:无需物理特效(效果)
	if skill无需物理[效果] then
	    return true
	end
	return false
end

function 战斗单位类:无需法术特效(效果)
	if skill无需法术[效果] then
	    return true
	end
	return false
end

function 战斗单位类:回合结束重置()
	self.攻击次数 = 0
	if self.初始方向 ~= self.方向 then
		self.方向 = self.初始方向
		self.动画:置方向(self.初始方向,self.动作)
	end
end

function 战斗单位类:施法前掉血(结尾气血)
	if self.结尾掉血==nil then
		self.结尾掉血=结尾气血
	end
end

function 战斗单位类:换动作(动作,复原,更新,结尾气血,挨打方死亡)
	if 动作 == "攻击" then
		self.攻击次数 = self.攻击次数 + 1 --这些都要改的
		if self.攻击次数 == 2 then
			动作 = "攻击2"
		end
		self.动画:置帧率(动作,0.1)
	end
	self.动作=动作
	self.动画:置方向(self.方向,self.动作)

	self.动作复原=复原
	self.停止更新=更新
	if self.结尾掉血==nil then
		self.结尾掉血=结尾气血
	end
	local 临时模型=self.数据.模型
	if self.数据.类型=="角色" or self.数据.类型=="系统角色" then
		if self.数据.武器~=nil and 引擎.场景~=nil then
			if self.数据.武器.名称 == "龙鸣寒水" or self.数据.武器.名称 == "非攻" then
				local wq = "弓弩1"
				临时模型=临时模型.."_"..wq
			else
				local wq = 引擎.场景:取武器子类(self.数据.武器.子类)
				临时模型=临时模型.."_"..wq
			end
		end
	end
	if self.数据.变身数据~=nil then
		临时模型=self.数据.变身数据
	end
	local 临时音乐=引擎.取音效(临时模型)
	if 临时音乐.攻击 ~= nil then
		临时音乐.攻击2 = 临时音乐.攻击
	end
	if 临时音乐~=nil and 临时音乐[动作]~=nil then
		--战斗类:音效类(临时音乐[动作],临时音乐.资源,动作)
		tp:游戏音效类(临时音乐[动作],临时音乐.资源,动作)
	end
end

function 战斗单位类:设置飞镖(xy,方向,伤害,死亡,名称)
	self.飞镖数据={x=xy.x,y=xy.y,伤害=伤害,死亡=死亡}
	self.飞镖动画=引擎.场景:载入特效(名称,self:取txz(名称))--引擎.场景.资源:载入('addon.wdf',"网易WDF动画",0x494DC152) --引擎.场景:载入特效("飞镖",self:取txz("飞镖"))
	--self.飞镖动画:置颜色(ARGB(255,255,255,250))
	self.飞镖xy={x=xy.x,y=xy.y,伤害=伤害,死亡=死亡}
	self.飞镖动画:置方向(角度算八方向(取两点角度(生成XY(xy.x,xy.y),生成XY(self.显示xy.x,self.显示xy.y))))
	self.飞镖开关=true
end

function 战斗单位类:设置弓弩(xy)
	self.弓弩动画=引擎.场景:载入特效("弓弩1",self:取txz("弓弩1"))
	self.弓弩xy={x=xy.x,y=xy.y-40} --
	self.弓弩动画:置方向(角度算八方向(取两点角度(生成XY(xy.x,xy.y),生成XY(self.显示xy.x,self.显示xy.y))))
	self.弓弩开关=true
end

function 战斗单位类:开启转圈()
	self.转圈开关=true
end

function 战斗单位类:关闭转圈()
	self.转圈开关=false
end

-- function 战斗单位类:转圈处理()
-- 	self.初始方向=self.初始方向+0.5
-- 	if self.初始方向>=4 then self.初始方向=0 end
-- 	self.方向=self.初始方向
-- 	self.动画:置方向(self.方向,"待战")
-- 	-- self:换动作("待战")
-- end
function 战斗单位类:转圈处理()
	self.实转圈time=self.实转圈time+0.5
	if self.实转圈time >= 1 then
		self.实转圈time=1
		self.实转圈方向=self.实转圈方向+self.实转圈time
		self.实转圈time=0
	end
	if self.实转圈方向>=4 then self.实转圈方向=0 end
	self.方向=self.实转圈方向
	self.动画:置方向(self.方向,"待战")
end

function 战斗单位类:开启击退(死亡,x,y)
	if self.模型=="木桩" then
	    self.击退开关=false
	    self.物理抖动开关 = false
	    if 死亡~=nil then
	    	self.是否显示=false
	    end
	    return
	end
	if x==nil or y ==nil or x==self.显示xy.x then
	    self.斜率 = 0.1
	else
		self.斜率 = (y-self.显示xy.y)/(x-self.显示xy.x)
	end
	self.斜率=(string.format("%.2f", self.斜率))+0 --保留两位小数


    self.击退开关=true
	self.击退延迟=true
	--法术抖动
	self.法术抖动计时 = 0
	self.抖动延时 = nil
	-- self.受击法术名称 = nil
	self.法术抖动坐标 = {x =0,y =0}
	self.法术抖动开关 = nil
	--物理抖动
	self.物理抖动开关 = false
	--物理抖动
	self.偏移类型=1
	-- self.停止偏移=30
	self.死亡参数=死亡
	-- if self.死亡参数==1 then
	-- 	self.停止偏移=30
	-- else
		self.停止偏移=35

	-- end
	-- if self.动作~="防御" then
	-- self.动作="被击中"
	--self.动画.按帧更新=true
	--end
	--self.动画:换方向(self.动作,self.初始方向)
	self.击退坐标={}
	self.击退坐标.x,self.击退坐标.y=self.显示xy.x,self.显示xy.y
	if self.敌我==2 then
		self.偏移坐标=-1
		if self.死亡参数~=nil then --死亡的时候
			self.偏移坐标=-0.4
		end
	else
		self.偏移坐标=1
		if self.死亡参数~=nil then --死亡的时候
			self.偏移坐标=0.4
		end
	end
end

function 战斗单位类:击退处理()
	if self.偏移类型==1 then
		self.显示xy.x,self.显示xy.y=self.显示xy.x+self.偏移坐标,self.显示xy.y+self.偏移坐标
		if(取两点距离(生成XY(self.击退坐标.x,self.击退坐标.y),生成XY(self.显示xy.x,self.显示xy.y))>self.停止偏移)then
			self.偏移类型=2
			if self.死亡参数==1 then
				self:死亡处理()
				self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
				self.偏移类型=0
				self.击退开关=false
			else
				-- self.动作="待战"
				--self:换动作(self.动作,nil,nil)
				if self.敌我==2 then
					self.偏移坐标=-1
					if self.死亡参数~=0 then
						self.偏移坐标=-2.5
					end
				else
					self.偏移坐标=1
					if self.死亡参数~=0 then
						self.偏移坐标=2.5
					end
				end
				self.偏移类型=2
			end
		end
	elseif self.偏移类型==2 then
		self.显示xy.x,self.显示xy.y=self.显示xy.x-self.偏移坐标,self.显示xy.y-self.偏移坐标
		if(取两点距离(生成XY(self.击退坐标.x,self.击退坐标.y),生成XY(self.显示xy.x,self.显示xy.y))<=10)then
			self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
			self.偏移类型=0
			self.击退开关=false
			-- self.动画.按帧更新=false
			self.显示xy.x,self.显示xy.y=self.击退坐标.x,self.击退坐标.y
			if self.死亡参数==2  then
				self:死亡处理()
			else
				self.动作="待战"
				self:换动作(self.动作,nil,nil)
			end
		end
	end
end

function 战斗单位类:死亡处理()
	-- self.动画:置帧率(self.动作,0.1)
	self.死亡开关=true
	if self.死亡参数==1 then
		self.撞击次数=0
		self.击飞开关=true
		self.击飞时间=引擎.取游戏时间()
		self.速度x,self.速度y=0,0
		-- self.动画.按帧更新=true
		if not self.斜率 then
		    self.斜率=0.1
		end
		if self.敌我==2 then --敌方
			if self.斜率<0.74 then --往左
				self.速度x = -16
				self.速度y = self.斜率*self.速度x
			else--往上
				self.速度y = -16
				if self.斜率==0 then
				    self.斜率=6.7
				end
				self.速度x = -16/self.斜率
			end
		else
			if self.斜率<0.74 then --往右
				self.速度x = 16
				self.速度y = self.斜率*self.速度x
			else--往下
				self.速度y = 16
				if self.斜率==0 then
				    self.斜率=6.7
				end
				self.速度x = 16/self.斜率
			end
		end
		local 临时音乐=引擎.取音效("击飞")
		if 临时音乐~=nil and 临时音乐.文件~=nil then
			tp:游戏音效类(临时音乐.文件,临时音乐.资源)
		end
	elseif self.死亡参数==2 then
		self.动作="死亡"
		-- self.动画:置帧率(self.动作,0.1)
		local 临时模型=self.模型
	    if self.数据.变身数据~=nil then
	      临时模型=self.数据.变身数据
	    end
		local 临时音乐=引擎.取音效(临时模型)
		if 临时音乐~=nil and 临时音乐[self.动作]~=nil then
			tp:游戏音效类(临时音乐["死亡"],临时音乐.资源)
		end
		self.停止更新=false
		self:换方向(self.方向)
		self.倒地开关=true
		self.停止更新=true
	end
end

function 战斗单位类:击飞处理()
	-- if self.速度y>16 then
	--     self.速度y=16
 --    elseif self.速度y<16 then
	--     self.速度y=16
	-- end
	self.显示xy.x,self.显示xy.y=self.显示xy.x+self.速度x,self.显示xy.y+self.速度y
	if 引擎.取游戏时间()-self.击飞时间>=0.005 then
		self.方向=self.方向-0.1
		if self.方向<0 then self.方向=3 end
		self.击飞时间=引擎.取游戏时间()
		self:换方向(self.方向)
	end
	if self.显示xy.x<10 then
		self.速度x = - self.速度x-- * 1.5
	    self.撞击次数 = self.撞击次数 + 1
	end
	if self.显示xy.y<10 then
		self.速度y = - self.速度y --* 1.5
	    self.撞击次数 = self.撞击次数 + 1
	end
	if self.显示xy.x>全局游戏宽度-10 then
		self.速度x = - self.速度x --* 2
	    self.撞击次数 = self.撞击次数 + 1
	end
	if self.显示xy.y>全局游戏高度-10 then
		self.速度y = - self.速度y-- * 2
	    self.撞击次数 = self.撞击次数 + 1
	end
	if self.撞击次数 >=3 then
		self.击飞开关=false
		self.是否显示=false
	end
end

function 战斗单位类:死亡处理1(死亡,x,y)
	self.死亡参数=死亡
	if x==nil or y ==nil or x==self.显示xy.x then
	    self.斜率 = 0.1
	else
		self.斜率 = (y-self.显示xy.y)/(x-self.显示xy.x)
	end
	self.斜率=(string.format("%.2f", self.斜率))+0 --保留两位小数
	self:死亡处理()
end

function 战斗单位类:倒地处理()
	if self.动画:取当前帧(self.动作)==self.动画:取结束帧(self.动作) then
		self.动作="死亡"
		self.停止更新=true
		self.倒地开关=false
	end
end

function 战斗单位类:返回事件()
	if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>=20 then
		self.攻击次数 = 0
		self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),27)
		-- if not self.方向开关 then
		-- 	self.动作="返回"
			-- self.动画:置帧率(self.动作,0.02)
			self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
			self:换方向(角度算四方向(self.角度))
		-- 	self.方向开关=true
		-- end
		if self.超级偷袭 then --超级技能2.18
			self.偷袭动画.动画.当前帧=1
			self.偷袭动画.显示=true
			self.偷袭动画.显示2=true
			self.偷袭动画.xy.x,self.偷袭动画.xy.y=self.显示xy.x,self.显示xy.y
			self.显示xy.x,self.显示xy.y=self.移动坐标.x,self.移动坐标.y
		else
			self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
		end
		-- self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
	else
		self.返回开关=false
		self.动作="待战"
		self:换方向(self.初始方向)
		self.显示xy.x,self.显示xy.y=self.初始xy.x,self.初始xy.y
		-- self.方向开关=false
	end
end



function 战斗单位类:移动事件() --后期有问题再重写吧
	if self.武器子类 ~= nil and self.武器子类 == 14 and not self.保护 then
		self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))
		self.方向=角度算四方向(self.角度)
		self.动画:置方向(角度算四方向(self.角度),self.动作)
		self.移动开关=false
		self.友伤=false
		return
	end

	if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>15 then
		if self.攻击次数>0 then
		    self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),6) --20
		else
		    self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),27) --20
		end
		if not self.方向开关 then
			self.动作="跑去"
			self.动画:置帧率(self.动作,0.04)
			self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
			self.方向=角度算四方向(self.角度)
			self.动画:置方向(self.方向,self.动作)
			self.方向开关=true
		end
		if self.超级偷袭 then --超级技能2.18 改
			self.偷袭动画.动画.当前帧=1
			self.偷袭动画.显示=true
			self.偷袭动画.xy.x,self.偷袭动画.xy.y=self.显示xy.x,self.显示xy.y
			self.偷袭动画.xy2.x,self.偷袭动画.xy2.y=self.显示xy.x,self.显示xy.y
			self.显示xy.x,self.显示xy.y=self.移动坐标.x,self.移动坐标.y
		else
			self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
		end
		-- self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
	else
		-- self.方向=2
		self.方向=self.初始方向--角度算四方向(self.角度)
		if self.超级偷袭 then
			if self.方向 == 2 then
				self.方向 = 0
			elseif self.方向 == 0 then
				self.方向 = 2
			end
		end
		self.动画:置方向(self.方向,self.动作)
		-- self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))
		-- self.方向=角度算四方向(self.角度)
		-- self.动画:置方向(self.方向,self.动作)
		self.移动开关=false
		self.移动坐标 = {}
        self.方向开关=false
	end
end

function 战斗单位类:保护事件()
  if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>=20 then
    self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),10)
    self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
    self.方向=角度算四方向(self.角度)
    self.动画:置方向(角度算四方向(self.角度),self.动作)
    self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
  else
    self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))
    self.方向=角度算四方向(self.角度)
    self.动画:置方向(角度算四方向(self.角度),self.动作)
    self.移动开关=false
    self.保护=false
    self.移动坐标 = {}
  end
end

function 战斗单位类:友伤事件()
  if 取两点距离(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>=100 then
    self.移动距离=取移动坐标(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),6)
    if not self.方向开关 then
		self.动作="跑去"
		self.动画:置帧率(self.动作,0.04)
	    self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动距离.x,self.移动距离.y))
	    self.方向=角度算四方向(self.角度)
	    self.动画:置方向(角度算四方向(self.角度),self.动作)
	    self.方向开关=true
	end
    self.显示xy.x,self.显示xy.y=self.移动距离.x,self.移动距离.y
  else
    self.角度=取两点角度(生成XY(self.显示xy.x,self.显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))
    self.方向=角度算四方向(self.角度)
    self.动画:置方向(角度算四方向(self.角度),self.动作)
    self.移动开关=false
    self.友伤=false
    self.移动坐标 = {}
    self.方向开关=false
  end
end

function 战斗单位类:开启躲避()
	self.躲避类型=1
	self.停止躲避=75
	self.躲避开关=true
	self.躲避数量=0
	self.躲避xy={}
	self.躲避xy.x,self.躲避xy.y=self.显示xy.x,self.显示xy.y
end

function 战斗单位类:躲避事件()
	if self.躲避类型==1 then
		self.显示xy.x,self.显示xy.y=self.显示xy.x+self.躲避坐标,self.显示xy.y+self.躲避坐标
		self.躲避数量=math.floor(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))/15)
		if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))>=self.停止躲避)then
			self.躲避类型=2
		end
	elseif self.躲避类型==2 then
		self.显示xy.x,self.显示xy.y=self.显示xy.x-self.躲避坐标,self.显示xy.y-self.躲避坐标
		self.躲避数量=math.floor(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))/15)
		if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.显示xy.x,self.显示xy.y))<=5)then
			self.显示xy.x,self.显示xy.y=self.初始xy.x,self.初始xy.y
			self.躲避类型=0
			self.躲避开关=false
			--self.掉血开关=false
		end
	end
	self:躲避处理()
end

function 战斗单位类:躲避处理()
	for n=1,self.躲避数量 do
		-- self.躲避动画:显示(self.躲避xy.x+self.躲避参数*n,self.躲避xy.y+self.躲避参数*n,self.动作)
		self.动画:显示(self.躲避xy.x+self.躲避参数*n,self.躲避xy.y+self.躲避参数*n,self.动作)
	end
end

function 战斗单位类:是否选中(x,y)
	if self.动画.初始化结束 == nil then
		return
	end
	return self.动画.动画[self.动作]:是否选中(x,y)
end

function 战斗单位类:置高亮()
	self.动画.动画[self.动作]:置高亮()
	if self.动画.武器~=nil and self.动画.武器[self.动作]~=nil then
		self.动画.武器[self.动作]:置高亮()
	end
end

function 战斗单位类:取消高亮()
	self.动画.动画[self.动作]:取消高亮()
	if self.动画.武器~=nil and self.动画.武器[self.动作]~=nil  then
		self.动画.武器[self.动作]:取消高亮()
	end
end

function 战斗单位类:取状态()
	if self.移动开关 or self.击退开关 or self.击飞开关 or self.倒地开关 or self.返回开关 or self.躲避开关 or self.飞镖开关 or self.弓弩开关 or self.掉血开关 then
		return false
	else
		return true
	end
end

-- function 战斗单位类:取施法完毕()
-- 	if self.动作=="施法" then
-- 		if self:取当前帧() >= math.floor(self:取结束帧()*0.8) then
-- 			return true
-- 		else
-- 			return false
-- 		end
-- 	else
-- 	    return  true
-- 	end
-- end

function 战斗单位类:更新(dt,x,y)
	if self.初始化结束 == nil then
		return
	end

	if self.人物头像 ~= nil then
	 self.人物头像:更新(x,y)
	 if self.人物头像:事件判断() then
			if self.状态信息 then
				self.状态信息 = false
			else
				self.状态信息 = true
			end
		end
		-- if self.状背景:是否选中(x,y) then
		-- 	if next(self.状态特效) ~= nil then
		-- 		引擎.场景.提示:战斗状态(x,y,self.状态特效)
		-- 	end
		-- end
	end
	if self.鼠标跟随 then
		self.显示xy.x,self.显示xy.y=鼠标.x,鼠标.y
	end
	if self.显示xy==nil then
		self.显示xy={}
		self.显示xy.x,self.显示xy.y=鼠标.x,鼠标.y
	end
	-- self.x,self.y=self.显示xy.x,self.显示xy.y
	if self.动作=="待战" or self.动作=="倒地" then
		if self.状态特效.疯狂 or self.状态特效.反间之计 or self.状态特效.发瘟匣 or self.状态特效.落魄符 then
			if self.抖动数据.开关==false then
				self.抖动数据.开关=true
				self.抖动数据.进程=1
				self.抖动数据.x,self.抖动数据.y=-0.2,-0.2
			else
				self.抖动数据.进程=self.抖动数据.进程+1
				if self.抖动数据.进程<=5 then
					self.抖动数据.x,self.抖动数据.y=self.抖动数据.进程-self.抖动数据.进程*2,self.抖动数据.进程-self.抖动数据.进程*2
				else
					self.抖动数据.x,self.抖动数据.y=self.抖动数据.x+0.2,self.抖动数据.y+0.2
					if self.抖动数据.进程>=12 then
						self.抖动数据.进程=0
					end
				end
			end
		elseif self.抖动数据.开关 then
			self.抖动数据.进程=0
			self.抖动数据.x,self.抖动数据.y=0,0
			self.抖动数据.开关=false
		end
	end
	if self.停止更新 and self.动画:取当前帧(self.动作)>=self.动画:取结束帧(self.动作) then
		if self.动作=="死亡" and self.倒地开关 then
			self.倒地开关=false
		end
	else
		self.动画:更新(dt+(tp.攻击速度/100),self.动作)
		-- if self.动作=="攻击" then
		-- end
		-- self.更新次数=self.更新次数+1
	end
	if self.动画:取当前帧(self.动作)>=self.动画:取结束帧(self.动作) then
		-- if self.添加状态~=nil and not self:无需特效(self.添加状态) then
		-- 	local 状态参数=self:状态前置(self.添加状态)
		-- 	self.状态特效[self.添加状态]=状态参数
		-- 	self.状态特效[self.添加状态].动画=引擎.场景:载入特效("状态_"..self.添加状态,self:取txz(self.添加状态))
		-- 	self.添加状态=nil
		-- end
		-- if self.取消状态~=nil then
		-- 	self.状态特效[self.取消状态]=nil
		-- 	self.取消状态=nil
		-- end
		if self.结尾掉血~=nil then
			self:设置掉血(self.结尾掉血,1)
			self.结尾掉血=nil
		end
	end
	if self.护盾~= nil and self.护盾 > 0 and self.状态特效~=nil and self.状态特效["护盾"] == nil and self.护盾开关 == false then
		self.护盾开关 = true
		self:增加状态("护盾")
	end
	if self.护盾~= nil and self.护盾 <= 0 and self.状态特效~=nil and self.状态特效["护盾"] ~= nil and self.护盾开关 == true then
		self.护盾开关 = false
		self.状态特效["护盾"] = nil
	end
	if self.敌我==1 and self.单位id == 引擎.场景.队伍[1].数字id and self.丸子进化 ~= nil and self.丸子time.开关 then
		self.丸子time.开关=false
		self:增加丸子入场(self.丸子进化)
	end
	if self.法术抖动开关~=nil then
		self:法术受击抖动(self.法术抖动开关)
	elseif self.物理抖动开关 then
		self:物理受击抖动()
	-- else
	-- 	self.法术抖动计时 = 0
	-- 	self.抖动延时 = nil
	-- 	-- self.受击法术名称 = nil
	-- 	self.法术抖动坐标 = {x =0,y =0}
	end
	if self.移动开关 then
		self:移动事件()
	end
	if self.保护 then
        self:保护事件()
	end
	if self.友伤 then
		self:友伤事件()
	end
	if self.击退开关 then
		self:击退处理()
	end
	if self.转圈开关 then
		self:转圈处理()
	end
	if self.飞镖开关 then
		self.飞镖动画:更新(dt)
		self.飞镖xy=取移动坐标(self.飞镖xy,self.显示xy,10)
		if 取两点距离(self.飞镖xy,self.显示xy)<=20 then
			self:设置掉血(self.飞镖数据.伤害,1)
			self:换动作("挨打",nil,true)
			self:开启击退(self.飞镖数据.死亡)
			self.飞镖开关=nil
			--self.飞镖动画:释放()
			self.飞镖动画=nil
		end
	end
	if self.弓弩开关 then
		self.弓弩动画:更新(dt)
		self.弓弩xy=取移动坐标(self.弓弩xy,self.显示xy,10)
		if 取两点距离(self.弓弩xy,self.显示xy)<=20 then
			self.弓弩开关=nil
			--self.弓弩动画:释放()
			self.弓弩动画=nil
		end
	end
	if self.溅射开关 then
		self:设置掉血(self.溅射数据.伤害,1)
		-- self:换动作("挨打",nil,true)
		self:开启击退(self.溅射数据.死亡)
		self.溅射开关=nil
	end
	if self.返回开关 then self:返回事件() end
	if self.击飞开关 then self:击飞处理() end
	if self.躲避开关 then self:躲避事件() end
	if self.动作复原  then
		if self.动画:取当前帧(self.动作)==self.动画:取结束帧(self.动作) then
			if self.动作=="攻击" then
				self.动画:置帧率("攻击",0.1)
			end
			self:换动作("待战")
		end
	end
	if self.抓捕开关 then
		if self.捕捉暂停~=nil and 时间-self.捕捉暂停>=1 then
			self.捕捉暂停=nil
			self.抓捕动画:置方向(0)
			-- self.抓捕开关=false
			if self.抓捕成功 then
				战斗类.战斗单位[ljcs][self.抓捕编号]:设置抓捕路径({x=self.显示xy.x,y=self.显示xy.y},self.抓捕成功)
			end
		end
		self.抓捕动画:更新(dt)
		-- self.抓捕动画:显示(self.抓捕xy.x,self.抓捕xy.y)
		-- 名称显示(self.抓捕名称,self.抓捕xy)
		if self.抓捕流程==1 then
			-- self.抓捕xy.x,self.抓捕xy.y=self.抓捕xy.x-2,self.抓捕xy.y-2
			self.抓捕xy=取移动坐标(self.抓捕xy,self.抓捕目标,3)
			if 取两点距离(self.抓捕xy,self.抓捕目标)<=40 then
			self.抓捕流程=2
			self.捕捉暂停=时间
			end
		elseif self.抓捕流程==2 and self.捕捉暂停==nil then
			-- self.抓捕xy.x,self.抓捕xy.y=self.抓捕xy.x+2,self.抓捕xy.y+2
			self.抓捕xy=取移动坐标(self.抓捕xy,生成XY(self.显示xy.x,self.显示xy.y),3)
			if 取两点距离(self.抓捕xy,self.显示xy)<=10 then
				--self.抓捕动画:释放()
				self.抓捕动画=nil
				self.抓捕开关=false
			end
		end
	end
	if self.抓捕移动~=nil then
		-- self.显示xy.x,self.显示xy.y=self.显示xy.x+2,self.显示xy.y+2
		self.显示xy=取移动坐标(self.显示xy,self.抓捕移动,3)
		if 取两点距离(self.抓捕移动,self.显示xy)<=30 then
			self.是否显示=false
			self.显示xy.x,self.显示xy.y=1500,1500
			self.抓捕移动=nil
		end
	end
	if self.战斗提示 and self.战斗提示.开关 and os.time() >= self.战斗提示.停止时间 then
		self.战斗提示.开关 = false
	end
end

function 战斗单位类:换动作1(动作,复原,更新,结尾气血)
	self.动作=动作
	self.动画:置方向(self.方向,self.动作)
	-- self.动作复原=复原
	self.停止更新=更新
	-- if self.结尾掉血==nil then
	-- 	self.结尾掉血=结尾气血
	-- end
end

function 战斗单位类:抖动挨打音效()
	local 临时模型=self.数据.模型
	if self.数据.类型=="角色" or self.数据.类型=="系统角色" then
		if self.数据.武器~=nil and 引擎.场景~=nil then
			if self.数据.武器.名称 == "龙鸣寒水" or self.数据.武器.名称 == "非攻" then
				local wq = "弓弩1"
				临时模型=临时模型.."_"..wq
			else
				local wq = 引擎.场景:取武器子类(self.数据.武器.子类)
				临时模型=临时模型.."_"..wq
			end
		end
	end
	if self.数据.变身数据~=nil then
		临时模型=self.数据.变身数据
	end
	local 临时音乐=引擎.取音效(临时模型)
	if 临时音乐~=nil and 临时音乐["挨打"]~=nil then
		--战斗类:音效类(临时音乐["挨打"],临时音乐.资源,"挨打")
		tp:游戏音效类(临时音乐["挨打"],临时音乐.资源,"挨打")
	end
end

function 战斗单位类:物理受击抖动()
	if self.模型=="木桩" then
	    self.物理抖动开关 = false
	    return
	end
	if self.物理抖动开关 then
		self.法术抖动计时 = self.法术抖动计时 + 0.18
		if math.floor(self.法术抖动计时)%2 == 0 then
		    self.法术抖动坐标 = {x = 1,y = 1}
		else
			self.法术抖动坐标 = {x = -1,y = -1}
		end
		self:换动作1("挨打",nil,true)
	end
end

function 战斗单位类:法术受击抖动(名称)
	if self.模型=="木桩" then
		self.法术抖动开关 = nil
		return
	end
	if self.法术抖动开关 then
		if not self.抖动延时 then --还是要区分技能开始抖动的时间
			self.抖动延时 = skill法攻[self.法术抖动开关]
		end
		if self.抖动延时 then
			self.抖动延时 = self.抖动延时 - 1
			if self.抖动延时<0 then --开始抖动的时间
				self.法术抖动计时 = self.法术抖动计时 + 0.23
				if math.floor(self.法术抖动计时)%2 == 0 then
				    self.法术抖动坐标 = {x = 1,y = 1}
				else
					self.法术抖动坐标 = {x = -1,y = -1}
				end
			-- else
				-- if self.抖动延时<0 then --开始抖动的时候
					self:换动作1("挨打",nil,true)

			end
		end
	end
end

function 战斗单位类:设置溅射(xy,方向,伤害,死亡)
	self.溅射数据={伤害=伤害,死亡=死亡}
	self.溅射开关=true
end

function 战斗单位类:设置抓捕路径(目标,成功)
	 self:换动作("跑去")
	 self.抓捕移动=目标
end

function 战斗单位类:设置抓捕动画(目标,模型,成功,名称)
	self.抓捕资源=引擎.取模型(模型)
	self.抓捕动画=引擎.场景.资源:载入(self.抓捕资源[3],"网易WDF动画",self.抓捕资源[2])
	self.抓捕动画:置方向(2)
	self.抓捕动画:取消高亮()
	self.抓捕流程=1
	self.抓捕成功=成功
	self.抓捕目标={x=战斗类.战斗单位[ljcs][目标].显示xy.x,y=战斗类.战斗单位[ljcs][目标].显示xy.y}
	self.抓捕xy={x=self.显示xy.x,y=self.显示xy.y}
	self.抓捕开关=true
	self.抓捕编号=目标
	self.抓捕名称=名称
end

function 战斗单位类:取消变相(dt,x,y)
	self.动画.动画["待战"]:取消高亮()
	--self.动画.动画[self.动作]:置颜色()
	if self.动画.武器~= nil then
		self.动画.武器["待战"]:取消高亮()
		--self.动画.武器[self.动作]:置颜色()
	end
end
function 战斗单位类:设置提示(内容)
	self.战斗提示.开关 = true
	self.战斗提示.内容 = 内容
	self.战斗提示.停止时间 = os.time() + 2
end

function 战斗单位类:显示(dt,x,y)
	if self.初始化结束 == nil then
		return
	end
	if self.是否显示==false then return  end
	if self.飞镖开关 then
		self.飞镖动画:显示(self.飞镖xy.x,self.飞镖xy.y)
	end
	if self.弓弩开关 then
		self.弓弩动画:显示(self.弓弩xy.x,self.弓弩xy.y)
	end

    if self.共生 then
        -- tp.共生特效:更新(dt)
		tp.共生特效:显示(self.显示xy.x,self.显示xy.y)
    end

	for i, v in pairs(self.状态特效) do
		if self.状态特效[i]~=nil then
			if self.状态特效[i].cp==false and self.状态特效[i].动画~=nil then
				if type(self.状态特效[i].动画) == "table" and self.状态特效[i].动画[1] and self.状态特效[i].动画[2] then
					for n=1,#self.状态特效[i].动画 do
						self.状态特效[i].动画[n]:更新(dt)
						self.状态特效[i].动画[n]:显示(self.显示xy.x+self.抖动数据.x+self.法术抖动坐标.x+self.状态特效[i].py[1],self.显示xy.y+self.抖动数据.y+self.状态特效[i].py[2]+ self.法术抖动坐标.y)
					end
				else
					if self.状态特效[i].负面状态 then
				    	-- tp[self.状态特效[i].负面状态]:更新(dt)
				    	tp[self.状态特效[i].负面状态]:显示(self.显示xy.x,self.显示xy.y-self.高度+10)
					end
			    	self.状态特效[i].动画:更新(dt)
					self.状态特效[i].动画:显示(self.显示xy.x+self.抖动数据.x+self.法术抖动坐标.x+self.状态特效[i].py[1],self.显示xy.y+self.抖动数据.y+self.状态特效[i].py[2]+ self.法术抖动坐标.y)
				end
			end
		end
	end
	--=========================超级技能(战斗单位类:显示)
	if self.丸子特效 ~= nil and self.丸子特效.精灵 ~= nil and self.丸子time.时间 - os.time() > 0 then
		if self.丸子特效:是否选中(x,y) then
			tp.提示:超级技能(x,y+20,nil,true,self.丸子进化)
		end
		self.丸子特效:显示(self.显示xy.x+self.抖动数据.x+self.法术抖动坐标.x-19,self.显示xy.y+self.抖动数据.y+ self.法术抖动坐标.y-143)
	end
	if self.偷袭动画.显示 then --超级技能2.18
		self.偷袭动画.动画:更新(dt*3)
		self.偷袭动画.动画:显示(self.偷袭动画.xy.x,self.偷袭动画.xy.y)
		if self.偷袭动画.动画:取当前帧(self.偷袭动画.动画)>=self.偷袭动画.动画:取结束帧(self.偷袭动画.动画) then
			self.偷袭动画.动画.当前帧=1
			self.偷袭动画.显示=false
		end
	end
	if self.偷袭动画.显示2 then
		self.偷袭动画.动画2:更新(dt)
		self.偷袭动画.动画2:显示(self.偷袭动画.xy2.x,self.偷袭动画.xy2.y)
		if self.偷袭动画.动画2:取当前帧(self.偷袭动画.动画2)>=self.偷袭动画.动画2:取结束帧(self.偷袭动画.动画2) then
			self.偷袭动画.动画2.当前帧=1
			self.偷袭动画.显示2=false
		end
    end


	if self.五行珠 then
		if self.五行珠==1 then
			-- tp.五行珠特效[1]:更新(dt)
			tp.五行珠特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度-10)
		elseif self.五行珠==2 then
			-- tp.五行珠特效[2]:更新(dt)
			tp.五行珠特效[2]:显示(self.显示xy.x,self.显示xy.y-self.高度-10)
		elseif self.五行珠==3 then
			-- tp.五行珠特效[3]:更新(dt)
			tp.五行珠特效[3]:显示(self.显示xy.x,self.显示xy.y-self.高度-10)
		elseif self.五行珠==4 then
			-- tp.五行珠特效[4]:更新(dt)
			tp.五行珠特效[4]:显示(self.显示xy.x,self.显示xy.y-self.高度-10)
		elseif self.五行珠==5 then
			-- tp.五行珠特效[5]:更新(dt)
			tp.五行珠特效[5]:显示(self.显示xy.x,self.显示xy.y-self.高度-10)
		elseif self.五行珠>=6 then
			-- tp.五行珠特效[6]:更新(dt)
			tp.五行珠特效[6]:显示(self.显示xy.x,self.显示xy.y-self.高度-10)
		end
	end

	-- if self.如意神通~=nil then
	-- 	-- tp.如意神通特效.精灵:置颜色(0xffff99ff)
	--     -- tp.如意神通特效:更新(dt)
	--     tp.如意神通特效:显示(self.显示xy.x-43,self.显示xy.y-self.高度-32 )
	-- end
	if self.法宝~=nil then
        -- tp.法宝特效:更新(dt)
		tp.法宝特效:显示(self.显示xy.x,self.显示xy.y-self.高度+50)
    end

	if self.状态特效["修罗隐身"] or self.状态特效["分身术"] or self.状态特效["楚楚可怜"] then
		self.动画.动画["待战"]:置颜色(1694498815)
		if self.动画.武器 ~= nil then
			self.动画.武器["待战"]:置颜色(1694498815)
		end
	end
	if (self.状态特效["金刚护法"]~=nil or self.状态特效["逆鳞"]~=nil) and self.状态特效["修罗隐身"]==nil and self.状态特效["分身术"]==nil then
		self.色相变身 = self.色相变身 + 1
		if self.色相变身 >= 30 then
			self.动画.动画["待战"]:取消高亮()
			if self.动画.武器~= nil then
				self.动画.武器["待战"]:取消高亮()
			end
			if self.色相变身 >= 60 then
				self.色相变身 = 0
			end
		else
			self.动画.动画["待战"]:置高亮模式(-10855936)
			if self.动画.武器 ~= nil then
				self.动画.武器["待战"]:置高亮模式(-10855936)
			end
		end
	end

	if self.状态特效["狂怒"]~=nil and self.状态特效["变身"]~=nil then
		self.状态特效["变身"].动画:置颜色(ARGB(255,205,0,0))
	end
	if self.逃跑开关 then
		self.动作="返回"
	end
	if (self.浮空高度 or 0) > 0 and self.死亡参数 == nil and self.逃跑开关 ~= true then
		if self.动作 ~= "挨打" then
			self.动作 = "挨打"

			self:换动作("挨打")
		end
		self.停止更新 = true
		self.浮空动画:更新(dt)
		self.浮空动画:显示(self.显示xy.x + self.抖动数据.x, self.显示xy.y + self.抖动数据.y + 20)
	end
	if self.躲避开关 then
	else
		if self.浮空开关 == false and self.浮空高度 > 0 then
			self.浮空下降 = self.浮空下降 + 1
			local jg = 2

			if self.浮空下降 > 0 and self.浮空下降 % jg == 0 then
				local jf = self.浮空下降 + 0.5 * self.浮空下降 * self.浮空下降 / (jg * jg)

				if self.浮空高度 < jf then
					jf = self.浮空高度
				end

				self.浮空高度 = self.浮空高度 - jf
			end

			if self.浮空高度 == 0 and self.死亡参数 == nil and self.逃跑开关 ~= true then
				self.停止更新 = false
				self.动作 = "待战"
			end
		end
		if not self.特殊浮空开关 and self.特殊浮空高度 > 0 then
		    self.特殊浮空高度 = 0
		end
		if not self.临时隐藏 then
		    if self.攻击对象 ~= nil and 战斗类.战斗单位[ljcs][self.攻击对象].浮空高度 ~= nil then
				self.动画:显示(self.显示xy.x + self.抖动数据.x + self.法术抖动坐标.x, self.显示xy.y + self.抖动数据.y - (战斗类.战斗单位[ljcs][self.攻击对象].浮空高度 or 0) + self.法术抖动坐标.y, self.动作)
			elseif self.行动对象 and 战斗类.战斗单位[ljcs][self.行动对象].特殊浮空高度 ~= nil then
				self.动画:显示(self.显示xy.x + self.抖动数据.x + self.法术抖动坐标.x, self.显示xy.y + self.抖动数据.y - (战斗类.战斗单位[ljcs][self.行动对象].特殊浮空高度 or 0) + self.法术抖动坐标.y, self.动作)
			else
				self.动画:显示(self.显示xy.x + self.抖动数据.x + self.法术抖动坐标.x, self.显示xy.y + self.抖动数据.y - (self.浮空高度 or 0) + self.法术抖动坐标.y, self.动作)
			end
		end
		-- self.动画:显示(self.显示xy.x+self.抖动数据.x + self.法术抖动坐标.x,self.显示xy.y+self.抖动数据.y+ self.法术抖动坐标.y,self.动作)
		-- if self.状态特效["雷怒霆激"]~=nil then
		-- 	if self.动作=="待战" then
		-- 		if os.time()-self.分身计时>=4 then
		-- 			if self.分身类型==1 then
		-- 				self.分身显示xy.x,self.分身显示xy.y=self.分身显示xy.x+1.5,self.分身显示xy.y+0.5
		-- 				if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.分身显示xy.x,self.分身显示xy.y))>=20)then
		-- 					self.分身类型=2
		-- 				end
		-- 			elseif self.分身类型==2 then
		-- 				self.分身显示xy.x,self.分身显示xy.y=self.分身显示xy.x-1.5,self.分身显示xy.y-0.5
		-- 				if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.分身显示xy.x,self.分身显示xy.y))<=3)then
		-- 					self.分身显示xy.x,self.分身显示xy.y=self.初始xy.x,self.初始xy.y
		-- 					self.分身类型=1
		-- 					self.分身计时 = os.time()
		-- 				end
		-- 			end
		-- 			if self.分身类型1==1 then
		-- 				self.分身显示xy1.x,self.分身显示xy1.y=self.分身显示xy1.x-1.5,self.分身显示xy1.y-0.5
		-- 				if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.分身显示xy1.x,self.分身显示xy1.y))>=20)then
		-- 					self.分身类型1=2
		-- 				end
		-- 			elseif self.分身类型1==2 then
		-- 				self.分身显示xy1.x,self.分身显示xy1.y=self.分身显示xy1.x+1.5,self.分身显示xy1.y+0.5
		-- 				if(取两点距离(生成XY(self.初始xy.x,self.初始xy.y),生成XY(self.分身显示xy1.x,self.分身显示xy1.y))<=3)then
		-- 					self.分身显示xy1.x,self.分身显示xy1.y=self.初始xy.x,self.初始xy.y
		-- 					self.分身类型1=1
		-- 				end
		-- 			end
		-- 			self.动画.动画["待战"]:置高亮模式(0xFF3000FF)
		-- 			-- self.动画1:置颜色(ARGB(135,70,130,255),"待战")
		-- 			-- self.动画.动画["待战"]:置颜色(0xFF000FFF)
		-- 			self.动画:显示(self.分身显示xy.x,self.分身显示xy.y,self.动作)
		-- 			self.动画:显示(self.分身显示xy1.x,self.分身显示xy1.y,self.动作)
		-- 		else
		-- 			self.动画.动画["待战"]:取消高亮()
		-- 			self.动画.动画["跑去"]:取消高亮()
		-- 			if self.动画.武器 ~= nil then
		-- 				self.动画.武器["待战"]:取消高亮()
		-- 				self.动画.武器["跑去"]:取消高亮()
		-- 			end
		-- 		end
		-- 	elseif self.动作=="跑去" then
		-- 		self.动画.动画["跑去"]:置高亮模式(0xFF0000FF)
		-- 		if self.动画.武器 ~= nil then
		-- 			self.动画.武器["跑去"]:置高亮模式(0xFF0000FF)
		-- 		end
		-- 	    self.动画:显示(self.显示xy.x+120,self.显示xy.y+60,self.动作)
		-- 	end
		-- end
	end
	if 战斗连击单位 == self.编号 and (战斗连击显示[self.编号] or 0) > 0 and 战斗类 ~= nil then
		local 连击次数 = math.min(战斗连击显示[self.编号], 66)
		local 位数 = string.len(tostring(连击次数))
		local 图片 = {}
		战斗类.连击背景图片:显示(全局游戏宽度 - 250 , 80)
		for i = 1, 位数 do
		    local 数字 = tonumber(string.sub(tostring(连击次数), i, i))
		    if 战斗类.连击图片[数字] then
		        战斗类.连击图片[数字 + 1]:显示(全局游戏宽度 - 265 - 50 * (位数 - i), 60)
		    end
		end
	elseif 连击显示延迟 ~= nil and self.编号 == 连击显示延迟[2] then
	end
	if 多重战斗开关 ~= false and 多重战斗开关.挨打方 and 多重战斗开关.挨打方[self.编号] ~= nil and self.死亡参数 == nil and self.逃跑开关 ~= true and 战斗类.战斗单位[ljcs][多重战斗开关.攻击方].多重攻击 ~= nil and 战斗类.战斗单位[ljcs][多重战斗开关.攻击方].多重攻击[self.编号] ~= nil then
		战斗类.战斗单位[ljcs][多重战斗开关.攻击方].动画:显示(战斗类.战斗单位[ljcs][多重战斗开关.攻击方].多重攻击[self.编号].x + 4, 战斗类.战斗单位[ljcs][多重战斗开关.攻击方].多重攻击[self.编号].y - (self.浮空高度 or 0) + 4, 战斗类.战斗单位[ljcs][多重战斗开关.攻击方].动作)
	end
	if self.战斗提示 and self.战斗提示.开关 then
		tp.字体表.战斗提示:显示(self.显示xy.x+self.抖动数据.x,self.显示xy.y+self.抖动数据.y-120,self.战斗提示.内容)
	end
	if self.抓捕开关 then
		self.抓捕动画:显示(self.抓捕xy.x,self.抓捕xy.y)
		名称显示(self.抓捕名称,self.抓捕xy)
		引擎.场景.影子:显示(self.抓捕xy.x,self.抓捕xy.y)
	end
	for i, v in pairs(self.状态特效) do
		if self.状态特效[i]~=nil then
			if self.状态特效[i].cp and self.状态特效[i].动画~=nil then
				if type(self.状态特效[i].动画) == "table" and self.状态特效[i].动画[1] and self.状态特效[i].动画[2] then
					for n=1,#self.状态特效[i].动画 do
						self.状态特效[i].动画[n]:更新(dt)
						self.状态特效[i].动画[n]:显示(self.显示xy.x+self.抖动数据.x+self.状态特效[i].py[1],self.显示xy.y+self.抖动数据.y+self.状态特效[i].py[2])
					end
				else
			    	self.状态特效[i].动画:更新(dt)
					self.状态特效[i].动画:显示(self.显示xy.x+self.抖动数据.x+self.状态特效[i].py[1],self.显示xy.y+self.抖动数据.y+self.状态特效[i].py[2])
				end
			end
		end
	end
	if self.战意 then
		if self.超级战意 and self.超级战意~=0 then
			if self.超级战意>=3 then
			    -- tp.超级战意特效[3]:更新(dt)
				tp.超级战意特效[3]:显示(self.显示xy.x,self.显示xy.y-self.高度)
			elseif self.超级战意==2 then
				if self.战意==2 then
				    -- tp.超级战意特效[2]:更新(dt)
					tp.超级战意特效[2]:显示(self.显示xy.x-97,self.显示xy.y-self.高度-100)
				elseif self.战意>=3 then
					-- tp.战意特效[1]:更新(dt)
					tp.战意特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
				    -- tp.超级战意特效[2]:更新(dt)
					tp.超级战意特效[2]:显示(self.显示xy.x-97,self.显示xy.y-self.高度-100)
				end
			elseif self.超级战意==1 then
				if self.战意==1 then
				    -- tp.超级战意特效[1]:更新(dt)
					tp.超级战意特效[1]:显示(self.显示xy.x-100,self.显示xy.y-self.高度-100)
				elseif self.战意==2 then
					-- tp.战意特效[1]:更新(dt)
					tp.战意特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
				    -- tp.超级战意特效[1]:更新(dt)
					tp.超级战意特效[1]:显示(self.显示xy.x-100,self.显示xy.y-self.高度-100)
				elseif self.战意>=3 then
					-- tp.战意特效[2]:更新(dt)
					tp.战意特效[2]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
				    -- tp.超级战意特效[1]:更新(dt)
					tp.超级战意特效[1]:显示(self.显示xy.x-100,self.显示xy.y-self.高度-100)
				end
			end
		else
			if self.战意==1 then
				-- tp.战意特效[1]:更新(dt)
				tp.战意特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
				-- self.破甲[1]:更新(dt)
				-- self.破甲[1]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
			elseif self.战意==2 then
				-- tp.战意特效[2]:更新(dt)
				tp.战意特效[2]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
			elseif self.战意>=3 then
				-- tp.战意特效[3]:更新(dt)
				tp.战意特效[3]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
			end
		end
	end
	if self.骤雨 and self.骤雨.层数>0 then
		if self.骤雨.层数==1 then
			-- tp.骤雨特效[1]:更新(dt)
			tp.骤雨特效[1]:显示(self.显示xy.x-100,self.显示xy.y-44-self.高度 )
		elseif self.骤雨.层数==2 then
			-- tp.骤雨特效[2]:更新(dt)
			tp.骤雨特效[2]:显示(self.显示xy.x-100,self.显示xy.y-44-self.高度 )
		elseif self.骤雨.层数>=3 then
			-- tp.骤雨特效[3]:更新(dt)
			tp.骤雨特效[3]:显示(self.显示xy.x-100,self.显示xy.y-44-self.高度 )
		end
	end
	if self.人参果 and self.人参果.枚>0 then
		if self.人参果.枚==1 then
			-- tp.人参果特效[1]:更新(dt)
			tp.人参果特效[1]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
		elseif self.人参果.枚==2 then
			-- tp.人参果特效[2]:更新(dt)
			tp.人参果特效[2]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
		elseif self.人参果.枚>=3 then
			-- tp.人参果特效[3]:更新(dt)
			tp.人参果特效[3]:显示(self.显示xy.x,self.显示xy.y-self.高度 )
		end
	end
	-- if 调试模式 then
	-- 	名称显示(self.名称,{x=self.显示xy.x+self.抖动数据.x,y=self.显示xy.y+self.抖动数据.y})
	-- else
		名称显示(self.名称,{x=self.显示xy.x+self.抖动数据.x+ self.法术抖动坐标.x,y=self.显示xy.y+self.抖动数据.y+ self.法术抖动坐标.y},self.高亮显示)
	-- end
	for n=1,#self.攻击特效 do
		if self.攻击特效[n]~=nil then --and self.攻击特效[n].cp
			if self.攻击特效[n].加速 then
			    self.攻击特效[n]:更新(dt*self.攻击特效[n].加速+tp.施法速度)
			else
				self.攻击特效[n]:更新(dt+tp.施法速度)
			end
			self.攻击特效[n]:显示(self.显示xy.x,self.显示xy.y)
			if self.攻击特效[n].当前帧==self.攻击特效[n].结束帧 then
				--self.攻击特效[n]:释放()
				self.攻击特效[n] = nil
				table.remove(self.攻击特效,n)
			end
		end
	end
	self:血条显示(x,y)

	for n=1,#self.法术特效 do
		if  self.法术特效[n]~=nil then -- and self.法术特效[n].cp
			if self.法术特效[n].加速==nil then
				self.法术特效[n]:更新(dt*1.1+tp.施法速度)
			else
				self.法术特效[n]:更新(self.法术特效[n].加速*1.1+tp.施法速度)
			end
			if 战斗类.掉血帧~=nil then
				self.法术特效[n]:显示(self.显示xy.x+self.抖动数据.x,self.显示xy.y+self.抖动数据.y-self.法术特效[n].附加y)
				if self.法术特效[n].当前帧>=self.法术特效[n].结束帧 then
					--self.法术特效[n]:释放()
					self.法术特效[n] = nil
					战斗类.掉血帧 = nil
					table.remove(self.法术特效,n)
				end
			else
				self.法术特效[n]:显示(self.显示xy.x+self.抖动数据.x,self.显示xy.y+self.抖动数据.y+self.法术特效[n].附加y)
				if self.法术特效[n].当前帧==self.法术特效[n].结束帧 then
					--self.法术特效[n]:释放()
					self.法术特效[n] = nil
					table.remove(self.法术特效,n)
				end
				if 战斗类.掉血流程 ~= nil and #self.法术特效==n and self.法术特效[n].当前帧==floor(self.法术特效[n].结束帧/1.5) then 战斗类.掉血流程=nil end
			end
		end
	end

	if self.披坚开关 then
		self:披坚显示()
	end
	-- if self.其他掉血开关 then
	-- 	self:其他掉血显示()
	-- end

	if self.逃跑开关 then
		self.逃跑特效:更新(dt)
		self.逃跑特效:显示(self.显示xy.x+self.抖动数据.x,self.显示xy.y+self.抖动数据.y)
	end
end

function 战斗单位类:血条显示(x,y)
	if self.是否显示==false then return  end
	if self.敌我==1 then
		战斗类.血条背景:显示(floor(self.显示xy.x+self.抖动数据.x+ self.法术抖动坐标.x -18),floor(self.显示xy.y +self.抖动数据.y+ self.法术抖动坐标.y -self.高度-5))
		if self.气血上限 then
			战斗类.血条上限栏:置区域(0,0,(self.气血上限 / self.最大气血) * 36,4)
			战斗类.血条上限栏:显示(floor(self.显示xy.x +self.抖动数据.x+ self.法术抖动坐标.x -17),floor(self.显示xy.y+self.抖动数据.y + self.法术抖动坐标.y -self.高度 -4))
		    -- (0,0,min(floor(tp.队伍[1].气血上限 / tp.队伍[1].最大气血 * 50),50),8)
		end
		战斗类.血条栏:置区域(0,0,(self.气血 / self.最大气血) * 36,4)
		战斗类.血条栏:显示(floor(self.显示xy.x +self.抖动数据.x+ self.法术抖动坐标.x -17),floor(self.显示xy.y+self.抖动数据.y + self.法术抖动坐标.y -self.高度 -4))
	else
		if 战斗类.天地洞明 then
			战斗类.血条背景:显示(floor(self.显示xy.x+self.抖动数据.x+ self.法术抖动坐标.x -18),floor(self.显示xy.y +self.抖动数据.y+ self.法术抖动坐标.y -self.高度-5))
			战斗类.血条栏:置区域(0,0,(self.气血 / self.最大气血) * 36,4)
			战斗类.血条栏:显示(floor(self.显示xy.x +self.抖动数据.x+ self.法术抖动坐标.x -17),floor(self.显示xy.y+self.抖动数据.y + self.法术抖动坐标.y -self.高度-4))
		end
	end
	if self.特技内容开关 then
		self:特技文本显示()
	end

	self.喊话:显示(self.显示xy.x,self.显示xy.y)
end

function 战斗单位类:同步伤势(气血,气血上限,最大气血)
	if self.单位id == 引擎.场景.队伍[1].数字id then
		if self.气血上限 ~= nil and 气血上限 ~= nil then
			self.气血上限 = 气血上限
			引擎.场景.队伍[1].气血上限=气血上限
		end
	end
end

function 战斗单位类:同步气血(气血,气血上限,最大气血)
    -- if self.单位id == 引擎.场景.队伍[1].数字id then --加上这个之后队友看不到回血了
    	if self.单位类型 == "角色" then
    		if self.气血 ~= nil and 气血 ~= nil then
				self.气血 = 气血
				if self.单位id == 引擎.场景.队伍[1].数字id then
					引擎.场景.队伍[1].气血=气血
				end
			end
			-- if 最大气血 ~= nil then
			-- 	引擎.场景.队伍[1].最大气血=最大气血
			-- 	self.最大气血 = 最大气血
			-- end
			if self.气血上限 ~= nil and 气血上限 ~= nil then
				self.气血上限 = 气血上限
				if self.单位id == 引擎.场景.队伍[1].数字id then
					引擎.场景.队伍[1].气血上限=气血上限
				end
			end
		elseif self.单位类型 == "bb" then
			if self.气血 ~= nil and 气血 ~= nil then
				self.气血 = 气血
				if self.单位id == 引擎.场景.队伍[1].数字id then
					引擎.场景.队伍[1].参战宝宝.气血=气血
				end
			end
			-- if 最大气血 ~= nil then
			-- 	引擎.场景.队伍[1].参战宝宝.最大气血=最大气血
			-- 	self.最大气血 = 最大气血
			-- end
		end
end

function 战斗单位类:结束同步(气血,最大气血,气血上限,魔法,最大魔法,愤怒,护盾,战意,五行珠,人参果,骤雨,超级战意)
	if self.单位id == 引擎.场景.队伍[1].数字id then
		if self.单位类型 == "角色" then
			if self.气血 ~= nil and 气血 ~= nil then
				self.气血 = 气血
				引擎.场景.队伍[1].气血=气血
			end
			if 最大气血 ~= nil then
				引擎.场景.队伍[1].最大气血=最大气血
				self.最大气血 = 最大气血
			end
			if self.气血上限 ~= nil and 气血上限 ~= nil then
				self.气血上限=气血上限
				引擎.场景.队伍[1].气血上限=气血上限
			end
			if 魔法 ~= nil then
				引擎.场景.队伍[1].魔法=魔法
			end
			if 最大魔法 ~= nil then
				引擎.场景.队伍[1].最大魔法=最大魔法
			end
			if 愤怒 ~= nil then
				引擎.场景.队伍[1].愤怒 = 愤怒
			end
		elseif self.单位类型 == "bb" then
			if self.气血 ~= nil and 气血 ~= nil then
				self.气血 = 气血
				引擎.场景.队伍[1].参战宝宝.气血=气血
			end
			if 最大气血 ~= nil then
				引擎.场景.队伍[1].参战宝宝.最大气血=最大气血
				self.最大气血 = 最大气血
			end
			if 魔法 ~= nil then
				引擎.场景.队伍[1].参战宝宝.魔法=魔法
			end
			if 最大魔法 ~= nil then
				引擎.场景.队伍[1].参战宝宝.最大魔法=最大魔法
			end
		end
	end
	if 护盾 ~= nil then
		self.护盾 = 护盾
	end
	if 战意 ~= nil then
		self.战意 = 战意
	end
	if 超级战意 ~= nil then
		self.超级战意 = 超级战意
	end
	if 五行珠 ~= nil then
		self.五行珠 = 五行珠
	end
	if 人参果 ~= nil then
		self.人参果 = 人参果
	end
	if 骤雨 ~= nil then
		self.骤雨 = 骤雨
	end
end

function 战斗单位类:魔法更新(魔法)
	if  self.单位id == 引擎.场景.队伍[1].数字id then
		if self.单位类型 == "角色" then
			引擎.场景.队伍[1].魔法 = 魔法
			if 愤怒 ~= nil then
				引擎.场景.队伍[1].愤怒 = 愤怒
			end
		elseif self.单位类型 == "bb" then
			引擎.场景.队伍[1].参战宝宝.魔法 = 魔法
		end
	end
end

function 战斗单位类:愤怒更新(愤怒)
	if  self.单位id == 引擎.场景.队伍[1].数字id then
		if self.单位类型 == "角色" then
			if 愤怒 ~= nil then
				引擎.场景.队伍[1].愤怒 = 愤怒
			end
		end
	end
end

function 战斗单位类:战意更新(战意)
	self.战意 = 战意
end
function 战斗单位类:超级战意更新(超级战意)
	self.超级战意 = 超级战意
end
function 战斗单位类:骤雨更新(骤雨)
	self.骤雨 = 骤雨
end

function 战斗单位类:五行珠更新(五行珠)
	self.五行珠 = 五行珠
end

function 战斗单位类:人参果更新(人参果)
	self.人参果 = 人参果
end

function 战斗单位类:护盾更新(护盾)
	self.护盾 = 护盾
end

function 战斗单位类:设置掉血(数额,类型)

	local 护盾消耗 = 0
	-- if 数额==nil then
	-- 	数额=1
	-- 	-- tp.常规提示:打开("#Y掉血数据异常，请与GM联系！")
	-- end
	数额 = math.floor(数额 or 1)
	-- self.消除护盾=nil
	if 类型==1 or 类型==3 or 类型==3.5 or 类型==4 then
		if self.护盾 ~= 0 then
			if self.护盾 >= 数额 then
				护盾消耗 = 数额
				数额 = 0
				self.护盾 = self.护盾 - 数额
				self.伤害数额 = ""..数额.."("..护盾消耗..")"
			else
				数额= 数额 - self.护盾
				护盾消耗 = self.护盾
				self.伤害数额 = ""..数额.."("..护盾消耗..")"
				self.护盾 = 0
			end
			-- self.消除护盾=true
		else
			self.伤害数额 = 数额
		end
	else
		self.伤害数额 = 数额
		if self.气血+数额>self.最大气血 then
		    self.伤害数额 = self.最大气血-self.气血
		end
		if self.伤害数额<=0 then
		    return
		end
	end
	self.伤害总数=string.len(tostring(self.伤害数额))
	self.伤害类型=类型
	self.掉血开关=true
	self.加血顺序=0
	if 类型==1 or 类型==3 or 类型==3.5 or 类型==4 then
		self.气血=self.气血-数额
		if self.气血<=0 then
		    self.气血=0
		end
		if  self.单位id == 引擎.场景.队伍[1].数字id then
			if self.单位类型 == "角色" then
				引擎.场景.队伍[1].气血 = self.气血
				引擎.场景.队伍[1].最大气血 = self.最大气血
				临时愤怒=math.floor(数额/引擎.场景.队伍[1].最大气血*0.5*100)
				引擎.场景.队伍[1].愤怒=引擎.场景.队伍[1].愤怒+临时愤怒
				if 引擎.场景.队伍[1].愤怒>150 then 引擎.场景.队伍[1].愤怒=150 end
			elseif self.单位类型 == "bb" then
				引擎.场景.队伍[1].参战宝宝.气血=self.气血
				引擎.场景.队伍[1].参战宝宝.最大气血=self.最大气血
			end
		end
		-- if self.法术状态组["催眠符"]~=nil then self.法术状态组["催眠符"]=nil end
	else
		self.气血=self.气血+数额
		if self.气血>self.最大气血 then
		    self.气血=self.最大气血
		end
		if  self.单位id == 引擎.场景.队伍[1].数字id then
			if self.单位类型 == "角色" then
				引擎.场景.队伍[1].气血 = self.气血
				引擎.场景.队伍[1].最大气血 = self.最大气血
			elseif self.单位类型 == "bb" then
				引擎.场景.队伍[1].参战宝宝.气血=self.气血
				引擎.场景.队伍[1].参战宝宝.最大气血=self.最大气血
			end
		end
	end
	for n=1,self.伤害总数 do
		self.伤害序列[n]={}
		self.伤害序列[n].数字=string.sub(self.伤害数额,n,n)
		-- if self.伤害序列[n].数字=="-" then
		-- 	tp.常规提示:打开("#Y掉血数据异常，请与GM联系！-")
		--     self.伤害序列[n].数字=1
		-- end
		if self.伤害序列[n].数字 == "(" then
			self.伤害序列[n].数字 = 10
		elseif self.伤害序列[n].数字 == ")" then
			self.伤害序列[n].数字 = 11
		end
		self.伤害序列[n].高度=0
		self.伤害序列[n].x=self.显示xy.x-self.伤害总数*12
		self.伤害序列[n].y=self.显示xy.y
	end
	-- if 类型==2 then
	-- end
	self.弹跳顺序=1
	self.显示时间=0
end

function 战斗单位类:掉血显示原弃用()
	for n=1,#self.伤害序列 do
	 	self.显示时间=self.显示时间+1
	 	if n==self.弹跳顺序 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度+4 --self.弹跳间隔=单个数字高度
	      if (self.伤害序列[n].高度>=22) then  --self.弹跳次数=弹跳的总高度
	        self.弹跳顺序=self.弹跳顺序+1
	      end
	    elseif self.伤害序列[n].高度>0 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度-1.8   --弹跳速度
	    end
	    if (self.敌我==2) then
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
	    	self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    else
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
			if self.伤害序列[n].数字==nil then self.伤害序列[n].数字=0 end
			self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    end
	    -- if self.显示时间>=30 then --加这个时间有种停顿的感觉，然后暴击的时候我们还可以在这个时间内显示黄色的，其他时间显示红色，慢慢调
	    --     if n==self.弹跳顺序 then
		   --    self.伤害序列[n].高度=self.伤害序列[n].高度+4 --self.弹跳间隔=单个数字高度
		   --    if (self.伤害序列[n].高度>=22) then  --self.弹跳次数=弹跳的总高度
		   --      self.弹跳顺序=self.弹跳顺序+1
		   --    end
		   --  elseif self.伤害序列[n].高度>0 then
		   --    self.伤害序列[n].高度=self.伤害序列[n].高度-1.8   --弹跳速度
		   --  end
	    -- end
	end

	if (self.显示时间>=#self.伤害序列*50) then
		self.掉血开关=false
		self.伤害序列={}
		--self.击退开关=false
	end
end

function 战斗单位类:掉血显示() --嘎嘎
	for n=1,#self.伤害序列 do
	 	self.显示时间=self.显示时间+1
	 	if n==self.弹跳顺序 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度+4 --self.弹跳间隔=单个数字高度
	      if (self.伤害序列[n].高度>=22) then  --self.弹跳次数=弹跳的总高度
	        self.弹跳顺序=self.弹跳顺序+1
	      end
	    elseif self.伤害序列[n].高度>0 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度-1.8   --弹跳速度
	    end
	    if (self.敌我==2) then
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
	    	     if    self.伤害序列[n].数字=="-"  then
	    	    	 self.伤害序列[n].数字=1
	    	    end
	    	self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    else
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
	    	    if    self.伤害序列[n].数字=="-"  then
	    	    	 self.伤害序列[n].数字=1
	    	    end

			if self.伤害序列[n].数字==nil then self.伤害序列[n].数字=0 end
			self.伤害图片[self.伤害序列[n].数字 +1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    end
	end

	if (self.显示时间>=#self.伤害序列*50) then
		self.掉血开关=false
		self.伤害序列={}
	end
end

function 战斗单位类:加血显示()
	for n=1,#self.伤害序列 do
	 	self.显示时间=self.显示时间+1
	 	if n==self.弹跳顺序 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度+4
	      if (self.伤害序列[n].高度>=22) then  --self.弹跳次数=弹跳的总高度
	        self.弹跳顺序=self.弹跳顺序+1
	      end
	    elseif self.伤害序列[n].高度>0 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度-2
	    end
	    if (self.敌我==2) then
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
	    	self.回复图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    else
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
			if self.伤害序列[n].数字==nil then self.伤害序列[n].数字=0 end
			self.回复图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    end
	end

	if (self.显示时间>=#self.伤害序列*40) then
		self.掉血开关=false
		self.伤害序列={}
		--self.击退开关=false
	end
end

function 战斗单位类:暴击显示()
	for n=1,#self.伤害序列 do
	 	self.显示时间=self.显示时间+1
	 	if n==self.弹跳顺序 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度+4
	      if (self.伤害序列[n].高度>=26) then  --self.弹跳次数=弹跳的总高度
	        self.弹跳顺序=self.弹跳顺序+1
	      end
	    elseif self.伤害序列[n].高度>0 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度-2
	    end
	    if (self.敌我==2) then
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
	    	self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    else
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
			if self.伤害序列[n].数字==nil then self.伤害序列[n].数字=0 end
			self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    end
	end

	if (self.显示时间>=#self.伤害序列*50) then
		self.掉血开关=false
		self.伤害序列={}
		--self.击退开关=false
	end
end

function 战斗单位类:法术暴击显示()
	for n=1,#self.伤害序列 do
	 	self.显示时间=self.显示时间+1
	 	if n==self.弹跳顺序 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度+4
	      if (self.伤害序列[n].高度>=22) then  --self.弹跳次数=弹跳的总高度
	        self.弹跳顺序=self.弹跳顺序+1
	      end
	    elseif self.伤害序列[n].高度>0 then
	      self.伤害序列[n].高度=self.伤害序列[n].高度-2
	    end
	    if (self.敌我==2) then
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
	    	self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    else
	    	if self.伤害序列[n]==nil or self.伤害序列[n].数字==nil then return 0 end
			if self.伤害序列[n].数字==nil then self.伤害序列[n].数字=0 end
			self.伤害图片[self.伤害序列[n].数字+1]:显示(self.伤害序列[n].x+n*12,self.伤害序列[n].y-40-self.伤害序列[n].高度)
	    end
	end

	if (self.显示时间>=#self.伤害序列*50) then
		self.掉血开关=false
		self.伤害序列={}
		--self.击退开关=false
	end
end

function 战斗单位类:添加特技内容(q)
	self.特技文本=分割字符(q)
	self.特技总数=#self.特技文本
	self.特技序列={}
	self.特技次数=20
	self.特技间隔=4
	for n=1,#self.特技文本 do
		self.特技序列[n]={}
		self.特技序列[n].文本=self.特技文本[n]
		self.特技序列[n].高度=0
		self.特技序列[n].x=self.显示xy.x-self.特技总数*4
		self.特技序列[n].y=self.显示xy.y
	end
	self.特技顺序=1
	self.特技内容开关=true
	self.关闭计次=0
end

function 战斗单位类:添加披坚内容(q)
	self.披坚文本=q
	self.关闭计次=0
	self.披坚开关=true
end

function 战斗单位类:不掉血文字(q)
	self.掉血文本=q
	self.文字坐标={}
	self.文字坐标.x=self.显示xy.x
	self.文字坐标.y=self.显示xy.y
	self.关闭计次=0
	self.图片高度=0
	self.其他掉血开关=true
end

function 战斗单位类:特技文本显示()
	self.关闭计次=self.关闭计次+1
	for n=1,self.特技总数 do
		if n==self.特技顺序 then
			self.特技序列[n].高度=self.特技序列[n].高度+self.特技间隔
			if(self.特技序列[n].高度>=self.特技次数) then
				self.特技顺序=self.特技顺序+1
			end
		elseif self.特技序列[n].高度>0 then
			self.特技序列[n].高度=self.特技序列[n].高度-1
		end
		tp.字体表.特技文字:置颜色(0xFFFF22FF):显示(self.特技序列[n].x-35+n*18,self.特技序列[n].y-130-self.特技序列[n].高度,self.特技序列[n].文本)
	end
	if self.关闭计次>=50 then
		self.特技内容开关=false
	end
end


function 战斗单位类:披坚显示()
	self.关闭计次=self.关闭计次+1
	local qtb = 引擎.取技能(self.披坚文本)
	self.技能图标=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
	tp.字体表.披坚文字:置颜色(0xFFFFFF00):显示(self.显示xy.x-29,self.显示xy.y-149,self.披坚文本)
	self.技能图标:显示(self.显示xy.x-23,self.显示xy.y-122)
	战斗类.技能圈:显示(self.显示xy.x-33,self.显示xy.y-131)
	if self.关闭计次>=60 then
		self.披坚开关=false
		self.关闭计次=0
		self.披坚文本=nil --新增
	end
end

function 战斗单位类:其他掉血显示()
	self.关闭计次=self.关闭计次+1
    if self.关闭计次>=23 then
        self.图片高度=self.图片高度+1
    else
    	self.图片高度=self.图片高度-1
    end
    if self.掉血文本=="免疫" then
        self.免疫:显示(self.文字坐标.x-29,self.文字坐标.y-54+self.图片高度)
    elseif self.掉血文本=="反弹" then
    	self.反弹:显示(self.文字坐标.x-29,self.文字坐标.y-54+self.图片高度)
    elseif self.掉血文本=="无穷" then
    	self.无穷:显示(self.文字坐标.x-29,self.文字坐标.y-54+self.图片高度)
    else
    	self.躲避:显示(self.文字坐标.x-29,self.文字坐标.y-54+self.图片高度)
    end
	if self.关闭计次>=46 then
		self.其他掉血开关=false
		self.关闭计次=0
		self.掉血文本=nil
		self.文字坐标={}
		self.图片高度=0
	end
end

function 战斗单位类:单位血条显示()
	战斗类.血条背景:显示(floor(self.显示xy.x+self.抖动数据.x+ self.法术抖动坐标.x -18),floor(self.显示xy.y +self.抖动数据.y+ self.法术抖动坐标.y -self.高度-5))
	战斗类.血条栏:置区域(0,0,(self.气血 / self.最大气血) * 36,4)
	战斗类.血条栏:显示(floor(self.显示xy.x +self.抖动数据.x+ self.法术抖动坐标.x -17),floor(self.显示xy.y+self.抖动数据.y + self.法术抖动坐标.y -self.高度-4))
end
function 战斗单位类:浮空处理()
	if self.浮空开关 == true then
		return
	end

	if self.死亡参数 == nil and self.逃跑开关 ~= true then
		self.浮空开关 = true
		self.浮空高度 = 50
		self.动作 = "挨打"
		self.停止更新 = true
	end
end

function 战斗单位类:浮空处理1()
	self.特殊浮空开关 = true
	self.特殊浮空高度 = 50
end

function 战斗单位类:取消浮空(下降)
	if self.浮空开关 ~= true then
		return
	end
	self.浮空开关 = false
	self.浮空下降 = 下降 or 0
	self.浮空下降 = math.floor(self.浮空下降 * 0.6)
end
return 战斗单位类