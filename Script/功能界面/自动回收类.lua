-- @Author: baidwwy
-- @Date:   2024-09-11 20:07:40
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 14:41:34
local 自动回收类 = class()

local floor = math.floor
local ceil = math.ceil
local tp,zts,zts1
local insert = table.insert
local _hsxxa = {"回收装备","回收灵饰","回收宝石","星 辉 石","灵 犀 玉","装 备 书","百炼精铁","灵 饰 书","元灵晶石","怪物卡片","宝宝装备"}

function 自动回收类:初始化(根)
	self.ID = 211
	self.x = 56
	self.y = 36
	self.xx = 0
	self.yy = 0
	self.注释 = "自动回收设置"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
end

function 自动回收类:打开(数据)
	if self.可视 then
        self.可视 = false
        self.资源组=nil
        self.打勾按钮组=nil
        self.数据=nil
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
		self.可视 = true
		self.数据=数据
		self:加载资源()
	end
end

function 自动回收类:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local 小型选项栏 = tp._小型选项栏
	self.资源组={
		[1] = 自适应.创建(0,1,669,522,3,9),--按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"回收设置"),
		[2] = 自适应.创建(4,1,211,476,3,9), --白底1
		[3] = 自适应.创建(103,1,115,22,1,3,nil,18), --灰色长底
		[4] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"保存设置"),
		[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
	}
	self.选项按钮={
		[1] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[2] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[4] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[5] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[7] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[8] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[9] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[10] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[11] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
	}
	self.小选项框={
		[1] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),--下拉框结束
		[2] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[3] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[4] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[5] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[6] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[7] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[8] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[9] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[10] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
		[11] = 小型选项栏.创建(自适应.创建(8,1,115,120,3,9),"回收设置"),
	}
	self.资源组[4]:绑定窗口_(self.ID)
	self.资源组[5]:绑定窗口_(self.ID)

	self.打勾按钮组={}
	for n=1,#self.数据.物品表 do
		self.打勾按钮组[n] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true)
		self.打勾按钮组[n]:置打勾框(self.数据.打钩组[n])
		self.打勾按钮组[n]:绑定窗口_(self.ID)
	end
end

function 自动回收类:置弹出(s)
	if self.弹出 or s == nil then
		self.弹出 = nil
	else
	    self.弹出 = s
	end
end

function 自动回收类:显示(dt,x,y)
	-----------------
	素材位置调整()
	ax,ay=AFCHX,AFCHY
	-- self.资源组[1] = tp._自适应.创建(0,1,100+ax,100+ay,3,9)
	-----------------
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[4]:显示(self.x+401,self.y+469)
	self.资源组[5]:显示(self.x+649,self.y+2)
	self.资源组[2]:显示(self.x+14,self.y+28)
	---------------
	zts:置颜色(黑色)
	zts1:置颜色(黄色)
	zts1:显示(self.x+269,self.y+1,"自 动 回 收 设 置")
	zts:显示(self.x+23,self.y+35,"选 项 类 ↓")
	zts:显示(self.x+142,self.y+35,"勾 选 类 →")
	for an=1,11 do
		self.选项按钮[an]:更新(x,y)
		self.资源组[3]:显示(self.x+90,self.y+61+33*(an-1)) --灰色长底
	    zts:显示(self.x+24,self.y+64+33*(an-1),_hsxxa[an])
	end

	for an=1,11 do
		if self.弹出==nil or self.弹出==an then
		    self.选项按钮[an]:显示(self.x+192,self.y+61+33*(an-1))
		end
	    self.小选项框[an]:显示(self.x+90,self.y+77+33*(an-1),x,y,self.鼠标)
	end
	---------------
	if self.资源组[4]:事件判断() then --保存设置
		local data = table.copy(self.数据)
		data.物品表 = nil
		发送数据(196,{data=data})
	elseif self.资源组[5]:事件判断() then --关闭
		self:打开()
		return false
	elseif self.选项按钮[1]:事件判断() then
		local tbt = {"不回收","50级以下","60级以下","70级以下","80级以下","90级以下","100级以下","110级以下","120级以下","130级以下","140级以下","150级以下","全部回收"}
	    self.小选项框[1]:打开(tbt)
	    self.小选项框[1]:置选中(self.数据.装备)
	    self:置弹出(1)
	elseif self.小选项框[1]:事件判断() then
		local 选中 = self.小选项框[1].弹出事件
		self.数据.装备=选中
		self.小选项框[1].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[2]:事件判断() then
		local tbt = {"不回收","60级以下","80级以下","100级以下","120级以下","全部回收"}
	    self.小选项框[2]:打开(tbt)
	    self.小选项框[2]:置选中(self.数据.灵饰)
	    self:置弹出(2)
	elseif self.小选项框[2]:事件判断() then
		local 选中 = self.小选项框[2].弹出事件
		self.数据.灵饰=选中
		self.小选项框[2].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[3]:事件判断() then
		local tbt = {"不回收","4级以下","6级以下","8级以下","10级以下","12级以下","14级以下","16级以下","18级以下","全部回收"}
	    self.小选项框[3]:打开(tbt)
	    self.小选项框[3]:置选中(self.数据.宝石)
	    self:置弹出(3)
	elseif self.小选项框[3]:事件判断() then
		local 选中 = self.小选项框[3].弹出事件
		self.数据.宝石=选中
		self.小选项框[3].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[4]:事件判断() then
		local tbt = {"不回收","4级以下","6级以下","8级以下","10级以下","12级以下","14级以下","16级以下","18级以下","全部回收"}
	    self.小选项框[4]:打开(tbt)
	    self.小选项框[4]:置选中(self.数据.星辉)
	    self:置弹出(4)
	elseif self.小选项框[4]:事件判断() then
		local 选中 = self.小选项框[4].弹出事件
		self.数据.星辉=选中
		self.小选项框[4].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[5]:事件判断() then
		local tbt = {"不回收","1级以下","2级以下","全部回收"}
	    self.小选项框[5]:打开(tbt)
	    self.小选项框[5]:置选中(self.数据.灵犀玉)
	    self:置弹出(5)
	elseif self.小选项框[5]:事件判断() then
		local 选中 = self.小选项框[5].弹出事件
		self.数据.灵犀玉=选中
		self.小选项框[5].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[6]:事件判断() then
		local tbt = {"不回收","50级以下","60级以下","70级以下","80级以下","90级以下","100级以下","110级以下","120级以下","130级以下","140级以下","150级以下","全部回收"}
	    self.小选项框[6]:打开(tbt)
	    self.小选项框[6]:置选中(self.数据.装备书)
	    self:置弹出(6)
	elseif self.小选项框[6]:事件判断() then
		local 选中 = self.小选项框[6].弹出事件
		self.数据.装备书=选中
		self.小选项框[6].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[7]:事件判断() then
		local tbt = {"不回收","50级以下","60级以下","70级以下","80级以下","90级以下","100级以下","110级以下","120级以下","130级以下","140级以下","150级以下","全部回收"}
	    self.小选项框[7]:打开(tbt)
	    self.小选项框[7]:置选中(self.数据.百炼精铁)
	    self:置弹出(7)
	elseif self.小选项框[7]:事件判断() then
		local 选中 = self.小选项框[7].弹出事件
		self.数据.百炼精铁=选中
		self.小选项框[7].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[8]:事件判断() then
		local tbt = {"不回收","60级以下","80级以下","100级以下","120级以下","全部回收"}
	    self.小选项框[8]:打开(tbt)
	    self.小选项框[8]:置选中(self.数据.灵饰书)
	    self:置弹出(8)
	elseif self.小选项框[8]:事件判断() then
		local 选中 = self.小选项框[8].弹出事件
		self.数据.灵饰书=选中
		self.小选项框[8].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[9]:事件判断() then
		local tbt = {"不回收","60级以下","80级以下","100级以下","120级以下","全部回收"}
	    self.小选项框[9]:打开(tbt)
	    self.小选项框[9]:置选中(self.数据.元灵晶石)
	    self:置弹出(9)
	elseif self.小选项框[9]:事件判断() then
		local 选中 = self.小选项框[9].弹出事件
		self.数据.元灵晶石=选中
		self.小选项框[9].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[10]:事件判断() then
		local tbt = {"不回收","3级以下","5级以下","7级以下","9级以下","全部回收"}
	    self.小选项框[10]:打开(tbt)
	    self.小选项框[10]:置选中(self.数据.怪物卡片)
	    self:置弹出(10)
	elseif self.小选项框[10]:事件判断() then
		local 选中 = self.小选项框[10].弹出事件
		self.数据.怪物卡片=选中
		self.小选项框[10].弹出事件 = nil
		self:置弹出(nil)
	elseif self.选项按钮[11]:事件判断() then
		local tbt = {"不回收","75级以下","115级以下","145级以下","全部回收"}
	    self.小选项框[11]:打开(tbt)
	    self.小选项框[11]:置选中(self.数据.宝宝装备)
	    self:置弹出(11)
	elseif self.小选项框[11]:事件判断() then
		local 选中 = self.小选项框[11].弹出事件
		self.数据.宝宝装备=选中
		self.小选项框[11].弹出事件 = nil
		self:置弹出(nil)
	end

	zts1:置颜色(白色)
	zts:置颜色(白色)
	if self.弹出==nil then
		zts:显示(self.x+108,self.y+65,self.数据.装备)
		zts:显示(self.x+108,self.y+65+33,self.数据.灵饰)
		zts:显示(self.x+108,self.y+65+33*2,self.数据.宝石)
		zts:显示(self.x+108,self.y+65+33*3,self.数据.星辉)
		zts:显示(self.x+108,self.y+65+33*4,self.数据.灵犀玉)
		zts:显示(self.x+108,self.y+65+33*5,self.数据.装备书)
		zts:显示(self.x+108,self.y+65+33*6,self.数据.百炼精铁)
		zts:显示(self.x+108,self.y+65+33*7,self.数据.灵饰书)
		zts:显示(self.x+108,self.y+65+33*8,self.数据.元灵晶石)
		zts:显示(self.x+108,self.y+65+33*9,self.数据.怪物卡片)
		zts:显示(self.x+108,self.y+65+33*10,self.数据.宝宝装备)
	end

	for n=1,#self.打勾按钮组 do
		self.打勾按钮组[n]:更新(x,y)
	end
	local o = 0
	for h=1,15 do
		for l=1,3 do
			o = o + 1
			if self.打勾按钮组[o] then
			    self.打勾按钮组[o]:显示(self.x + (l-1) * 140 + 12 + 230,self.y + h * 28 + 4,true,nil,nil,self.数据.打钩组[o],2)
			    zts:显示(self.x + (l-1) * 140 + 42 + 230,self.y + h * 28 + 8,self.数据.物品表[o])
			    if self.打勾按钮组[o]:事件判断() then
			   	    if self.数据.打钩组[o] then
			   	  	   self.数据.打钩组[o] = false
			   	    else
			   	       self.数据.打钩组[o] = true
			   	    end
			   	    self.打勾按钮组[o]:置打勾框(self.数据.打钩组[o])
			    end
			end
		end
	end
end

function 自动回收类:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 自动回收类:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
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

function 自动回收类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 自动回收类