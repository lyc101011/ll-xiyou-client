-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-10 23:55:10
local 交易类 = class()
local tp,zts,zts1
local insert = table.insert
local xxx = 0
local yyy = 0
local sts = {"单价","数量","总额","现金"}
local tos = 引擎.取金钱颜色
local mouseb = 引擎.鼠标弹起
local bw = require("gge包围盒")(0,0,120,20)
local box = 引擎.画矩形

function 交易类:初始化(根)
   	self.ID = 70
	self.x = 200
	self.y = 78
	self.xx = 0
	self.yy = 0
	self.注释 = "交易类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.右键关闭=1
	self.窗口时间 = 0
	self.对方bb={}
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("银两输入",-10,-11,100,14,根,根.字体表.华康14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(8)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	self.选择 = 根._按钮.创建(根.资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true)--根._按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0xFF205590),0,0,1,true,true)
	self.选择:置根(根)
	self.选择:置偏移(-3,2)
	self.选择1 = 根._按钮.创建(根.资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true)
	self.选择1:置根(根)
	self.选择1:置偏移(-3,2)
	self.选择xy={{x=0,y=0},{x=0,y=0}}
	self.物品输入组 = {}
	self.物品输入组[1] = 总控件:创建输入("物品1数量",0,0,40,14,根,根.字体表.华康14)
	self.物品输入组[1]:置可视(false,false)
	self.物品输入组[1]:置限制字数(3)
	self.物品输入组[1]:置数字模式()
	self.物品输入组[1]:屏蔽快捷键(true)
	self.物品输入组[1]:置光标颜色(-16777216)
	self.物品输入组[1]:置文字颜色(-16777216)

	self.物品输入组[2] = 总控件:创建输入("物品2数量",0,0,40,14,根,根.字体表.华康14)
	self.物品输入组[2]:置可视(false,false)
	self.物品输入组[2]:置限制字数(3)
	self.物品输入组[2]:置数字模式()
	self.物品输入组[2]:屏蔽快捷键(true)
	self.物品输入组[2]:置光标颜色(-16777216)
	self.物品输入组[2]:置文字颜色(-16777216)

	self.物品输入组[3] = 总控件:创建输入("物品3数量",0,0,40,14,根,根.字体表.华康14)
	self.物品输入组[3]:置可视(false,false)
	self.物品输入组[3]:置限制字数(3)
	self.物品输入组[3]:置数字模式()
	self.物品输入组[3]:屏蔽快捷键(true)
	self.物品输入组[3]:置光标颜色(-16777216)
	self.物品输入组[3]:置文字颜色(-16777216)
	tp = 根
	xs1 = tp.字体表.普通字体

end


function 交易类:打开(名称,等级,类型)
	if self.可视 then
		self.可视 = false
		self.输入框:置可视(false,false)
		for n=1,3 do
			self.物品输入组[n]._输入焦点 = false
			self.物品输入组[n]._光标可视 = false
	    	self.物品输入组[n]:置可视(false,false)
     		self.物品输入组[n]:置文本("")
	    end
		发送数据(3719)
		self.资源组 = nil
		self.物品 = nil
		self.对方物 = nil

		self.对象名称=nil
	    self.对象等级=nil
	    self.对象类型=nil
	    self.格子=nil
	    self.bb=nil
	    self.显示类型=nil
	    self.锁定状态=nil
	    self.对方bb=nil
	    self.对方道具=nil
	    self.对方银子=nil
	    self.对方开关=nil
	    self.偏移量=nil
	    资源 = nil
	    按钮 = nil
	    自适应= nil
	    名称= nil
	    等级= nil
	    类型= nil
		return
	else
		insert(tp.窗口_,self)
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		local 资源 = tp.资源
		self.资源组 = {
			[1] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确 定"),
			[2] = 自适应.创建(0,1,500,360,3,9),
			[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"取 消"),
			[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"物 品"),
			[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 召唤兽"),
			[7] = 自适应.创建(7,1,104,22,1,3,nil,18),--银两
			[8] = 自适应.创建(7,1,52,22,1,3,nil,18),--物品数量
			[9] = 自适应.创建(7,1,195,22,1,3,nil,18),--召唤兽
			[10] = 自适应.创建(34,1,227,237,3,9),

		}  --common/wzife.wdf 294257081
		self.物品={}
		self.资源组[1]:置偏移(10,0)
		self.资源组[3]:置偏移(10,0)
		self.资源组[4]:置偏移(10,0)
		for i=1,20 do
			self.物品[i] = tp._物品格子.创建(0,0,i,"交易_物品")
		end
		self.对方物品={}
		for n=1,3 do
			self.对方物品[n] = tp._物品格子.创建(0,0,i,"交易_物品")
		end
		local wp = tp._物品
		for q=1,20 do
			--local sp = wp()
			--sp:置对象(tp.道具列表[q])
			self.物品[q]:置物品(tp.道具列表[q])
			self.物品[q].格子=nil
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.对象名称=名称
	    self.对象等级=等级 or 0
	    self.对象类型=类型
	    self.格子={}
	    self.bb={}
	    self.输入框:置可视(true,true)
	    self.输入框:置文本("0")
	    self.显示类型="物品"
	    self.选择1:置打勾框(false)
	    self.选择:置打勾框(false)
	    self.锁定状态=false
	    self.对方bb={}
	    self.对方道具={}
	    self.对方银子=0
	    self.对方开关=false
	    for n=1,3 do
	    	self.物品输入组[n]._输入焦点 = false
			self.物品输入组[n]._光标可视 = false
	    	self.物品输入组[n]:置可视(false,false)
     		self.物品输入组[n]:置文本()
	    end
	     self.偏移量={0,0,0}
	end
end

function 交易类:设置对方数据(数据)
	self.对方银子=数据.银子 or 0
	for n=1,3 do
		self.对方物品[n]:置物品(数据.道具[n])
     	self.对方物品[n].交易数量 = 数据.数量[n]
	end
	self.对方bb=数据.bb
	self.对方开关=true
	self.选择1:置打勾框(true)
end
function 交易类:更新(dt) end

function 交易类:设置物品(id)
	local 编号=0
	for n=1,3 do
		if not self.格子[n] and 编号==0 then 编号=n end
	end
	if 编号==0 then
		self.物品[self.格子[1]].格子=nil
		self.格子[1]=id
		self.物品[self.格子[1]].格子=1
	else
		self.格子[编号]=id
		self.物品[self.格子[编号]].格子=1
		self.物品输入组[编号]:置可视(true,true)

		if self.物品[self.格子[编号]].物品.可叠加 and self.物品[self.格子[编号]].物品.数量~=nil and self.物品[self.格子[编号]].物品.数量~=0 then
			self.物品输入组[编号]:置文本(tonumber(self.物品[self.格子[编号]].物品.数量))
		else
		self.物品输入组[编号]:置文本(1)
		end

     	-- self.物品输入组[编号]:置文本(1)
	end
end

function 交易类:物品显示(dt,x,y)
	local xx = 0
	local yy = 0

	tp.物品界面背景_:显示(self.x+231,self.y+81)
	tp.物品格子背景_:显示(self.x+19,self.y+65)
	tp.物品格子背景_:显示(self.x+19+56,self.y+65)
	tp.物品格子背景_:显示(self.x+19+56+56,self.y+65)
	tp.物品格子背景_:显示(self.x+19,self.y+262)
	tp.物品格子背景_:显示(self.x+19+56,self.y+262)
	tp.物品格子背景_:显示(self.x+19+56+56,self.y+262)
	self.资源组[8]:显示(self.x+19,self.y+124)
	self.资源组[8]:显示(self.x+19+56,self.y+124)
	self.资源组[8]:显示(self.x+19+56+56,self.y+124)
	self.资源组[8]:显示(self.x+19,self.y+320)
	self.资源组[8]:显示(self.x+19+56,self.y+320)
	self.资源组[8]:显示(self.x+19+56+56,self.y+320)

	xs1:置颜色(白色)
	xs1:显示(self.x + 193,self.y + 93,"确认")
	xs1:显示(self.x + 193,self.y + 289,"确认")
	for i=1,20 do
		if self.物品[i].格子==nil then
			self.物品[i]:置坐标(self.x-180 + xx * 51 + 220+10+182,self.y + yy * 51 + 108-20-8)
			self.物品[i]:显示(dt,x,y,self.鼠标)
			if self.物品[i].焦点 and not tp.消息栏焦点 then
				if self.物品[i].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[i].物品)
					if 引擎.鼠标弹起(左键) and self.锁定状态==false then
						self:设置物品(i)
					end
				end
				self.焦点 = true
			end
		end
		xx = xx + 1
		if xx == 5 then
			xx = 0
			yy = yy + 1
		end
	end
	for n=1,3 do
		if self.物品[self.格子[n]]~=nil and self.物品[self.格子[n]].格子 then
			-- if self.自己开关 and tonumber(self.物品输入组[n]:取文本()) ~= self.输入数量[n] then
			--     self.物品输入组[n]:置文本(self.输入数量[n])
			--     tp.常规提示:打开("#Y/已锁定，无法再更改数量。")
			-- end
			if self.物品输入组[n]:取文本() == nil or self.物品输入组[n]:取文本() == "" then
				-- self.物品输入组[n]:置文本(1)
			elseif (tonumber(self.物品输入组[n]:取文本())>1 and tonumber(self.物品输入组[n]:取文本()) < 100) or tonumber(self.物品输入组[n]:取文本())==0 then
				if self.物品[self.格子[n]].物品.可叠加 and self.物品[self.格子[n]].物品.数量~=nil and self.物品[self.格子[n]].物品.数量~=0 then
					if tonumber(self.物品输入组[n]:取文本()) > self.物品[self.格子[n]].物品.数量 then
						self.物品输入组[n]:置文本(tonumber(self.物品[self.格子[n]].物品.数量))
						if tonumber(self.物品输入组[n]:取文本()) > 9 then
							self.偏移量[n]=2
						end
					else
						if tonumber(self.物品输入组[n]:取文本()) > 9 then
							self.偏移量[n]=2
						end
					end
				else
					self.物品输入组[n]:置文本(1)
				end
			elseif tonumber(self.物品输入组[n]:取文本()) > 99 then
				if self.物品[self.格子[n]].物品.可叠加 and self.物品[self.格子[n]].物品.数量~=nil and self.物品[self.格子[n]].物品.数量~=0 then
					if tonumber(self.物品输入组[n]:取文本()) > self.物品[self.格子[n]].物品.数量 then
						self.物品输入组[n]:置文本(tonumber(self.物品[self.格子[n]].物品.数量))
						if tonumber(self.物品输入组[n]:取文本()) > 9 then
							self.偏移量[n]=2
						end
					else
						self.物品输入组[n]:置文本(99)
						self.偏移量[n]=2
					end
				else
					self.物品输入组[n]:置文本(1)
				end
			end
		end
	end
 	for n=1,3 do
     	if self.格子[n]~=nil then
         	self.物品[self.格子[n]]:置坐标(self.x + n*56-58+15+6 ,self.y + 78+14-28)
	     	self.物品[self.格子[n]]:显示(dt,x,y,self.鼠标)--,nil,nil,nil,1,1
	       	if self.物品[self.格子[n]].焦点 and not tp.消息栏焦点 then
				if self.物品[self.格子[n]].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[self.格子[n]].物品)
					if 引擎.鼠标弹起(左键) and self.锁定状态==false then
                        self.物品[self.格子[n]].选择=nil
                        self.格子[n]=nil
                        self.物品输入组[n]:置可视(false,false)
                        self.物品输入组[n]:置文本("")
					end
				end
				self.焦点 = true
			end
     	end
	end
	if self.对方开关 then
		for n=1,3 do
			--self.物品[self.格子[n]]:置坐标(self.x + n*58-58+15 ,self.y + 298)
			self.对方物品[n]:置坐标(self.x + n*56-58+15+6,self.y + 298-37)
			self.对方物品[n]:显示(dt,x,y,self.鼠标)--(dt,x,y,self.鼠标,nil,nil,nil,nil,true)
			xs1:置样式(1):置颜色(黑色):显示(self.x + (n-1)*56+40,self.y+324,self.对方物品[n].交易数量)
			xs1:置样式(0)
			if  self.对方物品[n].焦点 and not tp.消息栏焦点 then
				if self.对方物品[n].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.对方物品[n].物品)
				end
				self.焦点 = true
			end
		end
	end
end

function 交易类:取是否选中(id)
	for n=1,3 do
		if self.bb[n]==id then return true  end
	end
	return false
end

function 交易类:设置交易召唤兽(id)
	local 编号=0
	for n=1,3 do
		if not self.bb[n] and 编号==0 then 编号=n end
		if self.bb[n]==id then self.bb[n]=nil return  end
	end
	if 编号==0 then
		self.bb[1]=id
	else
		self.bb[编号]=id
	end
end

function 交易类:召唤兽显示(dt,x,y)
	--self.资源组[6]:显示(self.x+275,self.y+50)
	local 点击事件=false
	self.资源组[9]:显示(self.x+24,self.y+65)
	self.资源组[9]:显示(self.x+24,self.y+65+30)
	self.资源组[9]:显示(self.x+24,self.y+65+60)
	self.资源组[9]:显示(self.x+24,self.y+262)
	self.资源组[9]:显示(self.x+24,self.y+262+30)
	self.资源组[9]:显示(self.x+24,self.y+262+60)
	self.资源组[10]:显示(self.x+253,self.y+75)
	xs1:置颜色(白色)
	xs1:显示(self.x + 223,self.y + 64,"确认")
	xs1:显示(self.x + 223,self.y + 260,"确认")
	for n=1,#tp.队伍[1].宝宝列表 do
		if self:取是否选中(n) then
			xs1:置颜色(红色)
		else
			xs1:置颜色(黑色)
		end
		local jx = self.x+262
		local jy = self.y+57+n*25
		bw:置坐标(jx,jy+1)

		if bw:检查点(x,y) and 点击事件==false and self.锁定状态==false  then
			box(jx-5,jy+34-25-12-2,jx+202,jy+26,-10790181)
			if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
				self:设置交易召唤兽(n)
				点击事件=true
			elseif 引擎.鼠标弹起(1) and self.鼠标 and not tp.消息栏焦点 then
				tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[n])
				点击事件=true
			end
		end
		xs1:显示(self.x+262,self.y+59+n*25,tp.队伍[1].宝宝列表[n].名称)
	end
	for n=1,3 do
		if self.bb[n]~=nil then
			xs1:置颜色(黑色):显示(self.x+33,self.y+22+17+n*30,tp.队伍[1].宝宝列表[self.bb[n]].名称)
			bw:置坐标(self.x+33,self.y+22+17+n*30)
			if bw:检查点(x,y) then
				if 引擎.鼠标弹起(左键) and self.鼠标 and not tp.消息栏焦点  and self.锁定状态==false then
					self.bb[n]=nil
				elseif 引擎.鼠标弹起(右键) and self.鼠标 and not tp.消息栏焦点 then
					tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[self.bb[n]])
				end
			end
		end
	end
	if self.对方开关 then
		xs1:置颜色(黑色)
		for n=1,3 do
			if self.对方bb[n]~=nil then
				xs1:置颜色(黑色):显示(self.x+33,self.y+22+13+200+n*30,self.对方bb[n].名称)
				bw:置坐标(self.x+33,self.y+22+17+200+n*30)
				if bw:检查点(x,y) then
					if 引擎.鼠标弹起(左键) and self.鼠标 and not tp.消息栏焦点   then
						-- self.bb[n]=nil
					elseif 引擎.鼠标弹起(右键) and self.鼠标 and not tp.消息栏焦点 then
						tp.窗口.召唤兽查看栏:打开(self.对方bb[n])
					end
				end
			end
		end
	end
end

function 交易类:显示(dt,x,y)

	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[1]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.焦点=false
	self.选择:更新(x,y)
	self.选择1:更新(x,y)
	self.资源组[2]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-88+self.资源组[2].宽度/2,self.y)
	xs1:置颜色(白色)
	xs1:置颜色(白色):显示(self.x+self.资源组[2].宽度/2-50+38,self.y+3,"交 易")

	self.输入框:置坐标(self.x + 123+9,self.y + 40+11)
	-- self.选择xy={{x=self.x+190-180,y=self.y + 80-17+3},{x=self.x+190-180,y=self.y + 320-61}}
	if self.显示类型=="物品" then
		self:物品显示(dt,x,y)
		self.选择:显示(self.x+193,self.y+66,true,nil,nil,self.选择.打勾框,2)
		self.选择1:显示(self.x+193,self.y+262,true,nil,nil,self.选择1.打勾框,2)
		for n=1,3 do
			self.物品输入组[n]:置可视(true,true)
		end
	else
		-- self.资源组[6]:显示(self.x-180,self.y)
		self:召唤兽显示(dt,x,y)
		self.选择:显示(self.x+224,self.y+36,true,nil,nil,self.选择.打勾框,2)
		self.选择1:显示(self.x+224,self.y+232,true,nil,nil,self.选择1.打勾框,2)
		for n=1,3 do
			self.物品输入组[n]:置可视(false,false)
		end
	end
	self.资源组[7]:显示(self.x+114,self.y+36)
	self.资源组[7]:显示(self.x+114,self.y+36+196)

	self.资源组[1]:显示(self.x+275-200+87+119,self.y+322)
	self.资源组[3]:显示(self.x+372,self.y+322)
	self.资源组[4]:显示(self.x+275-200+87+119,self.y+36,nil,nil,nil,self.显示类型=="物品",2)
	self.资源组[5]:显示(self.x+372,self.y+36,nil,nil,nil,self.显示类型=="召唤兽",2)

 	if self.资源组[3]:事件判断() then
		self:打开()
		return
	elseif self.选择:事件判断() or self.资源组[1]:事件判断() then
		self.选择:置打勾框(true)
   	   	发送数据(3717,{银子=self.输入框:取文本(),道具=self.格子,bb=self.bb,数量={tonumber(self.物品输入组[1]:取文本()),tonumber(self.物品输入组[2]:取文本()),tonumber(self.物品输入组[3]:取文本())}})
	elseif self.资源组[4]:事件判断() then
		self.显示类型="物品"
		-- self.选择xy={{x=self.x+185-180,y=self.y + 80},{x=self.x+185-180,y=self.y + 320}}
	elseif self.资源组[5]:事件判断() then
		self.显示类型="召唤兽"
		-- self.选择xy={{x=self.x+218-180,y=self.y + 42},{x=self.x+218-180,y=self.y + 260}}
	end

	xs1:置颜色(白色)
	xs1:显示(self.x + 17,self.y + 170,"你正在和")
	xs1:显示(self.x + 193,self.y + 170,"交易")
	xs1:显示(self.x + 17,self.y + 199,"等 级")
	xs1:显示(self.x + 112,self.y + 199,"关 系")
	xs1:显示(self.x + 17,self.y + 40,"己方支付银两")
	xs1:显示(self.x + 17,self.y + 237,"对方支付银两")
	xs1:置颜色(黄色)
	xs1:显示(self.x + 65,self.y + 199,(self.对象等级 or 0 ).."           陌生人")
	xs1:显示(self.x + 86,self.y + 170,self.对象名称)
	xs1:置颜色(引擎.取金钱颜色(self.对方银子))
    xs1:显示(self.x + 123,self.y + 236,self.对方银子) --:置颜色(引擎.取金钱颜色(self.对方银子))
	for n=1,3 do
		self.物品输入组[n]:置坐标(self.x + (n-1)*56+40,self.y + 128)
		if self.物品输入组[n]._已碰撞 then
			self.焦点 = true
		end
	end
	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)
end

function 交易类:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and self.资源组[2]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 交易类:初始移动(x,y)
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

function 交易类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 交易类