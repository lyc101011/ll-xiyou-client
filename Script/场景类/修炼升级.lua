-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:34
local 场景类_修炼升级 = class()
local bwh = require("gge包围盒")
local bw1 = bwh(0,0,355,19)
local box = 引擎.画矩形
local tp,zts2,zts3
local mousea = 引擎.鼠标弹起
local insert = table.insert
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local ceil = math.ceil
local as = {"攻击修炼","防御修炼","法术修炼","抗法修炼","猎术修炼"}
local bbx = {"攻击控制力","防御控制力","法术控制力","抗法控制力"}

function 场景类_修炼升级:初始化(根)
	self.ID = 5
	self.x = 187
	self.y = 153
	self.xx = 0
	self.yy = 0
	self.注释 = "帮派界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.焦点1 = false
	self.可移动 = true
	self.本类开关=false
	local wz = require("gge文字类")
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,381,268,3,9),
		[3] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭按钮
		[4] = 自适应.创建(78,1,360,140,3,9),
		[5] = 自适应.创建(3,1,98,19,1,3),--两遍圆形
		[6] = 按钮(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"修 炼"),
		[7] = 按钮(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"关 闭"),
	}
    self.资源组[6]:置偏移(3,0)
    self.资源组[7]:置偏移(3,0)
	for i=6,7 do
		self.资源组[i]:绑定窗口_(5)
	end
	self.窗口时间 = 0
	tp = 根
	zts2 = wz.创建(nil,16,false,false,true)
	zts3 = tp.字体表.普通字体
	self.选中= 0
	self.资材 =0
	self.银子 =0
	self.数据={}
end

function 场景类_修炼升级:打开(zc,yz,xl,cb,lx,mzc)
	if self.可视 then
		self.免资材=nil
		self.可视 = false
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.选中= 0
		self.资材 =zc
		self.银子 =yz
		self.储备 =cb
		self.数据=xl
		self.sl=5
		self.免资材=mzc
		if lx=="人物" then
		    self.类型="人物修炼"
		    self.标题="人物修炼"
		    if self.免资材 then
		        self.标题="人物修炼(免资材)"
		    end
		else
			self.sl=4
			self.类型="宝宝修炼"
			self.标题="宝宝修炼"
			if self.免资材 then
		        self.标题="宝宝修炼(免资材)"
		    end
		end
		self.可视 = true
	end
end

function 场景类_修炼升级:刷新数据(sj)
	self.资材=sj.帮派资材
	self.银子=sj.银子
	self.储备=sj.储备
	self.数据=sj.修炼
	self.免资材=sj.免资材
end

function 场景类_修炼升级:显示(dt,x,y)
	self.焦点 = false
	self.资源组[3]:更新(x,y)
	if self.资源组[3]:事件判断() or self.资源组[7]:事件判断() then
		self:打开()
	elseif self.资源组[6]:事件判断() then
		if self.选中 ~= 0 then
			if self.类型=="人物修炼" then
			    发送数据(44,{类型=self.类型,免资材=self.免资材,修炼项目=as[self.选中]})
			else
				发送数据(44,{类型=self.类型,免资材=self.免资材,修炼项目=bbx[self.选中]})
			end
		end
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-88+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,self.标题)
	self.资源组[3]:显示(self.x-18+self.资源组[1].宽度,self.y+2)

	self.资源组[4]:显示(self.x+10,self.y+29)
	self.资源组[5]:显示(self.x+100,self.y+180+1)
	self.资源组[5]:显示(self.x+269,self.y+180+1)
	self.资源组[5]:显示(self.x+100,self.y+210+1)
	self.资源组[5]:显示(self.x+269,self.y+210+1)
	for i=1,2 do
		self.资源组[i+5]:更新(x,y)
		self.资源组[i+5]:显示(self.x+120+(i-1)*85,self.y+240)
	end

	if self.免资材 then
		zts3:置颜色(白色)
		zts3:显示(self.x + 10,self.y + 185,"修炼一次金钱")
		zts3:显示(self.x + 222,self.y + 185,"现  金")
		zts3:显示(self.x + 10,self.y + 215,"今日剩余次数")
		zts3:显示(self.x + 222,self.y + 215,"储备金")
		zts3:置颜色(-16777216)
		zts3:显示(self.x + 108,self.y + 185,"500000")
		zts3:显示(self.x + 276,self.y + 185,self.银子)
		zts3:显示(self.x + 108,self.y + 215,self.免资材)
	else
		zts3:置颜色(白色)
		zts3:显示(self.x + 10,self.y + 185,"帮派现有资材")
		zts3:显示(self.x + 222,self.y + 185,"现  金")
		zts3:显示(self.x + 10,self.y + 215,"修炼所需金钱")
		zts3:显示(self.x + 222,self.y + 215,"储备金")
		zts3:置颜色(-16777216)
		zts3:显示(self.x + 108,self.y + 185,self.资材)
		zts3:显示(self.x + 276,self.y + 185,self.银子)
		zts3:显示(self.x + 108,self.y + 215,"300000")
	end
	zts3:显示(self.x + 276,self.y + 215,self.储备)
	for n=1,self.sl do
		local jx = self.x + 18
		local jy = self.y+65+n*26-54
		local jy1 = self.y +208+ (n+1) * 22 - 5
		bw1:置坐标(jx,jy-5)
		if self.选中~= n then
				if bw1:检查点(x,y) and self.鼠标 then
					box(jx,jy-5,jx+343,jy+22,-3551379)
					if mousea(0) and not tp.消息栏焦点 then
						self.选中 = n
					end
				self.焦点 = true
				end
		else
			local ys = -10790181
			if bw1:检查点(x,y) then
				ys = -9670988
				self.焦点 = true
			end
			box(jx,jy-5,jx+343,jy+22,ys)
		end
		zts2:置颜色(0xFF000000)
		if self.类型=="人物修炼" then
		    zts2:显示(self.x+22,self.y+65+n*26-54,as[n].."   等级:"..self.数据[as[n]][1].."/"..self.数据[as[n]][3].."  修炼经验:"..self.数据[as[n]][2]..[[/]]..计算修炼等级经验(self.数据[as[n]][1],self.数据[as[n]][3]))
		else
			zts2:显示(self.x+22,self.y+65+n*26-54,bbx[n].."   等级:"..self.数据[bbx[n]][1].."/"..self.数据[bbx[n]][3].."  修炼经验:"..self.数据[bbx[n]][2]..[[/]]..计算修炼等级经验(self.数据[bbx[n]][1],self.数据[bbx[n]][3]))
		end
		--zts2:显示(self.x+22,self.y+65+n*26-54,"修炼")
	end
end

function 场景类_修炼升级:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_修炼升级:初始移动(x,y)
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

function 场景类_修炼升级:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_修炼升级