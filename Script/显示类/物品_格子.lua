-- @Author: baidwwy
-- @Date:   2024-12-14 19:52:27
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-16 09:51:54
-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-13 16:23:36
-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-10 20:32:14
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-06-18 20:17:09
--======================================================================--
local 系统类_物品格子 = class()
local zt,zts
local mouse = 引擎.鼠标弹起
local wps = 引擎.取物品
local 变身资源={
	大海龟=0x3C7B89E8,
	大蝙蝠=0x2481DFCC,
	海毛虫=0x3BD0B554,
	护卫=0x7003F174,
	巨蛙=0x98E3377F,
	强盗=0xD5C2566E,
	山贼=0x5F7346A8,
	树怪=0x4ED5C9C4,
	野猪=0xEF3A830D,
	蛤蟆精=0x8A53158C,
	黑熊=0xD4D2660A,
	狐狸精=0xDC14E699,
	花妖=0xD294444C,
	老虎=0x463F3E9B,
	羊头怪=0x8F19EF2A,
	骷髅怪=0xD0BE29D3,
	狼=0x92B59426,
	牛妖=0x3AF799AA,
	虾兵=0xE89179D1,
	小龙女=0xE05E7656,
	蟹将=0x65DBE48A,
	野鬼=0xB90EC617,
	龟丞相=0x67E0006E,
	黑熊精=0x35BDCFC8,
	僵尸=0xC7B126C6,
	马面=0xCA322977,
	牛头=0x06971D21,
	蜘蛛精=0xD2C2093D,
	白熊=0x7092E7F5,
	古代瑞兽=0x7728C3B2,
	黑山老妖=0x95FDC90D,
	蝴蝶仙子=0x976975FB,
	雷鸟人=0x4E646343,
	地狱战神=0xB5FE5920,
	风伯=0xDF2F3035,
	天兵=0x9AB7515F,
	天将=0x7E86C2A9,
	凤凰=0x2A4159F7,
	蛟龙=0xD4442C3A,
	大力金刚=0x64287AE7,
	鬼将=0x023AA63E,
	净瓶女娲=0x7E99A5F4,
	灵符女娲=0x5726FB84,
	灵鹤=0xACEF8DB7,
	律法女娲=0x4ED64302,
	如意仙子=0x411A18C7,
	噬天虎=0x8DC23CAE,
	雾中仙=0xA88F486E,
	吸血鬼=0x9D5FA3EC,
	星灵仙子=0xD226E204,
	巡游天神=0xFD35D4E3,
	炎魔神=0xB9917494,
	夜罗刹=0xAB1EFFB3,
	幽灵=0x62875401,
	芙蓉仙子=0xBAFBFAA8,
	猫灵兽形 =2664942248,
	猫灵人形 =1283629726,
	狂豹兽形 = 3523770813,
	狂豹人形 =1434045443,
	蝎子精 = 129453697,
	混沌兽 =2752955542,
	--"item.wd1"
	长眉灵猴 =3194937054,
	巨力神猿 =2583351075,
	修罗傀儡鬼 =1295304252,
	修罗傀儡妖 = 1581882750,
	金身罗汉 =2981531014,
	藤蔓妖花 =1539542949,
	曼珠沙华 =3926577754,
	蜃气妖 =2421106756,
	持国巡守 =1842568427,
	毗舍童子 =2055537949,
	真陀护法 =1518872974,
	--"common/item.wdf"
	灵灯侍者=430207498,
	琴仙=539634096,
	金铙僧=2688340638,
	泪妖=2720971822,
	镜妖=2770049521,
	般若天女=3223340062,
	增长巡守=3436403729,
	变幻莫测=3585454986,
	进阶黑山老妖=0x95FDC90D,
	进阶蝴蝶仙子=0x976975FB,
	进阶雷鸟人=0x4E646343,
	进阶地狱战神=0xB5FE5920,
	进阶风伯=0xDF2F3035,
	进阶天兵=0x9AB7515F,
	进阶天将=0x7E86C2A9,
	进阶凤凰=0x2A4159F7,
	进阶蛟龙=0xD4442C3A,
	进阶大力金刚=0x64287AE7,
	进阶鬼将=0x023AA63E,
	进阶净瓶女娲=0x7E99A5F4,
	进阶灵符女娲=0x5726FB84,
	进阶灵鹤=0xACEF8DB7,
	进阶律法女娲=0x4ED64302,
	进阶如意仙子=0x411A18C7,
	进阶噬天虎=0x8DC23CAE,
	进阶雾中仙=0xA88F486E,
	进阶吸血鬼=0x9D5FA3EC,
	进阶星灵仙子=0xD226E204,
	进阶巡游天神=0xFD35D4E3,
	进阶炎魔神=0xB9917494,
	进阶夜罗刹=0xAB1EFFB3,
	进阶幽灵=0x62875401,
	进阶芙蓉仙子=0xBAFBFAA8,
	进阶猫灵兽形 =2664942248,
	进阶猫灵人形 =1283629726,
	进阶狂豹兽形 = 3523770813,
	进阶狂豹人形 =1434045443,
	进阶蝎子精 = 129453697,
	进阶混沌兽 =2752955542,
	--"item.wd1"
	进阶长眉灵猴 =3194937054,
	进阶巨力神猿 =2583351075,
	进阶修罗傀儡鬼 =1295304252,
	进阶修罗傀儡妖 = 1581882750,
	进阶金身罗汉 =2981531014,
	进阶藤蔓妖花 =1539542949,
	进阶曼珠沙华 =3926577754,
	进阶蜃气妖 =2421106756,
	进阶持国巡守 =1842568427,
	进阶毗舍童子 =2055537949,
	进阶真陀护法 =1518872974,
	--"common/item.wdf"
	进阶灵灯侍者=0x275209d3,
	进阶琴仙=0x202a29b0,
	进阶金铙僧=0xa8259d75,
	进阶泪妖=0xa22ebc2e,
	进阶镜妖=0xa545e77,
	进阶般若天女=0xf82a359d,
	进阶增长巡守=0xccd35c11,
	进阶变幻莫测=3585454986,
	}
local 变身资源小={
	灵灯侍者=0x725c0d0c,
	琴仙=0xe8a3bd55,
	金铙僧=0xb2a61b8f,
	泪妖=0x58549952,
	镜妖=0xb6b07738,
	般若天女=0xf966e116,
	增长巡守=0x92f193e0,
	变幻莫测=0x1a501898,
	进阶灵灯侍者=0x5c91f843,
	进阶琴仙=0xc9953a46,
	进阶金铙僧=0x7a0aafeb,
	进阶泪妖=0x62d9a3b8,
	进阶镜妖=0x2767c40b,
	进阶般若天女=0x59e4179d,
	进阶增长巡守=0x81640035,
	进阶变幻莫测=0x1a501898,
	}
function 系统类_物品格子:初始化(x,y,ID,注释,遮挡)
	self.ID = ID
	self.注释 = 注释
	self.物品 = nil
	self.事件 = false
	self.焦点 = false
	self.右键 = false
	self.遮挡 = 遮挡
	self.确定 = false
end

function 系统类_物品格子:置根(根)
	zt = tp.字体表.描边字体
end

function 系统类_物品格子:置物品(物品,灰色)
	self.选中=nil
	self.专用图标=tp.资源:载入('pic/专用.png', "图片")
	if 物品 ~= nil then
		if 物品.名称 ~= 0 then
			--self.物品 = 物品
			local item = tp._物品.创建()
			item:置对象(物品.名称)
			self.物品= item
			for n, v in pairs(物品) do
      			self.物品[n]=v
		  	end
			if 物品.名称=="怪物卡片" then
				self.物品.小模型id="item.wdf"
				self.物品.资源="item.wdf"
				if 物品.等级==1 then
					self.物品.小模型资源=0x4A028BEE
				elseif 物品.等级==2 then
					self.物品.小模型资源=0xBB35E1EE
				elseif 物品.等级==3 then
					self.物品.小模型资源=0xE7FC64D2
				elseif 物品.等级==4 then
					self.物品.小模型资源=0xA00740F6
				elseif 物品.等级==5 then
					self.物品.小模型资源=0x21838782
				elseif 物品.等级==6 then
					self.物品.小模型资源=0xF1C84EB5
				elseif 物品.等级==7 then
					self.物品.小模型资源=0xEFA4BA2C
				elseif 物品.等级==8 then
					self.物品.小模型资源=0x2E030271
				elseif 物品.等级==9 then
					self.物品.小模型资源=1991581967
				end
				if 物品.造型 == "长眉灵猴" or 物品.造型 == "巨力神猿"or 物品.造型 == "修罗傀儡鬼"or 物品.造型 == "修罗傀儡妖"or 物品.造型 == "金身罗汉"or 物品.造型 == "藤蔓妖花"or 物品.造型 == "曼珠沙华"or 物品.造型 == "蜃气妖"or 物品.造型 == "持国巡守"or 物品.造型 == "毗舍童子"or 物品.造型 == "真陀护法" then
					self.物品.资源="item.wd1"
				elseif 物品.造型 == "灵灯侍者" or 物品.造型 == "琴仙"or 物品.造型 == "金铙僧"or 物品.造型 == "泪妖"or 物品.造型 == "镜妖" or 物品.造型 == "般若天女"or 物品.造型 == "增长巡守" then
					self.物品.资源="common/item.wdf"
				elseif 物品.造型 == "进阶长眉灵猴" or 物品.造型 == "进阶巨力神猿"or 物品.造型 == "进阶修罗傀儡鬼"or 物品.造型 == "进阶修罗傀儡妖"or 物品.造型 == "进阶金身罗汉"or 物品.造型 == "进阶藤蔓妖花"or 物品.造型 == "进阶曼珠沙华"or 物品.造型 == "进阶蜃气妖"or 物品.造型 == "进阶持国巡守"or 物品.造型 == "进阶毗舍童子"or 物品.造型 == "进阶真陀护法" then
					self.物品.资源="item.wd1"
				elseif 物品.造型 == "进阶灵灯侍者" or 物品.造型 == "进阶琴仙"or 物品.造型 == "进阶金铙僧"or 物品.造型 == "进阶泪妖"or 物品.造型 == "进阶镜妖" or 物品.造型 == "进阶般若天女"or 物品.造型 == "进阶增长巡守" then
					self.物品.资源="common/item.wdf"
				end
				self.物品.大模型资源=变身资源[物品.造型]
			-- elseif 物品.名称=="祈愿宝箱" then
			-- 	self.物品.pyz2 = {-100,0}
			end
			local 返回值 = 引擎.取同名物品(物品.名称,物品.子类,物品.类型,物品.等级)
			if not 判断是否为空表(返回值) then
				self.物品.资源 = 返回值[5] or 返回值[1]
				self.物品.小模型资源 = 返回值[2]
				if 返回值[5] then
					self.物品.url = 返回值[1]
					self.物品.小模型资源 = 返回值[4]
				end
				self.物品.大模型资源 = 返回值[3]
				if 返回值[6] then
					self.物品.pyz = 返回值[6] --动态
				end
			end

			if self.物品.小模型 == nil then
      			self.物品.小模型 = tp.资源:载入(self.物品.小模型id or self.物品.资源,"网易WDF动画",self.物品.小模型资源)
      			if 灰色 then
					self.物品.灰色小模型 = tp.资源:载入(self.物品.小模型id or self.物品.资源,"网易WDF动画",self.物品.小模型资源)
					self.物品.灰色小模型:灰度级()
				end
			end
		end
	else
		self.物品 = nil
	end
	if self.物品~=nil then
		if self.物品.回合~=nil then
			self:置灰色()
		end
	end
end

function 系统类_物品格子:置灰色()
	if self.物品~=nil and self.物品.小模型~=nil then --and not self.物品.小模型.灰度
		self.物品.小模型:灰度级()
	end
end

function 系统类_物品格子:物品禁止(总类)


	if self.物品 ~= nil and ((总类 and 总类 ~= false) and self.物品.总类 ~= 总类[1] and self.物品.总类 ~= 总类[2] and (总类[3]==nil or 总类[3]==false))  then
		if self.物品.名称=="神兜兜" then
			return false
		else
			return true
		end
	else
		return  false
	end
end


function 系统类_物品格子:助战物品禁止(总类)
	if self.物品 ~= nil and self.物品.总类 then
		if ( self.物品.总类==2 or self.物品.总类==1 or self.物品.总类=="装备礼包" or self.物品.总类=="坐骑礼包" or self.物品.名称=="怪物卡片") then
			return false
		end
		return true
	end
end

function 系统类_物品格子:显示(dt,x,y,条件,总类,xx,yy,abs,物品详情,不显示数字,灰色) --dt1,x2,y3,条件4,总类5,xx6,yy7,abs8,物品详情9,不显示数字10,灰色11
	if self.确定 or self.选中 then
		-- tp.物品格子确定_:显示(self.x+1,self.y+2)
		tp.物品格子确定_:显示(self.x+2,self.y+4)
	end
	self.事件 = false
	self.焦点 = false
	self.右键 = false
	if self.物品 ~= nil then
		if self.遮挡 ~= nil then
			self.遮挡:显示(self.x-1+(xx or 0),self.y+4+(yy or 0))
		end
		local pyx,pyy = 0,0
		if self.物品.pyz~=nil then
			-- if 灰色 then
			-- 	self.物品.灰色小模型:更新(dt)
			-- else
				self.物品.小模型:更新(dt)
			-- end
			pyx,pyy = self.物品.pyz[1],self.物品.pyz[2]
		end
		if 灰色 then
			self.物品.灰色小模型:显示(self.x-1+pyx,self.y+2+pyy)
		else
			self.物品.小模型:显示(self.x-1+pyx,self.y+2+pyy)
		end
		-- self.物品.小模型:显示(self.x-1+pyx,self.y+2+pyy)
		if self.物品.回合~=nil then
			local 数量=string.len(tostring(self.物品.回合))
			for i=1,数量 do
				local 序列=string.sub(self.物品.回合,i,i)+1
				if 战斗类.法宝图片[序列]~=nil then
					战斗类.法宝图片[序列]:显示(self.x-数量*2-数量*1.5+20,self.y+20)
				end
			end
		end
		if self.物品.可叠加 then--and 总类 == nil then --这个总类是？
			if 不显示数字~=true then
				zt:置颜色(4294967295)
				zt:置描边颜色(-16777216)
				zt:显示(self.x + 3,self.y + 3,self.物品.数量)
			end
		end

		if self:物品禁止(总类) then
			tp.物品格子禁止_:显示(self.x + 5,self.y + 6)

			-- self:置灰色()
		-- else
		-- 	if self.物品~=nil and self.物品.小模型~=nil and self.物品.小模型.灰度 then
		-- 		self.物品.小模型:重置纹理()
		-- 	end
		end


		-- if 物品详情 then
		-- 	tp.xqdt1:显示(self.x-5,self.y+31)
		-- 	xqwz1:显示(self.x + ((44 - xqwz1:取宽度(物品详情))/2),self.y + 31,物品详情)
		-- end

--------==============================================================================================================

		local 自适应 = tp._自适应
		if string.find(self.物品.名称,"碎片") then
			tp.xqdt1:显示(self.x-5,self.y+33)
			xqwz1:显示(self.x + ((44 - xqwz1:取宽度("碎片"))/2),self.y + 33,"碎片")

		elseif  string.find(self.物品.名称,"魔兽要诀") and self.物品.附带技能 ~= nil or self.物品.名称=="点化石" then
					tp.xqdt1:显示(self.x-5,self.y+33)
				local 长度=string.len(tostring(self.物品.附带技能))
				if 长度<=2 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.附带技能)
				elseif 长度>2 and 长度 <= 4 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.附带技能)
				elseif 长度 >4 and 长度 <=6 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.附带技能)
				elseif 长度 >6 and 长度 <=8 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.附带技能)
				elseif 长度>8 and 长度 <= 10 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.附带技能)
				elseif 长度>10 and 长度 <= 12 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.附带技能)
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.附带技能)
				end

		elseif  string.find(self.物品.名称,"召唤兽内丹") and self.物品.特效 ~= nil then
					tp.xqdt1:显示(self.x-5,self.y+33)
				local 长度=string.len(tostring(self.物品.特效))
				if 长度<=2 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.特效)
				elseif 长度>2 and 长度 <= 4 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.特效)
				elseif 长度 >4 and 长度 <=6 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.特效)
				elseif 长度 >6 and 长度 <=8 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.特效)
				elseif 长度>8 and 长度 <= 10 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.特效)
				elseif 长度>10 and 长度 <= 12 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.特效)
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.特效)
				end


		elseif self.物品.名称 == "强化符" and self.物品.等级~=nil and self.物品.技能~=nil then
				local aa={
				嗜血={"体质","项链"},
				莲华妙法={"法伤","项链"},
				轻如鸿毛={"魔法","武器"},
				神木呓语={"法伤结果","鞋子"},
				拈花妙指={"速度","鞋子"},
				盘丝舞={"防御","武器"},
				一气化三清={"魔力","衣服"},
				浩然正气={"法防","衣服"},
				龙附={"伤害","武器"},
				穿云破空={"物伤结果","腰带"},
				神兵护法={"命中","帽子"},
				魔王护持={"气血","武器"},
				元阳护体={"回复效果","武器"},
				神力无穷={"愤怒","腰带"},
				尸气漫天={"耐力","帽子"},
				担山赶月={"力量","项链"},
				}
				tp.xqdt1:显示(self.x-5,self.y+33)
				if self.物品.技能 == "神木呓语" or self.物品.技能 == "穿云破空" or self.物品.技能 == "元阳护体" then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,aa[self.物品.技能][1])
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,aa[self.物品.技能][1])
				end
		elseif self.物品.名称 == "初级清灵仙露" or self.物品.名称=="中级清灵仙露" or self.物品.名称=="高级清灵仙露" then
				if self.物品.灵气~=nil then
					tp.xqdt1:显示(self.x-5,self.y+33)
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.灵气.."灵")
				end
		elseif 自适应 and (self.物品.名称 == "百炼精铁" or self.物品.名称 == "元灵晶石") then
					tp.xqdt1:显示(self.x-5,self.y+33)
					xqwz1:显示(self.x + (xqwz1:取宽度("哦1")/2),self.y + 33,self.物品.子类.."级")
		end
		if 自适应 then
	    	if string.find(self.物品.名称,"合成旗") or string.find(self.物品.名称,"导标旗") then
					tp.xqdt1:显示(self.x-5,self.y+33)
				local 长度=string.len(tostring(取地图名称(self.物品.地图)))
				if self.物品.名称== "超级合成旗" then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,"全地图")
				end
				if 长度<=2 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,取地图名称(self.物品.地图))
				elseif 长度>2 and 长度 <= 4 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,取地图名称(self.物品.地图))
				elseif 长度 >4 and 长度 <=6 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,取地图名称(self.物品.地图))
				elseif 长度 >6 and 长度 <=8 then
					if self.物品.名称== "超级合成旗" then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,"全地图")
					else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,取地图名称(self.物品.地图))
					end
				elseif 长度>8 and 长度 <= 10 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,取地图名称(self.物品.地图))
				elseif 长度>10 and 长度 <= 12 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,取地图名称(self.物品.地图))
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,取地图名称(self.物品.地图))
				end

			elseif self.物品.名称 == "鬼谷子" then
					tp.xqdt1:显示(self.x-5,self.y+33)
					if self.物品.子类 =="" or self.物品.子类==nil then
						self.物品.子类="随机阵法"
					end
				local 长度=string.len(tostring(self.物品.子类))
				if 长度<=2 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.子类 )
				elseif 长度>2 and 长度 <= 4 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.子类 )
				elseif 长度 >4 and 长度 <=6 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.子类 )
				elseif 长度 >6 and 长度 <=8 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.子类 )
				elseif 长度>8 and 长度 <= 10 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.子类 )
				elseif 长度>10 and 长度 <= 12 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.子类 )
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.子类 )
				end
--------------------------------无双移植---------------
		elseif self.物品.名称=="元素曜石·冰" or  self.物品.名称=="元素曜石·风"  or  self.物品.名称=="元素曜石·火" or  self.物品.名称=="元素曜石·雷" or  self.物品.名称=="元素曜石·水" or  self.物品.名称=="元素曜石·岩"then

			if self.物品.部位 ~= nil then
			tp.xqdt1:显示(self.x-5,self.y+31)
			xqwz1:显示(self.x + ((44 - xqwz1:取宽度(self.物品.部位))/2),self.y + 31,self.物品.部位)
			end
------------------------------------------------------
			elseif self.物品.名称 == "神兵图鉴" or self.物品.名称 == "灵宝图鉴" or self.物品.名称 == "灵饰图鉴"then
				tp.xqdt1:显示(self.x-5,self.y+33)
				xqwz1:显示(self.x + (xqwz1:取宽度("哦1")/2),self.y + 33,self.物品.子类.."级")

			elseif self.物品.名称 == "细磨豆沙元宵" then
				tp.xqdt1:显示(self.x-5,self.y+33)
				xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-2,self.y + 33,"速度资质")
			elseif self.物品.名称 == "芝麻沁香元宵" then
				tp.xqdt1:显示(self.x-5,self.y+33)
				xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-2,self.y + 33,"攻击资质")
			elseif self.物品.名称 == "桂花酒酿元宵" then
				tp.xqdt1:显示(self.x-5,self.y+33)
				xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-2,self.y + 33,"防御资质")
			elseif self.物品.名称 == "滑玉莲蓉元宵" then
				tp.xqdt1:显示(self.x-5,self.y+33)
				xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-2,self.y + 33,"法力资质")
			elseif self.物品.名称 == "蜜糖腰果元宵" then
				tp.xqdt1:显示(self.x-5,self.y+33)
				xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-2,self.y + 33,"躲避资质")
			elseif self.物品.名称 == "山楂拔丝元宵" then
				tp.xqdt1:显示(self.x-5,self.y+33)
				xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-2,self.y + 33,"体力资质")

			elseif self.物品.名称 == "怪物卡片" then ----self.物品.造型
					tp.xqdt1:显示(self.x-5,self.y+33)
					if self.物品.技能=="" then
						self.物品.技能="无"
					end
				local 长度=string.len(tostring(self.物品.技能))
				if 长度<=2 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.技能)
				elseif 长度>2 and 长度 <= 4 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.技能)
				elseif 长度 >4 and 长度 <=6 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.技能)
				elseif 长度 >6 and 长度 <=8 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.技能)
				elseif 长度>8 and 长度 <= 10 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.技能)
				elseif 长度>10 and 长度 <= 12 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.技能)
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.技能)
				end

			elseif self.物品.级别限制 ~= nil and (self.物品.名称 == "天眼珠" or self.物品.名称=="三眼天珠" or self.物品.名称=="九眼天珠") then
				if self.物品.灵气~=nil then
					tp.xqdt1:显示(self.x-5,self.y+33)
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.级别限制.."/"..self.物品.灵气.."灵")
				end
			elseif self.物品.级别限制 ~= nil and (self.物品.名称 == "陨铁" or self.物品.名称=="附魔宝珠" or self.物品.名称=="钨金" or self.物品.名称=="炼妖石" ) then
					tp.xqdt1:显示(self.x-5,self.y+33)
					xqwz1:显示(self.x + (xqwz1:取宽度("哦1")/2),self.y + 33,self.物品.级别限制.."级")

			elseif self.物品.名称=="金香玉" or self.物品.名称=="小还丹" or self.物品.名称=="千年保心丹" or self.物品.名称=="风水混元丹" or self.物品.名称=="定神香" or self.物品.名称=="蛇蝎美人" or self.物品.名称=="九转回魂丹" or self.物品.名称=="佛光舍利子" or self.物品.名称=="十香返生丸" or self.物品.名称=="五龙丹" then
					if self.物品.阶品 ~= nil then
					tp.xqdt1:显示(self.x-5,self.y+33)
					xqwz1:显示(self.x + (xqwz1:取宽度("哦1")/2),self.y + 33,self.物品.阶品.."品")
					end
			elseif self.物品.专用~=nil  then
						-- self.专用图标:显示(self.x,self.y+3)
			elseif 自适应 and self.物品.名称 == "制造指南书" then
				tp.xqdt1:显示(self.x-5,self.y+33)
		    	local it = tp:取武器子类(self.物品.特效)
		    	local 长度=string.len(tostring(self.物品.子类..it))
				if 长度<=2 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.子类..it)
				elseif 长度>2 and 长度 <= 4 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.子类..it)
				elseif 长度 >4 and 长度 <=6 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.子类..it)
				elseif 长度 >6 and 长度 <=8 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.子类..it)
				elseif 长度>8 and 长度 <= 10 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.子类..it)
				elseif 长度>10 and 长度 <= 12 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.子类..it)
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.子类..it)
				end

			elseif 自适应 and self.物品.名称 == "灵饰指南书" then
					tp.xqdt1:显示(self.x-5,self.y+33)
		    	local it = tp:取武器子类(self.物品.特效)
		    	local 长度=string.len(tostring(self.物品.子类..self.物品.特效))
				if 长度<=2 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.子类..self.物品.特效)
				elseif 长度>2 and 长度 <= 4 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.子类..self.物品.特效)
				elseif 长度 >4 and 长度 <=6 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.子类..self.物品.特效)
				elseif 长度 >6 and 长度 <=8 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.子类..self.物品.特效)
				elseif 长度>8 and 长度 <= 10 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.子类..self.物品.特效)
				elseif 长度>10 and 长度 <= 12 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.子类..self.物品.特效)
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.子类..self.物品.特效)
				end

			elseif 自适应 and self.物品.名称 == "上古锻造图策" then
					tp.xqdt1:显示(self.x-5,self.y+33)
					if self.物品.级别限制==nil or self.物品.级别限制=="" or self.物品.种类==nil or self.物品.种类=="" then
						self.物品.级别限制="随机"
						self.物品.种类="获取"
					end
		    	local 长度=string.len(tostring(self.物品.级别限制..self.物品.种类))
				if 长度<=2 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.级别限制..self.物品.种类)
				elseif 长度>2 and 长度 <= 4 then
					xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.级别限制..self.物品.种类)
				elseif 长度 >4 and 长度 <=6 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.级别限制..self.物品.种类)
				elseif 长度 >6 and 长度 <=8 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.级别限制..self.物品.种类)
				elseif 长度>8 and 长度 <= 10 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.级别限制..self.物品.种类)
				elseif 长度>10 and 长度 <= 12 then
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.级别限制..self.物品.种类)
				else
					xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.级别限制..self.物品.种类)
				end




			elseif self.物品.级别限制 ~= nil and self.物品.名称 ~= "上古锻造图策"  then
				local lb={{男="头盔",女="发钗"},"项链","武器",{男="男衣",女="女衣"},"腰带","鞋","护腕","项圈","铠甲","耳饰","佩饰","戒指","手镯",[15]="锦衣",[16]="足印",[17]="足迹"}
				local 类别1
				local 显示等级=true
				if self.物品.总类==2 then
					if self.物品.分类==4 and self.物品.子类==911 then
						类别1="坤斧"
					elseif self.物品.分类==3 then
						local zl1={"枪矛","斧钺","剑","双短剑","飘带","爪刺","扇","魔棒","锤","鞭","环圈","刀","法杖","弓弩","宝珠","巨剑","伞","灯笼",[910]="乾斧"}
						类别1=zl1[self.物品.子类]
					elseif self.物品.锦衣==true and (lb[self.物品.分类]~=nil and self.物品.分类>=15 and self.物品.分类<=17) then
						-- zt:显示(self.x + -1,self.y + 35,lb[self.物品.分类])
						显示等级=false
					else
					    类别1=lb[self.物品.分类]
					end
				end
				if 类别1~=nil and self.物品.鉴定==false then
					tp.xqdt1:显示(self.x-5,self.y+33)
					if type(类别1)=="table" and self.物品.性别限制~=nil and 类别1[self.物品.性别限制]~=nil  then

						local 长度=string.len(tostring(self.物品.级别限制..类别1[self.物品.性别限制]))
						if 长度<=2 then
							xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.级别限制..类别1[self.物品.性别限制])
						elseif 长度>2 and 长度 <= 4 then
							xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.级别限制..类别1[self.物品.性别限制])
						elseif 长度 >4 and 长度 <=6 then
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.级别限制..类别1[self.物品.性别限制])
						elseif 长度 >6 and 长度 <=8 then
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.级别限制..类别1[self.物品.性别限制])
						elseif 长度>8 and 长度 <= 10 then
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.级别限制..类别1[self.物品.性别限制])
						elseif 长度>10 and 长度 <= 12 then
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.级别限制..类别1[self.物品.性别限制])
						else
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.级别限制..类别1[self.物品.性别限制])
						end

					else
						local 长度=string.len(tostring(self.物品.级别限制..类别1))
						if 长度<=2 then
							xqwz1:显示(self.x + (xqwz1:取宽度("哦哦哦")/2),self.y + 33,self.物品.级别限制..类别1)
						elseif 长度>2 and 长度 <= 4 then
							xqwz1:显示(self.x + (xqwz1:取宽度("哦哦")/2),self.y + 33,self.物品.级别限制..类别1)
						elseif 长度 >4 and 长度 <=6 then
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2)+5,self.y + 33,self.物品.级别限制..类别1)
						elseif 长度 >6 and 长度 <=8 then
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2),self.y + 33,self.物品.级别限制..类别1)
						elseif 长度>8 and 长度 <= 10 then
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-5,self.y + 33,self.物品.级别限制..类别1)
						elseif 长度>10 and 长度 <= 12 then
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-12,self.y + 33,self.物品.级别限制..类别1)
						else
							xqwz1:显示(self.x + (xqwz1:取宽度("")/2)-19,self.y + 33,self.物品.级别限制..类别1)
						end
					end
				end
			end
		end
	end




	if not tp.消息栏焦点 then
		if x>=self.x and x<=self.x+50 and y>=self.y and y<=self.y+50 and 条件 then
			tp.按钮焦点 = true
			tp.禁止关闭 = true
			if mouse(0) and not self:物品禁止(总类) then
				self.事件 = true
			elseif mouse(1) then
				self.右键 = true
			end
			if self.格子显示 == nil then
				if self.物品 and self.物品.大模型 == nil then
					if self.物品.url~=nil then
						self.物品.大模型 = tp.资源:载入(self.物品.url,"网易WDF动画",self.物品.大模型资源)
					else
						self.物品.大模型 = tp.资源:载入(self.物品.资源,"网易WDF动画",self.物品.大模型资源)
					end
				end
				if abs == nil then
					-- tp.物品格子焦点_:显示(self.x+1,self.y+1)
					tp.物品格子焦点_:显示(self.x+1,self.y+3)
				end
			end
			self.焦点 = true
		end
	end
end

function 系统类_物品格子:置坐标(x,y)
	self.x,self.y = x,y
end

return 系统类_物品格子