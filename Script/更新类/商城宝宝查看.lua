-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:52
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:53
-- @脚本作者: 熙熙哥
-- @QQ:2481510317
-- @创建时间:   2020-12-27 15:10:10
-- @最后修改来自: 熙熙哥
-- @Last Modified time: 2023-07-10 00:27:51
local 商城宝宝查看 = class()
local floor = math.floor
local xslb,bb,lb,tp,fy,gz,类型
local format = string.format
local insert = table.insert

function 商城宝宝查看:初始化(根)
	self.ID = 160
	self.x =(全局游戏宽度-360)/2
	self.y =(全局游戏高度-204)/2
	self.xx = 0
	self.yy = 0
	self.注释 = "商城宝宝查看"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
end

function 商城宝宝查看:打开(b,物法)
	if b~=nil and self.可视 then self.可视=false end
	if self.可视 then
		if b ~= nil and bb ~= b then
			bb = b
			fy = 0
			for n=1,#bb.技能 do
				self.技能[n] = gz(0,0,n,"技能查看")
				local 临时技能=tp._技能.创建()
				if bb.技能[n] ~= nil then
				   临时技能:置对象(bb.技能[n],2)
				   self.技能[n]:置技能(临时技能)
				else
				   break
				end
			end
			--self:置形象()
			tp.运行时间 = tp.运行时间 + 1
			self.窗口时间 = tp.运行时间
			return false
		end
		fy = nil
		bb = nil
		xslb = nil
		self.可视 = false
		self.资源组=nil
		self.技能=nil

		self.左1=nil
		self.左2=nil
		self.左3=nil
		self.右1=nil
		self.右2=nil
		self.右3=nil
		self.背景=nil
		return
	else
		类型=物法
		fy = 0
		bb = b
		self.技能={}
		insert(tp.窗口_,self)
		self:加载资源()
		for n=1,#bb.技能 do
			self.技能[n] = gz(0,0,n,"技能查看")
			local 临时技能=tp._技能.创建()
			if bb.技能[n] ~= nil then
			   临时技能:置对象(bb.技能[n],2)
			   self.技能[n]:置技能(临时技能)
			else
			   break
			end
		end
		--self:置形象()
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 商城宝宝查看:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.左1=资源:载入('xixige_newmall.gep',"内置png",0x10001074)
	self.左2=资源:载入('xixige_newmall.gep',"内置png",0x10001075)
	self.左3=资源:载入('xixige_newmall.gep',"内置png",0x10001076)
	self.右1=资源:载入('xixige_newmall.gep',"内置png",0x10001077)
	self.右2=资源:载入('xixige_newmall.gep',"内置png",0x10001078)
	self.右3=资源:载入('xixige_newmall.gep',"内置png",0x10001079)
	self.资源组 = {
		[4] =  按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,3,true,true),--应该是上
		[5] =  按钮.创建(tp.资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,3,true,true),--应该是下
	}
	self.背景=资源:载入('xixige_newmall.gep',"内置png",0x10001073)
	self.技能 = {}
	gz = tp._技能格子
end

function 商城宝宝查看:显示(dt,x,y)
	self.焦点 = false
	self.背景:显示(self.x,self.y)
	if #bb.技能>12 then
	  self.左1:显示(self.x + 306,self.y + 169)
	  self.右1:显示(self.x + 330,self.y + 169)
	end
	if self.鼠标 then
		if self.左1:是否选中(x,y) then
		   self.左2:显示(self.x + 306,self.y + 169)
		elseif self.右1:是否选中(x,y) then
		   self.右2:显示(self.x + 330,self.y + 169)
		end
		if self.左2:是否选中(x,y) and 引擎.鼠标按住(左键) then
		   self.左3:显示(self.x + 306,self.y + 169)
		elseif self.右2:是否选中(x,y) and 引擎.鼠标按住(左键) then
		   self.右3:显示(self.x + 330,self.y + 169)
		end
		if self.左2:是否选中(x,y) and 引擎.鼠标弹起(左键) then
			if fy == 0 then
				tp.常规提示:打开("#Y/当前已是首页技能")
			else
				fy = 0
			end
		elseif self.右2:是否选中(x,y) and 引擎.鼠标弹起(左键) then
			if fy == 12 then
				tp.常规提示:打开("#Y/当前已是末页技能")
			else
				fy = 12
			end
		end
	end
	local 字体 = tp.字体表.普通字体
	字体:置颜色(0xffffffff)
	字体:显示(self.x+105+(147-字体:取宽度(bb.模型))/2,self.y+3,bb.模型)
	字体:显示(self.x+78+(78-字体:取宽度(bb.攻击资质))/2,self.y+32,bb.攻击资质)
	字体:显示(self.x+78+(78-字体:取宽度(bb.防御资质))/2,self.y+60,bb.防御资质)
	字体:显示(self.x+78+(78-字体:取宽度(bb.体力资质))/2,self.y+116,bb.体力资质)
	字体:显示(self.x+78+(78-字体:取宽度(bb.法力资质))/2,self.y+88,bb.法力资质)
	字体:显示(self.x+78+(78-字体:取宽度(bb.速度资质))/2,self.y+144,bb.速度资质)
	字体:显示(self.x+78+(78-字体:取宽度(bb.躲闪资质))/2,self.y+172,bb.躲闪资质)
	字体:显示(self.x+210+(45-字体:取宽度(bb.成长))/2,self.y+172,bb.成长)
	字体:置颜色(0xffff9d00)
	字体:显示(self.x+268,self.y+172,类型)
	local xx = 0
	local yy = 0
	for n=1,12 do
		if self.技能[n+fy] ~= nil and self.技能[n+fy].技能 ~= nil then
			self.技能[n+fy]:置坐标(self.x+170+(xx*46),self.y+29+(yy*46))
			self.技能[n+fy]:显示(x,y,self.鼠标)
			if self.技能[n+fy].焦点 then
				tp.提示:技能(x,y,self.技能[n+fy].技能)
			end
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
	end
end

function 商城宝宝查看:检查点(x,y)
	if self.背景 ~= nil and self.背景:是否选中(x,y)  then
		return true
	-- elseif self.背景 ~= nil and not self.背景:是否选中(x,y)  then
	--   self.可视=false
	end
end

function 商城宝宝查看:初始移动(x,y)
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

function 商城宝宝查看:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

function 取神兽资质(bb,物法)
	local fh
	if 物法=="物理" then
		if bb=="超级神牛" then
			fh = {"力劈华山","高级幸运","高级招架","必杀","强力"}
		elseif bb=="超级神虎" then
			fh = {"高级感知","嗜血追击","高级夜战","连击","强力"}
		elseif bb=="超级神兔" then
			fh = {"高级连击","高级偷袭","高级敏捷","夜战","幸运"}
		elseif bb=="超级神龙" then
			fh ={"高级必杀","高级驱鬼","高级夜战","幸运","强力"}
		elseif bb=="超级神蛇" then
			fh = {"高级连击","高级毒","高级夜战","偷袭","敏捷"}
		elseif bb=="超级泡泡" then
			fh = {"高级神佑复生","高级必杀","高级感知","夜战","幸运"}
		elseif bb=="超级大熊猫" then
			fh = {"高级连击","高级防御","高级感知","夜战","幸运"}
		elseif bb=="超级大象" then
			fh = {"高级强力","高级反震","高级再生","夜战","幸运"}
		elseif bb=="超级金猴" then
			fh = {"高级偷袭","高级敏捷","高级幸运","夜战","幸运"}
		elseif bb=="超级灵鹿" then
			fh = {"善恶有报","高级冥思","高级再生","永恒","幸运"}
		elseif bb=="超级白泽" then
			fh = {"高级必杀","高级敏捷","高级夜战","感知","幸运"}
		elseif bb=="超级赤焰兽" then
			fh = {"高级必杀","高级反击","高级感知","夜战","幸运"}
		elseif bb=="超级神牛" then
			fh = {"力劈华山","高级幸运","高级招架","必杀","强力"}
		elseif bb=="超级神猴" then
			fh = {"高级神佑复生","高级吸血","大快朵颐","必杀","连击"}
		elseif bb=="超级神鸡" then
			fh = {"高级神佑复生","高级强力","从天而降","夜战","必杀"}
		elseif bb=="超级神狗" then
			fh = {"高级独行","高级神佑复生","理直气壮","强力","再生"}
		elseif bb=="超级神猪" then
			fh = {"高级神佑复生","高级防御","津津有味","幸运","再生"}
		elseif bb=="超级麒麟" then
			fh = {"高级合纵","高级连击","高级幸运","偷袭"}
		elseif bb=="超级青鸾" then
			fh = {"苍鸾怒击","高级夜战","高级飞行","反震"}
		elseif bb=="超级筋斗云" then
			fh = {"高级神佑复生","高级偷袭","高级敏捷","强力"}
		elseif bb=="超级六耳猕猴" then
			fh = {"高级连击","高级敏捷","高级招架","幸运"}
		elseif bb=="超级灵狐" then
			fh = {"惊心一剑","高级敏捷","高级必杀","夜战"}
		elseif bb=="超级土地公公" then
			fh = {"高级敏捷","高级必杀","高级神佑复生","夜战"}
		elseif bb=="超级海豚" then
			fh = {"剑荡四方","高级必杀","高级偷袭","夜战"}
		elseif bb=="超级人参娃娃" then
			fh = {"壁垒击破","高级必杀","高级强力","幸运"}
		elseif bb=="超级大鹏" then
			fh = {"高级飞行","高级敏捷","高级神佑复生","必杀"}
		elseif bb=="超级离火兽" then
			fh = {"焚天陨火","高级连击","高级感知","再生"}
		elseif bb=="超级玉兔" then
			fh = {"高级夜战","高级敏捷","偷袭","连击"}
		elseif bb=="超级猪小戒" then
			fh = {"高级必杀","高级强力","高级防御","高级偷袭","反击"}
		elseif bb=="超级飞天" then
			if dingzhi then
				if dingzhi==388 then
					fh = {"力劈华山","高级敏捷","高级反击","净台妙谛","高级夜战","必杀"}
				elseif dingzhi==888 or dingzhi==1288 then
					fh = {"力劈华山","高级敏捷","高级反击","净台妙谛","高级偷袭","高级夜战","高级必杀","高级神佑复生"}
				else
					fh = {"高级连击","高级飞行","高级敏捷","神佑复生"}
				end
			else
				fh = {"高级连击","高级飞行","高级敏捷","神佑复生"}
			end
		elseif bb=="超级孔雀" then
			fh = {"高级飞行","高级偷袭","高级再生","必杀"}
		elseif bb=="超级小白龙" then
			fh = {"高级必杀","高级反击","高级再生","感知"}
		elseif bb=="超级有熊" then
			fh = {"狂莽一击","高级连击","高级防御","吸血"}
		elseif bb=="超级神鼠" then
			fh = {"昼伏夜出","神出鬼没","溜之大吉","偷袭","吸血"}
		elseif bb=="超级神牛（辛丑）" then
			fh = {"高级必杀","高级连击","高级再生","幸运","招架"}
		elseif bb=="超级神虎（壬寅）" then
			if dingzhi then
				if dingzhi==388 then
					fh = {"虎虎生风","高级敏捷","高级反击","净台妙谛","高级夜战","高级必杀"}
				elseif dingzhi==888 or dingzhi==1288 then
					fh = {"虎虎生风","高级敏捷","高级偷袭","净台妙谛","高级夜战","高级必杀","高级神佑复生","高级驱鬼"}
				else
					fh = {"虎虎生风","高级敏捷","高级反击","强力","必杀"}
				end
			else
				fh = {"虎虎生风","高级敏捷","高级反击","强力","必杀"}
			end
		elseif bb=="超级鲲鹏" then
			fh = {"北冥之渊","水击三千","高级必杀","高级偷袭","高级神佑复生","逍遥游","夜战","再生","高级防御"}
		elseif bb=="超级神马" then
			fh = {"高级连击","高级神佑复生","浮云神马","幸运","神迹"}
		elseif bb=="超级神羊" then
			fh = {"高级必杀","高级连击","千钧一怒","反震","感知"}
		elseif bb=="超级腾蛇" then
			fh = {"高级连击","高级毒","高级夜战","偷袭","敏捷"}
		end
	else--if 物法=="法术型（秒伤）" then
		if bb=="超级神牛" then
			fh = {"高级法术波动","高级法术连击","奔雷咒","冥思","魔之心"}
		elseif bb=="超级神虎" then
			fh = {"高级法术暴击","高级驱鬼","地狱烈火","法术波动","魔之心"}
		elseif bb=="超级神兔" then
			fh = {"高级法术连击","高级反震","奔雷咒","魔之心","感知"}
		elseif bb=="超级神龙" then
			fh = {"高级法术波动","龙魂","奔雷咒","魔之心","再生"}
		elseif bb=="超级神蛇" then
			fh = {"灵能激发","地狱烈火","高级法术波动","魔之心","永恒"}
		elseif bb=="超级泡泡" then
			fh = {"高级慧根","高级魔之心","奔雷咒","水攻","感知"}
		elseif bb=="超级大熊猫" then
			fh = {"高级冥思","高级魔之心","奔雷咒","水攻","感知"}
		elseif bb=="超级大象" then
			fh = {"高级神迹","高级魔之心","奔雷咒","水攻","感知"}
		elseif bb=="超级金猴" then
			fh = {"高级精神集中","高级魔之心","奔雷咒","水攻","感知"}
		elseif bb=="超级灵鹿" then
			fh = {"泰山压顶","高级法术连击","高级法术暴击","上古灵符","感知"}
		elseif bb=="超级白泽" then
			fh = {"水漫金山","高级魔之心","高级法术暴击","上古灵符","感知"}
		elseif bb=="超级赤焰兽" then
			fh = {"地狱烈火","高级冥思","八凶法阵","魔之心","感知"}
		elseif bb=="超级神牛" then
			fh = {"地狱烈火","高级法术波动","高级法术连击","冥思","魔之心"}
		elseif bb=="超级神羊" then
			fh = {"地狱烈火","高级法术波动","高级魔之心","法术暴击","驱鬼"}
		elseif bb=="超级神猴" then
			fh = {"地狱烈火","高级法术波动","高级法术连击","魔之心","法术暴击"}
		elseif bb=="超级神鸡" then
			fh = {"地狱烈火","高级法术波动","高级感知","招架","魔之心"}
		elseif bb=="超级神狗" then
			fh = {"地狱烈火","高级招架","高级防御","法术暴击","魔之心"}
		elseif bb=="超级神猪" then
			fh = {"地狱烈火","高级魔之心","高级法术暴击","招架","驱鬼"}
		elseif bb=="超级麒麟" then
			fh = {"泰山压顶","高级魔之心","高级驱鬼","感知"}
		elseif bb=="超级青鸾" then
			fh = {"高级幸运","奔雷咒","高级魔之心","法术暴击"}
		elseif bb=="超级筋斗云" then
			fh = {"高级法术连击","高级感知","反震","奔雷咒"}
		elseif bb=="超级六耳猕猴" then
			fh = {"须弥真言","上古灵符","高级法术连击","永恒"}
		elseif bb=="超级灵狐" then
			fh = {"高级法术暴击","高级感知","奔雷咒","法术连击"}
		elseif bb=="超级土地公公" then
			fh = {"天降灵葫","高级法术连击","高级神佑复生","招架"}
		elseif bb=="超级海豚" then
			fh = {"水漫金山","高级法术暴击","高级魔之心","慧根"}
		elseif bb=="超级人参娃娃" then
			fh = {"泰山压顶","高级法术波动","高级冥思","魔之心"}
		elseif bb=="超级大鹏" then
			fh = {"奔雷咒","高级法术波动","高级法术暴击","冥思"}
		elseif bb=="超级离火兽" then
			fh = {"地狱烈火","高级魔之心","高级法术暴击","永恒"}
		elseif bb=="超级玉兔" then
			fh = {"月光","高级法术暴击","高级法术波动","驱鬼"}
		elseif bb=="超级猪小戒" then
			fh = {"食指大动","高级魔之心","高级感知","高级法术连击","法术波动"}
		elseif bb=="超级飞天" then
			if dingzhi then
				if dingzhi==388 then
					fh = {"流沙轻音","净台妙谛","高级法术暴击","高级法术连击","高级神佑复生","高级感知"}
				elseif dingzhi==888 or dingzhi==1288 then
					fh = {"流沙轻音","净台妙谛","高级法术暴击","高级法术连击","高级魔之心","高级敏捷","高级神佑复生","高级感知"}
				else
					fh = {"流沙轻音","净台妙谛","高级法术暴击","幸运"}
				end
			else
				fh = {"流沙轻音","净台妙谛","高级法术暴击","幸运"}
			end
		elseif bb=="超级孔雀" then
			fh = {"高级魔之心","高级神佑复生","奔雷咒","幸运"}
		elseif bb=="超级小白龙" then
			fh = {"高级法术连击","高级法术暴击","叱咤风云","永恒"}
		elseif bb=="超级有熊" then
			fh = {"泰山压顶","高级魔之心","高级法术波动","神迹"}
		elseif bb=="超级神鼠" then
			fh = {"奔雷咒","高级慧根","高级再生","魔之心","法术波动"}
		elseif bb=="超级神牛（辛丑）" then
			fh = {"神来气旺","地狱烈火","高级法术暴击","驱鬼","法术波动"}
		elseif bb=="超级神虎（壬寅）" then
			if dingzhi then
				if dingzhi==388 then
					fh = {"八凶法阵","高级法术波动","高级反震","净台妙谛","高级法术暴击","高级神佑复生"}
				elseif dingzhi==888 or dingzhi==1288 then
					fh = {"八凶法阵","高级法术连击","高级反震","净台妙谛","高级法术暴击","高级法术波动","高级感知","高级神佑复生"}
				end
			else
				fh = {"奔雷咒","高级法术波动","高级反震","招架","法术暴击"}
			end
		elseif bb=="超级鲲鹏" then
			fh = {"北冥之渊","扶摇万里","高级魔之心","高级法术暴击","高级神佑复生","逍遥游","精神集中","法术波动","高级法术连击"}
		elseif bb=="超级神马" then
			fh = {"高级魔之心","高级法术连击","泰山压顶","法术暴击","慧根"}
		elseif bb=="超级腾蛇" then
			fh = {"灵能激发","地狱烈火","高级法术波动","魔之心","永恒"}
		end
	end
	local bbs = {}
	bbs[1] = 1600 --攻资
	bbs[2] = 1600 --防资
	bbs[3] = 5500 --体资
	bbs[4] = 3500 --法资
	bbs[5] = 1400 --速资
	bbs[6] = 1400 --躲闪
	bbs[7] = 1.3
	bbs[8] = fh
	return bbs
end

return 商城宝宝查看
