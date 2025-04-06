local floor = math.floor
local ceil  = math.ceil
local jnsss = require("script/显示类/技能")
local random = 取随机数
local insert = table.insert
local cfs    = 删除重复
local rand   = 引擎.取随机小数
local 五行_ = {"金","木","水","火","土"}
local 内存类_宝宝 = class()
local bbs = 引擎.取宝宝
function 内存类_宝宝:初始化()
	self.参战等级 = 0
	self.等级 = 0
	self.名称 = 0
	self.模型 = 0
	self.气血 = 0
	self.魔法 = 0
	self.攻击 = 0
	self.防御 = 0
	self.速度 = 0
	self.灵力 = 0
	self.体质 = 0
	self.魔力 = 0
	self.力量 = 0
	self.耐力 = 0
	self.敏捷 = 0
	self.潜力 = 5
	self.忠诚 = 100
	self.修炼 = {攻击修炼={0,0},法术修炼={0,0},防御修炼={0,0},速度修炼={0,0}}
	self.成长 = 0
	self.装备 = {}
	self.技能 = {}
	self.种类 = ""
	self.五行 = 0
	self.饰品 = nil
	self.双五行 = 0
	self.染色组 = 0
	self.染色方案 = nil
	self.参战信息 = nil
	self.战斗技能 = {}
	self.装备属性 = {
		气血 = 0,
		魔法 = 0,
		命中 = 0,
		伤害 = 0,
		防御 = 0,
		速度 = 0,
		躲避 = 0,
		灵力 = 0,
		体质 = 0,
		魔力 = 0,
		力量 = 0,
		耐力 = 0,
		敏捷 = 0,
		元宵 = 0,
	}
	self.当前经验 = 0
	self.最大经验 = 0
	self.最大气血 = 0
	self.最大魔法 = 0
	self.攻击资质 = 0
	self.防御资质 = 0
	self.体力资质 = 0
	self.法力资质 = 0
	self.速度资质 = 0
	self.躲闪资质 = 0
	self.自动 = nil
	self.默认技能 = nil
end

function 内存类_宝宝:查看置新对象(模型,名称,类型,属性,等级,染色方案,技能组,资质组,成长,参战等级,属性表)
	local n = bbs(模型)
	if n[1] == nil or 属性表 ~= nil then
		self.模型 = 模型
		self.等级 = 等级 or 0
		self.种类 = 类型
		self.名称 = 名称 or 模型
		资质组 = 资质组 or {0,0,0,0,0,0}
		self.攻击资质 = 资质组[1]
		self.防御资质 = 资质组[2]
		self.体力资质 = 资质组[3]
		self.法力资质 = 资质组[4]
		self.速度资质 = 资质组[5]
		self.躲闪资质 = 资质组[6]
		self.技能 = 技能组 or {}
		self.成长 = 成长 or 0
		self.参战等级 = 参战等级 or 0
		self.五行 = 五行_[random(1,5)]
		if 类型 == "神兽" then
		    self.内丹 = {内丹上限=6,内丹={}}
		else
			self.内丹 = {内丹上限=floor(self.参战等级 / 35)+1,内丹={}}
		end
		for m=1,#self.技能 do
			local w = self.技能[m]
			self.技能[m] = jnsss()
			self.技能[m]:置对象(w,2)
		end
		属性表 = 属性表 or {0,0,0,0,0,0}
		self.忠诚 = 属性表[1]
		self.体质 = 属性表[2]
		self.魔力 = 属性表[3]
		self.力量 = 属性表[4]
		self.耐力 = 属性表[5]
		self.敏捷 = 属性表[6]
		if 属性表 ~= nil then
			self:刷新信息("1")
		end
		return
	end
	等级 = 等级 or 0
	local 波动上限 = 1
	local 能力 = 0
	local 五维总值 = 0
	类型 = 类型 or "野怪"
	if 属性 == nil then
		if 类型 == "野怪" then
			属性 = 45 + 等级 * 5 + random(-10,20)
		elseif 类型 == "宝宝" then
			属性 = 50 + 等级 * 5
		elseif 类型 == "变异" then
			属性 = 55 + 等级 * 5
		elseif 类型 == "神兽" then
			属性 = 60 + 等级 * 5
		elseif 类型 == "孩子" then
			属性 = 60 + 等级 * 5
		end
	end
	self.模型 = 模型
	self.种类 = 类型
	if 类型 == "野怪"  or 类型 == "孩子" then
		能力 = 0.725
		五维总值 = 属性
		if 类型 == "孩子" then
			self.忠诚 = 100
		else
		    self.忠诚 = 80
		end
	elseif 类型 == "宝宝" then
		能力 = 0.925
		五维总值 = 属性
		self.忠诚 = 100
		self.体质 = 10
		self.魔力 = 10
		self.力量 = 10
		self.耐力 = 10
		self.敏捷 = 10
	elseif 类型 == "变异" then
		能力 = 1.105
		五维总值 = 属性
		self.忠诚 = 100
		self.体质 = 15
		self.魔力 = 15
		self.力量 = 15
		self.耐力 = 15
		self.敏捷 = 15
		n[2] = n[2] + 80
		n[3] = n[3] + 80
		n[4] = n[4] + 80
		n[5] = n[5] + 80
		n[6] = n[6] + 80
		n[7] = n[7] + 80
	elseif 类型 == "神兽" or 类型 == "变异神兽" then
		self.忠诚 = 100
		self.体质 = 20
		self.魔力 = 20
		self.力量 = 20
		self.耐力 = 20
		self.敏捷 = 20
	end
	self.名称 = 名称 or 模型
	self.参战等级 = n[1]
	if 类型 == "野怪" then
		local s1,s2,s3,s4,s5,s6
		while true do
			s1 = random(五维总值/10,ceil(五维总值/3))
			s2 = random(五维总值/10,ceil(五维总值/3))
			s3 = random(五维总值/10,ceil(五维总值/3))
			s4 = random(五维总值/10,ceil(五维总值/3))
			s5 = random(五维总值/10,ceil(五维总值/3))
			if(s1+s2+s3+s4+s5==五维总值)then
				self.体质 = s1
				self.魔力 = s2
				self.力量 = s3
				self.耐力 = s4
				self.敏捷 = s5
				break
			end
		end
	end
	self.攻击资质= ceil(n[2]*rand(能力,波动上限))
	self.防御资质= ceil(n[3]*rand(能力,波动上限))
	self.体力资质= ceil(n[4]*rand(能力,波动上限))
	self.法力资质= ceil(n[5]*rand(能力,波动上限))
	self.速度资质= ceil(n[6]*rand(能力,波动上限))
	self.躲闪资质= ceil(n[7]*rand(能力,波动上限))
	local jn = n[9]
	local jn0 = {}
	local cz1 = random(1,100)
	if cz1 < 30 then
		self.成长 = n[8][1]
	elseif cz1 > 30  and cz1 < 60 then
		self.成长 = n[8][2]
	elseif cz1 > 60  and cz1 < 80 then
		self.成长 = n[8][3]
	elseif cz1 > 80  and cz1 < 95 then
		self.成长 = n[8][4]
	elseif cz1 > 95  and cz1 < 100 then
		self.成长 = n[8][5]
	end
	if self.成长 == 0 then
		self.成长 = n[8][1]
	end
	for q=1,#jn do
		insert(jn0, jn[random(1,#jn)])
	end
	jn0 = cfs(技能组 or jn0)
	for j=1,#jn0 do
		self.技能[j] = jn0[j]
	end
	for m=1,#self.技能 do
		local w = self.技能[m]
		self.技能[m] = jnsss()
		self.技能[m]:置对象(w,2)
	end
	self.五行 = 五行_[random(1,5)]
	if n.染色方案 ~= nil then
		self.染色方案 = n.染色方案
		self.染色组 = {1,0}
	end
	if 染色方案 ~= nil then
		self.染色方案 = 染色方案[1]
		self.染色组 = 染色方案[2]
	end
	if 类型 == "神兽" then
	    self.内丹 = {内丹上限=6,内丹={}}
	else
		self.内丹 = {内丹上限=floor(self.参战等级 / 35)+1,内丹={}}
	end
	self:刷新信息("1")
end
function 内存类_宝宝:置新对象(模型,类型,宝宝数组)
	self.模型 = 模型
	self.等级 = 0
	self.种类 = 类型
	self.名称 = 模型
	self.攻击资质 = 宝宝数组[1]
	self.防御资质 = 宝宝数组[2]
	self.体力资质 = 宝宝数组[3]
	self.法力资质 = 宝宝数组[4]
	self.速度资质 = 宝宝数组[5]
	self.躲闪资质 = 宝宝数组[6]
	self.技能 = 宝宝数组[8]
	self.成长 = 宝宝数组[7]
	self.参战等级 = 0
	self.五行 = 五行_[random(1,5)]
	for m=1,#self.技能 do
		local w = self.技能[m]
		self.技能[m] = jnsss()
		self.技能[m]:置对象(w,2)
	end
	self.忠诚 = 100
	self.体质 =20
	self.魔力 = 20
	self.力量 = 20
	self.耐力 = 20
	self.敏捷 = 20

end

function 内存类_宝宝:刷新信息(是否,体质,魔力)
	self.体质 = self.体质 + self.装备属性.体质
	self.魔力 = self.魔力 + self.装备属性.魔力
	self.力量 = self.力量 + self.装备属性.力量
	self.耐力 = self.耐力 + self.装备属性.耐力
	self.敏捷 = self.敏捷 + self.装备属性.敏捷
	self.最大气血 = ceil(self.等级*self.体力资质/1000+self.体质*self.成长*6) + self.装备属性.气血
	self.最大魔法 = ceil(self.等级*self.法力资质/500+self.魔力*self.成长*3) + self.装备属性.魔法
	self.伤害 = ceil(self.等级*self.攻击资质*(self.成长+1.4)/750+self.力量*(self.成长-0.3)) + self.装备属性.伤害
	self.防御 = ceil(self.等级*self.防御资质*(self.成长+1.4)/1143+self.耐力*(self.成长-1/253)*253/190)+ self.装备属性.防御
	self.速度 = ceil(self.速度资质 * self.敏捷/1400)  + self.装备属性.速度
	self.灵力 = ceil(self.等级*(self.法力资质+1666)/3333+self.魔力*0.7+self.力量*0.4+self.体质*0.3+self.耐力*0.2) + self.装备属性.灵力
	if 是否 == "1" then
		self.气血 = self.最大气血
		self.魔法 = self.最大魔法
	end
	if 体质 ~= nil and 体质 > 0 then
		self.气血 = self.最大气血
	end
	if 魔力 ~= nil and 魔力 > 0 then
		self.魔法 = self.最大魔法
	end
	self.气血 = self.气血
	self.最大气血 = self.最大气血
	if self.气血 > self.最大气血 then
		self.气血 = self.最大气血 - self.气血 + self.气血
	end
	self.魔法 = self.魔法
	self.最大魔法 = self.最大魔法
	if self.魔法 > self.最大魔法 then
		self.魔法 = self.最大魔法 - self.魔法 + self.魔法
	end
	self.等级 = self.等级
	if self.等级 <= 175 then
		self.最大经验 = 引擎.场景:取经验(2,self.等级)
	end
	if 引擎.场景.窗口.召唤兽资质栏.可视 then
		for i=1,3 do
		  	引擎.场景.窗口.召唤兽资质栏.物品[i]:置物品(self.装备[i])
		end
	end
end

return 内存类_宝宝