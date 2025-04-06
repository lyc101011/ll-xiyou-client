
local 场景类_商会列表 = class()
local tp,task,font,fonts1,zts,zts1,zts2
local bw = require("gge包围盒")(0,0,148,18)
local box = 引擎.画矩形
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local ceil = math.ceil
local min = math.min
local max = math.max
local format = string.format
local floor = math.floor
function 场景类_商会列表:初始化(根)
	self.ID = 16
	self.x = 364
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽商会"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 滑块 = 根._滑块
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,289,441,3,9),
		[3] = 自适应.创建(37,1,1,1,3,nil),
		[4] = 自适应.创建(2,1,262,91,3,9),
		[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[7] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[8] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"物品店"),
		[9] = 按钮.创建(自适应.创建(12,4,86,22,1,3),0,0,4,true,true,"加入名店夹"),
		[10] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true,"宠物店"),
		[11] = 根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,192,2),
		[12] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E13),0,0,4,true,true),
	}
	for n=5,11 do
	   self.资源组[n]:绑定窗口_(16)
	end
	self.介绍文本 = 根._丰富文本(187,215)
	self.选中名 = nil
	tp = 根
	zts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
	font = 根.字体表.人物字体_
	fonts1 = 根.字体表.描边字体
	zts2 = 根.字体表.普通字体
	self.加入 = 0
	task = 根.商会列表
	self.窗口时间 = 0
	self.商会列表={}
	self.选中=0
end

function 场景类_商会列表:打开(数据)
	if self.可视 then
	self.可视 = false
	else
		self.商会列表=数据
		insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end


function 场景类_商会列表:显示(dt,x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y,self.加入 > 0)
	self.资源组[7]:更新(x,y,self.加入 < #self.商会列表 - 10)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[12]:更新(x,y)
	if self.资源组[6]:事件判断() then
		self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.加入-1,10,#self.商会列表))
	elseif self.资源组[7]:事件判断() then
		self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.加入+1,10,#self.商会列表))
	elseif(self.资源组[3]:是否选中(x,y) or self.资源组[6]:是否选中(x,y) or self.资源组[3]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
		self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.加入-1,10,#self.商会列表))
	elseif (self.资源组[3]:是否选中(x,y) or self.资源组[7]:是否选中(x,y) or self.资源组[3]:是否选中(x,y)) and 引擎.取鼠标滚轮() ==-1 and self.加入 < #self.商会列表 - 10 then--鼠标下滚动
		self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.加入+1,10,#self.商会列表))
	elseif self.资源组[8]:事件判断() then
		if self.选中~=0 then
			发送数据(6107,{编号=self.商会列表[self.选中].编号,店主id= self.商会列表[self.选中].店主id})
		else
			tp.常规提示:打开("请选择一个店铺")
		end
	elseif self.资源组[10]:事件判断() then
		if self.选中~=0 then
			发送数据(6108,{编号=self.商会列表[self.选中].编号,店主id= self.商会列表[self.选中].店主id})
		else
			tp.常规提示:打开("请选择一个店铺")
		end
	end
	if self.资源组[12]:事件判断() then
       self.可视 = false
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y+1)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"商  铺")
	self.资源组[5]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:置宽高(262,250)
	self.资源组[3]:显示(self.x+14,self.y+50)
	fonts1:置字间距(3)
	fonts1:显示(self.x+30,self.y+56,"号码/店名 营销/规模")
	self.资源组[4]:显示(self.x+14,self.y+313)
	self.资源组[6]:显示(self.x+263,self.y+76)
	self.资源组[7]:显示(self.x+263,self.y+283)
	self.资源组[8]:显示(self.x+121,self.y+410)
	self.资源组[9]:显示(self.x+18,self.y+410)
	self.资源组[10]:显示(self.x+191,self.y+410)
	self.资源组[12]:显示(self.x+265,self.y+4)
	if #self.商会列表 > 10 then
		self.资源组[11]:置高度(min(floor(192/(#self.商会列表-10)),192-10))
		self.加入 = min(ceil((#self.商会列表-10)*self.资源组[11]:取百分比()),#self.商会列表-10)
		self.资源组[11]:显示(self.x + 264,self.y + 90,x,y,self.鼠标)
	end
	font:置颜色(-16777216)
	font:置阴影颜色(nil)
	for n = 1,10 do
		bw:置坐标(self.x + 17,self.y + 89 + (n-1)*19.5)
		if self.商会列表[n + self.加入] ~= nil then
			if self.选中 ~= self.加入 + n then
				if bw:检查点(x,y) then
					box(self.x + 21,self.y + 93 + (n-1)*19.5,self.x + 169,self.y + 93 + (n-1)*19.5+18,-3551379)
					if mouseb(0) and self.鼠标 and not tp.消息栏焦点 then
						self.选中 = n + self.加入
						self.介绍文本:清空()
						self.介绍文本:添加文本("#L/◆"..self.商会列表[self.选中].店主id.."祝大家鼠年大吉，心想事成万事如意")
					end
					self.焦点 = true
				end
			else
				local ys = -10790181
				if bw:检查点(x,y) then
					ys = -9670988
					self.焦点 = true
				end
				box(self.x + 21,self.y + 93 + (n-1)*19.5,self.x + 169,self.y + 93 + (n-1)*19.5+18,ys)
			end
			font:显示(self.x+30,self.y+95+(n-1)*19.5,self.商会列表[n + self.加入].名称)
			self.选中名 = self.商会列表[n + self.加入].名称
		end
	end
	self.介绍文本:显示(self.x + 37,self.y + 324)

end

function 场景类_商会列表:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_商会列表:初始移动(x,y)
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

function 场景类_商会列表:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_商会列表