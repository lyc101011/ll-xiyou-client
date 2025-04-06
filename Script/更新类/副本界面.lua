-- @Author: baidwwy
-- @Date:   2024-05-13 15:08:45
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-05-13 19:47:02
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-09-27 21:24:28
--======================================================================--
local 副本界面 = class()

local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp,zts1
local tp
local remove = table.remove

function 副本界面:初始化(根)
	self.ID = 122
	self.x = 210
	self.y = 110
	self.xx = 0
	self.yy = 0
	self.注释 = "创建副本界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	self.资源组 = {
		[1] = 自适应.创建(0,1,612,440,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 资源:载入("pic/副本/1.png","图片"),
		[4] = 资源:载入("pic/副本/2.png","图片"),
		[5] = 自适应.创建(37,1,1,1,3,nil), --大白背景 右侧带拉伸条
		[6] = 自适应.创建(78,1,198,78,3,9),--小白背景
		[7] = 按钮(自适应.创建(12,4,73,22,1,3),0,0,4,true,true,"查找副本"),
		[8] = 按钮(自适应.创建(12,4,73,22,1,3),0,0,4,true,true,"创建副本"),
		[9] = 按钮(自适应.创建(12,4,73,22,1,3),0,0,4,true,true,"申请加入"),
		[10] = 按钮(自适应.创建(12,4,86,22,1,3),0,0,4,true,true,"团队查找器"),
		[11] = 按钮(自适应.创建(12,4,99,22,1,3),0,0,4,true,true,"搜索所在副本"),
		[12] = 按钮(自适应.创建(12,4,99,22,1,3),0,0,4,true,true,"副本进度查询"),
		[13] = 资源:载入("pic/副本/3.png","图片"),
		[14] = 自适应.创建(37,1,1,1,3,nil), --大白背景
		[15] = 资源:载入('pic/fenge.png',"图片"), --分割条
		[16] = 小型选项栏.创建(自适应.创建(8,1,115,115,3,9),"游戏窗口设置"),--下拉框结束
		[17] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true), --下拉按钮
		[18] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true), --下拉按钮
		[19] = 按钮(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"  创 建"),

	}
	for i=7,12 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[19]:绑定窗口_(self.ID)
	self.状态=1

	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体

end

function 副本界面:打开(sj)
	if self.可视 then
		self.状态=1
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.状态=1
		tp.运行时间 = tp.运行时间 + 1
    	self.窗口时间 = tp.运行时间
    	self.可视 = true

	end
end



function 副本界面:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"副本团队")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	for i=7,12 do
    	self.资源组[i]:更新(x,y)
    end

    if self.资源组[2]:事件判断() then --关闭
        self:打开()
    elseif self.资源组[7]:事件判断() then --查找副本
    	self.状态 = 1
 --   elseif self.资源组[8]:事件判断() then --创建副本
--    	self.状态 = 2
    end
    self.资源组[7]:显示(self.x+14,self.y+32,nil,nil,nil,self.状态 == 1,2) --按钮 --查找副本
	self.资源组[8]:显示(self.x+98,self.y+32,nil,nil,nil,self.状态 == 2,2) --按钮 --创建副本


	if self.状态==1 then
		self.资源组[17]:更新(x,y)
	    self.资源组[18]:更新(x,y)
	    self.资源组[3]:显示(self.x+14,self.y+65)
		self.资源组[4]:显示(self.x+400,self.y+65)
		self.资源组[5]:置宽高(376,305)
		self.资源组[5]:显示(self.x+12,self.y+95)
		self.资源组[6]:显示(self.x+400,self.y+320)
		self.资源组[11]:显示(self.x+295,self.y+65) --搜索所在副本
		self.资源组[12]:显示(self.x+14,self.y+408) --副本进度
		self.资源组[10]:显示(self.x+117,self.y+408) --团队查找
		self.资源组[9]:显示(self.x+311,self.y+408) --申请加入
		self.资源组[15]:显示(self.x+300,self.y+95) --分割
		zts:置颜色(白色)
    	zts:显示(self.x+32,self.y+100,"副本名称")
    	zts:显示(self.x+140,self.y+100,"状态")
    	zts:显示(self.x+227,self.y+100,"团长昵称")
    	zts:显示(self.x+315,self.y+100,"团长等级")
    	self.资源组[17]:显示(self.x+105,self.y+97) --下拉按钮1
    	self.资源组[18]:显示(self.x+180,self.y+97) --下拉按钮2
    	-- self.资源组[16]:显示(self.x+105,self.y+95,x,y,self.鼠标)

	elseif self.状态==2 then
		self.资源组[19]:更新(x,y)
		self.资源组[5]:置宽高(148,333)
		self.资源组[5]:显示(self.x+12,self.y+65)
		self.资源组[14]:置宽高(426,163)
		self.资源组[14]:显示(self.x+174,self.y+65)
		self.资源组[13]:显示(self.x+174,self.y+238)
		self.资源组[19]:显示(self.x+521,self.y+409) --取消
		self.资源组[6]:显示(self.x+397,self.y+320)
		zts:置颜色(白色)
    	zts:显示(self.x+23,self.y+70,"选择副本")
    	zts:显示(self.x+185,self.y+70,"副本详情")
	end


end

function 副本界面:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 副本界面:初始移动(x,y)
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

function 副本界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 副本界面