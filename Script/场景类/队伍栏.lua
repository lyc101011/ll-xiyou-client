-- @Author: baidwwy
-- @Date:   2024-05-23 06:05:09
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-27 14:37:26
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-12-31 10:49:03
--======================================================================--
local 场景类_队伍栏 = class()
local insert = table.insert
local remove = table.remove
local floor = math.floor
local tp,zts,zts1

function 场景类_队伍栏:初始化(根)
	self.ID = 51
	self.x = 112
	self.y = 169
	self.xx = 0
	self.yy = 0
	self.注释 = "队伍栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,617,311,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"阵型"),
		[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"踢出队伍"),
		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"申请列表"),
		[7] = 根.资源:载入('addon.wdf',"网易WDF动画",0x2231EBB4),
		[8] = 自适应.创建(3,1,93,19,1,3),
		[9] = 自适应.创建(3,1,36,19,1,3),
		[10] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"离队队伍"),
		[11] = 自适应.创建(2,1,116,141,3,9),
		[12] = 自适应.创建(3,1,117,19,1,3),
		[13] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"提升队长"),
		[14] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"等级"),
		[15] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"查看"),
		[16] = 根.资源:载入("pic/ggz.png","图片"),
		[17] = 根.资源:载入("pic/ggz.png","图片"),
		[18] = 根.资源:载入("pic/ggz.png","图片"),
		[19] = 根.资源:载入("pic/ggz.png","图片"),
		[20] = 根.资源:载入("pic/ggz.png","图片"),
		[21] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"全组"),
	}
	for n=2,4 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	self.队伍坐标 = {14,133,252,371,490}
	self.队伍格子 = {}
	local 格子 = require("script/系统类/队伍_格子")
	for i=1,5 do
		self.队伍格子[i] = 格子.创建(0,0,i,根)
	end
	self.选中人物 = 0
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
  	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("最低等级输入",0,0,36,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(3)
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(-16777216)
   	self.输入框1 = 总控件:创建输入("最高等级输入",0,0,36,14)
   	self.输入框1:置数字模式()
	self.输入框1:置可视(false,false)
	self.输入框1:置限制字数(3)
	self.输入框1:屏蔽快捷键(true)
	self.输入框1:置光标颜色(-16777216)
	self.输入框1:置文字颜色(-16777216)
end

function 场景类_队伍栏:打开()
	if self.可视 then
		for i=1,5 do
			self.队伍格子[i].禁止 = false
		end
		self.选中人物 = 0
		self.可视 = false
		self.输入框:置可视(false,false)
		self.输入框1:置可视(false,false)
	else
		insert(tp.窗口_,self)
		for i=1,5 do
			self.队伍格子[i]:置人物(tp.队伍数据[i])
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.输入框:置可视(true,true)
	    self.输入框:置文本(0)
	    self.输入框1:置可视(true,true)
	    self.输入框1:置文本(0)
	    self.输入框:置文本(tp.队伍数据.限制等级[1])
	    self.输入框1:置文本(tp.队伍数据.限制等级[2])
	end
end

function 场景类_队伍栏:重置()
	if not self.可视 then
		return false
	end
	for i=1,5 do
		self.队伍格子[i]:置人物(tp.队伍数据[i])
	end
end

function 场景类_队伍栏:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if tp.场景.人物.队长开关==nil then
	    tp.场景.人物.队长开关=false
	end
	self.资源组[3]:更新(x,y,tp.场景.人物.队长开关)
	self.资源组[21]:更新(x,y,tp.场景.人物.队长开关)
	self.资源组[4]:更新(x,y,self.选中人物 ~= 0 and #tp.队伍数据 > 1 and tp.场景.人物.队长开关)
	self.资源组[13]:更新(x,y,self.选中人物 ~= 0 and #tp.队伍数据 > 1 and tp.场景.人物.队长开关)
	self.资源组[5]:更新(x,y,tp.场景.人物.队长开关 )
	self.资源组[10]:更新(x,y)
	self.资源组[14]:更新(x,y,tp.场景.人物.队长开关)
	self.资源组[15]:更新(x,y,self.选中人物 ~= 0 and tp.场景.人物.队长开关)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
		发送数据(4008)
 elseif self.资源组[21]:事件判断() then
		发送数据(4008.1)
	elseif self.资源组[4]:事件判断() then
		tp.窗口.文本栏:载入("#R/真的要踢出等级为"..tp.队伍数据[self.选中人物].等级.."的队员"..tp.队伍数据[self.选中人物].名称.."吗？","踢出人物",true)
	elseif self.资源组[5]:事件判断() then  --申请列表
		发送数据(4003)
	elseif self.资源组[10]:事件判断() then
		 发送数据(4006)
	elseif self.资源组[13]:事件判断() then
		发送数据(4010,{序列=self.选中人物})
		self:打开()
		return false
	elseif self.资源组[14]:事件判断() then
      if self.输入框:取文本()=="" or self.输入框1:取文本()=="" or (self.输入框:取文本() == self.输入框1:取文本()) then
        tp.常规提示:打开("输入等级错误!")
        return
      elseif self.输入框:取文本()+0>self.输入框1:取文本()+0 then
        tp.常规提示:打开("设置的最低等级不能比最高等级低噢!")
        return
      end
      if self.输入框:取文本()+0>175 then
        self.输入框1:置文本(175)
      end
		发送数据(4012,{序列={self.输入框:取文本(),self.输入框1:取文本()}})
	elseif self.资源组[15]:事件判断() and self.选中人物~=nil and self.选中人物~=0 then
		发送数据(4011,{序列=self.选中人物})
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-85+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+7,self.y+3,"队伍列表")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[7]:更新(dt)
	self.资源组[7]:显示(self.x + 63,self.y + 58)
	self.资源组[8]:显示(self.x+154,self.y+33+10)
	self.资源组[14]:显示(self.x + 395,self.y + 28)
	self.资源组[15]:显示(self.x + 395,self.y + 55)
	self.资源组[4]:显示(self.x + 455,self.y + 28)
	self.资源组[5]:显示(self.x + 455,self.y + 55)
	self.资源组[13]:显示(self.x + 530,self.y + 55)
	self.资源组[10]:显示(self.x + 530,self.y + 28)
	--zts:显示(self.x + 164,self.y + 37,tp.阵型表[tp.阵型][1])
	--zts:显示(self.x + 300,self.y + 37,tp.阵型表[tp.阵型][3])   tp.队伍数据
	zts1:显示(self.x+15,self.y+35+10,"令牌")
	zts1:显示(self.x+252,self.y+35+10,"等级：")
	zts1:显示(self.x+334,self.y+35+10,"至")
	self.资源组[3]:显示(self.x + 89,self.y + 32+10)
	self.资源组[21]:显示(self.x + 89,self.y + 15)
	self.资源组[9]:显示(self.x+292,self.y+33+10)
	self.资源组[9]:显示(self.x+354,self.y+33+10)
	zts:置颜色(-16777216)
	zts:显示(self.x + 164,self.y + 37+10,tp.队伍数据.阵型)
	-- zts:显示(self.x + 300,self.y + 37+10,tp.队伍数据.限制等级[1])
	-- zts:显示(self.x + 360,self.y + 37+10,tp.队伍数据.限制等级[2])
	self.输入框:置坐标(self.x + 300,self.y + 37+10)
	self.输入框1:置坐标(self.x + 360,self.y + 37+10)
	for i=0,4 do
		local jx = 11+i*120
		self.资源组[11]:显示(self.x+jx,self.y+63+20)
		for n=0,2 do
			self.资源组[12]:显示(self.x+jx,self.y+211+n*24+20)
		end
		i = i + 1
		self.队伍格子[i]:置坐标(self.x + jx,self.y + 63+20)
		self.队伍格子[i]:显示(dt,x,y+20,self.鼠标,tp.队伍数据)
		if self.队伍格子[i].事件 then
			if self.选中人物 ~= 0 and self.选中人物 ~= i then
				if i == 1 or self.选中人物 == 1 then
					tp.常规提示:打开("队长不可以更换位置哦！")
				else
					发送数据(4013,{序列=self.选中人物,序列2=i})
				end
				self.队伍格子[self.选中人物].禁止 = false
				self.选中人物 = 0
				--[[tp:刷新队伍()
				local jy1 = tp.队伍[i]
				local jy2 = tp.队伍[self.选中人物]
				tp.队伍[i] = jy2
				tp.队伍[self.选中人物] = jy1
				self.队伍格子[i]:置人物(jy2)
				self.队伍格子[self.选中人物]:置人物(jy1)
				self.队伍格子[self.选中人物].禁止 = false
				self.选中人物 = 0
				tp.场景.人物.名称偏移.x = floor(tp.字体表.人物字体:取宽度(tp.队伍[1].名称) / 2)
				tp.场景.人物:置模型()
				tp:刷新队伍()
				tp.窗口.灵饰:刷新()
				tp.窗口.法宝:刷新() --]]
			else
				self.选中人物 = i
				self.队伍格子[self.选中人物].禁止 = true
			end
		end
		zts1:显示(self.x+jx+88,self.y+182+20,i)
	end
	self.资源组[16]:显示(self.x+11+88,self.y+100) --1
	self.资源组[17]:显示(self.x+11+120+88,self.y+100) --2
	self.资源组[18]:显示(self.x+11+2*120+88,self.y+100) --3
	self.资源组[19]:显示(self.x+11+3*120+88,self.y+100) --4
	self.资源组[20]:显示(self.x+11+4*120+88,self.y+100) --5
	if tp.队伍数据.阵型=="普通" then
		if self.资源组[16]:是否选中(x,y) or self.资源组[17]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) or self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#Y普通阵法\n#Y无任何加成")
        end
	end
	if tp.队伍数据.阵型=="天覆阵" then
		if self.资源组[16]:是否选中(x,y) or self.资源组[17]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) or self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法攻击效果+20%\n#G固定伤害+15％\n#R速度-10%")
        end
	end
	if tp.队伍数据.阵型=="地载阵" then
		if self.资源组[16]:是否选中(x,y)or self.资源组[18]:是否选中(x,y) or self.资源组[19]:是否选中(x,y)  then
			tp.提示:阵法提示(x,y,"#G物法防御效果+15%")
        end
        if self.资源组[17]:是否选中(x,y) then
            tp.提示:阵法提示(x,y,"#G物法伤害效果+15%")
        end
        if self.资源组[20]:是否选中(x,y) then
            tp.提示:阵法提示(x,y,"#G速度+10%")
        end
	end
	if tp.队伍数据.阵型=="鹰啸阵" then
		if self.资源组[16]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物理防御效果+10%")
		end
		if self.资源组[17]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G速度+15%")
		end
		if self.资源组[19]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+15%")
		end
		if self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+10%")
		end
	end
	if tp.队伍数据.阵型=="风扬阵" then
		if self.资源组[16]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+20%\n#G速度+5%")
		end
		if self.资源组[17]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+10%")
		end
		if self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G速度+10%")
		end
	end
	if tp.队伍数据.阵型=="云垂阵" then
		if self.资源组[16]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法防御效果+25%\n#R速度-15%")
		end
		if self.资源组[17]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法防御效果+10%")
		end
		if self.资源组[18]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+20%")
		end
		if self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G速度+10%")
		end
	end
	if tp.队伍数据.阵型=="龙飞阵" then
		if self.资源组[16]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G法术防御效果+10%")
		end
		if self.资源组[17]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物理防御效果+10%")
		end
		if self.资源组[18]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G法术伤害效果+30%\n#R速度-20% ")
		end
		if self.资源组[19]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G速度+10%")
		end
		if self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+20%")
		end
	end
	if tp.队伍数据.阵型=="雷绝阵" then
		if self.资源组[16]:是否选中(x,y) or self.资源组[17]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G固定伤害效果+20%")
		end
		if self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+10%")
		end
	end
	if tp.队伍数据.阵型=="虎翼阵" then
		if self.资源组[16]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+30%")
		end
		if self.资源组[17]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法防御效果+10%")
		end
		if self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+10%")
		end
	end
	if tp.队伍数据.阵型=="鸟翔阵" then
		if self.资源组[16]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G速度+20%")
		end
		if self.资源组[17]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G速度+10%")
		end
		if self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G速度+15%")
		end
	end
	if tp.队伍数据.阵型=="蛇蟠阵" then
		if self.资源组[16]:是否选中(x,y) or self.资源组[17]:是否选中(x,y) or self.资源组[18]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G抗封能力+20%")
		end
		if self.资源组[19]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) then
			tp.提示:阵法提示(x,y,"#G物法伤害效果+10%")
		end
	end
	self.控件类:更新(dt,x,y)
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
	if self.输入框1._已碰撞 then
		self.焦点 = true
	end
	self.控件类:显示(x,y)
end

function 场景类_队伍栏:刷新人物()
   for i=1,5 do
	 self.队伍格子[i]:置人物(nil)
	 self.队伍格子[i]:置人物(tp.队伍数据[i])
   end
end

function 场景类_队伍栏:刷新(a,b,c)
	if a ~= nil then
		self.队伍格子[a]:置人物(tp.队伍数据[a])
	end
	if b ~= nil then
		self.队伍格子[b]:置人物(tp.队伍数据[b])
	end
	if c ~= nil then
		for i=1,5 do
			self.队伍格子[i]:置人物(tp.队伍数据[i])
		end
	end
	self.选中人物=0
end

function 场景类_队伍栏:踢出队伍()
	发送数据(4007,{序列=self.选中人物})
	self.选中人物=0
end

function 场景类_队伍栏:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 场景类_队伍栏:初始移动(x,y)
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

function 场景类_队伍栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_队伍栏