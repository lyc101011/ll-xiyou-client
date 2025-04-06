-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-17 19:47:54
-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-17 02:46:03
-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-17 02:32:31
--======================================================================--
local 勾魂索二 = class()
local tp,zts
local tx = 引擎.取头像
local mousea = 引擎.鼠标弹起
-- local 按钮 = require("script/系统类/按钮")
local insert = table.insert
function 勾魂索二:初始化(根)
	self.ID = 125
	self.x = 354
	self.y = 219
	self.xx = 0
	self.yy = 0
	self.注释 = "勾魂索二"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	-- self.右键关闭 = 1
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,315,186,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] =按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"  准备"),
		[4] =按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"  取消"),
		[5] = 资源:载入('wzife.wd1',"网易WDF动画",999600305),
	}
	self.人物头像 = {}
    self.资源组[5]:置区域(0,0,315-17,2)
	for i=2,4 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.记忆角色 = {}
	self.人物头像背景 = {}
	self.确认 = {}
	-- self.资源组[4]:置偏移(-1,0)
	tp = 根

	self.窗口时间 = 0
	zts = tp.字体表.华康14
end

function 勾魂索二:打开()
	if self.可视 then
		self.已确定=false
		self.可视 = false
	else
		insert(tp.窗口_,self)
		local x1 = tx(tp.队伍[1].模型)
		self.玩家头像=tp.资源:载入(x1[7],"网易WDF动画",x1[2])
		self.已确定=false
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 勾魂索二:显示(dt,x,y)
	self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:更新(x,y)
    self.资源组[3]:更新(x,y)
    self.资源组[4]:更新(x,y)
    if self.资源组[2]:事件判断() then
        self:打开()
		return
	elseif self.资源组[3]:事件判断() then --确认
		if #tp.队伍数据 >= 2 then
			if self.已确定==false then
				tp.常规提示:打开("#Y/已准备，请等待对方准备（仅队长确认有效）")
				self.已确定=true
			    发送数据(6564)
			end
			-- self.确认[#self.确认+1]=1
		else
			if self.已确定==false then
				tp.常规提示:打开("#Y/准备成功，请等待对方准备")
				self.已确定=true
			    发送数据(6564)
			end
		end
    end
    if 引擎.场景.窗口.勾魂索一.sss==0 then
        self:打开()
		return
    end
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,"PK准备")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x+10+60,self.y+66+88)
	self.资源组[4]:显示(self.x+10+174,self.y+66+88)
	self.资源组[5]:显示(self.x+10,self.y+66)
	zts:置颜色(白色)
	zts:显示(self.x+10,self.y+30,"队伍栏中全部队员准备完成后，将提前进入10秒")
	zts:显示(self.x+10,self.y+48,"倒计时！")
	zts:显示(self.x+10,self.y+73,"队伍准备情况：")

	if #tp.队伍数据 >= 2 then
		for i=1,#tp.队伍数据 do
			if self.记忆角色[i+1] == nil or self.记忆角色[i+1] ~= tp.队伍数据[i].模型 then
				local x = tx(tp.队伍数据[i].模型)
				self.人物头像背景[i+1] = tp.资源:载入(x[7],"网易WDF动画",x[2])
				self.记忆角色[i+1] = tp.队伍数据[i].模型
			end
			tp.人物头像背景_:显示(self.x+18+(i-1)*57,self.y+96)
			self.人物头像背景[i+1]:显示(self.x+21+(i-1)*57,self.y+97)
			if self.已确定 then
				self.人物头像背景[i+1]:灰度级()

			end

		end
	else
        tp.人物头像背景_:显示(self.x+18,self.y+96)
        if self.已确定 then
           self.玩家头像:灰度级()
        end
		self.玩家头像:显示(self.x+21,self.y+97)
	end
end


function 勾魂索二:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 勾魂索二:初始移动(x,y)
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

function 勾魂索二:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 勾魂索二