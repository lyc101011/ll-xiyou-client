--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-03-06 13:51:31
--======================================================================--
local 唱戏界面 = class()

local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp,zts1
local tp
local remove = table.remove

function 唱戏界面:初始化(根)
	self.ID = 141
	self.x = 210
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "创建唱戏界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true

	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体

end

function 唱戏界面:打开(sj)
	if self.可视 then
		self.选中=2
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.选中=2
		self.积分=sj.积分
		self.价格=sj.价格
		self.选中名称="五更寒"
		if self.资源组==nil then
		    self:加载资源()
		end

		tp.运行时间 = tp.运行时间 + 1
    	self.窗口时间 = tp.运行时间
    	self.可视 = true
	end
end

function 唱戏界面:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	-- local 小型选项栏 = tp._小型选项栏
	self.资源组 = {
		[1] = 自适应.创建(0,1,512,300,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x89b1be35)),
		[4] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x89b1be35)),
		[5] = 按钮.创建(资源:载入('common/wzife.wdf',"网易WDF动画",0x89b1be35)),--小白背景
		[6] = 按钮(自适应.创建(12,4,73,22,1,3),0,0,4,true,true,"　购买"),
		[7] = 自适应.创建(78,1,412,78,3,9),--大白背景 右侧带拉伸条
		[8] = 资源:载入('common/item.wdf',"网易WDF动画",0x117e34bd),
		[9] = 资源:载入('common/item.wdf',"网易WDF动画",0xa59f38ee),
		[10] = 资源:载入('common/item.wdf',"网易WDF动画",0x99638335),
	}
	for i=3,6 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
end

function 唱戏界面:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"“如梦奇谈”戏票专营")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)

    if self.资源组[2]:事件判断() then --关闭
        self:打开()
        return
    elseif self.资源组[3]:事件判断() then
    	self.选中=1
    	self.选中名称="一斛珠"
	elseif self.资源组[4]:事件判断() then
    	self.选中=2
    	self.选中名称="五更寒"
	elseif self.资源组[5]:事件判断() then
    	self.选中=3
    	self.选中名称="双城记"
    elseif self.资源组[6]:事件判断() then
    	local 事件 = function()
        发送数据(100,{项目=self.选中名称})
        self:打开()
        end
        tp.窗口.文本栏:载入("确定消耗#Y"..self.价格[self.选中].."#W点副本积分来购买#Y"..self.选中名称.."#W戏票吗？",nil,true,事件)
    end
	self.资源组[6]:显示(self.x+219,self.y+265) --按钮 --购买
    for i=3,6 do
    	self.资源组[i]:更新(x,y)
    end
	self.资源组[3]:显示(self.x+50,self.y+50,nil,nil,nil,self.选中 == 1,2) --1号按钮
	self.资源组[4]:显示(self.x+210,self.y+50,nil,nil,nil,self.选中 == 2,2)  --2号按钮
	self.资源组[5]:显示(self.x+370,self.y+50,nil,nil,nil,self.选中 == 3,2)--3号按钮
	self.资源组[7]:显示(self.x+56,self.y+180)
	self.资源组[8]:显示(self.x+70,self.y+70)
	self.资源组[9]:显示(self.x+230,self.y+70)
	self.资源组[10]:显示(self.x+390,self.y+70)

	zts:显示(self.x+73,self.y+145,"一斛珠")
	zts:显示(self.x+236,self.y+145,"五更寒")
	zts:显示(self.x+390,self.y+145,"双城记")
	zts:置颜色(黑色)
	zts:显示(self.x+70,self.y+190,"当前副本积分:")
	zts:显示(self.x+70,self.y+210,"戏票价格（副本积分）:")
	zts:置颜色(0xff009900)
	zts:显示(self.x+169,self.y+190,self.积分)
	if self.选中==1 then
		zts:显示(self.x+223,self.y+210,self.价格[1])
	elseif self.选中==2 then
		zts:显示(self.x+223,self.y+210,self.价格[2])
	elseif self.选中==3 then
		zts:显示(self.x+223,self.y+210,self.价格[3])
	end
end

function 唱戏界面:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 唱戏界面:初始移动(x,y)
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

function 唱戏界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 唱戏界面