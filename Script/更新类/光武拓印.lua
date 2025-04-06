-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-19 16:32:35

local 光武拓印 = class()
local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp,zts1
local tp
local remove = table.remove
local qjq = 引擎.取摊位金钱颜色

function 光武拓印:初始化(根)
	self.ID = 148
	self.x = 210
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "创建光武拓印"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,445,254,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 资源:载入("pic/qyd.png","图片"),
		[4] = 按钮(自适应.创建(12,4,73,22,1,3),0,0,4,true,true,"选择武器"),
		[5] =资源:载入("wdf/audio/jmk/背包/武器.png","图片"),
		[6] = 自适应.创建(3,1,150,19,1,3),
		[7] = 按钮(自适应.创建(12,4,73,22,1,3),0,0,4,true,true,"确认转换"),
		[8] = 按钮.创建(自适应.创建(17,4,32,22,1,3),0,0,4,true,true,"80"),
		[9] = 按钮.创建(自适应.创建(17,4,32,22,1,3),0,0,4,true,true,"100"),
		[10] = 按钮.创建(自适应.创建(17,4,32,22,1,3),0,0,4,true,true,"120"),
		[11] = 按钮.创建(自适应.创建(17,4,32,22,1,3),0,0,4,true,true,"150"),
	}
	 self.资源组[2]:绑定窗口_(self.ID)
	 self.资源组[4]:绑定窗口_(self.ID)
	 self.资源组[7]:绑定窗口_(self.ID)
	 self.资源组[8]:绑定窗口_(self.ID)
	 self.资源组[9]:绑定窗口_(self.ID)
	 self.资源组[10]:绑定窗口_(self.ID)
	 self.资源组[11]:绑定窗口_(self.ID)
	 self.资源组[11]:置偏移(-4,0)

	 local 格子 = 根._物品格子
	 self.武器 = 格子(0,0,1,"光武拓印")
	 self.武器:置物品(nil)
	 self.武器数据 = nil
	 self.新武器 = {}
	 self.当前等级选择 = 0
	 self.选择物品=nil
	 self.道具格子=nil
	 for i=1,3 do
	 	self.新武器[i] = 格子(0,0,i+1,"光武拓印")
	 	self.新武器[i]:置物品(nil)
	 end
end

function 光武拓印:打开(sj)
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.武器:置物品(nil)
		self.武器数据 = nil
		self.当前等级选择 = 0
		self.选择物品=nil
		self.道具格子 = nil
		for i=1,3 do
			self.新武器[i]:置物品(nil)
		end
	end
end

function 光武拓印:刷新(sj)
	if not self.可视 then
		return
	end
	self.道具格子 = nil
	self.武器:置物品(nil)
	self.武器数据 = nil
	self.选择物品=nil
	self.当前等级选择 = 0
	for i=1,3 do
		self.新武器[i].确定 = false
		self.新武器[i]:置物品(nil)
	end
	if sj[1] then
		if tp.道具列表[sj[1]] and tp.道具列表[sj[1]].总类 == 2 and tp.道具列表[sj[1]].分类==3 then
			self.道具格子 = sj[1]
			self.武器:置物品(tp.道具列表[sj[1]])
			self.武器数据 = table.copy(tp.道具列表[sj[1]])
		end
	end
end

function 光武拓印:显示(dt,x,y)
	self.焦点 = false
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[7]:更新(x,y,self.武器.物品 ~= nil)
	self.资源组[4]:更新(x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"光武拓印")
	self.资源组[2]:显示(self.x-18-33+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x+50-33,self.y+50-5)
	self.资源组[4]:显示(self.x+70-33,self.y+70-5)
	self.资源组[8]:显示(self.x+417-33,self.y+80-5,true,nil,nil,self.当前等级选择 == 1,2)
	self.资源组[9]:显示(self.x+417-33,self.y+105-5,true,nil,nil,self.当前等级选择 == 2,2)
	self.资源组[10]:显示(self.x+417-33,self.y+130-5,true,nil,nil,self.当前等级选择 == 3,2)
	self.资源组[11]:显示(self.x+417-33,self.y+155-5,true,nil,nil,self.当前等级选择 == 4,2)
	tp.物品格子背景_:显示(self.x+80-33,self.y+100-5)
	self.武器:置坐标(self.x+81-33,self.y+100-5)
	self.武器:显示(dt,x,y,self.鼠标)
	--self.资源组[5]:显示(self.x+80,self.y+100)
	for i=1,3 do
		tp.物品格子背景_:显示(self.x+180-33+60*i,self.y+100-5)
		self.新武器[i]:置坐标(self.x+181-33+60*i,self.y+100-5)
		self.新武器[i]:显示(dt,x,y,self.鼠标)
		if self.新武器[i].物品~=nil and self.新武器[i].焦点 and not tp.消息栏焦点 then
			-- tp.物品格子焦点_:显示(self.x+180+60*i,self.y+100)
			tp.提示:道具行囊(x,y,self.新武器[i].物品)
		end
		if self.新武器[i].事件 and self.鼠标 and self.新武器[i].物品~=nil then
			if self.选择物品 ~= nil then
				self.新武器[self.选择物品].确定 = false
			end
			self.选择物品 = i
			self.新武器[i].确定 = true
		end
	end
	-- self.资源组[5]:显示(self.x+200+40,self.y+100)
	-- self.资源组[5]:显示(self.x+260+40,self.y+100)
	-- self.资源组[5]:显示(self.x+320+40,self.y+100)
	zts:置颜色(白色)
	zts:显示(self.x+285-33,self.y+75-5,"选择可变造型")
	zts:显示(self.x+80-33,self.y+170-5,"现有银子")
	self.资源组[6]:显示(self.x+148-33,self.y+167-5)
	zts:显示(self.x+80-33,self.y+195-5,"需要银子")
	self.资源组[6]:显示(self.x+148-33,self.y+192-5)
	self.资源组[7]:显示(self.x+350-33,self.y+192-5,true)
	if self.资源组[4]:事件判断() then
		发送数据(3782)
	elseif self.资源组[8]:事件判断() then
		self:选择等级武器(1)
	elseif self.资源组[9]:事件判断() then
		self:选择等级武器(2)
	elseif self.资源组[10]:事件判断() then
		self:选择等级武器(3)
	elseif self.资源组[11]:事件判断() then
		self:选择等级武器(4)
	elseif self.资源组[7]:事件判断() then
		if self.武器.物品 == nil or self.道具格子 == nil then
			tp.常规提示:打开("#Y/请先选择武器！")
			return
		end
		if self.选择物品 == nil then
			tp.常规提示:打开("#Y/请选择你要幻化的武器！")
			return
		end
    	local 事件 = function()
    	发送数据(3783,{道具格子=self.道具格子,新造型=self.新武器[self.选择物品].物品.名称})
		end
        tp.窗口.文本栏:载入("你确定要将#Y"..self.武器.物品.名称.."#W幻化为#Y"..self.新武器[self.选择物品].物品.名称.."#W吗？",nil,true,事件)
	end

	local jq
	jq = tp.金钱
	zts:置颜色(qjq(jq))
   	zts:显示(self.x + 153-33,self.y + 170-5,jq)
   	zts:置颜色(紫色)
	zts:显示(self.x+153-33,self.y+195-5,"5000000")
	if self.武器.物品~=nil and self.武器.焦点 and not tp.消息栏焦点 then
		-- tp.物品格子焦点_:显示(self.x+80,self.y+100)
		tp.提示:道具行囊(x,y,self.武器.物品)
		if 引擎.鼠标弹起(右键) and self.鼠标 then
			self.当前等级选择 = 0
			self.武器:置物品(nil)
			self.武器数据 = nil
			self.选择物品 = nil
			self.道具格子 = nil
			for i=1,3 do
				self.新武器[i].确定 = false
				self.新武器[i]:置物品(nil)
			end
		end
	end

    if self.资源组[2]:事件判断() then --关闭
        self:打开()
        return
    end
end

function 光武拓印:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 光武拓印:初始移动(x,y)
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

function 光武拓印:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

function 光武拓印:选择等级武器(n)
	if self.武器.物品 == nil or self.武器数据 == nil then
		tp.常规提示:打开("#Y/请先选择武器！")
		return
	end
	if self.当前等级选择 == n then
		return
	end
	local 武器表 = {
		枪矛 = {"红缨枪","曲尖枪","锯齿矛","乌金三叉戟","火焰枪","墨杆金钩","玄铁矛","金蛇信","丈八点钢矛","暗夜","梨花","霹雳","刑天之逆","五虎断魂","飞龙在天","天龙破城","弑皇"},
		斧钺 = {"青铜斧","开山斧","双面斧","双弦钺","精钢禅钺","黄金钺","乌金鬼头镰","狂魔镰","恶龙之齿","破魄","肃魂","无敌","五丁开山","元神禁锢","护法灭魔","碧血干戚","裂天"},
		剑 = {"青铜短剑","铁齿剑","吴越剑","青锋剑","龙泉剑","黄金剑","游龙剑","北斗七星剑","碧玉剑","鱼肠","倚天","湛卢","魏武青虹","灵犀神剑","四法青云","霜冷九州","擒龙"},
		双短剑 = {"双短剑","镔铁双剑","龙凤双剑","竹节双剑","狼牙双剑","鱼骨双剑","赤焰双剑","墨玉双剑","梅花双剑","阴阳","月光双剑","灵蛇","金龙双剪","连理双树","祖龙对剑","紫电青霜","浮犀"},
		飘带 = {"五色缎带","幻彩银纱","金丝彩带","无极丝","天蚕丝带","云龙绸带","七彩罗刹","缚神绫","九天仙绫","彩虹","流云","碧波","秋水落霞","晃金仙绳","此最相思","揽月摘星","九霄"},
		爪刺 = {"铁爪","天狼爪","幽冥鬼爪","青龙牙","勾魂爪","玄冰刺","青刚刺","华光刺","龙鳞刺","撕天","毒牙","胭脂","九阴勾魂","雪蚕之刺","贵霜之牙","忘川三途","离钩"},
		扇 = {"折扇","铁骨扇","精钢扇","铁面扇","百折扇","劈水扇","神火扇","阴风扇","风云雷电","太极","玉龙","秋风","画龙点睛","秋水人家","逍遥江湖","浩气长舒","星瀚"},
		魔棒 = {"细木棒","金丝魔棒","玉如意","点金棒","云龙棒","幽路引魂","满天星","水晶棒","日月光华","沧海","红莲","盘龙","降魔玉杵","青藤玉树","墨玉骷髅","丝萝乔木","醍醐"},
		锤 = {"松木锤","镔铁锤","八棱金瓜","狼牙锤","烈焰锤","破甲战锤","震天锤","巨灵神锤","天崩地裂","八卦","鬼牙","雷神","混元金锤","九瓣莲花","鬼王蚀日","狂澜碎岳","碎寂"},
		鞭 = {"牛皮鞭","牛筋鞭","乌龙鞭","钢结鞭","蛇骨鞭","玉竹金铃","青藤柳叶鞭","雷鸣嗜血鞭","混元金钩","龙筋","百花","吹雪","游龙惊鸿","仙人指路","血之刺藤","牧云清歌","霜陨"},
		环圈 = {"黄铜圈","精钢日月圈","离情环","金刺轮","风火圈","赤炎环","蛇形月","子母双月","斜月狼牙","如意","乾坤","月光双环","别情离恨","金玉双环","九天金线","无关风月","朝夕"},
		刀 = {"柳叶刀","苗刀","夜魔弯刀","金背大砍刀","雁翅刀","破天宝刀","狼牙刀","龙鳞宝刀","黑炎魔刀","冷月","屠龙","血刃","偃月青龙","晓风残月","斩妖泣血","业火三灾","鸣鸿"},
		法杖 = {"曲柳杖","红木杖","白椴杖","墨铁拐","玄铁牛角杖","鹰眼法杖","腾云杖","引魂杖","碧玺杖","业焰","玉辉","鹿鸣","庄周梦蝶","凤翼流珠","雪蟒霜寒","碧海潮生","弦月"},
		弓弩 = {"硬木弓","铁胆弓","紫檀弓","宝雕长弓","錾金宝弓","玉腰弯弓","连珠神弓","游鱼戏珠","灵犀望月","非攻","幽篁","百鬼","冥火薄天","龙鸣寒水","太极流光","九霄风雷","若木"},
		宝珠 = {"琉璃珠","水晶珠","珍宝珠","翡翠珠","莲华珠","夜灵珠","如意宝珠","沧海明珠","无量玉璧","离火","飞星","月华","回风舞雪","紫金葫芦","裂云啸日","云雷万里","赤明"},
		巨剑 = {"钝铁重剑","桃印铁刃","赭石巨剑","壁玉长铗","青铜古剑","金错巨刃","惊涛雪","醉浮生","沉戟天戊","鸦九","昆吾","弦歌","墨骨枯麟","腾蛇郁刃","秋水澄流","百辟镇魂","长息"},
		灯笼 = {"素纸灯","竹骨灯","红灯笼","鲤鱼灯","芙蓉花灯","如意宫灯","玲珑盏","玉兔盏","冰心盏","蟠龙","云鹤","风荷","金风玉露","凰火燎原","月露清愁","夭桃秾李","荒尘"},
		伞 = {"油纸伞","红罗伞","紫竹伞","锦绣椎","幽兰帐","琳琅盖","孔雀羽","金刚伞","落梅伞","鬼骨","云梦","枕霞","碧火琉璃","雪羽穿云","月影星痕","浮生归梦","晴雪"}
	}
	local 临时武器集合 = 武器表[tp:取武器子类(self.武器.物品.子类)]
	local s = 0
	if n == 1 then
		s = 8
	elseif n == 2 then
		s = 10
	elseif n == 3 then
		s = 12
	elseif n == 4 then
		s = 15
	end
	local o = 1
	if s ~= 0 then
		self.选择物品 = nil
		self.当前等级选择 = n
		for i=s,s+2 do
			local 临时武器 = table.copy(self.武器数据)
			临时武器.名称 = 临时武器集合[i]
			self.新武器[o]:置物品(临时武器)
			o = o + 1
		end
	end
end

return 光武拓印