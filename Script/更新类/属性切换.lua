-- @Author: baidwwy
-- @Date:   2023-10-05 09:43:27
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-10-13 00:28:12
--======================================================================--
local 属性切换 = class()
local tp,zts,zys
local insert = table.insert
local dwd={"等级","飞升","体质","魔力","力量","耐力","敏捷","潜力"}


function 属性切换:初始化(根)
	self.ID = 131
	self.x = 249
	self.y = 230
	self.xx = 0
	self.yy = 0
	self.方案 = 0
	self.注释 = "属性切换"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,442,332,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 资源:载入("pic/转门派/属性切换.png","图片"),
		[4] = 自适应.创建(7,1,120,22,1,3,nil,18),
		[5] = 按钮.创建(自适应.创建(12,4,98,22,1,3),0,0,4,true,true,"保存当前属性"),
		[6] = 按钮.创建(自适应.创建(12,4,82,22,1,3),0,0,4,true,true,"修改该方案"),
		[7] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"启用方案"),

	}
	self.方案组 ={
		[1] = 按钮.创建(自适应.创建(12,4,25,22,1,3),0,0,4,true,true,"1"),
		[2] = 按钮.创建(自适应.创建(12,4,25,22,1,3),0,0,4,true,true,"2"),
		[3] = 按钮.创建(自适应.创建(12,4,25,22,1,3),0,0,4,true,true,"3"),
		[4] = 按钮.创建(自适应.创建(12,4,25,22,1,3),0,0,4,true,true,"4"),
		}
	self.资源组[5]:置偏移(-1,0)
	self.资源组[6]:置偏移(-1,0)
	self.资源组[7]:置偏移(-1,0)
	self.资源组[2]:绑定窗口_(self.ID)
	for i=5,7 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	for i=1,4 do
		self.方案组[i]:绑定窗口_(self.ID)
	end
	-- self.资源组[2]:绑定窗口_(self.ID)
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
end

function 属性切换:打开(内容)
	if self.可视 then
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.默认方案=内容[1]
		self.全部方案=内容
		self.飞升="否"
		if tp.队伍[1].历劫.飞升 then
		    self.飞升="是"
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true

	end
end
function 属性切换:刷新(内容)
		self.默认方案=内容[1]
		self.全部方案=内容
		self.飞升="否"
		if tp.队伍[1].历劫.飞升 then
		    self.飞升="是"
		end
end

function 属性切换:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	-- self.资源组[6]:更新(x,y)
	-- self.资源组[7]:更新(x,y)
	for i=1,#self.全部方案-1 do
		self.方案组[i]:更新(x,y,self.方案~=i)
		self.方案组[i]:显示(self.x+225+i*30,self.y+32)
		if self.方案组[i]:事件判断() then
			self.方案=i
		end
	end

	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[5]:事件判断() then
		发送数据(201,{方案=self.方案})
	elseif self.资源组[6]:事件判断() then--修改当前方案
		发送数据(202,{方案=self.方案})
	elseif self.资源组[7]:事件判断() then--启用当前方案
		发送数据(203,{方案=self.方案})
	end
	tp.窗口标题背景_:显示(self.x-90+self.资源组[1].宽度/2,self.y)
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"混沌镜")
    self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
    self.资源组[3]:显示(self.x+10,self.y+29)
    zts:置颜色(0xFFCCCCFF)
    for i=1,8 do
    	self.资源组[4]:显示(self.x+70,self.y+62+(i-1)*30)
    	self.资源组[4]:显示(self.x+291,self.y+62+(i-1)*30)
    	zts:显示(self.x+30,self.y+65+(i-1)*30,dwd[i])
    	zts:显示(self.x+251,self.y+65+(i-1)*30,dwd[i])
    end
    zts:置颜色(黑色)
    zts:显示(self.x+80,self.y+65,tp.队伍[1].等级)
    zts:显示(self.x+80,self.y+65+30*1,self.飞升)
    zts:显示(self.x+80,self.y+65+30*2,self.默认方案.体质)
    zts:显示(self.x+80,self.y+65+30*3,self.默认方案.魔力)
    zts:显示(self.x+80,self.y+65+30*4,self.默认方案.力量)
    zts:显示(self.x+80,self.y+65+30*5,self.默认方案.耐力)
    zts:显示(self.x+80,self.y+65+30*6,self.默认方案.敏捷)
    zts:显示(self.x+80,self.y+65+30*7,self.默认方案.潜力)
    if self.方案 ~= 0 then
    zts:显示(self.x+300,self.y+65,tp.队伍[1].等级)
    zts:显示(self.x+300,self.y+65+30*1,self.飞升)
    zts:显示(self.x+300,self.y+65+30*2,self.全部方案[self.方案+1].体质)
    zts:显示(self.x+300,self.y+65+30*3,self.全部方案[self.方案+1].魔力)
    zts:显示(self.x+300,self.y+65+30*4,self.全部方案[self.方案+1].力量)
    zts:显示(self.x+300,self.y+65+30*5,self.全部方案[self.方案+1].耐力)
    zts:显示(self.x+300,self.y+65+30*6,self.全部方案[self.方案+1].敏捷)
    zts:显示(self.x+300,self.y+65+30*7,self.全部方案[self.方案+1].潜力)
end
    self.资源组[5]:更新(x,y)
    self.资源组[6]:更新(x,y,self.方案 ~= 0)
    self.资源组[7]:更新(x,y,self.方案 ~= 0)
    self.资源组[5]:显示(self.x+64,self.y+302)
    self.资源组[6]:显示(self.x+254,self.y+302)
    self.资源组[7]:显示(self.x+345,self.y+302)

end

function 属性切换:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 属性切换:初始移动(x,y)
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

function 属性切换:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 属性切换