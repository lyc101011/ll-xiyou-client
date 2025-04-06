local 比武排行类 = class()
local floor = math.floor
local ceil = math.ceil
local tp,zts,zts1
local insert = table.insert
local jbs={0XFFff0000,0XFFff3300,0XFFff6600,0XFFff9900,0XFFffcc00,0XFFE7F7B2,0XFFDEFCA7,0XFFBEF674,0XFF98F449,0XFF6BF535,0XFF88F9DF,0XFF81F9EE,0XFF81F9EE,0XFF81F9EE,0XFF81F9EE}
local bt={"排 名","昵 称","ID","积 分"}

function 比武排行类:初始化(根) --比武，整页。把比武排行类.lua文件复制到功能界面里
	self.ID = 166
	self.x = 56
	self.y = 36
	self.xx = 0
	self.yy = 0
	self.注释 = "比武排行榜单"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.描边字体
	zts1 = tp.字体表.普通字体
end

function 比武排行类:打开(数据)
	if self.可视 then
        self.可视 = false
        self.资源组=nil
        self.按钮组=nil
        self.我的排名=nil
        self.精锐组=nil
		self.神威组=nil
		self.天科组=nil
		self.天元组=nil
        self.界面分组=nil
        self.加入=nil
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
		self.可视 = true
		self.界面分组=1
		self.我的排名=数据.我的排名
		self.加入=0
		self.精锐组=数据.精锐组
		self.神威组=数据.神威组
		self.天科组=数据.天科组
		self.天元组=数据.天元组
		self:加载资源()
	end
end

function 比武排行类:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组={
		[1] = 自适应.创建(0,1,418,557,3,9),--按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"回收设置"),
		[2] = 自适应.创建(4,1,401,462,3,9),
		-- [3] = 资源:载入('wzife.wdf',"网易WDF动画",0x6E2FCD7A),
		-- [4] = 资源:载入('wzife.wdf',"网易WDF动画",0xFA106426),
		-- [5] = 资源:载入('wzife.wdf',"网易WDF动画",0x3804AB71),
--wzife.wdf: 3D5F03B3(D3A2782E)排行榜 6E62E765.was排名 012CAF64.was名次 67EFB10F.was积分 37659AA8.was金色条纹 8269DBB8.was玩家 A87A88DA.was9.6折 A99DDAB3.was问号 CAC72DA7.was幸运大抽奖 D3C886C2小贴士
	}
	self.按钮组={
		[1] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"精 锐 组"), --按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[2] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"神 威 组"), --按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"天 科 组"), --按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"天 元 组"), --按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"上 一 页"),
		[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"回 首 页"),
		[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"下 一 页"),
	}
	for n=1,7 do
		self.按钮组[n]:绑定窗口_(self.ID)
	end
end

function 比武排行类:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+8,self.y+57)
	zts:置颜色(黄色)
	for n=1,4 do
		zts:显示(self.x+(n-1)*110+25,self.y+61,bt[n])
		self.按钮组[n]:更新(x,y,self.界面分组~=n)
		self.按钮组[n]:显示(self.x+(n-1)*110+8,self.y+28)
	end
	for n=5,7 do
		self.按钮组[n]:更新(x,y)
		self.按钮组[n]:显示(self.x+(n-5)*120+50,self.y+527)
	end
	for n=1,15 do
		if n+self.加入 <= 100 then
			zts:置颜色(jbs[n]):显示(self.x+37,self.y+(n-1)*29+90,n+self.加入)
		end
	end
	if self.按钮组[1]:事件判断() then
		self.加入=0
		self.界面分组 = 1
	elseif self.按钮组[2]:事件判断() then
		self.加入=0
		self.界面分组 = 2
	elseif self.按钮组[3]:事件判断() then
		self.加入=0
		self.界面分组 = 3
	elseif self.按钮组[4]:事件判断() then
		self.加入=0
		self.界面分组 = 4
	elseif self.按钮组[5]:事件判断() then
		if self.加入 >= 15 then
			self.加入=self.加入-15
		end
	elseif self.按钮组[6]:事件判断() then
		self.加入=0
	elseif self.按钮组[7]:事件判断() then
		if self.加入 < 85 then
			self.加入=self.加入+15
		end
	end
	if self.界面分组 == 1 then
		self:精锐组界面(dt,x,y)
	elseif self.界面分组 == 2 then
		self:神威组界面(dt,x,y)
	elseif self.界面分组 == 3 then
		self:天科组界面(dt,x,y)
	elseif self.界面分组 == 4 then
		self:天元组界面(dt,x,y)
	end
	for i=1,14 do
		引擎.画线(self.x + 408,self.y + 112 +(i-1)*29,self.x + 8,self.y + 112 +(i-1)*29,ARGB(50,100,100,100)) --长度、高低 2和4一样 3是x起始位置
    end
    zts1:置颜色(白色)
    local qdpm=""
    zts1:显示(self.x+55,self.y+3,"我的排名：" ..self.我的排名.分组 .." 名次：" ..self.我的排名.排名 .." 积分：" ..self.我的排名.积分)
end

function 比武排行类:精锐组界面(dt,x,y)
	zts1:置颜色(黑色)
	for n=1+self.加入,15+self.加入 do
		if self.精锐组[n] and self.精锐组[n].名称 then
			local cd=string.len(self.精锐组[n].名称)
			local xx=self:自动居中(cd)
			zts1:显示(self.x+xx,self.y+(n-(1+self.加入))*29+91,self.精锐组[n].名称)
			zts1:显示(self.x+234,self.y+(n-(1+self.加入))*29+91,self.精锐组[n].id)
			zts1:显示(self.x+353,self.y+(n-(1+self.加入))*29+91,self.精锐组[n].积分)
		end
	end
end
function 比武排行类:神威组界面(dt,x,y)
	zts1:置颜色(黑色)
	for n=1+self.加入,15+self.加入 do
		if self.神威组[n] and self.神威组[n].名称 then
			local cd=string.len(self.神威组[n].名称)
			local xx=self:自动居中(cd)
			zts1:显示(self.x+xx,self.y+(n-(1+self.加入))*29+91,self.神威组[n].名称)
			zts1:显示(self.x+234,self.y+(n-(1+self.加入))*29+91,self.神威组[n].id)
			zts1:显示(self.x+353,self.y+(n-(1+self.加入))*29+91,self.神威组[n].积分)
		end
	end
end
function 比武排行类:天科组界面(dt,x,y)
	zts1:置颜色(黑色)
	for n=1+self.加入,15+self.加入 do
		if self.天科组[n] and self.天科组[n].名称 then
			local cd=string.len(self.天科组[n].名称)
			local xx=self:自动居中(cd)
			zts1:显示(self.x+xx,self.y+(n-(1+self.加入))*29+91,self.天科组[n].名称)
			zts1:显示(self.x+234,self.y+(n-(1+self.加入))*29+91,self.天科组[n].id)
			zts1:显示(self.x+353,self.y+(n-(1+self.加入))*29+91,self.天科组[n].积分)
		end
	end
end
function 比武排行类:天元组界面(dt,x,y)
	zts1:置颜色(黑色)
	for n=1+self.加入,15+self.加入 do
		if self.天元组[n] and self.天元组[n].名称 then
			local cd=string.len(self.天元组[n].名称)
			local xx=self:自动居中(cd)
			zts1:显示(self.x+xx,self.y+(n-(1+self.加入))*29+91,self.天元组[n].名称)
			zts1:显示(self.x+234,self.y+(n-(1+self.加入))*29+91,self.天元组[n].id)
			zts1:显示(self.x+353,self.y+(n-(1+self.加入))*29+91,self.天元组[n].积分)
		end
	end
end

function 比武排行类:自动居中(cd)
	local xx=118
	if cd <= 4 then
    	xx=141
    elseif cd <= 6 then
   	   xx=133
   	elseif cd <= 8 then
   	   xx=126
    end
    return xx
end

function 比武排行类:检查点(x,y)
	if self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 比武排行类:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
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

function 比武排行类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 比武排行类