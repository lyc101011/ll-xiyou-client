-- @Author: baidwwy
-- @Date:   2023-10-25 19:31:19
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-01-05 18:51:13

local 藏宝阁类 = class()
local tp
local 格子
local daidai=引擎.画矩形
local bw = require("gge包围盒")(0,0,245,18)
local tx=引擎.取头像
local insert=table.insert
local daidaishuju={}
local bw1 = require("gge包围盒")(0,0,120,20)
function 藏宝阁类:初始化(根)
	tp = 根
	self.ID = 100
	self.x = -20
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	--self.文字= tp.字体表.普通字体
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("银两输入",0,0,100,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(20)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
	local wz = require("gge文字类")
    self.文字 = wz.创建(nil,14,false,false,false)
    self.大文字 = wz.创建("wdf/font/hkyt_w5.ttf",15,false,false,true)
	self.出售银两 = 总控件:创建输入("银两输入2",0,0,100,14)
	self.出售银两:置可视(false,false)
	self.出售银两:置限制字数(15)
	self.出售银两:置数字模式()
	self.出售银两:屏蔽快捷键(true)
	self.出售银两:置光标颜色(-16777216)
	self.出售银两:置文字颜色(-16777216)
	self.出售价格 = 总控件:创建输入("价格输入",0,0,100,14)
	self.出售价格:置可视(false,false)
	self.出售价格:置限制字数(15)
	self.出售价格:置数字模式()
	self.出售价格:屏蔽快捷键(true)
	self.出售价格:置光标颜色(-16777216)
	self.出售价格:置文字颜色(-16777216)
end

function 藏宝阁类:打开(内容,仙玉)
	if self.可视  then
		self.界面显示 = 1
		self.我的数据 = nil
		self.输入框:置可视(false,false)
		self.可视 = false
		self.出售银两:置可视(false,false)
		self.出售价格:置可视(false,false)
		self.资源=nil
		self.scan =nil
		self.gwcan=nil
		self.gman=nil
		self.gdan=nil
		self.xjan=nil
		self.qhan=nil
		self.资源1=nil
		self.资源2=nil
		return
	else
	    table.insert(tp.窗口_,self)
	    local 资源 = tp.资源
		local 自适应 = tp._自适应
		local 按钮 = tp._按钮
		self.背景 = pwddd("2231")
		self.背景底图 = pwddd("2233")
		self.背景1 = pwddd("2250")
		self.资源 = {
			[1] = 按钮.创建(pwddd("2234"),0,0,4,true,true," 装 备"),
			[2] = 按钮.创建(pwddd("2234"),0,0,4,true,true," 灵 饰"),
			[3] = 按钮.创建(pwddd("2234"),0,0,4,true,true," 召唤兽"),
			[4] = 按钮.创建(pwddd("2234"),0,0,4,true,true," 梦幻币"),
			[5] = 按钮.创建(pwddd("2234"),0,0,4,true,true," 其 他"),
			[6] = 按钮.创建(pwddd("2234"),0,0,4,true,true," 防 具"),--xx
			[7] = 按钮.创建(pwddd("2234"),0,0,4,true,true," 全 部"),--xx
			[8] = 按钮.创建(pwddd("2244"),0,0,1,true,true),
			[9] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"购买商品"),--按钮.创建(pwd("85"),0,0,4,true,true,"购买商品"),
			[10] = nil,
			[11] = nil,
			[12] = 按钮.创建(自适应.创建(73,4,759,27,1,3),0,0,4,true,true),
			[13] = 按钮.创建(pwddd("2248"),0,0,1,true,true),
			[14] = 按钮.创建(pwddd("2247"),0,0,1,true,true),
			[15] = 按钮.创建(pwddd("2246"),0,0,1,true,true),
			[16] = 按钮.创建(pwddd("2237"),0,0,1,true,true),
			[17] = 按钮.创建(pwddd("2238"),0,0,1,true,true),
			[18] = 按钮.创建(pwddd("2264"),0,0,1,true,true),
			[19] = 按钮.创建(pwddd("2234"),0,0,4,true,true," 角 色"),
			[20] = 按钮.创建(pwddd("2249"),0,0,1,true,true),
			[21] = pwddd("2235"),
			[22] = pwddd("2236"),
			[23] = pwddd("2243"),
			[24] = pwddd("2251"),
			[25] = pwddd("2252"),
			[26] = 按钮.创建(pwddd("2253"),0,0,1,true,true),
			[27] = 按钮.创建(pwddd("2254"),0,0,1,true,true),
			[28] = nil,
			[29] = 自适应.创建(0,1,295,295,3,9),
			[30] = 自适应.创建(1,1,265,18,1,3,nil,18),
			[31] = tp.窗口标题背景_,
			[32] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[33] = 自适应.创建(2,1,268,199,3,9),
			[34] =  按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 确定"),
			[35] =  按钮.创建(自适应.创建(12,4,60,22,1,3),0,0,4,true,true," 取消"),
			[36] = pwddd("2255"),
			[37] = 按钮.创建(pwddd("2256"),0,0,1,true,true),
			[38] = 按钮.创建(pwddd("2257"),0,0,1,true,true),
			[39] = pwddd("2258"),
			[40] = 按钮.创建(pwddd("2241"),0,0,1,true,true),
			[41] = 按钮.创建(pwddd("2254"),0,0,1,true,true),
			[42] = pwddd("2259"),
			[43] = pwddd("2260"),
			[44] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"快捷支付"),
			[45] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"余额支付"),
			[46] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"扫码支付"),
			[47] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"网页支付"),
			[48] = pwddd("2261"),
			[49] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"寄售物品"),
			[50] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"我的物品"),
			[51] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"历史物品"),
			[52] = pwddd("2262"),
			[53] = pwddd("2266"),
			[54] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"订单管理"),
			[55] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"消息提醒"),
			[56] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"我的收藏"),
			[57] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"我的兴趣"),
			[58] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"买到物品"),
			[59] = pwddd("2267"),
			[60] = 按钮.创建(pwddd("2264"),0,0,1,true,true),
		}
		self.资源1 = {
		[1] = 按钮.创建(自适应.创建(73,4,90,27,1,3),0,0,4,true,true),
		[2] = 按钮.创建(自适应.创建(73,4,90,27,1,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(73,4,75,27,1,3),0,0,4,true,true),
		[4] = 按钮.创建(自适应.创建(73,4,79,27,1,3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(73,4,99,27,1,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(73,4,97,27,1,3),0,0,4,true,true),
		[7] = 按钮.创建(自适应.创建(73,4,90,27,1,3),0,0,4,true,true),
		[8] = 按钮.创建(自适应.创建(73,4,139,27,1,3),0,0,4,true,true),
	}
		self.资源2 = {
                [1] = 按钮.创建(pwddd("2232"),0,0,4,true,true),
                [2] = 按钮.创建(pwddd("2232"),0,0,4,true,true),
                [3] = 按钮.创建(pwddd("2232"),0,0,4,true,true),
                [4] = 按钮.创建(pwddd("2232"),0,0,4,true,true),
                [5] = 按钮.创建(pwddd("2232"),0,0,4,true,true),
	}

		self.scan ={}
		self.gwcan={}
		self.gman={}
		self.gdan={}
		self.xjan={}
		self.qhan={}
		for n=1,6 do
		   self.scan[n]=按钮.创建(pwddd("2239"),0,0,1,true,true)
		   self.gwcan[n]=按钮.创建(pwddd("2240"),0,0,1,true,true)
		   self.gman[n]=按钮.创建(pwddd("2241"),0,0,1,true,true)
		   self.gdan[n]=按钮.创建(pwddd("2242"),0,0,1,true,true)
		   self.xjan[n]=按钮.创建(pwddd("2263"),0,0,1,true,true)
		   self.qhan[n]=按钮.创建(pwddd("2268"),0,0,1,true,true)
		end
		self.召唤兽底图 = tp.资源:载入('pic/bp/jr.png',"图片")
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.数据 = 内容
		self.装备 = self.数据.装备
		self.灵饰 = self.数据.灵饰
		self.银子 = self.数据.银两
			self.仙玉 =仙玉
		self.其他 = self.数据.其他
		self.召唤兽 = self.数据.召唤兽
		self.角色 = self.数据.角色
		self.显示数据 = {}
		self.选中编号 = 0
		self.选中背景 = tp.资源:载入('aaa.wdf',"网易WDF动画",0x6F88F494)
		self.界面显示 = 1  --1装备  2出售  3灵饰   4银子  5召唤兽 6其他
		self.显示id = 0
		格子 = tp._物品格子
		for n=1,#self.装备 do
			self.显示数据[n] = 格子.创建(0,0,n,"藏宝阁出售_物品")
			self.显示数据[n]:置物品(self.装备[n].物品)
			self.显示数据[n].价格 = tonumber(self.装备[n].价格)
			self.显示数据[n].结束时间 = self.装备[n].结束时间
			self.显示数据[n].编号 = n
		end
		self.页数 = 0
		self.总页数 = math.ceil(#self.装备/6)
		self.输入框:置可视(true,true)
		self.可视 = true
		self.起点=1
		self.终点=6
		self.代代总数据=self.装备
		self.bh=0
	    self.寄售界面子类=nil
	    self.跳转流程=nil
	    self.daicoco=40
	    self.介绍文本 = tp._丰富文本(500,20)
	    self:allitem()
	    self.界面显示 = 9
		self.我的数据 = nil
		self.我的界面子类=nil
	end
end

function 藏宝阁类:刷新数据(内容)
	self.数据 = 内容
	self.装备 = self.数据.装备
	self.灵饰 = self.数据.灵饰
	self.银子 = self.数据.银两
	self.其他 = self.数据.其他
	self.召唤兽 = self.数据.召唤兽
	self.角色 = self.数据.角色
	self:重置数据(self.界面显示)
	self.我的数据 = nil
end

function 藏宝阁类:重置数据(类型)
	self.bh=0
	self.寄售界面子类=nil
	self.我的界面子类=nil
	if 类型 == 1 then
		self.代代总数据=self.装备
		self.页数 = 0
		self.总页数 = math.ceil(#self.装备/6)
		self.显示数据 = {}
		local 格子 = tp._物品格子
		for n=1,#self.装备 do
			self.显示数据[n] = 格子.创建(0,0,n,"藏宝阁出售_物品")
			self.显示数据[n]:置物品(self.装备[n].物品)
			self.显示数据[n].价格 = tonumber(self.装备[n].价格)
			self.显示数据[n].结束时间 = self.装备[n].结束时间
			self.显示数据[n].编号 = n
		end
	elseif 类型 == 3 then
		self.代代总数据=self.灵饰
		self.页数 = 0
		self.总页数 = math.ceil(#self.灵饰/6)
		self.显示数据 = {}
		local 格子 = tp._物品格子
		for n=1,#self.灵饰 do
			self.显示数据[n] = 格子.创建(0,0,n,"藏宝阁出售_物品")
			self.显示数据[n]:置物品(self.灵饰[n].物品)
			self.显示数据[n].价格 = tonumber(self.灵饰[n].价格)
			self.显示数据[n].结束时间 = self.灵饰[n].结束时间
			self.显示数据[n].编号 = n
		end
	elseif 类型 == 4 then
		self.代代总数据=self.召唤兽
		self.页数 = 0
		self.总页数 = math.ceil(#self.召唤兽/6)
		self.显示数据 = {}
		for n=1,#self.召唤兽 do
			self.显示数据[n]={}
			local xn = 引擎.取头像(self.召唤兽[n].召唤兽.模型)
			self.显示数据[n].小动画 = tp.资源:载入(xn[7],"网易WDF动画",xn[1])--pwdd(xn)
			self.显示数据[n].价格 = tonumber(self.召唤兽[n].价格)
			self.显示数据[n].结束时间 = self.召唤兽[n].结束时间
			self.显示数据[n].编号 = n
			self.显示数据[n].名称 = self.召唤兽[n].召唤兽.模型
			self.显示数据[n].等级 = self.召唤兽[n].召唤兽.等级
			self.显示数据[n].种类 = self.召唤兽[n].召唤兽.种类
		end
	elseif 类型 == 7 then
		self.代代总数据=self.角色
		self.页数 = 0
		self.总页数 = math.ceil(#self.角色/6)
		self.显示数据 = {}
		for n=1,#self.角色 do
			self.显示数据[n]={}
			local xn = 引擎.取头像(self.角色[n].角色信息.模型)
			self.显示数据[n].小动画 = tp.资源:载入(xn[9],"网易WDF动画",xn[8])
			self.显示数据[n].价格 = tonumber(self.角色[n].价格)
			self.显示数据[n].结束时间 = self.角色[n].结束时间
			self.显示数据[n].编号 = n
			self.显示数据[n].名称 = self.角色[n].角色信息.名称
			self.显示数据[n].等级 = self.角色[n].角色信息.等级
			self.显示数据[n].门派 = self.角色[n].角色信息.门派
		end
	elseif 类型 == 5 then
		self.代代总数据=self.银子
		self.页数 = 0
		self.总页数 = math.ceil(#self.银子/6)
		self.显示数据 = {}
		for n=1,#self.银子 do
			self.显示数据[n] = {}
			self.显示数据[n].小动画 = tp.资源:载入("item.wdf","网易WDF动画", 0x5453A471)
			self.显示数据[n].价格 = tonumber(self.银子[n].价格)
			self.显示数据[n].结束时间 = self.银子[n].结束时间
			self.显示数据[n].数额 = self.银子[n].数额
			self.显示数据[n].编号 = n
		end
	elseif 类型 == 6 then
		self.代代总数据=self.其他
		self.页数 = 0
		self.总页数 = math.ceil(#self.其他/6)
		self.显示数据 = {}
		local 格子 = tp._物品格子
		for n=1,#self.其他 do
			self.显示数据[n] = 格子.创建(0,0,n,"藏宝阁出售_物品")
			self.显示数据[n]:置物品(self.其他[n].物品)
			self.显示数据[n].价格 = tonumber(self.其他[n].价格)
			self.显示数据[n].结束时间 = self.其他[n].结束时间
			self.显示数据[n].编号 = n
		end
	end
	self.显示id = 0
	self.选中编号 = 0
end
function 藏宝阁类:取头像()
	self.售卖头像=nil
	if self.寄售界面子类==1 then
		self.售卖头像=tp.资源:载入("item.wdf","网易WDF动画", 0x5453A471)
	end
end
function 藏宝阁类:更新(dt,x,y)
	if self.界面显示 ~= 2 and  self.界面显示 ~= 8 then
		self.资源[1]:更新(x,y,self.界面显示~=1)
		self.资源[2]:更新(x,y,self.界面显示~=3)
		self.资源[3]:更新(x,y,self.界面显示~=4)
		self.资源[4]:更新(x,y,self.界面显示~=5)
		self.资源[5]:更新(x,y,self.界面显示~=6)
		self.资源[19]:更新(x,y,self.界面显示~=7)
        self.资源[6]:更新(x,y)
        self.资源[7]:更新(x,y,self.界面显示~=9)
		self.资源[8]:更新(x,y)
		--self.资源[9]:更新(x,y)
		self.资源[16]:更新(x,y)
		self.资源[17]:更新(x,y)
		self.资源[18]:更新(x,y)
		if self.资源[1]:事件判断() then  --装备
			self:重置数据(1)
			self.界面显示 = 1
			self.我的数据 = nil
		elseif self.资源[2]:事件判断() then  --灵饰
			self:重置数据(3)
			self.界面显示 = 3
			self.我的数据 = nil
		elseif self.资源[3]:事件判断() then --召唤兽
			self:重置数据(4)
			self.界面显示 = 4
			self.我的数据 = nil
		elseif self.资源[4]:事件判断() then --银两
			self:重置数据(5)
			self.界面显示 = 5
			self.我的数据 = nil
		elseif self.资源[5]:事件判断() then --其他
			self:重置数据(6)
			self.界面显示 = 6
			self.我的数据 = nil
		elseif self.资源[7]:事件判断() then
			self:allitem()
			self.界面显示 = 9
			self.我的数据 = nil
		elseif self.资源[19]:事件判断() then --人物
			self:重置数据(7)
			self.界面显示 = 7
			self.我的数据 = nil
		elseif self.资源1[4]:事件判断() then --价格排序
			self:价格排序()
			self.我的数据 = nil
		elseif self.资源1[6]:事件判断() then --时间排序
			self:时间排序()
			self.我的数据 = nil
		elseif self.资源[8]:事件判断() then --时间排序
			if self.输入框:取文本() == "" then
				tp.提示:写入("#y/请正确输入您要搜索的物品名称")
			else
				self:关键字排序()
				self.我的数据 = nil
			end
		elseif self.资源[9]:事件判断() then
			if self.选中编号 == 0 then
				tp.提示:写入("#y/请选择你要购买的物品")
			else
				发送数据(60.9,{编号=self.显示数据[self.选中编号].编号,类型=self.界面显示})
			end
		elseif self.资源[18]:事件判断() then
               self:打开()
               return

		end

		if self.资源[16]:事件判断() then
	     if self.起点>1 then
	         self.起点=self.起点-1
	         self.终点=self.终点-1
	       end
		elseif self.资源[17]:事件判断() then
	     if self.终点<#self.代代总数据 then
	     	self.起点=self.起点+1
	     	self.终点=self.终点+1
	     end
		end
	elseif self.界面显示 == 2 then
		if self.背景1:是否选中() and  引擎.鼠标弹起(右键) then
			self:打开()
			return
		end
		if self.资源[13]:事件判断() then --物品
			发送数据(60.1)
			return
		elseif self.资源[14]:事件判断() then --召唤兽
			发送数据(60.2)
			return
		elseif self.资源[15]:事件判断() then --银两
			发送数据(60.3)
			return
		elseif self.资源[20]:事件判断() then --角色
			--tp.窗口.藏宝阁角色出售:打开()
			self:daidaichushou4()
			return
		end
	end

end
function 藏宝阁类:daidaichushou(数额)
	self.现有金币=数额+0
    self.寄售界面子类=1
    self:取头像()
end
function 藏宝阁类:daidaichushou6()
self:itembuy()
end
function 藏宝阁类:daidaichushou7(数据)
 self.代代总数据2=数据
 self:代代排序()
end
function 藏宝阁类:daidaichushou2(内容,类型)
	self.bb数据 = 内容
	self.bb选中 = 0
	self.bbcc选中 =0
	self.寄售界面子类=2
	self.召唤兽头像=nil
end
function 藏宝阁类:daidaichushou4()
	self.寄售界面子类=4
	local x = tx(tp.队伍[1].模型)
	self.待出售人物头像 = tp.资源:载入(x[7],"网易WDF动画",x[2])
end
function 藏宝阁类:daidaichushou3(内容,类型)
	self.物品列表 = 内容.道具
	self.物品数据 = {}
	self.寄售界面子类=3
	self.wp选中 = 0
	self.wpcc选中 =0
	self.wp物品 = {}
	local 格子 = tp._物品格子
	for i=1,20 do
		self.wp物品[i] = 格子.创建(0,0,i,"藏宝阁出售_物品")
	end
	for i=1,20 do
		self.wp物品[i]:置物品(self.物品列表[i])
	end
	 self.待寄售物品=格子.创建(0,0,i,"藏宝阁出售_物品")
end
function 藏宝阁类:取宝宝头像(txx)
	self.召唤兽头像=nil
    local n=引擎.取宝宝40头像(txx)
    if n=="0" then
    	local xn = 引擎.取头像(txx)
    	self.召唤兽头像=tp.资源:载入(xn[7],"网易WDF动画",xn[2])
    else
    	self.召唤兽头像=pwdd(n)
    end
end
function 藏宝阁类:取物品头像(txx)
 self.待寄售物品:置物品(nil)
 self.待寄售物品:置物品(self.物品列表[txx])
end
function 藏宝阁类:显示(dt,x,y)
	self:更新(dt,x,y)
	self.焦点 = false
	--if self.界面显示 ~= 2 then
		self.背景底图:显示(self.x+58,self.y+208)
        self.背景:显示(self.x+50,self.y+50)
        self.资源[12]:显示(self.x+61,self.y+192)
        self.资源[18]:显示(self.x+801,self.y+57)
        self.资源1[1]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
        self.资源1[2]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
        self.资源1[3]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
        self.资源1[4]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
        self.资源1[5]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
        self.资源1[6]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
        self.资源1[7]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
        self.资源1[8]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
        self.资源1[1]:显示(self.x+61,self.y+192)
        self.资源1[2]:显示(self.x+61+90,self.y+192)
        self.资源1[3]:显示(self.x+61+90+90,self.y+192)
        self.资源1[4]:显示(self.x+61+90+90+75,self.y+192)
        self.资源1[5]:显示(self.x+61+90+90+75+79,self.y+192)
        self.资源1[6]:显示(self.x+61+90+90+75+79+99,self.y+192)
        self.资源1[7]:显示(self.x+61+90+90+75+79+99+97,self.y+192)
        self.资源1[8]:显示(self.x+61+90+90+75+79+99+97+90,self.y+192)
        self.资源2[1]:更新(x,y,self.界面显示==2 or self.界面显示==8 )
        self.资源2[2]:更新(x,y)
        self.资源2[3]:更新(x,y)
        self.资源2[4]:更新(x,y,self.界面显示~=2)
        self.资源2[5]:更新(x,y,self.界面显示~=8)
		self.资源2[1]:显示(self.x+81,self.y+78)
		self.资源2[2]:显示(self.x+81+100,self.y+78)
		self.资源2[3]:显示(self.x+81+200,self.y+78)
		self.资源2[4]:显示(self.x+81+300,self.y+78)
		self.资源2[5]:显示(self.x+81+400,self.y+78)
		if self.界面显示 ~= 2 and self.界面显示 ~= 8 then
		self.大文字:置颜色(0XFF19536C)
        self.大文字:显示(self.x+99,self.y+85,"游览商品")
        else
        self.大文字:置颜色(0XFF98ADCD)
        self.大文字:显示(self.x+99,self.y+85,"游览商品")
        end
        self.大文字:置颜色(0XFF98ADCD)
        self.大文字:显示(self.x+99+100,self.y+85," 公示期")
        self.大文字:显示(self.x+99+200,self.y+85,"推荐商品")
        self.大文字:显示(self.x+64,self.y+55,"藏宝阁")
		if self.界面显示 == 8 then
		self.大文字:置颜色(0XFF19536C)
        self.大文字:显示(self.x+491,self.y+85,"我的藏宝阁")
        else
        self.大文字:置颜色(0XFF98ADCD)
        self.大文字:显示(self.x+491,self.y+85,"我的藏宝阁")
        end
		if self.界面显示 == 2 then
		self.大文字:置颜色(0XFF19536C)
        self.大文字:显示(self.x+99+300,self.y+85,"我是卖家")
        else
        self.大文字:置颜色(0XFF98ADCD)
        self.大文字:显示(self.x+99+300,self.y+85,"我是卖家")
        end
		self.资源[1]:显示(self.x+391,self.y+115,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[2]:显示(self.x+545,self.y+115,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[3]:显示(self.x+237,self.y+115,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[4]:显示(self.x+160,self.y+115,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[5]:显示(self.x+622,self.y+115,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[19]:显示(self.x+314,self.y+115,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[6]:显示(self.x+468,self.y+115,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[7]:显示(self.x+83,self.y+115,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[8]:显示(self.x+801,self.y+87)

		if self.我的数据 ~= nil then
			self.资源[18]:显示(self.x+270,self.y+495)
		end
		if self.界面显示 == 1 then
		    self:装备显示(x,y)
		    self.文字:置颜色(黑色)
		elseif self.界面显示 == 3 then
			self:灵饰显示(x,y)
			self.文字:置颜色(黑色)
		elseif self.界面显示 == 4 then
			self:召唤兽显示(x,y)
			self.文字:置颜色(黑色)
		elseif self.界面显示 == 5 then
			self:银子显示(x,y)
			self.文字:置颜色(黑色)
		elseif self.界面显示 == 6 then
			self:其他显示(x,y)
			self.文字:置颜色(黑色)
		elseif self.界面显示 == 7 then
			self:角色显示(x,y)
		elseif self.界面显示 == 9 then
			self:总显示(x,y)
		elseif self.界面显示 == 8 then
			self.资源[36]:显示(self.x+50,self.y+107)
			if self.bookdai==1 then
			if self.bh==20 then
		       if self.跳转动画~=nil then
	            self.资源[42]:显示(self.x+61,self.y+192)
		        self.资源[37]:更新(x,y)
		        self.资源[38]:更新(x,y)
				self.资源[37]:显示(self.x+735,self.y+193)
				self.资源[38]:显示(self.x+734,self.y+221)
				self.跳转动画:显示(self.x+93,self.y+198)
		        self.文字:置颜色(黑色)
		        self.文字:显示(self.x+169,self.y+214,self.跳转名称)
		        self.文字:置颜色(红色)
		        self.文字:显示(self.x+336,self.y+214,self.跳转价格)
		        self.文字:置颜色(黑色)
		         self.文字:显示(self.x+278,self.y+214,self.跳转等级)
		       if self.资源[37]:事件判断() then
                   -- self.跳转流程=2
                     tp.窗口.藏宝阁最终支付:打开(self.跳转动画,self.跳转价格,self.显示数据[self.跳转bh].编号,self.跳转界面)
		       	elseif self.资源[38]:事件判断() then
		       		self:itembuy()
		       	end
			  end
		   end
		  end
	       self.资源[54]:更新(x,y,self.bookdai~=1)
	       self.资源[55]:更新(x,y)
	       self.资源[56]:更新(x,y)
	       self.资源[57]:更新(x,y)
	       self.资源[58]:更新(x,y,self.bookdai~=2)
	       self.资源[54]:显示(self.x+83,self.y+114,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
	       self.资源[55]:显示(self.x+160,self.y+114,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
	       self.资源[56]:显示(self.x+237,self.y+114,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
	       self.资源[57]:显示(self.x+314,self.y+114,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
	       self.资源[58]:显示(self.x+391,self.y+114,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
	       if self.bookdai==2 then
	       self.资源[59]:显示(self.x+50,self.y+144)
            	self.显示id = 0
				 local 位置=0
				 for n=self.起点,self.终点 do
				     位置=位置+1
				     if daidaishuju2~=nil then
				      if daidaishuju2[n]~=nil then
							if self:IsOuNumber(n) then
							daidai(self.x+62,self.y+109+位置*60,self.x+62+758,self.y+109+60+位置*60,0XFFB9B9D9)
						    else
						    daidai(self.x+62,self.y+109+位置*60,self.x+62+758,self.y+109+60+位置*60,0XFFB0B0D5)
						    end
				      	    self.资源[21]:显示(self.x+78,self.y+114+位置*60)
				       	    self.qhan[位置]:更新(x,y)
				      	    self.qhan[位置]:显示(self.x+717,self.y+129+位置*60)
							if daidaishuju2[n].小动画:是否选中(x,y) then
								self.显示id = n
							end
							daidaishuju2[n].小动画:显示(self.x+79, self.y+117+位置*60)
							 self.文字:置颜色(黑色)
							 self.文字:显示(self.x+202,self.y+130+位置*60,daidaishuju2[n].名称)
							 self.文字:显示(self.x+377,self.y+130+位置*60,"已付款待取出")
					         if self.选中编号==n then
					         	self.选中背景:显示(self.x+80, self.y+114+位置*60)
					         end
				         	 if self.qhan[位置]:事件判断() then
								发送数据(63.2,{编号=daidaishuju2[n].编号})
						    end
				      end
				  end
				  end
				  	self.资源[16]:更新(x,y)
						self.资源[17]:更新(x,y)
						if self.资源[16]:事件判断() then
					     if self.起点>1 then
					         self.起点=self.起点-1
					         self.终点=self.终点-1
					       end
						elseif self.资源[17]:事件判断() then
					     if self.终点<#daidaishuju2 then
					     	self.起点=self.起点+1
					     	self.终点=self.终点+1
					     end
						end
					  if self.资源[52]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 then
					     if self.起点>1 then
					         self.起点=self.起点-1
					         self.终点=self.终点-1
					       end
					  elseif self.资源[52]:是否选中(x,y)  and 引擎.取鼠标滚轮() ==-1 then
					     if self.终点<#daidaishuju2 then
					     	self.起点=self.起点+1
					     	self.终点=self.终点+1
					     end
				      end
				if self.显示id ~= 0 then
					if 引擎.鼠标弹起(左键) then
						self.选中编号 = self.显示id
					end
				end
	       end
	       if self.资源[54]:事件判断() then
	       	self.bookdai=1
           elseif self.资源[58]:事件判断() then
           	发送数据(63.1)
           	self.bookdai=2
	       end

		end
	    if self.跳转流程==1 then
	       self.资源[39]:显示(self.x+215,self.y+141)
	       self.资源[40]:更新(x,y)
	       self.资源[41]:更新(x,y)
	       self.资源[40]:显示(self.x+319,self.y+469)
	       self.资源[41]:显示(self.x+455,self.y+469)
	       self.跳转动画:显示(self.x+254,self.y+246)
	       self.文字:置颜色(黑色)
	       self.文字:显示(self.x+326,self.y+274,self.跳转名称)
	       self.文字:置颜色(红色)
	       self.文字:显示(self.x+440,self.y+272,self.跳转价格)
	       self.文字:置颜色(黑色)
	       if self.资源[40]:事件判断() then
	       	self.跳转流程=false
	       	self.bh=0
			self.界面显示 = 8
			self.我的数据 = nil
			self.bookdai=1
	       	elseif self.资源[41]:事件判断() then
	       		self:itembuy()
	       	end
	    elseif  self.跳转流程==2 and self.跳转动画~=nil then
	    	   -- if tp.窗口.藏宝阁最终支付.可视==false then
	    	   --    tp.窗口.藏宝阁最终支付:打开(self.跳转动画,self.跳转价格,self.显示数据[self.跳转bh].编号,self.跳转界面)
	    	   -- end
	   --     self.资源[43]:显示(self.x+130,self.y+69)
	   --     self.资源[44]:更新(x,y)
	   --     self.资源[45]:更新(x,y)
	   --     self.资源[46]:更新(x,y)
	   --     self.资源[47]:更新(x,y)
	   --     self.资源[60]:更新(x,y)
	   --     self.资源[44]:显示(self.x+256,self.y+210,nil,nil,nil,nil,nil,nil,nil,nil,0XFF19536C)
	   --     self.资源[45]:显示(self.x+355,self.y+210,nil,nil,nil,nil,nil,nil,nil,nil,0XFF19536C)
	   --     self.资源[46]:显示(self.x+454,self.y+210,nil,nil,nil,nil,nil,nil,nil,nil,0XFF19536C)
	   --     self.资源[47]:显示(self.x+553,self.y+210,nil,nil,nil,nil,nil,nil,nil,nil,0XFF19536C)
    --        self.资源[60]:显示(self.x+722,self.y+73)
	   --     self.跳转动画:显示(self.x+151,self.y+125)
	   --      self.文字:置颜色(红色)
	   --      self.文字:显示(self.x+635,self.y+141,self.跳转价格)
	   --      self.文字:置颜色(黑色)
    --         if self.资源[46]:事件判断() then
    --         	self.daicoco=0
    --         elseif self.资源[60]:事件判断() then
    --         	self.跳转流程=nil
    --         end
    --         if self.daicoco<40 then
    --         	self.资源[48]:显示(self.x+134,self.y+250)
    --         	self.介绍文本:清空()
    --         	self.介绍文本:添加文本("#H/使用#R/微信#H/支付:#R/"..self.跳转价格.."#R/元 #H/(含微信官方额外收取的#R/0#H/元通道费用)")
    --             self.介绍文本:显示(self.x+154,self.y+252)
    --             self.文字:置颜色(黑色)
    --             self.文字:显示(self.x+415,self.y+439,"剩余:"..math.floor(40-self.daicoco))
    --         end
    --         if self.daicoco>=38 and  self.daicoco<=39 then
	   --          if self.跳转bh == 0 or self.跳转bh == nil then
				-- 	tp.提示:写入("#y/支付失败")
    --                  self.daicoco=40
    --                  self.跳转流程=nil
				-- 	return
				-- else
				-- 	发送数据(60.9,{编号=self.显示数据[self.跳转bh].编号,类型=self.跳转界面})
				-- 	self.daicoco=40
				-- 	self.跳转流程=nil
				-- end
		  --   end
	    end
		self.输入框:置坐标(self.x+682,self.y+90)
		self.控件类:更新(dt,x,y)
		if self.输入框._已碰撞 then
			self.焦点 = true
		end
		self.控件类:显示(x,y)
        if self.界面显示==2 then
        self.资源[13]:更新(x,y,self.寄售界面子类==nil and self.我的界面子类==nil)
		self.资源[14]:更新(x,y,self.寄售界面子类==nil and self.我的界面子类==nil)
		self.资源[15]:更新(x,y,self.寄售界面子类==nil and self.我的界面子类==nil)
		self.资源[20]:更新(x,y,self.寄售界面子类==nil and self.我的界面子类==nil)
		self.背景1:显示(self.x+51,self.y+110)
		self.资源[13]:显示(self.x+456,self.y+211)
		self.资源[14]:显示(self.x+268,self.y+211)
		self.资源[15]:显示(self.x+83,self.y+211)
		self.资源[20]:显示(self.x+642,self.y+211)
        self.资源[49]:更新(x,y,self.我的界面子类~=nil)
        self.资源[50]:更新(x,y,self.我的界面子类~=1)
        self.资源[51]:更新(x,y,self.我的界面子类~=2)
		self.资源[49]:显示(self.x+84,self.y+112,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[50]:显示(self.x+160,self.y+112,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		self.资源[51]:显示(self.x+237,self.y+112,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
		if self.资源[49]:事件判断() then
			self.我的界面子类=nil
		elseif self.资源[50]:事件判断() then
			self.我的界面子类=1
			self:我的排序()
		end
	        if self.我的界面子类==1 then
              self.资源[52]:显示(self.x+51,self.y+140)
              	self.显示id = 0
				 local 位置=0
				 for n=self.起点,self.终点 do
				     位置=位置+1
				      if daidaishuju[n]~=nil then
							if self:IsOuNumber(n) then
							daidai(self.x+62,self.y+109+位置*60,self.x+62+758,self.y+109+60+位置*60,0XFFB9B9D9)
						    else
						    daidai(self.x+62,self.y+109+位置*60,self.x+62+758,self.y+109+60+位置*60,0XFFB0B0D5)
						    end
				      	    self.资源[21]:显示(self.x+78,self.y+114+位置*60)

				       	    self.xjan[位置]:更新(x,y)
				      	    self.xjan[位置]:显示(self.x+708,self.y+125+位置*60)

							if daidaishuju[n].小动画:是否选中(x,y) then
								self.显示id = n
							end
							daidaishuju[n].小动画:显示(self.x+78, self.y+115+位置*60)
							 self.文字:置颜色(黑色)
							 self.文字:显示(self.x+177,self.y+132+位置*60,daidaishuju[n].名称)
							 self.文字:显示(self.x+269,self.y+132+位置*60,daidaishuju[n].等级)
							 self.文字:置颜色(红色)
							 self.文字:显示(self.x+344,self.y+132+位置*60,daidaishuju[n].价格)
							 self.文字:置颜色(黑色)
							 self.文字:显示(self.x+421,self.y+132+位置*60,"正在上架")
							 self.文字:显示(self.x+532,self.y+132+位置*60,math.ceil((daidaishuju[n].剩余时间-os.time())/86400).."天")
					         if self.选中编号==n then
					         	self.选中背景:显示(self.x+80, self.y+114+位置*60)
					         end
				         	 if self.xjan[位置]:事件判断() then
								发送数据(60.4,{编号=daidaishuju[n].编号,类型=daidaishuju[n].界面类型})
						    end
				      end
						self.资源[16]:更新(x,y)
						self.资源[17]:更新(x,y)
						if self.资源[16]:事件判断() then
					     if self.起点>1 then
					         self.起点=self.起点-1
					         self.终点=self.终点-1
					       end
						elseif self.资源[17]:事件判断() then
					     if self.终点<#daidaishuju then
					     	self.起点=self.起点+1
					     	self.终点=self.终点+1
					     end
						end
					  if self.资源[52]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 then
					     if self.起点>1 then
					         self.起点=self.起点-1
					         self.终点=self.终点-1
					       end
					  elseif self.资源[52]:是否选中(x,y)  and 引擎.取鼠标滚轮() ==-1 then
					     if self.终点<#daidaishuju then
					     	self.起点=self.起点+1
					     	self.终点=self.终点+1
					     end
				      end
 	 end
	if self.显示id ~= 0 then
		if 引擎.鼠标弹起(左键) then
			self.选中编号 = self.显示id
		end
	end
		   end
        end
		  if  self.寄售界面子类==1 then
		  	self.出售银两:置可视(true)
		    self.出售价格:置可视(true)
			self.资源[24]:显示(self.x+51,self.y+149)
			self.资源[25]:显示(self.x+338,self.y+237)
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+338,self.y+180,"金钱")
			self.文字:显示(self.x+338,self.y+208,"拥有")
			self.文字:置颜色(红色)
			self.文字:显示(self.x+370,self.y+208,self.现有金币)
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+377+string.len(self.现有金币)*7,self.y+208,"两")
	        self.文字:显示(self.x+276,self.y+239,"出售数量")
	        self.文字:显示(self.x+522,self.y+239,"两")
	        self.文字:显示(self.x+304,self.y+270,"价格")
            self.文字:显示(self.x+419,self.y+270,"元")
            self.文字:显示(self.x+442,self.y+270,"0")
            self.文字:显示(self.x+522,self.y+270,"分")
            self.文字:显示(self.x+276,self.y+310,"确认价格")
            self.文字:显示(self.x+343,self.y+310,self.出售价格:取文本())
            self.文字:显示(self.x+419,self.y+310,"元")
            self.文字:显示(self.x+442,self.y+310,"0")
            self.文字:显示(self.x+522,self.y+310,"分")
            self.文字:显示(self.x+276,self.y+346,"上架时间")
            self.文字:显示(self.x+342,self.y+346,"1")
            self.文字:显示(self.x+424,self.y+346,"天")
            self.文字:显示(self.x+253,self.y+429,"出售金额留在钱包")
            self.文字:显示(self.x+338,self.y+474,"交易成功后您将得到")
			self.文字:置颜色(红色)
			self.文字:显示(self.x+468,self.y+474,self.出售价格:取文本())
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+474+string.len(self.出售价格:取文本())*7,self.y+474,"元。")
			self.资源[26]:更新(x,y)
			self.资源[27]:更新(x,y)
			self.资源[26]:显示(self.x+338,self.y+510)
			self.资源[27]:显示(self.x+466,self.y+510)
			self.售卖头像:显示(self.x+269,self.y+177)
			self.出售银两:置坐标(self.x+343,self.y+239)
			self.出售价格:置坐标(self.x+343,self.y+270)
			self.控件类:更新(dt,x,y)
			self.控件类:显示(x,y)
			if self.资源[26]:事件判断() then
				if tonumber(self.出售银两:取文本()) == nil or tonumber(self.出售价格:取文本()) == nil then
		    		tp.常规提示:打开("#Y/请正确输入出售银两以及价格！")
					return
				elseif 	tonumber(self.出售银两:取文本()) < 199999999 then
					tp.常规提示:打开("#y/上架金额不能小于2亿银两")
					return 0
				elseif 	tonumber(self.出售银两:取文本()) >= 9999999999999 then
					tp.常规提示:打开("#y/上架金额不能超过")
					return 0
				elseif 	tonumber(self.出售价格:取文本()) >= 9999999999999 then
					tp.常规提示:打开("#y/上架金额不能超过")
					return 0
				end
				发送数据(60.8,{编号=self.出售银两:取文本()+0,价格=self.出售价格:取文本()+0})
			elseif self.资源[27]:事件判断() then
			 self.界面显示 = 2
	         self.我的数据 = nil
	         self.寄售界面子类=nil
			end
		 elseif  self.寄售界面子类==2 then
		 	self.出售价格:置可视(true)
		 	self.资源[24]:显示(self.x+51,self.y+149)
	        self.文字:显示(self.x+304,self.y+270,"价格")
            self.文字:显示(self.x+419,self.y+270,"元")
            self.文字:显示(self.x+442,self.y+270,"0")
            self.文字:显示(self.x+522,self.y+270,"分")
            self.文字:显示(self.x+276,self.y+310,"确认价格")
            self.文字:显示(self.x+343,self.y+310,self.出售价格:取文本())
            self.文字:显示(self.x+419,self.y+310,"元")
            self.文字:显示(self.x+442,self.y+310,"0")
            self.文字:显示(self.x+522,self.y+310,"分")
            self.文字:显示(self.x+276,self.y+346,"上架时间")
            self.文字:显示(self.x+342,self.y+346,"1")
            self.文字:显示(self.x+424,self.y+346,"天")
            self.文字:显示(self.x+253,self.y+429,"出售金额留在钱包")
            self.文字:显示(self.x+338,self.y+474,"交易成功后您将得到")
			self.文字:置颜色(红色)
			self.文字:显示(self.x+468,self.y+474,self.出售价格:取文本())
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+474+string.len(self.出售价格:取文本())*7,self.y+474,"元。")
			self.出售价格:置坐标(self.x+343,self.y+270)
			self.控件类:更新(dt,x,y)
			self.控件类:显示(x,y)
			if self.召唤兽头像~=nil and self.bb选中~=nil and self.bb选中~=0 then
			   self.召唤兽头像:显示(self.x+273,self.y+177)
			   self.文字:置颜色(黑色)
			   self.文字:显示(self.x+331,self.y+177,self.bb数据[self.bb选中].模型)
			   self.文字:显示(self.x+331,self.y+204,self.bb数据[self.bb选中].等级.."级")
			end
			 if self.bb选中==0 then
			 	self.资源[29]:显示(self.x+287,self.y+170)
			 	--self.资源[30]:显示(self.x+292,self.y+174)
			 	--self.资源[31]:置区域(0,0,125,20)
			 	self.资源[31]:显示(self.x+340,self.y+170)
			 	self.文字:置颜色(白色)
			 	self.文字:显示(self.x+398,self.y+174,"选择召唤兽")
			 	self.文字:置颜色(黑色)
			 	self.资源[32]:显示(self.x+559,self.y+177)
			 	self.资源[33]:显示(self.x+302,self.y+206)
			 	self.资源[34]:更新(x,y)
			 	self.资源[35]:更新(x,y)
			 	self.资源[34]:显示(self.x+365,self.y+423)
			 	self.资源[35]:显示(self.x+445,self.y+423)
					for n = 1, 10, 1 do
						if self.bb数据[n] ~= nil then
							if self.bbcc选中 == n then
								daidai(self.x+305,self.y+194+n*19,self.x+305+245,self.y+194+18+n*19,0XFF585CE8)
							end
							self.文字:显示(self.x+305,self.y+194+n*19,self.bb数据[n].名称)
							bw:置坐标(self.x+305,self.y+194+n*19)
							if bw:检查点(x,y) then
								if 引擎.鼠标弹起(左键) then
									self.bbcc选中 = n
								elseif 引擎.鼠标弹起(右键) then
									self.右键关闭 = true
									tp.窗口.召唤兽查看栏:打开(self.bb数据[n])
								end
							end
						end
					end
			 	if self.资源[34]:事件判断() then
			 		if self.bbcc选中~=0 then
			 			self.bb选中=self.bbcc选中
			 			self:取宝宝头像(self.bb数据[self.bb选中].模型)
			 		end
		 		elseif self.资源[35]:事件判断() then
					 self.界面显示 = 2
			         self.我的数据 = nil
			         self.寄售界面子类=nil
		 		end
			 end
			self.资源[26]:更新(x,y)
			self.资源[27]:更新(x,y)
			self.资源[26]:显示(self.x+338,self.y+510)
			self.资源[27]:显示(self.x+466,self.y+510)
			 if self.资源[26]:事件判断() then
	 			if self.bb选中 == 0 then
	   				tp.提示:写入("#y/请先选中一个召唤兽")
					return 0
	   			elseif tonumber(self.出售价格:取文本()) == nil then
	   				tp.提示:写入("#y/请输入你要出售的价格")
					return 0
				elseif 	tonumber(self.出售价格:取文本()) >= 9999999999999 then
					tp.提示:写入("#y/上架金额不能超过")
					return 0
	   			end
				发送数据(60.6,{编号=self.bb选中,价格=self.出售价格:取文本()+0})
			elseif self.资源[27]:事件判断() then
			 self.界面显示 = 2
	         self.我的数据 = nil
	         self.寄售界面子类=nil
			end
		 elseif  self.寄售界面子类==3 then
		 	self.出售价格:置可视(true)
		 	self.资源[24]:显示(self.x+51,self.y+149)
	        self.文字:显示(self.x+304,self.y+270,"价格")
            self.文字:显示(self.x+419,self.y+270,"元")
            self.文字:显示(self.x+442,self.y+270,"0")
            self.文字:显示(self.x+522,self.y+270,"分")
            self.文字:显示(self.x+276,self.y+310,"确认价格")
            self.文字:显示(self.x+343,self.y+310,self.出售价格:取文本())
            self.文字:显示(self.x+419,self.y+310,"元")
            self.文字:显示(self.x+442,self.y+310,"0")
            self.文字:显示(self.x+522,self.y+310,"分")
            self.文字:显示(self.x+276,self.y+346,"上架时间")
            self.文字:显示(self.x+342,self.y+346,"1")
            self.文字:显示(self.x+424,self.y+346,"天")
            self.文字:显示(self.x+253,self.y+429,"出售金额留在钱包")
            self.文字:显示(self.x+338,self.y+474,"交易成功后您将得到")
			self.文字:置颜色(红色)
			self.文字:显示(self.x+468,self.y+474,self.出售价格:取文本())
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+474+string.len(self.出售价格:取文本())*7,self.y+474,"元。")
			self.出售价格:置坐标(self.x+343,self.y+270)
			self.控件类:更新(dt,x,y)
			self.控件类:显示(x,y)
			self.待寄售物品:置坐标(self.x+272,self.y+172)
			self.待寄售物品:显示(dt,x,y,self.鼠标)
			 if self.wp选中==0 then
			 	self.资源[29]:显示(self.x+287,self.y+170)
			 	--self.资源[30]:显示(self.x+292,self.y+174)

			 	self.资源[31]:显示(self.x+340,self.y+170)
			 	self.文字:置颜色(白色)
			 	self.文字:显示(self.x+398,self.y+174,"选择物品")
			 	self.文字:置颜色(黑色)
			 	self.资源[32]:显示(self.x+559,self.y+177)
			 	tp.物品界面背景_:显示(self.x+306,self.y+200)
			 	self.资源[34]:更新(x,y)
			 	self.资源[35]:更新(x,y)
			 	self.资源[34]:显示(self.x+365,self.y+423)
			 	self.资源[35]:显示(self.x+445,self.y+423)
					local xx = 0
					local yy = 0
					for i=1,20 do
						if self.wp物品[i].物品~=nil then
							self.wp物品[i]:置坐标(self.x + xx * 51 + 306,self.y + yy * 51 + 202)
							self.wp物品[i]:显示(dt,x,y,self.鼠标)
							if self.wp物品[i].焦点 and not tp.消息栏焦点 then
								tp.提示:道具行囊(x,y,self.wp物品[i].物品)
								if 引擎.鼠标弹起(左键) then
									self.wpcc选中 = i
								end
								self.焦点 = true
							end
						end
						if self.wpcc选中 == i then
							self.选中背景:显示(self.x + xx * 51 + 306,self.y + yy * 51 + 202)
						end
						xx = xx + 1
						if xx == 5 then
							xx = 0
							yy = yy + 1
						end
					end
					if self.资源[34]:事件判断() then
				 		if self.wpcc选中~=0 then
				 			self.wp选中=self.wpcc选中
				 			self:取物品头像(self.wp选中)
				 		end
			 		elseif self.资源[35]:事件判断() then
						 self.界面显示 = 2
				         self.我的数据 = nil
				         self.寄售界面子类=nil
			 		end
			 end
			if self.wp选中~=nil and self.wp选中~=0 then
			   self.文字:置颜色(黑色)
			   self.文字:显示(self.x+331,self.y+177,self.wp物品[self.wp选中].物品.名称)
			end
			self.资源[26]:更新(x,y)
			self.资源[27]:更新(x,y)
			self.资源[26]:显示(self.x+338,self.y+510)
			self.资源[27]:显示(self.x+466,self.y+510)
			 if self.资源[26]:事件判断() then
	 			if self.wp选中 == 0 then
	   				tp.提示:写入("#y/请先选中一个召唤兽")
					return 0
	   			elseif tonumber(self.出售价格:取文本()) == nil then
	   				tp.提示:写入("#y/请输入你要出售的价格")
					return 0
				elseif 	tonumber(self.出售价格:取文本()) >= 9999999999999 then
					tp.提示:写入("#y/上架金额不能超过")
					return 0
	   			end
				发送数据(60.5,{编号=self.wp选中,价格=self.出售价格:取文本()+0})
			elseif self.资源[27]:事件判断() then
			 self.界面显示 = 2
	         self.我的数据 = nil
	         self.寄售界面子类=nil
			end
		  elseif  self.寄售界面子类==4 then
		  	self.出售银两:置可视(true)
		    self.出售价格:置可视(true)
			self.资源[24]:显示(self.x+51,self.y+149)
			self.资源[25]:显示(self.x+338,self.y+237)
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+338,self.y+180,tp.队伍[1].名称)
			self.文字:显示(self.x+338,self.y+208,"ID:"..tp.队伍[1].数字id)
	        self.文字:显示(self.x+276,self.y+239,"取回密码")
	        self.文字:显示(self.x+304,self.y+270,"价格")
            self.文字:显示(self.x+419,self.y+270,"元")
            self.文字:显示(self.x+442,self.y+270,"0")
            self.文字:显示(self.x+522,self.y+270,"分")
            self.文字:显示(self.x+276,self.y+310,"确认价格")
            self.文字:显示(self.x+343,self.y+310,self.出售价格:取文本())
            self.文字:显示(self.x+419,self.y+310,"元")
            self.文字:显示(self.x+442,self.y+310,"0")
            self.文字:显示(self.x+522,self.y+310,"分")
            self.文字:显示(self.x+276,self.y+346,"上架时间")
            self.文字:显示(self.x+342,self.y+346,"1")
            self.文字:显示(self.x+424,self.y+346,"天")
            self.文字:显示(self.x+253,self.y+429,"出售金额留在钱包")
            self.文字:显示(self.x+338,self.y+474,"交易成功后您将得到")
			self.文字:置颜色(红色)
			self.文字:显示(self.x+468,self.y+474,self.出售价格:取文本())
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+474+string.len(self.出售价格:取文本())*7,self.y+474,"元。")
			if self.待出售人物头像~=nil then
				self.待出售人物头像:显示(self.x+273,self.y+178)
			end
			self.出售银两:置坐标(self.x+343,self.y+239)
			self.出售价格:置坐标(self.x+343,self.y+270)
			self.控件类:更新(dt,x,y)
			self.控件类:显示(x,y)
			self.资源[26]:更新(x,y)
			self.资源[27]:更新(x,y)
			self.资源[26]:显示(self.x+338,self.y+510)
			self.资源[27]:显示(self.x+466,self.y+510)
			 if self.资源[26]:事件判断() then
				if tonumber(self.出售银两:取文本()) == nil or tonumber(self.出售价格:取文本()) == nil then
		    		tp.提示:写入("#Y/请正确输入出售银两以及价格！")
					return
				end
		        发送数据(61.1,{编号=self.出售银两:取文本()+0,价格=self.出售价格:取文本()+0})
			elseif self.资源[27]:事件判断() then
			 self.界面显示 = 2
	         self.我的数据 = nil
	         self.寄售界面子类=nil
			end
		else
		  	self.出售银两:置可视(false)
		    self.出售价格:置可视(false)

		   end
	self.资源[22]:显示(self.x+50,self.y+538)
	--self.资源[9]:显示(self.x+620,self.y+495)
--	self.资源[11]:显示(self.x+170,self.y+495)
	self.文字:置颜色(黑色)
	self.文字:显示(self.x+66,self.y+559,"钱包余额: "..tp.金钱.."元")
		self.文字:显示(self.x+566,self.y+559,"当前仙玉: "..self.仙玉)
	self.资源[16]:显示(self.x+372,self.y+556)
	self.资源[17]:显示(self.x+493,self.y+556)
	if self.界面显示==9 then
		self.文字:显示(self.x+429,self.y+560,math.ceil(self.终点/6).."/"..math.ceil(#daidaishuju3/6) or "1")
	else
	self.文字:显示(self.x+429,self.y+560,math.ceil(self.终点/6).."/"..math.ceil(#self.代代总数据/6) or "1")
end
	  if self.背景底图:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 then
	     if self.起点>1 then
	         self.起点=self.起点-1
	         self.终点=self.终点-1
	       end
	  elseif self.背景底图:是否选中(x,y)  and 引擎.取鼠标滚轮() ==-1 then
	     if self.终点<#self.代代总数据 then
	     	self.起点=self.起点+1
	     	self.终点=self.终点+1
	     end
      end
	for n=1,6 do
	     self.scan[n]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
	     self.gwcan[n]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
	     self.gdan[n]:更新(x,y,self.界面显示~=2 and self.界面显示~=8)
	end
	if self.bh<20 then
	   self.bh=self.bh+1
       self.资源[23]:更新(dt)
	   self.资源[23]:显示(self.x+315,self.y+278)
    end
	if self.daicoco<40 then
	   self.daicoco=self.daicoco+0.1   ---支付时间控制
    end
	if self.资源2[4]:事件判断() then
	self.界面显示 = 2
	self.我的数据 = nil
	elseif self.资源2[1]:事件判断() then
	    self:allitem()
	    self.界面显示 = 9
		self.我的数据 = nil
		self.我的界面子类=nil
	elseif self.资源2[5]:事件判断() then
	self.bh=0
	self.界面显示 = 8
	self.我的数据 = nil
	end
	if self.bh==20 then
		self:seek(self.输入框:取文本())
	end
	if self.seekbei~=nil then
       self.资源[53]:显示(self.x+679,self.y+106)
       for n=1,5 do
		bw1:置坐标(self.x+684,self.y+97+n*20)
		if bw1:检查点(x,y) then
			daidai(self.x+684,self.y+97+n*20,self.x+684+120,self.y+97+20+n*20,0XFFC8C85C)
			if 引擎.鼠标弹起(左键) then
			self.输入框:置文本(self.seekbei[n])
			end
		end
		self.文字:显示(self.x+684,self.y+97+n*20,self.seekbei[n])
	   end
	end
end
function 藏宝阁类:seek(txt)
	self.seekbei=nil
   if txt=="高级"  or txt=="高" then
   	  self.seekbei={
   	  [1]="高级毒",
   	  [2]="高级必杀",
   	  [3]="高级连击",
   	  [4]="高级魔之心",
   	  [5]="高级夜战",
   	}
   else
   	self.seekbei=nil
   end

end
function 藏宝阁类:银子显示(x,y)
	self.文字:显示(self.x+183,self.y+198,"名称")
	self.文字:显示(self.x+264,self.y+198,"价钱")
	self.文字:显示(self.x+339,self.y+198,"单价")
	self.文字:显示(self.x+430,self.y+198,"亮点")
	self.文字:显示(self.x+517,self.y+198,"剩余时间")
	self.文字:显示(self.x+618,self.y+198,"收藏")
if self.bh==20 then
	self.显示id = 0
 local 位置=0
 for n=self.起点,self.终点 do
     位置=位置+1
      if self.显示数据[n]~=nil then
			if self:IsOuNumber(n) then
			daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB9B9D9)
		    else
		    daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB0B0D5)
		    end
      	    self.资源[21]:显示(self.x+78,self.y+166+位置*60)
      	    self.scan[位置]:显示(self.x+620,self.y+176+位置*60)
      	    self.gwcan[位置]:显示(self.x+685,self.y+176+位置*60)
      	    self.gman[位置]:更新(x,y)
      	    self.gman[位置]:显示(self.x+736,self.y+168+位置*60)
		    self.gdan[位置]:显示(self.x+736,self.y+194+位置*60)
			if self.显示数据[n].小动画:是否选中(x,y) then
				self.显示id = n
			end
			self.显示数据[n].小动画:显示(self.x+78, self.y+169+位置*60)
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+183,self.y+174+位置*60,"金钱")
			self.文字:显示(self.x+170,self.y+196+位置*60,math.floor(self.显示数据[n].数额/10000).."万两")
			self.文字:置颜色(蓝色)
			self.文字:显示(self.x+255,self.y+183+位置*60,"￥"..self.显示数据[n].价格)
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+342,self.y+174+位置*60,math.floor((self.显示数据[n].数额/10000)/self.显示数据[n].价格))
			self.文字:显示(self.x+328,self.y+196+位置*60,"万两/元")
			self.文字:显示(self.x+536,self.y+183+位置*60,math.ceil((self.显示数据[n].结束时间-os.time())/86400).."天")
         if self.选中编号==n then
         	self.选中背景:显示(self.x+80, self.y+169+位置*60)
         end
         	 if self.gman[位置]:事件判断() then
		    	self:itembuy(n,self.界面显示)
		    end
      end
 	 end
	if self.显示id ~= 0 then
		if 引擎.鼠标弹起(左键) then
			self.选中编号 = self.显示id
		end
	end
end
end

function 藏宝阁类:itembuy(sa,fx)
   self.跳转动画=nil
   self.跳转界面=nil
   self.跳转名称=nil
   self.跳转价格=nil
   self.跳转流程=nil
   self.跳转等级=nil
   self.跳转bh=nil

   if fx==5 then
			self:重置数据(fx)
			self.界面显示 = fx
			self.我的数据 = nil
   self.跳转动画=tp.资源:载入("item.wdf","网易WDF动画",0x5453A471)
   self.跳转界面=fx
   self.跳转名称=math.floor(self.显示数据[sa].数额/10000).."万两"
   self.跳转价格=self.显示数据[sa].价格
   self.跳转等级="0"
   self.跳转流程=1
   self.跳转bh=sa
   elseif fx==4 then
   				self:重置数据(fx)
			self.界面显示 = fx
			self.我的数据 = nil
   	local xn = 引擎.取宝宝40头像(self.召唤兽[sa].召唤兽.模型)
   	if xn=="0" then
    	local xn = 引擎.取头像(txx)
    	self.跳转动画=tp.资源:载入(xn[7],"网易WDF动画",xn[2])
    else
    	self.跳转动画=pwdd(xn)
    end
    self.跳转界面=fx
    self.跳转名称=self.召唤兽[sa].召唤兽.模型
    self.跳转价格=self.召唤兽[sa].价格
    self.跳转等级=self.召唤兽[sa].召唤兽.等级 or 0
    self.跳转流程=1
    self.跳转bh=sa
   elseif fx==7 then
   	self:重置数据(fx)
	self.界面显示 = fx
	self.我的数据 = nil
	local xn = 引擎.取头像(self.角色[sa].角色信息.模型)
	self.跳转动画 = tp.资源:载入(xn[9],"网易WDF动画",xn[8])
	self.跳转界面=fx
    self.跳转名称=self.角色[sa].角色信息.名称
    self.跳转价格=self.角色[sa].价格
    self.跳转等级=self.角色[sa].角色信息.等级 or 0
    self.跳转流程=1
    self.跳转bh=sa
    elseif fx==1 then
    self:重置数据(fx)
	self.界面显示 = fx
	self.我的数据 = nil
	local xn = 引擎.取物品(self.装备[sa].物品.名称)
	self.跳转动画 = tp.资源:载入(xn[11],"网易WDF动画",xn[12])
	self.跳转界面=fx
    self.跳转名称=self.装备[sa].物品.名称
    self.跳转价格=self.装备[sa].价格
    self.跳转等级=self.装备[sa].物品.级别限制 or 0
    self.跳转流程=1
    self.跳转bh=sa
    elseif fx==3 then
    self:重置数据(fx)
	self.界面显示 = fx
	self.我的数据 = nil
	local xn = 引擎.取物品(self.灵饰[sa].物品.名称)
	self.跳转动画 = tp.资源:载入(xn[11],"网易WDF动画",xn[12])
	self.跳转界面=fx
    self.跳转名称=self.灵饰[sa].物品.名称
    self.跳转价格=self.灵饰[sa].价格
     self.跳转等级=self.灵饰[sa].物品.级别限制 or 0
    self.跳转流程=1
    self.跳转bh=sa
    elseif fx==6 then
    self:重置数据(fx)
	self.界面显示 = fx
	self.我的数据 = nil
	local xn = 引擎.取物品(self.其他[sa].物品.名称)
	self.跳转动画 = tp.资源:载入(xn[11],"网易WDF动画",xn[12])
	self.跳转界面=fx
    self.跳转名称=self.其他[sa].物品.附带技能 or self.其他[sa].物品.名称
    self.跳转价格=self.其他[sa].价格
    self.跳转等级=self.其他[sa].物品.级别限制 or 0
    self.跳转流程=1
    self.跳转bh=sa
	else
   self.跳转动画=nil
   self.跳转界面=nil
   self.跳转名称=nil
   self.跳转价格=nil
   self.跳转流程=nil
   self.跳转等级=nil
   self.跳转bh=nil
	end
end

function 藏宝阁类:IsOuNumber(num)
    local num1,num2=math.modf(num/2)
    if(num2==0)then
        return true
    else
        return false
    end
end
function 藏宝阁类:价格排序()
	if  self.价格排序开关 == nil or self.价格排序开关 == 1 then
		table.sort(self.显示数据, function (a, b)
			return a.价格 < b.价格
		end)
		self.价格排序开关 = 2
	elseif self.价格排序开关 == 2 then
		table.sort(self.显示数据, function (a, b)
			return a.价格 > b.价格
		end)
		self.价格排序开关 = 1
	end
end

function 藏宝阁类:时间排序()
if  self.时间排序开关 == nil or self.时间排序开关 == 1 then
		table.sort(self.显示数据, function (a, b)
			return a.结束时间 < b.结束时间
		end)
		self.时间排序开关 = 2
	elseif self.时间排序开关 == 2 then
		table.sort(self.显示数据, function (a, b)
			return a.结束时间 > b.结束时间
		end)
		self.时间排序开关 = 1
	end
end
function 藏宝阁类:代代排序()
	self.文字:置颜色(黑色)
	 daidaishuju2={}
    for n=1,#self.代代总数据2 do
    	if self.代代总数据2[n]~=nil then
    	if self.代代总数据2[n].类型 == "物品" then
    		local itemdd={}
            itemdd.名称=self.代代总数据2[n].物品.名称
            itemdd.编号=n
		    local xn = 引擎.取物品(self.代代总数据2[n].物品.名称)
			itemdd.小动画 = tp.资源:载入(xn[11],"网易WDF动画",xn[12])
           insert(daidaishuju2,#daidaishuju2+1,itemdd)
        elseif  self.代代总数据2[n].类型 == "召唤兽" then
    		local itemdd={}
            itemdd.名称=self.代代总数据2[n].召唤兽.模型
            itemdd.编号=n
		   	local xn = 引擎.取头像(self.代代总数据2[n].召唤兽.模型)
		    itemdd.小动画=tp.资源:载入(xn[7],"网易WDF动画",xn[1])
           insert(daidaishuju2,#daidaishuju2+1,itemdd)
        elseif  self.代代总数据2[n].类型 == "银子" then
    		local itemdd={}
            itemdd.名称="金钱"..math.floor(self.代代总数据2[n].数额/10000).."万两"
            itemdd.编号=n
			itemdd.小动画 = tp.资源:载入("item.wdf","网易WDF动画", 0x5453A471)
           insert(daidaishuju2,#daidaishuju2+1,itemdd)
    	end
      end
    end
end

function 藏宝阁类:我的排序()
	self.文字:置颜色(黑色)
	 daidaishuju={}
    for n=1,#self.装备 do
    	if self.装备[n].所有者 == tp.场景.人物.id  then
    		local itemdd={}
    		itemdd.界面类型=1
            itemdd.名称=self.装备[n].物品.名称
            itemdd.价格=self.装备[n].价格
            itemdd.编号=n
		    local xn = 引擎.取物品(self.装备[n].物品.名称)
			itemdd.小动画 = tp.资源:载入(xn[11],"网易WDF动画",xn[12])
			itemdd.剩余时间=self.装备[n].结束时间
			itemdd.等级=self.装备[n].物品.级别限制 or 0
           insert(daidaishuju,#daidaishuju+1,itemdd)
    	end
    end
    for n=1,#self.灵饰 do
    	if self.灵饰[n].所有者 == tp.场景.人物.id  then
    		local itemdd={}
    		itemdd.界面类型=3
            itemdd.名称=self.灵饰[n].物品.名称
            itemdd.价格=self.灵饰[n].价格
            itemdd.编号=n
		    local xn = 引擎.取物品(self.灵饰[n].物品.名称)
			itemdd.小动画 = tp.资源:载入(xn[11],"网易WDF动画",xn[12])
			itemdd.剩余时间=self.灵饰[n].结束时间
			itemdd.等级=self.灵饰[n].物品.级别限制 or 0
           insert(daidaishuju,#daidaishuju+1,itemdd)
    	end
    end
    for n=1,#self.召唤兽 do
    	if self.召唤兽[n].所有者 == tp.场景.人物.id  then
    		local itemdd={}
    		itemdd.界面类型=4
            itemdd.名称=self.召唤兽[n].召唤兽.模型
            itemdd.价格=self.召唤兽[n].价格
            itemdd.编号=n
		   	local xn = 引擎.取头像(self.召唤兽[n].召唤兽.模型)
		    itemdd.小动画=tp.资源:载入(xn[7],"网易WDF动画",xn[1])--pwdd(xn)
		    itemdd.剩余时间=self.召唤兽[n].结束时间
		    itemdd.等级=self.召唤兽[n].召唤兽.等级
           insert(daidaishuju,#daidaishuju+1,itemdd)
    	end
    end
    for n=1,#self.其他 do
    	if self.其他[n].所有者 == tp.场景.人物.id  then
    		local itemdd={}
    		itemdd.界面类型=6
            itemdd.名称=self.其他[n].物品.名称
            itemdd.价格=self.其他[n].价格
            itemdd.编号=n
		    local xn = 引擎.取物品(self.其他[n].物品.名称)
			itemdd.小动画 = tp.资源:载入(xn[11],"网易WDF动画",xn[12])
			itemdd.剩余时间=self.其他[n].结束时间
			itemdd.等级=self.其他[n].物品.级别限制 or 0
           insert(daidaishuju,#daidaishuju+1,itemdd)
    	end
    end
    for n=1,#self.银子 do
    	if self.银子[n].所有者 == tp.场景.人物.id  then
    		local itemdd={}
    		itemdd.界面类型=5
            itemdd.名称=math.floor(self.银子[n].数额/10000).."万"
            itemdd.价格=self.银子[n].价格
            itemdd.编号=n
			itemdd.小动画 = tp.资源:载入("item.wdf","网易WDF动画", 0x5453A471)
			itemdd.剩余时间=self.银子[n].结束时间
			itemdd.等级="0"
           insert(daidaishuju,#daidaishuju+1,itemdd)
    	end
    end
end

function 藏宝阁类:关键字排序()
	local 关键字 = self.输入框:取文本()
	self.文字:置颜色(黑色)
	self.显示数据 = {}
	local dai=0

   if dai==0 then
		self.显示数据 = {}
		for n=1,#self.其他 do
			if self.其他[n].物品.名称 == 关键字 or self.其他[n].物品.附带技能 == 关键字 then
				self.显示数据[#self.显示数据+1] = 格子.创建(0,0,n,"藏宝阁出售_物品")
				self.显示数据[#self.显示数据]:置物品(self.其他[n].物品)
				self.显示数据[#self.显示数据].价格 = tonumber(self.其他[n].价格)
				self.显示数据[#self.显示数据].结束时间 = self.其他[n].结束时间
				self.显示数据[#self.显示数据].编号 = n
				self.界面显示 = 6
				dai=n
			end
		end
   end
	self.显示id = 0
	self.选中编号 = 0
end

function 藏宝阁类:召唤兽显示(x,y)
	self.右键关闭 = nil

	self.文字:显示(self.x+183,self.y+198,"名称")
	self.文字:显示(self.x+264,self.y+198,"等级")
	self.文字:显示(self.x+339,self.y+198,"价钱")
	self.文字:显示(self.x+430,self.y+198,"亮点")
	self.文字:显示(self.x+517,self.y+198,"剩余时间")
	self.文字:显示(self.x+618,self.y+198,"收藏")
if self.bh==20 then
	self.显示id = 0
 local 位置=0
 for n=self.起点,self.终点 do
     位置=位置+1
      if self.显示数据[n]~=nil then
			if self:IsOuNumber(n) then
			daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB9B9D9)
		    else
		    daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB0B0D5)
		    end
			if self.显示数据[n].小动画:是否选中(x,y) then
				self.显示id = n
				if 引擎.鼠标弹起(右键) then
					self.右键关闭 = true
					tp.窗口.召唤兽查看栏:打开(self.召唤兽[self.显示id].召唤兽)
				end
			end
			self.资源[21]:显示(self.x+78,self.y+166+位置*60)
         if self.选中编号==n then
         	self.选中背景:显示(self.x+80, self.y+169+位置*60)
         end
			self.显示数据[n].小动画:显示(self.x+82, self.y+171+位置*60)
      	    self.scan[位置]:显示(self.x+620,self.y+176+位置*60)
      	    self.gwcan[位置]:显示(self.x+685,self.y+176+位置*60)
      	    self.gman[位置]:更新(x,y)
      	    self.gman[位置]:显示(self.x+736,self.y+168+位置*60)
		    self.gdan[位置]:显示(self.x+736,self.y+194+位置*60)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+183-string.len(self.显示数据[n].名称)*2,self.y+183+位置*60,self.显示数据[n].名称)
			 self.文字:显示(self.x+266,self.y+183+位置*60,self.显示数据[n].等级)
			 self.文字:置颜色(蓝色)
			 self.文字:显示(self.x+335,self.y+183+位置*60,"￥"..self.显示数据[n].价格)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+536,self.y+183+位置*60,math.ceil((self.显示数据[n].结束时间-os.time())/86400).."天")
         	 if self.gman[位置]:事件判断() then
		    	self:itembuy(n,self.界面显示)
		    end
      end
 	 end
	if self.显示id ~= 0 then
		if 引擎.鼠标弹起(左键) then
			self.选中编号 = self.显示id
		end
	end
end
end

function 藏宝阁类:角色显示(x,y)
	self.右键关闭 = nil
	self.文字:显示(self.x+183,self.y+198,"门派")
	self.文字:显示(self.x+264,self.y+198,"等级")
	self.文字:显示(self.x+339,self.y+198,"价钱")
	self.文字:显示(self.x+430,self.y+198,"亮点")
	self.文字:显示(self.x+517,self.y+198,"剩余时间")
	self.文字:显示(self.x+618,self.y+198,"收藏")
if self.bh==20 then
	self.显示id = 0
 local 位置=0
 for n=self.起点,self.终点 do
     位置=位置+1
      if self.显示数据[n]~=nil then
			if self:IsOuNumber(n) then
			daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB9B9D9)
		    else
		    daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB0B0D5)
		    end
			if self.显示数据[n].小动画:是否选中(x,y) then
				self.显示id = n
				if 引擎.鼠标弹起(右键) then
					self.右键关闭 = true
					发送数据(62.1,{编号=self.显示数据[self.显示id].编号,名称=self.显示数据[n+self.页数*6].名称})
				end
			end
			self.资源[21]:显示(self.x+78,self.y+166+位置*60)
         if self.选中编号==n then
         	self.选中背景:显示(self.x+80, self.y+169+位置*60)
         end
			self.显示数据[n].小动画:显示(self.x+85, self.y+173+位置*60)
      	    self.scan[位置]:显示(self.x+620,self.y+176+位置*60)
      	    self.gwcan[位置]:显示(self.x+685,self.y+176+位置*60)
      	    self.gman[位置]:更新(x,y)
      	    self.gman[位置]:显示(self.x+736,self.y+168+位置*60)
		    self.gdan[位置]:显示(self.x+736,self.y+194+位置*60)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+183-string.len(self.显示数据[n].名称)*2,self.y+183+位置*60,self.显示数据[n].门派)
			 self.文字:显示(self.x+266,self.y+183+位置*60,self.显示数据[n].等级)
			 self.文字:置颜色(蓝色)
			 self.文字:显示(self.x+335,self.y+183+位置*60,"￥"..self.显示数据[n].价格)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+536,self.y+183+位置*60,math.ceil((self.显示数据[n].结束时间-os.time())/86400).."天")
         	 if self.gman[位置]:事件判断() then
		    	self:itembuy(n,self.界面显示)
		    end
      end

 	 end
	if self.显示id ~= 0 then
		if 引擎.鼠标弹起(左键) then
			self.选中编号 = self.显示id
		end
	end

end
end
function 藏宝阁类:allitem()
	self.文字:置颜色(黑色)
	 daidaishuju3={}

    for n=1,#self.数据.装备 do
    	if self.数据.装备[n]~=nil then
    		local 格子 = tp._物品格子
    		local 编号 = #daidaishuju3+1
           daidaishuju3[编号]=格子.创建(0,0,n,"藏宝阁出售_物品")
           daidaishuju3[编号]:置物品(self.数据.装备[n].物品)
           daidaishuju3[编号].编号=n
           daidaishuju3[编号].界面类型=1
            daidaishuju3[编号].结束时间 = self.数据.装备[n].结束时间
            daidaishuju3[编号].价格 = tonumber(self.数据.装备[n].价格)
    	end
    end
    for n=1,#self.数据.灵饰 do
    	if self.数据.灵饰[n]~=nil then
    		local 格子 = tp._物品格子
    		local 编号 = #daidaishuju3+1
           daidaishuju3[编号]=格子.创建(0,0,n,"藏宝阁出售_物品")
           daidaishuju3[编号]:置物品(self.数据.灵饰[n].物品)
           daidaishuju3[编号].编号=n
           daidaishuju3[编号].界面类型=3
           daidaishuju3[编号].结束时间 = self.数据.灵饰[n].结束时间
            daidaishuju3[编号].价格 = tonumber(self.数据.灵饰[n].价格)
    	end
    end
    for n=1,#self.数据.其他 do
    	if self.数据.其他[n]~=nil then
    		local 格子 = tp._物品格子
    		local 编号 = #daidaishuju3+1
           daidaishuju3[编号]=格子.创建(0,0,n,"藏宝阁出售_物品")
           daidaishuju3[编号]:置物品(self.数据.其他[n].物品)
           daidaishuju3[编号].编号=n
           daidaishuju3[编号].界面类型=6
           daidaishuju3[编号].结束时间 = self.数据.其他[n].结束时间
            daidaishuju3[编号].价格 = tonumber(self.数据.其他[n].价格)
    	end
    end
   --  for n=1,#self.数据.召唤兽 do
   --  	if self.数据.召唤兽[n]~=nil then
   --  		local itemdd={}
   --  		itemdd.界面类型=4
   --          itemdd.名称=self.数据.召唤兽[n].召唤兽.模型
   --          itemdd.价格=self.数据.召唤兽[n].价格
   --          itemdd.编号=n
		 --   	local xn = 引擎.取宝宝40头像(self.数据.召唤兽[n].召唤兽.模型)
		 --    itemdd.小动画=pwdd(xn)
		 --    itemdd.剩余时间=self.数据.召唤兽[n].结束时间
		 --    itemdd.等级=self.数据.召唤兽[n].召唤兽.等级
   --         insert(daidaishuju3,#daidaishuju3+1,itemdd)
   --  	end
   --  end
   --  for n=1,#self.数据.银两 do
   --  	if self.数据.银两[n]~=nil then
   --  		local itemdd={}
   --  		itemdd.界面类型=5
   --          itemdd.名称=math.floor(self.数据.银两[n].数额/10000).."万"
   --          itemdd.价格=self.数据.银两[n].价格
   --          itemdd.编号=n
			-- itemdd.小动画 = tp.资源:载入("item.wdf","网易WDF动画", 0x5453A471)
			-- itemdd.剩余时间=self.数据.银两[n].结束时间
			-- itemdd.等级="0"
   --         insert(daidaishuju3,#daidaishuju3+1,itemdd)
   --  	end
   --  end
end

function 藏宝阁类:总显示(x,y)
	self.右键关闭 = nil
	self.文字:显示(self.x+183,self.y+198,"名称")
	self.文字:显示(self.x+264,self.y+198,"等级")
	self.文字:显示(self.x+339,self.y+198,"价钱")
	self.文字:显示(self.x+430,self.y+198,"亮点")
	self.文字:显示(self.x+517,self.y+198,"剩余时间")
	self.文字:显示(self.x+618,self.y+198,"收藏")
if self.bh==20 then
                	self.显示id = 0
				 local 位置=0
				 for n=self.起点,self.终点 do
				     位置=位置+1
				      if daidaishuju3[n]~=nil then
			if self:IsOuNumber(n) then
			daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB9B9D9)
		    else
		    daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB0B0D5)
		    end
			if daidaishuju3[n].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,daidaishuju3[n].物品)
				if 引擎.鼠标弹起(左键) then
					self.选中编号 = n
				end
				self.显示id = n
			end
     	    self.资源[21]:显示(self.x+78,self.y+166+位置*60)
	        if self.选中编号==n then
	         	self.选中背景:显示(self.x+80, self.y+169+位置*60)
	         end
			daidaishuju3[n]:置坐标(self.x+79, self.y+165+位置*60)
			daidaishuju3[n]:显示(dt,x,y,self.鼠标)
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+183-string.len(daidaishuju3[n].物品.名称)*2,self.y+183+位置*60,daidaishuju3[n].物品.附带技能 or daidaishuju3[n].物品.名称)
			  self.文字:显示(self.x+266,self.y+183+位置*60,daidaishuju3[n].物品.级别限制 or "0")
			 self.文字:置颜色(红色)
			 self.文字:显示(self.x+335,self.y+183+位置*60,"￥"..daidaishuju3[n].价格)
			 self.文字:置颜色(黑色)
			self.文字:显示(self.x+536,self.y+183+位置*60,math.ceil((daidaishuju3[n].结束时间-os.time())/86400).."天")
      	    self.scan[位置]:显示(self.x+620,self.y+176+位置*60)
      	    self.gwcan[位置]:显示(self.x+685,self.y+176+位置*60)
      	    self.gdan[位置]:显示(self.x+736,self.y+194+位置*60)
      	    self.gman[位置]:更新(x,y)
      	    self.gman[位置]:显示(self.x+736,self.y+168+位置*60)
         	 if self.gman[位置]:事件判断() then
		    	self:itembuy(daidaishuju3[n].编号,daidaishuju3[n].界面类型)
		      end
				      end
				  end
             end
				  	self.资源[16]:更新(x,y)
						self.资源[17]:更新(x,y)
						if self.资源[16]:事件判断() then
					     if self.起点>1 then
					         self.起点=self.起点-1
					         self.终点=self.终点-1
					       end
						elseif self.资源[17]:事件判断() then
					     if self.终点<#daidaishuju3 then
					     	self.起点=self.起点+1
					     	self.终点=self.终点+1
					     end
						end
					  if self.背景底图:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 then
					     if self.起点>1 then
					         self.起点=self.起点-1
					         self.终点=self.终点-1
					       end
					  elseif self.背景底图:是否选中(x,y)  and 引擎.取鼠标滚轮() ==-1 then
					     if self.终点<#daidaishuju3 then
					     	self.起点=self.起点+1
					     	self.终点=self.终点+1
					     end
				      end
				      	--if self.显示id ~= 0 then
		-- if 引擎.鼠标弹起(左键) then
		-- 	self.选中编号 = self.显示id
		-- end
	--end
end
function 藏宝阁类:取头像偏移(界面)
	local 临时={x=0,y=0}
	if 界面==4 then
		临时.x=2
		临时.y=1
	end
	return 临时
end
function 藏宝阁类:灵饰显示(x,y)
	self.文字:置颜色(黑色)
	self.文字:显示(self.x+183,self.y+198,"名称")
	self.文字:显示(self.x+264,self.y+198,"等级")
	self.文字:显示(self.x+339,self.y+198,"价钱")
	self.文字:显示(self.x+430,self.y+198,"亮点")
	self.文字:显示(self.x+517,self.y+198,"剩余时间")
	self.文字:显示(self.x+618,self.y+198,"收藏")
if self.bh==20 then
	self.显示id = 0
 local 位置=0
 for n=self.起点,self.终点 do
     位置=位置+1
      if self.显示数据[n]~=nil and self.显示数据[n].物品 ~= nil then
			if self:IsOuNumber(n) then
			daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB9B9D9)
		    else
		    daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB0B0D5)
		    end
			if self.显示数据[n].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.显示数据[n].物品)
				if 引擎.鼠标弹起(左键) then
					self.选中编号 = n
				end
				self.显示id = n
			end
			self.资源[21]:显示(self.x+78,self.y+166+位置*60)
         if self.选中编号==n then
         	self.选中背景:显示(self.x+80, self.y+169+位置*60)
         end
			self.显示数据[n]:置坐标(self.x+79, self.y+165+位置*60)
			self.显示数据[n]:显示(dt,x,y,self.鼠标)
      	    self.scan[位置]:显示(self.x+620,self.y+176+位置*60)
      	    self.gwcan[位置]:显示(self.x+685,self.y+176+位置*60)
      	    self.gman[位置]:更新(x,y)
      	    self.gman[位置]:显示(self.x+736,self.y+168+位置*60)
		    self.gdan[位置]:显示(self.x+736,self.y+194+位置*60)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+183-string.len(self.显示数据[n].物品.名称)*2,self.y+183+位置*60,self.显示数据[n].物品.名称)
			 self.文字:显示(self.x+266,self.y+183+位置*60,self.显示数据[n].物品.级别限制 or "无")
			 self.文字:置颜色(蓝色)
			 self.文字:显示(self.x+335,self.y+183+位置*60,"￥"..self.显示数据[n].价格)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+536,self.y+183+位置*60,math.ceil((self.显示数据[n].结束时间-os.time())/86400).."天")
         	 if self.gman[位置]:事件判断() then
		    	self:itembuy(n,self.界面显示)
		    end
      end
 	 end
end
end

function 藏宝阁类:装备显示(x,y)
	self.文字:置颜色(黑色)
	self.文字:显示(self.x+183,self.y+198,"名称")
	self.文字:显示(self.x+264,self.y+198,"等级")
	self.文字:显示(self.x+339,self.y+198,"价钱")
	self.文字:显示(self.x+430,self.y+198,"亮点")
	self.文字:显示(self.x+517,self.y+198,"剩余时间")
	self.文字:显示(self.x+618,self.y+198,"收藏")
if self.bh==20 then
	self.显示id = 0
 local 位置=0
 for n=self.起点,self.终点 do
     位置=位置+1
      if self.显示数据[n]~=nil and self.显示数据[n].物品 ~= nil then
			if self:IsOuNumber(n) then
			daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB9B9D9)
		    else
		    daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB0B0D5)
		    end
			if self.显示数据[n].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.显示数据[n].物品)
				if 引擎.鼠标弹起(左键) then
					self.选中编号 = n
				end
				self.显示id = n
			end
			self.资源[21]:显示(self.x+78,self.y+166+位置*60)
         if self.选中编号==n then
         	self.选中背景:显示(self.x+80, self.y+169+位置*60)
         end
			self.显示数据[n]:置坐标(self.x+79, self.y+165+位置*60)
			self.显示数据[n]:显示(dt,x,y,self.鼠标)
      	    self.scan[位置]:显示(self.x+620,self.y+176+位置*60)
      	    self.gwcan[位置]:显示(self.x+685,self.y+176+位置*60)
      	    self.gman[位置]:更新(x,y)
      	    self.gman[位置]:显示(self.x+736,self.y+168+位置*60)
		    self.gdan[位置]:显示(self.x+736,self.y+194+位置*60)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+183-string.len(self.显示数据[n].物品.名称)*2,self.y+183+位置*60,self.显示数据[n].物品.名称)
			 self.文字:显示(self.x+266,self.y+183+位置*60,self.显示数据[n].物品.级别限制 or "0")
			 if self.显示数据[n].物品.特效=="无级别限制" then
			 self.文字:置颜色(红色)
			 self.文字:显示(self.x+423,self.y+183+位置*60,"无级别")
			 self.文字:置颜色(黑色)
			 end
			 self.文字:置颜色(蓝色)
			 self.文字:显示(self.x+335,self.y+183+位置*60,"￥"..self.显示数据[n].价格)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+536,self.y+183+位置*60,math.ceil((self.显示数据[n].结束时间-os.time())/86400).."天")
         	 if self.gman[位置]:事件判断() then
		    	self:itembuy(n,self.界面显示)
		    end
      end
 	 end
end
end

function 藏宝阁类:其他显示(x,y)
	self.文字:置颜色(黑色)
	self.文字:显示(self.x+183,self.y+198,"名称")
	self.文字:显示(self.x+264,self.y+198,"等级")
	self.文字:显示(self.x+339,self.y+198,"价钱")
	self.文字:显示(self.x+430,self.y+198,"亮点")
	self.文字:显示(self.x+517,self.y+198,"剩余时间")
	self.文字:显示(self.x+618,self.y+198,"收藏")
if self.bh==20 then
	self.显示id = 0
 local 位置=0
 for n=self.起点,self.终点 do
     位置=位置+1
      if self.显示数据[n]~=nil and self.显示数据[n].物品 ~= nil then
			if self:IsOuNumber(n) then
			daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB9B9D9)
		    else
		    daidai(self.x+62,self.y+161+位置*60,self.x+62+758,self.y+161+60+位置*60,0XFFB0B0D5)
		    end
			if self.显示数据[n].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.显示数据[n].物品)
				if 引擎.鼠标弹起(左键) then
					self.选中编号 = n
				end
				self.显示id = n
			end
			self.资源[21]:显示(self.x+78,self.y+166+位置*60)
         if self.选中编号==n then
         	self.选中背景:显示(self.x+80, self.y+169+位置*60)
         end
			self.显示数据[n]:置坐标(self.x+79, self.y+165+位置*60)
			self.显示数据[n]:显示(dt,x,y,self.鼠标)
      	    self.scan[位置]:显示(self.x+620,self.y+176+位置*60)
      	    self.gwcan[位置]:显示(self.x+685,self.y+176+位置*60)
      	    self.gman[位置]:更新(x,y)
      	    self.gman[位置]:显示(self.x+736,self.y+168+位置*60)
		    self.gdan[位置]:显示(self.x+736,self.y+194+位置*60)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+183-string.len(self.显示数据[n].物品.名称)*1.5,self.y+183+位置*60,self.显示数据[n].物品.附带技能 or self.显示数据[n].物品.名称)
			 self.文字:显示(self.x+266,self.y+183+位置*60,self.显示数据[n].等级 or "0")
			 self.文字:置颜色(蓝色)
			 self.文字:显示(self.x+335,self.y+183+位置*60,"￥"..self.显示数据[n].价格)
			 self.文字:置颜色(黑色)
			 self.文字:显示(self.x+536,self.y+183+位置*60,math.ceil((self.显示数据[n].结束时间-os.time())/86400).."天")
         	 if self.gman[位置]:事件判断() then
		    	self:itembuy(n,self.界面显示)
		    end
      end
 	 end
end
end


function 藏宝阁类:检查点(x,y)
	if self.背景:是否选中(x,y) or self.背景底图:是否选中(x,y)  then
		return true
	end
end

function 藏宝阁类:初始移动(x,y)
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

function 藏宝阁类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 藏宝阁类