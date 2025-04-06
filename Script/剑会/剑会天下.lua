-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-09 13:20:46
local 场景类_剑会天下 = class()
local qmx = 引擎.取模型
local tp,jhzts
local insert = table.insert
local tx = 引擎.取头像
local dwzy = {0x1A23FA12,0x1A23FA13,0x1A23FA14,0x1A23FA15,0x1A23FA16,0x1A23FA17,0x1A23FA18}--{0x1A23FA11,0x1A23FA12,0x1A23FA13,0x1A23FA14,0x1A23FA15,0x1A23FA16,0x1A23FA17,0x1A23FA18}
function 场景类_剑会天下:初始化(根)
	self.ID = 157
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "剑会天下"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	jhzts = tp.字体表.普通字体
end

function 场景类_剑会天下:加载资源()
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local 资源 = tp.资源
	self.资源组 = {
		[1] = 资源:载入('nice.wdf',"网易WDF动画",0x1A23FA01),
		[2] = 资源:载入('nice.wdf',"网易WDF动画",0x1A23FA02),
		[3] = 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x1A23FA03,9393),0,0,3,true,true),
		[4] = 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x1A23FA04,9393),0,0,3,true,true),
		[5] = 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x1A23FA05,9393),0,0,3,true,true),
		[6] = 按钮.创建(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"返回首页"),--按钮.创建(自适应.创建(38,4,71,22,1,3),0,0,4,true,true,"返回首页"),
		[7] = 资源:载入('nice.wdf',"网易WDF动画",0x1A23FA06),
		[8] = 资源:载入('nice.wdf',"网易WDF动画",0x1A23FA10),
		[9] = 按钮.创建(资源:载入("jntb.wdf","网易WDF动画",0xABAC0001,9393),0,0,3,true,true),--按钮.创建(资源:载入('nice.wdf',"网易WDF动画",0x1A23FA07,9393),0,0,3,true,true),
	    [10] = 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",2178760914,9393),0,0,3,true,true,"获取物品"),--按钮.创建(自适应.创建(17,4,100,22,1,3),0,0,4,true,true,"获取消耗物品"),
	    [11] = 按钮.创建(资源:载入('nice.wdf',"网易WDF动画",2178760914,9393),0,0,3,true,true,"一键打符"),
	}
	self.段位组={}
	for n=1,#dwzy do
	    self.段位组[n] = 资源:载入('nice.wdf',"网易WDF动画",dwzy[n])
	end
	for i=3,6 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	for i=9,11 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[10]:置偏移(4,1)
	self.资源组[11]:置偏移(4,1)
	self.当前积分=0
    self.当前段位 = 1
    self.升级积分=1200
    self.剑会称谓="剑会天下·新秀"

end

function 场景类_剑会天下:打开(内容) -- 服饰染色 召唤兽染色
	if self.可视 then
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
        if 资源组==nil then
            self:加载资源()
        end
        self:加载数据(内容)

		self.x = (全局游戏宽度/2)-313
		self.y = (全局游戏高度/2)-160
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.界面 = 1
	    self.队伍头像 = {}
	    self.匹配 = false
	    self.人数 = 1
	    local x = tx(tp.队伍[1].模型)
	    self.个人头像 = tp.资源:载入(x[7],"网易WDF动画",x[2])
	end
end

function 场景类_剑会天下:加载数据(内容)
	self.胜率="100%"
	if 内容 then
	    self.当前积分 = 内容.积分 or 1200
	    -- self.胜率=(string.format("%.2f", 1/1)*100).."%"
	    if 内容.失败==0 then
	    	self.胜率="100%"
	    else
	    	self.胜率=(string.format("%.2f", 内容.胜利/(内容.失败+内容.胜利))*100).."%"
	    end
	end
	if self.当前积分<1100 then
	    self.升级积分=1200
    	self.当前段位=1
    	self.剑会称谓="剑会天下·新秀"
    elseif self.当前积分<1200 then
	    self.升级积分=1300
    	self.当前段位=2
    	self.剑会称谓="剑会天下·新秀"
    elseif self.当前积分<1299 then
    	self.升级积分=1400
    	self.当前段位=3
    	self.剑会称谓="剑会天下·新秀"
    elseif self.当前积分<1399 then
    	self.升级积分=1499
    	self.当前段位=4
    	self.剑会称谓="剑会天下·百战"
	elseif self.当前积分<1499 then
		self.升级积分=1499
		self.当前段位=5
		self.剑会称谓="剑会天下·千胜"
	elseif self.当前积分<1899 then
		self.升级积分=1899
		self.当前段位=6
		self.剑会称谓="剑会天下·万军"
	elseif self.当前积分>=1900 then
		self.升级积分=1900
		self.当前段位=7
		self.剑会称谓="剑会天下·神话"
	-- 	self.剑会称谓="剑会天下·英雄"
	-- 	self.剑会称谓="剑会天下·传说"
	-- else
	-- 	self.剑会称谓="剑会天下·神话"
	end
end

function 场景类_剑会天下:显示(dt,x,y)
	self.焦点 = false
	if self.界面 == 1 then
		self.资源组[3]:更新(x,y)
		self.资源组[4]:更新(x,y)
		self.资源组[5]:更新(x,y)
		self.资源组[1]:显示(self.x,self.y)
		self.资源组[3]:显示(self.x+35,self.y+50)
		self.资源组[4]:显示(self.x+380,self.y+48)
		self.资源组[5]:显示(self.x+380,self.y+133)
		if self.资源组[3]:事件判断() then
			self.界面 = 2
		elseif self.资源组[5]:事件判断() then
			self.界面 = 3
		elseif self.资源组[4]:事件判断() then
			发送数据(6584)
		end
	elseif self.界面 == 2 then
		self.资源组[6]:更新(x,y)
	    self.资源组[2]:显示(self.x,self.y)
	    self.资源组[6]:显示(self.x+15,self.y+295,nil,nil,nil,self.匹配,1)
	    self.资源组[7]:显示(self.x+40,self.y+40)
		self.个人头像:显示(self.x+44,self.y+44)
	    jhzts:置颜色(0xff77342c):显示(self.x+100,self.y+45,tp.队伍[1].名称)
	    jhzts:置颜色(0xff77342c):显示(self.x+100,self.y+75,"等级:"..tp.队伍[1].等级)
	    jhzts:置颜色(0xff77342c):显示(self.x+170,self.y+75,"门派:"..tp.队伍[1].门派)
	    jhzts:置颜色(0xff77342c):显示(self.x+290,self.y+45,"积分："..self.当前积分)
	    jhzts:置颜色(0xff77342c):显示(self.x+460,self.y+45,"胜率："..self.胜率)
	    self.资源组[8]:显示(self.x+35,self.y+105)
	    self.资源组[9]:更新(x,y)
	    self.资源组[9]:显示(self.x+260,self.y+106,nil,nil,nil,self.匹配,1)
	    self.资源组[10]:更新(x,y)
	    self.资源组[11]:更新(x,y)
	    self.资源组[10]:显示(self.x+290,self.y+75,nil,nil,nil,self.匹配,1)
	    self.资源组[11]:显示(self.x+460,self.y+75,nil,nil,nil,self.匹配,1)
	    jhzts:置颜色(0xff77342c):显示(self.x+65,self.y+115,"当前段位:"..self.剑会称谓)
	    jhzts:置样式(1)
	    if self.当前积分>=1900 then
	    	jhzts:置颜色(0xff77342c):显示(self.x+150,self.y+260,"剑会积分:"..self.当前积分)
	    else
	    	jhzts:置颜色(0xff77342c):显示(self.x+150,self.y+260,"剑会积分:"..self.当前积分.."/"..self.升级积分)
	    end
	    jhzts:置样式(0)
	    -- self.资源组[10]:显示(self.x+100,self.y+40)
	    for n=1,#dwzy do
	    	if n == self.当前段位 then
	    		self.段位组[n]:显示(self.x+90,self.y+133)
	    	end
	    end
	    if self.匹配==false then
	    	if self.资源组[6]:事件判断() then
	    	    self.界面 = 1
    	    elseif self.资源组[9]:事件判断() then
    	    	if tp.当前地图==2013 then
    	    	    if (#tp.队伍数据~=nil and #tp.队伍数据 == 1) or tp.队伍数据[1]==nil then
						self.人数 = 1
						发送数据(6580,{人数=self.人数,模式="单挑模式"})
					else
					    tp.常规提示:打开("#Y/该模式禁止组队。")
					end
				else
					tp.常规提示:打开("#Y/当前地图禁止排位。")
    	    	end
	    	elseif self.资源组[10]:事件判断() then--wp
	    		tp.窗口.对话栏:文本("","活动属性设置","您希望设置哪部分活动属性呢？",{"战斗物品设置","路过路过"})--,"领取天赋符","变身效果设置",
	    	elseif self.资源组[11]:事件判断() then--daf
	    		发送数据(6587.1)
	    		-- tp.窗口.对话栏:文本("","","该功能暂未开放")
	    	end
	    end
	elseif self.界面 == 3 then
		self.资源组[6]:更新(x,y)
	    self.资源组[2]:显示(self.x,self.y)
	    self.资源组[6]:显示(self.x+15,self.y+295,nil,nil,nil,self.匹配,1)
	    jhzts:置颜色(0xff77342c):显示(self.x+45,self.y+55,"剑会天下匹配模式分为：1V1、3V3、5V5，目前仅开放1V1单挑模式")--"剑会天下匹配模式分为：1V1、3V3、5V5")
	    jhzts:置颜色(0xff77342c):显示(self.x+45,self.y+85,"剑会天下段位积分分为：")
	    jhzts:置颜色(0xff77342c):显示(self.x+100,self.y+110,"剑会天下·新秀：1000-1299分")
	    jhzts:置颜色(0xff77342c):显示(self.x+100,self.y+135,"剑会天下·百战：1300-1399分")
	    jhzts:置颜色(0xff77342c):显示(self.x+100,self.y+160,"剑会天下·千胜：1400-1499分")
	    jhzts:置颜色(0xff77342c):显示(self.x+100,self.y+185,"剑会天下·万军：1500-1899分")
	    jhzts:置颜色(0xff77342c):显示(self.x+100,self.y+215,"剑会天下·神话：≥1900分")
	    jhzts:置颜色(0xff77342c):显示(self.x+45,self.y+245,"剑会天下赛季奖励：每隔一周，将进行统计上个赛季积分排行，前10名有赛季奖励。")
	    if self.匹配==false then
	    	if self.资源组[6]:事件判断() then
	    	    self.界面 = 1
	    	end
	    end
	end
end


function 场景类_剑会天下:检查点(x,y)
	if self.可视 and (self.资源组[1]:是否选中(x,y) or self.资源组[2]:是否选中(x,y))  then
		return true
	end
end

function 场景类_剑会天下:初始移动(x,y)
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

function 场景类_剑会天下:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_剑会天下