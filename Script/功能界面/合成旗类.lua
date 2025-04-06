-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-16 17:27:01
local 合成旗类 = class()

local tp
local xys = 生成XY
local floor = math.floor
local format = string.format
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local wns = 引擎.文件是否存在
local insert = table.insert
local fgz = 分割字符
local number = tonumber
local string = tostring
local zts1
local pt
local bw = require("gge包围盒")(0,0,0,16)

function 合成旗类:初始化(根)
	self.ID = 73
	self.x = 190
	self.y = 176
	self.xx = 0
	self.yy = 0
	self.注释 = "合成旗"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	self.资源组 = {

	}
	tp = 根
	self.背景窗口 = tp._自适应.创建(76,1,0,0,3,9)
	self.窗口时间 = 0
	-- self.圆圈=资源:载入('wzife.wdf',"网易WDF动画",0x393947EB)
	-- self.圆圈=tp.资源:载入('wzife.wdf',"网易WDF动画",0x393947EB)
	self.圆圈=资源:载入('wzife.wdf',"网易WDF动画",0x146BB550)
	self.圆圈=tp.资源:载入('wzife.wdf',"网易WDF动画",0x146BB550)
	self.传送点 = {}
	self.地图大小={
		[1092]={z=4480,y=3020},
		[1001]={z=11000,y=5600},
		[1501]={z=5760,y=2880},
		[1070]={z=3200,y=4200},
		[1208]={z=3840,y=2400},
		[1226]={z=3200,y=2400},
		[1040]={z=3280,y=2480},
		[1173]={z=12800,y=2400},
		[1122]={z=3200,y=2400}, --地府
	}
end

function 合成旗类:打开(数据)
	if self.可视 or 数据==nil or 数据.地图==nil then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		local Smap,Smapa = 小地图资源加载(数据.地图)
		self.坐标点=数据.xy
		for i=1,#self.坐标点 do
			-- self.传送点[i] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x393947EB)
			图片 =tp._按钮(tp.资源:载入('wzife.wdf',"网易WDF动画",0x146BB550))
			self.传送点[i] = 图片

		end
		self.小地图 = tp.资源:载入(Smap,"网易WDF动画",Smapa)
		self.宽度 = self.小地图:取宽度()
		self.高度 = self.小地图:取高度()
		self.x = self.x or floor((全局游戏宽度 - self.宽度) /2)
		self.y = self.y or floor((全局游戏高度 - self.高度) /2)
		local fg = {}
		fgz(string(self.高度),fg)
		fg = number(fg[3])
		local v = 27
		if fg == 1 or fg == 3 or fg == 5 or fg == 7 or fg == 9 then
			v = 26
		end
		self.qx = nil self.qy = nil
		self.地图=数据.地图
		self.背景窗口:置宽高(self.宽度+18,self.高度+v-8)
		self.偏移X = (self.宽度) / self.地图大小[数据.地图].z
		self.偏移Y = (self.高度 )/  self.地图大小[数据.地图].y
	end
end

function 合成旗类:显示(dt,x,y)
	self.焦点 = false
	self.背景窗口:显示(self.x-12,self.y-12)
	-- tp.窗口标题背景_:显示(self.x-76+self.背景窗口.宽度/2,self.y-27)
	-- 引擎.场景.字体表.标题字体:显示(self.x+self.背景窗口.宽度/2,self.y+3-27,取地图名称(self.地图))
	self.小地图:显示(self.x,self.y)
	for n=1,#self.坐标点 do
		local x1,y1=self.坐标点[n].x,self.坐标点[n].y
		self.传送点[n]:更新(dt)
		self.传送点[n]:显示(x1*20 * self.偏移X + self.x,y1*20 * self.偏移Y + self.y)
		if self.小地图:是否选中(x,y) and self.鼠标 and not tp.消息栏焦点 then
			local 鼠标坐标 = xys(floor((x - self.x)/(self.宽度/(tp.场景.地图.宽度/20))),floor((y - self.y)/(self.高度/(tp.场景.地图.高度/20))))
			tp.提示:自定义(x+6,y+6,format("#Y/%d，%d", 鼠标坐标.x,鼠标坐标.y))
		end
		if self.传送点[n]:是否选中(x,y) then

			if 引擎.鼠标弹起(左键) then
				发送数据(3737,{序列=n})
				self:打开()
			end
			self.传送点[n]:置高亮()

		else
		   self.传送点[n]:取消高亮()
		end
	end
end

function 合成旗类:检查点(x,y)
	if self.可视 and self.小地图:是否选中(x,y)  then
		return true
	end
end

function 合成旗类:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
		self.窗口时间 = tp.运行时间
	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 合成旗类:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 合成旗类

