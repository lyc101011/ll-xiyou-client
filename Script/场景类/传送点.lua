-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:29
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-02 03:48:44
local xys = 生成XY
local jlb = 取两点距离
local 场景类_传送点 = class()

function 场景类_传送点:初始化(x,y,切换,id)
	self.坐标 = xys(x*20,y*20)
	self.切换 = 切换
	self.id = id
	self.传送延时=系统参数.时间
	self.显示偏移 = {x=0,y=0}
end

function 场景类_传送点:更新(dt,x,y,pys) --not 全局自动走路开关 and
	if jlb(引擎.场景.角色坐标,self.坐标) < 800 and (引擎.场景.角色坐标.x >= self.坐标.x-26 and 引擎.场景.角色坐标.x <= self.坐标.x + 44 and 引擎.场景.角色坐标.y >= self.坐标.y-9 and 引擎.场景.角色坐标.y <= self.坐标.y + 45) then
		-- local a = 引擎.场景.场景:切换场景(self.切换)
		--if a[1] ~= nil then
			local kcs = true
			local sl = 0
			if 引擎.场景.场景.人物 and 引擎.场景.场景.人物.目标格子 then
			    sl=#引擎.场景.场景.人物.目标格子
			end
			if sl > 0 then
				local dz = xys(引擎.场景.场景.人物.目标格子[sl].x*20,引擎.场景.场景.人物.目标格子[sl].y*20)
				if jlb(引擎.场景.角色坐标,dz) >= 800 then -- 若人物走到传送点阵时，人物与寻路目标点大于屏幕范围则不进行传送
					kcs = false
				end
			end
			if kcs and 系统参数.时间-self.传送延时>=1 then
				if tp.窗口.辅助内挂类.可视 and tp.窗口.辅助内挂类.开始挂机 then --羔羊挂机
					self.传送延时=系统参数.时间+2
					tp.常规提示:打开("#Y/挂机中传送圈失效！")
					return
				end
				 self.传送延时=系统参数.时间
				 发送数据(1003,{说明=self.切换,id=self.id})
				--引擎.场景.场景:传送至(a[1],a[2].x,a[2].y,true)
			end
		return
	end
end

function 场景类_传送点:显示(dt,x,y,pys)
	if jlb(引擎.场景.角色坐标,self.坐标) < 800 then
		引擎.场景.传送点:显示(self.坐标 + pys+self.显示偏移)
	end
end

function 场景类_传送点:释放()

end
return 场景类_传送点

