-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-01 06:21:20
local 场景类_标题 = class()
local tp
local ceil = math.ceil
local min = math.min
local max = math.max
local mouseb = 引擎.鼠标弹起
local box = 引擎.画矩形
local insert = table.insert
local remove = table.remove
require("script/初系统/游戏更新说明")
-- 983222506 互通  3318420104
--登录
--3846884224
-- 3413673092 账号密码

-- 商城 3628198473
function 场景类_标题:初始化(根)
	tp = 根
	local xx = {{0x1000307,0xEB3FD8C3,0xEC1A0419},{0x1000306,0x7BBB735E,nil}} --,{0x1000308,0x16E9D48F,0x79560528}
	local sj = 引擎.取随机整数(1,2)
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 滑块 = 根._滑块
	local 自适应 = 根._自适应
	self.右键关闭=1
	self.标题背景 = 资源:载入("org.rpk","网易WDF动画",xx[sj][1])
	self.场景覆盖 = 资源:载入('common/wzife.wdf',"网易WDF动画",xx[sj][2])
	self.场景计次 = self.场景覆盖.宽度
	self.场景覆盖:置区域(self.场景计次,0,800,600)
	self.mhxy = 资源:载入('ceshi.wdf',"网易WDF动画",3407917896)
	if xx[sj][3] ~= nil then
		self.特效覆盖 = 资源:载入('common/wzife.wdf',"网易WDF动画",xx[sj][3])
		self.特效计次 = self.特效覆盖.宽度/2+450
		self.特效覆盖:置区域(self.特效计次,0,800,600)
	end
	local dh = {0xDC739617,0x22E6E35C,0x16CC1B46,0xD8632D20}
	self.动画 = {}
	for n=1,4 do
	    self.动画[n] = 资源:载入('wzife.wdf',"网易WDF动画",dh[n])
	end
	self.文字=tp.字体表.普通字体
	self.进入游戏 = 根._按钮(资源:载入('wzife.wdf',"网易WDF动画",170160535),0,0,3,true,true)
	self.制作团队 = 根._按钮(资源:载入('wzife.wdf',"网易WDF动画",4199219397),0,0,3,true,true)
	self.退出游戏 = 根._按钮(资源:载入('wzife.wdf',"网易WDF动画",3510216958),0,0,3,true,true)
	self.互通 = 根._按钮(资源:载入('common/wzife.wdf',"网易WDF动画",983222506),0,0,1,true,true)
	self.beij=根._自适应.创建(71,1,151,53,3,9)
	-- self.进入游戏:置颜色(ARGB(230,255,255,255))
end

function 场景类_标题:显示(dt,x,y)
	if not 加载完成 then
	    return
	end
	self.标题背景:显示(-100,-200)
	-- self.内部测试:显示(111,111)
	self.场景计次 = self.场景计次 - 0.3
	self.场景覆盖:置区域(self.场景计次,0,800,600)
	self.场景覆盖:显示(0,600)
	for n=1,4 do
		self.动画[n]:更新(dt)
		self.动画[n]:显示(800-550 + (n-1) *110,600-100)
	end
	if self.特效覆盖 ~= nil then
		self.特效计次 = self.特效计次 - 0.7
		self.特效覆盖:置区域(self.特效计次,0,800,600)
		self.特效覆盖:显示(0,600)
	end
	if tp.进程 ~= 2 then
	    self.mhxy:显示(256,40)
	end


	if tp.进程 == 1 then
		self.beij:显示(650-25,40+234-112)
		self.互通:更新(x,y)
		self.互通:显示(256+404-25,40+234-105)
		self.文字:置颜色(白色)
		self.文字:显示(256+404-25+45,40+234-105+14,"手机也能玩")
		引擎.置标题(__game.." ONLINE")
		self.进入游戏:更新(x,y)
		self.制作团队:更新(x,y)
		self.退出游戏:更新(x,y)
		tp.鼠标.还原鼠标()
		if self.进入游戏:事件判断()  or 引擎.按键弹起(KEY.ENTER) then
			-- tp.进程 = 8--5
			-- tp.进程 =7
			-- 客户端:连接处理(系统参数.服务器.ip,系统参数.服务器.端口)
			self:检查更新()
			return
		elseif  self.退出游戏:事件判断()  then
			引擎关闭开始()
			return
		elseif  self.制作团队:是否选中(x,y)  then

                        elseif  self.互通:是否选中(x,y)  then
                        	tp.提示:自定义(540,225,"#G方式一：正在开发中……\n\n#G方式二：正在开发中……")

		end
		self.进入游戏:显示(650,340)
		self.制作团队:显示(650,340+60)
		self.退出游戏:显示(650,340+60+60)
------------------------------------------------------------------------------------
		if 掉线重连[1]~=nil then
			客户端:连接处理("127.0.0.3",8084)---7961
			tp.进程 = 7 ------应该=1?
		end
------------------------------------------------------------------------------------


	end
end

function 场景类_标题:检查更新()
	客户端:连接处理(连接ip,8084)
end

return 场景类_标题