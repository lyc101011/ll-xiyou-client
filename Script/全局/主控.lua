-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:24
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-01-04 11:57:20
local 场景类_场景 = class()
local ceil = math.ceil
local floor = math.floor
local sort = table.sort
local require = require
local pairs = pairs
local insert = table.insert
local txk = 引擎.特效库
local mousea = 引擎.鼠标按下
local mouseb = 引擎.鼠标弹起
local ARGB = ARGB
local type = type
local remove = table.remove
local xys = 生成XY
local 假人最终库 = require("script/全局/假人")
function 生成假人信息()
	local fhsj = {}
	local 地图编号={1001,1002,1003,1004,1005,1006,1007,1008,1009,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1040,1041,1042,1043,1044,1046,1049,1050,1051,1052,1054,1056,1057,1070,1072,1075,1077,1078,1079,1080,1081,1082,1083,1085,1087,1090,1091,1092,1093,1094,1095,1098,1099,1100,1101,1103,1104,1105,1106,1107,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,1134,1135,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1149,1150,1152,1153,1154,1155,1156,1165,1167,1168,1170,1171,1173,1174,1175,1177,1178,1179,1180,1181,1182,1183,1186,1187,1188,1189,1190,1191,1192,1193,1197,1198,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1237100,1238,1239,1241,1242,1242001,1242105,1243,1245,1246,1248,1249,1250,1251,1252,1253,1256,1257,1258,1259,1272,1273,1306,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1380,1382,1380.1,1382.2,1400,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1420,1421,1422,1424,1425,1426,1427,1428,1429,1430,1446,1447,1501,1502,1503,1504,1505,1506,1507,1508,1509,1511,1512,1513,1514,1523,1524,1525,1526,1527,1528,1529,1531,1532,1533,1534,1535,1536,1537,1605,16050,1606,1607,1608,1810,1811,1812,1813,1814,1815,1820,1821,1822,1823,1824,1825,1830,1831,1832,1833,1834,1835,1840,1841,1842,1843,1844,1845,1850,1851,1852,1853,1854,1855,1860,1861,1862,1863,1864,1865,1870,1871,1872,1873,1874,1875,1876,1885,1886,1887,1888,1890,1891,1892,1910,1911,1912,1913,1914,1915,1916,1920,1930,1931,1932,1933,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1944,1945,1946,1947,1948,1949,1950,1951,1952,1953,1954,1955,1958,1959,1960,1961,1962,1963,1964,1965,1966,1967,1968,1969,1970,1971,2000,5136,5137,5138,5139,6227,6228,6135,6136} --武神坛加6227
	for i=1,#地图编号 do
		local fhsj1 = 场景取假人表(地图编号[i],nil,1)
		if #fhsj1 >0 then
			fhsj[取地图名称(地图编号[i])]={}
		end
		for k,v in pairs(fhsj1) do
			fhsj[取地图名称(地图编号[i])][fhsj1[k].名称]={地图id=地图编号[i],x=fhsj1[k].X,y=fhsj1[k].Y}
		end
		-- for n=1,#fhsj1 do
		--  fhsj[取地图名称(地图编号[i])][fhsj1[n].名称]={地图id=地图编号[i],x=fhsj1[n].X,y=fhsj1[n].Y}
		-- end
	end
	return fhsj
end
function 场景类_场景:NPC说话(路径)
	local b=引擎.资源取大小(路径)
	if b>0 then
		if self.NPCsh then
			if self.NPCsh.文件==路径 then --不用重复载入
				self.NPCsh:播放(false)
				self.NPCsh:置音量(self.音乐音量 or 160)
			else
				self.NPCsh:销毁()
				self.NPCsh=self.资源:载入(路径,"加密音乐",nil)
				self.NPCsh:播放(false)
				self.NPCsh:置音量(self.音乐音量 or 160)
			end
		else
			self.NPCsh=nil
			self.NPCsh=self.资源:载入(路径,"加密音乐",nil)
			self.NPCsh:播放(false)
			self.NPCsh:置音量(self.音乐音量 or 160)
		end
	end
end
function 场景类_场景:按钮mp()
	if self.音效开启 and self.音效音量 >0 and 引擎.场景~=nil then
		if self.anyx then
			self.anyx:播放(false)
			self.anyx:置音量(self.音效音量+50 or 160)
		else
			self.anyx=self.资源:载入("wdf/Audio/1199.mp3","音乐",nil)
			self.anyx:播放(false)
			self.anyx:置音量(self.音效音量+50 or 160)
		end
	end
end
function 场景类_场景:初始化()
	self.资源 = require("script/资源类/加载类")(self)
	self.资源:打开()
	local 资源 = self.资源
	--fsb(nil,nil,self)
	-- 初始化缓存数据
	-- UI
	self._滑块 =  require("script/系统类/滑块")
	self._自适应 = require("script/系统类/自适应")
	self._按钮 = require("script/系统类/按钮")
	self._小型选项栏 = require("script/系统类/小型选项栏")
	local bqs = {1295847816,1853525647,1076954610,3552721044,3990239921,3366615112,2782337201,3771134163,1462708813,2715893287,3002376600,3991654351,993860032,2666294756,454787878,1382010105,2912848813,3919700593,477926852,352380776,811687356,915719759,4249060934,1336751228,1950021903,2235513801,3594739784,1960900090,2382390242,1537855326,3907030953,2290431679,3202252097,4033571742,1492820992,655187057,2901001332,3190903022,298183232,1945354141,3436623848,1724964988,2592865169,3393696884,1494002331,1310769894,1152800681,2542768010,1378600591,2829693277,3846038890,3901444948,68667698,3331959614,432707334,4241851683,3448703702,2542506275,241536076,314448958,2242677963,1887092560,1489631920,2860202818,4076591726,4232189420,3498505860,4241140149,3858705890,2271353759,3452523393,963399171,2959831232,2917226350,4215743335,3987108486,365569753,3701218951,3044567112,3265766525,2129343522,2401287726,2716317030,292723042,4014574629,4183102172,4115700508,2139528734,276624883,4099788650,2578443618,3367759523,576638850,3586214754,2830927389,1915332364,1341579386,3743372972,1217313750,1208397371,156713767,2057251015,3084935361,1485268859,470535714,2868631088,3835251562,2896374671,3982186902,1708428735,2448085336,1354708809,943667221,1146784672,3592760724,611393967,1688780051,2042812914,1466206851,770780432,3612578974}
	self.包子表情动画 = {}
	for i=0,120 do
	self.包子表情动画[i] = 资源:载入('wzife.wdf',"网易WDF动画",bqs[i+1])
	end
	self.圣旨=资源:载入('cfdh.wdf',"网易WDF动画",0xD3E2209B)
	-------------------------------------------
	local  jinse={3463055113,2470610894,2454935283,1330407844,3084121359,714908434,1425747500,3922029993,3375688591,578943499}
	local  zise={2863065487,2651943966,2721428056,3658033876,1671549234,2149603968,3486944714,3105833444,2645715176,2247172070}
	local  lvse={3225044296,2282567973,45222389,3404611763,2869642422,1226895626,1160910851,1243897463,1703457603,2509045139}
	local  lanse={2754978709,837497719,1989634778,3879785250,3494438025,361097991,1171180302,2125931144,621815393,2895777544}
	self.金色id = {}
	self.紫色id = {}
	self.绿色id = {}
	self.蓝色id = {}
	for n=0,9 do
		self.金色id[n]=资源:载入('audio/1922.mp3',"网易WDF动画",jinse[n+1]) --23
		self.紫色id[n]=资源:载入('audio/1922.mp3',"网易WDF动画",zise[n+1]) --23
		self.绿色id[n]=资源:载入('audio/1922.mp3',"网易WDF动画",lvse[n+1]) --23
		self.蓝色id[n]=资源:载入('audio/1922.mp3',"网易WDF动画",lanse[n+1]) --23
	end
	------------------------------------------
	self.包子表情动画[525] = 资源:载入('wzife.wdf',"网易WDF动画",0xF9858C95)
	self._丰富文本 = require("script/系统类/丰富文本")
	self._列表 = require("script/系统类/列表")
	-- 系统
	self._物品格子 = require("script/显示类/物品_格子")
	self._技能格子 = require("script/显示类/技能_格子")
	-- 内存
	self._物品 = require("script/显示类/物品")
	self._技能 = require("script/显示类/技能")
	self._内丹 = require("script/显示类/内丹格子")
	self._每日格子 = require("script/显示类/每日_格子")
	self._队伍 = require("script/属性控制/队伍")
	-- 初始化字体表
	self.登陆方式 = 1
	self.效验码 = "" --防修改
	self.广播数据={}
	local wz = require("gge文字类")
	-- self.文字类=wz
	self.字体表 = {
		旧道具字体 = wz.创建(nil,14,false,false,false),
		普通字体 = wz.创建(wdf配置.."/font/hkyt.ttf",14,false,false,true),
		普通字体_ = wz.创建(wdf配置.."/font/simsun.ttc",13,false,false,false),
		普通字体__ = wz.创建(wdf配置.."/font/hkyt.ttf",12.5,false,false,true),
		普通字体___ = wz.创建(wdf配置.."/font/simsun.ttc",12,false,false,false),
		对话栏文字 = wz.创建(wdf配置.."/font/宋体.ttf",16,false,false,true),
		描边字体 = wz.创建(nil,16,false,true,false),--wz.创建(wdf配置.."/font/hkyt.ttf",14,false,true,true),
		道具字体 = wz.创建(wdf配置.."/font/simsun.ttc",21,true,false,true),
		人物字体 = wz.创建(wdf配置.."/font/hkyt_w6.ttf",16,false,false,true),--这个才是
		道具详情 = wz.创建(wdf配置.."/font/simsun.ttc",14,false,false,false),--道具详情 = wz.创建("wdf/font/hkyt_w5.ttf",14,false,false,true),--
		人物字体_ = wz.创建(wdf配置.."/font/simsun.ttc",16,false,false,false),
		-- 帮派字体 = wz.创建(wdf配置.."/font/simsun.ttc",13,false,false,false),
		提示字体= wz.创建(wdf配置.."/font/simsun.ttc",18,false,false,true),
		一般字体 = wz.创建(wdf配置.."/font/simsun.ttc",14,false,false,false),
		一般字体1 = wz.创建(wdf配置.."/font/simsun.ttc",14,false,false,false),
		一般字体2 = wz.创建(wdf配置.."/font/simsun.ttc",14,false,false,false),
		标题字体 = wz.创建(wdf配置.."/font/hkyt.ttf",14,false,false,true),
		标题字体2 = wz.创建(wdf配置.."/font/hkyt.ttf",14,false,false,true),
		描边自定 = wz.创建(wdf配置.."/font/simsun.ttc",16,true,true,false),
		描边自定1 = wz.创建(wdf配置.."/font/simsun.ttc",16,false,true,false),
		华康14 = wz.创建(wdf配置.."/font/hkyt.ttf",14,false,false,true),
		华康14粗 = wz.创建(wdf配置.."/font/hkyt.ttf",14,true,true,true),
		华康15粗 = wz.创建(wdf配置.."/font/hkyt.ttf",15,false,false,true),
		华康16粗 = wz.创建(wdf配置.."/font/hkyt.ttf",14,true,true,true),
		战斗提示 = wz.创建(wdf配置.."/font/hkyt.ttf",18,true,true),--(文件,大小,粗体,可描边,抗锯齿)
		猫猫字体 = wz.创建("wdf/font/hkyt.ttf",14,false,false,true), --状态 =普通字体
		猫猫字体1 = wz.创建("wdf/font/hkyt.ttf",12.5,false,false,true), --状态
		猫猫字体2 = wz.创建("wdf/font/hkyt.ttf",13,false,false,true), --状态
		猫猫字体3 = wz.创建("wdf/font/hkyt_w6.ttf",13,false,false,true),--摊位金钱
		汉仪字体4 = wz.创建("wdf/font/hyh1gjm.ttf",20,false,false,true),
		通用字体12 = wz.创建(wdf配置.."/font/hkyt.ttf",12,false,false,true),
		通用字体14 = wz.创建(wdf配置.."/font/hkyt.ttf",14,false,false,true),
		伙伴战斗zt = wz.创建(wdf配置.."/font/hkyt.ttf",16,false,false,true),--这个才是
	}
	xqwz1 = wz.创建(nil,14,false,true,false) --道具属性，物品格子显示
	xqwz1:置颜色(0xFFFFFF00)
	self.字体表.摊位文字 = wz.创建(wdf配置.."/font/hkyt.ttf",14,false,false,true)
	self.字体表.摊位文字:置颜色(0xFF0075FF)
	名称字体 = wz.创建(wdf配置.."/font/simsun.ttc",16,false,false,false)
	名称字体:置字间距(0)
	self.字体表.特技文字=wz.创建(wdf配置.."/font/hkyt_w6.ttf",17,false,false,true)
	self.字体表.经脉文字= wz.创建(wdf配置.."/font/hkyt_w6.ttf",18,false,false,true)
	self.字体表.披坚文字=wz.创建(nil,14,false,false,false)
	self.字体表.人物字体:置字间距(1)
	self.字体表.人物字体:置样式(1)
	self.字体表.道具字体:置字间距(3.8)
	self.字体表.描边字体:置描边颜色(-16777216)
	--self.字体表.描边字体:置颜色(4294967295)
	self.字体表.提示字体:置颜色(4278255360)
	self.字体表.标题字体:置字间距(2)
	self.字体表.标题字体:置样式(1)
	self.字体表.标题字体2:置颜色(0xFF770000)--0xFF770000
	self.字体表.标题字体2:置字间距(2)
	self.字体表.标题字体2:置样式(1)
	self.字体表.战斗提示:置字间距(1)
	self.字体表.战斗提示:置样式(1)
	self.字体表.战斗提示:置描边颜色(0xFFFFFFFF)--白色 置描边颜色  置阴影颜色
	self.字体表.战斗提示:置颜色(ARGB(255,235,0,0))--红色
	-- self.字体表.华康14:置颜色(0xFF222222) --输入框专用
	-- self.字体表.对话栏文字:置阴影颜色(ARGB(0,0,0,0))
	self.字体表.对话栏文字:置字间距(1)
	self.文字类=wz

	-- 测试
	local fc = self._自适应.创建()
	fc:加载(self)
	self.提示框 = self._自适应.创建(6,1,1,1,3,9)
	local fc = self._队伍()
	fc:置根(self)
	-- 初始化时间
	self.当前地图 = 0
	-- 初始化队伍打开
	self.队伍 = {}
	self.称谓 = {"梦幻测试"}
	self.当前称谓 = "无称谓"
	-- 初始化阵型
	self.阵型 = 1
	self.阵型表 = {[1]={"无阵型",true,0},[2]={"天覆阵",false,0},[3]={"地载阵",false,0},[4]={"风扬阵",false,0},[5]={"云垂阵",false,0},[6]={"龙飞阵",false,0},[7]={"虎翼阵",false,0},[8]={"鸟翔阵",false,0},[9]={"蛇蟠阵",false,0},[10]={"鹰啸阵",false,0},[11]={"雷绝阵",false,0}}
	self.地图 = nil
	-- 初始化宠物
	self.宠物 = {模型="生肖猪",名称="生肖猪",等级=1,最大等级=40,耐力=5,最大耐力=5,经验=1,最大经验=10,领养次数=0}
	-- 初始化游戏组件
	self.道具列表 = {}
	self.任务列表 = {}
	self.人物仓库 = {}
	self.召唤兽仓库 = {}
	self.道具仓库 = {}
	self.辅助技能 = {}
	self.房屋数据 = {}
	self.商城数据 = {}
	-- self.如意符 = false
	self.文本回调 = false
	self.强化符 = nil
	self.强化符分类 = nil
	self.金钱 = 0
	self.仙玉 = 0
	self.储备 = 0
	self.积分 = 3000
	self.存银 = 0
	self.队伍数据={}
	self.飞行=false
	self.拆分开关=false
	-- 初始化剧情开关
	self.剧情开关 = {宝图=false,抓鬼=false,师门=false,押镖=false,四季=false,十五门=false,保卫长安=false,进入副本=false,副本=false,跑环=false,跑环开始=false,十二生肖=false,飞升=false,禁止飞行=false,禁止Npc=false,帮派=nil,飞行=true,任务追踪=true}
	-- 加载资源
	self.免疫文字 = 资源:载入('pic/免疫.png',"图片")
	self.反弹文字 = 资源:载入('pic/反弹.png',"图片")
	self.躲避文字 = 资源:载入('pic/躲避.png',"图片")
	self.无穷文字 = 资源:载入('pic/无穷.png',"图片")
	self.战斗文字 = {{},{},nil,{},{},{}}
	for n=1,10 do
		--self.战斗文字[1][n] = 资源:载入('misc.wdf',"网易WDF动画",0x512F7DA)--伤害字
		self.战斗文字[1][n] = 资源:载入('misc.wdf',"网易WDF动画",0x30F737D8)
		self.战斗文字[1][n].当前帧 = n-1
		self.战斗文字[1][n]:更新纹理()
		self.战斗文字[2][n] = 资源:载入('misc.wdf',"网易WDF动画",0x3CF8F9FE)--加血字
		self.战斗文字[2][n].当前帧 = n-1
		self.战斗文字[2][n]:更新纹理()
		self.战斗文字[4][n] =资源:载入('misc.wdf',"网易WDF动画",0x512f7da)--物理暴击
		self.战斗文字[4][n].当前帧 = n-1
		self.战斗文字[4][n]:更新纹理()
		self.战斗文字[5][n] =资源:载入('misc.wdf',"网易WDF动画",0x4EE0010A)--大 外红内白字
		self.战斗文字[5][n].当前帧 = n-1
		self.战斗文字[5][n]:更新纹理()
		self.战斗文字[6][n] =资源:载入('addon.wdf',"网易WDF动画",0x512f7da)--法术暴击
		self.战斗文字[6][n].当前帧 = n-1
		self.战斗文字[6][n]:更新纹理()
	end
	-- 暴击大的红图片 = 资源:载入('addon.wdf',"网易WDF动画",0x30F737D8)--要改改

	for n=1,2 do
		local x = 11
		if n == 2 then
			x = 12
		end
		self.战斗文字[1][x] = 资源:载入('misc.wdf',"网易WDF动画",0xf727f5b)
		self.战斗文字[1][x].当前帧 = n-1
		self.战斗文字[1][x]:更新纹理()
		self.战斗文字[2][x] = 资源:载入('misc.wdf',"网易WDF动画",0xf727f5b)--加血字
		self.战斗文字[2][x].当前帧 = n-1
		self.战斗文字[2][x]:更新纹理()
		self.战斗文字[4][x] =资源:载入('misc.wdf',"网易WDF动画",0xf727f5b)--中 外红内白字
		self.战斗文字[4][x].当前帧 = n-1
		self.战斗文字[4][x]:更新纹理()
		self.战斗文字[5][x] =资源:载入('misc.wdf',"网易WDF动画",0xf727f5b)--大 外红内白字
		self.战斗文字[5][x].当前帧 = n-1
		self.战斗文字[5][x]:更新纹理()
		self.战斗文字[6][x] =资源:载入('misc.wdf',"网易WDF动画",0xf727f5b)--大 外红内白字
		self.战斗文字[6][x].当前帧 = n-1
		self.战斗文字[6][x]:更新纹理()
	end
	self.wbltk=false
	self.武神坛角色=false --羔羊武神坛
	self.屏蔽抽奖动画=false --羔羊抽奖
	self.物品格子焦点_ = 资源:载入('aaa.wdf',"网易WDF动画",0x6F88F494)--资源:载入('wzife.wdf',"网易WDF动画",0x6F88F494)
	self.物品格子确定_ = 资源:载入('aaa.wdf',"网易WDF动画",0x10921CA7)--资源:载入('wzife.wdf',"网易WDF动画",0x10921CA7)
	self.物品格子禁止_ = 资源:载入('wzife.wdf',"网易WDF动画",0x4138B067)
	self.队伍格子焦点_ = 资源:载入('wzife.wdf',"网易WDF动画",0x1ADE7867)
	self.队伍格子确定_ = 资源:载入('wzife.wdf',"网易WDF动画",0xC540D7A7)
	self.窗口标题背景_ = 资源:载入('pic/标题背景.png',"图片")--资源:载入('org.rpk',"网易WDF动画",0x1000376).精灵
	self.窗口标题背景1_ = 资源:载入('wdf/audio/jmk/无底洞/zhuzhan/2.png',"图片")--资源:载入('org.rpk',"网易WDF动画",0x1000376).精灵
	self.底图背景 = 资源:载入('wzife.wd1',"网易WDF动画",0xEA6D0A4D).精灵
	self.技能格子背景_ = 资源:载入('pic/jngz.png',"图片")
	self.xqdt1 = 资源:载入('pic/mcdt.png',"图片")
	self.剑会天下·新秀 = 资源:载入('pic/cw/剑会天下·新秀.png',"图片")
	self.剑会天下·百胜 = 资源:载入('pic/cw/剑会天下·百胜.png',"图片")
	self.剑会天下·千胜 = 资源:载入('pic/cw/剑会天下·千胜.png',"图片")
	self.剑会天下·万军 = 资源:载入('pic/cw/剑会天下·万军.png',"图片")
	self.剑会天下·神话 = 资源:载入('pic/cw/剑会天下·神话.png',"图片")
	--self.物品界面背景_ = 资源:载入('wzife.wd1',"网易WDF动画",0xF70725E9).精灵
	self.物品界面背景_ = 资源:载入('org.rpk',"网易WDF动画",0x1000388).精灵
	self.物品格子背景_ = 资源:载入('aaa.wdf',"网易WDF动画",0x1F73D092).精灵--资源:载入('wzife.wd1',"网易WDF动画",0xB17505CF).精灵
	self.竖排花纹背景_ = 资源:载入('wzife.wd1',"网易WDF动画",0x4E5F661E).精灵
	-- self.竖排花纹背景1_ = 资源:载入('wzife.wd1',"网易WDF动画",0xADC83326).精灵
	self.横排花纹背景_ = 资源:载入('wzife.wd1',"网易WDF动画",0xEA6D0A4D).精灵
	-- self.宽竖排花纹背景_ = 资源:载入('wzife.wd1',"网易WDF动画",0x2D0F136C).精灵
	self.宠物头像背景_ = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B).精灵
	self.人物头像背景_ = 资源:载入('wzife.wdf',"网易WDF动画",0x360B8373).精灵
	self.宝宝装备背景={资源:载入('wdf/audio/jmk/背包/护腕.png',"图片"),资源:载入('wdf/audio/jmk/背包/鞋子.png',"图片"),资源:载入('wdf/audio/jmk/背包/铠甲.png',"图片")}
	--self.宝宝装备背景={资源:载入('wzife.wd1',"网易WDF动画",0x40c73f26),资源:载入('wzife.wd1',"网易WDF动画",0xd09d407f),资源:载入('wzife.wd1',"网易WDF动画",0xe3347d1c)}
	-- self.战斗状态回合背景_ = 资源:载入('common/wzife.wdf',"网易WDF动画",0x5af99afc).精灵
	-- self.战斗状态名称背景_ = 资源:载入('wzife.wd2',"网易WDF动画",0x433a919d).精灵
	-- self.战斗状态状态背景_ = 资源:载入('wzife.wd2',"网易WDF动画",0x2868065).精灵
	小摊位=资源:载入('addon.wdf',"网易WDF动画",0xBD80E0DB)
	中摊位=资源:载入('addon.wdf',"网易WDF动画",0x6D33D98E)
	大摊位=资源:载入('addon.wdf',"网易WDF动画",0x74786102)
	self.经验背景_ = 资源:载入('org.rpk',"网易WDF动画",0x1000374)
	self.影子 = 资源:载入('shape.wdf',"网易WDF动画",0xDCE4B562)
	self.影子小 = 资源:载入('shape.wdf',"网易WDF动画",0xDCE4B562)
	self.底图 = 资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
	self.传送点 =  资源:载入('mapani.wdf',"网易WDF动画",0x7f4cbc8c)
	self.火苗=资源:载入('addon.wdf',"网易WDF动画",1479134995)
	self.绿标选中=资源:载入('addon.wdf',"网易WDF动画",0x7C2FB1D2) --麻瓜剑会
	self.剑会战斗准备=false --麻瓜剑会
	-- 天气
	self.圈圈 = 资源:载入("wdf/audio/jmk/无底洞/zhuzhan/gq1.png","图片") --资源:载入('common/wzife.wdf',"网易WDF动画",1223115166) --
	self.画线 = 资源:载入('common/wzife.wdf',"网易WDF动画",0xA1442425)
	-- self.画线横 = 资源:载入('common/wzife.wdf',"网易WDF动画",2460692499)
	-------------------------战斗必加载特效
	self.减防御=self:载入特效("减防御",1)
	self.减法防=self:载入特效("减法防",1)
	self.减双抗=self:载入特效("减双抗",1)
	self.共生特效=self:载入特效("共生",1)
	self.法宝特效=self:载入特效("法宝",1)
	self.五行珠特效={}
	self.战意特效={}
	self.超级战意特效={}
	self.人参果特效={}
	self.骤雨特效={}
	self.临时物品查询={名称="w"}
	for i=1,3 do
		self.战意特效[i]=self:载入特效("状态_战意"..i,1)
	end
	for i=1,3 do
		self.超级战意特效[i]=self:载入特效("状态_超级战意"..i,1)
	end
	for i=1,6 do
		self.五行珠特效[i]=self:载入特效("状态_五行珠"..i,1)
	end
	for i=1,3 do
		self.人参果特效[i]=self:载入特效("状态_人参果"..i,1)
	end
	for i=1,3 do
		self.骤雨特效[i]=self:载入特效("状态_骤雨"..i,1)
	end
	-- self.如意神通特效=self:载入特效("如意神通",1)
	-------------------------战斗必加载特效
	self.任务图标 = 资源:载入("addon.wdf","网易WDF动画",2503353532)
	self.战斗图标 = 资源:载入("addon.wdf","网易WDF动画",1027252894)
	self.战斗动画 = 资源:载入('addon.wdf',"网易WDF动画",0x97C79EDB)
	-- 初始化大数据
	require("script/数据中心/场景NPC")
	self.假人库 = require("script/全局/假人控制")(self)
	-- 初始化内存数据
	-- self.打造物品 = 绑定等级物品()
	-- 初始化窗口
	图像类 = require("gge图像类1")
	self.窗口 = {
		小地图 = require("script/功能界面/小地图").创建(self),
		对话栏 = require("script/多重对话类/对话栏").创建(self),
		文本栏 = require("script/显示类/文本栏").创建(self),
		队伍申请表 = require("script/场景类/队伍申请列表类").创建(self),
		人物状态栏 = require("script/场景类/人物状态栏").创建(self),
		人物称谓栏 = require("script/场景类/人物称谓栏").创建(self),
		召唤兽属性栏 = require("script/场景类/召唤兽属性栏").创建(self),
		召唤兽资质栏 = require("script/场景类/召唤兽资质栏").创建(self),
		-- 道具行囊 = require("script/场景类/道具行囊").创建(self),
		队伍栏 = require("script/场景类/队伍栏").创建(self),
		队伍阵型栏 = require("script/场景类/队伍阵型栏").创建(self),
		宠物状态栏 = require("script/场景类/宠物状态栏").创建(self),
		宠物领养栏 =  require("script/场景类/宠物领养栏").创建(self),
		宠物炼妖栏 =  require("script/场景类/宠物炼妖栏").创建(self),
		-- 新宠物炼妖栏 =  require("script/场景类/新宠物炼妖栏").创建(self), --130
		任务栏 = require("script/场景类/任务栏").创建(self),
		打造 = require("script/场景类/打造").创建(self),
		商店 = require("script/场景类/商店").创建(self),
		出售 =  require("script/场景类/出售").创建(self),
		技能学习 =  require("script/场景类/技能学习").创建(self),
		染色 = require("script/场景类/染色").创建(self),
		飞行符 = require("script/场景类/飞行符").创建(self),
		新春飞行符 = require("script/场景类/新春飞行符").创建(self),
		-- 钓鱼 = require("script/场景类/钓鱼").创建(self),
		系统设置 = require("script/初系统/设置").创建(self),
		仓库类 = require("script/场景类/道具仓库").创建(self),
		好友列表 = require("script/功能界面/好友列表").创建(self),
		-- 自由技能栏 = require("script/场景类/自由技能栏").创建(self),
		幻化 = require("script/场景类/幻化").创建(self),
		召唤兽查看栏 = require("script/场景类/召唤兽查看栏").创建(self),
		灵饰 = require("script/场景类/灵饰").创建(self),
		锦衣 = require("script/场景类/锦衣").创建(self),
		组合输入框 = require("script/场景类/组合输入框").创建(self),
		任务追踪栏 = require("script/场景类/任务追踪栏").创建(self),
		生死劫 = require("script/场景类/生死劫").创建(self),
		梦幻指引 = require("script/场景类/梦幻指引").创建(self),
		召唤兽仓库 = require("script/场景类/召唤兽仓库").创建(self),
		--快捷技能选择栏 = require("script/场景类/快捷技能选择栏").创建(self),
		时辰 = require("script/功能界面/时辰").创建(self),
		人物框 = require("script/系统类/人物框").创建(self),
		底图框 = require("script/功能界面/底图框").创建(self),
		消息框 = require("script/功能界面/聊天框").创建(self),
		快捷技能栏 = require("script/系统类/快捷技能栏").创建(self),
		给予 = require("script/功能界面/给予类").创建(self),
		交易 = require("script/功能界面/交易类").创建(self),
		摊位出售 = require("script/功能界面/摊位出售类").创建(self),
		摊位购买 = require("script/功能界面/摊位购买类").创建(self),
		合成旗 = require("script/功能界面/合成旗类").创建(self),
		 排行榜 = require("script/功能界面/排行榜类").创建(self),
		好友消息 = require("script/功能界面/好友消息类").创建(self),
		好友查看 = require("script/功能界面/好友查看类").创建(self),
		世界地图分类小地图 = require("script/功能界面/世界地图分类小地图").创建(self),
		世界大地图= require("script/功能界面/世界大地图").创建(self),
		世界大地图分类a= require("script/功能界面/世界大地图分类a").创建(self),
		世界大地图分类b= require("script/功能界面/世界大地图分类b").创建(self),
		世界大地图分类c= require("script/功能界面/世界大地图分类c").创建(self),
		世界大地图分类d= require("script/功能界面/世界大地图分类d").创建(self),
		小地图NPC= require("script/功能界面/小地图NPC").创建(self),
		商城类 = require("Script/功能界面/商城类").创建(self),
		装备开运 = require("script/场景类/装备开运").创建(self),
		符石镶嵌 = require("script/场景类/符石镶嵌").创建(self),
		坐骑属性栏 = require("script/功能界面/坐骑属性栏").创建(self),
		坐骑修炼 = require("script/功能界面/坐骑修炼").创建(self), -- 79 可以用的编号
		-- 坐骑资质栏 = require("script/功能界面/坐骑资质栏").创建(self),
		坐骑技能栏 = require("script/功能界面/坐骑技能栏").创建(self),
		坐骑属性选择 = require("script/功能界面/坐骑属性选择").创建(self), --139
		-- 房屋拜访 = require("script/功能界面/房屋拜访类").创建(self),
		兑换乾元 = require("script/场景类/兑换乾元").创建(self),
		加入帮派 = require("script/场景类/加入帮派").创建(self),
		创建帮派 = require("script/场景类/创建帮派").创建(self),
		帮派界面 = require("script/场景类/帮派界面").创建(self),
		-- 帮派管理 = require("script/场景类/帮派管理").创建(self),
		祥瑞界面 = require("script/场景类/祥瑞界面").创建(self),
		修炼升级 = require("script/场景类/修炼升级").创建(self),
		-- 宠物修炼 = require("script/场景类/宠物修炼").创建(self),
		-- 人物炫彩 = require("script/场景类/人物炫彩").创建(self),
		-- 召唤兽炫彩 = require("script/场景类/召唤兽炫彩").创建(self),
		--子女界面 = require("script/场景类/子女界面").创建(self),
		-- 商会物品上架 = require("script/场景类/商会物品上架").创建(self),
		-- 商会列表 = require("script/场景类/商会列表").创建(self),
		-- 商会物品界面 = require("script/场景类/商会物品界面").创建(self),
		-- 商会宠物上架 = require("script/场景类/商会宠物上架").创建(self),
		-- 商会宠物界面 = require("script/场景类/商会宠物界面").创建(self),
		门派选择 = require("script/场景类/门派选择").创建(self),
		--伙伴属性 = require("script/功能界面/伙伴助战").创建(self),
		-- 招贤阁 = require("script/功能界面/招贤阁").创建(self),
		每日签到 = require("script/场景类/每日签到").创建(self),
		合成 = require("script/场景类/合成").创建(self),
		坐骑统御 = require("script/功能界面/坐骑统御").创建(self),
		更多属性 = require("script/功能界面/更多属性").创建(self),
		鉴定 = require("script/场景类/鉴定").创建(self),
		临时行囊 = require("script/更新类/临时行囊").创建(self),
		-- 坐骑炫彩 = require("script/功能界面/坐骑炫彩").创建(self),
		灵饰自选 = require("script/功能界面/灵饰自选").创建(tp), --92
		表情窗口 = require("script/功能界面/表情窗口").创建(self),--95
		玩家信息 = require("script/功能界面/玩家信息").创建(self),--96
		法术认证 = require("script/场景类/法术认证").创建(self),--97
		-- 账号管理 = require("script/功能界面/账号管理").创建(self),--99
		-- 首席投票榜 = require("script/功能界面/首席投票榜").创建(self),--100
		-- 管理界面 = require("script/功能界面/管理界面").创建(self),--101
		-- 摊位打造 = require("script/场景类/摊位打造").创建(self),--103
		临时背包 = require("script/场景类/临时背包").创建(self),--104
		给予NPC = require("script/功能界面/给予NPC").创建(self),--105
		法宝锻造 = require("script/场景类/法宝锻造").创建(self),--106
		系统商会 = require("script/功能界面/系统商会").创建(self),--107
		长安保卫战 = require("script/场景类/长安保卫战").创建(self),--108
		-- 子女养育 = require("script/场景类/子女养育").创建(self),--109 下一个112
		-- 商城宝宝查看 = require("script/更新类/商城宝宝查看").创建(self), --112
		经脉流派 = require("script/更新类/经脉流派").创建(self), --113
		经脉加点 = require("script/更新类/经脉加点").创建(self), --114
		经脉切换 = require("script/更新类/经脉切换").创建(self), --115
		战斗状态栏 = require("script/战斗类/战斗状态栏").创建(self), --116
		宠物合宠栏 =  require("script/场景类/宠物合宠栏").创建(self), -- 117
		宠物打书内丹栏 =  require("script/场景类/宠物打书内丹栏").创建(self),--118
		宠物洗练栏 =  require("script/场景类/宠物洗练栏").创建(self),--119
		焕彩染色 = require("script/更新类/焕彩染色").创建(self),--120
		彩虹争霸赛 = require("script/更新类/彩虹争霸赛").创建(self),--121
		副本界面 = require("script/更新类/副本界面").创建(self),--122
		-- 常规提示 = require("script/显示类/常规提示").创建(self),--123
		勾魂索一 = require("script/更新类/勾魂索一").创建(self),--124
		勾魂索二 = require("script/更新类/勾魂索二").创建(self),--125
		勾魂索三 = require("script/更新类/勾魂索三").创建(self),--126
		邀请组队 = require("script/更新类/邀请组队").创建(self),--127
		成就提示 = require("script/更新类/成就提示").创建(self),--128
		鉴定提示 = require("script/更新类/鉴定提示").创建(self),--129
		角色转换 = require("script/更新类/角色转换").创建(self),--130
		属性切换 = require("script/更新类/属性切换").创建(self),--131
		铃铛抽奖 = require("script/更新类/铃铛抽奖").创建(self),--132
		兽诀提示 = require("script/更新类/兽诀提示").创建(self),--133
		成长礼包 = require("script/更新类/成长礼包").创建(self),--134
		转盘 = require("script/更新类/转盘").创建(self),--135
		神秘宝箱 = require("script/更新类/神秘宝箱").创建(self),--136
		宝宝进阶 = require("script/更新类/宝宝进阶").创建(self),--137
		附魔宝珠 = require("script/场景类/附魔宝珠").创建(self),--138
		打字机 = require("script/更新类/打字机").创建(self),--139
		潜能果 = require("script/更新类/潜能果").创建(self),--140
		道具行囊 = require("script/场景类/新道具行囊").创建(self),--142
		游戏设置 = require("script/更新类/游戏设置").创建(self),--143
		唱戏界面 = require("script/更新类/唱戏界面").创建(self),--141
		唱戏交票 = require("script/更新类/唱戏交票界面").创建(self),--144
		银两存取 = require("script/更新类/银两存取").创建(self),--145
		帮派技能学习 = require("script/更新类/帮派技能学习").创建(self),--146
		改名系统 = require("script/更新类/改名系统").创建(self),--147
		光武拓印 = require("script/更新类/光武拓印").创建(self),--148
		帮战建设 = require("script/更新类/帮战建设").创建(self),--149
		保护时间 = require("script/更新类/保护时间").创建(self),--150
		--
		神器获得 = require("script/神器类/神器获得").创建(self),--151
		合成灵犀玉 = require("script/神器类/合成灵犀玉").创建(self),--152
		神器更换五行 = require("script/神器类/神器更换五行").创建(self),--153
		法宝 = require("script/神器类/法宝").创建(self),--36
		神器查看 = require("script/神器类/神器查看").创建(self),--155
		修复神器 = require("script/神器类/修复神器").创建(self),--156
		剑会天下 = require("script/剑会/剑会天下").创建(self),--157
		剑会匹配 = require("script/剑会/剑会匹配").创建(self),--158
		剑会排行榜 = require("script/剑会/剑会排行榜").创建(self),--159
		商城宝宝查看 = require("script/更新类/商城宝宝查看").创建(self), --160
		藏宝阁 = require("script/藏宝阁类/藏宝阁类").创建(self),
		藏宝阁出售 = require("script/藏宝阁类/藏宝阁出售").创建(self),
		藏宝阁银子出售 = require("script/藏宝阁类/藏宝阁银子出售").创建(self),
		藏宝阁角色出售 = require("script/藏宝阁类/藏宝阁角色出售").创建(self),
		藏宝阁角色取回 = require("script/藏宝阁类/藏宝阁角色取回").创建(self),
		藏宝阁最终支付 = require("script/藏宝阁类/藏宝阁最终支付").创建(self),
		角色查看 = require("script/藏宝阁类/角色查看").创建(self),
		秘密类 = require("script/更新类/秘密类").创建(self),
		进化宝宝 = require("script/更新类/进化宝宝").创建(self),
		采矿兑换 = require("script/更新类/采矿兑换栏").创建(self),
		声望积分商店 = require("script/更新类/声望积分商店").创建(self),
		特效宝珠 = require("script/场景类/特效宝珠").创建(self),
        GM功能 = require("script/功能界面/GM功能").创建(self),
        ---------------------------------超级技能
        比武排行类 = require("script/功能界面/比武排行类").创建(self), --比武166
		_制作仙露丸子 = require("script/场景类/_制作仙露丸子").创建(self), --180
		_丸子赐福 = require("script/场景类/_丸子赐福").创建(self), --181
		_丸子技能列表 = require("script/场景类/_丸子技能列表").创建(self), --182
		_赐福效果小窗 = require("script/场景类/_赐福效果小窗").创建(self), --183
		_丸子保存技能 = require("script/场景类/_丸子保存技能").创建(self), --183
		_丸子获超魔诀 = require("script/场景类/_丸子获超魔诀").创建(self), --184
		---------------------------------
		助战列表 = require("script/助战类/助战列表").创建(self),--165
		助战道具栏 = require("script/助战类/助战道具栏").创建(self),--166
		助战详情 = require("script/助战类/助战详情").创建(self),--170
		助战技能学习 = require("script/助战类/助战技能学习").创建(self),--176
		助战修炼学习 = require("script/助战类/助战修炼学习").创建(self),--177
		助战宝宝查看 = require("script/助战类/助战宝宝查看").创建(self),--178
		创建助战 = require("script/助战类/创建助战").创建(self),--180
		wst书铁商店类 = require("script/商店类/wst书铁商店类").创建(self), --武神坛 199
		wst法宝商店类 = require("script/商店类/wst法宝商店类").创建(self), --武神坛 200
		wst灵宝商店类 = require("script/商店类/wst灵宝商店类").创建(self), --武神坛 201
		wst宝宝商店类 = require("script/商店类/wst宝宝商店类").创建(self), --武神坛 202
		wst宝宝查看 = require("script/商店类/wst宝宝查看").创建(self), --武神坛 203
		wst蚩尤排行 = require("script/商店类/wst蚩尤排行").创建(self), --武神坛 204
		wst宝石商店类 = require("script/商店类/wst宝石商店类").创建(self), --武神坛 205
		wst强化符商店类 = require("script/商店类/wst强化符商店类").创建(self), --武神坛 206
		wst药品商店类 = require("script/商店类/wst药品商店类").创建(self), --武神坛 207
		图鉴查看 = require("script/场景类/新增/图鉴查看").创建(self),
		图鉴系统 = require("script/场景类/新增/图鉴系统").创建(self),
		礼包界面 = require("script/场景类/新增/礼包界面").创建(self),
		充值系统 = require("script/功能界面/充值界面").创建(self),
		奖池抽奖类 = require("script/功能界面/奖池抽奖类").创建(self), --212
		辅助内挂类 = require("script/功能界面/辅助内挂类").创建(self),--213挂机
		wst积分商店类 = require("script/商店类/wst积分商店类").创建(self), --214武神坛
		------------------------麻瓜剑会
		剑会房间列表 = require("script/剑会天下/剑会房间列表").创建(self), --麻瓜剑会190
		剑会房间密码 = require("script/剑会天下/剑会房间密码").创建(self), --麻瓜剑会191
		剑会寻找对手 = require("script/剑会天下/剑会寻找对手").创建(self), --麻瓜剑会192
		剑会战斗准备 = require("script/剑会天下/剑会战斗准备").创建(self), --麻瓜剑会193
		剑会商店类 = require("script/剑会天下/剑会商店类").创建(self), --麻瓜剑会3.7 194
		剑会五人榜 = require("script/剑会天下/剑会五人榜").创建(self), --麻瓜剑会3.8 195
		-- 账号仓库类 = require("script/场景类/账号仓库类").创建(self), --麻瓜仓库 196 复制这个lua
		-- 单人群宠类 = require("script/场景类/单人群宠类").创建(self), --麻瓜5宠 197复制这个lua
		自动回收类 = require("script/功能界面/自动回收类").创建(self),
		神兵异兽榜 = require("script/场景类/新增/神兵异兽榜").创建(self),
		装备观察 = require("script/更新类/装备观察").创建(self),--173
		一键强化符观察 = require("script/更新类/一键强化符观察").创建(self),--173
		门派秘籍 = require("script/功能界面/门派秘籍").创建(tp),
		战前施法 = require("script/功能界面/战前施法").创建(tp),
		修业点 = require("script/功能界面/修业点").创建(tp),
		修业系统 = require("script/功能界面/修业系统").创建(tp),
		    精炼装备 = require("script/更新类/精炼装备").创建(self),
    套装属性 = require("script/更新类/套装属性").创建(self),
		------------------------
	}

	require("script/全局/变量2")
	self.特效缓存 = {}
	ffi = require("ffi")
	f函数=require("ffi函数2")
	--f函数.修改窗口图标("wdf/mytb.ico")
	-- 资源char = ffi.new('char[524288]')
	-- 资源p = tonumber(ffi.cast("intptr_t",资源char))
	-- music = require("Glow/WDF类")(系统参数.目录.."WDF/music.wdf",资源p,524288)
	FMOD类2	= require("FMOD类5")
	-- FMOD类3  = require("FMOD类5")
	客户端=require("script/网络/hp").创建()
	self.读条背景_ = 资源:载入('common/wzife.wdf',"网易WDF动画",0xa84c008).精灵
	self.窗口_ = {}
	self.战斗窗口_ = {}
	self.标题 = require("script/初系统/标题").创建(self)
	self.注册 = require("script/初系统/注册").创建(self)
	self.分区 = require("script/初系统/分区").创建(self)
	self.登陆 = require("script/初系统/登陆").创建(self)
	self.创建 = require("script/初系统/创建").创建(self)
	self.读取 = require("script/初系统/选择角色").创建(self)
	self.退出 = require("script/初系统/退出").创建(self)
	self.鼠标 = require("script/显示类/鼠标").创建(self)
	self.提示 = require("script/显示类/道具详情").创建(self)
	self.常规提示 = require("script/显示类/常规提示").创建(self)
	self.喊话 = require("script/显示类/喊话").创建(self)
	self.角色坐标 = xys()
	-- 初始化进程
	self.进程 = 1
	-- 系统设置
	self.音乐开启 = true
	self.音效开启 = true
	self.音乐音量 = 50
	self.音效音量 = 50
	self:场景音乐类()
	self:战斗音乐类()
	self.音效= require("FMOD类5")
	self.渐变音量 = 0
	self.地图特效= true
	-- self.允许组队= true
	-- self.允许加好友= true
	self.允许查看装备= true
	self.显示变身卡造型= true
	self.显示坐骑= true
	self.战斗中 = false
	self.观战中 = false
	self.人物选中  = false
	self.选中UI  = false
	self.隐藏UI = false
	self.第二场景开启 = false
	self.下一次确定 = false
	self.按钮焦点  = false
	self.禁止通行 = false
	self.消息栏焦点 = false
	self.快捷技能显示 = false
	self.按下中 = false
	self.第一窗口移动中 = false
	self.第二窗口移动中 = false
	self.第二次删除 = 0
	self.梦幻指引 = {}
	self.坐骑列表 = {}
	self.任务Npc = {}
	self.Npc任务事件 = nil -- 寄存押镖、送信之类的
	self.运行时间 = 0
	self.移动速度1 = 0
	self.攻击速度 = 0
	self.施法速度 = 0
	self.恢复UI = false
	self.夜间显示=false
	self.黑色背景=require("gge精灵类")(0,0,0,0,0)
	self.黑色背景:置区域(0,0,1024,768)
	self.黑色背景:置颜色(ARGB(180,0,0,0))
	self.dgbj=require("gge精灵类")(0,0,0,0,0)
	self.dgbj:置区域(0,0,1024,768)
	self.dgbj:置颜色(ARGB(220,0,0,0))
	系统参数.音量=20 --这里要改
	self.假人信息 =生成假人信息()
	tp = self
end

function 场景类_场景:场景音乐类(路径)
	if not 路径 then
		local a = {wdf配置.."/Audio/1091.mp3",wdf配置.."/Audio/1070.mp3"}
		路径=a[引擎.取随机整数(1,2)]
		self.音乐=self.资源:载入(路径,"音乐",nil)
		self.音乐:播放(true)
		self.音量 = math.ceil(读配置("./config.ini","mhxy","音量")+0)--math.ceil(读配置("./配置.ini","mhxy","音量")+0)
		self.音乐:置音量(self.音量)
	else
		if  self.音乐.文件 ~= 路径 then
			if 引擎.文件是否存在(路径) then
				self.音乐:销毁()
				self.音乐=self.资源:载入(路径,"音乐",nil)
				if self.音乐开启 then
					self.音乐:播放(true)
					self.音乐:置音量(self.音乐音量 or 160)
				end
			end
		end
	end
end
Zhandouyy=1
function 场景类_场景:战斗音乐类(路径)
	if 路径 and 引擎.文件是否存在(路径) then
		self.战斗音乐=self.资源:载入(路径,"音乐",nil)
		if self.音乐开启 then
			self.战斗音乐:播放(true)
			self.战斗音乐:置音量(self.音乐音量 or 160)
		end
	end
end

function 场景类_场景:游戏音效类(文件号,资源包,子类)
	if self.音效开启 then
		if 文件号 ~= nil and 文件号 ~= 0 and  self.音效音量 >0 and 引擎.场景~=nil then
			if 文件号~=nil and 引擎.场景.资源.wdf[资源包]:读数据(文件号)==nil then
				return
			end
			self.音效(wdf配置.."/"..资源包,nil,引擎.场景.资源:取偏移(资源包,文件号),nil):播放():置音量(self.音效音量)
		end
	end
end

function 场景类_场景:播放音效类(mc)
	local 临时音乐=引擎.取音效(mc)
	if 临时音乐.资源~=nil  and 临时音乐.文件~=nil   then
		self:游戏音效类(临时音乐.文件,临时音乐.资源)
	end
end

function 场景类_场景:登陆清空()
	self.缓冲 = nil
	self.标题 = nil
	self.注册 = nil
	self.分区 = nil
	self.登陆 = nil
	self.创建 = nil
	self.读取 = nil
	self.退出 = nil
	场景类_标题说明=nil
	标题欢迎=nil
	collectgarbage("count")
end

function 取随机数(a,b)
	return 引擎.取随机整数(a,b)
end

function 场景类_场景:关闭窗口()
	for i,v in pairs(self.窗口_) do
		if v.可视 then
			if v.ID ~= 62 then
				if v.ID == 4 or v.ID == 7 then
					v:打开()
				else
					v.可视 = false
				end
			end
		end
	end
	self.选中窗口 = 0
	self.选中UI  = false
end

function 场景类_场景:丰富点击回调(sj)
	local x = 分割文本(sj,"*")
	if x[3] == "道具" then
		for i,v in ipairs(self.广播数据) do
			if x[3] == v.索引类型 and x[1] == v.名称 and x[2] == v.识别码 then
				local ls = self._物品格子.创建(0,0,1,"丰富文本回调")
				ls:置物品(v)
				if ls.物品 and ls.物品.大模型 == nil then
					ls.物品.大模型 = self.资源:载入(ls.物品.资源,"网易WDF动画",ls.物品.大模型资源)
				end
				self.提示:道具行囊(280,200,ls.物品)
				self.提示.显示方式 = 2
			end
		end
	elseif x[3] == "召唤兽" then
		for i,v in ipairs(self.广播数据) do
			if  x[3] == v.索引类型 and x[1] == v.名称 and x[2] == v.认证码 then
				引擎.场景.窗口.召唤兽查看栏:打开(v)
			end
		end
	elseif x[3] == "玩家信息" then
		if tp.窗口.玩家信息.可视 == false then
			tp.窗口.玩家信息:打开(x[1],x[4],x[2])
		else
			tp.窗口.玩家信息:刷新信息(x[1],x[4],x[2])
		end
	end
end

function 判断队长()
	if tp.场景.人物 then
		if tp.场景.人物.队长开关==nil and #tp.队伍数据 ~= 0 then
			return false
		end
		return true
	end
	return false
end

function 场景类_场景:丰富文本回调(sj)
	local x = 分割文本(sj,"*")
	if x[3] == "npc查询" and tp.选中窗口 == 0 then
		self.提示:npc回调(鼠标.x,鼠标.y,{地图=x[2],x=self.假人信息[x[2]][x[1]].x,y=self.假人信息[x[2]][x[1]].y})
	elseif x[3] == "临时npc" then
		self.提示:npc回调(鼠标.x,鼠标.y,{地图=取地图名称(x[2]+0),x=x[4],y=x[5]})
	elseif x[3] == "bz提示" and tp.选中窗口 == 0 then
		self.提示:bz提示(鼠标.x,鼠标.y,{x[1],x[2]})
	elseif x[2] and x[2] == "物品查询" and tp.选中窗口 == 0 then
		if ItemData[x[1]] then
			if self.临时物品查询.名称~=x[1] then
				local zy=引擎.取物品(x[1])
				self.临时物品查询={}
				self.临时物品查询.资源=self.资源:载入(zy[11],"网易WDF动画",zy[13])
				self.临时物品查询.名称=x[1]
				if zy[2] and zy[2]==2 and zy[5] then
					self.临时物品查询.lv=zy[5]
				end
			end
			self.提示:临时物品提示(鼠标.x,鼠标.y,x[1],ItemData[x[1]].wp_1,self.临时物品查询.资源,self.临时物品查询.lv)
		end
	end
end

function 场景类_场景:丰富文本回调行走(sj)
	if 判断队长() then
		local x = 分割文本(sj,"*")
		if x[3] == "npc查询" then
			if tp.当前地图 == self.假人信息[x[2]][x[1]].地图id then
				local 内容={x=self.假人信息[x[2]][x[1]].x,y=self.假人信息[x[2]][x[1]].y,距离=0}
				if 全局禁止走路==false then
					if 引擎.场景.飞行 then
						tp.场景.人物:设置路径无障碍(内容)
					else
						tp.场景.人物:设置路径(内容)
					end
					tp.场景.人物.移动距离= 0
					for i=1,#self.场景.假人 do
						if self.场景.假人[i].名称 == x[1] then
							self.场景.假人[i].自动对话=true
							break
						end
					end
					客户端:发送数据(1009,{地图=self.假人信息[x[2]][x[1]].地图id,x=self.假人信息[x[2]][x[1]].x,y=self.假人信息[x[2]][x[1]].y},1)
				end
			else
				客户端:发送数据(1009,{地图=self.假人信息[x[2]][x[1]].地图id,x=self.假人信息[x[2]][x[1]].x,y=self.假人信息[x[2]][x[1]].y},1)
			end
		elseif x[3] == "临时npc" then
			if tp.当前地图+0 == x[2]+0 then
				if 全局禁止走路==false then
					local 内容={x=x[4]+0,y=x[5]+0,距离=0}
					if 引擎.场景.飞行 then
						tp.场景.人物:设置路径无障碍(内容)
					else
						tp.场景.人物:设置路径(内容)
					end
					tp.场景.人物.移动距离= 0
					for i=1,#self.场景.假人 do
						if self.场景.假人[i].名称 == x[1] then
							self.场景.假人[i].自动对话=true
							break
						end
					end
					客户端:发送数据(1001,{x=x[4]+0,y=x[5]+0},1)
				end
			else
				引擎.场景.常规提示:打开("#Y/这个NPC不在这个地图")
			end
		end
	end
end


function 场景类_场景:可通行()
	return not 人物点击 and not self.人物选中 and not self.选中UI and not self.按钮焦点 and not self.消息栏焦点 and self.场景.抓取物品 == nil and not self.禁止通行 and not self.下一次确定 and not self.按下中 and not self.第一窗口移动中 and not self.第二窗口移动中
end

function 场景类_场景:载入特效(特效,zl,ns,xtx)
	local a = txk(特效,xtx)
	if a[1]==nil then
		a = txk("无特效")
		引擎.场景.窗口.消息框:添加文本("请截图给管理员,谢谢[ "..特效.." ]特效没技能素材","系统")
	elseif a[2]==nil and a[1]==nil then
		a = txk("无特效")
		引擎.场景.窗口.消息框:添加文本("请截图给管理员,谢谢[ "..特效.." ]特效没技能素材","系统")
	end
	if a[3] then
		return {self.资源:载入(a[2],"网易WDF动画",a[1],zl,nil,ns,false),self.资源:载入(a[2],"网易WDF动画",a[3],zl,nil,ns,false)}
	else

		return self.资源:载入(a[2],"网易WDF动画",a[1],zl,nil,ns,false)
	end
end

function 场景类_场景:可操作()
	return not self.消息栏焦点 and not self.选中UI
end

function UI排序(a,b)
	return a.窗口时间 < b.窗口时间
end

function 场景类_场景:取鼠标所在窗口(x,y)
	if not self.隐藏UI and not self.战斗中 then
		for n=#self.窗口_, 1,-1 do
			if self.窗口_[n]:检查点(x,y)  then
				self.选中UI = true
				return n
			end
		end
	end
	return 0
end

function 场景类_场景:取鼠标所在战斗窗口(x,y)
	if not self.隐藏UI then--and not self.战斗中 then
		for n=#self.战斗窗口_, 1,-1 do
			if self.战斗窗口_[n]:检查点(x,y)  then
				self.选中UI = true
				return n
			end
		end
	end
	return 0
end

local jz = 0

function 场景类_场景:显示(dt,x,y)
	全局时辰刷新()
	for i=0,120 do
		if i<=9 then
			self.金色id[i]:更新(dt)
			self.紫色id[i]:更新(dt)
			self.绿色id[i]:更新(dt)
			self.蓝色id[i]:更新(dt)
		end
		self.包子表情动画[i]:更新(dt)
	end
	系统参数.时间=os.time()
	self.传送点:更新(dt)
	self.绿标选中:更新(dt) --麻瓜剑会
	if self.隐藏UI then
		self.选中UI = false
	end
	if self.进程 == 1 or self.进程 == 2 or self.进程 == 3 or self.进程 == 5 or self.进程 == 6 or self.进程 == 7 or self.进程 == 8 or self.进程 == 9 or self.进程2 == 1 then
			self.标题:显示(dt,x,y)
		if self.进程 == 2 then
			self.读取:显示(dt,x,y)
		elseif self.进程 == 3 then
			self.创建:显示(dt,x,y)
		elseif self.进程 == 5 then
			self.注册:显示(dt,x,y)
		elseif self.进程 == 7 then
			self.登陆:显示(dt,x,y)
		elseif self.进程 == 8 then
			self.分区:显示(dt,x,y)
		elseif self.进程 == 9 then
			self.退出:显示(dt,x,y)
		end
		if  self.进程2 == 1 then
			self.退出:显示(dt,x,y)
		end
		self.提示:显示()
	elseif self.进程 == 4 then
		self.场景:显示(dt,x,y)
		self.喊话:显示()
		self.文本回调 = false
		if self.场景.过度精灵 ~= nil then
			self.场景.过度时间 = self.场景.过度时间 - 0.55
			if self.场景.过度时间 <= 0 then
				self.场景.过度进度 = self.场景.过度进度 - (self.场景.过度减少 or 20)
				self.场景.过度时间 = 0
				if self.场景.过度进度 <= 0 then
					self.场景.过度进度 = 0
				end
			end
			if self.场景.过度进度 <= 240 then
				if self.恢复UI then
					self.隐藏UI = false
					self.恢复UI = false
				end
			end
			self.场景.过度精灵:置颜色(ARGB(self.场景.过度进度,255,255,255))
			self.场景.翻转基数 = self.场景.翻转基数 +1
			self.场景.过度精灵:显示()
			if self.场景.过度进度 <= 0 then
				--self.场景.过度精灵:释放()
				self.场景.过度精灵 = nil
				self.场景.过度减少 = nil
				self.场景.翻转基数 = 1
			end
		end
		if not self.隐藏UI then
			self.队伍格子焦点_:更新(dt)
			-- self.物品格子焦点_:更新(dt)
			self.窗口.时辰:显示(dt,x,y)
			self.窗口.人物框:显示(dt,x,y)
			self.窗口.底图框:显示(dt,x,y)
			self.窗口.快捷技能栏:显示(dt,x,y)
			游戏传音:显示(dt,x,y)
			self.窗口.消息框:显示(dt,x,y)
			if self.战斗中 then
				self:战斗显示(dt,x,y)
			else
				self.战斗窗口_ = {}
				self.窗口.任务追踪栏:显示(dt,x,y)
				sort(self.窗口_,UI排序)
				-- local tsck = 0
				for n=1,#self.窗口_ do
					if self.窗口_[n].可视 then
						if self.窗口_[n].ID~=123 then
							self.窗口_[n]:显示(dt,x,y)
						end
						self.窗口_[n].焦点 = self.窗口_[n].焦点 or self.按钮焦点
						if self.窗口_[self.选中窗口] ~= nil and self.窗口_[self.选中窗口].ID == self.窗口_[n].ID and not self.按下中 then
							self.窗口_[n].鼠标 = true
							if mouseb(1) and self.窗口_[n].右键关闭==nil and self.抓取物品 == nil and not self.禁止关闭 and not self.消息栏焦点 and not self.窗口_[n].焦点1 then
								if self.窗口_[n].注释=="辅助内挂类" then --羔羊挂机，右键收起
									self.窗口_[n]:界面收起()
								else
									self.窗口_[n]:打开()
								end
							end
						else
							if self.第一窗口移动中 == false then
								self.窗口_[n].鼠标 = false
							end
						end
					end
				end
				if mousea(0) and self.选中窗口 ~= 0  and self.窗口_[self.选中窗口]~=nil and self.窗口_[self.选中窗口].可移动 and not self.消息栏焦点 then
					self.窗口_[self.选中窗口]:初始移动(x,y)
				elseif mouseb(0)  or self.隐藏UI or self.消息栏焦点 then
					self.移动窗口 = false
					self.第一窗口移动中 = false
				end
				if self.移动窗口 and not self.隐藏UI and not self.消息栏焦点 and self.窗口_[#self.窗口_] then
					self.第一窗口移动中 = true
					self.窗口_[#self.窗口_]:开始移动(x,y)
				end
				for n=1,#self.窗口_ do
					if self.窗口_[n] and not self.窗口_[n].可视 then
						if self.窗口_[n].鼠标 then
							self.窗口_[n].鼠标 = false
						end
						remove(self.窗口_,n)
					end
				end
				self.任务图标:更新(dt)
				self.战斗图标:更新(dt)
				self.战斗动画:更新(dt)
			end
		end
		if self.常规提示.可视 then
			self.常规提示:显示()
		end
		if self.场景.抓取物品 ~= nil then
			self.场景.抓取物品.小模型:显示(x - 45,y - 40)
		elseif self.场景.抓取神器 ~= nil then
			self.场景.抓取神器.小动画:显示(x - 45,y - 40)
		end
	end
	if self.第二场景开启 then
		self.隐藏UI = true
		self.第二场景:显示(dt,x,y)
	end
	if #self.提示.寄存内容 > 0 then
		if self.提示.寄存内容.开启提示 then
			self.提示框:置宽高(self.提示.寄存内容.提示坐标[3]+15,self.提示.寄存内容.提示坐标[4]+12)
			self.提示框:显示(self.提示.寄存内容.提示坐标[1],self.提示.寄存内容.提示坐标[2])
		end
		for i=1,#self.提示.寄存内容 do
			if self.提示.寄存内容[i].内容 ~= nil then
				self.提示.寄存内容[i].内容:显示(self.提示.寄存内容[i].x,self.提示.寄存内容[i].y)
			else
				if self.提示.寄存内容[i].文字 ~= nil then
					self.提示.寄存内容[i].文字:置颜色(self.提示.寄存内容[i].颜色):显示(self.提示.寄存内容[i].坐标[1],self.提示.寄存内容[i].坐标[2],self.提示.寄存内容[i].文本)
				end
			end
		end
		if self.提示.显示方式==1 then
			self.提示:清空寄存()
		elseif mouseb(0) and self.提示.显示方式==2 then
			self.提示.显示方式=1
			self.提示:清空寄存()
		end
	end

	if  not 引擎.场景.战斗中 then
		if self.选中假人  and self.鼠标.取当前()~="铁锤点击" then
			self.鼠标.置鼠标("事件")
		elseif self.文本回调 then
			self.鼠标.置鼠标("文本点击")
		end
	end
	-- self.提示:显示()
	if 引擎.是否在窗口内() then
		self.鼠标:更新(dt,x,y)
		self.鼠标:显示(dt,x,y)
	end

	self.选中UI = false
	if self.下一次确定 then
		self.选中UI = true
	end
	if self.选项栏选中 then
		self.第二次删除 = self.第二次删除 + 1
		if self.第二次删除 == 2 then
			self.第二次删除 = 0
			self.选项栏选中 = false
		end
	end
	self.禁止通行 = false
	self.按钮焦点 = false
	self.禁止关闭 = false
	self.消息栏焦点 = false
	if self.进程 == 4 then
		if not self.隐藏UI then
			if self.窗口.文本栏.可视 or self.窗口.对话栏.可视 then
				self.消息栏焦点 = true
			end
			if not self.战斗中 then
				self.选中窗口 = self:取鼠标所在窗口(x,y)
			else
				self.选中战斗窗口 = self:取鼠标所在战斗窗口(x,y)
			end
		end
	end
	if self.圣旨显示 then
		self.圣旨:显示(200,300)
		if self.圣旨.当前帧==self.圣旨.结束帧 then
			self.圣旨.当前帧=self.圣旨.开始帧
			self.圣旨显示=nil
		end
	end
end

function 场景类_场景:战斗显示(dt,x,y)

	sort(self.战斗窗口_,UI排序)
	for n=1,#self.战斗窗口_ do
		if self.战斗窗口_[n].可视 then
			if self.战斗窗口_[n].ID~=123 then
				self.战斗窗口_[n]:显示(dt,x,y)
			end
			self.战斗窗口_[n].焦点 = self.战斗窗口_[n].焦点 or self.按钮焦点
			if self.战斗窗口_[self.选中战斗窗口] ~= nil and self.战斗窗口_[self.选中战斗窗口].ID == self.战斗窗口_[n].ID and not self.按下中 then
				self.战斗窗口_[n].鼠标 = true
				if mouseb(1) and self.战斗窗口_[n].右键关闭==nil and self.抓取物品 == nil and not self.禁止关闭 and not self.消息栏焦点 and not self.战斗窗口_[n].焦点1 then
					self.战斗窗口_[n]:打开()
				end
			else
				if self.第一窗口移动中 == false then
					self.战斗窗口_[n].鼠标 = false
				end
			end
		end
	end

	if mousea(0) and self.选中战斗窗口 ~= 0  and self.战斗窗口_[self.选中战斗窗口]~=nil and self.战斗窗口_[self.选中战斗窗口].可移动 and not self.消息栏焦点 then
		self.战斗窗口_[self.选中战斗窗口]:初始移动(x,y)
	elseif mouseb(0)  or self.隐藏UI or self.消息栏焦点 then
		self.移动窗口 = false
		self.第一窗口移动中 = false
	end

	if self.移动窗口 and not self.隐藏UI and not self.消息栏焦点 and self.战斗窗口_[#self.战斗窗口_] then
		self.第一窗口移动中 = true
		self.战斗窗口_[#self.战斗窗口_]:开始移动(x,y)
	end
	for n=1,#self.战斗窗口_ do
		if self.战斗窗口_[n] and not self.战斗窗口_[n].可视 then
			if self.战斗窗口_[n].鼠标 then
				self.战斗窗口_[n].鼠标 = false
			end
			remove(self.战斗窗口_,n)
		end
	end
	-----------------
	if 战斗类.PK战斗 and not 战斗类.单挑模式 then
		if not 战斗类.技能展示开关 then
			战斗类.技能待放组[1]:显示(0,368)
			战斗类.技能待放组[2]:显示(0,453)
		else
			战斗类.技能待放组[1]:显示(308,368)
			战斗类.技能待放组[2]:显示(308,453)
			战斗类.技能待放组[3]:显示(0,368)
			战斗类.技能待放组[3]:显示(0,453)
			for i=1,5 do
				if 战斗类.我方头像组[i]~=nil then
					self.字体表.描边字体:置颜色(0xFFFFFF66):置样式(1):置描边颜色(黑色):显示((i-1)*60+30,345,战斗类.我方头像组[i].门派)
					self.字体表.描边字体:置样式(0)
					self.字体表.描边字体:置颜色(白色)
				end
				战斗类.技能待放组[4]:显示((i-1)*60+8,378)
				战斗类.技能待放组[4]:显示((i-1)*60+8,462)
			end

			for k,v in pairs(战斗类.技能展示) do

				local 偏移 = {0,0}
				if v.小模型.宽度==40 then
					偏移[1]=-5
					偏移[2]=-5
				end
				if k<=5 then
					v.小模型:显示((k-1)*60+10+v.偏移[1]+偏移[1],378+v.偏移[2]+偏移[2])
					战斗类.技能待放组[5]:显示((k-1)*60+8,378)
					self.字体表.猫猫字体1:置样式(1):置颜色(黄色):显示((k-1)*60+32,428,v.名称)
					self.字体表.描边字体:置样式(0)
					-- self.字体表.描边字体:置颜色(白色)
				else
					v.小模型:显示((k-6)*60+10+v.偏移[1]+偏移[1],462+v.偏移[2]+偏移[2])
					战斗类.技能待放组[5]:显示((k-6)*60+8,462)
					self.字体表.猫猫字体1:置样式(1):置颜色(黄色):显示((k-6)*60+32,512,v.名称)
					self.字体表.描边字体:置样式(0)
					-- self.字体表.描边字体:置颜色(白色)
				end
			end
			self.字体表.描边字体:置描边颜色(-16777216)
		end
	end
	if 战斗类.阵型组[1]:是否选中(x,y) then
		战斗类.阵型组[2]:显示(全局游戏宽度-349,全局游戏高度/2-290)
		if 战斗类.我方阵型~=nil and 战斗类.敌方阵型~=nil then
			local 偏移1 = 0
			local 偏移2 = 0
			if 战斗类.我方阵型=="普通" then
				偏移1=8
			end
			if 战斗类.敌方阵型=="普通" then
				偏移2=8
			end
			战斗类.阵型组[3]:显示(全局游戏宽度-300,全局游戏高度/2-276)
			战斗类.阵型组[8]:显示(全局游戏宽度-300,全局游戏高度/2-276)
			战斗类.阵型组[3]:显示(全局游戏宽度-110,全局游戏高度/2-276)
			战斗类.阵型组[8]:显示(全局游戏宽度-110,全局游戏高度/2-276)
			战斗类.敌方阵法:显示(全局游戏宽度-300+偏移2,全局游戏高度/2-260)
			战斗类.我方阵法:显示(全局游戏宽度-110+偏移1,全局游戏高度/2-260)
			local 克制 = 阵法克制(战斗类.我方阵型,战斗类.敌方阵型)
			if 克制 == 0 then
				--无克制
				战斗类.阵型组[7]:显示(全局游戏宽度-215,全局游戏高度/2-276)
			elseif 克制== 1 then
				--克制
				战斗类.阵型组[6]:显示(全局游戏宽度-200,全局游戏高度/2-276)
				战斗类.阵型组[4]:显示(全局游戏宽度-225,全局游戏高度/2-246)
			else
				--被克制
				战斗类.阵型组[6]:显示(全局游戏宽度-200,全局游戏高度/2-276)
				战斗类.阵型组[5]:显示(全局游戏宽度-225,全局游戏高度/2-246)
			end
		end
		self.字体表.摊位文字:置颜色(白色):显示(全局游戏宽度-202,全局游戏高度/2-224,"第"..战斗类.回合数.."回合")
	end
	self.法宝特效:更新(dt)
	self.减防御:更新(dt)
	self.减法防:更新(dt)
	self.减双抗:更新(dt)
	self.共生特效:更新(dt)
	for i=1,3 do
		self.战意特效[i]:更新(dt*1.8)
	end
	for i=1,3 do
		self.超级战意特效[i]:更新(dt*1.8)
	end
	for i=1,6 do
		self.五行珠特效[i]:更新(dt)
	end
	for i=1,3 do
		self.人参果特效[i]:更新(dt)
	end
	for i=1,3 do
		self.骤雨特效[i]:更新(dt)
	end
	-- self.如意神通特效:更新(dt)
end

function 生活技能消耗(目标技能等级,技能)
	local 等级 = 目标技能等级
	local 技能消耗 = {}
	if 技能=="强壮" or 技能=="神速" then
		技能消耗[1]={经验=1720000,金钱=430000}
		技能消耗[2]={经验=1980000,金钱=495000}
		技能消耗[3]={经验=2280000,金钱=570000}
		技能消耗[4]={经验=2620000,金钱=655000}
		技能消耗[5]={经验=3000000,金钱=750000}
		技能消耗[6]={经验=3420000,金钱=855000}
		技能消耗[7]={经验=3880000,金钱=970000}
		技能消耗[8]={经验=4380000,金钱=1095000}
		技能消耗[9]={经验=4920000,金钱=1230000}
		技能消耗[10]={经验=5500000,金钱=1375000}
		技能消耗[11]={经验=6120000,金钱=1530000}
		技能消耗[12]={经验=6780000,金钱=1695000}
		技能消耗[13]={经验=7480000,金钱=1870000}
		技能消耗[14]={经验=8220000,金钱=2055000}
		技能消耗[15]={经验=9000000,金钱=2250000}
		技能消耗[16]={经验=9820000,金钱=2455000}
		技能消耗[17]={经验=10680000,金钱=2670000}
		技能消耗[18]={经验=11580000,金钱=2895000}
		技能消耗[19]={经验=12520000,金钱=3130000}
		技能消耗[20]={经验=13500000,金钱=3375000}
		技能消耗[21]={经验=14520000,金钱=3630000}
		技能消耗[22]={经验=15580000,金钱=3895000}
		技能消耗[23]={经验=16680000,金钱=4170000}
		技能消耗[24]={经验=17820000,金钱=4455000}
		技能消耗[25]={经验=19000000,金钱=4750000}
		技能消耗[26]={经验=20220000,金钱=5055000}
		技能消耗[27]={经验=21480000,金钱=5370000}
		技能消耗[28]={经验=22780000,金钱=5695000}
		技能消耗[29]={经验=25500000,金钱=6375000}
		技能消耗[30]={经验=26920000,金钱=6730000}
		技能消耗[31]={经验=26920000,金钱=6730000}
		技能消耗[32]={经验=28380000,金钱=7095000}
		技能消耗[33]={经验=29880000,金钱=7470000}
		技能消耗[34]={经验=31420000,金钱=7855000}
		技能消耗[35]={经验=33000000,金钱=8250000}
		技能消耗[36]={经验=34620000,金钱=8655000}
		技能消耗[37]={经验=36280000,金钱=9070000}
		技能消耗[38]={经验=37980000,金钱=9495000}
		技能消耗[39]={经验=39720000,金钱=9930000}
		技能消耗[40]={经验=41500000,金钱=10375000}
		技能消耗[41]={经验=43500000,金钱=11375000}
		技能消耗[42]={经验=45180000,金钱=12255000}
		技能消耗[43]={经验=47080000,金钱=12750000}
		技能消耗[44]={经验=49020000,金钱=13255000}
		技能消耗[45]={经验=51000000,金钱=13770000}
		技能消耗[46]={经验=53020000,金钱=14295000}
		技能消耗[47]={经验=55080000,金钱=14830000}
		技能消耗[48]={经验=57180000,金钱=15375000}
		技能消耗[49]={经验=59320000,金钱=15930000}
		技能消耗[50]={经验=61500000,金钱=16495000}
		技能消耗[51]={经验=63720000,金钱=17070000}
		技能消耗[52]={经验=65980000,金钱=17655000}
		技能消耗[53]={经验=68280000,金钱=18250000}
		技能消耗[54]={经验=70620000,金钱=18855000}
		技能消耗[55]={经验=73000000,金钱=19470000}
		技能消耗[56]={经验=75420000,金钱=20095000}
		技能消耗[57]={经验=77880000,金钱=20730000}
		技能消耗[58]={经验=80380000,金钱=21375000}
		技能消耗[59]={经验=82920000,金钱=22220000}
		技能消耗[60]={经验=85500000,金钱=23500000}
		技能消耗[61]={经验=90000000,金钱=25000000}
		技能消耗[目标技能等级].帮贡=目标技能等级
		技能消耗[目标技能等级].需求=目标技能等级 * 5
		return 技能消耗[目标技能等级]
	end

	技能消耗[1] = {经验 = 16, 金钱 = 3, 需求 = 6, 帮贡 = 1}
	技能消耗[2] = {经验 = 32, 金钱 = 6, 需求 = 12, 帮贡 = 2}
	技能消耗[3] = {经验 = 52, 金钱 = 9, 需求 = 18, 帮贡 = 3}
	技能消耗[4] = {经验 = 75, 金钱 = 14, 需求 =24, 帮贡 = 4}
	技能消耗[5] = {经验 = 103, 金钱 = 19, 需求 = 30, 帮贡 = 5}
	技能消耗[6] = {经验 = 136, 金钱 = 25, 需求 = 36, 帮贡 = 6}
	技能消耗[7] = {经验 = 179, 金钱 = 33, 需求 = 42, 帮贡 = 7}
	技能消耗[8] = {经验 = 231, 金钱 = 43, 需求 = 48, 帮贡 = 8}
	技能消耗[9] = {经验 = 295, 金钱 = 55, 需求 = 54, 帮贡 = 9}
	技能消耗[10] = {经验 = 372, 金钱 = 69, 需求 = 60, 帮贡 = 10}
	技能消耗[11] = {经验 = 466, 金钱 = 87, 需求 = 66, 帮贡 = 11}
	技能消耗[12] = {经验 = 578, 金钱 = 108, 需求 = 72, 帮贡 = 12}
	技能消耗[13] = {经验 = 711, 金钱 = 133, 需求 = 78, 帮贡 = 13}
	技能消耗[14] = {经验 = 867, 金钱 = 162, 需求 = 84, 帮贡 = 14}
	技能消耗[15] = {经验 = 1049, 金钱 = 196, 需求 = 90, 帮贡 = 15}
	技能消耗[16] = {经验 = 1260, 金钱 = 236, 需求 = 96, 帮贡 = 16}
	技能消耗[17] = {经验 = 1503, 金钱 = 281, 需求 = 102, 帮贡 = 17}
	技能消耗[18] = {经验 = 1780, 金钱 = 333, 需求 = 108, 帮贡 = 18}
	技能消耗[19] = {经验 = 2096, 金钱 = 393, 需求 = 114, 帮贡 = 19}
	技能消耗[20] = {经验 = 2452, 金钱 = 459, 需求 = 120, 帮贡 = 20}
	技能消耗[21] = {经验 = 2854, 金钱 = 535, 需求 = 126, 帮贡 = 21}
	技能消耗[22] = {经验 = 3304, 金钱 = 619, 需求 = 132, 帮贡 = 22}
	技能消耗[23] = {经验 = 3807, 金钱 = 713, 需求 = 138, 帮贡 = 23}
	技能消耗[24] = {经验 = 4364, 金钱 = 818, 需求 = 144, 帮贡 = 24}
	技能消耗[25] = {经验 = 4983, 金钱 = 934, 需求 = 150, 帮贡 = 25}
	技能消耗[26] = {经验 = 5664, 金钱 = 1062, 需求 = 156, 帮贡 = 26}
	技能消耗[27] = {经验 = 6415, 金钱 = 1202, 需求 = 162, 帮贡 = 27}
	技能消耗[28] = {经验 = 7238, 金钱 = 1357, 需求 = 168, 帮贡 = 28}
	技能消耗[29] = {经验 = 8138, 金钱 = 1525, 需求 = 174, 帮贡 = 29}
	技能消耗[30] = {经验 = 9120, 金钱 = 1710, 需求 = 180, 帮贡 = 30}
	技能消耗[31] = {经验 = 10188, 金钱 = 1910, 需求 = 186, 帮贡 = 31}
	技能消耗[32] = {经验 = 11347, 金钱 = 2127, 需求 = 192, 帮贡 = 32}
	技能消耗[33] = {经验 = 12602, 金钱 = 2362, 需求 = 198, 帮贡 = 33}
	技能消耗[34] = {经验 = 13959, 金钱 = 2617, 需求 = 204, 帮贡 = 34}
	技能消耗[35] = {经验 = 15423, 金钱 = 2891, 需求 = 210, 帮贡 = 35}
	技能消耗[36] = {经验 = 16998, 金钱 = 3187, 需求 = 216, 帮贡 = 36}
	技能消耗[37] = {经验 = 18692, 金钱 = 3504, 需求 = 222, 帮贡 = 37}
	技能消耗[38] = {经验 = 20508, 金钱 = 3845, 需求 = 228, 帮贡 = 38}
	技能消耗[39] = {经验 = 22452, 金钱 = 4209, 需求 = 234, 帮贡 = 39}
	技能消耗[40] = {经验 = 24532, 金钱 = 4599, 需求 = 240, 帮贡 = 40}
	技能消耗[41] = {经验 = 26753, 金钱 = 5106, 需求 = 246, 帮贡 = 41}
	技能消耗[42] = {经验 = 29121, 金钱 = 5460, 需求 = 252, 帮贡 = 42}
	技能消耗[43] = {经验 = 31642, 金钱 = 5932, 需求 = 258, 帮贡 = 43}
	技能消耗[44] = {经验 = 34323, 金钱 = 6435, 需求 = 264, 帮贡 = 44}
	技能消耗[45] = {经验 = 37169, 金钱 = 6969, 需求 = 270, 帮贡 = 45}
	技能消耗[46] = {经验 = 40188, 金钱 = 7535, 需求 = 276, 帮贡 = 46}
	技能消耗[47] = {经验 = 43388, 金钱 = 8135, 需求 = 282, 帮贡 = 47}
	技能消耗[48] = {经验 = 46773, 金钱 = 8770, 需求 = 288, 帮贡 = 48}
	技能消耗[49] = {经验 = 50352, 金钱 = 9441, 需求 = 294, 帮贡 = 49}
	技能消耗[50] = {经验 = 54132, 金钱 = 10149, 需求 = 300, 帮贡 = 50}
	技能消耗[51] = {经验 = 58120, 金钱 = 10897, 需求 = 306, 帮贡 = 51}
	技能消耗[52] = {经验 = 62324, 金钱 = 11685, 需求 = 312, 帮贡 = 52}
	技能消耗[53] = {经验 = 66750, 金钱 = 12515, 需求 = 318, 帮贡 = 53}
	技能消耗[54] = {经验 = 71407, 金钱 = 13388, 需求 = 324, 帮贡 = 54}
	技能消耗[55] = {经验 = 76303, 金钱 = 14306, 需求 = 330, 帮贡 = 55}
	技能消耗[56] = {经验 = 81444, 金钱 = 15270, 需求 = 336, 帮贡 = 56}
	技能消耗[57] = {经验 = 86840, 金钱 = 16282, 需求 = 342, 帮贡 = 57}
	技能消耗[58] = {经验 = 92500, 金钱 = 17343, 需求 = 348, 帮贡 = 58}
	技能消耗[59] = {经验 = 98430, 金钱 = 18455, 需求 = 354, 帮贡 = 59}
	技能消耗[60] = {经验 = 104640, 金钱 = 19620, 需求 = 360, 帮贡 = 60}
	技能消耗[61] = {经验 = 111136, 金钱 = 20838, 需求 = 366, 帮贡 = 61}
	技能消耗[62] = {经验 = 117931, 金钱 = 22112, 需求 = 372, 帮贡 = 62}
	技能消耗[63] = {经验 = 125031, 金钱 = 23443, 需求 = 378, 帮贡 = 63}
	技能消耗[64] = {经验 = 132444, 金钱 = 24833, 需求 = 384, 帮贡 = 64}
	技能消耗[65] = {经验 = 140183, 金钱 = 26284, 需求 = 390, 帮贡 = 65}
	技能消耗[66] = {经验 = 148253, 金钱 = 27797, 需求 = 396, 帮贡 = 66}
	技能消耗[67] = {经验 = 156666, 金钱 = 29374, 需求 = 402, 帮贡 = 67}
	技能消耗[68] = {经验 = 165430, 金钱 = 31018, 需求 = 408, 帮贡 = 68}
	技能消耗[69] = {经验 = 174556, 金钱 = 32729, 需求 = 414, 帮贡 = 69}
	技能消耗[70] = {经验 = 184052, 金钱 = 34509, 需求 = 420, 帮贡 = 70}
	技能消耗[71] = {经验 = 193930, 金钱 = 36361, 需求 = 426, 帮贡 = 71}
	技能消耗[72] = {经验 = 204198, 金钱 = 38287, 需求 = 432, 帮贡 = 72}
	技能消耗[73] = {经验 = 214868, 金钱 = 40287, 需求 = 438, 帮贡 = 73}
	技能消耗[74] = {经验 = 225948, 金钱 = 42365, 需求 = 444, 帮贡 = 74}
	技能消耗[75] = {经验 = 237449, 金钱 = 44521, 需求 = 450, 帮贡 = 75}
	技能消耗[76] = {经验 = 249383, 金钱 = 46759, 需求 = 456, 帮贡 = 76}
	技能消耗[77] = {经验 = 261760, 金钱 = 39080, 需求 = 462, 帮贡 = 77}
	技能消耗[78] = {经验 = 274589, 金钱 = 51485, 需求 = 468, 帮贡 = 78}
	技能消耗[79] = {经验 = 287884, 金钱 = 53978, 需求 = 474, 帮贡 = 79}
	技能消耗[80] = {经验 = 301652, 金钱 = 56559, 需求 = 480, 帮贡 = 80}
	技能消耗[81] = {经验 = 315908, 金钱 = 59232, 需求 = 486, 帮贡 = 81}
	技能消耗[82] = {经验 = 330662, 金钱 = 61999, 需求 = 492, 帮贡 = 82}
	技能消耗[83] = {经验 = 345924, 金钱 = 64860, 需求 = 498, 帮贡 = 83}
	技能消耗[84] = {经验 = 361708, 金钱 = 67820, 需求 = 504, 帮贡 = 84}
	技能消耗[85] = {经验 = 378023, 金钱 = 70879, 需求 = 510, 帮贡 = 85}
	技能消耗[86] = {经验 = 394882, 金钱 = 73030, 需求 = 516, 帮贡 = 86}
	技能消耗[87] = {经验 = 412297, 金钱 = 77305, 需求 = 522, 帮贡 = 87}
	技能消耗[88] = {经验 = 430280, 金钱 = 80677, 需求 = 528, 帮贡 = 88}
	技能消耗[89] = {经验 = 448844, 金钱 = 84158, 需求 = 534, 帮贡 = 89}
	技能消耗[90] = {经验 = 468000, 金钱 = 87750, 需求 = 540, 帮贡 = 90}
	技能消耗[91] = {经验 = 487760, 金钱 = 91455, 需求 = 546, 帮贡 = 91}
	技能消耗[92] = {经验 = 508137, 金钱 = 95275, 需求 = 552, 帮贡 = 92}
	技能消耗[93] = {经验 = 529145, 金钱 = 99214, 需求 = 558, 帮贡 = 93}
	技能消耗[94] = {经验 = 550796, 金钱 = 103274, 需求 = 564, 帮贡 = 94}
	技能消耗[95] = {经验 = 573103, 金钱 = 107456, 需求 = 570, 帮贡 = 95}
	技能消耗[96] = {经验 = 596078, 金钱 = 111764, 需求 = 576, 帮贡 = 96}
	技能消耗[97] = {经验 = 619735, 金钱 = 116200, 需求 = 582, 帮贡 = 97}
	技能消耗[98] = {经验 = 644088, 金钱 = 120766, 需求 = 588, 帮贡 = 98}
	技能消耗[99] = {经验 = 669149, 金钱 = 125465, 需求 = 594, 帮贡 = 99}
	技能消耗[100] = {经验 = 694932, 金钱 = 130299, 需求 = 600, 帮贡 = 100}
	技能消耗[101] = {经验 = 721452, 金钱 = 135272, 需求 = 606, 帮贡 = 101}
	技能消耗[102] = {经验 = 748722, 金钱 = 140385, 需求 = 612, 帮贡 = 102}
	技能消耗[103] = {经验 = 776755, 金钱 = 145641, 需求 = 618, 帮贡 = 103}
	技能消耗[104] = {经验 = 805566, 金钱 = 151043, 需求 = 624, 帮贡 = 104}
	技能消耗[105] = {经验 = 835169, 金钱 = 156594, 需求 = 630, 帮贡 = 105}
	技能消耗[106] = {经验 = 865579, 金钱 = 162296, 需求 = 636, 帮贡 = 106}
	技能消耗[107] = {经验 = 896809, 金钱 = 168151, 需求 = 642, 帮贡 = 107}
	技能消耗[108] = {经验 = 928876, 金钱 = 174164, 需求 = 648, 帮贡 = 108}
	技能消耗[109] = {经验 = 961792, 金钱 = 180336, 需求 = 654, 帮贡 = 109}
	技能消耗[110] = {经验 = 995572, 金钱 = 186669, 需求 = 660, 帮贡 = 110}
	技能消耗[111] = {经验 = 1030234, 金钱 = 193168, 需求 = 666, 帮贡 = 111}
	技能消耗[112] = {经验 = 1065190, 金钱 = 199835, 需求 = 672, 帮贡 = 112}
	技能消耗[113] = {经验 = 1102256, 金钱 = 206673, 需求 = 678, 帮贡 = 113}
	技能消耗[114] = {经验 = 1139649, 金钱 = 213684, 需求 = 684, 帮贡 = 114}
	技能消耗[115] = {经验 = 1177983, 金钱 = 220871, 需求 = 690, 帮贡 = 115}
	技能消耗[116] = {经验 = 1217273, 金钱 = 228238, 需求 = 696, 帮贡 = 116}
	技能消耗[117] = {经验 = 1256104, 金钱 = 235788, 需求 = 702, 帮贡 = 117}
	技能消耗[118] = {经验 = 1298787, 金钱 = 243522, 需求 = 709, 帮贡 = 118}
	技能消耗[119] = {经验 = 1341043, 金钱 = 251445, 需求 = 714, 帮贡 = 119}
	技能消耗[120] = {经验 = 1384320, 金钱 = 259560, 需求 = 720, 帮贡 = 120}
	技能消耗[121] = {经验 = 1428632, 金钱 = 267868, 需求 = 726, 帮贡 = 121}
	技能消耗[122] = {经验 = 1473999, 金钱 = 276374, 需求 = 732, 帮贡 = 122}
	技能消耗[123] = {经验 = 1520435, 金钱 = 285081, 需求 = 738, 帮贡 = 123}
	技能消耗[124] = {经验 = 1567957, 金钱 = 293992, 需求 = 744, 帮贡 = 124}
	技能消耗[125] = {经验 = 1616583, 金钱 = 303109, 需求 = 750, 帮贡 = 125}
	技能消耗[126] = {经验 = 1666328, 金钱 = 312436, 需求 = 756, 帮贡 = 126}
	技能消耗[127] = {经验 = 1717211, 金钱 = 321977, 需求 = 762, 帮贡 = 127}
	技能消耗[128] = {经验 = 1769248, 金钱 = 331734, 需求 = 768, 帮贡 = 128}
	技能消耗[129] = {经验 = 1822456, 金钱 = 341710, 需求 = 774, 帮贡 = 129}
	技能消耗[130] = {经验 = 1876852, 金钱 = 351909, 需求 = 780, 帮贡 = 130}
	技能消耗[131] = {经验 = 1932456, 金钱 = 363335, 需求 = 786, 帮贡 = 131}
	技能消耗[132] = {经验 = 1989284, 金钱 = 372990, 需求 = 792, 帮贡 = 132}
	技能消耗[133] = {经验 = 2047353, 金钱 = 383878, 需求 = 798, 帮贡 = 133}
	技能消耗[134] = {经验 = 2106682, 金钱 = 395002, 需求 = 804, 帮贡 = 134}
	技能消耗[135] = {经验 = 2167289, 金钱 = 406366, 需求 = 810, 帮贡 = 135}
	技能消耗[136] = {经验 = 2229192, 金钱 = 417973, 需求 = 816, 帮贡 = 136}
	技能消耗[137] = {经验 = 2292410, 金钱 = 429826, 需求 = 822, 帮贡 = 137}
	技能消耗[138] = {经验 = 2356960, 金钱 = 441930, 需求 = 828, 帮贡 = 138}
	技能消耗[139] = {经验 = 2422861, 金钱 = 454286, 需求 = 834, 帮贡 = 139}
	技能消耗[140] = {经验 = 2490132, 金钱 = 466899, 需求 = 840, 帮贡 = 140}
	技能消耗[141] = {经验 = 2558792, 金钱 = 479773, 需求 = 846, 帮贡 = 141}
	技能消耗[142] = {经验 = 2628860, 金钱 = 492911, 需求 = 852, 帮贡 = 142}
	技能消耗[143] = {经验 = 2700356, 金钱 = 506316, 需求 = 858, 帮贡 = 143}
	技能消耗[144] = {经验 = 2773296, 金钱 = 519993, 需求 = 864, 帮贡 = 144}
	技能消耗[145] = {经验 = 2847703, 金钱 = 533944, 需求 = 870, 帮贡 = 145}
	技能消耗[146] = {经验 = 2923593, 金钱 = 548173, 需求 = 876, 帮贡 = 146}
	技能消耗[147] = {经验 = 3000989, 金钱 = 562685, 需求 = 882, 帮贡 = 147}
	技能消耗[148] = {经验 = 3079908, 金钱 = 577482, 需求 = 888, 帮贡 = 148}
	技能消耗[149] = {经验 = 3160372, 金钱 = 592569, 需求 = 894, 帮贡 = 149}
	技能消耗[150] = {经验 = 3242400, 金钱 = 607950, 需求 = 900, 帮贡 = 150}
	技能消耗[151] = {经验 = 5022276, 金钱 = 623627, 需求 = 906, 帮贡 = 151}
	技能消耗[152] = {经验 = 5185064, 金钱 = 639604, 需求 = 912, 帮贡 = 152}
	技能消耗[153] = {经验 = 5352040, 金钱 = 655887, 需求 = 918, 帮贡 = 153}
	技能消耗[154] = {经验 = 5523289, 金钱 = 672478, 需求 = 924, 帮贡 = 154}
	技能消耗[155] = {经验 = 5698889, 金钱 = 689381, 需求 = 930, 帮贡 = 155}
	技能消耗[156] = {经验 = 5878922, 金钱 = 706601, 需求 = 936, 帮贡 = 156}
	技能消耗[157] = {经验 = 6063472, 金钱 = 724140, 需求 = 942, 帮贡 = 157}
	技能消耗[158] = {经验 = 6252524, 金钱 = 742004, 需求 = 948, 帮贡 = 156}
	技能消耗[159] = {经验 = 6446464, 金钱 = 760195, 需求 = 954, 帮贡 = 159}
	技能消耗[160] = {经验 = 6645076, 金钱 = 778719, 需求 = 960, 帮贡 = 160}
	技能消耗[161] = {经验 = 12459518, 金钱 = 839604, 需求 = 966, 帮贡 = 161}
	return 技能消耗[目标技能等级]
end

function 计算修炼等级经验(等级,上限)
	local 临时经验=110
	if 等级==0 then return 110 end
	for n=1,上限+1 do
		临时经验=临时经验+20+n*20
		if n==等级 then return  临时经验 end
	end
end

function 场景类_场景:取模型(ID)
	local 角色信息 = {}
	角色信息[1] = "飞燕女"
	角色信息[2] = "英女侠"
	角色信息[3] = "巫蛮儿"
	角色信息[4] = "逍遥生"
	角色信息[5] = "剑侠客"
	角色信息[6] = "狐美人"
	角色信息[7] = "骨精灵"
	角色信息[8] = "杀破狼"
	角色信息[9] = "巨魔王"
	角色信息[10] = "虎头怪"
	角色信息[11] = "舞天姬"
	角色信息[12] = "玄彩娥"
	角色信息[13] = "羽灵神"
	角色信息[14] = "神天兵"
	角色信息[15] = "龙太子"
	角色信息[16] = "桃夭夭"
	角色信息[17] = "偃无师"
	角色信息[18] = "鬼潇潇"
	juesexinxi[19] = "影精灵"
	return 角色信息[ID]
end

function 场景类_场景:队伍角色(模型)
	local 角色信息 = {
		飞燕女 = {模型="飞燕女",ID=1,染色方案=3,性别="女",种族="人",门派={"大唐官府","女儿村","方寸山","神木林"},门派师傅={"程咬金","孙婆婆","菩提祖师","巫奎虎"},门派模型={"男人_程咬金","孙婆婆","菩提老祖","巫奎虎"},武器={"双剑","环圈"}},
		英女侠 = {模型="英女侠",ID=2,染色方案=4,性别="女",种族="人",门派={"大唐官府","女儿村","方寸山","神木林"},门派师傅={"程咬金","孙婆婆","菩提祖师","巫奎虎"},门派模型={"男人_程咬金","孙婆婆","菩提老祖","巫奎虎"},武器={"双剑","鞭"}},
		巫蛮儿 = {模型="巫蛮儿",ID=3,染色方案=1,性别="女",种族="人",门派={"大唐官府","女儿村","方寸山","神木林"},门派师傅={"程咬金","孙婆婆","菩提祖师","巫奎虎"},门派模型={"男人_程咬金","孙婆婆","菩提老祖","巫奎虎"},武器={"宝珠","法杖"}},
		逍遥生 = {模型="逍遥生",ID=4,染色方案=1,性别="男",种族="人",门派={"大唐官府","化生寺","方寸山","神木林"},门派师傅={"程咬金","空度禅师","菩提祖师","巫奎虎"},门派模型={"男人_程咬金","男人_老和尚","菩提老祖","巫奎虎"},武器={"扇","剑"}},
		剑侠客 = {模型="剑侠客",ID=5,染色方案=2,性别="男",种族="人",门派={"大唐官府","化生寺","方寸山","神木林"},门派师傅={"程咬金","空度禅师","菩提祖师","巫奎虎"},门派模型={"男人_程咬金","男人_老和尚","菩提老祖","巫奎虎"},武器={"刀","剑"}},
		狐美人 = {模型="狐美人",ID=6,染色方案=7,性别="女",种族="魔",门派={"盘丝洞","阴曹地府","魔王寨","无底洞"},门派师傅={"白晶晶","地藏王","牛魔王","地涌夫人"},门派模型={"白晶晶","地藏王","牛魔王","地涌夫人"},武器={"爪刺","鞭"}},
		骨精灵 = {模型="骨精灵",ID=7,染色方案=8,性别="女",种族="魔",门派={"盘丝洞","阴曹地府","魔王寨","无底洞"},门派师傅={"白晶晶","地藏王","牛魔王","地涌夫人"},门派模型={"白晶晶","地藏王","牛魔王","地涌夫人"},武器={"魔棒","爪刺"}},
		杀破狼 = {模型="杀破狼",ID=8,染色方案=1,性别="男",种族="魔",门派={"狮驼岭","阴曹地府","魔王寨","无底洞"},门派师傅={"大大王","地藏王","牛魔王","地涌夫人"},门派模型={"大大王","地藏王","牛魔王","地涌夫人"},武器={"宝珠","弓弩"}},
		巨魔王 = {模型="巨魔王",ID=9,染色方案=5,性别="男",种族="魔",门派={"狮驼岭","阴曹地府","魔王寨","无底洞"},门派师傅={"大大王","地藏王","牛魔王","地涌夫人"},门派模型={"大大王","地藏王","牛魔王","地涌夫人"},武器={"刀","斧钺"}},
		虎头怪 = {模型="虎头怪",ID=10,染色方案=6,性别="男",种族="魔",门派={"狮驼岭","阴曹地府","魔王寨","无底洞"},门派师傅={"大大王","地藏王","牛魔王","地涌夫人"},门派模型={"大大王","地藏王","牛魔王","地涌夫人"},武器={"斧钺","锤子"}},
		舞天姬 = {模型="舞天姬",ID=11,染色方案=11,性别="女",种族="仙",门派={"天宫","普陀山","龙宫","凌波城","花果山"},门派师傅={"李靖","观音姐姐","东海龙王","二郎神","齐天大圣"},门派模型={"李靖","观音姐姐","男人_东海龙王","二郎神","齐天大圣"},武器={"飘带","环圈"}},
		玄彩娥 = {模型="玄彩娥",ID=12,染色方案=12,性别="女",种族="仙",门派={"天宫","普陀山","龙宫","凌波城","花果山"},门派师傅={"李靖","观音姐姐","东海龙王","二郎神","齐天大圣"},门派模型={"李靖","观音姐姐","男人_东海龙王","二郎神","齐天大圣"},武器={"飘带","魔棒"}},
		羽灵神 = {模型="羽灵神",ID=13,染色方案=1,性别="男",种族="仙",门派={"天宫","五庄观","龙宫","凌波城","花果山"},门派师傅={"李靖","镇元子","东海龙王","二郎神","齐天大圣"},门派模型={"李靖","镇元子","男人_东海龙王","二郎神","齐天大圣"},武器={"法杖","弓弩"}},
		神天兵 = {模型="神天兵",ID=14,染色方案=9,性别="男",种族="仙",门派={"天宫","五庄观","龙宫","凌波城","花果山"},门派师傅={"李靖","镇元子","东海龙王","二郎神","齐天大圣"},门派模型={"李靖","镇元子","男人_东海龙王","二郎神","齐天大圣"},武器={"锤","枪矛"}},
		龙太子 = {模型="龙太子",ID=15,染色方案=10,性别="男",种族="仙",门派={"天宫","五庄观","龙宫","凌波城","花果山"},门派师傅={"李靖","镇元子","东海龙王","二郎神","齐天大圣"},门派模型={"李靖","镇元子","男人_东海龙王","二郎神","齐天大圣"},武器={"扇","枪矛"}},
		桃夭夭 = {模型="桃夭夭",ID=16,染色方案=1,性别="女",种族="仙",门派={"天宫","普陀山","龙宫","凌波城","花果山"},门派师傅={"李靖","观音姐姐","东海龙王","二郎神","齐天大圣"},门派模型={"李靖","观音姐姐","男人_东海龙王","二郎神","齐天大圣"},武器={"灯笼"}},
		偃无师 = {模型="偃无师",ID=17,染色方案=1,性别="男",种族="人",门派={"大唐官府","化生寺","方寸山","神木林"},门派师傅={"程咬金","空度禅师","菩提祖师","巫奎虎"},门派模型={"男人_程咬金","男人_老和尚","菩提老祖","巫奎虎"},武器={"剑","巨剑"}},
		鬼潇潇 = {模型="鬼潇潇",ID=18,染色方案=2,性别="女",种族="魔",门派={"盘丝洞","阴曹地府","魔王寨","无底洞"},门派师傅={"白晶晶","地藏王","牛魔王","地涌夫人"},门派模型={"白晶晶","地藏王","牛魔王","地涌夫人"},武器={"爪刺","伞"}},
	    影精灵 = {模型="影精灵",ID=19,染色方案=2,性别="女",种族="魔",门派={"九黎城"},门派师傅={"蚩尤幻影"},门派模型={"蚩尤"},武器={"爪刺","魔棒","巨斧乾","巨斧坤"}},

	}
	return 角色信息[模型]
end

function 场景类_场景:取经验(id,lv)
	local exp={}
	if id==1 then
		exp={
			40,110,237,450,779,1252,1898,2745,3822,5159,6784,8726,11013,13674,16739,20236,24194,28641,33606,39119,45208,
			51902,55229,67218,75899,85300,95450,106377,118110,130679,144112,158438,173685,189882,207059,225244,244466,264753,
			286134,308639,332296,357134,383181,410466,439019,468868,500042,532569,566478,601799,638560,676790,716517,757770,
			800579,844972,890978,938625,987942,1038959,1091704,1146206,1202493,1260594,1320539,1382356,1446074,1511721,1579326,
			1648919,1720528,1794182,1869909,1947738,2027699,2109820,2194130,2280657,2369431,2460479,2553832,2649518,2747565,
			2848003,2950859,3056164,3163946,3274233,3387055,3502439,3620416,3741014,3864261,3990187,4118819,4250188,4384322,
			4521249,4660999,4803599,4998571,5199419,5406260,5619213,5838397,6063933,6295941,6534544,6779867,7032035,7291172,
			7557407,7830869,8111686,8399990,8695912,8999586,9311145,9630726,9958463,10294496,10638964,10992005,11353761,11724374,
			12103988,12492748,12890799,13298287,13715362,14142172,14578867,15025600,15482522,15949788,16427552,16915970,17415202,
			17925402,18446732,18979354,19523428,20079116,20646584,21225998,43635044,44842648,46075148,47332886,48616200,74888148,
			76891401,78934581,81018219,83142835,85308969,87977421,89767944,92061870,146148764,150094780,154147340,158309318,
			162583669,166973428,171481711,176111717,180866734,185780135,240602904,533679362,819407100,1118169947, 1430306664,
			1756161225,2096082853
		}
	else
		exp={
			50,200,450,800,1250,1800,2450,3250,4050,5000,6050,7200,8450,9800,11250,12800,14450,16200,18050,20000,22050,24200,
			26450,28800,31250,33800,36450,39200,42050,45000,48050,51200,54450,57800,61250,64800,68450,72200,76050,80000,84050,
			88200,92450,96800,101250,105800,110450,115200,120050,125000,130050,135200,140450,145800,151250,156800,162450,
			168200,174050,180000,186050,192200,198450,204800,211250,217800,224450,231200,238050,245000,252050,259200,266450,
			273800,281250,288800,296450,304200,312050,320000,328050,336200,344450,352800,361250,369800,378450,387200,396050,
			405000,414050,423200,432450,441800,451250,460800,470450,480200,490050,500000,510050,520200,530450,540800,551250,
			561800,572450,583200,594050,605000,616050,627200,638450,649800,661250,672800,684450,696200,708050,720000,732050,
			744200,756450,768800,781250,793800,806450,819200,832050,845000,858050,871200,884450,897800,911250,924800,938450,
			952200,966050,980000,994050,1008200,1022450,1036800,1051250,1065800,1080450,1095200,1110050,1125000,1140050,1155200,
			1170450,1185800,1201250,1216800,1232450,1248200,1264050,1280000,1300000,1340000,1380000,1420000,1460000,1500000,1540000,
			1580000,1700000,1780000,1820000,1940000,2400000,2880000,3220000,4020000,4220000,4420000,4620000,5220000,5820000,6220000,
			7020000,8020000,9020000
		}
	end
	return exp[lv+1]
end

function 场景类_场景:取称谓说明(称谓)
	return "未知称谓!.#9"
end

function 场景类_场景:取武器附加名称(子类,级别限制,名称)

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
		伞 = {"油纸伞","红罗伞","紫竹伞","锦绣椎","幽兰帐","琳琅盖","孔雀羽","金刚伞","落梅伞","鬼骨","云梦","枕霞","碧火琉璃","雪羽穿云","月影星痕","浮生归梦","晴雪"},
		双斧乾 = {"顽石双斧(乾)","镔铁双斧(乾)","黑曜双斧(乾)","枭首双斧(乾)","破军双斧(乾)","隳城双戚(乾)","飞头蛮(乾)","竹叶青(乾)","鲛煞(乾)","啖月(乾)","义战(乾)","恶来(乾)","烬世野火(乾)","九州海沸(乾)","八狱末劫(乾)","罗喉计都(乾)","非天(乾)"},
	 	双斧坤 = {"顽石双斧(坤)","镔铁双斧(坤)","黑曜双斧(坤)","枭首双斧(坤)","破军双斧(坤)","隳城双戚(坤)","飞头蛮(坤)","竹叶青(坤)","鲛煞(坤)","啖月(坤)","义战(坤)","恶来(坤)","烬世野火(坤)","九州海沸(坤)","八狱末劫(坤)","罗喉计都(坤)","非天(坤)"}

	}
	local 临时 = 武器表[self:取武器子类(子类)]
	if 临时 then
		for i=1,#临时 do
			if 临时[i] == 名称 then
				if i >= 10 then
					return 名称
				else
					return 临时[math.modf((i-1)/3)*3 +1]
				end
			end
		end
	end
	return 名称

	-- if 子类 == 1 then
	-- 	if 级别限制 < 21 then
	-- 		return "红缨枪"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "乌金三叉戟"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "玄铁矛"
	-- 	end
	-- elseif 子类 == 2 then
	-- 	if 级别限制 < 21 then
	-- 		return "青铜斧"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "双弦钺"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "乌金鬼头镰"
	-- 	end
	-- elseif 子类 == 3 then
	-- 	if 级别限制 < 21 then
	-- 		return "青铜短剑"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "青锋剑"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "游龙剑"
	-- 	end
	-- elseif 子类 == 4 then
	-- 	if 级别限制 < 21 then
	-- 		return "双短剑"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "竹节双剑"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "赤焰双剑"
	-- 	end
	-- elseif 子类 == 5 then
	-- 	if 级别限制 < 21 then
	-- 		return "五色缎带"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "无极丝"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "七彩罗刹"
	-- 	end
	-- elseif 子类 == 6 then
	-- 	if 级别限制 < 21 then
	-- 		return "铁爪"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "青龙牙"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "青刚刺"
	-- 	end
	-- elseif 子类 == 7 then
	-- 	if 级别限制 < 21 then
	-- 		return "折扇"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "铁面扇"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "神火扇"
	-- 	end
	-- elseif 子类 == 8 then
	-- 	if 级别限制 < 21 then
	-- 		return "细木棒"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "点金棒"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "满天星"
	-- 	end
	-- elseif 子类 == 9 then
	-- 	if 级别限制 < 21 then
	-- 		return "松木锤"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "狼牙锤"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "震天锤"
	-- 	end
	-- elseif 子类 == 10 then
	-- 	if 级别限制 < 21 then
	-- 		return "牛皮鞭"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "钢结鞭"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "青藤柳叶鞭"
	-- 	end
	-- elseif 子类 == 11 then
	-- 	if 级别限制 < 21 then
	-- 		return "黄铜圈"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "金刺轮"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "蛇形月"
	-- 	end
	-- elseif 子类 == 12 then
	-- 	if 级别限制 < 21 then
	-- 		return "柳叶刀"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "金背大砍刀"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "狼牙刀"
	-- 	end
	-- elseif 子类 == 13 then
	-- 	if 级别限制 < 21 then
	-- 		return "曲柳杖"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "墨铁拐"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "腾云杖"
	-- 	end
	-- elseif 子类 == 14 then
	-- 	if 级别限制 < 21 then
	-- 		return "硬木弓"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "宝雕长弓"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "连珠神弓"
	-- 	end
	-- elseif 子类 == 15 then
	-- 	if 级别限制 < 21 then
	-- 		return "琉璃珠"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "翡翠珠"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "如意宝珠"
	-- 	end
	-- elseif 子类 == 16 then
	-- 	if 级别限制 < 21 then
	-- 		return "钝铁重剑"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "壁玉长铗"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "惊涛雪"
	-- 	end
	-- elseif 子类 == 17 then
	-- 	if 级别限制 < 21 then
	-- 		return "红罗伞"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "琳琅盖"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "金刚伞"
	-- 	end
	-- elseif 子类 == 18 then
	-- 	if 级别限制 < 21 then
	-- 		return "素纸灯"
	-- 	elseif 级别限制 > 20 and 级别限制 < 51 then
	-- 		return "如意宫灯"
	-- 	elseif 级别限制 > 59 and 级别限制 < 90 then
	-- 		return "玉兔盏"
	-- 	end
	-- end
	-- return 名称
end

function 场景类_场景:取武器子类(子类)
	local n = {"枪矛","斧钺","剑","双短剑","飘带","爪刺","扇","魔棒","锤","鞭","环圈","刀","法杖","弓弩","宝珠","巨剑","伞","灯笼","头盔","发钗","项链","女衣","男衣","腰带","鞋子",[911] = "双巨斧",[910] = "双巨斧"}
	return n[子类]
end
-- function 场景类_场景:取武器子类(子类)
-- 	local n = {"枪矛","斧钺","剑","双短剑","飘带","爪刺","扇","魔棒","锤","鞭","环圈","刀","法杖","弓弩","宝珠","巨剑","伞","灯笼","头盔","发钗","项链","女衣","男衣","腰带","鞋子"}
-- 	return n[子类]
-- end

function 场景类_场景:取地图师傅(ID)
	local 师门 = nil
	if ID == 1043 then
		师门 = "空度禅师"
	elseif ID == 1054 then
		师门 = "程咬金"
	elseif ID == 1117  then
		师门 = "东海龙王"
	elseif ID == 1137  then
		师门 = "菩提祖师"
	elseif ID == 1124  then
		师门 = "地藏王"
	elseif ID == 1112 then
		师门 = "李靖"
	elseif ID == 1145 then
		师门 = "牛魔王"
	elseif ID == 1141 then
		师门 = "观音姐姐"
	elseif ID == 1147 then
		师门 = "镇元子"
	elseif ID == 1134 then
		师门 = "大大王"
	elseif ID == 1144 then
		师门 = "白晶晶"
	elseif ID == 1150 then
		师门 = "二郎神"
	elseif ID == 1154 then
		师门 = "巫奎虎"
	elseif ID == 1156 then
		师门 = "地涌夫人"
	elseif ID == 1143 then
		师门 = "孙婆婆"
	elseif ID == 1251 then
		师门 = "齐天大圣"
	elseif ID == 1580 then
		师门 = "蚩尤幻影"
	end
	return 师门
end

function 场景类_场景:刷新队伍()
	if self.窗口.召唤兽属性栏.可视 then
		for s=1,7 do
			if self.队伍[1].宝宝列表[s] ~= nil then
				self.队伍[1].宝宝列表[s].潜力 = self.队伍[1].宝宝列表[s].潜力 + (self.窗口.召唤兽属性栏.临时潜力[s].体质 + self.窗口.召唤兽属性栏.临时潜力[s].魔力 + self.窗口.召唤兽属性栏.临时潜力[s].力量 + self.窗口.召唤兽属性栏.临时潜力[s].耐力 + self.窗口.召唤兽属性栏.临时潜力[s].敏捷)
			end
			self.窗口.召唤兽属性栏.临时潜力[s] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
			self.窗口.召唤兽属性栏.预览属性[s] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
		end
	end
	if self.窗口.人物状态栏.可视 then
		self.队伍[1].潜力 = self.队伍[1].潜力 + (self.窗口.人物状态栏.临时潜力.体质 + self.窗口.人物状态栏.临时潜力.魔力 + self.窗口.人物状态栏.临时潜力.力量 + self.窗口.人物状态栏.临时潜力.耐力 + self.窗口.人物状态栏.临时潜力.敏捷)
		self.窗口.人物状态栏.临时潜力 = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
		self.窗口.人物状态栏.预览属性 = {气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,法伤=0,法防=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	end
	self.窗口.人物状态栏:刷新()
	self.窗口.召唤兽属性栏:刷新()
	self.窗口.道具行囊:刷新()
end

function 场景类_场景:取y偏移(头像)
	if 头像 == "杀破狼" then
		return 35
	elseif 头像 == "巫蛮儿" then
		return 19
	elseif 头像 == "羽灵神" then
		return 25
	elseif 头像 == "吸血鬼" then
		return 25
	elseif 头像 == "鬼潇潇" then
		return 1
	elseif 头像 == "桃夭夭" then
		return 58
	elseif 头像 == "偃无师" then
		return 33
	elseif 头像 == "曼珠沙华" or 头像 == "狂豹人形" then
		return 303
	elseif 头像 == "鲛人" then
		return 27
	elseif 头像 == "犀牛将军_人" then
		return 32
	elseif 头像 == "野猪精" then
		return 25
	elseif 头像 == "修罗傀儡妖" or 头像 == "金身罗汉" then
		return 235
	elseif 头像 == "猫灵人形" then
		return 275
	elseif 头像 == "藤蔓妖花"  or 头像 == "修罗傀儡鬼"then
		return 260
	elseif 头像 == "混沌兽" then
		return 350
	elseif 头像 == "蜃气妖" then
		return 215
	elseif 头像 == "泡泡"  then
		return 20
	elseif 头像 == "福星" or 头像 == "长眉灵猴" or 头像 == "巨力神猿" then
		return 28
	elseif 头像 == "葫芦宝贝" then
		return 336
	elseif 头像 == "蝎子精" then
		return 236
	elseif 头像 == "猫灵兽形" or 头像 == "猫灵" then
		return 377
	elseif 头像 == "狂豹兽形" then
		return 363
	elseif 头像 == "物件_打铁炉" then
		return -63
	elseif 头像 == "银两" or 头像 == "食物" or 头像 == "口粮" or 头像 == "摄妖香" or 头像 == "药品" then
		return -20
	end
	return 0
end

function 引擎.取物品功效(物品,品质)
	local pg = {}
	if 物品 == "四叶花" then
		pg.气血 = 40
	elseif 物品 == "七叶莲" then
		pg.气血 = 60
	elseif 物品 == "天青地白" then
		pg.气血 = 80
	elseif 物品 == "紫丹罗" or 物品 == "佛手" or 物品 == "旋复花" then
		pg.魔法 = 20
	elseif 物品 == "百色花" or 物品 == "香叶" or 物品 == "龙须草" then
		pg.魔法 = 30
	elseif 物品 == "灵脂" or 物品 == "白玉骨头" then
		pg.魔法 = 40
	elseif 物品 == "曼佗罗花" then
		pg.魔法 = 50
	elseif 物品 == "天不老" or 物品 == "紫石英" then
		pg.气血 = 100
	elseif 物品 == "鹿茸" or 物品 == "血色茶花" then
		pg.气血 = 150
	elseif 物品 == "六道轮回" or 物品 == "熊胆"  then
		pg.气血 = 200
	elseif 物品 == "凤凰尾" or 物品 == "硫磺草" then
		pg.气血 = 250
	elseif 物品 == "龙之心屑" or 物品 == "火凤之睛" then
		pg.气血 = 300
	elseif 物品 == "丁香水" or 物品 == "月星子" then
		pg.魔法 = 100
	elseif 物品 == "仙狐涎" or 物品 == "地狱灵芝" or 物品 == "麝香" or 物品 == "血珊瑚" then
		pg.魔法 = 150
	elseif 物品 == "餐风饮露" or 物品 == "白露为霜" then
		pg.魔法 = 200
	elseif 物品 == "孔雀红" or 物品 == "天龙水" then
		pg.魔法 = 250
	elseif 物品 == "金创药" then
		pg.气血 = 500
	elseif 物品 == "金香玉" then
		pg.气血 = 1500
	elseif 物品 == "小还丹" then
		pg.气血 = 1200
	elseif 物品 == "千年保心丹" then
		pg.气血 = 1000
	elseif 物品 == "风水混元丹" then
		pg.魔法 = 400
	elseif 物品 == "定神香" then
		pg.魔法 = 550
	elseif 物品 == "蛇蝎美人" then
		pg.魔法 = 650
	elseif 物品 == "九转回魂丹" then
		pg.气血 = 600
		pg.复活 = 0
	elseif 物品 == "佛光舍利子" then
		pg.气血 = 300
		pg.复活 = 0
	elseif 物品 == "五龙丹" then
		pg.气血 = 300
		pg.功效 = "解除封类异常状态"
	elseif 物品 == "月饼" then
		pg.功效 = "增加两点潜力点"
	elseif 物品 == "元宵" then
		pg.功效 = "增加资质与成长"
	elseif 物品 == "包子" then
		pg.气血 = 100
	elseif 物品 == "秘制红罗羹" then
		pg.功效 = "增加10000点储备气血"
	elseif 物品 == "秘制绿罗羹" then
		pg.功效 = "增加10000点储备魔法"
	end
	return pg
end

-- 领取任务模块
function 场景类_场景:取剧情描述(主线,进度,分支)
	if 主线 == 1 then
		if 进度 == 1 then
		  return {"桃源村一别","天气晴好，正宜出行和".."#Y/qqq|霞姑娘*桃源村*npc查询/霞姑娘".."#W说话去。"}
		elseif 进度 == 2 then
		  return {"桃源村一别","去看看".."#Y/qqq|刘大婶*桃源村*npc查询/刘大婶#W。"}
		elseif 进度 == 3 then
		  return {"桃源村一别","去".."#Y/qqq|孙猎户*桃源村*npc查询/孙猎户".."#W看看是否需要帮助。"}
		elseif 进度 == 4 then
		  return {"桃源村一别","帮助孙猎户打晕这头".."#Y/qqq|野猪*桃源村*npc查询/野猪#W。"}
		elseif 进度 == 5 then
		  return {"桃源村一别","跟".."#Y/qqq|孙厨娘*桃源村*npc查询/孙厨娘".."#W报个平安。"}
		elseif 进度 == 6 then
		  return {"桃源村一别","".."#Y/qqq|郭大哥*桃源村*npc查询/郭大哥".."#W在呼救，这就去看看发生了什么！"}
		elseif 进度 == 7 then
		  return {"桃源村一别","帮助".."#Y/qqq|郭大哥*桃源村*npc查询/郭大哥".."#W抓捕狸！"}
		elseif 进度 == 8 then
		  return {"桃源村一别","狸的状况好像不太好找".."#Y/qqq|玄大夫*桃源村*npc查询/玄大夫".."#W帮他治疗吧！"}
		elseif 进度 == 9 then
		  return {"桃源村一别","找".."#Y/qqq|雨画师*桃源村*npc查询/雨画师".."#W他好像又什么事情要告诉你。"}
		elseif 进度 == 10 then
		  return {"桃源村一别","点按Tab键或点击界面上角放大镜图键地图左下方NPC".."#Y/qqq|萍儿*桃源村*npc查询/萍儿".."#W就可以自动寻路。"}
		elseif 进度 == 11 then
		  return {"桃源村一别","".."#Y/qqq|桃源仙女*桃源村*npc查询/桃源仙女".."#W已经等候多时了，快点点击选项这就上船开启游湖之旅吧。"}
		elseif 进度 == 12 then
		  return {"桃源村一别","和".."#Y/qqq|夏大叔*桃源村*npc查询/夏大叔".."#W告个别吧！"}
		elseif 进度 == 13 then
		  return {"桃源村一别","".."#Y/qqq|夏大叔*桃源村*npc查询/夏大叔".."#W虽是对你多加鼓励，可是你的心中依然忐忑！"}
		end
	elseif 主线 == 2 then
		if 进度 == 2222 then
			local 名字 = self:取地图师傅(引擎.场景.队伍[1].剧情.地图)
			return {"拜师","快点和你师傅".."#R"..名字.."#W说说话，如果有缘的话就拜师吧。"}
		elseif 进度 == 2 then
			return {"商人的鬼魂","[新手主线]找".."#Y/qqq|老孙头*建邺城*npc查询/老孙头".."#W问一下建邺城闹鬼的事！"}
		elseif 进度 == 3 then
			return {"商人的鬼魂","[新手主线]找".."#Y/qqq|牛大胆*建邺城*npc查询/牛大胆".."#W去寻问做法事的事情。"}
		elseif 进度 == 4 then
			return {"商人的鬼魂","[新手主线]问问".."#Y/qqq|王大嫂*建邺城*npc查询/王大嫂".."#W有没有美味可口的".."#Y/qqq|获取途径*任务获取*bz提示/红烧鱼"}
		elseif 进度 == 5 then
			return {"商人的鬼魂","[新手主线]帮助".."#Y/qqq|王大嫂*建邺城*npc查询/王大嫂".."#W寻找个#Y/qqq|获取途径*建邺城药店购买*bz提示/熊胆#W点按ALT+G键或点击界面下方的小手将#R熊胆#W给予王大婶"}
		elseif 进度 == 6 then
			return {"商人的鬼魂","[新手主线]将#R红烧鱼#W交给".."#Y/qqq|牛大胆*建邺城*npc查询/牛大胆".."#W饱饱口福"}
		elseif 进度 == 7 then
			return {"商人的鬼魂","[新手主线]询问".."#Y/qqq|管家*建邺城*npc查询/管家".."#W关于李善人恶疾的事情"}
		elseif 进度 == 8 then
			return {"商人的鬼魂","[新手主线]找".."#Y/qqq|马全有*建邺城*npc查询/马全友".."#W问问#R松风林芝"}
		elseif 进度 == 9 then
			return {"商人的鬼魂","[新手主线]将".."#Y/qqq|获取途径*建邺城药店购买*bz提示/地狱灵芝".."#W交给".."#Y/qqq|管家*建邺城*npc查询/管家"}
		elseif 进度 == 10 then
			return {"商人的鬼魂","[新手主线]找".."#Y/qqq|李善人*民居内室*npc查询/李善人".."#W打听一下恶鬼的来历"}
		elseif 进度 == 11 then
			return {"商人的鬼魂","[新手主线]去".."#Y/qqq|行走路径*地图左面传送阵*bz提示/东海湾沉船底".."#W找到".."#Y/qqq|商人的鬼魂*沉船内室*npc查询/商人的鬼魂"}
		elseif 进度 == 12 then
			return {"商人的鬼魂","[新手主线]告诉".."#Y/qqq|李善人*民居内室*npc查询/李善人".."#W鬼魂的事情"}
		elseif 进度 == 13 then
			return {"商人的鬼魂","[新手主线]将事情告诉".."#Y/qqq|老孙头*建邺城*npc查询/老孙头".."#W让他安心"}
		 elseif 进度 == 14 then
		 	return {"商人的鬼魂","[新手主线]和".."#Y/qqq|老孙头*建邺城*npc查询/老孙头".."#W告个别吧"}
		end
	elseif 主线 == 3 then
		if 进度 == 1 then
			return {"玄奘的身世","[主线剧情]在".."#Y/qqq|南极仙翁*长寿村*npc查询/南极仙翁".."#W处领取“玄奘的身世”剧情任务。"}
		elseif 进度 == 2 then
			return {"玄奘的身世","[主线剧情]听说南极仙翁的白鹿幻化成".."#Y/qqq|白鹿精*大唐境外*npc查询/白鹿精".."#W快去找找看吧！"}
		elseif 进度 == 3 then
			return {"玄奘的身世","[主线剧情]收服白鹿精后，将白鹿带回".."#Y/qqq|南极仙翁*长寿村*npc查询/南极仙翁".."#W处。"}
		elseif 进度 == 4 then
			return {"玄奘的身世","[主线剧情]快去长安药店买一朵".."#Y/qqq|获取途径*长安药店*bz提示/百色花".."#W来给".."#Y/qqq|南极仙翁*长寿村*npc查询/南极仙翁".."#W吧。"}
		elseif 进度 == 5 then
			return {"玄奘的身世","[主线剧情]去长安的福寿店买一炷".."#Y/qqq|获取途径*长安福寿店*bz提示/香".."#W再去大唐国境金山寺".."#Y/qqq|酒肉和尚*大雄宝殿*npc查询/酒肉和尚".."#W处上香吧 。"}
		elseif 进度 == 6 then
			return {"玄奘的身世","[主线剧情]酒肉和尚出口伤人，去看看深受打击的".."#Y/qqq|玄奘*大雄宝殿*npc查询/玄奘".."#W法师吧。"}
		elseif 进度 == 7 then
			return {"玄奘的身世","[主线剧情]去跟化生寺的小和尚".."#Y/qqq|慧明*光华殿*npc查询/慧明".."#W打听".."#Y/qqq|法明长老*光华殿*npc查询/法明长老".."#W的下落"}
		elseif 进度 == 8 and 分支 == 1 then
			return {"玄奘的身世","[主线剧情]去看看厢房内的".."#Y/qqq|法明长老*光华殿*npc查询/法明长老".."#W是否安然无恙吧。"}
		elseif 进度 == 8 and 分支 == 2 then
			return {"玄奘的身世","[主线剧情]化生寺居然有劫难？快去".."#Y/qqq|空慈方丈*化生寺*npc查询/空慈方丈".."#W处打探。"}
		elseif 进度 == 8 and 分支 == 3 then
			return {"玄奘的身世","[主线剧情]别让".."#Y/qqq|白琉璃*大唐国境*npc查询/白琉璃".."#W逃走！快去夺回".."#Y/qqq|获取途径*炼药*bz提示/佛光舍利子".."#W！"}
		elseif 进度 == 8 and 分支 == 4 then
			return {"玄奘的身世","[主线剧情]拿回了".."#Y/qqq|获取途径*炼药*bz提示/佛光舍利子".."#W赶快回化生寺交给".."#Y/qqq|空慈方丈*化生寺*npc查询/空慈方丈".."#W吧"}
		elseif 进度 == 9 then
			return {"玄奘的身世","[主线剧情]法明长老昏迷不醒，跟寺内照顾长老的".."#Y/qqq|慧海*化生寺*npc查询/慧海".."#W和尚打听一下情况吧。"}
		elseif 进度 == 10 then
			return {"玄奘的身世","[主线剧情]人命关天，赶快请花果山的".."#Y/qqq|侯医仙*花果山*npc查询/侯医仙".."#W来救长老一命！"}
		elseif 进度 == 11 then
			return {"玄奘的身世","[主线剧情]快去寻得".."#Y/qqq|获取途径*野外或商会购买*bz提示/餐风饮露".."#W这味药材交给".."#Y/qqq|侯医仙*花果山*npc查询/侯医仙".."#W！"}
		elseif 进度 == 12 then
			return {"玄奘的身世","[主线剧情]拿到灵药".."#Y/qqq|获取途径*炼药*bz提示/定神香".."#W赶快回去化生寺厢房交给".."#Y/qqq|法明长老*光华殿*npc查询/法明长老".."#W服用吧！"}
		elseif 进度 == 13 then
			return {"玄奘的身世","[主线剧情]把血书拿给".."#Y/qqq|玄奘*大雄宝殿*npc查询/玄奘".."#W看看！"}
		elseif 进度 == 14 then
			return {"玄奘的身世","[主线剧情]".."#Y/qqq|酒肉和尚*大雄宝殿*npc查询/酒肉和尚".."#W对玄奘法师做了什么！快去找他问问。"}
		elseif 进度 == 15 then
			return {"玄奘的身世","[主线剧情]快去普陀山请".."#Y/qqq|青莲仙女*潮音洞*npc查询/青莲仙女".."#W炼制丹药吧！"}
		elseif 进度 == 16 then
			return {"玄奘的身世","[主线剧情]快去阴曹地府向".."#Y/qqq|孟婆*阴曹地府*npc查询/孟婆".."#W讨一碗孟婆酒吧！（此环节需要等级 ≥40）"}
		elseif 进度 == 17 then
			return {"玄奘的身世","[主线剧情]去找地狱迷宫一层的".."#Y/qqq|幽冥鬼*地狱迷宫一层*npc查询/幽冥鬼".."#W要一碗酒。"}
		elseif 进度 == 18 then
			return {"玄奘的身世","[主线剧情]去大唐国境江州民居内找他口中的".."#Y/qqq|文秀*江州民居*npc查询/文秀".."#W要姑娘打听一下。"}
		elseif 进度 == 19 then
			return {"玄奘的身世","[主线剧情]把文秀的手镯交给".."#Y/qqq|幽冥鬼*地狱迷宫一层*npc查询/幽冥鬼".."#W让他安心投胎吧！。"}
		elseif 进度 == 20 then
			return {"玄奘的身世","[主线剧情]跟".."#Y/qqq|孟婆*阴曹地府*npc查询/孟婆".."#W讨了那碗孟婆酒走吧。"}
		elseif 进度 == 21 then
			return {"玄奘的身世","[主线剧情]把九转回魂丹和孟婆酒拿给".."#Y/qqq|玄奘*大雄宝殿*npc查询/玄奘".."#法师服用吧。"}
		elseif 进度 == 22 then
			return {"玄奘的身世","[主线剧情]前往大唐国境江州衙门处找些".."#Y/qqq|衙门守卫*大唐国境*npc查询/衙门守卫".."#打听打听情况。"}
		elseif 进度 == 23 then
			return {"玄奘的身世","[主线剧情]可以进衙门找".."#Y/qqq|殷温娇*大唐国境*npc查询/殷温娇".."#W了。 "}
		elseif 进度 == 24 then
			return {"玄奘的身世","[主线剧情]既与龙宫相关，就找再江州衙门街头溜达的".."#Y/qqq|虾兵*大唐国境*npc查询/虾兵".."#W问问！ "}
		elseif 进度 == 25 then
			return {"玄奘的身世","[主线剧情]快去向大唐国境的".."#Y/qqq|渔翁*大唐国境*npc查询/渔翁".."#W求教入海方法吧！ "}
		elseif 进度 == 26 then
			return {"玄奘的身世","[主线剧情]听说大唐国境有".."#Y/qqq|山神*大唐国境*npc查询/山神".."#出没过去看看吧！ "}
		elseif 进度 == 27 then
			return {"玄奘的身世","[主线剧情]找到".."#Y/qqq|获取途径*烹饪或摊位购买*bz提示/臭豆腐".."#W贿赂".."#Y/qqq|山神*大唐国境*npc查询/山神".."#W。（可选战斗） "}
		elseif 进度 == 28 then
			return {"玄奘的身世","[主线剧情]找到".."#Y/qqq|获取途径*烹饪或摊位购买*bz提示/梅花酒".."#W重新贿赂".."#Y/qqq|山神*大唐国境*npc查询/山神".."#W吧。 "}
		elseif 进度 == 29 then
			return {"玄奘的身世","[主线剧情]先去龙宫拜见守门大将军".."#Y/qqq|蟹将军*龙宫*npc查询/蟹将军".."#大人吧！ "}
		elseif 进度 == 30 then
			return {"玄奘的身世","[主线剧情]终于可以拜见".."#Y/qqq|龟千岁*龙宫*npc查询/龟千岁".."#交还宝物 ".."#Y/qqq|获取途径*江州闲逛的虾兵*bz提示/定颜珠".."#！ "}
		elseif 进度 == 31 then
			return {"玄奘的身世","[主线剧情]将".."#Y/qqq|获取途径*大唐国境山神*bz提示/辟水宝珠".."#W交换给".."#Y/qqq|山神*大唐国境*npc查询/山神".."#W。 "}
		elseif 进度 == 32 then
			return {"玄奘的身世","[主线剧情]将陈光蕊的信物交给江州衙门的".."#Y/qqq|殷温娇*大唐国境*npc查询/殷温娇".."#W吧！ "}
		elseif 进度 == 33 then
			return {"玄奘的身世","[主线剧情]要找寻找婆婆的下落先问问大唐国境万花店的".."#Y/qqq|小二*大唐国境*npc查询/小二".."#W。 "}
		elseif 进度 == 34 then
			return {"玄奘的身世","[主线剧情]".."#Y/qqq|婆婆*大唐国境*npc查询/婆婆".."#W在大唐国境洪州街头乞讨，快去那里找到她吧。（将萧给她） "}
		elseif 进度 == 35 then
			return {"玄奘的身世","[主线剧情]买一只".."#Y/qqq|获取途径*烹饪技巧*bz提示/烤鸭".."#W给".."#Y/qqq|婆婆*大唐国境*npc查询/婆婆".."#W吃。 "}
		elseif 进度 == 36 then
			return {"玄奘的身世","[主线剧情]去龙宫求丁香水".."#Y/qqq|龟千岁*龙宫*npc查询/龟千岁".."#W应该会应允吧。 "}
		elseif 进度 == 37 then
			return {"玄奘的身世","[主线剧情]用".."#Y/qqq|获取途径*野外或商会购买*bz提示/丁香水".."#W回去治好".."#Y/qqq|婆婆*大唐国境*npc查询/婆婆".."#W的眼睛。"}
		elseif 进度 == 38 then
			return {"玄奘的身世","[主线剧情]替".."#Y/qqq|殷温娇*大唐国境*npc查询/殷温娇".."#W找到了婆婆，可以回去江州衙门复命了。 "}
		elseif 进度 == 39 then
			return {"玄奘的身世","[主线剧情]前往长安到殷丞相府请".."#Y/qqq|殷丞相*丞相府*npc查询/殷丞相".."#W派出救兵！ "}
		elseif 进度 == 40 then
			return {"玄奘的身世","[主线剧情]".."#Y/qqq|殷夫人*丞相府*npc查询/殷夫人".."#W好像气坏了身体，快去丞相府内堂看看。 "}
		elseif 进度 == 41 then
			return {"玄奘的身世","[主线剧情]快去找金香玉来救殷夫人！听说江南野外的".."#Y/qqq|江湖奸商*江南野外*npc查询/江湖奸商".."#W那里有售。 "}
		elseif 进度 == 42 then
			return {"玄奘的身世","[主线剧情]拿到金香玉，快给".."#Y/qqq|殷夫人*丞相府*npc查询/殷夫人".."#W服用吧。 "}
		elseif 进度 == 43 then
			return {"玄奘的身世","[主线剧情]拿着前往皇宫拜见皇上".."#Y/qqq|李世民*金銮殿*npc查询/李世民".."#W请求出兵！ "}
		elseif 进度 == 44 then
			return {"玄奘的身世","[主线剧情]去皇宫后花园找".."#Y/qqq|赵美人*长安城*npc查询/赵美人".."#W问问。 "}
		elseif 进度 == 45 then
			return {"玄奘的身世","[主线剧情]将奏折递交给".."#Y/qqq|魏征*金銮殿*npc查询/魏征".."#W大人吧。 "}
		elseif 进度 == 46 then
			return {"玄奘的身世","[主线剧情]终于请到救兵，快去大唐国境将恶贼".."#Y/qqq|刘洪*江州衙门*npc查询/刘洪".."#W砍个片甲不留！ "}
		elseif 进度 == 47 then
			return {"玄奘的身世","[主线剧情]快去大唐境外追捕真正的".."#Y/qqq|刘洪*大唐境外*npc查询/刘洪".."#W和帮凶".."#Y/qqq|李彪*大唐境外*npc查询/李彪".."#W！"}
		elseif 进度 == 48 then
			return {"玄奘的身世","[主线剧情]恶人自有恶人磨，姑且看看".."#Y/qqq|刘洪*大唐境外*npc查询/刘洪".."#W要怎么办！"}
		elseif 进度 == 49 then
			return {"玄奘的身世","[主线剧情]擒下李彪，且看".."#Y/qqq|刘洪*大唐境外*npc查询/刘洪".."#W还有何话要说！"}
		elseif 进度 == 50 then
			return {"玄奘的身世","[主线剧情]将将州府大印交给".."#Y/qqq|殷温娇*大唐国境*npc查询/殷温娇".."#W吧！"}
		elseif 进度 == 51 then
			return {"玄奘的身世","[主线剧情]去金山寺吧玄奘母亲手抄的".."#Y/qqq|获取途径*玄奘的身世*bz提示/般若多罗蜜心经".."#W交给".."#Y/qqq|玄奘*大雄宝殿*npc查询/玄奘".."#W法师吧。 "}
		end
	elseif 主线 == 4 then
		if 进度 == 1 then
			return {"沙僧剧情","[主线剧情]在".."#Y/qqq|天兵飞剑*大唐境外*npc查询/天兵飞剑".."#W处领取沙僧剧情任务。"}
		elseif 进度 == 2 then
			return {"大战心魔","[主线剧情]搞定了天兵，看看".."#Y/qqq|卷帘大将*大唐境外*npc查询/卷帘大将".."#W有什么苦衷。"}
		elseif 进度 == 3 then
			return {"大战心魔","[主线剧情]一场激战后".."#Y/qqq|卷帘大将*大唐境外*npc查询/卷帘大将".."#W身上散落一串念珠，大将的神色忽然大变，赶紧问问他怎么回事？"}
		elseif 进度 == 4 then
			return {"大战心魔","[主线剧情]向长安城的".."#Y/qqq|袁天罡*长安城*npc查询/袁天罡".."#W请教阵法之理。"}
		elseif 进度 == 5 then
			return {"大战心魔","[主线剧情]找到散落的天衡星听说江南野外的".."#Y/qqq|樵夫*江南野外*npc查询/樵夫".."#W知道其下落。"}
		elseif 进度 == 6 then
			return {"大战心魔","[主线剧情]帮助袁守诚打败困扰他的".."#Y/qqq|龙孙*长安城*npc查询/龙孙".."#W，然后询问天衡星的下落。"}
		elseif 进度 == 7 then
			return {"大战心魔","[主线剧情]这条小龙好生凶悍，问问".."#Y/qqq|袁守诚*长安城*npc查询/袁守诚".."#W究竟是怎么回事。"}
		elseif 进度 == 8 then
			return {"大战心魔","[主线剧情]去龙宫找".."#Y/qqq|小龙女*龙宫*npc查询/小龙女".."#W替袁守诚解释事情原由（可选战斗）"}
		elseif 进度 == 9 then
			return {"大战心魔","[主线剧情]回长安找".."#Y/qqq|袁守诚*长安城*npc查询/袁守诚".."#W要天衡星。"}
		elseif 进度 == 10 then
			return {"大战心魔","[主线剧情]寻找散落的天英星，听说天宫的".."#Y/qqq|水军统领*天宫*npc查询/水军统领".."#W知道其下落。"}
		elseif 进度 == 11 then
			return {"大战心魔","[主线剧情]去地府".."#Y/qqq|转轮王*森罗殿*npc查询/转轮王".."#W处打听一下。"}
		elseif 进度 == 12 then
			return {"大战心魔","[主线剧情]难道天英也闯祸了？为何没被收去找天宫的托塔".."#Y/qqq|李靖*凌霄宝殿*npc查询/李靖".."#W打听一下。"}
		elseif 进度 == 13 then
			return {"大战心魔","[主线剧情]给".."#Y/qqq|守门天兵*天宫*npc查询/守门天兵".."#W买壶好酒".."#Y/qqq|获取途径*烹饪技巧*bz提示/醉生梦死".."#W。 "}
		elseif 进度 == 14 then
			return {"大战心魔","[主线剧情]拿到了".."#Y/qqq|获取途径*如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买*bz提示/火尖枪".."#W可以回去天宫和".."#Y/qqq|李靖*凌霄宝殿*npc查询/李靖".."#W交换天英了。 "}
		elseif 进度 == 15 then
			return {"大战心魔","[主线剧情]天心妖犯了大错误将被处死，找负责看守的道童".."#Y/qqq|清风*五庄观*npc查询/清风".."#W求下情。"}
		elseif 进度 == 16 then
			return {"大战心魔","[主线剧情]救活人参树的方法，长寿村的".."#Y/qqq|太白金星*长寿村*npc查询/太白金星".."#W应该知晓！"}
		elseif 进度 == 17 then
			return {"大战心魔","[主线剧情]太白金星居然推卸给".."#Y/qqq|太上老君*兜率宫*npc查询/太上老君".."#W，只好去问问了。"}
		elseif 进度 == 18 then
			return {"大战心魔","[主线剧情]太上老君又推卸给普陀山的".."#Y/qqq|青莲仙女*潮音洞*npc查询/青莲仙女".."#W？！继续跑路吧。"}
		elseif 进度 == 19 then
			return {"大战心魔","[主线剧情]寻找".."#Y/qqq|获取途径*野外或商会购买*bz提示/火凤之睛".."#W交给".."#Y/qqq|青莲仙女*潮音洞*npc查询/青莲仙女".."#W快去吧。"}
		elseif 进度 == 20 then
			return {"大战心魔","[主线剧情]拿到仙露，回五庄观交给道童".."#Y/qqq|清风*五庄观*npc查询/清风".."#W救治人参果树。"}
		elseif 进度 == 21 then
			return {"大战心魔","[主线剧情]听说是长寿郊外的".."#Y/qqq|路人甲*长寿郊外*npc查询/路人甲".."#W拿了".."#Y/qqq|获取途径*如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买*bz提示/金击子".."#W。（可选战斗））"}
		elseif 进度 == 22 then
			return {"大战心魔","[主线剧情]拿回".."#Y/qqq|获取途径*如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买*bz提示/金击子".."#W回去交给五庄观的道童".."#Y/qqq|清风*五庄观*npc查询/清风".."#W换取天心。"}
		elseif 进度 == 23 then
			return {"大战心魔","[主线剧情]集齐三星，复原九宫，可以去大唐境外找".."#Y/qqq|卷帘大将*大唐境外*npc查询/卷帘大将".."#W的心魔算账了。"}
		elseif 进度 == 24 then
			return {"大战心魔","[主线剧情]打败心魔，劝服".."#Y/qqq|卷帘大将*大唐境外*npc查询/卷帘大将".."#W成为天命取经人。"}
		end
	elseif 主线 == 5 then
		if 进度 == 1 then
			return {"含冤小白龙","[主线剧情]在".."#Y/qqq|大力神灵*天宫*npc查询/大力神灵".."#W处领取“含冤的小白龙”剧情任务。"}
		elseif 进度 == 2 then
			return {"含冤小白龙","[主线剧情]白痴大力神灵的玄天铁鞭丢了，去长寿村找进来得到一条好鞭子的".."#Y/qqq|毛驴张*长寿村*npc查询/毛驴张".."#W问问。"}
		elseif 进度 == 3 then
			return {"含冤小白龙","[主线剧情]帮".."#Y/qqq|毛驴张*长寿村*npc查询/毛驴张".."#W买来".."#Y/qqq|获取途径*长安杂货店*bz提示/高级宠物口粮".."#W。"}
		elseif 进度 == 4 then
			return {"含冤小白龙","[主线剧情]将".."#Y/qqq|获取途径*如果不慎遗失可到长长安城“剧情道具NPC”（202，251）购买*bz提示/玄天铁鞭".."#W交给天宫的".."#Y/qqq|大力神灵*天宫*npc查询/大力神灵".."#W。"}
		elseif 进度 == 5 then
			return {"含冤小白龙","[主线剧情]可怜的小白龙犯了死罪被关进天牢，去".."#Y/qqq|天牢守卫*天宫*npc查询/天牢守卫".."#W疏通疏通看能不能探视下小白龙。"}
		elseif 进度 == 6 then
			return {"含冤小白龙","[主线剧情]".."#Y/qqq|小白龙*海底迷宫五层*npc查询/小白龙".."#W越狱了？料想他定是逃去了海底迷宫五层了。"}
		elseif 进度 == 7 then
			return {"含冤小白龙","[主线剧情]把信物交给大雁塔顶层的".."#Y/qqq|镇塔之神*大雁塔七层*npc查询/镇塔之神".."#W。"}
		elseif 进度 == 8 then
			return {"含冤小白龙","[主线剧情]帮忙在塔内巡逻，搞定二楼的".."#Y/qqq|梦之魅*大雁塔二层*npc查询/梦之魅".."#W。"}
		elseif 进度 == 9 then
			return {"含冤小白龙","[主线剧情]帮忙在塔内巡逻，搞定四楼的".."#Y/qqq|血之魅*大雁塔四层*npc查询/血之魅".."#W。"}
		elseif 进度 == 10 then
			return {"含冤小白龙","[主线剧情]帮忙在塔内巡逻，搞定五楼的".."#Y/qqq|森之魅*大雁塔五层*npc查询/森之魅".."#W。"}
		elseif 进度 == 11 then
			return {"含冤小白龙","[主线剧情]回去找大雁塔顶层的".."#Y/qqq|镇塔之神*大雁塔七层*npc查询/镇塔之神".."#W复命把。"}
		elseif 进度 == 12 then
			return {"含冤小白龙","[主线剧情]赶走入侵大雁塔四层的".."#Y/qqq|奔波儿灞*大雁塔四层*npc查询/奔波儿灞".."#W。"}
		elseif 进度 == 13 then
			return {"含冤小白龙","[主线剧情]万圣公主竟做出这种事？！先带着".."#Y/qqq|获取途径*如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买*bz提示/白剑".."#W去找".."#Y/qqq|蟹将军*龙宫*npc查询/蟹将军".."#W问个明白把"}
		elseif 进度 == 14 then
			return {"含冤小白龙","[主线剧情]摆平了蟹将军，还有个".."#Y/qqq|虾将军*龙宫*npc查询/虾将军".."#W做拦路虎！"}
		elseif 进度 == 15 then
			return {"含冤小白龙","[主线剧情]摆平了虾兵蟹将后，终于可以去找".."#Y/qqq|万圣公主*龙宫*npc查询/万圣公主".."#W了。"}
		elseif 进度 == 16 then
			return {"含冤小白龙","[主线剧情]原来万圣公主受此冤屈，替他向天宫的".."#Y/qqq|王母娘娘*凌霄宝殿*npc查询/王母娘娘".."#W索回龙须草。"}
		elseif 进度 == 17 then
			return {"含冤小白龙","[主线剧情]夺回了".."#Y/qqq|获取途径*野外或商会购买*bz提示/龙须草".."#W可以交还给".."#Y/qqq|万圣公主*龙宫*npc查询/万圣公主".."#W了。"}
		elseif 进度 == 18 then
			return {"含冤小白龙","[主线剧情]没想到被万圣公主骗了羞愧之余，还是把龙须草还给".."#Y/qqq|王母娘娘*凌霄宝殿*npc查询/王母娘娘".."#W。"}
		elseif 进度 == 19 then
			return {"含冤小白龙","[主线剧情]了却万圣公主一事，是时候去魔王寨找元凶".."#Y/qqq|九头精怪*魔王居*npc查询/九头精怪".."#W算账了。"}
		elseif 进度 == 20 then
			return {"含冤小白龙","[主线剧情]打发掉牛魔王的亲兵，这下该轮到".."#Y/qqq|九头精怪*魔王居*npc查询/九头精怪".."#W了。"}
		elseif 进度 == 21 then
			return {"含冤小白龙","[主线剧情]九头精怪已经把镇塔之宝进贡给天庭了，赶紧找".."#Y/qqq|玉皇大帝*凌霄宝殿*npc查询/玉皇大帝".."#W索要回来。"}
		elseif 进度 == 22 then
			return {"含冤小白龙","[主线剧情]昏庸的玉帝就知道喊观音如来，还是亲自去普陀山找".."#Y/qqq|青莲仙女*潮音洞*npc查询/青莲仙女".."#W问个明白。"}
		elseif 进度 == 23 then
			return {"含冤小白龙","[主线剧情]拿着青莲仙女给予的餐风饮露，前往天宫跟".."#Y/qqq|玉皇大帝*凌霄宝殿*npc查询/玉皇大帝".."#W问交换镇塔之宝吧。"}
		elseif 进度 == 24 then
			return {"含冤小白龙","[主线剧情]拿到镇塔之宝，返回大雁塔七层交还给".."#Y/qqq|镇塔之神*大雁塔七层*npc查询/镇塔之神".."#W。"}
		elseif 进度 == 25 then
			return {"含冤小白龙","[主线剧情]将观音姐姐的信物碧水青龙带给小白龙，现在就去海底迷宫五层找".."#Y/qqq|小白龙*海底迷宫五层*npc查询/小白龙".."#W吧。"}
		end
	elseif 主线 == 6 then
		if 进度 == 1 then
			return {"女娲神迹","[冥冥之中的天意]待你强大以后去找".."#Y/qqq|女娲神迹传送人*北俱芦洲*npc查询/女娲神迹传送人".."#W问一下身世之谜"}
		elseif 进度 == 2 then
			return {"女娲神迹","[冥冥之中的天意]找".."#Y/qqq|美猴王*水帘洞*npc查询/美猴王".."#W解开这个谜团"}
		elseif 进度 == 3 then
			return {"女娲神迹","[冥冥之中的天意]帮助".."#Y/qqq|美猴王*水帘洞*npc查询/美猴王".."#W找来一坛#R女儿红"}
		elseif 进度 == 4 then
			return {"女娲神迹","[冥冥之中的天意]找".."#Y/qqq|女娲神迹传送人*北俱芦洲*npc查询/女娲神迹传送人".."#W在问一下事情的始末"}
		elseif 进度 == 5 then
			return {"女娲神迹","[冥冥之中的天意]找".."#Y/qqq|小紫*圣殿*npc查询/小紫".."#W了解下这件事情"}
		elseif 进度 == 6 then
			return {"女娲神迹","[冥冥之中的天意]将".."#W/将小紫".."#W姑娘的情况告诉#R/qqq|女娲神迹传送人*北俱芦洲*npc查询/女娲神迹传送人"}
		elseif 进度 == 7 then
			return {"女娲神迹","[冥冥之中的天意]找到".."#Y/qqq|获取途径*中药医理制作的道具*bz提示/千年保心丹".."#W给#Y/qqq|小紫*圣殿*npc查询/小紫#W服下"}
		elseif 进度 == 8 then
			return {"女娲神迹","[冥冥之中的天意]将".."#Y/qqq|小紫*圣殿*npc查询/小紫".."#W说的话告诉#Y/qqq|美猴王*水帘洞*npc查询/美猴王"}
		elseif 进度 == 9 then
			return {"女娲神迹","[冥冥之中的天意]去盘丝岭打探下".."#Y/qqq|春十三娘*盘丝洞*npc查询/春十三娘".."#W的底细"}
		elseif 进度 == 10 then
			return {"女娲神迹","[冥冥之中的天意]告诉".."#Y/qqq|小紫*圣殿*npc查询/小紫".."#W敌人的情况"}
		end
	elseif 主线 == 7 then
		if 进度 == 1 then
			return {"八戒悟空","[主线剧情]".."#Y/qqq|月香侍女*月宫*npc查询/月香侍女".."#W处领取“八戒悟空”剧情任务。"}
		elseif 进度 == 2 then
			return {"八戒悟空","[主线剧情]".."#Y/qqq|康太尉*月宫*npc查询/康太尉".."#W这家伙竟来打扰嫦娥仙子清修，快打发他走！"}
		elseif 进度 == 3 then
			return {"八戒悟空","[主线剧情]打跑前来捣乱的康太尉，问问".."#Y/qqq|月香侍女*月宫*npc查询/月香侍女".."#W究竟是为何事。"}
		elseif 进度 == 4 then
			return {"八戒悟空","[主线剧情]月香姑娘似乎难于开口，还是去问问".."#Y/qqq|嫦娥*广寒宫*npc查询/嫦娥".."#W仙子吧。"}
		elseif 进度 == 5 then
			return {"八戒悟空","[主线剧情]原来如此，但听说他在凡间也惹了不少感情债，去找".."#Y/qqq|卵二姐*江南野外*npc查询/卵二姐".."#W问问。"}
		elseif 进度 == 6 then
			return {"八戒悟空","[主线剧情]听说".."#Y/qqq|罗纤纤*江南野外*npc查询/罗纤纤".."#W头上带的桃花特别娇艳，前去问问。"}
		elseif 进度 == 7 then
			return {"八戒悟空","[主线剧情]帮罗纤纤探探长安国子监内".."#Y/qqq|吴举人*国子监书库*npc查询/吴举人".."#W的心意。"}
		elseif 进度 == 8 then
			return {"八戒悟空","[主线剧情]帮吴举人送花给".."#Y/qqq|罗纤纤*江南野外*npc查询/罗纤纤".."#W。"}
		elseif 进度 == 9 then
			return {"八戒悟空","[主线剧情]撮合一对新人后，将"..self:剧情物品("桃花","长安城杂货店").."#W拿去给"..self:剧情npc("卵二姐",1193).."#W。"}
		elseif 进度 == 10 then
			return {"八戒悟空","[主线剧情]就帮卵二姐将"..self:剧情物品("桃花","长安城杂货店").."#W还给"..self:剧情npc("天蓬元帅",1173).."#W。"}
		elseif 进度 == 11 then
			return {"八戒悟空","[主线剧情]无奈还是帮天蓬元帅去高家庄找"..self:剧情npc("高翠兰",1171).."#W小姐退婚吧。"}
		elseif 进度 == 12 then
			return {"八戒悟空","[主线剧情]打退了高家抢亲的队伍，回去向"..self:剧情npc("天蓬元帅",1173).."#W交差。"}
		elseif 进度 == 13 then
			return {"八戒悟空","[主线剧情]得向境外的"..self:剧情npc("土地公公",1173).."#W打听盘丝岭的所在。"}
		elseif 进度 == 14 then
			return {"八戒悟空","[主线剧情]付给土地咨询费。"}
		elseif 进度 == 15 then
			return {"八戒悟空","[主线剧情]帮土地打退捣乱的大唐境外的"..self:剧情npc("冤魂",1173).."#W。"}
		elseif 进度 == 16 then
			return {"八戒悟空","[主线剧情]回去向"..self:剧情npc("土地公公",1173).."#W打听情魔蛛丝之毒的秘密。"}
		elseif 进度 == 17 then
			return {"八戒悟空","[主线剧情]先去找"..self:剧情npc("天蓬元帅",1173).."#W解除他和卵二姐之间的”疚“之情。"}
		elseif 进度 == 18 then
			return {"八戒悟空","[主线剧情]代替天蓬送"..self:剧情物品("桃花","长安城杂货店").."#W给"..self:剧情npc("卵二姐",1193).."#W请求她的原谅。"}
		elseif 进度 == 19 then
			return {"八戒悟空","[主线剧情]卵二姐原谅了天蓬，回去向"..self:剧情npc("天蓬元帅",1173).."#W说明。"}
		elseif 进度 == 20 then
			return {"八戒悟空","[主线剧情]前往高老庄找"..self:剧情npc("高翠兰",1171).."#W小姐，解除天蓬元帅的”怖“之情。"}
		elseif 进度 == 21 then
			return {"八戒悟空","[主线剧情]高翠兰小姐净是胡，还是找她爹爹"..self:剧情npc("高老先生",1170).."#W说个明白吧。"}
		elseif 进度 == 22 then
			return {"八戒悟空","[主线剧情]快去长安找"..self:剧情npc("红线童子",1001).."#W问问。"}
		elseif 进度 == 23 then
			return {"八戒悟空","[主线剧情]这红线童子好生胡闹去找"..self:剧情npc("绿儿",1142).."#W要回木偶。"}
		elseif 进度 == 24 then
			return {"八戒悟空","[主线剧情]终于换回张小二的木偶了，快拿去给"..self:剧情npc("红线童子",1001).."#W吧。"}
		elseif 进度 == 25 then
			return {"八戒悟空","[主线剧情]终于牵对了红线，回高家庄看看"..self:剧情npc("高翠兰",1171).."#W小姐现在怎样。"}
		elseif 进度 == 26 then
			return {"八戒悟空","[主线剧情]高小姐已不在迷恋天蓬元帅，拿回"..self:剧情物品("婚书","如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买").."给"..self:剧情npc("天蓬元帅",1173).."#W化解这”怖“之情吧。"}
		elseif 进度 == 27 then
			return {"八戒悟空","[主线剧情]上月宫广寒宫内找"..self:剧情npc("嫦娥",1531).."#W仙子，解除“嗔”之情。"}
		elseif 进度 == 28 then
			return {"八戒悟空","[主线剧情]前往天宫找可恶的"..self:剧情npc("杨戬",1112).."#W讨回两人定情之物绿烟如梦。"}
		elseif 进度 == 29 then
			return {"八戒悟空","[主线剧情]去长寿村的"..self:剧情npc("慧觉和尚",1070).."#W那里打探下绿烟如梦的情况。"}
		elseif 进度 == 30 then
			return {"八戒悟空","[主线剧情]"..self:剧情物品("绿烟如梦","如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买").."#W破碎了。拿回广寒宫给"..self:剧情npc("嫦娥",1531).."#W仙子想想办法吧。"}
		elseif 进度 == 31 then
			return {"八戒悟空","[主线剧情]嫦娥仙子的一滴泪让"..self:剧情物品("绿烟如梦","如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买").."#W恢复原状，快拿回给"..self:剧情npc("天蓬元帅",1173).."#W恢复记忆吧。"}
		elseif 进度 == 32 then
			return {"八戒悟空","[主线剧情]最后是找花十娘解除四情之“爱”盘丝岭的位置？还是得问问境外的"..self:剧情npc("土地公公",1173).."#W。"}
		elseif 进度 == 33 then
			return {"八戒悟空","[主线剧情]原来盘丝岭内讧了，快劝盘丝洞内的"..self:剧情npc("白晶晶",1144).."#W不要冲动犯事。"}
		elseif 进度 == 34 then
			return {"八戒悟空","[主线剧情]据说山寨的大帮主知晓孙悟空的下路，去境外找"..self:剧情npc("至尊宝",1173).."#W问个明白。"}
		elseif 进度 == 35 then
			return {"八戒悟空","[主线剧情]大帮主疯疯癫癫，去大唐境外找真正的"..self:剧情npc("二帮主",1173).."#W问个明白。"}
		elseif 进度 == 36 then
			return {"八戒悟空","[主线剧情]去北俱芦洲寻找蛇蝎美人，听说北俱芦洲的"..self:剧情npc("江湖奸商",1174).."#W那儿有。"}
		elseif 进度 == 37 then
			return {"八戒悟空","[主线剧情]去北俱芦洲凤巢的"..self:剧情npc("辛发明",1186).."#W那里寻找红雪散。"}
		elseif 进度 == 38 then
			return {"八戒悟空","[主线剧情]去北俱芦洲龙窟的"..self:剧情npc("龙神",1178).."#W那里寻找五龙丹。"}
		elseif 进度 == 39 then
			return {"八戒悟空","[主线剧情]集齐了三种药材，将蛇蝎美人交给"..self:剧情npc("至尊宝",1173).."#W吧。"}
		elseif 进度 == 40 then
			return {"八戒悟空","[主线剧情]集齐了三种药材，将红雪散交给"..self:剧情npc("至尊宝",1173).."#W吧。"}
		elseif 进度 == 41 then
			return {"八戒悟空","[主线剧情]集齐了三种药材，将五龙丹交给"..self:剧情npc("至尊宝",1173).."#W吧。"}
		elseif 进度 == 42 then
			return {"八戒悟空","[主线剧情]拿着孙悟空的信物"..self:剧情物品("玉佩","如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买").."#W回去盘丝洞交给"..self:剧情npc("白晶晶",1144).."#W。"}
		elseif 进度 == 43 then
			return {"八戒悟空","[主线剧情]晶晶姑娘杀去盘丝洞了，快去找境外的"..self:剧情npc("土地公公",1173).."#W阻止她。"}
		elseif 进度 == 44 then
			return {"八戒悟空","[主线剧情]现在四情终于破解，可以回去境外"..self:剧情npc("天蓬元帅",1173).."#W那解开他的心结了。"}
		elseif 进度 == 45 then
			return {"八戒悟空","[主线剧情]天蓬元帅已经大彻大悟，现在去境外告诉"..self:剧情npc("至尊宝",1173).."#W晶晶已经死这个消息吧。"}
		elseif 进度 == 46 then
			return {"八戒悟空","[主线剧情]去普陀山潮音洞找"..self:剧情npc("观音姐姐",1141).."#W借灵光宝匣一用看看过去到底发生了什么事。"}
		elseif 进度 == 47 then
			return {"八戒悟空","[主线剧情]灵光宝匣借不成。先听观音姐姐的话，回境外找"..self:剧情npc("至尊宝",1173).."#W。"}
		elseif 进度 == 48 then
			return {"八戒悟空","[主线剧情]到地府找"..self:剧情npc("地藏王",1124).."#W帮忙。"}
		elseif 进度 == 49 then
			return {"八戒悟空","[主线剧情]到地府迷宫二层找看守"..self:剧情npc("吊死鬼",1128).."#W求他把晶晶魂魄带来吧。"}
		elseif 进度 == 50 then
			return {"八戒悟空","[主线剧情]摆平了这啰嗦的看守，终于可以去地府四层找"..self:剧情npc("晶晶姑娘的鬼魂",1130).."#W了。"}
		elseif 进度 == 51 then
			return {"八戒悟空","[主线剧情]晶晶姑娘的鬼魂犹有怨气未消，帮她去普陀山潮音洞内找"..self:剧情npc("观音姐姐",1141).."#W问清事实。"}
		elseif 进度 == 52 then
			return {"八戒悟空","[主线剧情]只得去北俱芦洲的凤巢七层找叫"..self:剧情npc("无心",1192).."#W的和尚了。"}
		elseif 进度 == 53 then
			return {"八戒悟空","[主线剧情]只得去北俱芦洲的龙窟七层找"..self:剧情npc("青灵玄女",1183).."#W要回定海珠。"}
		elseif 进度 == 54 then
			return {"八戒悟空","[主线剧情]回去凤巢七层将"..self:剧情物品("定海珠","如果不慎遗失可到长安城“剧情道具NPC”（202，251）购买").."#W交给"..self:剧情npc("无心",1192).."#W和尚。"}
		elseif 进度 == 55 then
			return {"八戒悟空","[主线剧情]了解孙悟空和云霓的恩怨情仇，回去普陀山潮音洞拜见"..self:剧情npc("观音姐姐",1141).."#W。"}
		elseif 进度 == 56 then
			return {"八戒悟空","[主线剧情]拿着观音姐姐赐予的金箍回去境外交给"..self:剧情npc("至尊宝",1173).."#W点化孙悟空。"}
		elseif 进度 == 57 then
			return {"八戒悟空","[主线剧情]把孙悟空和云霓的爱恋之心带去地府四层给"..self:剧情npc("晶晶姑娘的鬼魂",1130).."#W看。"}
		elseif 进度 == 58 then
			return {"八戒悟空","[主线剧情]回去境外告知"..self:剧情npc("至尊宝",1173).."#W晶晶姑娘已大彻大悟。"}
		end
	elseif 主线 == 8 then
		if 进度 == 1 then
			return {"飞升剧情","[步入化境]待你强大以后去找".."#Y/qqq|吴刚*月宫*npc查询/吴刚".."#W了解如何飞升"}
		elseif 进度 == 2 then
			return {"飞升剧情","[步入化境]"..self:剧情npc("法明长老",1528).."#W将会指导你如何进入化境。"}
		elseif 进度 == 3 then
			return {"飞升剧情","[步入化境]去"..self:剧情npc("太上老君",1113).."#W那了解关于化境的方法。"}
		elseif 进度 == 4 then
			return {"飞升剧情","[步入化境]帮"..self:剧情npc("太上老君",1113).."#W找古代瑞兽、凤凰来做药引。"}
		elseif 进度 == 5 then
			return {"飞升剧情","[步入化境]帮"..self:剧情npc("太上老君",1113).."#W找凤凰来做药引。"}
		elseif 进度 == 6 then
			return {"飞升剧情","[步入化境]去"..self:剧情npc("玉皇大帝",1112).."#W那获得仙界试炼的资格。"}
		elseif 进度 == 7 then
			return {"飞升剧情","[步入化境]去向"..self:剧情npc("李靖",1112).."#W求取一本避火诀。"}
		elseif 进度 == 8 then
			return {"飞升剧情","[步入化境]向"..self:剧情npc("齐天大圣",1251).."#W借来紫金冠。"}
		elseif 进度 == 9 then
			return {"飞升剧情","[步入化境]找"..self:剧情npc("崩将军",1251).."#W取出紫金冠。"}
		elseif 进度 == 10 then
			return {"飞升剧情","[步入化境]向"..self:剧情npc("东海龙王",1117).."#W求取镇海针。"}
		elseif 进度 == 11 then
			return {"飞升剧情","[步入化境]去给"..self:剧情npc("东海龙王",1117).."#W找来玉龙(110扇子)镇海。"}
		elseif 进度 == 12 then
			return {"飞升剧情","[步入化境]向"..self:剧情npc("二郎神",1150).."#W求取一本开山钺。"}
		elseif 进度 == 13 then
			return {"飞升剧情","[步入化境]找"..self:剧情npc("哪吒",1112).."#W要回开山钺。"}
		elseif 进度 == 14 then
			return {"飞升剧情","[步入化境]去向"..self:剧情npc("镇元子",1147).."#W求取炼金鼎。"}
		elseif 进度 == 15 then
			return {"飞升剧情","[步入化境]找到五龙丹和佛光舍利子给"..self:剧情npc("镇元子",1147).."#W。"}
		elseif 进度 == 16 then
			return {"飞升剧情","[步入化境]找到佛光舍利子给"..self:剧情npc("镇元子",1147).."#W。"}
		elseif 进度 == 17 then
			return {"飞升剧情","[步入化境]去向"..self:剧情npc("观音姐姐",1141).."#W借把修篁斧。"}
		elseif 进度 == 18 then
			return {"飞升剧情","[步入化境]在潮音洞外四处看看。"}
		elseif 进度 == 19 then
			return {"飞升剧情","[步入化境]去"..self:剧情npc("玉皇大帝",1112).."#W那获得仙界的试炼资格。把避火决给他。"}
		elseif 进度 == 20 then
			return {"飞升剧情","[步入化境]把紫金冠给"..self:剧情npc("玉皇大帝",1112).."#W。"}
		elseif 进度 == 21 then
			return {"飞升剧情","[步入化境]把镇海针给"..self:剧情npc("玉皇大帝",1112).."#W。"}
		elseif 进度 == 22 then
			return {"飞升剧情","[步入化境]把开山钺给"..self:剧情npc("玉皇大帝",1112).."#W。"}
		elseif 进度 == 23 then
			return {"飞升剧情","[步入化境]把炼金鼎给"..self:剧情npc("玉皇大帝",1112).."#W。"}
		elseif 进度 == 24 then
			return {"飞升剧情","[步入化境]把修篁斧给"..self:剧情npc("玉皇大帝",1112).."#W。"}
		elseif 进度 == 25 then
			return {"飞升剧情","[步入化境]去找"..self:剧情npc("李世民",1044).."#W谈谈。"}
		elseif 进度 == 26 then
			return {"飞升剧情","[步入化境]获得大唐官府的推荐"}
		elseif 进度 == 27 then
			return {"飞升剧情","[步入化境]去大唐国境四处看看有没有山贼在捣乱"}
		elseif 进度 == 28 then
			return {"飞升剧情","[步入化境]回去找"..self:剧情npc("程咬金",1054).."#W复命。"}
		elseif 进度 == 29 then
			return {"飞升剧情","[步入化境]获得化生寺的推荐"}
		elseif 进度 == 30 then
			return {"飞升剧情","[步入化境]去傲来国救助三名被瘟疫感染的人们，还有3名没被救助，金毛猿"}
		elseif 进度 == 31 then
			return {"飞升剧情","[步入化境]去傲来国救助三名被瘟疫感染的人们，还有2名没被救助，九头精怪"}
		elseif 进度 == 32 then
			return {"飞升剧情","[步入化境]去傲来国救助三名被瘟疫感染的人们，还有1名没被救助，偷偷怪"}
		elseif 进度 == 33 then
			return {"飞升剧情","[步入化境]获得神木林的推荐"}
		elseif 进度 == 34 then
			return {"飞升剧情","[步入化境]获得女儿村的推荐"}
		elseif 进度 == 35 then
			return {"飞升剧情","[步入化境]孙婆婆的口信带给长寿村的海老先生"}
		elseif 进度 == 36 then
			return {"飞升剧情","[步入化境]孙婆婆的口信带给长安城（490,90）的二宝"}
		elseif 进度 == 37 then
			return {"飞升剧情","[步入化境]孙婆婆的口信带给建邺城的吹牛王"}
		elseif 进度 == 38 then
			return {"飞升剧情","[步入化境]孙婆婆的口信带给傲来国的九头精怪"}
		elseif 进度 == 39 then
			return {"飞升剧情","[步入化境]回去向"..self:剧情npc("孙婆婆",1143).."#W复命。"}
		elseif 进度 == 40 then
			return {"飞升剧情","[步入化境]已经获得各派推荐，该回去见见"..self:剧情npc("李世民",1044).."#W了。"}
		elseif 进度 == 41 then
			return {"飞升剧情","[步入化境]去方寸山学习修心封魔之法"}
		elseif 进度 == 42 then
			return {"飞升剧情","[步入化境]去找"..self:剧情npc("地藏王",1124).."#W谈谈。"}
		elseif 进度 == 43 then
			return {"飞升剧情","[步入化境]征求"..self:剧情npc("地涌夫人",1156).."#W的同意去取不死壤。"}
		elseif 进度 == 44 then
			return {"飞升剧情","[步入化境]为"..self:剧情npc("地涌夫人",1156).."#W找一个蜡烛。"}
		elseif 进度 == 45 then
			return {"飞升剧情","[步入化境]征求"..self:剧情npc("大大王",1134).."#W的同意去取不死壤。"}
		elseif 进度 == 46 then
			return {"飞升剧情","[步入化境]给"..self:剧情npc("大大王",1134).."#W找一只古代瑞兽和凤凰。"}
		elseif 进度 == 47 then
			return {"飞升剧情","[步入化境]给"..self:剧情npc("大大王",1134).."#W找一只凤凰。"}
		elseif 进度 == 48 then
			return {"飞升剧情","[步入化境]征求"..self:剧情npc("牛魔王",1145).."#W的同意去取不死壤。"}
		elseif 进度 == 49 then
			return {"飞升剧情","[步入化境]征求"..self:剧情npc("春十三娘",1144).."#W的同意去取不死壤。"}
		elseif 进度 == 50 then
			return {"飞升剧情","[步入化境]找一把回龙镊魂镖（女儿村柳飞絮处购买）给"..self:剧情npc("春十三娘",1144).."#W。"}
		elseif 进度 == 51 then
			return {"飞升剧情","[步入化境]学会各家之法回去找"..self:剧情npc("地藏王",1124).."#W。"}
		elseif 进度 == 52 then
			return {"飞升剧情","[步入化境]无名鬼城找不死壤"}
		elseif 进度 == 53 then
			return {"飞升剧情","[步入化境]法宝备齐，你可以去找"..self:剧情npc("玉皇大帝",1112).."#W了。给予人物道具(需战斗)"}
		elseif 进度 == 54 then
			return {"飞升剧情","[步入化境]请回去找"..self:剧情npc("吴刚",1114).."#W入于化境。"}
		end
	elseif 主线 == 9 then
		if 进度 == 1 then
			return {"渡劫剧情","[渡劫重生]请回去找"..self:剧情npc("王母娘娘",1112).."#W入于化境。"}
		elseif 进度 == 2 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫1。"}
		elseif 进度 == 3 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫2。"}
		elseif 进度 == 4 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫3。"}
		elseif 进度 == 5 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫4。"}
		elseif 进度 == 6 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫5。"}
		elseif 进度 == 7 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫6。"}
		elseif 进度 == 8 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫7。"}
		elseif 进度 == 9 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫8。"}
		elseif 进度 == 10 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫9。"}
		elseif 进度 == 11 then
			return {"渡劫剧情","[渡劫重生]去找"..self:剧情npc("玉皇大帝",1112).."#W完成渡劫。"}
		end
	elseif 主线 == 10 then
		if 进度 == 1 then
			return {"化圣剧情","[轮回劫境]暂未开放"}
		elseif 进度 == 2 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫1。"}
		elseif 进度 == 3 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫2。"}
		elseif 进度 == 4 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫3。"}
		elseif 进度 == 5 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫4。"}
		elseif 进度 == 6 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫5。"}
		elseif 进度 == 7 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫6。"}
		elseif 进度 == 8 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫7。"}
		elseif 进度 == 9 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫8。"}
		elseif 进度 == 10 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W开始生死劫9。"}
		elseif 进度 == 11 then
			return {"渡劫剧情","[轮回劫境]去找"..self:剧情npc("玉皇大帝",1112).."#W完成渡劫。"}
		end
	elseif 主线 == 32 then
		if 进度 == 1 then
			return {"三界劫难","[天命之战]化圣后找".."#Y/qqq|玉皇大帝*凌霄宝殿*npc查询/玉皇大帝".."#W询问封印魔神蚩尤的方法"}
		end
	end
end

function 场景类_场景:剧情物品(物品,详情)
	return "#R/qqq|获取途径*"..详情.."*bz提示/"..物品
end

function 场景类_场景:剧情npc(npc,id)
	return "#R/qqq|"..npc.."*"..取地图名称(id).."*npc查询/"..npc
end

function 场景类_场景:取活动描述(类型,进度)
	if 类型 == 1 then
		if 进度 == 1 then
			return {"国庆活动","[军阵展威]找#R长安城#W的#R西门御林军#W战胜他"}
		elseif 进度 == 2 then
			return {"国庆活动","[军阵展威]找#R长安城#W的#R东门御林军#W战胜他"}
		end
	elseif 类型 == 2 then
		if 进度 == 1 then
			return {"中秋活动","[追寻月光]找#R西凉女国#W的#R流光玉兔#W战胜他"}
		elseif 进度 == 2 then
			return {"中秋活动","[追寻月光]找#R西凉女国#W的#R流光泡泡#W战胜他"}
		elseif 进度 == 3 then
			return {"中秋活动","[追寻月光]找#R西凉女国#W的#R流光玉镜#W战胜他"}
		elseif 进度 == 4 then
			return {"中秋活动","[追寻月光]找#R朱紫国#W的#R流光巡游#W战胜他"}
		elseif 进度 == 5 then
			return {"中秋活动","[追寻月光]找#R朱紫国#W的#R流光灵魅#W战胜他"}
		elseif 进度 == 6 then
			return {"中秋活动","[追寻月光]找#R朱紫国#W的#R流光仙卫#W战胜他"}
		elseif 进度 == 7 then
			return {"中秋活动","[追寻月光]找#R朱紫国#W的#R流光仙师#W战胜他"}
		elseif 进度 == 8 then
			return {"中秋活动","[追寻月光]找#R长寿郊外#W的#R流光逆光#W战胜他"}
		elseif 进度 == 9 then
			return {"中秋活动","[追寻月光]找#R长寿郊外#W的#R流光月灵#W战胜他"}
		elseif 进度 == 10 then
			return {"中秋活动","[追寻月光]找#R长寿郊外#W的#R流光灵珠#W战胜他"}
		elseif 进度 == 11 then
			return {"中秋活动","[追寻月光]找#R天宫#W的#R流光月影#W战胜他"}
		elseif 进度 == 12 then
			return {"中秋活动","[追寻月光]找#R天宫#W的#R流光右卫#W战胜他"}
		elseif 进度 == 13 then
			return {"中秋活动","[追寻月光]找#R天宫#W的#R流光仙匪#W战胜他"}
		elseif 进度 == 14 then
			return {"中秋活动","[追寻月光]找#R天宫#W的#R流光仙王#W战胜他"}
		elseif 进度 == 15 then
			return {"中秋活动","[追寻月光]找#R月宫#W的#R幽萤娃娃#W战胜他"}
		elseif 进度 == 16 then
			return {"中秋活动","[追寻月光]找#R月宫#W的#R踏云兽#W战胜他"}
		elseif 进度 == 17 then
			return {"中秋活动","[追寻月光]找#R月宫#W的#R鼠先锋#W战胜他"}
		end
	end
	return
end

return 场景类_场景


-- function 场景类_场景:可坐骑(人物,坐骑)
-- 	if 坐骑 == "宝贝葫芦" then
-- 		return true
-- 	elseif 坐骑 == "神气小龟" then
-- 		if 人物.模型 ~= "偃无师" and 人物.模型 ~= "鬼潇潇" and 人物.模型 ~= "桃夭夭" then
-- 			return true
-- 		end
-- 	elseif (坐骑 == "汗血宝马" or 坐骑 == "汉血宝马" or 坐骑 == "欢喜羊羊") and 人物.种族 == "人" and 人物.模型 ~= "偃无师" then
-- 		return true
-- 	elseif (坐骑 == "魔力斗兽" or 坐骑 == "披甲战狼") and 人物.种族 == "魔" and 人物.模型 ~= "鬼潇潇" then
-- 		return true
-- 	elseif (坐骑 == "闲云野鹤" or 坐骑 == "云魅仙鹿") and 人物.种族 == "仙" and 人物.模型 ~= "桃夭夭" then
-- 		return true
-- 	end
-- 	return false
-- end
-- function 场景类_场景:取门派技能(门派)
-- 	local n = {}
-- 	if 门派 == "大唐官府" then
-- 		return {"为官之道","无双一击","神兵鉴赏","疾风步","十方无敌","紫薇之术","文韬武略"}
-- 	elseif 门派 == "方寸山" then
-- 		return {"黄庭经","磐龙灭法","霹雳咒","符之术","归元心法","神道无念","斜月步"}
-- 	elseif 门派 == "化生寺" then
-- 		return {"小乘佛法","金刚伏魔","诵经","佛光普照","大慈大悲","歧黄之术","渡世步"}
-- 	elseif 门派 == "女儿村" then
-- 		return {"毒经","倾国倾城","沉鱼落雁","闭月羞花","香飘兰麝","玉质冰肌","清歌妙舞"}
-- 	elseif 门派 == "阴曹地府" then
-- 		return {"灵通术","六道轮回","幽冥术","拘魂诀","九幽阴魂","尸腐恶","无常步"}
-- 	elseif 门派 == "魔王寨" then
-- 		return {"牛逼神功","震天诀","火云术","火牛阵","牛虱阵","回身击","裂石步"}
-- 	elseif 门派 == "狮驼岭" then
-- 		return {"魔兽神功","生死搏","训兽诀","阴阳二气诀","狂兽诀","大鹏展翅","魔兽反噬"}
-- 	elseif 门派 == "盘丝洞" then
-- 		return {"蛛丝阵法","迷情大法","秋波暗送","天外魔音","盘丝大法","盘丝步","姊妹相随"}
-- 	elseif 门派 == "天宫" then
-- 		return {"天罡气","傲世诀","清明自在","宁气诀","乾坤塔","混天术","云霄步"}
-- 	elseif 门派 == "五庄观" then
-- 		return {"周易学","潇湘仙雨","乾坤袖","修仙术","混元道果","明性修身","七星遁"}
-- 	elseif 门派 == "龙宫" then
-- 		return {"九龙诀","破浪诀","呼风唤雨","龙腾术","逆鳞术","游龙术","龙附术"}
-- 	elseif 门派 == "普陀山" then
-- 		return {"灵性","护法金刚","观音咒","五行学说","金刚经","五行扭转","莲花宝座"}
-- 	elseif 门派 == "神木林" then
-- 		return {"瞬息万变","万灵诸念","巫咒","万物轮转","天人庇护","神木恩泽","驭灵咒"}
-- 	elseif 门派 == "凌波城" then
-- 		return {"天地无极","九转玄功","武神显圣","啸傲","气吞山河","诛魔","法天象地"}
-- 	elseif 门派 == "无底洞" then
-- 		return  {"枯骨心法","阴风绝章","鬼蛊灵蕴","燃灯灵宝","地冥妙法","混元神功","秘影迷踪"}
-- 	end
-- end

-- function 场景类_场景:取门派主技能(门派)
-- 	if 门派 == 1 then
-- 		a = {"催眠符","落雷符","追魂符","五雷咒","定身符","定身符"}
-- 	elseif 门派 == 2 then
-- 		a = {"红袖添香","楚楚可怜","满天花雨","雨落寒沙","莲步轻舞","如花解语"}
-- 	elseif 门派 == 3 then
-- 		a = {"落叶萧萧","冰川怒","血雨","雾杀","星月之惠","蜜润"}
-- 	elseif 门派 == 4 then
-- 		a = {"唧唧歪歪","韦陀护法","金刚护体","达摩护体","一苇渡江","金刚护法","我佛慈悲","推拿","解毒","活血","推气过宫","妙手回春","救死扶伤"}
-- 	elseif 门派 == 5 then
-- 		a = {"杀气决","后发制人","横扫千军","破釜沉舟"}
-- 	elseif 门派 == 6 then
-- 		a = {"还阳术","阎罗令","判官令"}
-- 	elseif 门派 == 7 then
-- 		a = {"勾魂","摄魄","含情脉脉"}
-- 	elseif 门派 == 8 then
-- 		a = {"移魂化骨","夺魄令","煞气决","惊魂掌","摧心术","夺命咒","地涌金莲"}
-- 	elseif 门派 == 9 then
-- 		a = {"三昧真火","飞砂走石","牛劲"}
-- 	elseif 门派 == 10 then
-- 		a = {"连环击","鹰击","狮搏","象形","变身"}
-- 	elseif 门派 == 11 then
-- 		a = {"五雷轰顶","天雷斩","百万神兵","天神护体","天神护法","雷霆万钧"}
-- 	elseif 门派 == 12 then
-- 		a = {"普渡众生","紧箍咒","杨柳甘露","日光华","靛沧海","巨岩破","苍茫树","地裂火","颠倒五行","灵动九天"}
-- 	elseif 门派 == 13 then
-- 		a = {"不动如山","碎星诀","裂石","浪涌","断岳势","天崩地裂","翻江搅海","惊涛怒"}
-- 	elseif 门派 == 14 then
-- 		a = {"烟雨剑法","飘渺式","日月乾坤","炼气化神","生命之泉","三花聚顶"}
-- 	elseif 门派 == 15 then
-- 		a = {"龙卷雨击","龙腾","龙吟","逆鳞","乘风破浪","双龙戏珠"}
-- 	end
-- 	return a
-- end

-- function 场景类_场景:取辅助技能()
-- 	return {"强身术","冥想","暗器技巧","打造技巧","裁缝技巧","炼金术","中药医理","烹饪技巧","逃离技巧","追捕技巧","养生之道","健身术","巧匠之术"}
-- end

-- function 场景类_场景:取师傅门派(ID,名称)
-- 	local 师门 = nil
-- 	if 名称 == "程咬金" then
-- 		师门 = "大唐官府"
-- 	elseif 名称 == "地藏王" then
-- 		师门 = "阴曹地府"
-- 	elseif 名称 == "二郎神" then
-- 		师门 = "凌波城"
-- 	elseif 名称 == "大大王" then
-- 		师门 = "狮驼岭"
-- 	elseif 名称 == "空度禅师" then
-- 		师门 = "化生寺"
-- 	elseif 名称 == "巫奎虎" then
-- 		师门 = "神木林"
-- 	elseif 名称 == "地涌夫人" then
-- 		师门 = "无底洞"
-- 	elseif 名称 == "菩提祖师" then
-- 		师门 = "方寸山"
-- 	elseif 名称 == "孙婆婆" then
-- 		师门 = "女儿村"
-- 	elseif 名称 == "白晶晶" then
-- 		师门 = "盘丝洞"
-- 	elseif 名称 == "李靖" then
-- 		师门 = "天宫"
-- 	elseif 名称 == "观音姐姐" then
-- 		师门 = "普陀山"
-- 	elseif 名称 == "镇元子" then
-- 		师门 = "五庄观"
-- 	elseif 名称 == "东海龙王" then
-- 		师门 = "龙宫"
-- 	elseif 名称 == "牛魔王" then
-- 		师门 = "魔王寨"
-- 	end
-- 	return 师门
-- end

-- function 场景类_场景:取师门地图(师门)
-- 	local 地图
-- 	if 师门 == "化生寺" then
-- 		地图 = 1002
-- 	elseif 师门 == "方寸山" then
-- 		地图 = 1135
-- 	elseif 师门 == "女儿村" then
-- 		地图 = 1142
-- 	elseif 师门 == "神木林" then
-- 		地图 = 1138
-- 	elseif 师门 == "大唐官府" then
-- 		地图 = 1198
-- 	elseif 师门 == "阴曹地府" then
-- 		地图 = 1122
-- 	elseif 师门 == "盘丝洞" then
-- 		地图 = 1513
-- 	elseif 师门 == "无底洞" then
-- 		地图 = 1139
-- 	elseif 师门 == "魔王寨" then
-- 		地图 = 1512
-- 	elseif 师门 == "狮驼岭" then
-- 		地图 = 1131
-- 	elseif 师门 == "天宫" then
-- 		地图 = 1111
-- 	elseif 师门 == "普陀山" then
-- 		地图 = 1140
-- 	elseif 师门 == "凌波城" then
-- 		地图 = 1150
-- 	elseif 师门 == "五庄观" then
-- 		地图 = 1146
-- 	elseif 师门 == "龙宫" then
-- 		地图 = 1116
-- 	end
-- 	return 地图
-- end

-- function 场景类_场景:取坐标师傅(ID,名称)
-- 	local 师门 = nil
-- 	if ID == 1043 and 名称 == "空度禅师" then
-- 		师门 = "化生寺"
-- 	elseif ID == 1054 and 名称 == "程咬金" then
-- 		师门 = "大唐官府"
-- 	elseif ID == 1117 and 名称 == "东海龙王" then
-- 		师门 = "龙宫"
-- 	elseif ID == 1137 and 名称 == "菩提祖师" then
-- 		师门 = "方寸山"
-- 	elseif ID == 1124 and 名称 == "地藏王" then
-- 		师门 = "阴曹地府"
-- 	elseif ID == 1112 and 名称 == "李靖" then
-- 		师门 = "天宫"
-- 	elseif ID == 1145 and 名称 == "牛魔王" then
-- 		师门 = "魔王寨"
-- 	elseif ID == 1141 and 名称 == "观音姐姐" then
-- 		师门 = "普陀山"
-- 	elseif ID == 1147 and 名称 == "镇元子" then
-- 		师门 = "五庄观"
-- 	elseif ID == 1134 and 名称 == "大大王" then
-- 		师门 = "狮驼岭"
-- 	elseif ID == 1144 and 名称 == "白晶晶" then
-- 		师门 = "盘丝洞"
-- 	elseif ID == 1150 and 名称 == "二郎神" then
-- 		师门 = "凌波城"
-- 	elseif ID == 1154 and 名称 == "巫奎虎" then
-- 		师门 = "神木林"
-- 	elseif ID == 1156 and 名称 == "地涌夫人" then
-- 		师门 = "无底洞"
-- 	elseif ID == 1143 and 名称 == "孙婆婆" then
-- 		师门 = "女儿村"
-- 	end
-- 	return 师门
-- end

-- function 场景类_场景:平均等级()
-- 	local dj = 0
-- 	for i=1,#self.队伍 do
-- 		dj = dj + self.队伍[i].等级
-- 	end
-- 	return floor(dj/#self.队伍)
-- end

-- function 场景类_场景:指定等级物品(lv,id)
-- 	local wps = self.打造物品[id]
-- 	local random = 引擎.取随机整数
-- 	local ids = floor(lv/10+1)
-- 	if id <= 18 and lv >= 90 and lv <= 140 then
-- 		if ids <= 12 then
-- 			ids = random(10,12)
-- 		else
-- 				ids = random(13,15)
-- 		end
-- 	end
-- 	wps = wps[ids]
-- 	if type(wps) == "table" then
-- 		wps = wps[random(1,2)]
-- 	end
-- 	return wps
-- end


-- function 场景类_场景:登陆恢复()
-- 	self.标题 = require("script/初系统/标题").创建(self)
-- 	self.注册 = require("script/初系统/注册").创建(self)
-- 	self.分区 = require("script/初系统/分区").创建(self)
-- 	self.登陆 = require("script/初系统/登陆").创建(self)
-- 	self.充值 = require("script/初系统/充值").创建(self)
-- 	self.创建 = require("script/初系统/创建").创建(self)
-- 	self.读取 = require("script/初系统/选择角色").创建(self)
-- 	self.退出 = require("script/初系统/退出").创建(self)
-- end



-- function 场景类_场景:初始化设置()
-- 	-- 初始化队伍
-- 	self.系统设置 = {
-- 		声音设置 = {140,140}
-- 	}
-- 	-- 初始化时间
-- 	self.当前地图 = 0
-- 	-- 初始化队伍
-- 	self.队伍 = {}
-- 	self.称谓 = {"梦幻测试"}
-- 	self.当前称谓 = "无称谓"
-- 	-- 初始化阵型
-- 	self.阵型 = 1
-- 	self.阵型表 = {[1]={"无阵型",true,0},[2]={"天覆阵",false,0},[3]={"地载阵",false,0},[4]={"风扬阵",false,0},[5]={"云垂阵",false,0},[6]={"龙飞阵",false,0},[7]={"虎翼阵",false,0},[8]={"鸟翔阵",false,0},[9]={"蛇蟠阵",false,0},[10]={"鹰啸阵",false,0},[11]={"雷绝阵",false,0}}
-- 	self.地图 = nil
-- 	-- 初始化宠物
-- 	self.宠物 = {模型="生肖猪",名称="生肖猪",等级=1,最大等级=40,耐力=5,最大耐力=5,经验=1,最大经验=10}
-- 	-- 初始化游戏组件
-- 	self.道具列表 = {}
-- 	self.任务列表 = {}
-- 	self.人物仓库 = {}
-- 	self.召唤兽仓库 = {}
-- 	self.道具仓库 = {}
-- 	self.辅助技能 = {}
-- 	self.金钱 = 10000
-- 	self.储备 = 0
-- 	self.积分 = 0
-- 	self.存银 = 0
-- 	-- 初始化剧情开关
-- 	self.剧情开关 = {宝图=false,抓鬼=false,师门=false,押镖=false,四季=false,十五门=false,保卫长安=false,进入副本=false,副本=false,禁止飞行=false,禁止Npc=false}
-- 	self.临时野怪 = nil
-- 	self.角色坐标 = xys()
-- end

-- function 场景类_场景:取初始属性(种族)
-- 	local 属性 = {
-- 		人 = {10,10,10,10,10},
-- 		魔 = {12,11,11,8,8},
-- 		仙 = {12,5,11,12,10},
-- 	}
-- 	return 属性[种族]
-- end


-- function 场景类_场景:取属性(种族,五维,技能)
-- 	local 属性 = {}
-- 	local 力量 = 五维[3]
-- 	local 体质 = 五维[1]
-- 	local 魔力 = 五维[2]
-- 	local 耐力 = 五维[4]
-- 	local 敏捷 = 五维[5]
-- 	if 种族 == "人" or 种族 == 1 then
-- 		属性 = {
-- 			命中 = ceil(力量 * 2.01 + 30),
-- 			伤害 = ceil(力量 * 0.67 + 34),
-- 			防御 = ceil(耐力 * 1.5),
-- 			速度 = ceil((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
-- 			灵力 = ceil((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
-- 			躲避 = ceil(敏捷 + 10),
-- 			气血 = ceil((体质 * 5 + 100)),
-- 			法力 = ceil((魔力 * 3 + 80)),
-- 		}
-- 	elseif 种族 == "魔" or 种族 == 2 then
-- 		属性 = {
-- 			命中 = ceil(力量 * 2.31 + 29),
-- 			伤害 = ceil(力量 * 0.77 + 34),
-- 			防御 = ceil(耐力 * 1.4),
-- 			速度 = ceil((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
-- 			灵力 = ceil((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
-- 			躲避 = ceil(敏捷 + 10),
-- 			气血 = ceil((体质 * 6 + 100)),
-- 			法力 = ceil((魔力 * 2.5 + 80)),
-- 		}
-- 	elseif 种族 == "仙" or 种族 == 3 then
-- 		属性 = {
-- 			命中 = ceil(力量 * 1.71 + 30),
-- 			伤害 = ceil(力量 * 0.57 + 40),
-- 			防御 = ceil(耐力 * 1.6),
-- 			速度 = ceil((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
-- 			灵力 = ceil((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
-- 			躲避 = ceil(敏捷 + 10),
-- 			气血 = ceil((体质 * 4.5 + 100)),
-- 			法力 = ceil((魔力 * 3.5 + 80)),
-- 		}
-- 	end
-- 	return 属性
-- end