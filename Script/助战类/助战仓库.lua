--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-08-11 16:12:21
--======================================================================--
local 助战仓库 = class()
local bw1= require("gge包围盒")(0,0,200,23)
local bw2= require("gge包围盒")(0,0,200,23)
local tp,ckzts1,ckzts2
local tonumbe = tonumber
local insert = table.insert
local box = 引擎.画矩形
function 助战仓库:初始化(根)
	self.ID = 175
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "助战仓库"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 =  根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,610,330-24,3,9), -- 297
		[2] = 按钮(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 资源:载入('pic/bp/jn.png',"图片"),
		[4] = 按钮.创建(自适应.创建(17,4,70,22,1,1),0,0,4,true,true,"购买背包"),
		[5] = 按钮(自适应.创建(17,4,55,22,1,3),0,0,4,true,true,"道具"),
		[6] = 按钮(自适应.创建(17,4,55,22,1,3),0,0,4,true,true,"行囊"),
		[9] = 自适应.创建(6,1,270,100,3,9),
		[10] = 自适应.创建(3,1,35,20,1,3),
		[11] = 按钮(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"取出"),
		[13] = 自适应.创建(4,1,1,1,3,nil),
		[14] = 按钮.创建(自适应.创建(17,4,70,22,1,1),0,0,4,true,true," 整  理"),

	}
	for n=4,6 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	self.资源组[11]:绑定窗口_(self.ID)
	self.资源组[14]:绑定窗口_(self.ID)
	self.道具仓库组={}
	self.仓库 = {}
	self.物品 = {}
	-- 一个仓库和物品格子180个数量
	local 格子 = 根._物品格子
	for i=1,180 do
		self.仓库[i] = 格子(0,0,i,"仓库")
		self.物品[i] = 格子(0,0,i,"物品")
	end
	-- 定义输入框
	self.仓库开始 = 1
	self.仓库结束 = 20
	self.选中仓库 = nil
	self.选中物品 = nil
	self.选中仓库 = nil
	self.仓库页数 = 1
	self.窗口时间 = 0
	tp = 根
	ckzts1 = tp.字体表.普通字体
	ckzts2 = tp.字体表.普通字体_
end

function 助战仓库:打开(道具,道具仓库总数)
	if self.可视 then
		self.仓库开始 = 1
		self.仓库结束 = 20
		self.选中仓库 = nil
		self.选中物品 = nil
		self.选中物品数量 = nil
		self.选中仓库 = nil
		self.选中仓库数量 = nil
		for i=1,20 do
			self.物品[i]:置物品(nil)
			self.物品[i].确定 = false
		end
		for i=self.仓库开始,self.仓库结束 do
			self.仓库[i]:置物品(nil)
			self.仓库[i].确定 = false
		end
		self.可视 = false
		-- for i=1,self.仓库总数 do
		-- 	self.资源组[i+10] = nil
		-- end
	else
		self.仓库页数 = 1
		insert(tp.窗口_,self)
		self.x = (全局游戏宽度/2)-305
		self.y = (全局游戏高度/2)-200
		for i=1,20 do
			self.物品[i]:置物品(tp.道具列表[i])
			self.仓库[i]:置物品(道具[i])
		end
		 tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.道具仓库总数 = 道具仓库总数
		for n=1,self.道具仓库总数 do
			self.道具仓库组[n] = tp._按钮(tp._自适应.创建(17,4,22,22,1,3),0,0,4,true,true)
		end
		self.道具类型 = "道具"
		self.仓库类型 = "道具"
	end
end

function 助战仓库:刷新道具(类型,数据)
	self.仓库开始 = 1
	self.仓库结束 = 20
	self.道具类型 = 类型
	for i=1,20 do
		self.物品[i]:置物品(nil)
		self.物品[i]:置物品(数据.道具[i])
		self.物品[i].确定=nil
	end
	self.选择仓库 = nil
	self.选择物品=nil
 end

 function 助战仓库:刷新道具仓库总数(道具,总数)
	self.仓库类型 = "道具"
	self.仓库开始 = 1
	self.仓库结束 = 20
	for i=1,20 do
		self.仓库[i]:置根(tp)
		self.仓库[i]:置物品(道具[i])
	end
	self.道具仓库总数 = 总数
	self.仓库页数 = 1
	for n=1,self.道具仓库总数 do
		self.道具仓库组[n] = tp._按钮(tp._自适应.创建(17,4,22,22,1,3),0,0,4,true,true)
	end
end

function 助战仓库:刷新仓库(数据,页数)
	self.仓库开始 = 1
	self.仓库结束 = 20
	for i=1,20 do
		if self.仓库[i]~=nil then
			self.仓库[i]:置根(tp)
			self.仓库[i]:置物品(数据[i])
		end
	end
	self.仓库页数 = 页数 or 1
 end



function 助战仓库:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	tp.超级偷袭光效:显示(self.x-100,self.y-100)
	-- self.资源组[11]:更新(x,y)
	-- [4] = 按钮.创建(自适应.创建(17,4,70,22,1,1),0,0,4,true,true,"购买背包"),
	-- 	[5] = 按钮(自适应.创建(17,4,55,22,1,3),0,0,4,true,true,"道具"),
	-- 	[6] = 按钮(自适应.创建(17,4,55,22,1,3),0,0,4,true,true,"行囊"),
	-- 	[14] = 按钮.创建(自适应.创建(17,4,70,22,1,1),0,0,4,true,true,"整 理"),
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[5]:事件判断() then --道具
		 发送数据(3780,{道具类型="道具"})
	elseif self.资源组[6]:事件判断() then --行囊
		 发送数据(3780,{道具类型="行囊"})
	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 588,self.y + 6)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,角色信息.数字id.."：助战道具")
	for n=1,self.道具仓库总数 do
		self.道具仓库组[n]:更新(x,y)
	end
	for n=1,self.道具仓库总数 do
		if self.道具仓库组[n]:事件判断() and self.道具仓库组[n].事件 and self.道具仓库组[n].窗口按钮 then
			self.仓库页数 = n
			发送数据(2102,{序列=self.仓库页数})
		end
	end

	self.资源组[3]:显示(self.x + 18+24,self.y-25 + 49) --新增的
	self.资源组[3]:显示(self.x + 345+24,self.y-25 + 49)
	ckzts2:置颜色(黄色):显示(self.x+107,self.y-25+58,"助战道具"..self.仓库页数)
	ckzts2:置颜色(黄色):显示(self.x+443,self.y-25+58,"主角道具")
	tp.物品界面背景_:显示(self.x+14,self.y-25+79)
	tp.物品界面背景_:显示(self.x+340,self.y-25+79)
	-- self.资源组[10]:显示(self.x+290,self.y-25+150)
	-- self.资源组[11]:显示(self.x+294-15,self.y-25-26+175)
	self.资源组[4]:显示(self.x + 195,self.y-25 + 298,true)
	self.资源组[14]:显示(self.x + 270,self.y-25 + 298,true)
	self.资源组[5]:显示(self.x + 345,self.y-25 + 298,nil,nil,nil,self.道具类型=="道具",2)
	self.资源组[6]:显示(self.x + 405,self.y-25 + 298,nil,nil,nil,self.道具类型=="行囊",2)
	if self.资源组[4]:事件判断() then --租仓库
		tp.窗口.对话栏:文本("","","本次扩展伙伴共享背包需要消耗#R"..((self.道具仓库总数-3)*50000+300000).."#W两银子，你是否需要进行购买伙伴共享背包操作？",{"确定购买背包","让我再想想"})
	elseif self.资源组[14]:事件判断() then --整 理
		-- tp.常规提示:打开("#Y该功能暂停使用！")
		发送数据(2104)
	end
	-- ckzts2:置颜色(黄色):显示(self.x+463,self.y-25+303,"鼠标左键道具可快速取出")
	if self.道具仓库总数 > 7 then
		self.资源组[9]:显示(self.x+5,self.y-25+332)
	end
	local new_x = 0
	local new_y = 0
	for n=1,self.道具仓库总数 do
		if n < 8 then
			self.道具仓库组[n]:显示(self.x+15+(n-1)*25,self.y-25+298,nil,nil,nil,self.仓库页数==n,2)
			ckzts1:显示(self.x+22+(n-1)*25,self.y-25+301,n)
		else
			self.道具仓库组[n]:显示(self.x+15+new_x*25,self.y-25+335+new_y*25,nil,nil,nil,self.仓库页数==n,2)
			if n >=10 then
				ckzts1:显示(self.x+18+new_x*25,self.y-25+337+new_y*27,n)
			else
				ckzts1:显示(self.x+22+new_x*25,self.y-25+337+new_y*27,n)
			end
			new_x = new_x + 1
		end
		if new_x == 10 then
			new_y = new_y + 1
			new_x = 0
		end
	end
	local xx = 0
	local yy = 0
	local 提示文字 = tp.字体表.描边字体2
	for i=1,20 do
		local jx = xx*51+341
		local jy = yy*51+79
		self.物品[i]:置坐标(jx + self.x,jy + self.y-25)
		if self.物品[i].物品 ~= nil then
			local 分割名称 = 分割文本(self.物品[i].物品.名称,"商品")
			if 分割名称[1] == "" or 分割名称[1] == "帮派银票" then
				self.物品[i]:显示(dt,x,y,self.鼠标,{0,0,分割名称[1] ~= "" and 分割名称[1] ~= "帮派银票"})
			else
				self.物品[i]:显示(dt,x,y,self.鼠标)
				--提示内容显示
				-- local 提示文字内容 = nil
				-- if self.物品[i].物品~=nil and (self.物品[i].名称=="魔兽要诀" or self.物品[i].名称=="高级魔兽要诀" or self.物品[i].名称=="点化石" or self.物品[i].名称=="召唤兽内丹" or self.物品[i].名称=="高级召唤兽内丹") then
				-- 		提示文字内容=self.物品[i].物品.附带技能
				-- elseif self.物品[i].物品~=nil and (self.物品[i].名称=="百炼精铁" or self.物品[i].名称=="元灵晶石") then
				-- 		提示文字内容=self.物品[i].物品.子类.."级"
				-- elseif self.物品[i].物品~=nil and self.物品[i].物品.总类==5 and self.物品[i].物品.分类==6 then
				-- 	提示文字内容=self.物品[i].物品.级别限制.."级"
				-- end
				-- if 提示文字内容~=nil then
				-- 	local yy1 = 0
				-- 	if 提示文字:取宽度(提示文字内容)>48 then
				-- 		提示文字内容=string.sub(提示文字内容,1,4).."\n"..string.sub(提示文字内容,5,-1)
				-- 	end
				-- 	if 提示文字:取高度(提示文字内容)<=14 then
				-- 		yy1=14
				-- 	end
				-- 	提示文字:显示(jx+self.x+24,jy+self.y-25+22+yy1,提示文字内容) --设置显示文字和显示位置
				-- 	提示文字:置样式(1)
				-- 	提示文字:置颜色(黄色)
				-- 	提示文字:置描边颜色(黑色)
				-- end
				--提示内容显示
			end
		else
			self.物品[i]:显示(dt,x,y,self.鼠标)
		end
		if self.物品[i].焦点 then
			if self.物品[i].物品 ~= nil then
				local 分割名称 = 分割文本(self.物品[i].物品.名称,"商品")
				tp.提示:道具行囊(x,y,self.物品[i].物品)
			end
		end
		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end

	local xx = 0
	local yy = 0
	for i=1,20 do
		local jx = xx*51+306
		local jy = yy*51+79
		jx = jx-291
		self.仓库[self.仓库开始-1+i]:置坐标(jx + self.x,jy + self.y-25)
		self.仓库[self.仓库开始-1+i]:显示(dt,x,y,self.鼠标)
		--提示内容显示
		-- local 提示文字内容 = nil
		-- if self.仓库[self.仓库开始-1+i].物品~=nil and (self.仓库[self.仓库开始-1+i].名称=="魔兽要诀" or self.仓库[self.仓库开始-1+i].名称=="高级魔兽要诀" or self.仓库[self.仓库开始-1+i].名称=="点化石" or self.仓库[self.仓库开始-1+i].名称=="召唤兽内丹" or self.仓库[self.仓库开始-1+i].名称=="高级召唤兽内丹") then
		-- 		提示文字内容=self.仓库[self.仓库开始-1+i].物品.附带技能
		-- elseif self.仓库[self.仓库开始-1+i].物品~=nil and (self.仓库[self.仓库开始-1+i].名称=="百炼精铁" or self.仓库[self.仓库开始-1+i].名称=="元灵晶石") then
		-- 		提示文字内容=self.仓库[self.仓库开始-1+i].物品.子类.."级"
		-- elseif self.仓库[self.仓库开始-1+i].物品~=nil and self.仓库[self.仓库开始-1+i].物品.总类==5 and self.仓库[self.仓库开始-1+i].物品.分类==6 then
		-- 	提示文字内容=self.仓库[self.仓库开始-1+i].物品.级别限制.."级"
		-- end
		-- if 提示文字内容~=nil then
		-- 	local yy1 = 0
		-- 	if 提示文字:取宽度(提示文字内容)>48 then
		-- 		提示文字内容=string.sub(提示文字内容,1,4).."\n"..string.sub(提示文字内容,5,-1)
		-- 	end
		-- 	if 提示文字:取高度(提示文字内容)<=14 then
		-- 		yy1=14
		-- 	end
		-- 	提示文字:显示(jx+self.x+24,jy+self.y-25+22+yy1,提示文字内容) --设置显示文字和显示位置
		-- 	提示文字:置样式(1)
		-- 	提示文字:置颜色(黄色)
		-- 	提示文字:置描边颜色(黑色)
		-- end
		--提示内容显示

		if self.仓库[i].焦点 then
			if self.仓库[i].物品 ~= nil then
				tp.提示:道具行囊(x,y,self.仓库[i].物品)
				if self.仓库[i].事件 and self.鼠标 then
					if self.选择仓库 ~= nil then
						self.仓库[self.选择仓库].确定 = false
					end
					self.选择仓库 = i
					self.仓库[i].确定 = true
				elseif 引擎.鼠标弹起(右键) then
					发送数据(2103,{页数=self.仓库页数,物品=i,类型=self.道具类型})
				end
			end
		end
		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
end

function 助战仓库:检查点(x,y)
	if self.可视 and (self.资源组[1]:是否选中(x,y) or self.资源组[9]:是否选中(x,y)) then
		return true
	end
end

function 助战仓库:初始移动(x,y)
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

function 助战仓库:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

return 助战仓库