-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-27 23:30:36
function 引擎.取普通锦衣模型(名称,造型,武器,类型)
	local chs = {}
	local ch = 名称.."_"..造型
	if 引擎.取武器类型(类型) ~= "" then
		ch = ch.."_"..引擎.取武器类型(类型)
	end
	if 锦衣数据SYS[ch] ~= nil then
		chs[1]=锦衣数据SYS[ch]["静立"]
		chs[2]=锦衣数据SYS[ch]["行走"]
		chs[3]=锦衣数据SYS[ch]["资源"]
	end
	-- if 名称=="斗战胜佛" then
	-- 	ch = 名称..造型
	-- 	chs[1]=ch.."站立"
	-- 	chs[2]=ch.."跑步"
	-- 	chs[3]="gagajinyi.dll"
	-- end
	if 造型 == '影精灵' then
	    chs[1] = 356
    	chs[2] = 357
    	chs[3] = "影精灵.wdf"
	end

	return chs
end

function 引擎.取战斗锦衣模型(名称,造型,武器,类型,动作)
	local chs = {}
	local ch = 名称.."_"..造型
	if 引擎.取武器类型(类型) ~= "" then
		ch = ch.."_"..引擎.取武器类型(类型)
	end
	if 锦衣数据SYS[ch] ~= nil then
		chs[8]=锦衣数据SYS[ch]["跑去"]
		chs[4]=锦衣数据SYS[ch]["防御"]
		chs[1]=锦衣数据SYS[ch]["攻击"]
		chs[2]=锦衣数据SYS[ch]["攻击1"]
		chs[9]=锦衣数据SYS[ch]["挨打"]
		chs[3]=锦衣数据SYS[ch]["死亡"]
		chs[7]=锦衣数据SYS[ch]["施法"]
		chs[6]=锦衣数据SYS[ch]["静立"]
		chs[10]=锦衣数据SYS[ch]["资源"]
	end


--     if 名称=="斗战胜佛" then
-- 		ch = 名称..造型
-- 		chs[8]=ch.."跑步"
-- 		chs[4]=ch.."站立"
-- 		chs[1]=ch.."攻击"
-- 		chs[2]=ch.."攻击"
-- 		chs[9]=ch.."站立"
-- 		chs[3]=ch.."站立"
-- 		chs[7]=ch.."施法"
-- 		chs[6]=ch.."站立"
-- 		chs[10]="gagajinyi.dll"
-- 	end

 	return chs
 end


function 引擎.取武器类型(类型)
 local n = {"枪矛","斧钺","剑","双短剑","飘带","爪刺","扇","魔棒","锤","鞭","环圈","刀","法杖","弓弩","宝珠","巨剑","伞","灯笼"}
 if n[类型]~=nil then
     return n[类型]
    else
     return ""

 	 end
end