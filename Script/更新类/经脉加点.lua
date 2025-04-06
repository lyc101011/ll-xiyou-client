-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-13 12:46:54
--======================================================================--
local 经脉加点 = class()
local tp,zts
local mousea = 引擎.鼠标弹起
local insert = table.insert
function 经脉加点:初始化(根)
	self.ID = 114
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "经脉加点"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(71,1,86,191,3,9),
		[2] = 资源:载入('pic/125.png',"图片"),
		[3] = 按钮.创建(自适应.创建(17,4,68,22,1,3),0,0,4,true,true," 取 消"),
		[4] = 按钮.创建(自适应.创建(12,4,68,22,1,3),0,0,4,true,true,"确认加点"),
	}
	for i=3,4 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[4]:置偏移(-1,0)
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.华康14
end

function 经脉加点:打开(选中,小号)
	if self.可视 then
		self.选中 = nil
		self.可视 = false
	else
		self.主角=nil
		self.助战编号=nil
		if 小号 then
			self.主角=小号
			self.助战编号=小号.助战编号
		else
			self.主角=tp.队伍[1]
		end
		insert(tp.窗口_,self)
		self.选中=选中
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 经脉加点:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[2]:显示(self.x,self.y-1)
	zts:显示(self.x+23,self.y+4,"乾元丹")
	zts:显示(self.x+9,self.y+33,"已用")
	zts:显示(self.x+9,self.y+33+24,"可用")
	zts:显示(self.x+9,self.y+33+24+24,"可换")
	zts:显示(self.x+9,self.y+33+24+24+32,"已选择1点")
	zts:置颜色(黄色):显示(self.x+45,self.y+33,tp.队伍[1].QYD.已用乾元丹)
	zts:置颜色(黄色):显示(self.x+45,self.y+33+24,tp.队伍[1].QYD.可用乾元丹)
	zts:置颜色(黄色):显示(self.x+45,self.y+33+24+24,tp.队伍[1].QYD.可换乾元丹)
	zts:置颜色(白色)
	self.资源组[3]:显示(self.x+9,self.y+141-7)
	self.资源组[4]:显示(self.x+9,self.y+151+11)
	if self.资源组[4]:事件判断() then
		if self.助战编号 then
			if self.主角.QYD.可用乾元丹>0 then
				发送数据(2010,{序列=self.选中,助战编号=self.助战编号})
				self:打开()
				return
			else
				tp.常规提示:打开("#Y/乾元丹数量不足！")
			end
		else
			if self.主角.QYD.可用乾元丹>0 then
				发送数据(32,{序列=self.选中})
				self:打开()
				return
			else
				tp.常规提示:打开("#Y/乾元丹数量不足！")
			end
		end
		-- if tp.队伍[1].QYD.可用乾元丹>0 then
		--     发送数据(32,{序列=self.选中})
		-- 	self:打开()
		-- else
		-- 	tp.常规提示:打开("#Y/乾元丹数量不足！")
		-- end
	elseif self.资源组[3]:事件判断() then
		self:打开()
	end

end



function 经脉加点:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 经脉加点:初始移动(x,y)
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

function 经脉加点:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 经脉加点