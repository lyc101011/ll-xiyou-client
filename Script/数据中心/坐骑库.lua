-- @Author: 小神QQ190909219
-- @Date:   2023-08-17 23:38:49
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-05 16:00:09
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-03-20 16:44:23
--======================================================================--
-- function 引擎.补差(zq,角色)--,方向,帧数
-- 	local zqmx
-- 	if type(zq) ~= "table" then
-- 		zqmx = zq
-- 	else
-- 		zqmx = zq.模型
-- 	end
-- 	local zqs={}
-- 	zqs.x,zqs.y=0,0
-- 	if zq == nil then
-- 		return zqs.x,zqs.y
-- 	end
	-- 3092329135 北斗 shape.wdb  694933611    492047308  shape.wd7
	-- if zqmx=="神气小龟" and (角色=="鬼潇潇" or 角色=="桃夭夭" or 角色=="偃无师" or 角色=="骨精灵"or 角色=="龙太子") then
	-- 	zqs.x,zqs.y=-10,45
	-- elseif zqmx=="汗血宝马" and ( 角色=="偃无师") then
	--  	zqs.x,zqs.y=0,40
	-- elseif zqmx=="欢喜羊羊" and (角色=="偃无师") then
	--  	zqs.x,zqs.y=0,40
	-- elseif zqmx=="魔力斗兽" and (角色=="鬼潇潇" or 角色=="骨精灵") then
	--  	zqs.x,zqs.y=0,40
	-- elseif zqmx=="披甲战狼" and (角色=="鬼潇潇" or 角色=="骨精灵") then
	--  	zqs.x,zqs.y=0,40
	-- elseif zqmx=="闲云野鹤" and ( 角色=="桃夭夭" or 角色=="龙太子") then
	--  	zqs.x,zqs.y=0,-10
	-- elseif zqmx=="云魅仙鹿" and (角色=="桃夭夭" or 角色=="龙太子") then
	--  	zqs.x,zqs.y=-10,40
	-- elseif zqmx=="青霄天麟" then
	--  	zqs.x,zqs.y=0,0
	-- elseif zqmx=="玄冰灵虎" then
	--  	zqs.x,zqs.y=0,-10
	-- elseif zqmx=="七彩小驴" or zqmx=="粉红小驴" then
	--  	zqs.x,zqs.y=0,-10
	-- elseif zqmx=="玄火神驹" then
	--  	zqs.x,zqs.y=0,-15
	-- elseif zqmx=="紫霞云麒" then
	--  	zqs.x,zqs.y=0,-10
 	-- if zqmx=="九尾冰狐" then
 		-- if 帧数<=3 then
 		--     zqs.y = 55
 		-- else
 		-- 	zqs.y = -帧数
 		-- end
 -- 		zqs.y = -帧数*2
	 	-- zqs.x,zqs.y=0,0
	 	-- if 方向==5 then --左
	 	--     zqs.x,zqs.y=-20,0
	 	-- elseif 方向==7 then --右
	 	-- 	zqs.x,zqs.y=20,0
 		-- elseif 方向==0 then --右下
	 	-- 	zqs.x,zqs.y=10,10
 		-- elseif 方向==1 then --左下
	 	-- 	zqs.x,zqs.y=-10,10
	 	-- end
	--  	if 角色=="骨精灵" or 角色=="鬼潇潇" or 角色=="桃夭夭" or 角色=="偃无师" then
	--  	    zqs.x,zqs.y=0,50
 -- 	    elseif 角色=="巨魔王" or 角色=="虎头怪" then
 -- 	    	if 方向==6 then --上
	-- 	 	    zqs.x,zqs.y=0,10
	-- 	 	elseif 方向==4 then --下
	-- 	 		zqs.x,zqs.y=0,10
	-- 	 	elseif 方向==5 then --左
	-- 	 		zqs.x,zqs.y=5,10
	-- 	 	elseif 方向==7 then --右
	-- 	 		zqs.x,zqs.y=-5,10
	--  		elseif 方向==0 then --右下
	-- 	 		zqs.x,zqs.y=-10,10
	--  		elseif 方向==1 then --左下
	-- 	 		zqs.x,zqs.y=10,10
	--  		elseif 方向==2 then --右上
	-- 	 		zqs.x,zqs.y=0,20
	-- 	 	elseif 方向==3 then --左下
	-- 	 		zqs.x,zqs.y=0,20
	-- 	 	end
	--  	end
	-- end
-- 	return zqs.x,zqs.y
-- end
function 引擎.坐骑库(id,zq,sp) --角色,坐骑，饰品
	if zq==nil then
	    return
	end
	if sp ~= nil then
		if sp ~= "空" then
			sp = sp.名称
		end
	else
		sp = "空"
	end
	local zqs = {
		宝贝葫芦 = {0x63C1AA04,0x939B6AA2,1,"shape.wd5"},神气小龟 = {0xE88353,0x702610D3,2,"shape.wd5"},
		汗血宝马 = {0x7B49FA9A,0x3F76F5B2,3,"shape.wd5"},欢喜羊羊 = {0x8D4DBAAE,0x2636063C,4,"shape.wd5"},
		魔力斗兽 = {0x4B0E16F1,0x28F7499E,3,"shape.wd5"},披甲战狼 = {0x3B0CC9,0xF6B76F79,4,"shape.wd5"},
		闲云野鹤 = {0x49CAB729,0x1544FBAD,3,"shape.wd5"},云魅仙鹿 = {0x621ECF47,0x98D7DB2,4,"shape.wd5"},
		紫霞云麒 = {2180734458,1711224353,2,"shape.wd7"},玄冰灵虎 = {587079486,2812695545,2,"shape.wd8"},
		七彩小驴 = {1026769966,3894750331,2,"shape.wd8"},玄火神驹 = {1426370750,3906810689,2,"shape.wd8"},
		-- 粉红小驴 = {3345308803,2907212221,3,"shape.wd8"},
		神行小驴 = {3345308803,2907212221,3,"shape.wd8"},
		玉脂福羊 = {946576361,1280347072,2,"shape.wdb"},
		吾皇 = {"吾皇_站","吾皇_跑",2,"qwq.wdf"},
		战火穷奇 = {"战火穷奇站","战火穷奇跑",3,"r3d.dll"},
		白金战火穷奇 = {"白金战火穷奇站","白金战火穷奇跑",3,"r3d.dll"},
	}

	local sps = {
		展翅高飞 = {0x2DC16EF4,0x47A59E6C,"shape.wd5"},旗开得胜 = {0x4FB7A645,0xC89B8D7B,"shape.wd5"},霸王雄风 = {0x8AC5514E,0xD30116BE,"shape.wd5"},
		独眼观天 = {0xCB41BF07,0x6D415352,"shape.wd5"},威武不屈 = {0xE385373B,0x71FE0155,"shape.wd5"},深藏不露 = {0x2529E5A5,0x51C03CD4,"shape.wd5"},
		异域浓情 = {0xE8B35E96,0x3949C769,"shape.wd5"},流星天马 = {0x72489CFD,0x4D136355,"shape.wd5"},威猛将军 = {0x5BDBA7CB,0x5CDC5A5E,"shape.wd5"},
		知情达理 = {0xCCBF24B8,0xFE4B37F2,"shape.wd5"},气宇轩昂 = {0xEC4C09DF,0x57B096DF,"shape.wd5"},如花似玉 = {0xA6966FD2,0xCA8864D1,"shape.wd5"},
		傲视天下 = {0xBB906984,0x2549904, "shape.wd5"},铁血豪情 = {0x742FBF19,0x103FFB93,"shape.wd5"},唯我独尊 = {0x7F6FFC35,0x716B5DC1,"shape.wd5"},
		叱咤风云 = {0xAB007164,0x2E177381,"shape.wd5"},异域风情 = {0xAB007164,0x2E177381,"shape.wd5"},假面勇者 = {0xE7CB8205,0xE615404,"shape.wd5"},
		披星戴月 = {0xE0CB07C8,0xD9D958E6,"shape.wd5"},霓裳魅影 = {0x8ED6D8CC,0xC5D8F53D,"shape.wd5"},烈焰燃情 = {0x8C575D26,0x7B15590A,"shape.wd5"},
		天雨流芳 = {0x503F394B,0x23BF657B,"shape.wd5"},灵光再现 = {0xC4D118C5,0xCBC6930A,"shape.wd5"},倾国倾城 = {0x1F01B8BE,0xBDA4DDAB,"shape.wd5"},
		天使猪猪 = {3396283312,3309427946,"shape.wd4"},
		九尾冰狐 = {629353638,1454678293,"shape.wdc"},
		空 = {}
	}

	local scs
	if id == "飞燕女" then
		scs = {{0x4492502E,0xF6D6D5E6,"common/shape.wdf"},{0xDCB946EC,0xDCC84D4E,"common/shape.wdf"},{0xDF01F29D,0xA77B55E4,"common/shape.wdf"},{0x6E0AD379,0x87C7A650,"common/shape.wdf"}}
	elseif id == "英女侠" then
		scs = {{0xD43912A9,0xD2D4CAD3,"shape.wd5"},{0x70291C50,0x30CABF19,"shape.wd5"},{0x726C392E,0x68FB1969,"shape.wd5"},{0x2474769B,0xACD868DE,"shape.wd5"}}
	elseif id == "巫蛮儿" then
		scs = {{0xF2BC9369,0xB11F6642,"shape.wda"},{0x9B73C75F,0xDA0A8B06,"shape.wda"},{0x2F5EAD3F,0x499F9D37,"shape.wda"},{0xCCC0985C,0xC8F56BA3,"shape.wda"}}
	elseif id == "偃无师" then
		scs = {{0x281c3fee,0xee3624a8,"common/shape.wdf"},{0x281c3fee,0xee3624a8,"common/shape.wdf"},{0x281c3fee,0xee3624a8,"common/shape.wdf"},{0x281c3fee,0xee3624a8,"common/shape.wdf"}}
	elseif id == "逍遥生" then
		scs = {{0xA35491C9,0x49D7C76E,"common/shape.wdf"},{0xB770EAD4,0x9A1479D8,"common/shape.wdf"},{0x76D629EA,0xFB50C58F,"common/shape.wdf"},{0x3D392EF4,0xA5E02A65,"common/shape.wdf"}}
	-- elseif id == "逍遥生" then
	-- 	scs = {{654311424,603979776,"qwq.wdf"},{687865856,637534208,"qwq.wdf"},{671088640,620756992,"qwq.wdf"},{0x3D392EF4,0xA5E02A65,"qwq.wdf"}}
	elseif id == "剑侠客" then
		scs = {{0x67101CB7,0x9C8790BA,"shape.wd5"},{0x32DA9583,0xEC9AC961,"shape.wd5"},{0x766731D,0x8C50358A,"shape.wd5"},{0xA95A126D,0x513DDE6C,"shape.wd5"}}
	elseif id == "狐美人" then
		scs = {{0xE3123BDA,0x956305B5,"common/shape.wdf"},{0xFB798485,0xD1997415,"common/shape.wdf"},{0x64C21A63,0xD5D2FA14,"common/shape.wdf"},{0xBCD86DDA,0xF0062006,"common/shape.wdf"}}
	elseif id == "骨精灵" then
		scs = {{0xBEEF3795,0x3C6BF98F,"common/shape.wdf"},{0xBEEF3795,0x3C6BF98F,"common/shape.wdf"},{0xBEEF3795,0x3C6BF98F,"common/shape.wdf"},{0xBEEF3795,0x3C6BF98F,"common/shape.wdf"}}
	elseif id == "鬼潇潇" then
		scs = {{0x94c5bfb,0xfe2d2b18,"common/shape.wdf"},{0x94c5bfb,0xfe2d2b18,"common/shape.wdf"},{0x94c5bfb,0xfe2d2b18,"common/shape.wdf"},{0x94c5bfb,0xfe2d2b18,"common/shape.wdf"}}
	elseif id == "杀破狼" then
		scs = {{0xE137A55D,0xDB553291,"shape.wda"},{0x8BEA762D,0x14EE7109,"shape.wda"},{0x46A79E5,0x3CD5444,"shape.wda"},{0xF974CEB,0x54A8F096,"shape.wda"}}
	elseif id == "巨魔王" then
		scs = {{0x21ED721D,0x5A05E1C0,"common/shape.wdf"},{0x9DFEB143,0x77C20678,"common/shape.wdf"},{0x1AF61311,0x6E370D46,"common/shape.wdf"},{0xCC1426ED,0x39FE09DB,"common/shape.wdf"}}
	elseif id == "虎头怪" then
		scs = {{0x99AD84CD,0x9FA6D533,"common/shape.wdf"},{0xF56603D1,0x83DBBA94,"common/shape.wdf"},{0x37FFB9DF,0x64426F93,"common/shape.wdf"},{0x95BC0425,0xC6053278,"common/shape.wdf"}}
	elseif id == "舞天姬" then
		scs = {{0x54DB4F4D,0xCB722714,"common/shape.wdf"},{0xD92FC3DE,0x809F42FE,"common/shape.wdf"},{0x212848A1,0xAAD7CB93,"common/shape.wdf"},{0xB44DF735,0xECA5DB49,"common/shape.wdf"}}
	elseif id == "玄彩娥" then
		scs = {{0x861EE4D9,0x9F2F9C11,"common/shape.wdf"},{0x3316877C,0x31F77503,"common/shape.wdf"},{0x779A3DF,0x622664DC,"common/shape.wdf"},{0xA6FD7850,0xB9FD9DBD,"common/shape.wdf"}}
	elseif id == "桃夭夭" then
		scs = {{0x5aa5e164,0x2c255cee,"common/shape.wdf"},{0x5aa5e164,0x2c255cee,"common/shape.wdf"},{0x5aa5e164,0x2c255cee,"common/shape.wdf"},{0x5aa5e164,0x2c255cee,"common/shape.wdf"}}
	elseif id == "羽灵神" then
		scs = {{0x7D31F43E,0x76E4E3D6,"shape.wda"},{0x7B86A5F4,0xE496A2D7,"shape.wda"},{0x8072202A,0x6528F013,"shape.wda"},{0x4BBD02E6,0x694A236B,"shape.wda"}}
	elseif id == "神天兵" then
		-- scs = {{0x77104303,0xBC38000F,"common/shape.wdf"},{0xF4EF98B5,0x7C731501,"common/shape.wdf"},{0x7F6D09AB,0x13AD1C23,"common/shape.wdf"},{0x60A47C21,0x63930A54,"common/shape.wdf"}}
		scs = {{0x77104303,0xBC38000F,"common/shape.wdf"},{0xF4EF98B5,0x7C731501,"common/shape.wdf"},{0x7F6D09AB,0x13AD1C23,"common/shape.wdf"},{0x60A47C21,0x63930A54,"common/shape.wdf"}}
	elseif id == "龙太子" then
		scs = {{0x4F27A59F,0x801F438D,"common/shape.wdf"},{0x4F27A59F,0x801F438D,"common/shape.wdf"},{0x4F27A59F,0x801F438D,"common/shape.wdf"},{0x4F27A59F,0x801F438D,"common/shape.wdf"}}
	end
	if zq==nil then
		tp.窗口.消息框:添加文本("坐骑zp1为空"..zq,"xt")
	elseif  zq~=nil and zqs[zq]==nil then
		tp.窗口.消息框:添加文本("坐骑zp2为空"..zq,"xt")
	elseif  zq~=nil and zqs[zq]~=nil and zqs[zq][3]==nil then
		tp.窗口.消息框:添加文本("坐骑zp3为空"..zq,"xt")
	end
	if zqs[zq]==nil then
		return
	end
	local bh = zqs[zq][3]
	return {坐骑资源=zqs[zq][4],坐骑站立=zqs[zq][1],坐骑行走=zqs[zq][2],人物资源=scs[bh][3],人物站立=scs[bh][1],人物行走=scs[bh][2],坐骑饰品站立=sps[sp][1],坐骑饰品行走=sps[sp][2],坐骑饰品资源=sps[sp][3]}
end