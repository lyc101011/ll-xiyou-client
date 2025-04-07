-- @Author: baidwwy
-- @Date:   2024-12-14 19:52:27
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-04-07 22:17:25
-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-26 12:27:04
local 系统类_时辰 = class()
local floor = math.floor
local ARGB = ARGB
local require = require
local 矩阵 = require("gge包围盒")(0,0,115,95)
local tp
local zt
local format = string.format
local keytq = 引擎.按键弹起
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下

function 系统类_时辰:初始化(根)
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	self.序列=1
	self.屏蔽 = false
	self.地图 = nil
	self.偏移 = nil
	self.计时 = 0
	self.计次 = 150
	self.隐藏图标=true
	self.昼夜=1
	self.天气=0
	tp = 根
	zt = require("gge文字类").创建(nil,15,false,true,false)
	local g = {0xB9FD3C98,0xFE026DC3,0xCDB4C444,0xDFE4105D,0xA66B9C4,0x5A94EB4C,0xD2A6E5EC,0xEEADB7F5,0x399E1F40,0x6FFBDFD8,0xDEBA9F52,0x49D3DE80}
	self.时辰={}
	for n=1,12 do
	self.时辰[n]=资源:载入('common/wzife.wdf',"网易WDF动画",g[n])
	end
	self.梦幻指引 = 按钮.创建(资源:载入('wzife.wd2',"网易WDF动画",0xF102F42D),0,0,4)
	self.帮战报 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1714563470),0,0,1,true)
    self.导航 = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x30712485),0,0,4) --导航
	self.世界 = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0xCA5242C2),0,0,4)
	self.日历 = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0xAD514E92),0,0,4)
	self.查询 = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x6ECBCED7),0,0,4) --放大镜
	self.白昼 = 资源:载入('common/wzife.wdf',"网易WDF动画",0xAA23B98F)
	self.黑昼 = 资源:载入('common/wzife.wdf',"网易WDF动画",0x82DB3814)
	self.起风 =资源:载入('common/wzife.wdf',"网易WDF动画",0x50578CFA)
	self.下雨 =资源:载入('common/wzife.wdf',"网易WDF动画",0xB21A8CFA)
	self.下雪 =资源:载入('common/wzife.wdf',"网易WDF动画",0xB2B98CFA)
	self.下雨特效 = 资源:载入('mapani.wdf',"网易WDF动画",0x71C42D59)
	self.打雷特效 = 资源:载入('mapani.wdf',"网易WDF动画",1800426471)
	self.起风特效 = 资源:载入('mapani.wdf',"网易WDF动画",0xC8697349)
	self.风吹云彩 = 资源:载入('mapani.wdf',"网易WDF动画",0xF12D26BF)
	self.下雪特效 = 资源:载入('addon.wdf',"网易WDF动画",0x98300C2D)
	self:qiehuan(全局界面风格)
	self.图标1 = 按钮.创建(资源:载入('登陆资源.wdf',"网易WDF动画",0x99998889),0,0,1,true)
	self.图标2 = 按钮.创建(资源:载入('沉默.wdf',"网易WDF动画",0x10000002),0,0,1,true)
	self.图标3 = 按钮.创建(资源:载入('沉默.wdf',"网易WDF动画",0x10000003),0,0,1,true)----仓库
	self.图标4 = 按钮.创建(资源:载入('item.wd1',"网易WDF动画",0x071DCD9F),0,0,1,true)   --GM工具
	self.图标5 = 按钮.创建(根.资源:载入('sjm.wdf',"网易WDF动画",0x10000380),0,0,4,true)
	self.图标6 = 按钮.创建(资源:载入('沉默.wdf',"网易WDF动画",0x10000006),0,0,1,true)
	self.图标7 = 按钮.创建(资源:载入('登陆资源.wdf',"网易WDF动画",0xDDDD5C23),0,0,1,true) --全服抽奖图标
	self.图标8 = 按钮.创建(资源:载入('沉默.wdf',"网易WDF动画",0x00000021),0,0,1,true)
	-- self.图标9 =按钮.创建(资源:载入('common/item.wdf',"网易WDF动画",2932859338),0,0,1,true)----分角色
	self.图标9 =按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xDDDD99DC),0,0,1,true)----分角色
	self.图标10 =按钮.创建(资源:载入('沉默.wdf',"网易WDF动画",0x10000000),0,0,1,true)   --图鉴
	-- self.图标11 =按钮.创建(资源:载入('沉默.wdf',"网易WDF动画",0x10000004),0,0,1,true)   --回收图鉴
	self.隐藏 = 按钮.创建(资源:载入('沉默.wdf',"网易WDF动画",0x10000007),0,0,1,true)
	self.神兵异兽榜 = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x3C48DED5),0,0,1,true) ---神兵异兽榜 0x3C48DED5
	self.十八奇技 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xD30FC952),0,0,1,true) ---十八奇技
	self.战前施法 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x9F885A60),0,0,1,true) ---战前施法
	self.精炼系统 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xB48A9B3D),0,0,1,true) ---战前施法

end
function 系统类_时辰:qiehuan(风格)
	local 按钮 = tp._按钮
	local 资源 = tp.资源
	if  风格=="国韵" then
		self.背景 = 资源:载入('common/uigy.wdf',"网易WDF动画",4138033197)
		self.收缩 = 按钮.创建(资源:载入('common/uigy.wdf',"网易WDF动画",1817603562),0,0,4)
	elseif  风格=="水晶" then
		self.背景 = 资源:载入('common/uisj.wdf',"网易WDF动画",4138033197)
		self.收缩 = 按钮.创建(资源:载入('common/uisj.wdf',"网易WDF动画",1817603562),0,0,4)
	else
		self.背景 = 资源:载入('common/wzife.wdf',"网易WDF动画",0xF6A5602D)
		self.收缩 = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x6EDD4D71),0,0,4)
	end
end
function 系统类_时辰:刷新()
	self.地图 = 取地图名称(tp.当前地图)
	self.偏移 = 60 - #self.地图*3.72
end
function 系统类_时辰:显示(dt,x,y)
	if 矩阵:检查点(x,y) then
		tp.选中UI = true
	end
	self.下雪特效:更新(dt)
	self.起风特效:更新(dt)
	self.风吹云彩:更新(dt)
	self.下雨特效:更新(dt)
	self.打雷特效:更新(dt)
	self.背景:显示(0,0 )
	self.收缩:更新(x,y)
	self.收缩:显示(10,49)
	self.世界:更新(x,y)
	self.世界:显示(30,42 )
	self.日历:更新(x,y)
	self.日历:显示(120,42 )
	self.查询:更新(x,y)
	self.查询:显示(65,42 )
	self.导航:更新(x,y)
	self.导航:显示(95,42)
	     昼夜=self.昼夜
	     天气=self.天气
	if 天气开关 then
	if 天气==0 then
		self.白昼:显示(13,26 )
	elseif 天气==1 then
		self.起风:显示(13,26 )
		self.起风特效:显示(700,500)
		self.起风特效:显示(600,400)
		self.起风特效:显示(500,300)
		self.起风特效:显示(400,200)
		self.起风特效:显示(300,100)
		self.起风特效:显示(x,y)
		-- self.风吹云彩:显示(400,0)
		-- self.风吹云彩:显示(440,50)
		-- self.风吹云彩:显示(480,75)
		-- self.风吹云彩:显示(520,100)
		-- self.风吹云彩:显示(560,130)
	elseif 天气==2 then
		self.下雨:显示(13,26 )
		local x=math.random(1,500)
		local y=math.random(1,500)
		self.下雨特效:显示(50,200 )
		self.下雨特效:显示(400,200 )
		-- self.打雷特效:显示(x,y )
	elseif 天气==3 then
		self.下雪:显示(13,26 )
		self.下雪特效:显示(200,100 )
		self.下雪特效:显示(200,300 )
		self.下雪特效:显示(200,500 )
		self.下雪特效:显示(500,100 )
		-- self.下雪特效:显示(500,300 )
		-- self.下雪特效:显示(500,500 )
		self.下雪特效:显示(800,100 )
		self.下雪特效:显示(800,300 )
		self.下雪特效:显示(800,500 )
	end
	end
	self.时辰[self.序列]:显示(39,7.5)
   if not tp.战斗中 then
   	self.隐藏:更新(x,y)
   	self.隐藏:显示(-4,95)
    if self.隐藏图标 and not tp.武神坛角色 then
		self.图标1:更新(x,y)
		self.图标2:更新(x,y)
		self.图标3:更新(x,y)
		if tp.队伍~=nil and tp.队伍[1]~=nil and tp.队伍[1].GM管理员~=nil then
			self.图标4:更新(x,y)
		end
		self.图标5:更新(x,y)
		self.图标6:更新(x,y)
		self.图标7:更新(x,y)  --抽奖
		self.图标8:更新(x,y)
		self.图标9:更新(x,y)
		self.图标10:更新(x,y)
		-- self.图标11:更新(x,y)
		self.神兵异兽榜:更新(x,y)
		self.十八奇技:更新(x,y)
		self.战前施法:更新(x,y)
		-- if tp.队伍~=nil and tp.队伍[1]~=nil and tp.队伍[1].GM管理员~=nil then
		-- 	self.图标4:显示(200,5)
		-- end--这是管理员令牌图标
self.精炼系统:更新(x,y)
		if not tp.武神坛角色 then
			self.图标1:显示(15+80,60)---藏宝阁
			self.图标10:显示(15,70)---宝宝图鉴
			self.图标6:显示(15+30,70)----VIP
			self.图标7:显示(15+21,70+30)-----抽奖
			self.图标8:显示(15,70+40)----挂机
			-- self.图标5:显示(15+30+2,70+40)---进化系统图标 ----------待开放
			-- self.图标11:显示(14,110+40)---回收技能图鉴
		    self.图标9:显示(15+30+30,70+37)---分角色
		    self.神兵异兽榜:显示(15+30+30+3,73)---
		    self.十八奇技:显示(15+30+3,150+2)---
		    self.战前施法:显示(14,110+40)---
		    -- self.图标3:显示(150,5)--- 不显示
		    self.精炼系统:显示(120,125)---
		end
    end
     if self.图标1:事件判断() then
     	if tp.窗口.藏宝阁.可视 then
			tp.窗口.藏宝阁:打开()
		else
		   发送数据(65.1)   --藏宝阁关闭
		end
     elseif self.图标2:事件判断() then
         tp.窗口.对话栏:文本("","","出售道具栏特111定物品，该功能出售的物品无法恢复！请谨慎操作！”",{"一键出售","我点错了"})

     elseif self.图标3:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.V)) and not tp.战斗中 then----换成战利品快捷键了
  		 发送数据(3832,{序列=1})
  --    	if tp.窗口.仓库类.可视 then
		-- 		tp.窗口.仓库类:打开()
		-- 	else
		-- 	发送数据(6701)
		-- end
	 elseif self.图标4:事件判断() and tp.队伍~=nil and tp.队伍[1]~=nil and tp.队伍[1].GM管理员~=nil then
	 	tp.窗口.GM功能:打开()
	 elseif self.精炼系统:事件判断() then


            发送数据(229)
     elseif self.图标5:事件判断() then
     	tp.窗口.进化宝宝:打开()
     elseif self.图标6:事件判断() then
		if tp.窗口.礼包界面.可视 then
		 	tp.窗口.礼包界面:打开()
		else
		    发送数据(121.1,{类型="累充奖励"})
		end
      elseif self.图标7:事件判断() then
      	if tp.窗口.奖池抽奖类.可视 == false then
      		发送数据(255)
      	end
      elseif self.图标8:事件判断() then
      	发送数据(550) --挂机
     elseif self.图标9:事件判断() or (keyaz(KEY.ALT) and keyax(KEY.R)) and not tp.战斗中 then

     	if tp.窗口.助战列表.可视 == false then
			发送数据(2001)
		else
			tp.窗口.助战列表:打开()
		end
     elseif self.图标10:事件判断() then
        tp.窗口.图鉴查看:打开()
  --    elseif self.图标11:事件判断() then
  --    	发送数据(195) --自动回收
		-- -- if tp.窗口.礼包界面.可视 then
		-- --  	tp.窗口.礼包界面:打开()
		-- -- else
		-- --     发送数据(121.1,{类型="首冲奖励"})
		-- -- end
     elseif self.隐藏:事件判断() then
            self.隐藏图标= not self.隐藏图标
     elseif self.神兵异兽榜:事件判断() then
     		发送数据(673,{序号1=1001,类型="武器排行"})
     elseif self.十八奇技:事件判断() then
     		发送数据(675,{参数=0,文本="门派秘技"})
     elseif self.战前施法:事件判断() then
     		发送数据(676,{shijian="打开"})


     end
   end
	-- if self.灯笼[1]:事件判断() and not tp.战斗中 then
	-- 	if tp.窗口.任务栏.可视==false then
	-- 		发送数据(10)
	-- 	else
	-- 		tp.窗口.任务栏:打开()
	-- 	end
	-- elseif self.灯笼[2]:事件判断() and not tp.战斗中 then
	-- 	tp.窗口.世界大地图:打开()
	-- elseif (self.灯笼[3]:事件判断() or keytq(KEY.TAB)) and not tp.战斗中 and not tp.消息栏焦点  then
	-- 	tp.窗口.小地图:打开(tp.当前地图)

	if self.偏移~=nil then
		zt:置颜色(黄色)
		zt:显示(75,5.5,os.date("%X", os.time()))
		local xy = "["..floor(tp.角色坐标.x/20)..","..floor(tp.角色坐标.y/20).."]"
		zt:置颜色(白色)
		zt:显示(self.偏移-12,23.5 ,self.地图..xy)
	end
	if not tp.战斗中 then
		if 帮战开关  then
		            self.帮战报:更新(x,y)
			self.帮战报:显示(5,114)
			if self.帮战报:事件判断() then
				if tp.窗口.帮战建设.可视 == false then
				    发送数据(6551)
				else
					tp.窗口.帮战建设:打开()
				end
			end
		end
		 if self.世界:是否选中(x,y) and tp.选中窗口==0 then
			tp.提示:自定义(x-42,y+27,"快捷键:ALT+M")
		elseif self.查询:是否选中(x,y) and tp.选中窗口==0 then
			tp.提示:自定义(x-42,y+27,"快捷键:Tab")
		elseif self.图标1:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
            tp.提示:自定义(x-42,y+27,"藏宝阁")
		elseif self.图标2:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
			tp.提示:自定义(x-42,y+27,"一键出售")
		elseif self.图标9:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
			tp.提示:自定义(x-42,y+27,"分角色(ALT+R)")
		elseif self.图标3:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
			tp.提示:自定义(x-42,y+27,"远程仓库")
		elseif self.图标7:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
		 	tp.提示:自定义(x-42,y+27,"全服抽奖")
		elseif self.图标10:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
		 	tp.提示:自定义(x-42,y+27,"图鉴查看")
		elseif self.图标5:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
			tp.提示:自定义(x-42,y+27,"进化界面")
		elseif self.图标6:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
			tp.提示:自定义(x-42,y+27,"VIP特权")
		elseif self.图标8:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
	        tp.提示:自定义(x-42,y+27,"挂机系统")
	    elseif self.导航:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
            tp.提示:自定义(x-42,y+27,"排行榜")
        elseif self.日历:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
            tp.提示:自定义(x-42,y+27,"玩法指引")
        -- elseif self.图标11:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
        --     tp.提示:自定义(x-42,y+27,"自动回收")
        elseif self.神兵异兽榜:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
            tp.提示:自定义(x-42,y+27,"神兵异兽榜")
        elseif self.十八奇技:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
            tp.提示:自定义(x-42,y+27,"十八奇技")
        elseif self.战前施法:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
            tp.提示:自定义(x-42,y+27,"战前施法")
        elseif self.精炼系统:是否选中(x,y) and tp.选中窗口==0 and not tp.武神坛角色 then
            tp.提示:自定义(x-42,y+27,"精炼系统")

		end
		 if self.世界:事件判断(x,y)  then
		 	tp.窗口.世界大地图:打开()
	 	elseif (self.查询:事件判断() or keytq(KEY.TAB))  and not tp.消息栏焦点  then
	 		tp.窗口.小地图:打开(tp.当前地图)
 		elseif self.日历:事件判断(x,y)  then
	 		发送数据(66)
		 end
		  if self.导航:事件判断() and not tp.战斗中 then
		if tp.窗口.排行榜.可视==false then
			发送数据(39)
		else
			tp.窗口.排行榜:打开()
        end
	end
end
end

function 系统类_时辰:检查点(x,y)
	return 矩阵:检查点(x,y)
end

return 系统类_时辰