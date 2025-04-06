-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-15 04:29:18
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-04-08 23:31:05
--======================================================================--
local 系统类_人物框 = class()

local floor = math.floor
local ceil = math.ceil
--local 矩阵 = require("gge包围盒")(0,0,115,95)
local tp
local insert = table.insert
local remove = table.remove
local mouseb = 引擎.鼠标弹起
local format = string.format
local tx = 引擎.取头像
local min = math.min
local 按钮 = require("script/系统类/按钮")
local 矩阵 = require("gge包围盒")(全局游戏宽度-230,1,228,50)
local qwp = 引擎.取物品功效

function 系统类_人物框:初始化(根)
	tp = 根
	local 资源 = 根.资源



	self.记忆角色 = {}
	self.人物头像背景 = {}
	self.小图标 = {
	资源:载入('wzife.wdf',"网易WDF动画",0x24901650), --气血
	资源:载入('wzife.wdf',"网易WDF动画",0x09E2B01B),--魔法
	资源:载入('wzife.wdf',"网易WDF动画",0x397B8CF6),--摄药香
	资源:载入('wzife.wdf',"网易WDF动画",0xabb8dcaa),--钱
	资源:载入('wzife.wdf',"网易WDF动画",0x19b90b9d),--上升箭头
	资源:载入('wzife.wdf',"网易WDF动画",0x8c6d00dc),--盾
	资源:载入('wzife.wdf',"网易WDF动画",0x4a5dd98c),--剑
	}
	self.图标组 = {}
	self.焦点 = false
	self.队伍头像={}
	self.xiuz=0
	self:qiehuan(全局界面风格)
end
function 系统类_人物框:qiehuan(风格)
	local 资源 = tp.资源
	if  风格=="国韵" then
		self.xiuz=7
		self.UI_底图 = 资源:载入('common/uigy.wdf',"网易WDF动画",0x3D1FA249)
		self.背景 = 资源:载入('common/uigy.wdf',"网易WDF动画",0x2E8758EE)
		self.气血 = 资源:载入('common/uigy.wdf',"网易WDF动画",0xAAD44583)
		self.气血上限=资源:载入('common/uigy.wdf',"网易WDF动画",0x8c2611)
		self.魔法 = 资源:载入('common/uigy.wdf',"网易WDF动画",0xCE4D3C2D)
		self.经验 = 资源:载入('common/uigy.wdf',"网易WDF动画",0x7B3C08E4)
		self.愤怒 = 资源:载入('common/uigy.wdf',"网易WDF动画",0xBAF8009F)
		self.气血底图 = 资源:载入('common/uigy.wdf',"网易WDF动画",0x008C2611)
		self.人物血条=资源:载入('common/uigy.wdf',"网易WDF动画",0X2E8758EE)
		self.人物蓝条=资源:载入('common/uigy.wdf',"网易WDF动画",0X2E8758EE)
		self.人物怒条=资源:载入('common/uigy.wdf',"网易WDF动画",0X2E8758EE)
		self.人物经条=资源:载入('common/uigy.wdf',"网易WDF动画",0X2E8758EE)
		--=================================
		self.bb血条=资源:载入('common/uigy.wdf',"网易WDF动画",0X2E8758EE)
		self.bb蓝条=资源:载入('common/uigy.wdf',"网易WDF动画",0X2E8758EE)
		self.bb经条=资源:载入('common/uigy.wdf',"网易WDF动画",0X2E8758EE)
		self.人物tx背景_= 资源:载入('common/uigy.wdf',"网易WDF动画",0x360B8373)
		self.宠物tx背景_= 资源:载入('common/uigy.wdf',"网易WDF动画",0x363AAF1B)
	elseif  风格=="水晶" then
		self.xiuz=10
		self.背景 = 资源:载入('common/uisj.wdf',"网易WDF动画",0x2E8758EE)
		self.气血 = 资源:载入('common/uisj.wdf',"网易WDF动画",0xAAD44583)
		self.气血上限=资源:载入('common/uisj.wdf',"网易WDF动画",0x8c2611)
		self.魔法 = 资源:载入('common/uisj.wdf',"网易WDF动画",0xCE4D3C2D)
		self.经验 = 资源:载入('common/uisj.wdf',"网易WDF动画",0x7B3C08E4)
		self.愤怒 = 资源:载入('common/uisj.wdf',"网易WDF动画",0xBAF8009F)
		self.气血底图 = 资源:载入('common/uisj.wdf',"网易WDF动画",0x008C2611)
		self.人物血条=资源:载入('common/uisj.wdf',"网易WDF动画",0X2E8758EE)
		self.人物蓝条=资源:载入('common/uisj.wdf',"网易WDF动画",0X2E8758EE)
		self.人物怒条=资源:载入('common/uisj.wdf',"网易WDF动画",0X2E8758EE)
		self.人物经条=资源:载入('common/uisj.wdf',"网易WDF动画",0X2E8758EE)
		--=================================
		self.bb血条=资源:载入('common/uisj.wdf',"网易WDF动画",0X2E8758EE)
		self.bb蓝条=资源:载入('common/uisj.wdf',"网易WDF动画",0X2E8758EE)
		self.bb经条=资源:载入('common/uisj.wdf',"网易WDF动画",0X2E8758EE)
		self.人物tx背景_= 资源:载入('common/uisj.wdf',"网易WDF动画",0x360B8373)
		self.宠物tx背景_= 资源:载入('common/uisj.wdf',"网易WDF动画",0x363AAF1B)
	else
		self.xiuz=0
		self.背景 = 资源:载入('wzife.wdf',"网易WDF动画",0x2E8758EE)
		self.气血 = 资源:载入('wzife.wdf',"网易WDF动画",0xAAD44583)
		self.气血上限=资源:载入('wzife.wdf',"网易WDF动画",0x8c2611)
		self.魔法 = 资源:载入('wzife.wdf',"网易WDF动画",0xCE4D3C2D)
		self.经验 = 资源:载入('wzife.wdf',"网易WDF动画",0x7B3C08E4)
		self.愤怒 = 资源:载入('wzife.wdf',"网易WDF动画",0xBAF8009F)
		self.气血底图 = 资源:载入('wzife.wdf',"网易WDF动画",0x008C2611)
		self.人物血条=资源:载入('wzife.wdf',"网易WDF动画",0X2E8758EE)
		self.人物蓝条=资源:载入('wzife.wdf',"网易WDF动画",0X2E8758EE)
		self.人物怒条=资源:载入('wzife.wdf',"网易WDF动画",0X2E8758EE)
		self.人物经条=资源:载入('wzife.wdf',"网易WDF动画",0X2E8758EE)
		--=================================
		self.bb血条=资源:载入('wzife.wdf',"网易WDF动画",0X2E8758EE)
		self.bb蓝条=资源:载入('wzife.wdf',"网易WDF动画",0X2E8758EE)
		self.bb经条=资源:载入('wzife.wdf',"网易WDF动画",0X2E8758EE)
		self.人物tx背景_= 资源:载入('wzife.wdf',"网易WDF动画",0x360B8373)
		self.宠物tx背景_= 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B)
	end
end

function 系统类_人物框:加入小图标信息(方式,边框,提示信息,提示附加,变量,图标)
	if self.图标组[方式] == nil then
		local  qzy = 取界面小图标(图标)
		local  qzy2 = 取界面小图标外框(边框)
		if qzy[1] ~= nil and qzy[2] ~= nil and qzy[3] ~= nil  then
			self.图标组[方式] = {
			小图标 = 引擎.场景.资源:载入(qzy[3],"网易WDF动画",qzy[1]) ,
			大图标 = 引擎.场景.资源:载入(qzy[3],"网易WDF动画",qzy[2]) ,
			小边框 = 引擎.场景.资源:载入(qzy2[3],"网易WDF动画",qzy2[1]) ,
			大边框 = 引擎.场景.资源:载入(qzy2[3],"网易WDF动画",qzy2[2]) ,
			提示 = 提示信息,
			附加 = 提示附加,
			变量 = 变量 ,
			类型 =方式 }
		end
	else
	 	self:刷新小图标信息(方式,变量)
	end
end

function 系统类_人物框:删除小图标信息(方式)
	if self.图标组[方式] ~= nil then
		self.图标组[方式] = nil
	end
end

function 系统类_人物框:刷新小图标信息(方式,变量)
	if self.图标组[方式] ~= nil then
		self.图标组[方式].变量 = 变量
	end
end

function 系统类_人物框:显示(dt,x,y)
	self.焦点 = false
	if tp.队伍[1] ~= nil then
		if tp.队伍[1].最大经验 < 0 then
			tp.队伍[1].最大经验 = tp:取经验(1,tp.队伍[1].等级)
		end
		if tp.队伍[1].当前经验 < 0 then
			tp.队伍[1].当前经验 = tp.队伍[1].最大经验
		end
		if tp.队伍[1].参战宝宝.名称 ~= nil then
			if tp.队伍[1].参战宝宝.最大经验 < 0 then
				tp.队伍[1].参战宝宝.最大经验 = tp:取经验(2,tp.队伍[1].参战宝宝.等级)
			end
			if tp.队伍[1].参战宝宝.当前经验 < 0 then
				tp.队伍[1].参战宝宝.当前经验 = tp.队伍[1].参战宝宝.最大经验
			end
		end
	end
	if #tp.队伍数据 >= 1 and not tp.战斗中 then
		for i=1,#tp.队伍数据 do
			if self.记忆角色[i+1] == nil or self.记忆角色[i+1] ~= tp.队伍数据[i].模型 then
				local x = tx(tp.队伍数据[i].模型)
				self.人物头像背景[i+1] = 按钮(tp.资源:载入(x[7],"网易WDF动画",x[2]),0,0,1)
				self.记忆角色[i+1] = tp.队伍数据[i].模型
			end
			tp.人物头像背景_:显示(全局游戏宽度-245-i*51,2+2)
			self.人物头像背景[i+1]:更新(x,y)
			self.人物头像背景[i+1]:显示(全局游戏宽度-245-i*51+3,5,true)
			-- if self.人物头像背景[i+1]:事件判断() and not tp.战斗中 then
				-- if tp.队伍数据[i].id ~= tp.队伍[1].数字id then
				-- 	if tp.窗口.玩家信息.可视 == false then
				-- 		tp.窗口.玩家信息:打开(tp.队伍数据[i].名称,tp.队伍数据[i].id,tp.队伍数据[i].模型)


				-- 	else
				-- 		tp.窗口.玩家信息:刷新信息(tp.队伍数据[i].名称,tp.队伍数据[i].id,tp.队伍数据[i].模型)
				-- 	end
				-- end
			if self.人物头像背景[i+1]:事件判断() and not tp.战斗中 then
				if tp.队伍数据[i].id ~= tp.队伍[1].数字id then
					if     tp.窗口.玩家信息.可视 == false and tp.鼠标.取当前()=="给予" then
						   发送数据(3716,{id=tp.队伍数据[i].id})
						   tp.鼠标.还原鼠标()
					elseif tp.窗口.玩家信息.可视 == false and tp.鼠标.取当前()=="交易" then
						   发送数据(3718,{id=tp.队伍数据[i].id})
						   tp.鼠标.还原鼠标()
					elseif tp.窗口.玩家信息.可视 == false and tp.鼠标.取当前()=="普通" then
						   tp.窗口.玩家信息:打开(tp.队伍数据[i].名称,tp.队伍数据[i].id,tp.队伍数据[i].模型)
						   tp.窗口.玩家信息:刷新信息(tp.队伍数据[i].名称,tp.队伍数据[i].id,tp.队伍数据[i].模型)
					end
				end

			elseif self.人物头像背景[i+1]:是否选中(x,y) and 引擎.鼠标弹起(1) and not tp.战斗中   then-----切换角色--分角色--右键人物框--右键头像
						发送数据(2025,{助战编号=i})


					    -- tp.窗口.助战仓库.可视=false
						tp.窗口.助战道具栏.可视=false
						tp.窗口.助战宝宝查看.可视=false
						tp.窗口.助战修炼学习.可视=false
						tp.窗口.助战技能学习.可视=false
						tp.窗口.经脉流派.可视=false
						tp.窗口.助战详情.可视=false
			end
		end




		for i=1,#tp.队伍 do
			if self.人物头像背景[i+1]:是否选中(x,y) then
				self.焦点 = true
				break
			end
		end
	end




	if self.记忆角色[1] ~= tp.队伍[1].模型 then
		local s = tx(tp.队伍[1].模型)
		self.人物头像背景[1] = 按钮(tp.资源:载入(s[7],"网易WDF动画",s[2]),0,0,1)
		self.记忆角色[1] = tp.队伍[1].模型
		s = nil
	end
	self.人物tx背景_:显示(全局游戏宽度-120,0+2)
	-- tp.人物头像背景_:显示(全局游戏宽度-120,0+2)
	self.背景:显示(全局游戏宽度-68,0+2)
	self.背景:显示(全局游戏宽度-68,13+2)
	self.背景:显示(全局游戏宽度-68,26+2)
	self.背景:显示(全局游戏宽度-68,39+2)
	self.气血:置区域(0,0,min(floor(tp.队伍[1].气血 / tp.队伍[1].最大气血 * (50+self.xiuz)),50+self.xiuz),8)
	self.气血上限:置区域(0,0,min(floor(tp.队伍[1].气血上限 / tp.队伍[1].最大气血 * (50+self.xiuz)),50+self.xiuz),8)
	self.魔法:置区域(0,0,min(floor(tp.队伍[1].魔法 / tp.队伍[1].最大魔法 * (50+self.xiuz)),50+self.xiuz),8)
	self.愤怒:置区域(0,0,min(floor(tp.队伍[1].愤怒 / 150 * (50+self.xiuz)),50+self.xiuz),8)
	self.经验:置区域(0,0,min(floor(tp.队伍[1].当前经验 / tp.队伍[1].最大经验 * (50+self.xiuz)),50+self.xiuz),8)
	if self.人物头像背景[1]:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"快捷键:ALT+W")
	end
	self.人物头像背景[1]:更新(x,y)

	self.人物头像背景[1]:显示(全局游戏宽度-117,3+2,true)
	self.气血底图:显示(全局游戏宽度-56,3+2)
	self.人物血条:显示(全局游戏宽度-56-12,0+2)
	self.人物蓝条:显示(全局游戏宽度-56-12,13+2)
	self.人物怒条:显示(全局游戏宽度-56-12,26+2)
	self.人物经条:显示(全局游戏宽度-56-12,39+2)
	self.气血上限:显示(全局游戏宽度-56,3+2)
	self.气血:显示(全局游戏宽度-56,3+2)
	self.魔法:显示(全局游戏宽度-56,16+2)
	self.愤怒:显示(全局游戏宽度-56,29+2)
	self.经验:显示(全局游戏宽度-56,42+2)
	if self.人物血条:是否选中(x,y) and not tp.选中UI then
		tp.提示:自定义(x-42,y+27,format("#Y/气血：%d/%d/%d",tp.队伍[1].气血,tp.队伍[1].气血上限,tp.队伍[1].最大气血))
		if mouseb(1) and not tp.战斗中 and not tp.消息栏焦点 then
			发送数据(3727,{类型=1})
			--self:快捷吃药(1)
		end
	elseif self.人物蓝条:是否选中(x,y) and not tp.选中UI then
		tp.提示:自定义(x-42,y+27,format("#Y/魔法：%d/%d",tp.队伍[1].魔法,tp.队伍[1].最大魔法))
		if mouseb(1) and not tp.战斗中 and not tp.消息栏焦点 then
			发送数据(3728,{类型=1})
		end
	elseif self.人物怒条:是否选中(x,y) and not tp.选中UI then
		tp.提示:自定义(x-42,y+27,format("#Y/愤怒：%d/150",tp.队伍[1].愤怒))
	elseif self.人物经条:是否选中(x,y) and not tp.选中UI then
		tp.提示:自定义(x-42,y+27,format("#Y/经验：%s/%s",tp.队伍[1].当前经验,tp.队伍[1].最大经验))
	end
	local xx = 0
	local yy = 0
	for k,v in pairs(self.图标组) do
		if self.图标组[k] ~= nil then
			if xx == 4 then
				xx = 0
				yy = 1
			end
			self.图标组[k].小边框:显示(全局游戏宽度-118+xx*30,58+yy*26)
			self.图标组[k].小图标:显示(全局游戏宽度-118+xx*30+4,58+4+yy*26)
			if self.图标组[k].小图标:是否选中(x,y) and not tp.选中UI then
				tp.提示:小图标提示(x-42,y+27,self.图标组[k].大边框,self.图标组[k].大图标,format("#W/%s%d",self.图标组[k].提示,self.图标组[k].变量),self.图标组[k].附加)
			end
			-- if self.图标组[k].变量 <= 0 then
			-- 	self:删除小图标信息(k)
			-- end
			xx = xx + 1
		end
	end
	self.宠物tx背景_:显示(全局游戏宽度-230,0+2)
	-- tp.宠物头像背景_:显示(全局游戏宽度-230,0+2)
	self.背景:显示(全局游戏宽度-190,0+2)
	self.背景:显示(全局游戏宽度-190,13+2)
	self.背景:显示(全局游戏宽度-190,26+2)
	local cz = tp.队伍[1].参战宝宝
	if cz.名称 ~= nil then
		if self.记忆角色[7] ~= cz.模型 then
			local n = tx(cz.模型)
			self.宝宝头像背景 = 按钮(tp.资源:载入(n[7],"网易WDF动画",n[1]),0,0,1)
			self.记忆角色[7] = cz.模型
		end
		-- if cz.当前经验 >= cz.最大经验 and cz.等级 <= tp.队伍[1].等级+5 then
			--cz:升级()
		-- end
		self.气血:置区域(0,0,min(floor(cz.气血 / cz.最大气血 * (50+self.xiuz)),50+self.xiuz),8)
		self.魔法:置区域(0,0,min(floor(cz.魔法 / cz.最大魔法 * (50+self.xiuz)),50+self.xiuz),8)
		self.经验:置区域(0,0,min(floor(cz.当前经验 / cz.最大经验 * (50+self.xiuz)),50+self.xiuz),8)
		self.气血底图:显示(全局游戏宽度-178,3+2)
		 self.bb血条:显示(全局游戏宽度-178-12,0+2)
		 self.bb蓝条:显示(全局游戏宽度-178-12,13+2)
		 self.bb经条:显示(全局游戏宽度-178-12,26+2)
		self.气血:显示(全局游戏宽度-178,3+2)
		self.魔法:显示(全局游戏宽度-178,16+2)
		self.经验:显示(全局游戏宽度-178,29+2)
		if self.bb血条:是否选中(x,y) and not tp.选中UI then
			tp.提示:自定义(x-42,y+27,format("#Y/气血：%d/%d",cz.气血,cz.最大气血))
			if mouseb(1) and not tp.战斗中 and not tp.消息栏焦点 then
				--self:快捷吃药(1)
				发送数据(3727,{类型=2})
			end
		elseif self.bb蓝条:是否选中(x,y) and not tp.选中UI then
			tp.提示:自定义(x-42,y+27,format("#Y/魔法：%d/%d",cz.魔法,cz.最大魔法))
			if mouseb(1) and not tp.战斗中 and not tp.消息栏焦点 then

			 发送数据(3728,{类型=2})
			end
		elseif self.bb经条:是否选中(x,y) and not tp.选中UI then
			tp.提示:自定义(x-42,y+27,format("#Y/经验：%s/%s",cz.当前经验,cz.最大经验))
		end
	else
		if self.记忆角色[7] ~= false then
			self.宝宝头像背景 = 按钮(tp.资源:载入("wzife.wdf","网易WDF动画",0xCEC838D7),0,0,1)
			self.记忆角色[7] = false
		end
	end
	self.宝宝头像背景:更新(x,y)
	if self.人物头像背景[1]:事件判断() then
		if tp.战斗中 then
		    tp.窗口.人物状态栏:打开()
		else
			if tp.窗口.人物状态栏.可视==false then
				发送数据(7)
			else
				tp.窗口.人物状态栏:打开()
			end
		end
	elseif self.宝宝头像背景:事件判断() then--and not tp.战斗中 then
		if tp.战斗中 then
		    tp.窗口.召唤兽属性栏:打开()
		else
			if tp.窗口.召唤兽属性栏.可视==false then
			    发送数据(5001)
			else
			    tp.窗口.召唤兽属性栏:打开()
			end
		end
	end

	if self.宝宝头像背景:是否选中(x,y) then
		tp.提示:自定义(x-42,y+27,"快捷键:ALT+O")--########################################################?自己修改?##########################################
	end
	self.宝宝头像背景:显示(全局游戏宽度-227,3+2,true)
end








function 系统类_人物框:快捷吃药(方式)

	if 1==1 then return  end
	local qs = 取指定物品数量
	local sq = 物品失去
	if 方式 == 1 then
		if tp.队伍[1].气血 == tp.队伍[1].最大气血 then
			return
		end
		local js = tp.队伍[1].最大气血 - tp.队伍[1].气血
		local 优先 = {"包子"}
		local 次优先 = {"四叶花"}
		local 次2优先 = {"熊胆","血色茶花","天青地白","天不老","紫石英","鹿茸","六道轮回","凤凰尾","硫磺草","龙之心屑","火凤之睛"}
		local 次3优先 = {"金创药","金香玉","小还丹","千年保心丹"}
		-- 先算出最大需要多少，在算出目前有多少，如果大于则吃完，小于则吃完当前的
		for i=1,#优先 do
			local sl = qs(优先[i])
			if sl > 0 then
				local bc = qwp(优先[i])
				local zd = ceil(js/bc.气血)
				if sl >= zd then
				   local zz = bc.气血 * zd
				   tp.队伍[1].气血 = min(tp.队伍[1].气血 + zz,tp.队伍[1].最大气血)
				   sq(优先[i],zd)
				else
				   local zz = bc.气血 * sl
				   tp.队伍[1].气血 = min(tp.队伍[1].气血 + zz,tp.队伍[1].最大气血)
				   sq(优先[i],sl)
				end
			end
			if tp.队伍[1].气血 == tp.队伍[1].最大气血 then
				return
			end
		end
		for i=1,#次优先 do
			local sl = qs(次优先[i])
			if sl > 0 then
				local bc = qwp(次优先[i])
				local zd = ceil(js/bc.气血)
				if sl >= zd then
				   local zz = bc.气血 * zd
				   tp.队伍[1].气血 = min(tp.队伍[1].气血 + zz,tp.队伍[1].最大气血)
				   sq(次优先[i],zd)
				else
				   local zz = bc.气血 * sl
				   tp.队伍[1].气血 = min(tp.队伍[1].气血 + zz,tp.队伍[1].最大气血)
				   sq(次优先[i],sl)
				end
			end
			if tp.队伍[1].气血 == tp.队伍[1].最大气血 then
				return
			end
		end
		for i=1,#次2优先 do
			local sl = qs(次2优先[i])
			if sl > 0 then
				local bc = qwp(次2优先[i])
				local zd = ceil(js/bc.气血)
				if sl >= zd then
				   local zz = bc.气血 * zd
				   tp.队伍[1].气血 = min(tp.队伍[1].气血 + zz,tp.队伍[1].最大气血)
				   sq(次2优先[i],zd)
				else
				   local zz = bc.气血 * sl
				   tp.队伍[1].气血 = min(tp.队伍[1].气血 + zz,tp.队伍[1].最大气血)
				   sq(次2优先[i],sl)
				end
			end
			if tp.队伍[1].气血 == tp.队伍[1].最大气血 then
				return
			end
		end
		for i=1,#次3优先 do
			local sl = qs(次3优先[i])
			if sl > 0 then
				local bc = qwp(次3优先[i])
				local zd = ceil(js/bc.气血)
				if sl >= zd then
				   local zz = bc.气血 * zd
				   tp.队伍[1].气血 = min(tp.队伍[1].气血 + zz,tp.队伍[1].最大气血)
				   sq(次3优先[i],zd)
				else
				   local zz = bc.气血 * sl
				   tp.队伍[1].气血 = min(tp.队伍[1].气血 + zz,tp.队伍[1].最大气血)
				   sq(次3优先[i],sl)
				end
			end
			if tp.队伍[1].气血 == tp.队伍[1].最大气血 then
				return
			end
		end
	elseif 方式 == 2 then
		if tp.队伍[1].魔法 == tp.队伍[1].最大魔法 then
			return
		end
		local js = tp.队伍[1].最大魔法 - tp.队伍[1].魔法
		local 优先 = {"紫丹罗","佛手","旋复花","百色花","香叶","龙须草","灵脂","白玉骨头","曼佗罗花"}
		local 次优先 = {"丁香水","月星子","仙狐涎","地狱灵芝","麝香","血珊瑚","餐风饮露","白露为霜","孔雀红","天龙水"}
		local 次2优先 = {"麝香","风水混元丹","定神香","蛇蝎美人"}
		local 次3优先 = {}
		-- 先算出最大需要多少，在算出目前有多少，如果大于则吃完，小于则吃完当前的
		for i=1,#优先 do
			local sl = qs(优先[i])
			if sl > 0 then
				local bc = qwp(优先[i])
				local zd = ceil(js/bc.魔法)
				if sl >= zd then
				   local zz = bc.魔法 * zd
				   tp.队伍[1].魔法 = min(tp.队伍[1].魔法 + zz,tp.队伍[1].最大魔法)
				   sq(优先[i],zd)
				else
				   local zz = bc.魔法 * sl
				   tp.队伍[1].魔法 = min(tp.队伍[1].魔法 + zz,tp.队伍[1].最大魔法)
				   sq(优先[i],sl)
				end
			end
			if tp.队伍[1].魔法 == tp.队伍[1].最大魔法 then
				return
			end
		end
		for i=1,#次优先 do
			local sl = qs(次优先[i])
			if sl > 0 then
				local bc = qwp(次优先[i])
				local zd = ceil(js/bc.魔法)
				if sl >= zd then
				   local zz = bc.魔法 * zd
				   tp.队伍[1].魔法 = min(tp.队伍[1].魔法 + zz,tp.队伍[1].最大魔法)
				   sq(次优先[i],zd)
				else
				   local zz = bc.魔法 * sl
				   tp.队伍[1].魔法 = min(tp.队伍[1].魔法 + zz,tp.队伍[1].最大魔法)
				   sq(次优先[i],sl)
				end
			end
			if tp.队伍[1].魔法 == tp.队伍[1].最大魔法 then
				return
			end
		end
		for i=1,#次2优先 do
			local sl = qs(次2优先[i])
			if sl > 0 then
				local bc = qwp(次2优先[i])
				local zd = ceil(js/bc.魔法)
				if sl >= zd then
				   local zz = bc.魔法 * zd
				   tp.队伍[1].魔法 = min(tp.队伍[1].魔法 + zz,tp.队伍[1].最大魔法)
				   sq(次2优先[i],zd)
				else
				   local zz = bc.魔法 * sl
				   tp.队伍[1].魔法 = min(tp.队伍[1].魔法 + zz,tp.队伍[1].最大魔法)
				   sq(次2优先[i],sl)
				end
			end
			if tp.队伍[1].魔法 == tp.队伍[1].最大魔法 then
				return
			end
		end
		for i=1,#次3优先 do
			local sl = qs(次3优先[i])
			if sl > 0 then
				local bc = qwp(次3优先[i])
				local zd = ceil(js/bc.魔法)
				if sl >= zd then
				   local zz = bc.魔法 * zd
				   tp.队伍[1].魔法 = min(tp.队伍[1].魔法 + zz,tp.队伍[1].最大魔法)
				   sq(次3优先[i],zd)
				else
				   local zz = bc.魔法 * sl
				   tp.队伍[1].魔法 = min(tp.队伍[1].魔法 + zz,tp.队伍[1].最大魔法)
				   sq(次3优先[i],sl)
				end
			end
			if tp.队伍[1].魔法 == tp.队伍[1].最大魔法 then
				return
			end
		end
	end
end

function 系统类_人物框:检查点(x,y)
	return 矩阵:检查点(x,y) or self.焦点
end

return 系统类_人物框