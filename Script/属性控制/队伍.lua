-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-08 21:27:20
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-06-03 22:57:58
--======================================================================--
local 内存类_队伍 = class()
local jnzb = require("script/显示类/技能")
local floor = math.floor
local ceil = math.ceil
local insert = table.insert
local remove = table.remove
local tp
function 内存类_队伍:初始化()
	self.等级 = 0
	self.名称 = ""
	self.性别 = 0
	self.模型 = ""
	self.种族 = ""
	self.称谓 = "无称谓"
	self.帮派 = "无帮派"
	self.门派 = "无门派"
	self.人气 = 600
	self.门贡 = 0
	self.帮贡 = 0
	self.气血 = 0
	self.魔法 = 0
	self.愤怒 = 0
	self.活力 = 100
	self.体力 = 100
	self.命中 = 0
	self.伤害 = 0
	self.防御 = 0
	self.速度 = 0
	self.躲避 = 0
	self.灵力 = 0
	self.法伤 = 0
	self.法防 = 0
	self.体质 = 0
	self.魔力 = 0
	self.力量 = 0
	self.耐力 = 0
	self.敏捷 = 0
	self.潜力 = 5
	self.坐骑 = {}
	self.修炼 = {攻击修炼={0,0},法术修炼={0,0},防御修炼={0,0},速度修炼={0,0}}
	self.地图数据={x=0,y=0}
	self.最大体力 = 100
	self.最大活力 = 100
	self.最大气血 = 0
	self.最大魔法 = 0
	self.当前经验 = 0
	self.最大经验 = 0
	self.宝宝列表 = {}
	self.子女列表 = {}
	self.参战宝宝 = {}
	self.可选门派 = {}
	self.当前称谓=""
	self.装备 = {}
	self.灵饰 = {}
	self.法宝 = {}
	self.师门技能 = {}
	self.人物技能 = {}
	self.特殊技能 = {}
	self.辅助技能 = {}
	self.战斗技能 = {}
	self.快捷技能 = {}
	self.染色方案 = 0
	self.染色组 = {}
	self.染色方案 = 0
	self.技能等级 = {0,0,0,0}
	self.装备属性 = {气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0,月饼=0}
	self.QYD={已用乾元丹=0,可用乾元丹=0,已换乾元丹=0,可换乾元丹=0,额外乾元丹=0}
	self.技能属性 = {气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	self.临时属性 = {气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	self.坐骑属性 = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	self.奇经八脉 = {}
	self.人物状态 = {}
	self.变身 = {}
	self.默认技能 = false
	self.可持有武器 = nil
	self.自动 = nil
	self.默认技能 = nil
end

function 内存类_队伍:刷新宝宝技能()
	local 临时技能=""
	for n=1,#self.宝宝列表 do
		for i=1,#self.宝宝列表[n].技能 do
			临时技能=self.宝宝列表[n].技能[i]
			self.宝宝列表[n].技能[i]=tp._技能.创建()
			self.宝宝列表[n].技能[i]:置对象(临时技能,2,"召唤兽")
		end
	end
end

function 取包含技能(名称,经脉流派)
	local 技能 = {
		--大唐官府
		为官之道 = {"杀气诀","翩鸿一击"},
		无双一击 = {"后发制人"},
		神兵鉴赏 = {"兵器谱"},
		疾风步 = {"千里神行"},
		十方无敌 = {"横扫千军", "破釜沉舟"},
		紫薇之术 = {"斩龙诀"},
		文韬武略 = {"反间之计", "安神诀", "嗜血", "其疾如风", "其徐如林", "侵掠如火", "岿然如山"},
		--化生寺

		金刚伏魔 = {"佛法无边"},
		小乘佛法 = {"紫气东来","明光","佛眷"},
		诵经 = {"唧唧歪歪"},
		佛光普照 = {"达摩护体", "金刚护法", "韦陀护法", "金刚护体", "一苇渡江", "拈花妙指", "醍醐灌顶"},
		大慈大悲 = {"我佛慈悲"},
		歧黄之术 = {"推拿", "活血", "推气过宫", "妙手回春", "救死扶伤", "解毒", "舍生取义"},
		渡世步 = {"佛门普渡","谆谆教诲"},

		--女儿村
		毒经 = {nil},
		倾国倾城 = {"红袖添香", "楚楚可怜", "一笑倾城"},
		沉鱼落雁 = {"满天花雨", "情天恨海", "雨落寒沙", "子母神针"},
		闭月羞花 = {"莲步轻舞", "如花解语", "似玉生香", "娉婷袅娜", "月下霓裳", "自矜"},
		香飘兰麝 = {"轻如鸿毛"},
		玉质冰肌 = {"百毒不侵"},
		清歌妙舞 = {"移形换影", "飞花摘叶"},

		--方寸山
		磐龙灭法 = {nil},
		黄庭经 = {"三星灭魔"},
		霹雳咒 = {"五雷咒"},
		符之术 = { "兵解符", "催眠符", "失心符", "落魄符", "失忆符", "追魂符", "离魂符", "失魂符", "定身符", "落雷符", "碎甲符"},
		归元心法 = {"归元咒", "凝神术"},
		神道无念 = {"乾天罡气", "分身术", "神兵护法", "否极泰来"},
		斜月步 = {"乙木仙遁"},

		--龙宫
		破浪诀 = {"神龙摆尾"},
		九龙诀 = {"解封", "清心", "龙魂", "龙骇", "二龙戏珠"},
		呼风唤雨 = {"龙卷雨击"},
		龙腾术 = {"龙腾", "龙战于野"},
		逆鳞术 = {"逆鳞"},
		游龙术 = {"乘风破浪", "水遁"},
		龙附术 = {"龙吟", "龙啸九天", "龙附"},

		--普陀山
		护法金刚 = {nil},
		金刚经 = {"普渡众生", "灵动九天", "莲华妙法"},
		观音咒 = {"紧箍咒", "杨柳甘露"},
		灵性 = {"自在心法", "清静菩提"},
		五行学说 = {"日光华", "靛沧海", "巨岩破", "苍茫树", "地裂火"},
		五行扭转 = {"五行错位", "颠倒五行"},
		莲花宝座 = {"坐莲"},

		--五庄观
		潇湘仙雨 = {"烟雨剑法", "飘渺式", "同伤式"},
		乾坤袖 = {"日月乾坤", "天地同寿", "乾坤妙法"},
		修仙术 = {"炼气化神", "生命之泉", "太极生化", "一气化三清"},
		周易学 = {"驱魔", "驱尸", "玄黄秘术"},
		混元道果 = {nil},
		明性修身 = {"三花聚顶"},
		七星遁 = {"斗转星移"},

		--天宫
		傲世诀 = {"天雷斩", "鸣雷诀"},
		天罡气 = {"天神护体", "天神护法", "天诛地灭", "五雷轰顶", "雷霆万钧", "浩然正气"},
		清明自在 = {"知己知彼"},
		宁气诀 = {"宁心"},
		乾坤塔 = {"镇妖", "错乱", "掌心雷"},
		混天术 = {"百万神兵", "金刚镯","天雷灌注"},
		云霄步 = {"腾云驾雾"},

		--地府

		六道轮回 = {"魂飞魄散", "六道无量"},
		幽冥术 = {"阎罗令", "锢魂术", "黄泉之息", "无间地狱"},
		拘魂诀 = {"判官令", "还阳术", "尸气漫天"},
		灵通术 = {"堪察令", "寡欲令"},
		九幽阴魂 = {"幽冥鬼眼", "冤魂不散"},
		尸腐恶 = {"尸腐毒", "修罗隐身"},
		无常步 = {"杳无音讯"},

		--狮驼岭
		生死搏 = {"象形", "鹰击", "狮搏", "天魔解体", "疯狂鹰击"},
		训兽诀 = {"威慑"},
		魔兽神功 = {"变身", "魔兽啸天", "狮吼"},
		阴阳二气诀 = {"定心术", "魔息术"},
		狂兽诀 = {"连环击", "神力无穷"},
		大鹏展翅 = {"振翅千里"},
		魔兽反噬 = {"极度疯狂"},

		--魔王
		震天诀 = {nil},
		牛逼神功 = {"魔王护持","风云变色","魔冥"},
		火云术 = {"飞砂走石", "三昧真火", "火甲术", "魔火焚世"},
		火牛阵 = {"牛劲", "踏山裂石"},
		牛虱阵 = {"无敌牛虱", "无敌牛妖", "摇头摆尾"},
		回身击 = {"魔王回首"},
		裂石步 = {"牛屎遁"},

		--盘丝洞
		秋波暗送 = {"勾魂", "摄魄"},
		天外魔音 = {nil},
		蛛丝阵法 = {"盘丝舞", "夺命蛛丝"},
		迷情大法 = {"含情脉脉", "瘴气", "魔音摄魂"},
		盘丝大法 = {"盘丝阵", "复苏", "媚眼如丝", "神迷"},
		盘丝步 = {"天罗地网", "天蚕丝", "幻镜术"},
		姊妹相随 = {"姐妹同心"},

		--凌波城
		天地无极 = {"无双战魂", "吞山", "战意", "饮海"},
		九转玄功 = {"不动如山"},
		武神显圣 = {"碎星诀", "镇魂诀"},
		啸傲 = {"穿云破空"},
		气吞山河 = {"裂石", "断岳势", "天崩地裂", "浪涌", "惊涛怒", "翻江搅海"},
		诛魔 = {"腾雷", "指地成钢"},
		法天象地 = {"无穷妙道", "纵地金光"},

		--无底洞
		枯骨心法 = {"移魂化骨", "金莲"},
		阴风绝章 = {"夺魄令", "煞气诀", "惊魂掌", "摧心术"},
		鬼蛊灵蕴 = {"夺命咒"},
		燃灯灵宝 = {"明光宝烛", "金身舍利", "净土灵华"},
		地冥妙法 = {"地涌金莲", "万木凋枯", "追魂刺", "由己渡人"},
		混元神功 = {"元阳护体", "燃血术"},
		秘影迷踪 = {"遁地术"},

		--神木林
		瞬息万变 = {"落叶萧萧", "风灵", "鞭挞"},
		万灵诸念 = {"荆棘舞", "尘土刃", "冰川怒"},
		巫咒 = {"雾杀", "血雨"},
		万物轮转 = {"星月之惠"},
		天人庇护 = {"炎护", "叶隐"},
		神木恩泽 = {"神木呓语", "花语歌谣"},
		驭灵咒 = {"蜜润", "蝼蚁蚀天"},

		--花果山
		神通广大 = {"如意神通","威震凌霄", "气慑天军"},
		如意金箍 = {"当头一棒", "神针撼海", "杀威铁棒", "泼天乱棒"},
		齐天逞胜 = {"九幽除名", "移星换斗", "云暗天昏"},
		金刚之躯 = {"担山赶月", "铜头铁臂"},
		灵猴九窍 = {"无所遁形", "天地洞明", "除光息焰"},
		七十二变 = {"呼子唤孙", "八戒上身"},
		腾云驾霧 = {"筋斗云"},
		--九黎城
		九黎战歌 = {"黎魂","战鼓","怒哮","炎魂"},
		魂枫战舞 = {"枫影二刃"},
		兵铸乾坤 = {"一斧开天"},
		燃铁飞花 = {"三荒尽灭"},
		战火雄魂 = {"铁血生风"},
		魔神降世 = {"力辟苍穹"},
		风行九黎 = {"故壤归心"},
	}
	if 经脉流派=="无双战神" then --大唐
	    if 名称=="紫薇之术" then
	        return {"斩龙诀", "连破"}
	    end
	elseif 经脉流派=="虎贲上将" then --大唐
		if 名称=="文韬武略" then
	        return {"反间之计", "安神诀", "嗜血", "披坚执锐", "其疾如风", "其徐如林", "侵掠如火", "岿然如山" }
	    end
	elseif 经脉流派=="杏林妙手" then--化生
		if 名称=="小乘佛法" then
	        return {"紫气东来","明光","佛眷"}
	    end
	elseif 经脉流派=="护法金刚" then--化生
		if 名称=="小乘佛法" then
	        return {"紫气东来","明光","聚气"}
	    end
	elseif 经脉流派=="无量尊者" then--化生
		if 名称=="小乘佛法" then
	        return {"紫气东来","度厄"}
	    elseif 名称=="佛光普照" then
	    	return {"达摩护体", "金刚护法", "韦陀护法", "金刚护体", "一苇渡江", "拈花妙指", "功德无量"}
	    elseif 名称=="歧黄之术" then
	    	return {"推拿", "活血", "推气过宫", "妙手回春", "救死扶伤", "解毒", "六尘不染"}
	    end
	elseif 经脉流派=="风火妖王" then --魔王
		if 名称=="牛逼神功" then
		    return {"魔王护持"}
		end
	elseif 经脉流派=="巫影祭司" then --神木
		if 名称=="瞬息万变" then
		    return {"蛊木迷瘴", "风灵", "鞭挞"}
	    elseif 名称=="巫咒" then
	    	return {"雾杀", "血雨", "催化"}
		end
	elseif 经脉流派=="灵木神侍" then --神木
		if 名称=="瞬息万变" then
		    return {"落叶萧萧", "风灵", "风萦"}
	    elseif 名称=="神木恩泽" then
	    	return {"神木呓语", "花语歌谣", "疾风秋叶", "古藤秘咒", "木精"}
		end
	elseif 经脉流派=="伏魔天师" then --方寸山
		if 名称=="黄庭经" then
		    return {"三星灭魔","奔雷"}
	    elseif 名称=="归元心法" then
	    	return {"归元咒","凝神术","悲恸"}
		end
	elseif 经脉流派=="五雷正宗" then --方寸山
		if 名称=="霹雳咒" then
		    return {"五雷正法","雷法·崩裂","雷法·震煞","雷法·坤伏","雷法·轰天"}
	    elseif 名称=="符之术" then
	    	return {"兵解符", "催眠符", "失心符", "落魄符", "失忆符", "追魂符", "离魂符", "失魂符", "定身符", "落雷符", "咒符", "碎甲符"}
	    elseif 名称=="神道无念" then
	    	return {"乾天罡气", "神兵护法", "否极泰来"}
		end
	elseif 经脉流派=="花雨伊人" then --女儿
		if 名称=="闭月羞花" then
		    return {"莲步轻舞", "如花解语", "似玉生香", "娉婷袅娜", "月下霓裳"}
		end
	elseif 经脉流派=="花间美人" then --女儿
		if 名称=="闭月羞花" then
		    return {"莲步轻舞", "如花解语", "似玉生香", "娉婷袅娜", "花飞柳舞", "自矜"}
	    elseif 名称=="清歌妙舞" then
	    	return {"移形换影", "葬玉焚花", "飞花摘叶"}
		end
	elseif 经脉流派=="踏雷天尊" then --天宫
		if 名称=="天罡气" then
		    return {"天神护体", "天神护法", "天诛地灭", "五雷轰顶", "雷霆万钧", "浩然正气", "电芒"}
		end
	elseif 经脉流派=="霹雳真君" then --天宫
		if 名称=="傲世诀" then
		    return {"天雷斩", "风雷斩", "鸣雷诀"}
		elseif 名称=="天罡气" then
		    return {"天神护体", "天神护法", "天诛地灭", "五雷轰顶", "浩然正气", "霹雳弦惊", "雷怒霆激", "返璞"}
		end
	elseif 经脉流派=="落伽神女" then --普陀
		if 名称=="金刚经" then
		    return {"普渡众生", "莲华妙法"}
		elseif 名称=="观音咒" then
		    return {"紧箍咒", "杨柳甘露", "剑意莲心"}
	    elseif 名称=="灵性" then
		    return {"自在心法", "清静菩提" , "五行珠"}
	    elseif 名称=="五行学说" then
		    return {"苍茫刺", "日光耀", "靛沧啸", "巨岩击", "地裂焚"}
	    elseif 名称=="五行扭转" then
		    return {"五行错位", "颠倒五行", "五行感应"}
		end
	elseif 经脉流派=="百媚魔姝" then --盘丝
		if 名称=="蛛丝阵法" then
		    return {"盘丝舞", "夺命蛛丝","千蛛噬魂","蛛丝缠绕"}
		end
	elseif 经脉流派=="诛刑毒师" then --地府
		if 名称=="六道轮回" then
		    return {"魂飞魄散", "百鬼噬魂", "血影蚀心"}
		elseif 名称=="幽冥术" then
		    return {"黄泉之息", "无间地狱"}
	    elseif 名称=="拘魂诀" then
		    return {"尸气漫天", "森罗迷瘴"}
		end
	elseif 经脉流派=="万兽之王" then --狮驼
		if 名称=="魔兽神功" then
		    return {"变身", "魔兽啸天"}
		elseif 名称=="狂兽诀" then
		    return {"连环击", "神力无穷", "驯兽·幼狮", "幼狮之搏"}
		end
	elseif 经脉流派=="狂怒斗兽" then --狮驼
		if 名称=="魔兽神功" then
		    return {"变身", "魔兽啸天", "狂怒"}
		end
	elseif 经脉流派=="乾坤力士" then --五庄
		if 名称=="周易学" then
		    return {"驱魔", "驱尸", "骤雨", "玄黄秘术"}
		end
	elseif 经脉流派=="万寿真仙" then --五庄
		if 名称=="潇湘仙雨" then
		    return {"敲金击玉", "金击式", "同伤式"}
		elseif 名称=="周易学" then
		    return {"驱魔", "驱尸", "玄黄秘术", "还丹"}
		end
	elseif 经脉流派=="摄魂迷影" then --无底洞
		if 名称=="枯骨心法" then
		    return {"移魂化骨", "缚魂"}
		elseif 名称=="燃灯灵宝" then
		    return {"明光宝烛", "金身舍利"}
	    elseif 名称=="地冥妙法" then
		    return {"地涌金莲", "万木凋枯", "追魂刺"}
	    elseif 名称=="混元神功" then
		    return {"元阳护体", "燃血术","化羽为血"}
		end
    elseif 经脉流派=="幽冥巫煞" then --无底洞
		if 名称=="枯骨心法" then
		    return {"移魂化骨"}
		elseif 名称=="阴风绝章" then
		    return {"夺魄令", "煞气诀", "惊魂掌", "摧心术", "裂魂"}
		elseif 名称=="燃灯灵宝" then
		    return {"明光宝烛", "金身舍利"}
	    elseif 名称=="地冥妙法" then
		    return {"地涌金莲", "万木凋枯", "追魂刺"}
	    elseif 名称=="混元神功" then
		    return {"元阳护体", "燃血术","化羽为血"}
		end
	elseif 经脉流派=="灵霄斗士" then --凌波城
    	if 名称=="天地无极" then
		    return {"无双战魂", "超级战意", "战意"}
		end
    elseif 经脉流派=="风云战将" then --凌波城
    	if 名称=="天地无极" then
		    return {"天眼神通", "无双战魂", "战意"}
		end
	elseif 经脉流派=="通天行者" then --花果山
		if 名称=="神通广大" then
		    return {"如意神通","灵彻太虚", "气慑天军"}
		elseif 名称=="如意金箍" then
		    return {"棒掀北斗","兴风作浪", "棍打诸神"}
	    elseif 名称=="灵猴九窍" then
		    return {"意马心猿","无所遁形", "天地洞明", "除光息焰"}
		end
	end
	return 技能[名称]
end

function 内存类_队伍:取包含技能(名称,经脉流派)
	local 技能 = {
		--大唐官府
		为官之道 = {"杀气诀","翩鸿一击"},
		无双一击 = {"后发制人"},
		神兵鉴赏 = {"兵器谱"},
		疾风步 = {"千里神行"},
		十方无敌 = {"横扫千军", "破釜沉舟"},
		紫薇之术 = {"斩龙诀"},
		文韬武略 = {"反间之计", "安神诀", "嗜血", "其疾如风", "其徐如林", "侵掠如火", "岿然如山"},
		--化生寺

		金刚伏魔 = {"佛法无边"},
		小乘佛法 = {"紫气东来","明光","佛眷"},
		诵经 = {"唧唧歪歪"},
		佛光普照 = {"达摩护体", "金刚护法", "韦陀护法", "金刚护体", "一苇渡江", "拈花妙指", "醍醐灌顶"},
		大慈大悲 = {"我佛慈悲"},
		歧黄之术 = {"推拿", "活血", "推气过宫", "妙手回春", "救死扶伤", "解毒", "舍生取义"},
		渡世步 = {"佛门普渡","谆谆教诲"},

		--女儿村
		毒经 = {nil},
		倾国倾城 = {"红袖添香", "楚楚可怜", "一笑倾城"},
		沉鱼落雁 = {"满天花雨", "情天恨海", "雨落寒沙", "子母神针"},
		闭月羞花 = {"莲步轻舞", "如花解语", "似玉生香", "娉婷袅娜", "月下霓裳", "自矜"},
		香飘兰麝 = {"轻如鸿毛"},
		玉质冰肌 = {"百毒不侵"},
		清歌妙舞 = {"移形换影", "飞花摘叶"},

		--方寸山
		磐龙灭法 = {nil},
		黄庭经 = {"三星灭魔"},
		霹雳咒 = {"五雷咒"},
		符之术 = { "兵解符", "催眠符", "失心符", "落魄符", "失忆符", "追魂符", "离魂符", "失魂符", "定身符", "落雷符", "碎甲符"},
		归元心法 = {"归元咒", "凝神术"},
		神道无念 = {"乾天罡气", "分身术", "神兵护法", "否极泰来"},
		斜月步 = {"乙木仙遁"},

		--龙宫
		破浪诀 = {"神龙摆尾"},
		九龙诀 = {"解封", "清心", "龙魂", "龙骇", "二龙戏珠"},
		呼风唤雨 = {"龙卷雨击"},
		龙腾术 = {"龙腾", "龙战于野"},
		逆鳞术 = {"逆鳞"},
		游龙术 = {"乘风破浪", "水遁"},
		龙附术 = {"龙吟", "龙啸九天", "龙附"},

		--普陀山
		护法金刚 = {nil},
		金刚经 = {"普渡众生", "灵动九天", "莲华妙法"},
		观音咒 = {"紧箍咒", "杨柳甘露"},
		灵性 = {"自在心法", "清静菩提"},
		五行学说 = {"日光华", "靛沧海", "巨岩破", "苍茫树", "地裂火"},
		五行扭转 = {"五行错位", "颠倒五行"},
		莲花宝座 = {"坐莲"},

		--五庄观
		潇湘仙雨 = {"烟雨剑法", "飘渺式", "同伤式"},
		乾坤袖 = {"日月乾坤", "天地同寿", "乾坤妙法"},
		修仙术 = {"炼气化神", "生命之泉", "太极生化", "一气化三清"},
		周易学 = {"驱魔", "驱尸", "玄黄秘术"},
		混元道果 = {nil},
		明性修身 = {"三花聚顶"},
		七星遁 = {"斗转星移"},

		--天宫
		傲世诀 = {"天雷斩", "鸣雷诀"},
		天罡气 = {"天神护体", "天神护法", "天诛地灭", "五雷轰顶", "雷霆万钧", "浩然正气"},
		清明自在 = {"知己知彼"},
		宁气诀 = {"宁心"},
		乾坤塔 = {"镇妖", "错乱", "掌心雷"},
		混天术 = {"百万神兵", "金刚镯","天雷灌注"},
		云霄步 = {"腾云驾雾"},

		--地府

		六道轮回 = {"魂飞魄散", "六道无量"},
		幽冥术 = {"阎罗令", "锢魂术", "黄泉之息", "无间地狱"},
		拘魂诀 = {"判官令", "还阳术", "尸气漫天"},
		灵通术 = {"堪察令", "寡欲令"},
		九幽阴魂 = {"幽冥鬼眼", "冤魂不散"},
		尸腐恶 = {"尸腐毒", "修罗隐身"},
		无常步 = {"杳无音讯"},

		--狮驼岭
		生死搏 = {"象形", "鹰击", "狮搏", "天魔解体", "疯狂鹰击"},
		训兽诀 = {"威慑"},
		魔兽神功 = {"变身", "魔兽啸天", "狮吼"},
		阴阳二气诀 = {"定心术", "魔息术"},
		狂兽诀 = {"连环击", "神力无穷"},
		大鹏展翅 = {"振翅千里"},
		魔兽反噬 = {"极度疯狂"},

		--魔王
		震天诀 = {nil},
		牛逼神功 = {"魔王护持","风云变色","魔冥"},
		火云术 = {"飞砂走石", "三昧真火", "火甲术", "魔火焚世"},
		火牛阵 = {"牛劲", "踏山裂石"},
		牛虱阵 = {"无敌牛虱", "无敌牛妖", "摇头摆尾"},
		回身击 = {"魔王回首"},
		裂石步 = {"牛屎遁"},

		--盘丝洞
		秋波暗送 = {"勾魂", "摄魄"},
		天外魔音 = {nil},
		蛛丝阵法 = {"盘丝舞", "夺命蛛丝"},
		迷情大法 = {"含情脉脉", "瘴气", "魔音摄魂"},
		盘丝大法 = {"盘丝阵", "复苏", "媚眼如丝", "神迷"},
		盘丝步 = {"天罗地网", "天蚕丝", "幻镜术"},
		姊妹相随 = {"姐妹同心"},

		--凌波城
		天地无极 = {"无双战魂", "吞山", "战意", "饮海"},
		九转玄功 = {"不动如山"},
		武神显圣 = {"碎星诀", "镇魂诀"},
		啸傲 = {"穿云破空"},
		气吞山河 = {"裂石", "断岳势", "天崩地裂", "浪涌", "惊涛怒", "翻江搅海"},
		诛魔 = {"腾雷", "指地成钢"},
		法天象地 = {"无穷妙道", "纵地金光"},

		--无底洞
		枯骨心法 = {"移魂化骨", "金莲"},
		阴风绝章 = {"夺魄令", "煞气诀", "惊魂掌", "摧心术"},
		鬼蛊灵蕴 = {"夺命咒"},
		燃灯灵宝 = {"明光宝烛", "金身舍利", "净土灵华"},
		地冥妙法 = {"地涌金莲", "万木凋枯", "追魂刺", "由己渡人"},
		混元神功 = {"元阳护体", "燃血术"},
		秘影迷踪 = {"遁地术"},

		--神木林
		瞬息万变 = {"落叶萧萧", "风灵", "鞭挞"},
		万灵诸念 = {"荆棘舞", "尘土刃", "冰川怒"},
		巫咒 = {"雾杀", "血雨"},
		万物轮转 = {"星月之惠"},
		天人庇护 = {"炎护", "叶隐"},
		神木恩泽 = {"神木呓语", "花语歌谣"},
		驭灵咒 = {"蜜润", "蝼蚁蚀天"},

		--花果山
		神通广大 = {"如意神通","威震凌霄", "气慑天军"},
		如意金箍 = {"当头一棒", "神针撼海", "杀威铁棒", "泼天乱棒"},
		齐天逞胜 = {"九幽除名", "移星换斗", "云暗天昏"},
		金刚之躯 = {"担山赶月", "铜头铁臂"},
		灵猴九窍 = {"无所遁形", "天地洞明", "除光息焰"},
		七十二变 = {"呼子唤孙", "八戒上身"},
		腾云驾霧 = {"筋斗云"},
		--九黎城
		九黎战歌 = {"黎魂","战鼓","怒哮","炎魂"},
		魂枫战舞 = {"枫影二刃"},
		兵铸乾坤 = {"一斧开天"},
		燃铁飞花 = {"三荒尽灭"},
		战火雄魂 = {"铁血生风"},
		魔神降世 = {"力辟苍穹"},
		风行九黎 = {"故壤归心"},
	}
	if 经脉流派=="无双战神" then --大唐
	    if 名称=="紫薇之术" then
	        return {"斩龙诀", "连破"}
	    end
	elseif 经脉流派=="虎贲上将" then --大唐
		if 名称=="文韬武略" then
	        return {"反间之计", "安神诀", "嗜血", "披坚执锐", "其疾如风", "其徐如林", "侵掠如火", "岿然如山" }
	    end
	elseif 经脉流派=="杏林妙手" then--化生
		if 名称=="小乘佛法" then
	        return {"紫气东来","明光","佛眷"}
	    end
	elseif 经脉流派=="护法金刚" then--化生
		if 名称=="小乘佛法" then
	        return {"紫气东来","明光","聚气"}
	    end
	elseif 经脉流派=="无量尊者" then--化生
		if 名称=="小乘佛法" then
	        return {"紫气东来","度厄"}
	    elseif 名称=="佛光普照" then
	    	return {"达摩护体", "金刚护法", "韦陀护法", "金刚护体", "一苇渡江", "拈花妙指", "功德无量"}
	    elseif 名称=="歧黄之术" then
	    	return {"推拿", "活血", "推气过宫", "妙手回春", "救死扶伤", "解毒", "六尘不染"}
	    end
	elseif 经脉流派=="风火妖王" then --魔王
		if 名称=="牛逼神功" then
		    return {"魔王护持"}
		end
	elseif 经脉流派=="巫影祭司" then --神木
		if 名称=="瞬息万变" then
		    return {"蛊木迷瘴", "风灵", "鞭挞"}
	    elseif 名称=="巫咒" then
	    	return {"雾杀", "血雨", "催化"}
		end
	elseif 经脉流派=="灵木神侍" then --神木
		if 名称=="瞬息万变" then
		    return {"落叶萧萧", "风灵", "风萦"}
	    elseif 名称=="神木恩泽" then
	    	return {"神木呓语", "花语歌谣", "疾风秋叶", "古藤秘咒", "木精"}
		end
	elseif 经脉流派=="伏魔天师" then --方寸山
		if 名称=="黄庭经" then
		    return {"三星灭魔","奔雷"}
	    elseif 名称=="归元心法" then
	    	return {"归元咒","凝神术","悲恸"}
		end
	elseif 经脉流派=="五雷正宗" then --方寸山
		if 名称=="霹雳咒" then
		    return {"五雷正法","雷法·崩裂","雷法·震煞","雷法·坤伏","雷法·轰天"}
	    elseif 名称=="符之术" then
	    	return {"兵解符", "催眠符", "失心符", "落魄符", "失忆符", "追魂符", "离魂符", "失魂符", "定身符", "落雷符", "咒符", "碎甲符"}
	    elseif 名称=="神道无念" then
	    	return {"乾天罡气", "神兵护法", "否极泰来"}
		end
	elseif 经脉流派=="花雨伊人" then --女儿
		if 名称=="闭月羞花" then
		    return {"莲步轻舞", "如花解语", "似玉生香", "娉婷袅娜", "月下霓裳"}
		end
	elseif 经脉流派=="花间美人" then --女儿
		if 名称=="闭月羞花" then
		    return {"莲步轻舞", "如花解语", "似玉生香", "娉婷袅娜", "花飞柳舞", "自矜"}
	    elseif 名称=="清歌妙舞" then
	    	return {"移形换影", "葬玉焚花", "飞花摘叶"}
		end
	elseif 经脉流派=="踏雷天尊" then --天宫
		if 名称=="天罡气" then
		    return {"天神护体", "天神护法", "天诛地灭", "五雷轰顶", "雷霆万钧", "浩然正气", "电芒"}
		end
	elseif 经脉流派=="霹雳真君" then --天宫
		if 名称=="傲世诀" then
		    return {"天雷斩", "风雷斩", "鸣雷诀"}
		elseif 名称=="天罡气" then
		    return {"天神护体", "天神护法", "天诛地灭", "五雷轰顶", "浩然正气", "霹雳弦惊", "雷怒霆激", "返璞"}
		end
	elseif 经脉流派=="落伽神女" then --普陀
		if 名称=="金刚经" then
		    return {"普渡众生", "莲华妙法"}
		elseif 名称=="观音咒" then
		    return {"紧箍咒", "杨柳甘露", "剑意莲心"}
	    elseif 名称=="灵性" then
		    return {"自在心法", "清静菩提" , "五行珠"}
	    elseif 名称=="五行学说" then
		    return {"苍茫刺", "日光耀", "靛沧啸", "巨岩击", "地裂焚"}
	    elseif 名称=="五行扭转" then
		    return {"五行错位", "颠倒五行", "五行感应"}
		end
	elseif 经脉流派=="百媚魔姝" then --盘丝
		if 名称=="蛛丝阵法" then
		    return {"盘丝舞", "夺命蛛丝","千蛛噬魂","蛛丝缠绕"}
		end
	elseif 经脉流派=="诛刑毒师" then --地府
		if 名称=="六道轮回" then
		    return {"魂飞魄散", "百鬼噬魂", "血影蚀心"}
		elseif 名称=="幽冥术" then
		    return {"黄泉之息", "无间地狱"}
	    elseif 名称=="拘魂诀" then
		    return {"尸气漫天", "森罗迷瘴"}
		end
	elseif 经脉流派=="万兽之王" then --狮驼
		if 名称=="魔兽神功" then
		    return {"变身", "魔兽啸天"}
		elseif 名称=="狂兽诀" then
		    return {"连环击", "神力无穷", "驯兽·幼狮", "幼狮之搏"}
		end
	elseif 经脉流派=="狂怒斗兽" then --狮驼
		if 名称=="魔兽神功" then
		    return {"变身", "魔兽啸天", "狂怒"}
		end
	elseif 经脉流派=="乾坤力士" then --五庄
		if 名称=="周易学" then
		    return {"驱魔", "驱尸", "骤雨", "玄黄秘术"}
		end
	elseif 经脉流派=="万寿真仙" then --五庄
		if 名称=="潇湘仙雨" then
		    return {"敲金击玉", "金击式", "同伤式"}
		elseif 名称=="周易学" then
		    return {"驱魔", "驱尸", "玄黄秘术", "还丹"}
		end
	elseif 经脉流派=="摄魂迷影" then --无底洞
		if 名称=="枯骨心法" then
		    return {"移魂化骨", "缚魂"}
		elseif 名称=="燃灯灵宝" then
		    return {"明光宝烛", "金身舍利"}
	    elseif 名称=="地冥妙法" then
		    return {"地涌金莲", "万木凋枯", "追魂刺"}
	    elseif 名称=="混元神功" then
		    return {"元阳护体", "燃血术","化羽为血"}
		end
    elseif 经脉流派=="幽冥巫煞" then --无底洞
		if 名称=="枯骨心法" then
		    return {"移魂化骨"}
		elseif 名称=="阴风绝章" then
		    return {"夺魄令", "煞气诀", "惊魂掌", "摧心术", "裂魂"}
		elseif 名称=="燃灯灵宝" then
		    return {"明光宝烛", "金身舍利"}
	    elseif 名称=="地冥妙法" then
		    return {"地涌金莲", "万木凋枯", "追魂刺"}
	    elseif 名称=="混元神功" then
		    return {"元阳护体", "燃血术","化羽为血"}
		end
	elseif 经脉流派=="灵霄斗士" then --凌波城
    	if 名称=="天地无极" then
		    return {"无双战魂", "超级战意", "战意"}
		end
    elseif 经脉流派=="风云战将" then --凌波城
    	if 名称=="天地无极" then
		    return {"天眼神通", "无双战魂", "战意"}
		end
	elseif 经脉流派=="通天行者" then --花果山
		if 名称=="神通广大" then
		    return {"如意神通","灵彻太虚", "气慑天军"}
		elseif 名称=="如意金箍" then
		    return {"棒掀北斗","兴风作浪", "棍打诸神"}
	    elseif 名称=="灵猴九窍" then
		    return {"意马心猿","无所遁形", "天地洞明", "除光息焰"}
		end
	end
	return 技能[名称]
end

function 内存类_队伍:重置属性(属性)
	for n, v in pairs(属性) do
		if type(n)~="function" and type(n)~="运行父函数" and n~="存档数据" and n~="宝宝列表"  then
			if type(n)=="table" then
				self[n]=table.loadstring(table.tostring(v))
			else
				self[n]=v
			end
		end
	end
	local 临时技能=0
	for n=1,#self.师门技能 do
		临时技能=require("script/显示类/技能")()
		临时技能:置对象(self.师门技能[n].名称,nil,self.门派)
		临时技能.包含技能={}
		临时技能.学会=self.师门技能[n].学会
		临时技能.等级=self.师门技能[n].等级
		local w = self:取包含技能(self.师门技能[n].名称,self.奇经八脉["当前流派"])
		for s=1,#w do
			临时技能.包含技能[s] = require("script/显示类/技能")()
			临时技能.包含技能[s]:置对象(w[s],nil,self.门派)
			临时技能.包含技能[s].学会=self.师门技能[n].包含技能[s].学会
			临时技能.包含技能[s].等级=self.师门技能[n].包含技能[s].等级
		end
		self.师门技能[n]=临时技能
	end
	self.角色坐标={x=self.地图数据.x,y=self.地图数据.y}
	self.当前称谓=self.当前称谓
	tp.当前称谓=self.当前称谓
    for k,v in pairs(self.系统设置) do
        tp[k]=self.系统设置[k]
    end
end

function 内存类_队伍:置根(根)
	tp = 根
end

function 内存类_队伍:置新对象(ID)
	local ms = tp:取模型(ID)
	local ls = tp:队伍角色(ms)
	self.ID = ID
	self.名称 = ls.名称
	self.性别 = ls.性别
	self.模型 = ls.模型
	self.种族 = ls.种族
	self.可选门派 = ls.门派
	self.染色组 = {}
	self.染色方案 = ls.染色方案
	self.当前称谓=ls.当前称谓
	self.可持有武器 = ls.武器
end

function 内存类_队伍:穿戴装备(装备,格子)
	self.装备属性.气血 = self.装备属性.气血 +  (装备.气血 or 0)
	self.装备属性.魔法 = self.装备属性.魔法 + (装备.魔法 or 0)
	self.装备属性.命中 = self.装备属性.命中 + (装备.命中 or 0)
	self.装备属性.伤害 = self.装备属性.伤害 + (装备.伤害 or 0)
	self.装备属性.防御 = self.装备属性.防御 +  (装备.防御 or 0)
	self.装备属性.速度 = self.装备属性.速度 +  (装备.速度 or 0)
	self.装备属性.躲避 = self.装备属性.躲避 +  (装备.躲避 or 0)
	self.装备属性.灵力 = self.装备属性.灵力 + (装备.灵力 or 0)
	self.装备属性.气血 = self.装备属性.气血 + (装备.体质 or 0)*5
	self.装备属性.魔法 = self.装备属性.魔法 + (装备.魔力 or 0)*5
	self.装备属性.伤害 = self.装备属性.伤害 + floor(((装备.力量 or 0)*3.5))
	self.装备属性.防御 = self.装备属性.防御 + floor(((装备.耐力 or 0)*2.3))
	self.装备属性.速度 = self.装备属性.速度 + floor(((装备.敏捷 or 0)*2.3))
	if 格子 < 7 then
		self.装备[格子] = 装备
		if 装备.特技 ~= nil then
			self.特殊技能[格子] = jnzb()
			self.特殊技能[格子]:置对象(装备.特技)
		end
		if 装备.套装效果 ~= nil then
			local sl = {}
			local ab = true
			for i=1,#self.套装 do
				if self.套装[i][1] == 装备.套装效果[1] and self.套装[i][2] == 装备.套装效果[2] then
					local abc = false
					local abd = true
					for s=1,#self.套装[i][4] do
						if self.套装[i][4][s] == 格子 then
							abd = false
							break
						end
					end
					if abd then
						insert(self.套装[i][4],格子)
						abc = true
					end
					if abc then
						self.套装[i][3] = (self.套装[i][3] or 0) + 1
					end
					ab = false
					break
				end
			end
			if ab then
				insert(self.套装,{装备.套装效果[1],装备.套装效果[2],1,{格子}})
			end
		end
		if 格子 == 3 then
			tp.场景.人物:穿戴装备()
		end
	else
		self.灵饰[格子-9] = 装备

	end
	if tp.窗口.队伍栏.可视 then
		tp.窗口.队伍栏.队伍格子[1]:置人物(tp.队伍[1])
	end
	self:刷新信息("2")
end

function 内存类_队伍:卸下装备(装备,格子)
	self.装备属性.气血 = self.装备属性.气血 -  (装备.气血 or 0)
	self.装备属性.魔法 = self.装备属性.魔法 - (装备.魔法 or 0)
	self.装备属性.命中 = self.装备属性.命中 - (装备.命中 or 0)
	self.装备属性.伤害 = self.装备属性.伤害 - (装备.伤害 or 0)
	self.装备属性.防御 = self.装备属性.防御 -  (装备.防御 or 0)
	self.装备属性.速度 = self.装备属性.速度 -  (装备.速度 or 0)
	self.装备属性.躲避 = self.装备属性.躲避 - (装备.躲避 or 0)
	self.装备属性.灵力 = self.装备属性.灵力 - (装备.灵力 or 0)
	self.装备属性.气血 = self.装备属性.气血 - (装备.体质 or 0)*5
	self.装备属性.魔法 = self.装备属性.魔法 - (装备.魔力 or 0)*5
	self.装备属性.伤害 = self.装备属性.伤害 - floor(((装备.力量 or 0)*3.5))
	self.装备属性.防御 = self.装备属性.防御 - floor(((装备.耐力 or 0)*2.3))
	self.装备属性.速度 = self.装备属性.速度 - floor(((装备.敏捷 or 0)*2.3))
	if 格子 < 7 then
		if 装备.套装效果 ~= nil then
			for i=1,#self.套装 do
				if self.套装[i] ~= nil and self.套装[i][1] == 装备.套装效果[1] and self.套装[i][2] == 装备.套装效果[2] then
					local abd = nil
					for s=1,#self.套装[i][4] do
						if self.套装[i][4][s] == 格子 then
							abd = s
							break
						end
					end
					if abd then
						remove(self.套装[i][4],abd)
					end
					if #self.套装[i][4] == 0 then
						remove(self.套装,i)
					end
				end
			end
		end
		if 格子 == 3 then
			tp.场景.人物:卸下装备()
		end
		if tp.窗口.队伍栏.可视 then
			tp.窗口.队伍栏.队伍格子[1]:置人物(tp.队伍[1])
		end
		self.装备[格子] = nil
	else
		self.灵饰[格子-9] = nil

	end
	self:刷新信息("2")
end

function 内存类_队伍:升级()
	self.等级 = self.等级 + 1
	self.体质 = self.体质 + 1
	self.魔力 = self.魔力 + 1
	self.力量 = self.力量 + 1
	self.耐力 = self.耐力 + 1
	self.敏捷 = self.敏捷 + 1
	self.潜力 = self.潜力 + 5
	self.最大体力 = self.最大体力 + 10
	self.最大活力 = self.最大活力 + 10
	self.当前经验 = self.当前经验 - self.最大经验
	self:刷新信息("1")
end

function 内存类_队伍:降级(级数)
	self.等级 = self.等级 - 级数
	self.体质 = self.体质 -级数
	self.魔力 = self.魔力 - 级数
	self.力量 = self.力量 - 级数
	self.耐力 = self.耐力 - 级数
	self.敏捷 = self.敏捷 - 级数
	self.潜力 = self.潜力 - 级数 * 5
	self.最大体力 = self.最大体力 - 级数 * 10
	self.最大活力 = self.最大活力 - 级数 * 10
	if self.潜力 <= 0 then
		self.潜力 = 0
	end
	self:刷新信息("1")
end

function 内存类_队伍:刷新信息(是否,体质,魔力)
end

function 内存类_队伍:刷新临时信息(是否,体质,魔力)
	local 五维属性 = self:临时取属性(self.种族,{self.临时属性.体质,self.临时属性.魔力,self.临时属性.力量,self.临时属性.耐力,self.临时属性.敏捷},self.技能等级)
	self.临时属性 = {气血=五维属性["气血"],魔法=五维属性["法力"],命中=五维属性["命中"],伤害=五维属性["伤害"],防御=五维属性["防御"],速度=五维属性["速度"],躲避=五维属性["躲避"],灵力=五维属性["灵力"],法伤=五维属性["灵力"],法防=五维属性["灵力"],体质=self.临时属性.体质,魔力=self.临时属性.魔力,力量=self.临时属性.力量,耐力=self.临时属性.耐力,敏捷=self.临时属性.敏捷}
end

function 内存类_队伍:临时取属性(种族,五维,技能)
	local 属性={}
	local 力量 = 五维[3]
	local 体质 = 五维[1]
	local 魔力 = 五维[2]
	local 耐力 = 五维[4]
	local 敏捷 = 五维[5]
	技能 = 技能 or {0,0,0,0}
	if 种族 == "人" or 种族 == 1 then
		属性 = {
			命中 = floor(力量 * 2.01),
			伤害 = floor(力量 * 0.67),
			防御 = floor(耐力 * 1.5),
			速度 = floor((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
			灵力 = floor((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
			躲避 = floor(敏捷),
			气血 = floor((体质 * 5)),
			法力 = floor((魔力 * 3)),
		}
	elseif 种族 == "魔" or 种族 == 2 then
		属性 = {
			命中 = floor(力量 * 2.31),
			伤害 = floor(力量 * 0.77),
			防御 = floor(耐力 * 1.4),
			速度 = floor((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
			灵力 = floor((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
			躲避 = floor(敏捷),
			气血 = floor((体质 * 6)),
			法力 = floor((魔力 * 2.5)),
		}
	elseif 种族 == "仙" or 种族 == 3 then
		属性 = {
			命中 = floor(力量 * 1.71),
			伤害 = floor(力量 * 0.57),
			防御 = floor(耐力 * 1.6),
			速度 = floor((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
			灵力 = floor((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
			躲避 = floor(敏捷),
			气血 = floor((体质 * 4.5)),
			法力 = floor((魔力 * 3.5)),
		}
	end
	return 属性
end

function 内存类_队伍:有无技能(名称)
	for n=1,#self.人物技能 do
		if self.人物技能[n].名称 == 名称 then
			return true
		end
	end
	return false
end

function 内存类_队伍:学会技能(id,gz)
	if self.师门技能[id] ~= nil then
		for s=1,#self.师门技能[id].包含技能 do
			if self.师门技能[id].包含技能[s].名称 == gz and not self:有无技能(gz) then
				self.师门技能[id].包含技能[s].学会 = true
				self.师门技能[id].包含技能[s].等级 = self.师门技能[id].等级
				insert(self.人物技能,self.师门技能[id].包含技能[s])
				tp.窗口.消息框:添加文本("学会技能 "..gz)
			end
		end
	end
end

function 内存类_队伍:门派技能算法(基础,成长,等级)
	local 累计属性=0
	for i=1,等级 do
		累计属性=累计属性+基础+成长*i--(i-1)
	end
	return  累计属性
end

function 内存类_队伍:升级技能(jn,lp) -- 升级获得技能
	-- 化生
	if jn.等级 == nil then
		jn.等级 = 1
	end
	if jn.名称 == "金刚伏魔" then
		self.技能属性.伤害 = qz(self:门派技能算法(2,0.02,jn.等级))
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(2, "佛法无边")
			end
		end
	elseif jn.名称 == "小乘佛法" then
		if jn.等级 >= 1 then
			if lp=="杏林妙手" then
			    self:学会技能(1, "明光")--被动
				self:学会技能(1, "佛眷")--被动
			elseif  lp=="护法金刚" then
				self:学会技能(1, "明光")--被动
				self:学会技能(1, "聚气")--被动
			elseif  lp=="无量尊者" then
				self:学会技能(1, "度厄")--被动
			end
		end
		if jn.等级 >= 50 then
			self:学会技能(1, "紫气东来")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "诵经" then
		if jn.等级 >= 1 then
			self:学会技能(3, "唧唧歪歪")
		end
	elseif jn.名称 == "佛光普照" then
		if jn.等级 >= 20 then
			self:学会技能(4, "韦陀护法")
		end
		if jn.等级 >= 35 then
			self:学会技能(4, "金刚护体")
			self:学会技能(4, "拈花妙指")
		end
		if jn.等级 >= 30 then
			self:学会技能(4, "达摩护体")
			self:学会技能(4, "一苇渡江")
			self:学会技能(4, "金刚护法")
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				if lp=="无量尊者" then
					self:学会技能(4, "功德无量")
				else
					self:学会技能(4, "醍醐灌顶")
				end
			end
		end
	elseif jn.名称 == "大慈大悲" then
		if jn.等级 >= 40 then
			self:学会技能(5, "我佛慈悲")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "歧黄之术" then
		if jn.等级 >= 10 then
			self:学会技能(6, "推拿")
		end
		if jn.等级 >= 15 then
			self:学会技能(6, "解毒")
		end
		if jn.等级 >= 25 then
			self:学会技能(6, "活血")
		end
		if jn.等级 >= 35 then
			self:学会技能(6, "推气过宫")
			self:学会技能(6, "妙手回春")
			self:学会技能(6, "救死扶伤")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				if lp=="无量尊者" then
					self:学会技能(6, "六尘不染")
				else
					self:学会技能(6, "舍生取义")
				end
			end
		end
	elseif jn.名称 == "渡世步" then
		if jn.等级 >= 1 then
			self:学会技能(7, "佛门普渡")
		end
		if jn.等级 >= 20 then
			self:学会技能(7, "谆谆教诲")
		end
		self.技能属性.躲避 = qz(jn.等级*2)

		-- 大唐
	elseif jn.名称 == "为官之道" then
		if jn.等级 >= 15 then
			self:学会技能(1, "杀气诀")
		end
		if jn.等级 >= 45 then
			self:学会技能(1, "翩鸿一击")
		end
	elseif jn.名称 == "无双一击" then
		if jn.等级 >= 25 then
			self:学会技能(2, "后发制人")
		end
		self.技能属性.命中 = qz(self:门派技能算法(0.97,0.0203,jn.等级))
	elseif jn.名称 == "神兵鉴赏" then
		if jn.等级 >= 15 then
			self:学会技能(3, "兵器谱")
		end
	elseif jn.名称 == "疾风步" then
		if jn.等级 >= 1 then
			self:学会技能(4, "千里神行")
		end
		self.技能属性.躲避 = floor(jn.等级 * 2.5)
	elseif jn.名称 == "十方无敌" then
		if jn.等级 >= 30 then
			self:学会技能(5, "横扫千军")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(5, "破釜沉舟")
			end
		end
		self.技能属性.伤害 = qz(self:门派技能算法(2.46,0.0143,jn.等级))
	elseif jn.名称 == "紫薇之术" then
		if jn.等级 >= 50 then
			self:学会技能(6, "斩龙诀")
		end
		if lp=="无双战神" then
		    self:学会技能(6, "连破")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "文韬武略" then
		if lp=="虎贲上将" then
	        self:学会技能(7, "披坚执锐")
	    end
		if jn.等级 >= 20 then
			self:学会技能(7, "反间之计")
		end
		if jn.等级 >= 35 then
			self:学会技能(7, "嗜血")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(7, "安神诀")
			end
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(7, "其疾如风")
				self:学会技能(7, "其徐如林")
				self:学会技能(7, "侵掠如火")
				self:学会技能(7, "岿然如山")
			end
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))

		-- 龙宫
	elseif jn.名称 == "九龙诀" then
		if jn.等级 >= 1 then
			self:学会技能(1, "龙魂")--被动
			self:学会技能(1, "龙骇")--被动
		end
		if jn.等级 >= 15 then
			self:学会技能(1, "清心")
		end
		if jn.等级 >= 30 then
			self:学会技能(1, "解封")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 130 then
				self:学会技能(1, "二龙戏珠")
			end
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "破浪诀" then
		self.技能属性.伤害 = qz(self:门派技能算法(2.0973,0.01899,jn.等级))
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(2, "神龙摆尾")
			end
		end
	elseif jn.名称 == "呼风唤雨" then
		if jn.等级 >= 15 then
			self:学会技能(3, "龙卷雨击")
		end
	elseif jn.名称 == "龙腾术" then
		if jn.等级 >= 50 then
			self:学会技能(4, "龙腾")
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(4, "龙战于野")
			end
		end
	elseif jn.名称 == "逆鳞术" then
		if jn.等级 >= 30 then
			self:学会技能(5, "逆鳞")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "游龙术" then
		if jn.等级 >= 1 then
			self:学会技能(6, "水遁")
		end
		if jn.等级 >= 20 then
			self:学会技能(6, "乘风破浪")
		end
		self.技能属性.躲避 = qz(jn.等级*2)
	elseif jn.名称 == "龙附术" then
		if jn.等级 >= 25 then
			self:学会技能(7, "龙啸九天")
		end
		if jn.等级 >= 30 then
			self:学会技能(7, "龙吟")
		end
		if jn.等级 >= 35 then
			self:学会技能(7, "龙附")
		end
		-- 方寸
	elseif jn.名称 == "黄庭经" then
		if jn.等级 >= 30 then
			self:学会技能(1, "三星灭魔")
		end
		if lp=="伏魔天师" then
		    if jn.等级 >= 1 then
				self:学会技能(20, "奔雷")
			end
		end
	elseif jn.名称 == "磐龙灭法" then
		self.技能属性.伤害 = qz(self:门派技能算法(1.9799,0.02019,jn.等级))
	elseif jn.名称 == "霹雳咒" then
		if lp=="五雷正宗" then
		    if jn.等级 >= 10 then
		    	self:学会技能(3, "五雷正法")
				self:学会技能(3, "雷法·崩裂")
				self:学会技能(3, "雷法·震煞")
				self:学会技能(3, "雷法·坤伏")
				self:学会技能(3, "雷法·轰天")
			end
		else
			if jn.等级 >= 1 then
				self:学会技能(3, "五雷咒")
			end
		end
	elseif jn.名称 == "符之术" then
		if jn.等级 >= 10 then
			self:学会技能(4, "催眠符")
		end
		if lp=="五雷正宗" then
		    if jn.等级 >= 10 then
		    	self:学会技能(4, "咒符")
		    end
		end
		if jn.等级 >= 15 then
			self:学会技能(4, "落魄符")
		end
		if jn.等级 >= 20 then
			self:学会技能(4, "追魂符")
		end
		if jn.等级 >= 20 then
			self:学会技能(4, "失忆符")
		end
		-- if jn.等级 >= 21 then
		-- 	self:学会技能(4, "飞行符")
		-- end
		if jn.等级 >= 30 then
			self:学会技能(4, "定身符")
		end
		if jn.等级 >= 20 then
			self:学会技能(4, "落雷符")
		end
		if jn.等级 >= 25 then
			self:学会技能(4, "失魂符")
			self:学会技能(4, "离魂符")
		end
		if jn.等级 >= 40 then
			self:学会技能(4, "失心符")
		end
		-- if self.历劫.飞升 == true then
			-- if jn.等级 >= 120 then--测试模式
				self:学会技能(4, "碎甲符")
			-- end
		-- end
	elseif jn.名称 == "归元心法" then
		if jn.等级 >= 10 then
			self:学会技能(5, "归元咒")
			self:学会技能(5, "凝神术")
		end
		if lp=="伏魔天师" then
		    if jn.等级 >= 10 then
				self:学会技能(5, "悲恸")
			end
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "神道无念" then
		if jn.等级 >= 30 then
			self:学会技能(6, "乾天罡气")
		end
		if jn.等级 >= 35 then
			self:学会技能(6, "神兵护法")
		end
		if lp~="五雷正宗" then
		-- if self.历劫.飞升 == true then
			-- if jn.等级 >= 120 then--测试模式
				self:学会技能(6, "分身术")
			-- end
		-- end
		end
		-- if self.历劫.化圣 == true then
			-- if jn.等级 >= 180 then--测试模式
				self:学会技能(6, "否极泰来")
			-- end
		-- end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "斜月步" then
		if jn.等级 >= 1 then
			self:学会技能(7, "乙木仙遁")
		end
		self.技能属性.躲避 = qz(jn.等级*2)

		-- 地府
	elseif jn.名称 == "灵通术" then
		if jn.等级 >= 30 then
			self:学会技能(1, "寡欲令")
		end
		if jn.等级 >= 50 then
			self:学会技能(1, "堪察令")
		end
	elseif jn.名称 == "六道轮回" then
		if lp=="诛刑毒师" then
		    if jn.等级 >= 30 then
				self:学会技能(2, "百鬼噬魂")
				self:学会技能(2, "血影蚀心")
			end
		else
			if jn.等级 >= 45 then
				self:学会技能(2, "六道无量")
			end
		end
		if jn.等级 >= 50 then
			self:学会技能(2, "魂飞魄散")
		end
		self.技能属性.伤害 = qz(self:门派技能算法(1.46569,0.0092,jn.等级))

	elseif jn.名称 == "幽冥术" then
		if lp~="诛刑毒师" then
			if jn.等级 >= 25 then
				self:学会技能(3, "阎罗令")
			end
			if jn.等级 >= 75 then
				self:学会技能(3, "锢魂术")
			end
		end

		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then--测试模式
				self:学会技能(3, "黄泉之息")
			end
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then--测试模式
				self:学会技能(3, "无间地狱")
			end
		end
	elseif jn.名称 == "拘魂诀" then
		if lp=="诛刑毒师" then
			if jn.等级 >= 20 then
				self:学会技能(4, "森罗迷瘴")
			end
		else
			if jn.等级 >= 20 then
				self:学会技能(4, "判官令")
			end
			if self.历劫.飞升 == true then
				if jn.等级 >= 120 then--测试模式
					self:学会技能(4, "还阳术")
				end
			end
		end
		if jn.等级 >= 35 then
			self:学会技能(4, "尸气漫天")
		end
	elseif jn.名称 == "九幽阴魂" then
		if jn.等级 >= 30 then
			self:学会技能(5, "幽冥鬼眼")
		end
		if jn.等级 >= 50 then
			self:学会技能(5, "冤魂不散")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "尸腐恶" then
		if jn.等级 >= 20 then
			self:学会技能(6, "尸腐毒")
		end
		if jn.等级 >= 20 then
			self:学会技能(6, "修罗隐身")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "无常步" then
		if jn.等级 >= 1 then
			self:学会技能(7, "杳无音讯")
		end
		self.技能属性.躲避 = qz(jn.等级*2)

		-- 天宫
	elseif jn.名称 == "天罡气" then
		if lp=="霹雳真君" then
			if jn.等级 >= 25 then
				self:学会技能(1, "霹雳弦惊")
				self:学会技能(1, "雷怒霆激")
			end
			if jn.等级 >= 1 then
				self:学会技能(1, "返璞")
			end
		end
		if jn.等级 >= 30 then
			self:学会技能(1, "天神护体")
		end
		if jn.等级 >= 40 then
			self:学会技能(1, "天神护法")
		end
		if jn.等级 >= 35 then
			self:学会技能(1, "五雷轰顶")
			self:学会技能(1, "浩然正气")
			self:学会技能(1, "天诛地灭")
		end
		if lp~="霹雳真君" and jn.等级 >= 50 then
		   self:学会技能(1, "雷霆万钧")
		end
		if lp=="踏雷天尊" and jn.等级 >= 45 then
		   self:学会技能(1, "电芒")
		end
		self.技能属性.伤害 = qz(self:门派技能算法(2.4612,0.02039,jn.等级))
	elseif jn.名称 == "傲世诀" then
		if jn.等级 >= 25 then
			self:学会技能(2, "天雷斩")
			if lp=="霹雳真君" then
			    self:学会技能(2, "风雷斩")
			end
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(2, "鸣雷诀")
			end
		end
	elseif jn.名称 == "宁气诀" then
		if jn.等级 >= 20 then
			self:学会技能(4, "宁心")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "清明自在" then
		if jn.等级 >= 20 then
			self:学会技能(3, "知己知彼")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "乾坤塔" then
		if jn.等级 >= 30 then
			self:学会技能(5, "镇妖")
		end
		if jn.等级 >= 50 then
			self:学会技能(5, "错乱")
		end
		if jn.等级 >= 50 then
			self:学会技能(5, "掌心雷") --新增
		end
	elseif jn.名称 == "混天术" then
		if jn.等级 >= 40 then
			self:学会技能(6, "百万神兵")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(6, "金刚镯")
				self:学会技能(6,"天雷灌注")
			end
		end
	elseif jn.名称 == "云霄步" then
		if jn.等级 >= 1 then
			self:学会技能(7, "腾云驾雾")
		end
		self.技能属性.躲避 = qz(jn.等级*2)

		-- 魔王
	elseif jn.名称 == "牛逼神功" then
		if jn.等级 >= 35 then
			self:学会技能(1, "魔王护持")
		end
		if lp~="风火妖王" then
			if jn.等级 >= 1 then
		        self:学会技能(1,"魔冥") --被动
		    end
			if jn.等级 >= 45 then
		        self:学会技能(1,"风云变色")
		    end
		end
	elseif jn.名称 == "火云术" then
		if jn.等级 >= 30 then
			self:学会技能(3, "飞砂走石")
		end
		if jn.等级 >= 20 then
			self:学会技能(3, "三昧真火")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 20 then
				self:学会技能(3, "火甲术")
			end
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(3, "魔火焚世")
			end
		end
	elseif jn.名称 == "裂石步" then
		if jn.等级 >= 1 then
			self:学会技能(7, "牛屎遁")
		end
		self.技能属性.躲避 = qz(jn.等级*2)
	elseif jn.名称 == "震天诀" then
		self.技能属性.伤害 = qz(self:门派技能算法(1.98309,0.02019,jn.等级))
	elseif jn.名称 == "牛虱阵" then
		if jn.等级 >= 30 then
			self:学会技能(5, "无敌牛虱")
			self:学会技能(5, "无敌牛妖")
			self:学会技能(5, "摇头摆尾")
		end
	elseif jn.名称 == "火牛阵" then
		if jn.等级 >= 30 then
			self:学会技能(4, "牛劲")
		end
		if jn.等级 >= 50 then
			self:学会技能(4, "踏山裂石")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "回身击" then
		if jn.等级 >= 30 then
			self:学会技能(6, "魔王回首")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))

		--普陀
	elseif jn.名称 == "灵性" then
		if jn.等级 >= 60 then
			self:学会技能(1, "自在心法")
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(1, "清静菩提")
			end
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "护法金刚" then
		self.技能属性.伤害 = qz(self:门派技能算法(1.99,0.02,jn.等级))
	elseif jn.名称 == "金刚经" then
		if jn.等级 >= 15 then
			self:学会技能(5, "普渡众生")
		end
		if jn.等级 >= 35 then
			self:学会技能(5, "莲华妙法")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(5, "灵动九天")
			end
		end
	elseif jn.名称 == "观音咒" then
		if jn.等级 >= 30 then
			self:学会技能(3, "紧箍咒")
		end
		if jn.等级 >= 20 then
			self:学会技能(3, "杨柳甘露")
		end
	elseif jn.名称 == "五行学说" then
		if jn.等级 >= 10 then
			self:学会技能(4, "日光华")
		end
		if jn.等级 >= 10 then
			self:学会技能(4, "靛沧海")
		end
		if jn.等级 >= 10 then
			self:学会技能(4, "巨岩破")
		end
		if jn.等级 >= 10 then
			self:学会技能(4, "苍茫树")
		end
		if jn.等级 >= 10 then
			self:学会技能(4, "地裂火")
		end
	elseif jn.名称 == "五行扭转" then
		if jn.等级 >= 20 then
			self:学会技能(6, "颠倒五行")
			self:学会技能(6, "五行错位")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "莲花宝座" then
		if jn.等级 >= 1 then
			self:学会技能(7, "坐莲")
		end
		self.技能属性.躲避 = qz(jn.等级*2)

		-- 五庄观
	elseif jn.名称 == "周易学" then
		if jn.等级 >= 20 then
			self:学会技能(1, "驱魔")
		end
		if jn.等级 >= 25 then
			self:学会技能(1, "驱尸")
		end
		if lp=="万寿真仙" then
			if jn.等级 >= 20 then
				self:学会技能(1, "还丹")--被动
			end
		elseif lp=="乾坤力士" then
			if jn.等级 >= 20 then
				self:学会技能(1, "骤雨")--被动
			end
		end
		if jn.等级 >= 25 then
			self:学会技能(1, "玄黄秘术")
		end
	elseif jn.名称 == "潇湘仙雨" then
		if lp=="万寿真仙" then
		    if jn.等级 >= 20 then
				self:学会技能(2, "金击式")
			end
			if jn.等级 >= 25 then
				self:学会技能(2, "敲金击玉")
			end
		else
			if jn.等级 >= 20 then
				self:学会技能(2, "飘渺式")
			end
		    if jn.等级 >= 25 then
				self:学会技能(2, "烟雨剑法")
			end
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(2, "同伤式")
			end
		end
		self.技能属性.伤害 = qz(self:门派技能算法(1.48049,0.02009,jn.等级))--好像确实是
	elseif jn.名称 == "乾坤袖" then
		if jn.等级 >= 20 then
			self:学会技能(3, "日月乾坤")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(3, "天地同寿")
				self:学会技能(3, "乾坤妙法")
			end
		end
	elseif jn.名称 == "修仙术" then
		if jn.等级 >= 30 then
			self:学会技能(4, "炼气化神")
		end
		if jn.等级 >= 30 then
			self:学会技能(4, "生命之泉")
		end
		if jn.等级 >= 35 then
			self:学会技能(4, "一气化三清")
			self:学会技能(4, "太极生化")
		end
	elseif jn.名称 == "混元道果" then
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "明性修身" then
		if jn.等级 >= 30 then
			self:学会技能(6, "三花聚顶")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "七星遁" then
		if jn.等级 >= 1 then
			self:学会技能(7, "斗转星移")
		end
		self.技能属性.躲避 = qz(jn.等级*2)

		-- 狮驼岭
	elseif jn.名称 == "魔兽神功" then
		if jn.等级 >= 20 then
			self:学会技能(1, "变身")
			self:学会技能(1, "魔兽啸天")
		end
		if lp=="嗜血狂魔" then
			if jn.等级 >= 1 then
				self:学会技能(1, "狮吼") --被动
			end
		elseif lp=="狂怒斗兽" then
			if jn.等级 >= 30 then
				self:学会技能(1, "狂怒") --被动
			end
		end

	elseif jn.名称 == "生死搏" then
		if jn.等级 >= 20 then
			self:学会技能(2, "象形")
		end
		if jn.等级 >= 30 then
			self:学会技能(2, "鹰击")
		end
		if jn.等级 >= 20 then
			self:学会技能(2, "狮搏")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(2, "天魔解体")
			end
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(2, "疯狂鹰击")
			end
		end
		self.技能属性.伤害 = qz(self:门派技能算法(1.976,0.0091,jn.等级))
	elseif jn.名称 == "训兽诀" then
		if jn.等级 >= 15 then
			self:学会技能(3, "威慑")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "阴阳二气诀" then
		if jn.等级 >= 40 then
			self:学会技能(4, "定心术")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(4, "魔息术")
			end
		end
	elseif jn.名称 == "狂兽诀" then
		if jn.等级 >= 30 then
			self:学会技能(5, "连环击")
		end
		if jn.等级 >= 35 then
			self:学会技能(5, "神力无穷")
		end
		if lp=="万兽之王" then
		    if jn.等级 >= 20 then
				self:学会技能(5, "驯兽·幼狮")
				self:学会技能(5, "幼狮之搏")
			end
		end
	elseif jn.名称 == "大鹏展翅" then
		if jn.等级 >= 1 then
			self:学会技能(6, "振翅千里")
		end
		self.技能属性.躲避 = qz(jn.等级*2)
	elseif jn.名称 == "魔兽反噬" then
		if jn.等级 >= 20 then
			self:学会技能(7, "极度疯狂")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))

		-- 盘丝洞
	elseif jn.名称 == "秋波暗送" then
		if jn.等级 >= 20 then
			self:学会技能(3, "勾魂")
		end
		if jn.等级 >= 20 then
			self:学会技能(3, "摄魄")
		end
		self.技能属性.命中 = floor(jn.等级 * 3)
	elseif jn.名称 == "蛛丝阵法" then
		if jn.等级 >= 30 then
			self:学会技能(1, "盘丝舞")
			self:学会技能(1, "夺命蛛丝")
		end
		if lp=="百媚魔姝" then
			if jn.等级 >= 10 then
				self:学会技能(1, "千蛛噬魂")
				self:学会技能(1, "蛛丝缠绕")
			end
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "迷情大法" then
		if jn.等级 >= 30 then
			self:学会技能(2, "含情脉脉")
		end
		if jn.等级 >= 45 then
			self:学会技能(2, "魔音摄魂")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(2, "瘴气")
			end
		end
	elseif jn.名称 == "天外魔音" then
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0141,jn.等级))
	elseif jn.名称 == "盘丝大法" then
		if jn.等级 >= 45 then
			self:学会技能(5, "神迷") --被动
		end
		if jn.等级 >= 20 then
			self:学会技能(5, "盘丝阵")
		end
		if jn.等级 >= 20 then
			self:学会技能(5, "复苏")
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(5, "媚眼如丝")
			end
		end
		self.技能属性.伤害 = qz(self:门派技能算法(2.5002,0.0089,jn.等级))
	elseif jn.名称 == "盘丝步" then
		if jn.等级 >= 15 then
			self:学会技能(6, "天罗地网")
		end
		if jn.等级 >= 1 then
			self:学会技能(6, "天蚕丝")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(6, "幻镜术")
			end
		end
		self.技能属性.躲避 = qz(jn.等级*2)
	elseif jn.名称 == "姊妹相随" then
		if jn.等级 >= 15 then
			self:学会技能(7, "姐妹同心")
		end

		-- 凌波城
	elseif jn.名称 == "天地无极" then
		if jn.等级 >= 1 then
			if lp=="九天武圣" then
				self:学会技能(1, "吞山")--被动
				self:学会技能(1, "饮海")--被动
			elseif lp=="灵霄斗士" then
				self:学会技能(1, "超级战意")--被动
			end
		end
		if lp=="风云战将" and jn.等级 >= 30 then
			self:学会技能(1, "天眼神通")--被动
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(1, "无双战魂")
			end
		end
	elseif jn.名称 == "九转玄功" then
		if jn.等级 >= 25 then
			self:学会技能(2, "不动如山")
		end
	elseif jn.名称 == "武神显圣" then
		if jn.等级 >= 30 then
			self:学会技能(3, "碎星诀")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(3, "镇魂诀")
			end
		end
	elseif jn.名称 == "气吞山河" then
		if jn.等级 >= 25 then
			self:学会技能(5, "裂石")
		end
		if jn.等级 >= 25 then
			self:学会技能(5, "浪涌")
		end
		if jn.等级 >= 35 then
			self:学会技能(5, "断岳势")
		end
		if jn.等级 >= 45 then
			self:学会技能(5, "天崩地裂")
		end
		if jn.等级 >= 45 then
			self:学会技能(5, "翻江搅海")
		end
		if jn.等级 >= 35 then
			self:学会技能(5, "惊涛怒")
		end
		self.技能属性.伤害 = qz(self:门派技能算法(1.99,0.02,jn.等级))
	elseif jn.名称 == "啸傲" then
		if jn.等级 >= 35 then
			self:学会技能(4, "穿云破空")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "诛魔" then
		if jn.等级 >= 25 then
			self:学会技能(6, "指地成钢")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 120 then
				self:学会技能(6, "腾雷")
			end
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "法天象地" then
		if jn.等级 >= 1 then
			self:学会技能(7, "纵地金光")
		end
		if jn.等级 >= 30 then
			self:学会技能(7, "无穷妙道")
		end
		self.技能属性.命中 = qz(self:门派技能算法(1,0.0099,jn.等级))

		-- 神木林
	elseif jn.名称 == "瞬息万变" then
		if jn.等级 >= 1 then
			self:学会技能(1, "风灵")--被动
		end
		if lp=="通天法王" then
			if jn.等级 >= 35 then
				self:学会技能(1, "落叶萧萧")
				self:学会技能(1, "鞭挞")--被动
			end
		elseif lp=="巫影祭司" then
			if jn.等级 >= 1 then
				self:学会技能(1, "蛊木迷瘴")
				self:学会技能(1, "鞭挞")--被动
			end
		elseif lp=="灵木神侍" then
			if jn.等级 >= 1 then
				self:学会技能(1, "风萦")
			end
			if jn.等级 >= 35 then
				self:学会技能(1, "落叶萧萧")
			end
		end
	elseif jn.名称 == "万灵诸念" then
		if jn.等级 >= 20 then
			self:学会技能(2, "荆棘舞")
		end
		if jn.等级 >= 20 then
			self:学会技能(2, "尘土刃")
		end
		if jn.等级 >= 20 then
			self:学会技能(2, "冰川怒")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "巫咒" then
		if jn.等级 >= 40 then
			self:学会技能(3, "雾杀")
		end
		if jn.等级 >= 40 then
			self:学会技能(3, "血雨")
		end
		self.技能属性.伤害 = qz(self:门派技能算法(2,0.01985,jn.等级))
	elseif jn.名称 == "万物轮转" then
		if jn.等级 >= 35 then
			self:学会技能(4, "星月之惠")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "天人庇护" then
		if jn.等级 >= 50 then
			self:学会技能(5, "炎护")
		end
		if jn.等级 >= 1 then
			self:学会技能(5, "叶隐")
		end
		self.技能属性.躲避 = qz(jn.等级*2)
	elseif jn.名称 == "神木恩泽" then
		if jn.等级 >= 35 then
			self:学会技能(6, "神木呓语")
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(6, "花语歌谣")
			end
		end
		if lp=="灵木神侍" then
			if jn.等级 >= 35 then
			    self:学会技能(6, "疾风秋叶")
			    self:学会技能(6, "古藤秘咒")
			    self:学会技能(6, "木精")
			end
		end
	elseif jn.名称 == "驭灵咒" then
		if jn.等级 >= 20 then
			self:学会技能(7, "蜜润")
			self:学会技能(7, "蝼蚁蚀天")
		end
		self.技能属性.魔法 = qz(self:门派技能算法(1.9588999,0.0138,jn.等级))

		-- 无底洞
	elseif jn.名称 == "枯骨心法" then
		if jn.等级 >= 1 and lp=="妙谛金莲" then
			self:学会技能(1, "金莲")--被动
		end
		if lp=="摄魂迷影" then
		    self:学会技能(1, "缚魂")--被动
		end
		if jn.等级 >= 20 then
			self:学会技能(1, "移魂化骨")
		end
	elseif jn.名称 == "阴风绝章" then
		if jn.等级 >= 25 then
			self:学会技能(2, "夺魄令")
		end
		if jn.等级 >= 30 then
			self:学会技能(2, "煞气诀")
		end
		if jn.等级 >= 50 then
			self:学会技能(2, "惊魂掌")
		end
		if jn.等级 >= 20 then
			self:学会技能(2, "摧心术")
		end
		if lp=="幽冥巫煞" then
		    self:学会技能(2, "裂魂")--被动
		end
	elseif jn.名称 == "鬼蛊灵蕴" then
		if jn.等级 >= 35 then
			self:学会技能(3, "夺命咒")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "燃灯灵宝" then
		if jn.等级 >= 35 then
			self:学会技能(4, "明光宝烛")
		end
		if self.历劫.飞升 == true then
			if jn.等级 >= 35 then
				self:学会技能(4, "金身舍利")
			end
		end
		if self.历劫.化圣 == true and lp=="妙谛金莲" then
			if jn.等级 >= 180 then
				self:学会技能(4, "净土灵华")
			end
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "地冥妙法" then
		if jn.等级 >= 20 then
			self:学会技能(5, "地涌金莲")
			self:学会技能(5,"万木凋枯")
		end
		if jn.等级 >= 20 then
			self:学会技能(5, "追魂刺")--新增
		end
		if jn.等级 >= 20 and lp=="妙谛金莲" then
			self:学会技能(5, "由己渡人") --新增
		end
	elseif jn.名称 == "混元神功" then
		if jn.等级 >= 25 then
			self:学会技能(6, "元阳护体")
		end
		if jn.等级 >= 25 then
			self:学会技能(6, "燃血术") --新增
		end
		if self.历劫.化圣 == true and lp~="妙谛金莲" then
		    if jn.等级 >= 180 then
				self:学会技能(6, "化羽为血")
			end
		end
		self.技能属性.伤害 = qz(self:门派技能算法(1.96139,0.02039,jn.等级))
	elseif jn.名称 == "秘影迷踪" then
		if jn.等级 >= 1 then
			self:学会技能(7, "遁地术")
		end
		self.技能属性.速度 = qz(jn.等级*0.3)

		-- 女儿
	elseif jn.名称 == "毒经" then
		self.技能属性.伤害 = qz(self:门派技能算法(2.015,0.01,jn.等级))
	elseif jn.名称 == "倾国倾城" then
		if jn.等级 >= 20 then
			self:学会技能(2, "红袖添香")
		end
		if jn.等级 >= 10 then
			self:学会技能(2, "楚楚可怜")
		end
		if jn.等级 >= 120 then
			self:学会技能(2, "一笑倾城")
		end
	elseif jn.名称 == "沉鱼落雁" then
		if jn.等级 >= 25 then
			self:学会技能(3, "满天花雨")
			self:学会技能(3, "情天恨海")
		end
		if jn.等级 >= 20 then
			self:学会技能(3, "雨落寒沙")
		end
		if jn.等级 >= 20 then
			self:学会技能(3, "子母神针") --新增
		end
	elseif jn.名称 == "闭月羞花" then
		if jn.等级 >= 1 then
			self:学会技能(4, "自矜") --被动
		end
		if jn.等级 >= 30 then
			self:学会技能(4, "莲步轻舞")
		end
		if jn.等级 >= 30 then
			self:学会技能(4, "如花解语")
		end
		if jn.等级 >= 40 then
			self:学会技能(4, "似玉生香")
			self:学会技能(4, "娉婷袅娜")
		end
		if self.历劫.化圣 == true then
			if jn.等级 >= 180 then
				self:学会技能(4, "月下霓裳")
			end
		end
	elseif jn.名称 == "香飘兰麝" then
		if jn.等级 >= 35 then
			self:学会技能(5, "轻如鸿毛")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "玉质冰肌" then
		if jn.等级 >= 10 then
			self:学会技能(6, "百毒不侵")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "清歌妙舞" then
		if jn.等级 >= 1 then
			self:学会技能(7, "移形换影")
		end
		if jn.等级 >= 120 then
			self:学会技能(7, "飞花摘叶")
		end
		self.技能属性.速度 = floor(jn.等级 * 0.8)

		--花果山
	elseif jn.名称 == "神通广大" then
		if jn.等级 >= 1 then
			self:学会技能(1, "如意神通") --被动
		end
		if jn.等级 >= 120 and self.历劫.飞升 == true then
			if lp=="通天行者" then
				self:学会技能(1, "灵彻太虚")
			else
				self:学会技能(1, "威震凌霄")
			end
			self:学会技能(1, "气慑天军")
		end
	elseif jn.名称 == "如意金箍" then
		if jn.等级 >= 1 then
			if lp=="通天行者" then
			    self:学会技能(2, "棒掀北斗")
				self:学会技能(2, "兴风作浪")
				self:学会技能(2, "棍打诸神")
			else
				self:学会技能(2, "当头一棒")
				self:学会技能(2, "神针撼海")
				self:学会技能(2, "杀威铁棒")
				self:学会技能(2, "泼天乱棒")
			end
		end
		self.技能属性.伤害 = qz(self:门派技能算法(1.99,0.02,jn.等级))
	elseif jn.名称 == "齐天逞胜" then
		if jn.等级 >= 15 then
			self:学会技能(3, "移星换斗")
		end
		if jn.等级 >= 1 then
			self:学会技能(3, "九幽除名")
			self:学会技能(3, "云暗天昏")
		end
	elseif jn.名称 == "金刚之躯" then
		if jn.等级 >= 35 then
			self:学会技能(4, "担山赶月")
		end
		if jn.等级 >= 1 then
			self:学会技能(4, "铜头铁臂")
		end
		self.技能属性.防御 = qz(self:门派技能算法(1,0.0138,jn.等级))
	elseif jn.名称 == "灵猴九窍" then
		if jn.等级 >= 10 then
			self:学会技能(5, "无所遁形")
			self:学会技能(5, "除光息焰")--新增
			if lp=="通天行者" then
			    self:学会技能(5, "意马心猿")--新增
			end
		end
		if self.历劫.化圣 ==true then
			if jn.等级 >= 180 then
				self:学会技能(5,"天地洞明")
			end
		end
		self.技能属性.命中 = qz(self:门派技能算法(1,0.0099,jn.等级))
	elseif jn.名称 == "七十二变" then
		if jn.等级 >= 10 then
			self:学会技能(6, "呼子唤孙")
		end
		if jn.等级 >= 45 then
			self:学会技能(6, "八戒上身")
		end
		self.技能属性.灵力 = qz(self:门派技能算法(0.46639,0.0092,jn.等级))
	elseif jn.名称 == "腾云驾霧" then
		if jn.等级 >= 1 then
			self:学会技能(7, "筋斗云")
		end
	end
	self:刷新信息()
end
return 内存类_队伍