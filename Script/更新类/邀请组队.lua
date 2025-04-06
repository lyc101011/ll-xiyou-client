-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-11 22:21:43
--======================================================================--
local 邀请组队 = class()
local tp,zts
local mousea = 引擎.鼠标弹起
local insert = table.insert
local txs = 引擎.取头像
function 邀请组队:初始化(根)
	self.ID = 127
	self.x = 354
	self.y = 119
	self.xx = 0
	self.yy = 0
	self.注释 = "邀请组队"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = false
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(6,1,305,84,3,9),
		[2] = 按钮.创建(自适应.创建(12,4,115,22,1,3),0,0,4,true,true,"     接受"),
		[3] = 按钮.创建(自适应.创建(12,4,115,22,1,3),0,0,4,true,true,"     拒绝"),
		[4] = 资源:载入('wzife.wdf',"网易WDF动画",1000284792),


	}
    self.头像背景 = 资源:载入('pic/txbj.png',"图片")
	self.窗口时间 = 0
	tp = 根
	self.介绍文本 = 根._丰富文本(260,300,tp.字体表.道具详情)

end

function 邀请组队:打开(内容)
	if self.可视 then
		if 内容==nil then
			self.介绍文本:清空()
		    self.可视 = false
		    return
		end
        self.队伍id=内容.队长id
        self.邀请id=内容.邀请id
		self.PK开关="关"
		self.助战编号=内容.助战编号
		if 内容.PK开关~=nil then
		    self.PK开关="开"
		end
		local xx = txs(内容.模型)
		self.头像 = tp.资源:载入(xx[9],"网易WDF动画",xx[8])
		self.名称=内容.名称
		self.等级=内容.等级
		self.介绍文本:清空()
		self.介绍文本:添加文本("#Y"..self.名称.."#W("..self.等级.."级，PK开关："..self.PK开关..")邀请你加入他们的队伍，你是否接受？")
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间

	else
		insert(tp.窗口_,self)
		self.队伍id=内容.队长id
		self.邀请id=内容.邀请id
		self.PK开关="关"
		self.助战编号=内容.助战编号
		if 内容.PK开关~=nil then
		    self.PK开关="开"
		end
		local xx = txs(内容.模型)
		self.头像 = tp.资源:载入(xx[9],"网易WDF动画",xx[8])
		self.名称=内容.名称
		self.等级=内容.等级
		self.介绍文本:清空()
		self.介绍文本:添加文本("#Y"..self.名称.."#W("..self.等级.."级，PK开关："..self.PK开关..")邀请你加入他们的队伍，你是否接受？")

		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 邀请组队:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(全局游戏宽度-380,全局游戏高度-174)
	self.头像背景:显示(全局游戏宽度-380+6,全局游戏高度-174+6)
	self.头像:显示(全局游戏宽度-380+6,全局游戏高度-174+7)
	self.介绍文本:显示(全局游戏宽度-380+41,全局游戏高度-174+6)
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[2]:显示(全局游戏宽度-380+40,全局游戏高度-174+56)
	self.资源组[3]:显示(全局游戏宽度-380+184,全局游戏高度-174+56)
	self.资源组[4]:显示(全局游戏宽度-380+13,全局游戏高度-174+56+23)
	if self.资源组[2]:事件判断() then --接受
		if self.助战编号 then
			发送数据(2011,{队伍id=self.队伍id,邀请id=self.邀请id,助战编号=self.助战编号})
		else
			发送数据(4015,{队伍id=self.队伍id,邀请id=self.邀请id})
		end
		self:打开()
		return
    elseif self.资源组[3]:事件判断() then
    	self:打开()
    	return
	end



end


function 邀请组队:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 邀请组队:初始移动(x,y)
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

function 邀请组队:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 邀请组队