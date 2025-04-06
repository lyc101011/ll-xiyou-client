-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:25
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-31 01:42:31
local 场景类_系统设置 = class()

local floor = math.floor
local ceil = math.ceil
local tp,zts
local insert = table.insert

function 场景类_系统设置:初始化(根)
	self.ID = 63
	self.x = 325
	self.y = 120
	self.xx = 0
	self.yy = 0
	self.注释 = "系统设置"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	tp = 根
	self.资源组 = {
		[1] = 自适应.创建(0,1,363,302,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[4] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[5] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[6] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[7] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[8] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[9] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[10] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[11] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[12] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
		[17] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"保存设置"),
		[18] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"系统设置"),
		[19] = 按钮.创建(自适应.创建(17,4,120,22,1,3),0,0,4,true,true,"切换聊天框底图"),
		[20] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"退出游戏"),
		[23] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,190,16,1),
		[24] = 自适应.创建(103,1,115,22,1,3,nil,18),--下拉框开始 --灰色
		[25] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[26] = 小型选项栏.创建(自适应.创建(8,1,115,115,3,9),"游戏窗口设置"),--下拉框结束
		[27] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,190,16,1),
		[28] = 自适应.创建(78,1,337,230,3,9),
		[29] = 自适应.创建(103,1,190,22,1,3,nil,18),
		[30] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"取消变身"),
	}
	for i=2,12 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	for i=17,20 do
		self.资源组[i]:绑定窗口_(self.ID)
		if i==19 then
		    self.资源组[i]:置偏移(2,0)
		else
			self.资源组[i]:置偏移(4,0)
		end

	end
	for i=3,12 do
		self.资源组[i]:置偏移(-3,2)
	end
	self.资源组[23]:绑定窗口_(self.ID)
	self.资源组[27]:绑定窗口_(self.ID)
	self.资源组[25]:绑定窗口_(self.ID)
	self.资源组[30]:绑定窗口_(self.ID)
	zts = tp.字体表.普通字体
	self.窗口时间 = 0
	local XXX=读配置("./config.ini","mhxy","宽度") or "1000"
	local YYY=读配置("./config.ini","mhxy","高度") or "620"
	self.游戏窗口设置= XXX.."*"..YYY
end

function 场景类_系统设置:打开()
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.资源组[3]:置打勾框(tp.音乐开启)
		self.资源组[4]:置打勾框(tp.音效开启)
		self.资源组[5]:置打勾框(tp.地图特效)
		self.资源组[6]:置打勾框(连点模式)
		self.资源组[7]:置打勾框(tp.允许加好友)
		self.资源组[8]:置打勾框(tp.允许查看装备)
		self.资源组[9]:置打勾框(tp.显示变身卡造型)
		self.资源组[10]:置打勾框(tp.显示坐骑)
		self.资源组[11]:置打勾框(低配模式)
		self.资源组[12]:置打勾框(天气开关)
		-- self.资源组[13]:置打勾框(true)
		-- self.资源组[14]:置打勾框(true)
		-- self.资源组[15]:置打勾框(true)
		-- self.资源组[16]:置打勾框(true)
		self.资源组[23]:置起始点(self.资源组[23]:取百分比转换(tp.音乐音量,0,160))
		self.资源组[27]:置起始点(self.资源组[23]:取百分比转换(tp.音效音量,0,160))
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
		if 引擎.是否全屏 then
			self.游戏窗口设置 = "全屏窗口"
		else
			self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
		end
	end
end

function 场景类_系统设置:显示(dt,x,y)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[12]:更新(x,y)
	-- self.资源组[12]:更新(x,y)
	-- self.资源组[13]:更新(x,y)
	-- self.资源组[14]:更新(x,y)
	-- self.资源组[15]:更新(x,y)
	-- self.资源组[16]:更新(x,y)
	self.资源组[17]:更新(x,y)
	-- self.资源组[18]:更新(x,y)
	self.资源组[19]:更新(x,y)
	self.资源组[20]:更新(x,y)
	-- self.资源组[21]:更新(x,y)
	-- self.资源组[22]:更新(x,y)
	self.资源组[25]:更新(x,y)
	self.资源组[30]:更新(x,y)
	if 引擎.是否全屏 then
		self.游戏窗口设置 = "全屏窗口"
	else
		self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
	end
	--########################################################?自己修改?##########################################
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[3]:事件判断() then
		tp.音乐开启 = not self.资源组[3].打勾框
		if not tp.音乐开启 then
			tp.音乐:停止()
			self.资源组[3]:置打勾框(tp.音乐开启)
			发送数据(90,{选项="音乐开启",回调=tp.音乐开启})
		else
			tp.音乐:播放()
			引擎.场景.音乐:置音量(tp.音乐音量)
			self.资源组[3]:置打勾框(tp.音乐开启)
			发送数据(90,{选项="音乐开启",回调=tp.音乐开启})
		end
	elseif self.资源组[4]:事件判断() then
		tp.音效开启 = not self.资源组[4].打勾框
		self.资源组[4]:置打勾框(tp.音效开启)
		发送数据(90,{选项="音效开启",回调=tp.音效开启})
	elseif self.资源组[5]:事件判断() then
		tp.地图特效 = not self.资源组[5].打勾框
		self.资源组[5]:置打勾框(tp.地图特效)
		发送数据(90,{选项="地图特效",回调=tp.地图特效})
	elseif self.资源组[6]:事件判断() then
		 if 连点模式 then
 			连点模式=false
 		else
			连点模式=true
 			tp.提示:写入("#Y你开启了连点模式，长按鼠标3秒后可持续给人物或召唤兽分配属性点")
  		end
  		self.资源组[6]:置打勾框(连点模式)
	elseif self.资源组[7]:事件判断() then
		tp.允许加好友 = not self.资源组[7].打勾框
		self.资源组[7]:置打勾框(tp.允许加好友)
		发送数据(90,{选项="允许加好友",回调=tp.允许加好友})
	elseif self.资源组[8]:事件判断() then
		tp.允许查看装备 = not self.资源组[8].打勾框
		self.资源组[8]:置打勾框(tp.允许查看装备)
		发送数据(90,{选项="允许查看装备",回调=tp.允许查看装备})



	elseif self.资源组[9]:事件判断() then
		tp.显示变身卡造型 = not self.资源组[9].打勾框
		self.资源组[9]:置打勾框(tp.显示变身卡造型)
		tp.场景.人物:置模型()
		发送数据(90,{选项="显示变身卡造型",回调=tp.显示变身卡造型})
	elseif self.资源组[10]:事件判断() then
		tp.显示坐骑 = not self.资源组[10].打勾框
		self.资源组[10]:置打勾框(tp.显示坐骑)
		tp.场景.人物:置模型()
		发送数据(90,{选项="显示坐骑",回调=tp.显示坐骑})
	elseif self.资源组[11]:事件判断() then
		低配模式 = not self.资源组[11].打勾框
		self.资源组[11]:置打勾框(低配模式)
		写配置("./config.ini","mhxy","低配模式",低配模式)
		if 低配模式 then
			-- 资源缓存:清空缓存()
		    tp.常规提示:打开("#Y已为您开启精简模式，已屏蔽部分非必要的场景特效。")
		else
			tp.常规提示:打开("#Y已为您关闭精简模式。")
		end
	elseif self.资源组[12]:事件判断() then
		天气开关 = not self.资源组[12].打勾框
		self.资源组[12]:置打勾框(天气开关)
		if 天气开关 then
			天气开关=false
			-- 资源缓存:清空缓存()
		   -- tp.常规提示:打开("#Y已为您开启天气开关")
		else
			天气开关=true
			--tp.常规提示:打开("#Y已为您关闭天气开关。")
		end
	elseif self.资源组[17]:事件判断() then--保存
		发送数据(90,{选项="音乐音量",回调=ceil(160*self.资源组[23]:取百分比())})
		发送数据(90,{选项="音效音量",回调=ceil(160*self.资源组[27]:取百分比())})
		tp.音乐音量=ceil(160*self.资源组[23]:取百分比())
		tp.音效音量=ceil(160*self.资源组[27]:取百分比())
		tp.常规提示:打开("#Y保存成功！")
	-- elseif self.资源组[18]:事件判断() then--重选角色
	-- 	self:打开()
	-- 	引擎.场景:登陆恢复()
	-- 	tp.进程 = 1
	-- 	系统退出=true
	-- 	客户端:断开()
	-- 	客户端:连接处理(系统参数.服务器.ip,系统参数.服务器.端口)
	elseif self.资源组[20]:事件判断() then--退出
		引擎关闭开始()
	-- elseif self.资源组[21]:事件判断() then--到主界面
	-- 	self:打开()
	-- 	引擎.场景:登陆恢复()
	-- 	tp.进程 = 1
	-- 	系统退出=true
	-- 	客户端:断开()
	-- elseif self.资源组[22]:事件判断() then--游戏团队
	-- 	tp.常规提示:打开(tostring(全局msg制作团队))
		-- __gge.messagebox(tostring(全局msg制作团队),"游戏团队",16)

		-- tp.常规提示:打开("#Y切换底图成功！")
		-- if 连点模式 then
		-- 	连点模式=false
		-- 	tp.常规提示:打开("#Y你关闭了连点模式")
		-- else
		-- 	连点模式=true
		-- 	tp.常规提示:打开("#Y你开启了连点模式，长按鼠标3秒后可持续给人物或召唤兽分配属性点")
		-- end
	elseif self.资源组[25]:事件判断() then
		local tbt = {"800*600","1024*768","全屏窗口"}
		self.资源组[26]:打开(tbt)
		self.资源组[26]:置选中(self.游戏窗口设置)
	end

	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"系统设置")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	self.资源组[28]:显示(self.x+104-91,self.y+32)
	-- 新定义
	self.资源组[17]:显示(self.x+13,self.y+397-116-10,true)
	-- self.资源组[18]:显示(self.x+14,self.y+32,true)
	self.资源组[19]:显示(self.x+150-37,self.y+397-116-10,true)
	self.资源组[20]:显示(self.x+314-45,self.y+397-116-10,true)
	-- self.资源组[21]:显示(self.x+212,self.y+214)
	-- if 连点模式 then
	-- 	self.资源组[21]:更新(dt)
	--     self.资源组[21]:显示(self.x+151,self.y+303-10)
	-- end
	-- self.资源组[21]:显示(self.x+14,self.y+65,true)
	-- self.资源组[22]:显示(self.x+14,self.y+98,true)

	local XX,YY = 104-91,33--256,99
	zts:置颜色(0xFF000000)
	zts:显示(self.x+XX+56,self.y+YY+2+5,"地图特效")
	zts:显示(self.x+XX+56,self.y+YY+55,"游戏音乐")
	zts:显示(self.x+XX+56,self.y+YY+85,"游戏音效")
	zts:显示(self.x+XX+56+72,self.y+YY+2+5,"窗口大小")

	zts:显示(self.x+XX+56,self.y+YY+115+7,"连点模式")
	zts:显示(self.x+XX+56,self.y+YY+145+7,"允许加好友")
	zts:显示(self.x+XX+56,self.y+YY+175+7,"允许查看装备")
	zts:显示(self.x+XX+206,self.y+YY+115+7,"显示变身卡造型")
	zts:显示(self.x+XX+206,self.y+YY+145+7,"显示坐骑")
	zts:显示(self.x+XX+206,self.y+YY+175+7,"精简模式（推荐）")
	zts:显示(self.x+XX+56,self.y+YY+205+7,"天气开关（推荐）")
	self.资源组[6]:显示(self.x+XX+16,self.y+YY+117,true,nil,nil,连点模式,2) --连点模式
	self.资源组[7]:显示(self.x+XX+16,self.y+YY+147,true,nil,nil,tp.允许加好友,2) --允许加好友
	self.资源组[8]:显示(self.x+XX+16,self.y+YY+177,true,nil,nil,tp.允许查看装备,2) --允许查看装备
	self.资源组[9]:显示(self.x+XX+166,self.y+YY+117,true,nil,nil,tp.显示变身卡造型,2) --显示变身卡造型
	self.资源组[10]:显示(self.x+XX+166,self.y+YY+147,true,nil,nil,tp.显示坐骑,2) --显示坐骑
	self.资源组[11]:显示(self.x+XX+166,self.y+YY+177,true,nil,nil,低配模式,2) --显示祥瑞
	self.资源组[12]:显示(self.x+XX+16,self.y+YY+207,true,nil,nil,天气开关,2) --显示祥瑞

	--==================地图特效
	self.资源组[5]:显示(self.x+XX+16,self.y+YY+2,true,nil,nil,tp.地图特效,2) --地图特效
	---===================音效类
	-- self.资源组[3]:显示(self.x+XX+16,self.y+YY+50,true)  --游戏音乐
	self.资源组[3]:显示(self.x+XX+16,self.y+YY+50,true,nil,nil,tp.音乐开启,2)
	self.资源组[4]:显示(self.x+XX+16,self.y+YY+80,true,nil,nil,tp.音效开启,2) --游戏音效
	self.资源组[29]:显示(self.x+XX+129,self.y+YY+52)
	self.资源组[29]:显示(self.x+XX+129,self.y+YY+82)
	self.资源组[23]:显示(self.x+XX+129,self.y+YY+54,x,y,self.鼠标)
	self.资源组[27]:显示(self.x+XX+129,self.y+YY+84,x,y,self.鼠标)

	---===================窗口类
	self.资源组[24]:显示(self.x+XX+129+72,self.y+4+YY)
	self.资源组[25]:显示(self.x+XX+238+57,self.y+4+YY)
	self.资源组[26]:显示(self.x+XX+129+72,self.y+YY+18+4,x,y,self.鼠标)
	self.资源组[30]:显示(self.x+314-45,self.y+397-116-10-30,true)
	zts:置颜色(白色)
	zts:显示(self.x+XX+145+72,self.y+YY+2+5,self.游戏窗口设置)


	zts:置颜色(-16777216)

	--============
	-- zts:置颜色(-256)
	-- zts:显示(self.x+314,self.y+359,"游戏素材来源于网络，\n游戏免费勿商用！")
	if self.资源组[23].接触 then--音量"
		tp.音乐音量 = ceil(160*self.资源组[23]:取百分比())
		tp.音乐:置音量(tp.音乐音量)
		self.焦点 = true
	end
	if self.资源组[27].接触 then--音量"
		tp.音效音量 = ceil(160*self.资源组[27]:取百分比())
		self.焦点 = true
	end
	if self.资源组[30]:事件判断() then
 	   发送数据(90.1)
 	end
	if self.资源组[26]:事件判断() then
		local 宽高s =self.资源组[26].弹出事件
		if 宽高s ~= "全屏窗口" then
			if 引擎.是否全屏 then
			    引擎.置全屏()
			end
			local 宽高XY =分割文本2(宽高s,"*")
			if not 判断是否数组(宽高XY) then
			    return false
			end
			local 宽高X,宽高Y=math.ceil(宽高XY[1]) or 800,math.ceil(宽高XY[2]) or 600
			            local sss=0
			             if tp.wbltk then
			               sss=__聊天框x
			               引擎.场景.窗口.消息框.丰富文本外框:置宽度(__聊天框x-5)
				   引擎.场景.窗口.消息框.外部聊天框底图:置区域(0,0,__聊天框x,宽高Y)--可以充填
			            end
			            引擎.置宽高(宽高X+sss,宽高Y)


		--	引擎.置宽高(宽高X,宽高Y)
			全局游戏宽度 = 宽高X
			全局游戏高度 = 宽高Y
			withs = 全局游戏宽度
			hegts = 全局游戏高度
			with = 全局游戏宽度/2
			hegt = 全局游戏高度/2
			写配置("./config.ini","mhxy","宽度",全局游戏宽度)
			写配置("./config.ini","mhxy","高度",全局游戏高度)
			self.游戏窗口设置 = 宽高s
		else
			if (全局游戏宽度==1024 and 全局游戏高度==768 )or(全局游戏宽度==1280 and 全局游戏高度==720 )or(全局游戏宽度==1280 and 全局游戏高度==768 )or(全局游戏宽度==1280 and 全局游戏高度==800 )  then
			    引擎.置全屏()
			    self.游戏窗口设置 = 宽高s
				if not 引擎.是否全屏 then
				    self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
				end
			end
		end
		引擎.场景.窗口.消息框:调整分辨率()
		if 全局游戏宽度==1024 then
			游戏传音.高度=150
		else
		    游戏传音.高度=0
		end
		self.资源组[26].弹出事件 = nil
	end
end

function 场景类_系统设置:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_系统设置:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
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

function 场景类_系统设置:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_系统设置








-- -- @Author: baidwwy
-- -- @Date:   2023-09-12 12:13:53
-- -- @Last Modified by:   baidwwy
-- -- @Last Modified time: 2024-08-01 01:35:26
-- --======================================================================--
-- --	☆ 作者：飞蛾扑火 QQ：1415559882
-- --======================================================================--
-- local 场景类_系统设置 = class()

-- local floor = math.floor
-- local ceil = math.ceil
-- local tp,zts
-- local insert = table.insert

-- function 场景类_系统设置:初始化(根)
-- 	self.ID = 63
-- 	self.x = 325
-- 	self.y = 120
-- 	self.xx = 0
-- 	self.yy = 0
-- 	self.注释 = "系统设置"
-- 	self.可视 = false
-- 	self.鼠标 = false
-- 	self.焦点 = false
-- 	self.可移动 = true
-- 	local 资源 = 根.资源
-- 	local 按钮 = 根._按钮
-- 	local 自适应 = 根._自适应
-- 	local 小型选项栏 = 根._小型选项栏
-- 	tp = 根
-- 	self.资源组 = {
-- 		[1] = 自适应.创建(0,1,454,398,3,9),
-- 		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
-- 		[3] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
-- 		[4] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
-- 		[10] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"系统设置"),
-- 		[11] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
-- 		[12] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"保存设置"),
-- 		[13] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"退出游戏"),
-- 		-- [14] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"外部聊天"),
-- 		[31] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
-- 		[32] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
-- 		[33] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
-- 		[34] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),
-- 		[24] = 自适应.创建(103,1,115,22,1,3,nil,18),--下拉框开始 --灰色
-- 		[26] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"游戏界面设置"),--下拉框结束
-- 		[23] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,190,16,1),
-- 		[27] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,190,16,1),
-- 		[29] = 自适应.创建(103,1,190,22,1,3,nil,18),
-- 		[30] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"取消变身"),
-- 	}
-- 	self.隐藏={}
-- 	for i=2,4 do
-- 		self.资源组[i]:绑定窗口_(self.ID)
-- 	end
-- 	for i=10,13 do
-- 		self.资源组[i]:绑定窗口_(self.ID)
-- 	end
-- 	for i=31,34 do
-- 		self.资源组[i]:绑定窗口_(self.ID)
-- 	end
-- 	self.资源组[23]:绑定窗口_(self.ID)
--     self.资源组[27]:绑定窗口_(self.ID)
--     self.资源组[30]:绑定窗口_(self.ID)
-- 	for i=1,3 do
-- 		self.隐藏[i]=资源:载入('pic/txbj.png',"图片")
-- 		self.隐藏[i]:置颜色(ARGB(1,255,255,255))
-- 	end

-- 	self.kuang=资源:载入('wdf/audio/tupian/sz1.png',"图片")
-- 	self.xuanz=资源:载入('wdf/audio/tupian/baidian.png',"图片")
-- 	self.xuanz1=资源:载入('wdf/audio/tupian/baidian.png',"图片")


-- 	zts = tp.字体表.普通字体
-- 	self.窗口时间 = 0
-- 	local XXX=读配置("./config.ini","mhxy","宽度") or "1000"
-- 	local YYY=读配置("./config.ini","mhxy","高度") or "620"
-- 	self.游戏窗口设置= XXX.."*"..YYY

-- end

-- function 场景类_系统设置:打开()
-- 	if self.可视 then
-- 		self.可视 = false
-- 	else
-- 		-- insert(tp.窗口_,self)
-- 		if tp.战斗中 then
-- 		    insert(tp.战斗窗口_,self)
-- 		else
-- 			insert(tp.窗口_,self)
-- 		end
-- 		tp.运行时间 = tp.运行时间 + 1
-- 	  	self.窗口时间 = tp.运行时间
-- 		 self.可视 = true
-- 		-- if 引擎.是否全屏 then
-- 		-- 	self.游戏窗口设置 = "全屏窗口"
-- 		-- else
-- 			self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
-- 		-- end
-- 		self.资源组[3]:置打勾框(tp.音乐开启)
-- 		self.资源组[4]:置打勾框(tp.音效开启)
-- 		self.资源组[31]:置打勾框(tp.允许查看装备)
-- 		--self.资源组[32]:置打勾框(tp.显示变身卡造型)
-- 		self.资源组[32]:置打勾框(not 变身显示)
-- 		self.资源组[33]:置打勾框(tp.显示坐骑)
-- 		self.资源组[34]:置打勾框(低配模式)
-- 		self.资源组[23]:置起始点(self.资源组[23]:取百分比转换(tp.音乐音量,0,160))
-- 	        self.资源组[27]:置起始点(self.资源组[23]:取百分比转换(tp.音效音量,0,160))
-- 	        self.x=取界面坐标(self.资源组[1].宽度)

-- 		self.wx={1,2,-2}
-- 		self.fbl=1
-- 		self:取分辨率()

-- 	end
-- end
-- function 场景类_系统设置:取分辨率()
-- 	if self.游戏窗口设置=="640*480" then
-- 		self.fbl=1
-- 	elseif self.游戏窗口设置=="800*600" then
-- 		self.fbl=2
-- 	elseif self.游戏窗口设置=="1024*768" then
-- 		self.fbl=3
-- 	end
-- end

-- function 场景类_系统设置:显示(dt,x,y)

-- 	-- if 引擎.是否全屏 then
-- 	-- 	self.游戏窗口设置 = "全屏窗口"
-- 	-- else
-- 	-- 	self.游戏窗口设置 = 全局游戏宽度.."*"..全局游戏高度
-- 	-- end

-- 	self.焦点 = false
-- 	self.资源组[2]:更新(x,y)
-- 	self.资源组[3]:更新(x,y)
-- 	self.资源组[4]:更新(x,y)
-- 	self.资源组[30]:更新(x,y)
-- 	self.资源组[1]:显示(self.x,self.y)
-- 	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
-- 	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"系统设置")
-- 	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
-- 	self.kuang:显示(self.x+105,self.y+34)
-- 	self.资源组[10]:更新(x,y)
-- 	self.资源组[10]:显示(self.x+13,self.y+34,true,nil,nil,true,2)
-- 	self.xuanz1:显示(self.x+209,self.y+119)
-- 	for i=1,3 do
-- 		self.隐藏[i]:显示(self.x+42+i*92,self.y+83)
-- 		if self.隐藏[i]:是否选中(x,y) and 引擎.鼠标弹起(左键) and not tp.战斗中 then
-- 			if self.fbl~=i then
-- 				self.fbl=i
-- 				if i==1 then
-- 					self.游戏窗口设置="640*480"
-- 				elseif i==2 then
-- 					self.游戏窗口设置="800*600"
-- 				elseif i==3 then
-- 					self.游戏窗口设置="1024*768"
-- 				end
-- 				local sdw=self.游戏窗口设置
-- 				if self.游戏窗口设置=="640*480" then
-- 				    sdw="755*560"
-- 				end
-- 				local 宽高XY =分割文本2(sdw,"*")
-- 			            if not 判断是否数组(宽高XY) then
-- 			                return false
-- 			            end
-- 			            local 宽高X,宽高Y=math.ceil(宽高XY[1]) or 800,math.ceil(宽高XY[2]) or 600


-- 			            全局游戏宽度 = 宽高X
-- 			            全局游戏高度 = 宽高Y
-- 			            local sss=0
-- 			             if tp.wbltk then
-- 			               sss=__聊天框x
-- 			               引擎.场景.窗口.消息框.丰富文本外框:置宽度(__聊天框x-5)
-- 				   引擎.场景.窗口.消息框.外部聊天框底图:置区域(0,0,__聊天框x,全局游戏高度)--可以充填
-- 			            end
-- 			            引擎.置宽高(宽高X+sss,宽高Y)
-- 			            withs = 全局游戏宽度
-- 			            hegts = 全局游戏高度
-- 			            with = 全局游戏宽度/2
-- 			            hegt = 全局游戏高度/2
-- 			            写配置("./config.ini","mhxy","宽度",全局游戏宽度)
-- 			            写配置("./config.ini","mhxy","高度",全局游戏高度)
-- 			            引擎.场景.窗口.消息框:调整分辨率()
-- 			end
-- 		end
-- 	end
-- 	self.xuanz:显示(self.x+42+6+self.wx[self.fbl]+self.fbl*92,self.y+83+11)
-- 	zts:置颜色(0xFF222222)
-- 	zts:显示(self.x+56+116-5,self.y+55+109,"游戏音乐")
-- 	zts:显示(self.x+56+116-5,self.y+85+109,"游戏音效")
-- 	zts:显示(self.x+137,self.y+158+80,"界面风格")
-- 	zts:显示(self.x+137+35,self.y+145+80+57,"屏蔽变身卡造型")
-- 	zts:显示(self.x+137+35,self.y+175+80+57,"地图特效")
-- 	zts:显示(self.x+206+35+80,self.y+145+80+57,"显示坐骑")
-- 	zts:显示(self.x+206+35+80,self.y+175+80+57,"流畅模式")
-- 	self.资源组[12]:更新(x,y)
-- 	self.资源组[13]:更新(x,y)
-- 	self.资源组[12]:显示(self.x+126,self.y+334+29)--保存
-- 	self.资源组[13]:显示(self.x+126+75+122,self.y+334+29)--退出
-- 	self.资源组[30]:显示(self.x+13,self.y+64)--取消变身
-- 	self.资源组[31]:更新(x,y)
-- 	self.资源组[32]:更新(x,y)
-- 	self.资源组[33]:更新(x,y)
-- 	self.资源组[34]:更新(x,y)
-- 	--self.资源组[32]:显示(self.x+137,self.y+145+77+57,true,nil,nil,tp.显示变身卡造型,2) --显示变身卡造型
-- 	self.资源组[32]:显示(self.x+137,self.y+145+77+57,true,nil,nil,not 变身显示,2)
-- 	self.资源组[31]:显示(self.x+137,self.y+175+77+57,true,nil,nil,tp.允许查看装备,2) --允许查看装备
-- 	self.资源组[33]:显示(self.x+206+80,self.y+145+77+57,true,nil,nil,tp.显示坐骑,2) --显示坐骑
-- 	self.资源组[34]:显示(self.x+206+80,self.y+175+77+57,true,nil,nil,低配模式,2) --显示祥瑞
--  self.资源组[3]:显示(self.x+137,self.y+50+110,true,nil,nil,tp.音乐开启,2)
-- 	self.资源组[4]:显示(self.x+137,self.y+80+110,true,nil,nil,tp.音效开启,2) --游戏音效
-- 	self.资源组[29]:显示(self.x+129+116-10,self.y+52+108)
-- 	self.资源组[29]:显示(self.x+129+116-10,self.y+82+108)
-- 	self.资源组[23]:显示(self.x+129+116-10,self.y+54+108,x,y,self.鼠标)
-- 	self.资源组[27]:显示(self.x+129+116-10,self.y+84+108,x,y,self.鼠标)
-- 	self.资源组[24]:显示(self.x+210,self.y+155+80)
-- 	 self.资源组[11]:更新(x,y)
-- 	 self.资源组[11]:显示(self.x+213-30+122,self.y+155+80)
-- 	 self.资源组[26]:显示(self.x+129+72+27-17,self.y+18+4+151+80,x,y,self.鼠标)
-- 	 if self.资源组[23].接触 then--音量"
-- 		tp.音乐音量 = ceil(160*self.资源组[23]:取百分比())
-- 		if tp.战斗中 then
-- 			tp.战斗音乐:置音量(tp.音乐音量)
-- 		else
-- 		    tp.音乐:置音量(tp.音乐音量)
-- 		end
-- 		self.焦点 = true
-- 	end
-- 	if self.资源组[27].接触 then--音量"
-- 		tp.音效音量 = ceil(160*self.资源组[27]:取百分比())
-- 		self.焦点 = true
-- 	end
-- 	if self.资源组[11]:事件判断() then
-- 	    local tbt = {"经典","国韵","水晶"}
-- 	    self.资源组[26]:打开(tbt)
-- 	    self.资源组[26]:置选中(全局界面风格)
-- 	end
-- 	if self.资源组[30]:事件判断() then
-- 	   发送数据(90.1)
-- 	end
-- 	 if self.资源组[2]:事件判断() then
-- 	    self:打开()
-- 	    return
-- 	elseif self.资源组[3]:事件判断() then
-- 	    tp.音乐开启 = not self.资源组[3].打勾框
-- 	    if not tp.音乐开启 then
-- 	    	if tp.战斗中 then
-- 			tp.战斗音乐:销毁()
-- 	    	else
-- 	    		tp.音乐:停止()
-- 	    	end
-- 		self.资源组[3]:置打勾框(tp.音乐开启)
-- 		发送数据(90,{选项="音乐开启",回调=tp.音乐开启})
-- 	    else
-- 	    	if tp.战斗中 then
-- 			tp:战斗音乐类(wdf配置.."/Audio/战斗"..Zhandouyy..".mp3")
-- 	    	else
-- 	    		tp.音乐:播放()
-- 			引擎.场景.音乐:置音量(tp.音乐音量)
-- 	    	end

-- 	        self.资源组[3]:置打勾框(tp.音乐开启)
-- 	        发送数据(90,{选项="音乐开启",回调=tp.音乐开启})
-- 	    end
-- 	elseif self.资源组[4]:事件判断() then
-- 	    tp.音效开启 = not self.资源组[4].打勾框
-- 	    self.资源组[4]:置打勾框(tp.音效开启)
-- 	    发送数据(90,{选项="音效开启",回调=tp.音效开启})
-- 	elseif self.资源组[26]:事件判断() then
-- 		local 风格 =self.资源组[26].弹出事件
-- 		全局界面风格=风格
-- 		全局切换界面()
-- 		self.资源组[26].弹出事件 = nil
-- 		写配置("./config.ini","mhxy","界面风格",全局界面风格)
-- 	elseif self.资源组[31]:事件判断() then
-- 		tp.允许查看装备 = not self.资源组[31].打勾框
-- 		self.资源组[31]:置打勾框(tp.允许查看装备)
-- 		-- 发送数据(90,{选项="允许查看装备",回调=tp.允许查看装备})
-- 	elseif self.资源组[32]:事件判断() then
-- 		if 变身显示 then
-- 				变身显示 = false
-- 			else
-- 				变身显示 = true
-- 			end
-- 			for i,v in pairs(tp.场景.玩家) do
-- 				tp.场景.玩家[i]:置模型()
-- 				tp.场景.玩家[i]:重新加载动画()
-- 			end
-- 			tp.场景.人物:置模型()
-- 			tp.提示:写入("#Y/玩家动画正在重新加载,请稍后.....")
-- 			self.资源组[32]:置打勾框(not 变身显示)
-- 		--[[tp.显示变身卡造型 = not self.资源组[32].打勾框
-- 		self.资源组[32]:置打勾框(tp.显示变身卡造型)
-- 		发送数据(90,{选项="显示变身卡造型",回调=tp.显示变身卡造型})--]]
-- 	elseif self.资源组[33]:事件判断() then
-- 		tp.显示坐骑 = not self.资源组[33].打勾框
-- 		self.资源组[33]:置打勾框(tp.显示坐骑)
-- 		tp.场景.人物:置模型()
-- 		发送数据(90,{选项="显示坐骑",回调=tp.显示坐骑})
-- 	elseif self.资源组[34]:事件判断() then
-- 		低配模式 = not self.资源组[34].打勾框
-- 		self.资源组[34]:置打勾框(低配模式)
-- 		写配置("./config.ini","mhxy","低配模式",低配模式)
-- 		if 低配模式 then
-- 		    -- 资源缓存:清空缓存()
-- 		    tp.常规提示:打开("#Y已为您开启流程模式，已屏蔽部分非必要的场景特效。")
-- 		else
-- 		    tp.常规提示:打开("#Y已为您关闭流程模式。")
-- 		end
-- 		collectgarbage("collect")
-- 	elseif self.资源组[12]:事件判断() then--保存
-- 		发送数据(90,{选项="音乐音量",回调=ceil(160*self.资源组[23]:取百分比())})
-- 		发送数据(90,{选项="音效音量",回调=ceil(160*self.资源组[27]:取百分比())})
-- 		tp.音乐音量=ceil(160*self.资源组[23]:取百分比())
-- 		tp.音效音量=ceil(160*self.资源组[27]:取百分比())
-- 		tp.常规提示:打开("#Y保存成功！")
-- 		-- elseif self.资源组[18]:事件判断() then--重选角色
-- 		--  self:打开()
-- 		--  引擎.场景:登陆恢复()
-- 		--  tp.进程 = 1
-- 		--  系统退出=true
-- 		--  客户端:断开()
-- 		--  客户端:连接处理(Fwqcs,8084)
-- 	elseif self.资源组[13]:事件判断() then--退出
-- 		引擎关闭开始()
-- 		return
-- 	end
-- 	zts:置颜色(白色)
-- 	zts:显示(self.x+135+90,self.y+158+80,全局界面风格)




-- end

-- function 场景类_系统设置:检查点(x,y)
-- 	if self.资源组[1]:是否选中(x,y)  then
-- 		return true
-- 	end
-- end

-- function 场景类_系统设置:初始移动(x,y)
-- 	tp.运行时间 = tp.运行时间 + 1
-- 	if not 引擎.消息栏焦点 then
--   		self.窗口时间 = tp.运行时间
--  	end
-- 	if not self.焦点 then
-- 		tp.移动窗口 = true
-- 	end
-- 	if self.鼠标 and  not self.焦点 then
-- 		self.xx = x - self.x
-- 		self.yy = y - self.y
-- 	end
-- end

-- function 场景类_系统设置:开始移动(x,y)
-- 	if self.鼠标 then
-- 		self.x = x - self.xx
-- 		self.y = y - self.yy
-- 	end
-- end

-- return 场景类_系统设置