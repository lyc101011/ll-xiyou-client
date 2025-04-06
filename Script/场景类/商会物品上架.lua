-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-13 14:43:39
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-08-21 22:29:34
--======================================================================--
local 场景类_商会物品上架 = class()

local tp,zts,zts1
local tonumbe = tonumber
local insert = table.insert

function 场景类_商会物品上架:初始化(根)
	self.ID = 19
	self.x = 222
	self.y = 185
	self.xx = 0
	self.yy = 0
	self.注释 = "道具仓库"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 =  根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,574,335,3,9), -- 297
		[2] = 按钮(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"上架"),
		[4] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取出"),
		[6] = 自适应.创建(3,1,53,19,1,3),
		[7] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"上间"),
		[8] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"下间"),
		[9] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"改名"),
		[10] = 按钮(自适应.创建(12,4,60,22,1,3),0,0,4,true,true,"宠物店"),
		[11] = 按钮(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"取资金"),
		[12] = 自适应.创建(3,1,90,19,1,3),
	}
	self.仓库 = {}
	self.物品 = {}
	-- 一个仓库和物品格子180个数量
	local 格子 = 根._物品格子
	for i=1,180 do
		self.仓库[i] = 格子(0,0,i,"仓库")
		self.物品[i] = 格子(0,0,i,"物品")
	end
	for n=2,4 do
		self.资源组[n]:绑定窗口_(19)
	end
	for n=7,8 do
		self.资源组[n]:绑定窗口_(19)
		self.资源组[n]:置偏移(-1,0)
	end
	-- 定义输入框
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('物品空间')
	总控件:置可视(true,true)
	self.仓库改名 = 总控件:创建输入("仓库改名",0,0,100,14)
	self.仓库改名:置可视(false,false)
	self.仓库改名:置限制字数(12)
	self.仓库改名:置光标颜色(-16777216)
	self.仓库改名:置文字颜色(-16777216)
	self.上架单价 = 总控件:创建输入("上架单价",0,0,100,14)
	self.上架单价:置可视(false,false)
	self.上架单价:置数字模式()
	self.上架单价:置限制字数(12)
	self.上架单价:置光标颜色(-16777216)
	self.上架单价:置文字颜色(-16777216)
	self.仓库开始 = 1
	self.仓库结束 = 20
	self.选中仓库 = nil
	self.选中物品 = nil
	self.选中物品数量 = nil
	self.选中仓库 = nil
	self.选中仓库数量 = nil
	self.仓库页数 = 1
	self.窗口时间 = 0
	self.验证组 = {}
	self.验证时间 = 0
	self.编号=0
	self.商会出售单价 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
end

function 场景类_商会物品上架:打开(道具)
	if self.可视 then
		self.仓库开始 = 1
		self.仓库结束 = 20
		self.选中仓库 = nil
		self.选中物品 = nil
		self.选中物品数量 = nil
		self.选中仓库 = nil
		self.选中仓库数量 = nil
		self.商会出售单价 = 0
		for i=1,20 do
			self.物品[i]:置物品(nil)
			self.物品[i].确定 = false
		end
		for i=self.仓库开始,self.仓库结束 do
			self.仓库[i]:置物品(nil)
			self.仓库[i].确定 = false
		end
		self.仓库改名:置可视(false,false)
		self.上架单价:置可视(false,false)
		self.可视 = false
	else
		self.编号= 道具.编号
		self.店名= 道具.店名
		self.资金= 道具.资金
		self.店主id= 道具.店主id
		self.仓库页数 = 1
		self.上架单价:置文本(1)
		self.仓库改名:置文本(道具.店名)
		insert(tp.窗口_,self)
		for i=1,20 do
			self.物品[i]:置物品(tp.道具列表[i])
			self.仓库[i]:置物品(道具.物品[i])
		end
	    self.回收分类 = 回收分类
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.仓库总数=道具.物品总页
	end
end
function 场景类_商会物品上架:刷新道具()
	self.仓库开始 = 1
	self.仓库结束 = 20
 	for i=1,20 do
	  self.物品[i]:置物品(nil)
	  self.物品[i]:置物品(tp.道具列表[i])
	  self.物品[i].确定=nil
    end

 self.选择仓库 = nil
 self.选择仓库数量 = nil
 self.选择物品=nil
 self.选择物品数量=nil


 end

function 场景类_商会物品上架:刷新仓库(道具,总数)
	self.仓库开始 = 1
	self.仓库结束 = 20
 	for i=1,20 do
	  self.仓库[i]:置物品(nil)
	  self.仓库[i]:置物品(道具[i])
	  self.仓库[i].确定=nil
    end
 self.仓库页数 =总数
end

function 场景类_商会物品上架:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.选择物品 ~= nil and self.选择物品数量 ~= nil)
	self.资源组[4]:更新(x,y,self.选择仓库 ~= nil and self.选择仓库数量 ~= nil)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)

	 if self.选择物品~=nil and self.物品[self.选择物品].物品 ~= nil and self.资源组[3]:事件判断()  then

	 	发送数据(6103,{页数=self.仓库页数,物品=self.选择物品,编号=self.编号,店主id=self.店主id,价格=self.上架单价:取文本()})


	elseif self.选择仓库~=nil and self.仓库[self.选择仓库].物品 ~= nil and self.资源组[4]:事件判断() then
	 	发送数据(6104,{页数=self.仓库页数,物品=self.选择仓库,编号=self.编号,店主id=self.店主id})
  	elseif self.资源组[2]:事件判断() then
  	 self:打开()
	elseif self.资源组[7]:事件判断() then
		发送数据(6101,{序列=self.仓库页数 - 1,编号=self.编号,店主id= self.店主id})
	elseif self.资源组[8]:事件判断() then
		发送数据(6102,{序列=self.仓库页数 + 1,编号=self.编号,店主id= self.店主id})
	elseif self.资源组[9]:事件判断() then
		发送数据(6105,{编号=self.编号,店主id= self.店主id,店名=self.仓库改名:取文本()})
	elseif self.资源组[10]:事件判断() then
		发送数据(6112,{编号=self.编号,店主id= self.店主id})
		self:打开()
	elseif self.资源组[11]:事件判断() then
		发送数据(6106,{编号=self.编号,店主id= self.店主id})
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y+1)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"商  品")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x + 490,self.y + 270,true)
	self.资源组[4]:显示(self.x + 277,self.y + 270,true)
	zts:显示(self.x+21,self.y+249,"数 量")
	zts:显示(self.x+21,self.y+274,"店 面")
	zts:显示(self.x+370,self.y+274,"数 量")
	zts:显示(self.x+190,self.y+249,"出售单价")
	zts:显示(self.x+382,self.y+249,"上架单价")
	self.资源组[6]:显示(self.x+64,self.y+245)
	self.资源组[6]:显示(self.x+64,self.y+270)
	self.资源组[6]:显示(self.x+415,self.y+270)
	self.资源组[12]:显示(self.x+250,self.y+245)
	self.资源组[12]:显示(self.x+449,self.y+245)
	self.资源组[12]:显示(self.x+21,self.y+295)
	self.资源组[12]:显示(self.x+375,self.y+295)
	tp.宽竖排花纹背景_:置区域(0,0,37,166)
	tp.宽竖排花纹背景_:显示(self.x+268,self.y+31)
	tp.宽竖排花纹背景_:置区域(0,549,37,38)
	tp.宽竖排花纹背景_:显示(self.x+268,self.y+200)
	tp.物品界面背景_:显示(self.x+14,self.y+30)
	tp.物品界面背景_:显示(self.x+305,self.y+30)
	self.资源组[7]:显示(self.x+125,self.y+246)
	self.资源组[8]:显示(self.x+125,self.y+270)
	self.资源组[9]:显示(self.x+125,self.y+295)
	self.资源组[10]:显示(self.x+205,self.y+270)
	self.资源组[11]:显示(self.x+473,self.y+295)
	zts1:置字间距(0)
	local xx = 0
	local yy = 0
	for i=1,20 do
		local jx = xx*51+306
		local jy = yy*51+28
		self.物品[i]:置坐标(jx + self.x,jy + self.y)
		self.物品[i]:显示(dt,x,y,self.鼠标)
		jx = jx-291
		self.仓库[self.仓库开始-1+i]:置坐标(jx + self.x,jy + self.y)
		self.仓库[self.仓库开始-1+i]:显示(dt,x,y,self.鼠标)
		if self.物品[i].焦点 then
			if self.物品[i].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.物品[i].物品)
				if self.物品[i].事件 then
					if self.选择物品 ~= nil then
						self.物品[self.选择物品].确定 = false
					end
					self.选择物品 = i
					self.选择物品数量 = 1
					self.物品[i].确定 = true
				end
			end
		elseif self.仓库[i].焦点 then
			if self.仓库[i].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.仓库[i].物品)
				if self.仓库[i].事件 then
					if self.仓库[i].物品 ~= nil and self.仓库[i].焦点 then
						if self.选择仓库 ~= nil then
							self.仓库[self.选择仓库].确定 = false
						end
					    self.选择仓库 = i
					    self.选择仓库数量 = 1
					    self.仓库[i].确定 = true
					    self.商会出售单价 = self.仓库[i].物品.价格
					end
				end
			end
		end
		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
	zts:置颜色(-16777216)
	zts:显示(self.x + 70,self.y + 274,self.仓库页数)
	zts:显示(self.x + 70,self.y + 249,self.仓库总数)
	zts:显示(self.x + 263,self.y + 248,self.商会出售单价)
	zts:显示(self.x + 386,self.y + 298,self.资金)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)
	self.仓库改名:置坐标(self.x + 38,self.y + 297)
	self.仓库改名:置可视(true,true)
	self.上架单价:置坐标(self.x + 457,self.y + 249)
	self.上架单价:置可视(true,true)
	if  self.仓库改名._已碰撞 or self.上架单价._已碰撞  then
		self.焦点 = true
	end

end

function 场景类_商会物品上架:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_商会物品上架:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_商会物品上架:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

function 场景类_商会物品上架:判断仓库数量(页数)
	local i = 页数 * 20
	local sl = 0
	for m=i-19,i do
		if self.仓库[m].物品 == nil then
			sl = sl + 1
		end
	end
	return sl
end

function 场景类_商会物品上架:增加仓库物品(页数,物品1,物品2,选择,数量)
	local i = 页数 * 20
	local sl = 0
	local xt = false
	for s=i-19,i do
		if self.仓库[s].物品 ~= nil and self.仓库[s].物品.名称 == 物品1.名称 and self.仓库[s].物品.可叠加  then
			xt = true
		end
	end
	for s=i-19,i do
		if self.仓库[s].物品 == nil and xt == false then
			self.仓库[s]:置物品(物品1)
			self.仓库[s].物品.数量 = 数量
			if 物品2.数量 == nil then
				物品2.数量 = 1
			end
			local sls = 物品2.数量 - 数量
			物品2.数量 = sls
			if 物品2.数量 ~= sls then
				引擎.关闭()
				return false
			end
			self.验证组={"物品",选择,sls}
			if sls <= 0 then
				物品2 = nil
				self.选择物品 = nil
				self.选择物品数量 = nil
				self.物品[选择].确定 = false
				self.物品数量:置可视(false,false)
			end
			sls = nil
			tp.道具仓库[s] = self.仓库[s].物品
			break
		elseif self.仓库[s].物品 ~= nil and self.仓库[s].物品.名称 == 物品1.名称 and self.仓库[s].物品.可叠加 and xt == true then
			if tonumber(self.仓库[s].物品.数量) < 9999 then
				self.仓库[s].物品.数量 = self.仓库[s].物品.数量 + 数量
				if self.仓库[s].物品.数量 > 9999 then
					local sl = self.仓库[s].物品.数量 - 9999
					self.仓库[s].物品.数量 = self.仓库[s].物品.数量 - sl
				end
				local sls = 物品2.数量 - 数量
				物品2.数量 = sls
				if 物品2.数量 ~= sls then
					引擎.关闭()
					return false
				end
				self.验证组={"物品",选择,sls}
				if sls <= 0 then
					物品2 = nil
					self.选择物品 = nil
					self.选择物品数量 = nil
					self.物品[选择].确定 = false
					self.物品数量:置可视(false,false)
				end
				tp.道具仓库[s] = self.仓库[s].物品
				sls = nil
				break
			else
			  	tp.提示:写入("#Y/超出最大可存放数量")
			end
		end
	end
	刷新道具逻辑(物品2,选择,true)
end

return 场景类_商会物品上架