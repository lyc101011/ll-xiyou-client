-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:46
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-04-04 12:51:03

ffi = require("ffi")
版本号=1.3
local aa=版本号
local function 窗口图标(参数_窗口句柄,参数_图标文件)
	ffi.cdef[[
		void* LoadImageA(int,const char*,int,int,int,int);
		int SendMessageA(int,int,int,void*);
	]]
	local img = ffi.C.LoadImageA(0,参数_图标文件,1,32,32,16)
	ffi.C.SendMessageA(参数_窗口句柄,128,0,img)
end

local function 判断程序(名称)
	local ffi = require("ffi")
	ffi.cdef[[
		size_t    FindWindowA(const char*,const char*);
	]]
	local fhz= ffi.C.FindWindowA(nil,名称)
	return fhz
end
function 下载(地址,路径)
	local cURL = require("lcurl")
	local function ret(a,b,c,d)
		if a ~=0  then
		end
		return true
	end
	local f,err = assert(io.open(路径, "w+b"))
	if f then
		url = cURL.easy()
		:setopt_url(地址)
		:setopt(cURL.OPT_NOPROGRESS,false)
		:setopt_writefunction(f)
		:setopt_progressfunction(ret)
		:perform()
		url:close()
		f:close()
	else
	end
end
Youxijincheng=false

加载完成=false
require("script/全局/变量1")
变身显示=true
允许查看装备=true
玩家屏蔽=false
天气开关=true
全局禁止走路=false
宝宝队伍图排序={}
道具总数量=80
宝宝队伍图排序={}
__伙伴bb数据={宝宝列表={}}
-- 帮战开关=true--false
帮战开关=false
local org=KhdBooa(aa)

统一ip = "127.0.0.1"  --（更多游戏资源请访问游戏海湾 :www.2018gm.com 或者www.500s.cn）
 ---这里改成自己服务器外网ip  （有开发需请，请联系QQ：3392083938）

__game="自在西游"
引擎.置标题(__game.." ONLINE")
引擎(__game,800,600,60,true)

-- if __gge.isdebug == nil then
	-- ffi .load("msvcp99.dll")---标题修改
-- end


ServerDirectory = lfs.currentdir() .. [[\]]
__聊天框x=260
窗口图标(引擎.取窗口句柄(),"wdf/mytb.ico")
回调 = require("Script/网络/HPClient类")()

require("lfs")
-- 其他配置目录=lfs.currentdir()..[[\其他配置]]
function WriteFile(fileName, content)
  fileName = ServerDirectory .. fileName
  local f = assert(io.open(fileName, 'w'))
  f:write(content)
  f:close()
end
function 写出内容(qq, ww)
	if qq == nil or ww == nil or ww == "" then
		return 0
	end
		qq = 程序目录 .. qq
	local file = io.open(qq,"w")
	file:write(ww)
	file:close()
	text =0
	程序目录=lfs.currentdir()..[[\]]
	return text
end
function 写出文件(qq,ww)
	写出内容(qq,ww)
	lfs.chdir(初始目录)
	程序目录=初始目录
end





-- require("script/数据中心/点库")
require("script/数据中心/物品库")
require("script/数据中心/头像库")
require("script/数据中心/技能库")
require("script/数据中心/经脉库")
-- require("script/数据中心/宝宝库")
require("script/数据中心/音效库")
require("script/数据中心/明雷库")
require("script/数据中心/特效库")
require("script/数据中心/普通模型库")
require("script/数据中心/战斗模型库")
require("script/数据中心/锦衣模型")
require("script/数据中心/坐骑库")
require("script/数据中心/传送表")
require("script/数据中心/场景")
require("script/数据中心/梦战造型")
--require("script/数据中心/梦战召唤兽模型")
require("script/数据中心/符石组合")
require("script/数据中心/自定义库")
-- require("script/数据中心/战斗锦衣")
-- skill = require("Script/数据中心/技能数据库").创建()
锦衣数据SYS=ReadExcel("player","H3aM5ow4Ot6i5OyyDc3m5Q==")
PropertyData = ReadExcel("灵饰特性数据","小神授权")
--  for k, v in pairs(锦衣数据SYS) do
--     if string.match(k, "花间梦") then
--    	-- 攻击	攻击1	死亡	防御	待战	施法	跑去	挨打	静立	行走
-- --   	if v.战斗资源 then
-- --   end
--     end
--  end
 WriteFile("测试.txt",table.tostring(锦衣数据SYS))
资源缓存=require("Script/资源类/缓存资源")()
md66666=qumd5jm(aa)
--md55555=取MD5(md66666)
yq = 引擎
yq.场景 = require("script/全局/主控")()
tp = yq.场景
宝宝类=require("Script/属性控制/宝宝")
游戏公告=require("script/显示类/游戏公告类")(tp)
游戏传音=require("script/显示类/游戏传音类")(tp)
战斗指令类=require("script/战斗类/战斗命令类")
伙伴命令类 = require("script/战斗类/伙伴战斗类/伙伴命令类")
战斗类=require("script/战斗类/战斗类")(tp)
战斗单位类=require("script/战斗类/战斗单位类")
战斗动画类=require("script/战斗类/战斗动画类")
require("script/多重对话类/任务事件")
加密动画资源=require("script/资源类/动画类")
加载完成=true
全局dt = 0.8
菊部dt = 0.012
--引擎.垂直同步(true) --导致帧率变低


-------------------------------------------------------------------------------
	掉线重连={}--------掉线重连1
	if 读配置("./config.ini","mhxy","掉线重连账号")~="空" then
	掉线重连[1]=tostring(读配置("./config.ini","mhxy","掉线重连账号"))
	掉线重连[2]=tostring(读配置("./config.ini","mhxy","掉线重连密码"))
	掉线重连[3]=tostring(读配置("./config.ini","mhxy","掉线重连角色"))

	写配置("./config.ini","mhxy","掉线重连账号",nil)
	写配置("./config.ini","mhxy","掉线重连密码",nil)
	写配置("./config.ini","mhxy","掉线重连角色",nil)
	end

当前状态 = true
停止连接 = true
重连=false
检测开启=0
时间记录=0
function 客户端连接断开()---掉线重连
	if  tp.场景 ~= nil then
	    当前状态 = false
	    停止连接 = false
		tp.提示:写入("#Y/断线重连中,请耐心等待,在提示连接成功前请不要进行操作,若连接时间较长，可以手动重启客户端")
	end
end
------------------------------------------------------------------------------------------------








ItemData={}
加载物品数据()


local oldtime = os.time()
local dttime = 0
local contleng = 0
local xttime=1
local sddsd=0
local Acceleration=os.time()
__fsyz=false
__fsyzxz=false
__fsyzzd=false

function checkSpeend_grrpk(dt)
	if os.time() - oldtime >= 1 then --2
		oldtime = os.time()
		xttime=xttime+1 --2
		local gametime=math.floor(引擎.取游戏时间()/1000)
		if gametime>xttime then
			if dttime>1 then --2.1
				sddsd=sddsd+1
				if sddsd>=3 then
					-- 发送数据(62)
					f函数.信息框("检测到异常数据！","下线通知")
					os.exit()
				end
			else
				sddsd=0
				xttime=gametime-2
			end
		end
		dttime = 0
		if __fsyz and (__fsyzxz or __fsyzzd) then
			if os.time() - Acceleration >= 5 then
				Acceleration = os.time()
				发送数据(6302)
			end
		end
	end
	dttime = dttime + dt
end


function 渲染函数(dt,x,y)--鼠标x,鼠标y
  	dt = dt*全局dt
  	checkSpeend_grrpk(dt)
	鼠标.x,鼠标.y=x,y
	yq.渲染开始()
	yq.渲染清除()
	yq.场景:显示(dt,x,y)
	游戏公告:显示(dt,x,y)
	yq.渲染结束()
	-- 外部聊天框渲染函数(dt,x,y)
end
-- function 外部聊天框渲染函数(dt,x,y)
-- 	if yq.外部 ~= nil then
		-- yq.外部.显示(dt,x,y)
		--  if yq.外部.是否在窗口内()  then
		-- --     引擎.在外部 = true
		--  else
		-- --     引擎.在外部 = nil
		--  end
-- 	end
-- end

local function 退出函数()
	if tp==nil then
	  return false
	end
	if tp.进程 == 1 then
		return true
	elseif tp.进程 == 2 or tp.进程 == 3 or tp.进程 == 5 or tp.进程 == 6 or tp.进程 == 7 or tp.进程 == 8 or tp.进程 == 9 or tp.进程2 == 1 then
		tp.进程2 = 1
		return false
	else
		tp.窗口.系统设置:打开()
		return false
	end
	return false
end

引擎.置退出函数(退出函数)
function 引擎关闭开始()
	引擎.关闭()
end