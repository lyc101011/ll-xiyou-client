-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:36
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-30 15:57:40
local 系统类_每日格子 = class()
local tp,zts,zts1
local mouse = 引擎.鼠标弹起

function 系统类_每日格子:初始化(x,y,ID,注释,根)
	self.x = x
	self.y = y
	self.注释 = 注释
	self.技能 = nil
	self.事件 = false
	self.焦点 = false
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	self.背景 = 资源:载入('org.rpk',"网易WDF动画",16777570)
	self.星 = 资源:载入('org.rpk',"网易WDF动画",16777569)
	self.参加 = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",16777558),0,0,4,true,true,"参加")
	self.名称 = ""
	self.当前次数 = 0
	self.最大次数 = 0
	self.活跃 = 0
	self.星级 = 0
	self.参加:置偏移(12,0)
	tp = 根
	zts = tp.字体表.华康16粗
	zts1 = tp.字体表.描边字体
end

function 系统类_每日格子:置数据(sj)
	if sj ~= nil then
		self.名称 = sj.名称
		self.最大次数 = sj.最大次数
		self.活跃 = sj.活跃
		self.星级 = sj.星级
		self.模型 = tp.资源:载入(sj.素材,"网易WDF动画",sj.地址)
	end
end

function 系统类_每日格子:显示(x,y,条件)
	if self.名称 == "" then
		return
	end
	self.参加:更新(x,y)
	self.事件 = false
	self.焦点 = false
	if 条件 and self.模型:是否选中(x,y) then
	 	tp.按钮焦点 = true
	 	tp.禁止关闭 = true
	 	self.焦点 = true
	 	self.模型:置高亮()
	 	if mouse(0) then
	 		self.事件 = true
		end
		tp.提示:每日提示(x,y,self.名称)
	else
	 	self.模型:取消高亮()
	end
	self.背景:显示(self.x,self.y)
	self.模型:显示(self.x+13,self.y+12)
	self.参加:显示(self.x+195,self.y+40)

	if self.参加:事件判断() then
		 local 事件 = function()
			发送数据(6586,{名称=self.名称})
		end
		tp.窗口.文本栏:载入("我可以为少侠传送至活动NPC身旁，少侠需要进行传送操作吗？",nil,true,事件)
	end

	zts:置颜色(0xFF000000)
	zts:显示(self.x+73,self.y+18,self.名称)
	zts:显示(self.x+97,self.y+47,"x"..self.活跃)
	zts:置颜色(0xFF00FF00)
	zts:显示(self.x+216,self.y+17,self.当前次数.."/"..self.最大次数)
	zts:置颜色(0xFFFFFFFF)
	if self.星级 == 1 then
		self.星:显示(self.x+33,self.y+52)
	elseif self.星级 == 2 then
		self.星:显示(self.x+26,self.y+52)
		self.星:显示(self.x+40,self.y+52)
	end
end

function 系统类_每日格子:置坐标(x,y)
	self.x = x
	self.y = y
end

return 系统类_每日格子