--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-06-06 16:15:49
--======================================================================--
local 系统类_鼠标 = class()

local 当前,记忆当前
local 指针 = {}
local tp
local shifou={}

function 系统类_鼠标:初始化(根)
	local 资源 = 根.资源
	指针["普通"] = 资源:载入('wzife.wdf',"网易WDF动画",0x535c1994)
	指针["攻击"] = 资源:载入('wzife.wdf',"网易WDF动画",0x1FBC5273)
	指针["道具"] = 资源:载入('wzife.wdf',"网易WDF动画",0xB48A9B3D)
	指针["捕捉"] = 资源:载入('wzife.wdf',"网易WDF动画",0xC5750B15)
	指针["保护"] = 资源:载入('wzife.wdf',"网易WDF动画",0xB352AE45)
	指针["禁止"] = 资源:载入('wzife.wdf',"网易WDF动画",0x1733E33B)
	指针["输入"] = 资源:载入('wzife.wdf',"网易WDF动画",0xC0247799)
	指针["事件"] = 资源:载入('common/wzife.wdf',"网易WDF动画",0xB3662702)
	指针["组队"] = 资源:载入('wzife.wdf',"网易WDF动画",0x183DC759)
	指针["给予"] = 资源:载入('wzife.wdf',"网易WDF动画",0xCF1D211E)
	指针["交易"] = 资源:载入('wzife.wdf',"网易WDF动画",0xB87E0F0C)
	-- 指针["指挥"] = 资源:载入('wzife.wdf',"网易WDF动画",0x183dc759)
	指针["平时攻击"] = 资源:载入('wzife.wdf',"网易WDF动画",0x1FBC5273)
	-- 指针["文本点击"] = 资源:载入('wzife.wdf',"网易WDF动画",0x89edce23) --1510300435
	指针["文本点击"] = 资源:载入('wzife.wdf',"网易WDF动画",1510300435)
	指针["铁锤点击"] = 资源:载入('wzife.wd2',"网易WDF动画",2690603136)
	指针["拆分"] = 资源:载入('wzife.wdf',"网易WDF动画",0x183DC759)
	当前 = "普通"
	记忆当前 = 当前
	tp = 根
	shifou["给予"]=1
	shifou["交易"]=1
	shifou["文本点击"]=1
	shifou["组队"]=1
	shifou["普通"]=1
	shifou["输入"]=1
	shifou["事件"]=1
	shifou["平时攻击"]=1
	shifou["拆分"]=1

end

function 系统类_鼠标.置鼠标(v)
	if 当前 == v or 当前=="组队" or 当前=="给予" or 当前=="交易" or 当前 == "平时攻击" or 当前=="拆分" then
		return false
	end
	if shifou[v] or (tp.场景 ~= nil and tp.战斗中 and v == "攻击") then
		tp.隐藏UI = false
	else
		tp.隐藏UI = true
	end
	if 记忆当前 ~= 当前 then
		记忆当前 = 当前
	end
	当前 = v
end

function 系统类_鼠标.取当前()
	return 当前
end

function 系统类_鼠标.还原鼠标()
	当前 = "普通"
end

function 系统类_鼠标:更新(dt,x,y)
	if 引擎.鼠标弹起(右键) then
		if 当前=="组队" or 当前=="给予" or 当前=="交易"  or 当前=="平时攻击" or 当前=="拆分" then
			当前 = "普通"
		end
		if tp.场景 then
		    tp.场景.抓取神器=nil
		end

	elseif 引擎.鼠标弹起(左键) and 当前=="铁锤点击" then
		当前 = "普通"
		tp.隐藏UI = false
	end
	指针[当前]:更新(dt)
end

function 系统类_鼠标:显示(dt,x,y)
	指针[当前]:显示(x,y)
end

return 系统类_鼠标