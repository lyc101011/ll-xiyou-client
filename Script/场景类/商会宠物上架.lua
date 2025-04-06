-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:51
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-11-08 15:46:54
--======================================================================--
local 场景类_商会宠物上架 = class()

local floor = math.floor
local tp,zts,zts1,bba,bbc,zts2
local bw = require("gge包围盒")(0,0,138,20)
local box = 引擎.画矩形
local mouseb = 引擎.鼠标弹起
local move = table.move
local insert = table.insert

function 场景类_商会宠物上架:初始化(根)
	self.ID = 17
	self.x = 173
	self.y = 57
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽仓库"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.焦点1 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,382,505,3,9),
		[3] = 自适应.创建(4,1,155,390,3,nil),
		[4] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[5] = 自适应.创建(3,1,47,19,1,3),
		[6] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"下架"),
		[7] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"上架"),
		[8] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"上页"),
		[9] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"下页"),
		[10] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
		[11] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
		[12] = 自适应.创建(3,1,90,19,1,3),
		[13] = 自适应.创建(4,1,155,420,3,nil),

	}
	self.资源组[4]:绑定窗口_(17)
	self.资源组[6]:绑定窗口_(17)
	self.资源组[7]:绑定窗口_(17)
	self.资源组[8]:绑定窗口_(17)
	self.资源组[9]:绑定窗口_(17)
	self.资源组[10]:绑定窗口_(17)
	self.资源组[11]:绑定窗口_(17)
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.人物字体_
	zts1 = tp.字体表.描边字体
	zts2 = tp.字体表.普通字体
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('商会宠物')
	总控件:置可视(true,true)
	self.上架单价 = 总控件:创建输入("上架单价",0,0,100,14)
	self.上架单价:置可视(false,false)
	self.上架单价:置数字模式()
	self.上架单价:置限制字数(12)
	self.上架单价:置光标颜色(-16777216)
	self.上架单价:置文字颜色(-16777216)
end

function 场景类_商会宠物上架:打开(数据)
	if self.可视 then
		self.可视 = false
		self.页数=1
		self.选中 = 0
		self.选中1 = 0
		self.上架单价:置可视(false,false)
	else
		self.店名 = 数据.名称
		self.编号=数据.编号
		self.店主id=数据.店主id
		self.上架单价:置文本(1)
		bba = 数据.宠物
		bbc = tp.队伍[1].宝宝列表
		self.页数=1
		insert(tp.窗口_,self)
		self.选中 = 0
		self.选中1 = 0
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_商会宠物上架:刷新商会宠物(数据)
	bba=数据.宠物
	self.页数=数据.页数
end

function 场景类_商会宠物上架:刷新上架宠物(编号)
	if tp.窗口.召唤兽属性栏.可视 == true then
		tp.窗口.召唤兽属性栏:打开()
	end
	table.insert(bba,tp.队伍[1].宝宝列表[编号])
	table.remove(tp.队伍[1].宝宝列表,编号)
	bbc = tp.队伍[1].宝宝列表
end

function 场景类_商会宠物上架:刷新下架宠物(编号)
	if tp.窗口.召唤兽属性栏.可视 == true then
		tp.窗口.召唤兽属性栏:打开()
	end
	table.insert(tp.队伍[1].宝宝列表,bba[编号])
	table.remove(bba,编号)
	bbc = tp.队伍[1].宝宝列表

end

function 场景类_商会宠物上架:显示(dt,x,y)

	self.资源组[4]:更新(x,y)
	self.资源组[6]:更新(x,y,self.选中1 ~= 0)
	self.资源组[7]:更新(x,y,self.选中 ~= 0 and #bbc > 0)
	self.资源组[8]:更新(x,y,self.页数>1)
	self.资源组[9]:更新(x,y,self.页数<10)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	if self.资源组[4]:事件判断() then
		self:打开()
		return
	elseif self.资源组[6]:事件判断() then --取回
		if self.选中1 ~= 0 then
			发送数据(6113,{编号=self.编号,选中=self.选中1,店主id=self.店主id,验证=bba[self.选中1].认证码,页数=self.页数})
		end
	elseif self.资源组[7]:事件判断() then --上架
		if  self.选中 ~= 0 then
			tp.队伍[1].宝宝列表[self.选中].价格=self.上架单价:取文本()
			发送数据(6114,{编号=self.编号,选中=self.选中,店主id=self.店主id,验证=tp.队伍[1].宝宝列表[self.选中].认证码,价格=self.上架单价:取文本(),页数=self.页数})
		end
	elseif self.资源组[8]:事件判断() then
		发送数据(6115,{编号=self.编号,店主id=self.店主id,页数=self.页数-1})
	elseif self.资源组[9]:事件判断() then
		发送数据(6115,{编号=self.编号,店主id=self.店主id,页数=self.页数+1})
	elseif self.资源组[10]:事件判断() then
	elseif self.资源组[11]:事件判断() then
	end
	self.焦点 = false
	self.焦点1 = nil
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y+1)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,self.店名)
	self.资源组[4]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	zts:置颜色(0xFFFFFFFF)
	zts2:显示(self.x+199,self.y+442,"上架单价")
	self.资源组[13]:显示(self.x+22,self.y+39)
	self.资源组[3]:显示(self.x+202,self.y+39)
	self.资源组[5]:显示(self.x+15,self.y+471)
	self.资源组[6]:显示(self.x+210,self.y+470)
	self.资源组[7]:显示(self.x+291,self.y+470)
	self.资源组[8]:显示(self.x+70,self.y+470)
	self.资源组[9]:显示(self.x+130,self.y+470)
	self.资源组[12]:显示(self.x+270,self.y+438)
	for i=1,16 do
		if bba[i] ~= nil then
			zts:置颜色(-16777216)
			local jx = self.x+34
			local jy = self.y+55+i*22
			bw:置坐标(jx-4,jy-3)
			if i ~= self.选中1 then
				if bw:检查点(x,y) then
					box(jx-5,jy-6,jx+138,jy+15,-3551379)
					self.焦点 = true
					if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
						self.选中1 = i
					end
				end
			else
				local ys = -10790181
				if bw:检查点(x,y) then
					ys = -9670988
					self.焦点1 = true
					self.焦点 = true
					if mouseb(1) and self.鼠标 and not tp.消息栏焦点 then
						tp.窗口.召唤兽查看栏:打开(bba[i])
					end
				end
				box(jx-5,jy-6,jx+138,jy+15,ys)
			end
			zts:显示(jx,jy-2,bba[i].名称.." "..bba[i].价格)
		end
	end
	for i=1,#bbc do
		if bbc[i].参战信息 == nil then
			zts:置颜色(-16777216)
		else
		    zts:置颜色(-65536)
		end
		local jx = self.x+213
		local jy = self.y+55+i*22
		bw:置坐标(jx-4,jy-3)
		if i ~= self.选中 then
			if bw:检查点(x,y) then
				box(jx-5,jy-6,jx+138,jy+15,-3551379)
				self.焦点 = true
				if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
					self.选中 = i
				end
			end
		else
			local ys = -10790181
			if bw:检查点(x,y) then
				ys = -9670988
				self.焦点 = true
				self.焦点1 = true
				if mouseb(1) and self.鼠标 and not tp.消息栏焦点 then
					tp.窗口.召唤兽查看栏:打开(bbc[i])
				end
			end
			box(jx-5,jy-6,jx+138,jy+15,ys)
		end
		zts:显示(jx,jy-2,bbc[i].名称)
	end
	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)
	self.上架单价:置坐标(self.x + 280,self.y + 440)
	self.上架单价:置可视(true,true)
	zts2:置颜色(-16777216)
	zts2:显示(self.x+24,self.y+474,self.页数)
end

function 场景类_商会宠物上架:存(编号)
	if tp.窗口.召唤兽属性栏.可视 == true then
		tp.窗口.召唤兽属性栏:打开()
	end
	table.insert(tp.召唤兽仓库,tp.队伍[1].宝宝列表[编号])
	table.remove(tp.队伍[1].宝宝列表,编号)
	bba = tp.召唤兽仓库
	bbc = tp.队伍[1].宝宝列表
end

function 场景类_商会宠物上架:取(编号)
	if tp.窗口.召唤兽属性栏.可视 == true then
		tp.窗口.召唤兽属性栏:打开()
	end
	table.insert(tp.队伍[1].宝宝列表,tp.召唤兽仓库[编号])
	table.remove(tp.召唤兽仓库,编号)
	bba = tp.召唤兽仓库
	bbc = tp.队伍[1].宝宝列表
end


function 场景类_商会宠物上架:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_商会宠物上架:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_商会宠物上架:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_商会宠物上架