local tp,zts
local insert = table.insert
local 铃铛抽奖 = class()

function 铃铛抽奖:初始化(根)
	self.ID = 132
	self.x = 340
	self.y = 300
	self.xx = 0
	self.yy = 0
	self.注释 = "铃铛抽奖"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选择个数 = 1
	self.动画开关 = false
	self.奖励选择 = 0
	self.滚动1 = 0
	tp = 根
	self.窗口时间 = 0
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,307,174,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true," 炼 化"),
		[4] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true," 确 定"),
		[5] =按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x10000377),0,0,4,true,true,"1"),
		[6] =按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x10000377),0,0,4,true,true,"2"),
		[7] =按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x10000377),0,0,4,true,true,"3"),
		[8] =按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x10000377),0,0,4,true,true,"4"),
		[9] =按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x10000377),0,0,4,true,true,"5"),
		[10] = 资源:载入('pic/cj.png',"图片"),
	}
	for n=2,9 do
	   self.资源组[n]:绑定窗口_(self.ID)
	end
	for n=5,9 do
		self.资源组[n]:置偏移(-1,0)
	end
	self.物品组={}
	zts = tp.字体表.普通字体
end

function 铃铛抽奖:打开(内容)
	if self.可视 then
        self:清空数据()
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 铃铛抽奖:显示(dt,x,y)
	self.焦点= false
	self:更新滚动(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,"炼化镇妖拘魂铃")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)

	for i=1,5 do
		tp.物品格子背景_:显示(self.x+8+(i-1)*60,self.y+68)
	end
	for k,v in pairs(self.物品组) do
		local wx = self.x+9 + (k-1) * 60
		for i,n in pairs(v) do
			local wy = self.y+91-21-55*(i-1)+self.滚动1
			if wy >= self.y+ 45 and  wy <= self.y + 120 then
				n.小动画:显示(wx,wy)
				if n.小动画:是否选中(x,y) and i==5 then
					self.焦点=true
					if not self.动画开关 then
		            	tp.提示:商城提示(wx,wy,n.名称,n.说明,n.大动画,n.备注)
		            end
		            if 引擎.鼠标弹起(0) and not self.动画开关 then
		            	self.奖励选择 = k
		            end
		        end
			end
		end
	end
	self.资源组[10]:显示(self.x+5,self.y+25)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y,self.奖励选择~=0)
	self.资源组[3]:显示(self.x+224,self.y+34)
	self.资源组[4]:显示(self.x+224,self.y+136)
	zts:置颜色(白色)
    zts:显示(self.x+8,self.y+36,"选择个数")
    zts:显示(self.x+8,self.y+133+5,"请选择你最想要的一个奖励")
    for n=1,5 do
		if n==self.奖励选择 then
		    tp.物品格子确定_:显示(self.x+11 + (n-1) * 60, self.y+71)
		end
	end
	for i=5,9 do
		self.资源组[i]:更新(x,y,not self.动画开关)
		if self.资源组[i]:事件判断() and not self.动画开关 then --1-5按钮事件
			self.选择个数 = i-4
		end
	end
	for n=1,5 do --1-5按钮
		self.资源组[n+4]:显示(self.x+75+(n-1)*26,self.y+34,nil,nil,nil,self.选择个数==n,2)
	end
	if not self.动画开关 then
	    if self.资源组[2]:事件判断() then
			self:打开()
			return
		elseif self.资源组[3]:事件判断() then --开始转动
			发送数据(3760,{选择个数=self.选择个数})
		elseif self.资源组[4]:事件判断() then --选择奖励
			发送数据(3761,{奖励选择=self.奖励选择})
		end
	end
end

function 铃铛抽奖:更新滚动(x,y)
	if self.动画开关 then
		if self.滚动1>=200 then
			self.滚动1 = self.滚动1 +  math.random(2,8)*0.1
		elseif self.滚动1>=150 then
			self.滚动1 = self.滚动1 +  1
		else
			self.滚动1 = self.滚动1 +  2
		end
		if self.滚动1>=220 then
			self.滚动1=220
		    self.动画开关 =false
		end
	end
end

function 铃铛抽奖:清空数据()
	self.物品组={}
	self.滚动1 = 0
	self.奖励选择 = 0
end

function 铃铛抽奖:播放滚动动画(数据)
	self:清空数据()
	self.动画开关 = true
	--获取数据
	self.选择个数 =  数据.选择个数
	local 物品数据 = 数据.物品数据
	for k,v in pairs(物品数据) do
		if self.物品组[k]==nil then
		   self.物品组[k]={}
		end
		for i,n in pairs(v) do
			if self.物品组[k][i]== nil then
				self.物品组[k][i]={}
			end
			local 资源=引擎.取物品(n.名称)
			self.物品组[k][i].小动画=tp.资源:载入(资源[11],"网易WDF动画",资源[12])
			self.物品组[k][i].大动画=tp.资源:载入(资源[11],"网易WDF动画",资源[13])
			self.物品组[k][i].名称=n.名称
			self.物品组[k][i].备注=n.备注
			self.物品组[k][i].说明=资源[1]
		end
	end
end

function 铃铛抽奖:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 铃铛抽奖:初始移动(x,y)
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

function 铃铛抽奖:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 铃铛抽奖