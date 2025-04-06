--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-12-02 16:34:18
--======================================================================--
local 场景类_加入帮派 = class()

local bwh = require("gge包围盒")
local bw1 = bwh(0,0,260,25)
-- local bw2 = bwh(0,0,200,25)
local box = 引擎.画矩形
local tp,zts
local mousea = 引擎.鼠标弹起

local insert = table.insert
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local ceil = math.ceil

local bpxx = {"帮派等级","成员数量","掌握区域","同盟","敌对","帮费","宗旨"}
local bzgk = {"帮派规模","成员数量","帮费标准","开设奖励","繁荣等级","修炼项目","帮战情况","帮派活动"}
local function 取繁荣等级(zz)
	if zz<8000 then
	    return "无"
    elseif zz>=8000 then
	    return "初显"
    elseif zz>=25000 then
	    return "名门"
    elseif zz>=35000 then
	    return "鼎盛"
    elseif zz>=45000 then
	    return "泰山北斗"
    elseif zz>=50000 then
	    return "天下盟主"
	end
end

function 场景类_加入帮派:初始化(根)
	self.ID = 9
	self.x = 187
	self.y = 70
	self.xx = 0
	self.yy = 0
	self.注释 = "帮派界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
    self.本类开关=false
	local wz = require("gge文字类")
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,554,412,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),		--关闭按钮
		[3] = 自适应.创建(4,1,1,1,3,nil),
		[4] = 自适应.创建(41,4,15,40,2,3,nil),--竖条
		[5] = 资源:载入('pic/bp/jr.png',"图片"), --加入

		[20] = 按钮(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"申请加入"),
		[21] = 按钮(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"联系成员"),
		[22] = 按钮(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"查看评价"),
		[23] = 按钮(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"取消申请"),
		[42] =  根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,131,2),


	}
	for i=21,23 do
		self.资源组[i]:绑定窗口_(9)
	end
	self.资源组[42]:绑定窗口_(9)
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体

	self.选中= 0

	self.加入= 0
end

function 场景类_加入帮派:打开(数据) -- 服饰染色 召唤兽染色
	if self.可视 then

		self.可视 = false
		self.加入= 0
	else
		insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
		self.选中= 0
	    self.可视 = true
	    self.数据=数据
	end
end

function 场景类_加入帮派:显示(dt,x,y)
	self.焦点 = false
    local 行数 = 0
    local 列数 = 1
    local 行数1 = 0
    local 列数1 = 1

	self.资源组[2]:更新(x,y)
	self.资源组[20]:更新(x,y,self.选中> 0 )
	self.资源组[21]:更新(x,y,self.选中> 0 )
	self.资源组[22]:更新(x,y,self.选中> 0 )
	self.资源组[23]:更新(x,y,self.选中> 0 )
	--self.控件类:更新(dt,x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"加入帮派")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:置宽高(298,157)
    self.资源组[3]:显示(self.x+13,self.y+29) --白框
    self.资源组[4]:置宽高(14,131) --比 11  坐标少 26的高度 多2的宽度
    self.资源组[4]:显示(self.x+297,self.y+29+26) --竖条

    self.资源组[3]:置宽高(222,157)
    self.资源组[3]:显示(self.x+318,self.y+29) --白框
    self.资源组[4]:置宽高(14,131) --比 11  坐标少 26的高度 多2的宽度
    self.资源组[4]:显示(self.x+526,self.y+29+26) --竖条

    self.资源组[3]:置宽高(527,185)
    self.资源组[3]:显示(self.x+13,self.y+195) --白框
    self.资源组[4]:置宽高(14,185-26) --比 11  少 26的高度 多2的宽度
    self.资源组[4]:显示(self.x+526,self.y+195+26) --竖条
    zts:置颜色(白色)
	zts:显示(self.x + 37,self.y + 34,"帮派")
	zts:显示(self.x + 142,self.y + 34,"编号↓")
	zts:显示(self.x + 195,self.y + 34,"帮派实力")
	zts:显示(self.x + 334,self.y + 34,"名称")
	zts:显示(self.x + 452,self.y + 34,"职务")
	zts:显示(self.x + 349-92,self.y + 202,"帮派资料")

	for i=1,4 do
		self.资源组[19+i]:更新(x,y,self.选中> 0 )
		self.资源组[19+i]:显示(self.x+160+i*78,self.y+384)
	end

	for n=1,5 do
		if self.数据[n+self.加入] ~= nil then
      		local 序列=n
			local jx = self.x + 14
			local jy = self.y+65+n*26-28
			local jy1 = self.y +208+ (n+1) * 22 - 5
			bw1:置坐标(jx,jy-5)
			if self.选中~=n+self.加入 then
				if bw1:检查点(x,y) and self.鼠标 then
					box(jx,jy-3,jx+268+14,jy+20,-3551379)
					if mousea(0) and not tp.消息栏焦点 then
						self.选中 = n+self.加入
					end
					self.焦点 = true
				end
			else
				local ys = -10790181
				if bw1:检查点(x,y) then
					ys = -9670988
					self.焦点 = true
				end
				box(jx,jy-3,jx+268+14,jy+20,ys)
			end
		  	zts:置颜色(0xFF222222)
	      	zts:显示(self.x+24,self.y+65+n*26-26,self.数据[n+self.加入].名称)
	      	zts:显示(self.x+142,self.y+65+n*26-26,self.数据[n+self.加入].编号)
	      	zts:显示(self.x+233,self.y+65+n*26-26,self.数据[n+self.加入].实力)
     	end
	end

	local 行数 = 0
    local 列数 = 0
    zts:置颜色(白色)
    for i=1,8 do
    	行数 = 行数 + 1
    	self.资源组[5]:显示(self.x+18+256*(行数-1),self.y+225+25*列数) --竖条
    	zts:显示(self.x+20+256*(行数-1),self.y+227+25*列数,bzgk[i])
    	if 行数==2 then
    	    行数=0
    	    列数=列数+1
    	end
    end
    self.资源组[5]:显示(self.x+18,self.y+330)
    zts:显示(self.x+20,self.y+332,"帮派宗旨")
    zts:置颜色(0xFF222222)
    if self.数据[self.选中] then
        zts:显示(self.x+85,self.y+227,self.数据[self.选中].帮派规模)
        zts:显示(self.x+85,self.y+227+25*1,"暂无")
        zts:显示(self.x+85,self.y+227+25*2,取繁荣等级(self.数据[self.选中].繁荣度))
        zts:显示(self.x+85,self.y+227+25*3,"帮派试炼赛")
        zts:显示(self.x+341,self.y+227,self.数据[self.选中].成员数量.当前)
        zts:显示(self.x+341,self.y+227+25*1,"青龙、跑商")
        zts:显示(self.x+341,self.y+227+25*2,"修炼全开")
        zts:显示(self.x+341,self.y+227+25*3,"帮派竞赛、帮派迷宫")
        zts:显示(self.x+85,self.y+332,self.数据[self.选中].宗旨)

        zts:置颜色(0xff009933)
        zts:显示(self.x+334,self.y+65,self.数据[self.选中].现任帮主.名称)
        zts:显示(self.x+452,self.y+65,"帮主")
        -- zts:显示(self.x+334,self.y+65+26,self.数据[self.选中].现任帮主.名称)
        if self.数据[self.选中].副帮主 then
            zts:显示(self.x+334,self.y+65+26,self.数据[self.选中].副帮主)
            zts:显示(self.x+452,self.y+65+26,"副帮主")
        end

    end

    if #self.数据 > 5 then
		self.资源组[42]:置高度(min(floor(141/(#self.数据-5)),104))
		self.加入 = min(ceil((#self.数据-5)*self.资源组[42]:取百分比()),#self.数据-5)
		self.资源组[42]:显示(self.x+291+8,self.y+56,x,y,self.鼠标)
	end

	if self.资源组[2]:事件判断() then
		self:打开()
	elseif self.资源组[20]:事件判断() then
		发送数据(38,{编号=self.数据[self.选中].编号})
	elseif self.资源组[23]:事件判断() then --取消申请
		发送数据(38.1,{编号=self.数据[self.选中].编号})
	elseif 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
		self.资源组[42]:置起始点(self.资源组[42]:取百分比转换(self.加入-1,5,#self.数据))
	elseif  引擎.取鼠标滚轮() ==-1 and self.加入 < #self.数据 - 5 then--鼠标下滚动
		self.资源组[42]:置起始点(self.资源组[42]:取百分比转换(self.加入+1,5,#self.数据))
	end


end

function 场景类_加入帮派:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_加入帮派:初始移动(x,y)
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

function 场景类_加入帮派:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_加入帮派