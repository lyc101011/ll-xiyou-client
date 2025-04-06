-- @Author: baidwwy
-- @Date:   2023-10-29 07:06:03
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:31:05
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-10-23 03:43:43
--======================================================================--
local 场景类_进化宝宝 = class()
local require = require
local tp,zts1
local floor = math.floor
local format = string.format
local insert = table.insert
local min = math.min
local ceil = math.ceil
local box = 引擎.画矩形
local bw = require("gge包围盒")(0,0,124,42)
local tx = 引擎.取头像
local mouseb = 引擎.鼠标弹起
local ani = 引擎.取战斗模型
function 场景类_进化宝宝:初始化(根)
	self.ID = 16.4
	self.x = 275
	self.y = 129
	self.xx = 0
	self.yy = 0
	self.注释 = "鉴定装备"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts1 = tp.字体表.描边字体
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	self.选中物品 = nil
    self.加入 = 0
end

function 场景类_进化宝宝:打开(数据)
	self.数据 = 数据
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		self.头像组 = nil
		return
	else
		insert(tp.窗口_,self)
		local 按钮 = require("script/系统类/按钮")
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,325,290,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
			[3] = tp.资源:载入("pic111/进化界面/进化宝宝.png", "图片"),
			--[4] = 设置标题背景,
			[5] = 按钮.创建(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"  进化"),
			[6] = 按钮.创建(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"召唤兽"),
			[7] = 按钮.创建(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"高价值"),
			[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"修改密保"),
			[9] = 按钮.创建(自适应.创建(12,4,84,22,1,3),0,0,4,true,true,"各类锁介绍"),
			[10] = 按钮.创建(自适应.创建(12,4,74,22,1,3),0,0,4,true,true," 加锁"),
			[11] = 按钮.创建(自适应.创建(12,4,74,22,1,3),0,0,4,true,true," 解锁"),
			[12] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"加密保锁"),
			[13] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"解密保锁"),
			[14] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确认修改"),
			[15] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"临时解除"),
			[16] = tp.资源:载入("pic111/进化界面/加锁背包.png", "图片"),
			[17] = 自适应.创建(2,1,158,153,3,9),
			[18] = 自适应.创建(2,1,145,210,3,9),
			--[19] = tp.资源:载入('自用图标.wdf',"网易WDF动画",0x62F1C735),
			[20] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
			[21] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),

			[35] =  tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,139,2),
--987F3539--加锁图标--wzife.wdf
		}
		self.头像组 = {}
		self.动画={}
		self.可视 = true
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    local wz = require("gge文字类")
	    self.字体=wz.创建(字体路径,14,false,false,字体抗锯齿)
	    self.字体2=wz.创建(字体路径,14,false,false,字体抗锯齿)
		self.状态=1

	end
end

function 场景类_进化宝宝:更新(dt,x,y)

 self.鼠标=self:检查点(x,y)
end
function 场景类_进化宝宝:刷新背包(数据)
	self.数据 = 数据
end

function 场景类_进化宝宝:显示(dt,x,y)
	if not self.可视 then
		return false
	end
	self.焦点 = false
    self.资源组[2]:更新(x,y)
    self.资源组[5]:更新(x,y)
    if self.资源组[2]:事件判断() then
    	--self:打开()
    elseif self.资源组[5]:事件判断() then
   	if self.主召唤兽~=nil and self.主召唤兽~=0 then
           发送数据(3801.4,{序列=self.主召唤兽,操作="进化宝宝"})
	else
	tp.提示:写入("请选择要操作的召唤兽")
	end
    end
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x + 307,self.y + 4)
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
    引擎.场景.字体表.标题字体:置颜色(白色):显示(self.x+self.资源组[1].宽度/2,self.y+3,"进化界面")

	              self.资源组[3]:显示(self.x + 17,self.y+78-35)
	              self.资源组[5]:显示(self.x + 115,self.y+245)
		self.字体:置颜色(黄色)
		self.字体:显示(self.x+24,self.y+50-25,"请选择进化宝宝")
		self.字体:置颜色(白色)
		local bbs=tp.队伍[1].宝宝列表
		local bbsa = #bbs
			if bbsa > 4 then
		    self.加入 = min(ceil((bbsa-4)*self.资源组[35]:取百分比()),bbsa-4)
	        end
	        if bbsa > 4 then
		    self.资源组[35]:显示(self.x+296,self.y+83-35,x,y,self.鼠标)
	        end
		self.资源组[20]:更新(x,y,self.加入 > 0)
	    self.资源组[21]:更新(x,y,self.加入 < bbsa - 4)
	   -- self.资源组[20]:显示(self.x+301,self.y+73)
       -- self.资源组[21]:显示(self.x+301,self.y+262)


		if self.资源组[20]:事件判断() then
			self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-1,4,bbsa))
			--self.加入 = self.加入 - 1
		elseif self.资源组[21]:事件判断() then
			self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入+1,4,bbsa))
			--self.加入 = self.加入 + 1
		elseif(self.资源组[3]:是否选中(x,y) or self.资源组[20]:是否选中(x,y) or self.资源组[35]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
		    self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-1,4,bbsa))

	    elseif (self.资源组[3]:是否选中(x,y) or self.资源组[21]:是否选中(x,y) or self.资源组[35]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.加入 < bbsa - 4 then--鼠标下滚动
		    self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入+1,4,bbsa))

		end
		if self.主召唤兽 ~= nil then
		tp.影子:显示(self.x+82,self.y+170-30)
		if self.动画.主体~=nil then
			self.动画.主体:更新()
			self.动画.主体:显示(self.x+82,self.y+170-30)
			if self.动画.身体~=nil then
				self.动画.身体:更新()
				self.动画.身体:显示(self.x+82,self.y+170-30)
			end
			--self.资源组[36]:显示(self.x+244,self.y+40)
			if self.动画.饰品 ~= nil then
				self.动画.饰品:更新()
				self.动画.饰品:显示(self.x+82,self.y+170-30)
			end
		end

			tp.字体表.通用字体14:置颜色(黑色):显示(self.x+60,self.y+210-35,bbs[self.主召唤兽].气血.."/"..bbs[self.主召唤兽].最大气血)
                                          tp.字体表.通用字体14:置颜色(黑色):显示(self.x+60,self.y+236-35,bbs[self.主召唤兽].魔法.."/"..bbs[self.主召唤兽].最大魔法)
		    end

		     for i=1,4 do ---
		   if bbs[i+self.加入] ~= nil  then
			local jx = self.x+149
			local jy = self.y+(i*42)+44-35
			bw:置坐标(jx,jy+1)
			if self.头像组[i+self.加入] == nil or self.头像组[i+self.加入][1] ~= bbs[i+self.加入].模型 then
				self.头像组[i+self.加入] = {bbs[i+self.加入].模型}
				local n = tx(self.头像组[i+self.加入][1])
				self.头像组[i+self.加入][2] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			if bw:检查点(x,y) then
				if mouseb(0) and not self.资源组[35].接触 and self.鼠标 and not tp.消息栏焦点 then
					if self.主召唤兽 ~= i + self.加入  then
						if self.主召唤兽 == nil then
							self.主召唤兽 = i + self.加入
							self:主置形象()
						elseif self.主召唤兽 ~= nil  then
							self.主召唤兽 = i + self.加入
							self:主置形象()
						end
					else
						if self.主召唤兽 == i + self.加入 then
							self.主召唤兽 = nil
							self:主置形象()
						end
					end

				end
				self.焦点 = true
			end
			local 坐标={[1]=23,[2]=83,[3]=143}
			if self.主召唤兽 == i + self.加入 then
				box(jx-2,jy-3,jx+146,jy+40,-2097481216)
			end
			 tp.宠物头像背景_:显示(jx+1,jy)
			 self.头像组[i+self.加入][2]:显示(jx+4,jy+4)
			if self.主召唤兽 == i + self.加入 then
				--self.资源组[19]:显示(jx+95,jy+3)
			end
			if tp.队伍[1].宝宝列表[i+self.加入].参战信息 ~= nil then
				self.字体2:置颜色(-65536)
			else
				self.字体2:置颜色(-16777216)
			end
			 if bbs[i+self.加入].加锁~=nil and bbs[i+self.加入].加锁 then
			    tp.进化宝宝图标1:显示(jx+81,jy+22)
		     end
			self.字体2:显示(jx+41,jy+4,bbs[i+self.加入].名称)
			self.字体2:显示(jx+41,jy+21,bbs[i+self.加入].等级.."级")
		end
	  end

	if self.资源组[35].接触 then
		self.焦点 = true
	end
end
function 场景类_进化宝宝:主置形象()
	self.动画={}
	if tp.队伍[1].宝宝列表[self.主召唤兽]  ~= nil then
		local n = ani(tp.队伍[1].宝宝列表[self.主召唤兽].模型)
		self.动画.主体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		self.动画.主体:置方向(0)
		n = ani(tp.队伍[1].宝宝列表[self.主召唤兽].模型.."_身体")
		if n[6] ~= nil then
			self.动画.身体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			self.动画.身体:置方向(0)
		end
		if tp.队伍[1].宝宝列表[self.主召唤兽].饰品 ~= nil then
			n = ani(tp.队伍[1].宝宝列表[self.主召唤兽].模型.."_饰品")
			if n[6] ~= nil then
				self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				if tp.队伍[1].宝宝列表[self.主召唤兽].饰品颜色 then
				    self.动画.饰品:置颜色(tp.队伍[1].宝宝列表[self.主召唤兽].饰品颜色,-1)
				end
				self.动画.饰品:置方向(0)
			end
			-- local wp = tp._物品
		 --    local qq = wp()
		 --    qq:置对象(tp.队伍[1].宝宝列表[self.选中].模型.."饰品")
		 --    self.饰品[1]:置物品(qq)
		 --    self.饰品[1].物品.总类=57
		 --    self.饰品[1].物品.玄天灵力=tp.队伍[1].宝宝列表[self.选中].饰品.玄天灵力 or 0
		    --local wp=引擎.取物品(tp.队伍[1].宝宝列表[self.主召唤兽].模型.."饰品")
			--self.饰品.小动画=tp.资源:载入(wp[11],"网易WDF动画",wp[12])
			--self.饰品.大动画=tp.资源:载入(wp[11],"网易WDF动画",wp[13])
			--self.饰品.名称=tp.队伍[1].宝宝列表[self.主召唤兽].模型.."饰品"
			-- self.饰品.玄天灵力=tp.队伍[1].宝宝列表[self.选中].饰品.玄天灵力 or 0
			--self.饰品.说明=wp[1]
		else
			n = ani(tp.队伍[1].宝宝列表[self.主召唤兽].模型.."_装饰")
			if n[6] ~= nil then
				self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				self.动画.饰品:置方向(0)
			end
		end
		if tp.队伍[1].宝宝列表[self.主召唤兽].炫彩 ~= nil then
			self.动画.主体:炫彩染色(tp.队伍[1].宝宝列表[self.选中].炫彩,tp.队伍[1].宝宝列表[self.主召唤兽].炫彩组)
			if self.动画.身体 ~= nil then
				self.动画.身体:炫彩染色(tp.队伍[1].宝宝列表[self.选中].炫彩,tp.队伍[1].宝宝列表[self.主召唤兽].炫彩组)
			end
		else
			if tp.队伍[1].宝宝列表[self.主召唤兽].染色方案 ~= nil and tp.队伍[1].宝宝列表[self.主召唤兽].染色组~=nil then
				self.动画.主体:置染色(tp.队伍[1].宝宝列表[self.主召唤兽].染色方案,tp.队伍[1].宝宝列表[self.主召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[3])
				self.动画.主体:置方向(0)
				if self.动画.身体 ~= nil then
					self.动画.身体:置染色(tp.队伍[1].宝宝列表[self.主召唤兽].染色方案,tp.队伍[1].宝宝列表[self.主召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[3])
					self.动画.身体:置方向(0)
				end
			end
		end
	end
end
function 场景类_进化宝宝:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 场景类_进化宝宝:初始移动(x,y)
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

function 场景类_进化宝宝:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_进化宝宝