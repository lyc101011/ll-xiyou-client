-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-19 06:18:12
-- @Author: baidwwy
-- @Date:   2023-08-31 22:54:45
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-10-23 18:30:05
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-07-19 11:47:50
--======================================================================--
local 场景类_仓库类 = class()
local bw1= require("gge包围盒")(0,0,200,23)
local bw2= require("gge包围盒")(0,0,200,23)
local tp,ckzts,ckzts1
local tonumbe = tonumber
local insert = table.insert
local box = 引擎.画矩形
function 场景类_仓库类:初始化(根)
	self.ID = 45
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "仓库类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 =  根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,610,330,3,9), -- 297
		[2] = 按钮(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),----
        [3] = 资源:载入('pic/bp/jn.png',"图片"),
		[4] = 按钮.创建(自适应.创建(17,4,70,22,1,1),0,0,4,true,true,"购买仓库"),
		[5] = 按钮(自适应.创建(17,4,55,22,1,3),0,0,4,true,true,"道具"),
		[6] = 按钮(自适应.创建(17,4,55,22,1,3),0,0,4,true,true,"行囊"),
		-- [7] = 按钮(自适应.创建(17,4,130,22,1,3),0,0,4,true,true,"   道具仓库"),
		-- [8] = 按钮(自适应.创建(17,4,131,22,1,3),0,0,4,true,true,"   召唤兽仓库"),
		[7] = 按钮(自适应.创建(12,4,130,22,1,3),0,0,4,true,true,"   道具仓库"),
		[8] = 按钮(自适应.创建(12,4,131,22,1,3),0,0,4,true,true,"   召唤兽仓库"),
		[9] = 自适应.创建(6,1,270,110,3,9),----仓库数量按钮的背景
		[10] = 自适应.创建(3,1,35,20,1,3),---数量上方的
		[11] = 按钮(自适应.创建(12,4,30,22,1,3),0,0,4,true,true,"存"),
		[12] = 按钮(自适应.创建(12,4,30,22,1,3),0,0,4,true,true,"取"),
		[13] = 自适应.创建(4,1,1,1,3,nil),---召唤兽仓库面板底板
		[14] = 按钮.创建(自适应.创建(17,4,70,22,1,1),0,0,4,true,true,"整理仓库"),
        [15] = 自适应.创建(6,1,123,30,3,9),----人物4个背包的背景

	}
	for n=4,12 do
		if n~=9 and n~=10 then
			self.资源组[n]:绑定窗口_(45)
		end
	end
	self.道具仓库组={}
	self.召唤兽仓库组={}
self.背包道具组={}
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
	self.背包页数 = 1
	self.仓库页数 = 1
	self.窗口时间 = 0
	tp = 根
	ckzts = tp.字体表.普通字体
	ckzts1 = tp.字体表.普通字体
	ckzts2 = tp.字体表.普通字体_
end

function 场景类_仓库类:打开(道具,道具仓库总数,召唤兽仓库总数)
	if self.可视 then
		self.仓库开始 = 1
		self.仓库结束 = 80
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
		for i=1,80 do
			self.物品[i]:置物品(tp.道具列表[i])
			self.仓库[i]:置物品(道具[i])
		end
	     tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.道具仓库总数 = 道具仓库总数
	    self.召唤兽仓库总数 = 召唤兽仓库总数
	    for n=1,self.道具仓库总数 do
			self.道具仓库组[n] = tp._按钮(tp._自适应.创建(17,4,22,22,1,3),0,0,4,true,true)

		end
		for n=1,5 do
			-- self.背包道具组[n] = tp._按钮(tp._自适应.创建(13,4,22,21,1,3),0,0,4,true,true)
			self.背包道具组[n] = tp._按钮(tp._自适应.创建(17,4,22,22,1,3),0,0,4,true,true)
			self.背包道具组[n]:绑定窗口_(45)
		end
		for n=1,self.召唤兽仓库总数 do
			self.召唤兽仓库组[n] = tp._按钮(tp._自适应.创建(17,4,22,22,1,3),0,0,4,true,true)
		end
	    self.道具类型 = "道具"
	    self.仓库类型 = "道具"
	    self.选择召唤兽 = 0
	    self.选择召唤兽认证码 = nil
	    self.选择仓库召唤兽 = 0
	    self.选择仓库召唤兽认证码 = nil
	end
end

function 场景类_仓库类:刷新道具(类型,数据)
	self.仓库开始 = 1
	self.仓库结束 = 80
	self.道具类型 = 类型
 	for i=1,80 do
		self.物品[i]:置物品(nil)
		self.物品[i]:置物品(数据.道具[i])
		self.物品[i].确定=nil
    	end
  --   for i=1,20 do
 	-- 	if self.物品[i]~=nil then
		-- 	self.物品[i]:置物品(tp.道具列表[i])
		-- 	self.物品[i].确定=nil
		-- end
  --   end
	self.选择仓库 = nil
 	self.选择物品=nil
 end

 function 场景类_仓库类:刷新道具仓库总数(道具,总数)
	self.仓库类型 = "道具"
	self.仓库开始 = 1
	self.仓库结束 = 80
 	for i=1,80 do
 		self.仓库[i]:置根(tp)
	  	self.仓库[i]:置物品(道具[i])
    end
 	self.道具仓库总数 = 总数
 	self.仓库页数 = 1
 	self.背包页数 = 1
 	for n=1,self.道具仓库总数 do
		self.道具仓库组[n] = tp._按钮(tp._自适应.创建(17,4,22,22,1,3),0,0,4,true,true)
	end
end

function 场景类_仓库类:刷新召唤兽仓库总数(总数,仓库数据)
	self.仓库类型="召唤兽"
 	self.召唤兽仓库总数 = 总数
 	self.仓库页数 = 1
 	self.背包页数 = 1
 	self.召唤兽仓库数据 = 仓库数据
 	for n=1,self.召唤兽仓库总数 do
		self.召唤兽仓库组[n] = tp._按钮(tp._自适应.创建(17,4,22,22,1,3),0,0,4,true,true)
self.召唤兽仓库组[n]:绑定窗口_(45)

	end

	self.选择召唤兽 = 0
    self.选择召唤兽认证码 = nil
    self.选择仓库召唤兽 = 0
    self.选择仓库召唤兽认证码 = nil
end

function 场景类_仓库类:刷新仓库(数据,页数)
	if self.仓库类型 == "道具" then
		self.仓库开始 = 1
		self.仓库结束 = 80
	 	for i=1,80 do
	 		if self.仓库[i]~=nil then
		 		self.仓库[i]:置根(tp)
			  	self.仓库[i]:置物品(数据[i])
			end
	    end
	elseif self.仓库类型 == "召唤兽" then
		self.召唤兽仓库数据 = 数据
		self.选择召唤兽 = 0
	    self.选择召唤兽认证码 = nil
	    self.选择仓库召唤兽 = 0
	    self.选择仓库召唤兽认证码 = nil
	end
 	self.仓库页数 = 页数

 end


function 场景类_仓库类:显示(dt,x,y)
	self.焦点 = false
	local bblb = tp.队伍[1].宝宝列表
	local ckbb = self.召唤兽仓库数据
	self.资源组[2]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[14]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[12]:更新(x,y)
  	if self.资源组[2]:事件判断() then
  	 	self:打开()
  	 	return
  	elseif self.资源组[5]:事件判断() then
		 -- self.道具类型 = "道具"
		 --发送数据(3699,{道具类型=self.道具类型})
		 --发送数据(3699,{})
		 --self.道具类型 = "道具"
		 发送数据(3780,{道具类型="道具"})
    	elseif self.资源组[6]:事件判断() then
		 -- self.道具类型 = "行囊"
		 --发送数据(3700,{道具类型=self.道具类型})
		 --发送数据(3700,{})
		 --self.道具类型 = "行囊"
		 发送数据(3780,{道具类型="行囊"})
	elseif self.资源组[7]:事件判断() then --打开道具仓库
		self.仓库类型 = "道具"
		self.道具类型 = "道具"
		self.选择召唤兽 = 0
	    self.选择召唤兽认证码 = nil
	    self.选择仓库召唤兽 = 0
	    self.选择仓库召唤兽认证码 = nil
		发送数据(6705,{序列=1})
	elseif self.资源组[8]:事件判断() then --打开召唤兽仓库
		self.选择召唤兽 = 0
	    self.选择召唤兽认证码 = nil
	    self.选择仓库召唤兽 = 0
	    self.选择仓库召唤兽认证码 = nil
		发送数据(6801)
		-- 发送数据(5018)
  	end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 588,self.y + 6)

	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"仓库")
	self.资源组[7]:显示(self.x+140,self.y+27,nil,nil,nil,self.仓库类型=="道具",2)
	self.资源组[8]:显示(self.x+340,self.y+27,nil,nil,nil,self.仓库类型=="召唤兽",2)
	if self.仓库类型 == "道具" then
		for n=1,self.道具仓库总数 do
			self.道具仓库组[n]:更新(x,y)
		end
			for n=1,4 do
			self.背包道具组[n]:更新(x,y)
		end
		for n=1,self.道具仓库总数 do
	  	    if self.道具仓库组[n]:事件判断() and self.道具仓库组[n].事件 and self.道具仓库组[n].窗口按钮 then
				self.仓库页数 = n
				发送数据(6705,{序列=self.仓库页数})
			end
	  	end
for n=1,4 do
			if self.背包道具组[n]:事件判断() and self.背包道具组[n].事件 and self.背包道具组[n].窗口按钮 then
				self.背包页数 = n
				for q=(self.背包页数-1)*20+1,self.背包页数*20 do
					self.物品[q]:置物品(tp.道具列表[q])
				end
			end
		end

		self.资源组[3]:显示(self.x + 18+24,self.y + 49) --新增的
		self.资源组[3]:显示(self.x + 345+24,self.y + 49)
		ckzts2:置颜色(白色):显示(self.x+120,self.y+58,"仓库"..self.仓库页数)

		ckzts2:置颜色(白色):显示(self.x+443,self.y+58,"道具仓库")

		tp.物品界面背景_:显示(self.x+14,self.y+79)
		tp.物品界面背景_:显示(self.x+340,self.y+79)
		ckzts2:置颜色(白色):显示(self.x+294,self.y+132,"数量")
		self.资源组[10]:显示(self.x+290,self.y+150)
		self.资源组[11]:显示(self.x+294,self.y+175)
		self.资源组[12]:显示(self.x+294,self.y+205)
		self.资源组[4]:显示(self.x + 195,self.y + 298,true)
		self.资源组[14]:显示(self.x + 270,self.y + 298,true)
		self.资源组[5]:显示(self.x + 345,self.y + 298,nil,nil,nil,self.道具类型=="道具",2)
		self.资源组[6]:显示(self.x + 405,self.y + 298,nil,nil,nil,self.道具类型=="行囊",2)
		if self.资源组[4]:事件判断() then --租仓库
			tp.窗口.对话栏:文本("","","本次租借需要消耗#R"..((self.道具仓库总数-3)*100000+300000).."#W两银子，你是否需要进行购买仓库操作？",{"确定购买仓库","让我再想想"})
		elseif self.资源组[14]:事件判断() then
			 -- tp.常规提示:打开("#Y该功能暂停使用！")
			-- 发送数据(3791)
			发送数据(6706,{页数=self.仓库页数,类型=self.道具类型})
		end
		ckzts2:置颜色(黄色):显示(self.x+463,self.y+303,"鼠标右键道具可快速转移")
		if self.道具仓库总数 > 7 then
			self.资源组[9]:显示(self.x+5,self.y+332)
		end
		if self.道具类型 == "道具" then
			self.资源组[15]:显示(self.x+340-2,self.y+332)
		end
		local new_x = 0
		local new_y = 0
		for n=1,self.道具仓库总数 do
			if n < 8 then
		    	self.道具仓库组[n]:显示(self.x+15+(n-1)*25,self.y+298,nil,nil,nil,self.仓库页数==n,2)
		    	ckzts1:显示(self.x+22+(n-1)*25,self.y+301,n)
		    else
		    	self.道具仓库组[n]:显示(self.x+15+new_x*25,self.y+335+new_y*25,nil,nil,nil,self.仓库页数==n,2)
		    	if n >=10 and n <= 27 then
		    		ckzts1:显示(self.x+18+new_x*25,self.y+337+new_y*27,n)
		    	elseif n >= 28 then
			    	ckzts1:显示(self.x+18+new_x*25,self.y+337+new_y*26,n)
			    else----小于10的
			    	ckzts1:显示(self.x+22+new_x*25,self.y+337+new_y*27,n)
			    end
		    	new_x = new_x + 1
		    end
		    if new_x == 10 then
		    	new_y = new_y + 1
		    	new_x = 0
		    end
		end


		if self.道具类型 == "道具" then
			for n=1,4 do
		    	self.背包道具组[n]:显示(self.x+345+(n-1)*29,self.y+335,nil,nil,nil,self.背包页数==n,2)
		    		ckzts1:显示(self.x+352+(n-1)*29,self.y+338,n)
			end
		end
		local xx = 0
		local yy = 0
		local 提示文字 = tp.字体表.描边字体2

		local 背包页起点=(self.背包页数-1)*20
		for i=背包页起点+1,背包页起点+20 do
			local jx = xx*51+341
			local jy = yy*51+79
			self.物品[i]:置坐标(jx + self.x,jy + self.y)
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
					-- 	提示文字:显示(jx+self.x+24,jy+self.y+22+yy1,提示文字内容) --设置显示文字和显示位置
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
					if self.物品[i].事件 and self.鼠标 then
						if self.选择物品 ~= nil then
							self.物品[self.选择物品].确定 = false
						end
						self.选择物品 = i
						self.物品[i].确定 = true
					elseif 引擎.鼠标弹起(右键) and (分割名称[1] ~= "" and 分割名称[1] ~= "帮派银票") then
						if self.选择物品 ~= nil then
							self.物品[self.选择物品].确定 = false
						end
						发送数据(6702,{页数=self.仓库页数,物品=i,类型=self.道具类型}) --存放
				 		-- 发送数据(3730,{页数=self.仓库页数,物品=i,类型=self.道具类型}) --存放
					end
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
			self.仓库[self.仓库开始-1+i]:置坐标(jx + self.x,jy + self.y)
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
			-- 	提示文字:显示(jx+self.x+24,jy+self.y+22+yy1,提示文字内容) --设置显示文字和显示位置
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
	               		发送数据(6703,{页数=self.仓库页数,物品=i,类型=self.道具类型})
					 	-- 发送数据(3731,{页数=self.仓库页数,物品=i,类型=self.道具类型})
					end
				end
			end
			xx = xx + 1
			if xx == 5 then
				xx = 0
				yy = yy + 1
			end
		end
	elseif self.仓库类型 == "召唤兽" then
		for n=1,self.召唤兽仓库总数 do
			self.召唤兽仓库组[n]:更新(x,y)
		end
		for n=1,self.召唤兽仓库总数 do
	  	    if self.召唤兽仓库组[n]:事件判断() and self.召唤兽仓库组[n].事件 and self.召唤兽仓库组[n].窗口按钮 then
				self.仓库页数 = n
				发送数据(6803,{序列=self.仓库页数}) --查看各个仓库的宝宝
			end
	  	end

		self.资源组[11]:显示(self.x+294,self.y+175)
		self.资源组[12]:显示(self.x+294,self.y+205)
        self.资源组[3]:显示(self.x + 18+24,self.y + 49) --新增的
		self.资源组[3]:显示(self.x + 345+24,self.y + 49)
		ckzts2:置颜色(白色):显示(self.x+105,self.y+58,"召唤兽仓库"..self.仓库页数)

		ckzts2:置颜色(白色):显示(self.x+430,self.y+58,"已携带召唤兽")

		self.资源组[13]:置宽高(255,210)
		self.资源组[13]:显示(self.x+15,self.y+80)
		self.资源组[13]:显示(self.x+340,self.y+80)
		ckzts2:置颜色(黄色):显示(self.x+463,self.y+303,"鼠标右键可查看属性")
		ckzts:置颜色(白色):显示(self.x+30,self.y+85,"名字")
		ckzts:置颜色(白色):显示(self.x+170,self.y+85,"等级")
		ckzts:置颜色(白色):显示(self.x+355,self.y+85,"名字")
		ckzts:置颜色(白色):显示(self.x+495,self.y+85,"等级")
		if self.召唤兽仓库总数 > 7 then
			self.资源组[9]:显示(self.x+5,self.y+332)
		end
		self.资源组[4]:显示(self.x + 195,self.y + 298,true)
		if self.资源组[4]:事件判断() then --租仓库
			tp.窗口.对话栏:文本("","","本次租借需要消耗#R"..((self.召唤兽仓库总数-1)*1000000+1000000).."#W两银子，你是否需要进行购买仓库操作？",{"确定购买召唤兽仓库","让我再想想"})
		elseif self.资源组[11]:事件判断() then --存
			if self.选择召唤兽~=0 and bblb[self.选择召唤兽]~=nil then
				if bblb[self.选择召唤兽].参战信息~=nil then
					tp.常规提示:打开("#Y/参战的召唤兽无法存入仓库。")
				else
					发送数据(6802,{类型="存",认证码=self.选择召唤兽认证码,页数=self.仓库页数})
				end
			else
				tp.常规提示:打开("#Y/请选择一只召唤兽进行存放。")
			end
		elseif self.资源组[12]:事件判断() then --取
			if self.选择仓库召唤兽~=0 and self.召唤兽仓库数据[self.选择仓库召唤兽]~=nil then
				发送数据(6802,{类型="取",认证码=self.选择仓库召唤兽认证码,页数=self.仓库页数})
			else
				tp.常规提示:打开("#Y/请选择一只仓库召唤兽进行取出。")
			end
		end
		if bblb[1]~=nil and bblb[self.选择召唤兽] ~= nil then
			box(self.x+343,self.y+85+(self.选择召唤兽*24),self.x+343+247,self.y+85+(self.选择召唤兽*24)+23,-10790181)
		end
		for i=1,7 do
			if bblb[i] ~= nil then
				local jx = self.x+343
				local jy = self.y+85+(i*24)
				bw1:置坐标(jx,jy)
				if bw1:检查点(x,y) and self.鼠标 then
					box(jx,jy,jx+247,jy+23,-2097481216)
					if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
						self.选择召唤兽 = i
						self.选择召唤兽认证码 = bblb[i].认证码
					elseif 引擎.鼠标弹起(1) and self.鼠标 and not tp.消息栏焦点 then
						self.右键关闭 = 1
						self.选择召唤兽 = i
						self.选择召唤兽认证码 = bblb[i].认证码
		                tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[self.选择召唤兽])
		            else
						self.右键关闭 = nil
					end
				end
				if bblb[i].参战信息 == 1 then
					ckzts:置颜色(黄色):显示(jx+3,jy+3,bblb[i].名称)
					ckzts:置颜色(黄色):显示(jx+155,jy+3,bblb[i].等级)
				else
				    ckzts:置颜色(黑色):显示(jx+3,jy+3,bblb[i].名称)
				    ckzts:置颜色(黑色):显示(jx+155,jy+3,bblb[i].等级)
				end
				if bblb[i].加锁~=nil and bblb[i].加锁 then
		    		tp.加锁图标_:显示(jx+220,jy)
		    	end
			end
		end
		if ckbb[1]~=nil and ckbb[self.选择仓库召唤兽] ~= nil then
			box(self.x+18,self.y+85+(self.选择仓库召唤兽*24),self.x+18+247,self.y+85+(self.选择仓库召唤兽*24)+23,-10790181)
		end
		for i=1,7 do
			if ckbb[i] ~= nil then
				local jx = self.x+18
				local jy = self.y+85+(i*24)
				bw2:置坐标(jx,jy)
				if bw2:检查点(x,y) and self.鼠标 then
					box(jx,jy,jx+247,jy+23,-2097481216)
					if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
						self.选择仓库召唤兽 = i
						self.选择仓库召唤兽认证码 = ckbb[i].认证码
					elseif 引擎.鼠标弹起(1) and self.鼠标 and not tp.消息栏焦点 then
						self.右键关闭 = 1
						self.选择仓库召唤兽 = i
						self.选择仓库召唤兽认证码 = ckbb[i].认证码
		                tp.窗口.召唤兽查看栏:打开(ckbb[self.选择仓库召唤兽])
		            else
						self.右键关闭 = nil
					end
				end
				if ckbb[i].参战信息 == 1 then
					ckzts:置颜色(黄色):显示(jx+3,jy+3,ckbb[i].名称)
					ckzts:置颜色(黄色):显示(jx+155,jy+3,ckbb[i].等级)
				else
				    ckzts:置颜色(黑色):显示(jx+3,jy+3,ckbb[i].名称)
				    ckzts:置颜色(黑色):显示(jx+155,jy+3,ckbb[i].等级)
				end
				if ckbb[i].加锁~=nil and ckbb[i].加锁 then
		    		tp.加锁图标_:显示(jx+220,jy)
		    	end
			end
		end
		local new_x = 0
		local new_y = 0
		for n=1,self.召唤兽仓库总数 do
			if n < 8 then
		    	self.召唤兽仓库组[n]:显示(self.x+15+(n-1)*25,self.y+298,nil,nil,nil,self.仓库页数==n,2)
		    	ckzts1:置颜色(白色):显示(self.x+22+(n-1)*25,self.y+301,n)
		    else
		    	self.召唤兽仓库组[n]:显示(self.x+15+new_x*25,self.y+335+new_y*25,nil,nil,nil,self.仓库页数==n,2)
		    	if n >=10 then
		    		ckzts1:置颜色(白色):显示(self.x+18+new_x*25,self.y+336+new_y*25,n)
			    else
			    	ckzts1:置颜色(白色):显示(self.x+22+new_x*25,self.y+336+new_y*25,n)
			    end
		    	new_x = new_x + 1
		    end
		    if new_x == 10 then
		    	new_y = new_y + 1
		    	new_x = 0
		    end
		end
	end
end

function 场景类_仓库类:检查点(x,y)
	if self.可视 and (self.资源组[1]:是否选中(x,y) or self.资源组[9]:是否选中(x,y) or self.资源组[15]:是否选中(x,y)) then
		return true
	end
end

function 场景类_仓库类:初始移动(x,y)
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

function 场景类_仓库类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

return 场景类_仓库类