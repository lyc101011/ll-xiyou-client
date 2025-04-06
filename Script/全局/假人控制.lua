-- @Author: baidwwy
-- @Date:   2024-04-14 22:22:14
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-06-06 05:03:15
-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:47
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-01-18 10:32:05
--======================================================================--
local 数据库  	 = class()
local floor   	 = math.floor
local insert  	 = table.insert
local remove 	 = table.remove
local pairs   	 = pairs
local random  	 = 引擎.取随机整数
local random1 	 = 引擎.取随机小数
-- local dszb    	 = 引擎.取点
local djg    	 = 引擎.取等级怪
local 假人最终库 = require("script/全局/假人")
local tp
local os 		 = os
local xys = 生成XY

function 数据库:初始化(根)
	tp = 根
end

function 数据库:添加地图单位(数据)
	local jr = {
		染色组=数据.染色组,
		炫彩=数据.炫彩,
		炫彩组=数据.炫彩组,
		染色方案=数据.染色方案,
		方向1=数据.方向,
		武器=数据.武器,
		称谓=数据.称谓,
		名称=数据.名称,
		X=数据.x,
		Y=数据.y,
		编号=数据.编号,
		真实编号=数据.编号,
		id=数据.id,
		模型=数据.模型,
		方向=数据.方向 or random(0,3),
		事件ID=等级,
		执行事件=数据.事件,
		显示饰品=数据.显示饰品,
		领取人id=数据.领取人id or 0,
		战斗显示=数据.战斗显示,
		任务显示=数据.任务显示,
		队伍组=数据.队伍组,
		置顶层=数据.置顶层,
		武器子类=数据.武器子类,
		小地图名称颜色=数据.小地图名称颜色,
		锦衣=数据.锦衣
	}
	local jr = 假人最终库(jr)
	insert(tp.场景.假人,jr)
	insert(tp.场景.场景人物, jr) --场景人物是在地图统一显示
end

function 数据库:更改地图单位(数据)
	for i=1,#tp.场景.场景人物 do
		local v = tp.场景.场景人物[i]
		if v.名称 == 数据.名称 and v.编号 == 数据.编号 then
			remove(tp.场景.场景人物,i)
			break
		end
	end
	if 数据.变异 ~= nil and 数据.变异 and 染色信息[数据.模型]~=nil  then
		数据.染色方案 = 染色信息[数据.模型].id
		数据.染色组 = 染色信息[数据.模型].方案
	end
	local jr = {
		染色组=数据.染色组,
		炫彩=数据.炫彩,
		炫彩组=数据.炫彩组,
		染色方案=数据.染色方案,
		方向1=数据.方向,
		武器=数据.武器,
		称谓=数据.称谓,
		名称=数据.名称,
		X=数据.x,
		Y=数据.y,
		编号=数据.编号,
		真实编号=数据.编号,
		id=数据.id,
		模型=数据.模型,
		方向=数据.方向 or random(0,3),
		事件ID=等级,
		执行事件=数据.事件,
		显示饰品=数据.显示饰品,
		领取人id=数据.领取人id or 0,
		战斗显示=数据.战斗显示,
		任务显示=数据.任务显示,
		队伍组=数据.队伍组,
		置顶层=数据.置顶层
	}
	local jr = 假人最终库(jr)
	insert(tp.场景.场景人物,jr)
	数据=nil
end

function 数据库:删除指定Npc(编号)
	local xx
	local yy
	for i=1,#tp.场景.假人 do
		local v = tp.场景.假人[i]
		if v.真实编号 == 编号 then
			xx = v.坐标.x
			yy = v.坐标.y
			remove(tp.场景.假人,i)
			break
		end
	end
	for i=1,#tp.场景.场景人物 do
		local v = tp.场景.场景人物[i]
		if v.真实编号 == 编号 then
			remove(tp.场景.场景人物,i)
			break
		end
	end
	return {xx,yy}
end

function 数据库:npc行走(编号,坐标x,坐标y,喊话)
	local xx
	local yy
	for i=1,#tp.场景.假人 do
		local v = tp.场景.假人[i]
		if  v.真实编号 == 编号 then
			xx = v.坐标.x
			yy = v.坐标.y
			local a = xys(floor(v.坐标.x / 20),floor(v.坐标.y / 20))
			local b = xys(floor(坐标x),floor(坐标y))
			v.目标格子 = tp.场景.地图.寻路:寻路(a,b)
			v:取目标()
			v.移动 = true
			if 喊话 and v.假人~= nil then
				print(喊话)
				v.喊话:写入(v,v.假人,喊话)
			end
			break
		end
	end
	return {xx,yy}
end

function 数据库:npc炫彩(编号,炫彩,炫彩组)
	for i=1,#tp.场景.假人 do
		local v = tp.场景.假人[i]
		if   v.真实编号 == 编号 then
			v.炫彩 = 炫彩
			v.炫彩组 = 炫彩组
			v:炫彩染色(炫彩,炫彩组,"人物")
		end
	end
end

function 数据库:更换假人模型数据(内容)
	for i=1,#tp.场景.假人 do
		local v = tp.场景.假人[i]
		if   v.真实编号 == 内容.编号 then
			v.模型 = 内容.模型
			v.名称 = 内容.名称
			if 内容.武器 then
				v.武器 = 内容.武器
			end
			if 内容.锦衣 then
				v.锦衣 = 内容.锦衣
			end
			if 内容.称谓 then
				v.称谓 = 内容.称谓
			end
			v:置模型()
		end
	end
end


function 数据库:更换模型名称(编号,模型,名称)
	for i=1,#tp.场景.假人 do
		local v = tp.场景.假人[i]
		if   v.真实编号 == 编号 then
			v.模型 = 模型
			v.名称 = 名称
			v:置模型()
		end
	end
end

return 数据库