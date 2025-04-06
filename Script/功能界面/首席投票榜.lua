--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-08-21 22:29:34
--============================,==========================================--
local 场景类_首席投票榜 = class()
local qmx = 引擎.取模型
local box = 引擎.画矩形
local zts,zts1,tp
local insert = table.insert
local sjb
local bw = require("gge包围盒")(0,0,263,20)
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
function 场景类_首席投票榜:初始化(根)
	self.ID = 100
	self.x = 218
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "账号管理"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,541,378,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"投票"),
		[4] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"特别支持"),
		[5] = 自适应.创建(88,1,233,322,3,9),
		[6] = 自适应.创建(4,1,272,193,3,9),
		[7] = 自适应.创建(4,1,272,108,3,9),
	}
	self.选中 = 0
	for n=2,4 do
	    self.资源组[n]:绑定窗口_(self.ID)
	end
	self.资源组[3]:置偏移(10,0)
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
end

function 场景类_首席投票榜:打开(sj)
	if self.可视 then
		self.可视 = false
		self.选中 = 0
	else
		self.选中 = 0
		sjb= sj
		insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_首席投票榜:显示(dt,x,y)
	self.焦点=false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	if self.资源组[3]:事件判断() then
		if self.选中 ~= 0 then
			发送数据(6301,{序号=self.选中})
			sjb[self.选中].得分 = sjb[self.选中].得分+1
		end
	elseif self.资源组[4]:事件判断() then
		if self.选中 ~= 0 then
			发送数据(6302,{序号=self.选中})
			sjb[self.选中].得分 = sjb[self.选中].得分+10
		end
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"首席投票榜")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x+185,self.y+351)
	self.资源组[4]:显示(self.x+329,self.y+351)
	self.资源组[5]:显示(self.x+294,self.y+25)
	self.资源组[6]:显示(self.x+6,self.y+25)
	self.资源组[7]:显示(self.x+6,self.y+233)
	zts1:显示(self.x+6+45,self.y+31,"昵称")
	zts1:显示(self.x+6+105,self.y+31,"id")
	zts1:显示(self.x+6+167,self.y+31,"等级")
	zts1:显示(self.x+6+211,self.y+31,"得分")
	zts1:显示(self.x+6+97,self.y+239,"竞选词")
	zts:置颜色(0xFF000000)
	if sjb ~= nil then
		for i=1,#sjb do
			local jx = self.x+10
			local jy = self.y+53+(20*(i-1))
			bw:置坐标(jx,jy+1)
			local xz = bw:检查点(x,y)
			if  self.选中 ~= i then
				if mouseb(0) and xz then
					self.选中 = i
				end
			else
				box(jx,jy,jx+265,jy+20,-10790181)
				zts:显示(self.x+6+10,self.y+260,sjb[i].竞选词)
			end
			zts:显示(self.x+6+10,self.y+56+(20*(i-1)),sjb[i].名称)
			zts:显示(self.x+6+99,self.y+56+(20*(i-1)),sjb[i].数字id)
			zts:显示(self.x+6+172,self.y+56+(20*(i-1)),sjb[i].等级)
			zts:显示(self.x+6+223,self.y+56+(20*(i-1)),sjb[i].得分)
		end
	end
	zts:置颜色(0xFFFFFFFF)
end

function 场景类_首席投票榜:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_首席投票榜:初始移动(x,y)
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

function 场景类_首席投票榜:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_首席投票榜