-- @Author: baidwwy
-- @Date:   2024-08-03 04:09:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-21 01:44:47
local 奖池抽奖类 = class()
local floor = math.floor
local ceil = math.ceil
local tp,zts,zts1
local insert = table.insert
local ani = 引擎.取战斗模型
local mouseb = 引擎.鼠标弹起

function 奖池抽奖类:初始化(根) --比武，整页。把比武排行类.lua文件复制到功能界面里
	self.ID = 212
	self.x = 56
	self.y = 36
	self.xx = 0
	self.yy = 0
	self.注释 = "奖池抽奖"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.描边字体
	zts1 = tp.字体表.普通字体_
	zts2 = tp.字体表.道具字体
	self.动画={}
	local n = ani("超级土地公公")
	self.动画[1] = tp.资源:载入(n[10],"网易WDF动画",n[6])
	self.动画[1]:置方向(0)
	self.动画[1].显示xy = {x=self.x+379,y=self.y+340}
	self.移动坐标 = {x=self.x+377,y=self.y-150}
	self.移动间隔=0
	self.方向 = 0
	self.抽奖动画=tp.资源:载入('common/ski.wdf',"网易WDF动画",685510219)
	self.物品坐标={[1]={x=340,y=190},[2]={x=230,y=190},[3]={x=120,y=190},[4]={x=450,y=190},[5]={x=560,y=190},[6]={x=340,y=275},[7]={x=230,y=275},[8]={x=120,y=275},[9]={x=450,y=275},[10]={x=560,y=275}}
    for a=1,#self.物品坐标 do
        self.物品坐标[a].x = self.物品坐标[a].x + 35
        self.物品坐标[a].y = self.物品坐标[a].y + 7
    end
end

function 奖池抽奖类:打开(数据)
	if self.可视 then
        self.可视 = false
        self.资源组=nil
        self.按钮组=nil
        self.水晶商品=nil
        self.物品 = nil
		self.获得 = nil
		self.商品 = nil
		self.奖池列表 = nil
		self.获得列表 = nil
		self.界面 = nil
		self.进程 = nil
		self.幸运值 = nil
		self.满幸运 = nil
		self.水晶 = nil
		self.初始 = nil
		self.显示物品=nil
		self.抽奖机会=nil
		self.水晶列表=nil
		self.兑换选中=nil
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
		self.可视 = true
		self.水晶商品 = {}
		self.物品 = {}
		self.获得 = {}
		self.奖池列表 = 数据.奖池
		self.获得列表 = 数据.获得
		self.水晶列表 = 数据.水晶商品
		self.幸运值 = 数据.幸运值 or 0
		self.满幸运 = 数据.满幸运 or 0
		self.水晶 = 数据.水晶 or 0
		self.抽奖机会 = 数据.抽奖机会 or 0
		tp.屏蔽抽奖动画 = 数据.抽奖动画 or false
		self.界面 = "主页"
		self.进程 = 0
		self:加载资源()
		self.移动坐标 = {x=self.x+377,y=self.y-150}
		self.动画[1].显示xy = {x=self.x+379,y=self.y+340}
		self.兑换选中=0
	end
end

function 奖池抽奖类:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组={
		[1] = 资源:载入("wdf/十连抽/红框.png","图片"),
		[2] = 自适应.创建(76,1,652,406,3,9),
		[3] = 资源:载入('登陆资源.wdf',"网易WDF动画",0X0000B060),--自适应.创建(2,1,652,406,3,9), --进度底图
		[4] = 资源:载入('登陆资源.wdf',"网易WDF动画",0x3906F9F1), --进度
		[5] = 资源:载入('magic.wd1',"网易WDF动画",0x6BA62F2C), --动画1
		[6] = 资源:载入('magic.wd1',"网易WDF动画",0x6BA62F2C), --动画2
		[7] = 资源:载入("wdf/十连抽/奖池背景.png","图片"),
	}
	self.按钮组={
		[1] = 按钮.创建(tp.资源:载入('登陆资源.wdf',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  夺 宝 一 次"),
        [2] = 按钮.创建(tp.资源:载入('登陆资源.wdf',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  夺 宝 十 次"),
        [3] = 按钮.创建(tp.资源:载入('登陆资源.wdf',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  我 要 兑 换"),
		[4] = 按钮.创建(tp.资源:载入('登陆资源.wdf',"网易WDF动画",0xCFC32179),0,0,4,true,true,"  确 认 兑 换"),
		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"回主界面"),
		[6] = 按钮.创建(tp.资源:载入('登陆资源.wdf',"网易WDF动画",0x0E53F705),0,0,4,true,true),--满幸运水晶商店
		[7] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true), --屏蔽抽奖动画
	}
	for n=1,#self.按钮组 do
		self.按钮组[n]:绑定窗口_(self.ID)
	end
	local 格子 = tp._物品格子
	for i=1,32 do
		self.物品[i] = 格子.创建(0,0,i,"奖池抽奖_物品")
		if i <= 10 then
			self.获得[i] = 格子.创建(0,0,i,"奖池抽奖_获得")
		end
		if i <= 18 then
			self.水晶商品[i] = 格子.创建(0,0,i,"奖池抽奖_水晶商品")
		end
	end
	for i=1,32 do
		self.物品[i]:置物品(self.奖池列表[i])
		if self.奖池列表[i].奖池数量 <= 0 and self.物品[i].物品~=nil then
			self.物品[i].物品.小模型:灰度级()
		end
		if i <= 10 then
			self.获得[i]:置物品(self.获得列表[i])
        end
        if i <= 18 then
			self.水晶商品[i]:置物品(self.水晶列表[i])
        end
	end
	self.资源组[3]:置区域(0,0,610,18)
	self.资源组[4]:置区域(0,0,math.min(math.floor(self.幸运值 / self.满幸运 * 610),610),17)
	self.按钮组[7]:置打勾框(tp.屏蔽抽奖动画)
	self.初始=0
	self.显示物品={}
    for n=1,10 do
        self.显示物品[n]=true
    end
end

function 奖池抽奖类:显示(dt,x,y)
	-----------------------
	素材位置调整()
	ax = AFCHX
	ay = AFCHY
	-- self.资源组[3] = tp._自适应.创建(2,1,100+ax,100+ay,3,9)
	-----------------------
	self.焦点 = false
	self.资源组[2]:显示(self.x+58,self.y+55)
	self.资源组[3]:显示(self.x+90,self.y+442)
	self.资源组[4]:显示(self.x+87,self.y+443)
	self.资源组[1]:显示(self.x,self.y)
	self.按钮组[6]:更新(x,y)
	self.按钮组[6]:显示(self.x+690-318, self.y+432-20)
	zts:显示(self.x+330,self.y+442,"幸运值：" ..self.幸运值 .."/" ..self.满幸运)
	if self.按钮组[6]:是否选中(x,y) then
		tp.提示:自定义(x,y+15,"#Y/水晶商店\n可以消耗#P/梦幻水晶#W/兑换水晶商店物品。\n#G/幸运值满自动获得梦幻水晶")
	end
	if #self.获得列表 ~= 0 and self.进程==0 then
		self:显示_获取领取(dt,x,y)
	elseif self.界面=="主页" then
		self:显示_主页(dt,x,y)
	elseif self.界面=="抽奖" then
		self:显示_抽奖进程(dt,x,y)
	elseif self.界面=="水晶商店" then
		self:显示_水晶商店(dt,x,y)
	end
	if self.按钮组[6]:事件判断() and #self.获得列表 == 0 and self.进程==0 then
		self.界面="水晶商店"
	end
	zts:置颜色(白色)
	zts1:置颜色(白色)
end

function 奖池抽奖类:显示_主页(dt,x,y)
	self.按钮组[1]:更新(x,y)
	self.按钮组[2]:更新(x,y)
	self.按钮组[7]:更新(x,y)
	self.按钮组[1]:显示(self.x+206, self.y+403)
	self.按钮组[2]:显示(self.x+439, self.y+403)
	self.按钮组[7]:显示(self.x+590,self.y+406,true,nil,nil,tp.屏蔽抽奖动画,2)
	zts:显示(self.x+615,self.y+408,"跳过抽奖动画")
	if self.按钮组[1]:是否选中(x,y) then
		tp.提示:自定义(x+0,y+15,"#Y/剩余抽奖次数：#G/" ..self.抽奖机会)
	elseif self.按钮组[2]:是否选中(x,y) then
		tp.提示:自定义(x+0,y+15,"#Y/剩余抽奖次数：#G/" ..self.抽奖机会)
	end
	local xx = 0
	local yy = 0
	for i=1,32 do
		if self.物品[i].物品~=nil then
			tp.物品格子背景_:显示(self.x + xx * 79 + 83,self.y + yy * 81 + 103-26)
			zts1:显示(self.x + xx * 79 + 81,self.y + yy * 81 + 160-26,"剩余:" ..self.奖池列表[i].奖池数量)
			self.物品[i]:置坐标(self.x + xx * 79 + 85,self.y + yy * 81 + 102-26)
			self.物品[i]:显示(dt,x,y,self.鼠标)
			zts:显示(self.x + xx * 79 + 87,self.y + yy * 81 + 105-26,self.奖池列表[i].给予数量)
			if self.物品[i].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.物品[i].物品)
			end
		end
		xx = xx + 1
		if xx == 8 then
			xx = 0
			yy = yy + 1
		end
	end
	if self.按钮组[1]:事件判断() then
		发送数据(256)
	elseif self.按钮组[2]:事件判断() then
		发送数据(257)
	elseif self.按钮组[7]:事件判断() then
		tp.屏蔽抽奖动画 = not self.按钮组[7].打勾框
		self.按钮组[7]:置打勾框(tp.屏蔽抽奖动画)
		发送数据(90,{选项="抽奖动画",回调=tp.屏蔽抽奖动画})
	end
end

function 奖池抽奖类:显示_抽奖进程(dt,x,y)
  if tp.屏蔽抽奖动画 then
  	self.进程=0
  	self.抽奖动画.当前帧 = 0
  	for a=1,10 do
  		self.显示物品[a] = true
  	end
  end
  if self.进程==1 then
  	self.资源组[5]:更新(dt)
  	self.资源组[5]:显示(self.x+377,self.y+333)
  	if self.资源组[5].当前帧 >= self.资源组[5].结束帧 then
  		self.资源组[5].当前帧=0
  		self.进程 = 2
  	elseif self.资源组[5].当前帧 >= self.资源组[5].结束帧/2 then
  		self.动画[1]:更新(dt)
  	    self.动画[1]:显示(self.动画[1].显示xy.x,self.动画[1].显示xy.y)
  	end
  elseif self.进程==2 then
  	self.动画[1]:更新(dt)
  	self.动画[1]:显示(self.动画[1].显示xy.x,self.动画[1].显示xy.y)
  	self:移动事件()
  elseif self.进程==3 then
  	if self.初始 < self.次数 then
	  	self.抽奖动画:更新(dt+0.04)
	    self.抽奖动画:显示(self.x+self.物品坐标[self.初始+1].x+7,self.y+self.物品坐标[self.初始+1].y+40)
	    if self.抽奖动画.当前帧 >= self.抽奖动画.结束帧 then
           self.初始 = self.初始 + 1
           self.抽奖动画.当前帧 = 0
           self.显示物品[self.初始] = true
        end
        if self.初始 >= self.次数 then
          self.进程=0
        end
	end
  end
    self:显示_奖励物品(dt,x,y)
end

function 奖池抽奖类:显示_水晶商店(dt,x,y)
	self.按钮组[3]:更新(x,y)
	self.按钮组[5]:更新(x,y)
	self.按钮组[3]:显示(self.x+319,self.y+388)
	self.按钮组[5]:显示(self.x+620,self.y+406)
	zts2:显示(self.x+76,self.y+77,"水晶商店")
	zts1:显示(self.x+317,self.y+89,"请选择一件物品进行兑换")
	zts1:显示(self.x+609,self.y+89,"梦幻水晶：" ..self.水晶)
	local xx = 0
	local yy = 0
	for i=1,18 do
		if self.水晶商品[i].物品~=nil then
			tp.物品格子背景_:显示(self.x + xx * 102 + 83+24,self.y + yy * 81 + 103+27)
			self.水晶商品[i]:置坐标(self.x + xx * 102 + 85+24,self.y + yy * 81 + 102+27)
			self.水晶商品[i]:显示(dt,x,y,self.鼠标)
			zts:显示(self.x + xx * 102 + 87+24,self.y + yy * 81 + 105+27,self.水晶商品[i].物品.给予数量)
			if self.水晶商品[i].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.水晶商品[i].物品)
				if mouseb(0) and self.鼠标 then
					self.兑换选中 = i
				end
				tp.物品格子焦点_:显示(self.x + xx * 102 + 111,self.y + yy * 81 + 133)
			end
			if self.兑换选中~=0 and self.兑换选中==i and self.水晶商品[self.兑换选中]~=nil then
				tp.物品格子确定_:显示(self.x + xx * 102 + 111,self.y + yy * 81 + 133)
            end
		end
		xx = xx + 1
		if xx == 6 then
			xx = 0
			yy = yy + 1
		end
	end
	if self.按钮组[3]:事件判断() then
		if self.兑换选中~=0 and self.水晶商品[self.兑换选中]~=nil then
			发送数据(259,{道具编号=self.水晶商品[self.兑换选中].物品.道具编号})
		else
		   tp.常规提示:打开("#Y/请选择一件物品再进行兑换")
		end
	elseif self.按钮组[5]:事件判断() then
		self.兑换选中=0
		self.界面="主页"
    end
end

function 奖池抽奖类:移动事件()
	self.移动间隔 = self.移动间隔 + 1
	if 取两点距离(生成XY(self.动画[1].显示xy.x,self.动画[1].显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y))>20 then
		if self.移动间隔 >= 1 then
			self.移动间隔 = 0
		    self.方向 = self.方向 + 1
			if self.方向 >= 7 then
				self.方向 = 0
			end
		end
			self.动画[1]:置方向(self.方向)
			self.移动距离=取移动坐标(生成XY(self.动画[1].显示xy.x,self.动画[1].显示xy.y),生成XY(self.移动坐标.x,self.移动坐标.y),6)
			self.动画[1].显示xy.x,self.动画[1].显示xy.y=self.移动距离.x,self.移动距离.y
	else
		self.动画[1]:置方向(0)
		self.抽奖动画.当前帧=0
		self.初始=0
		for a=1,10 do
			self.显示物品[a] = false
		end
		self.进程=3
		self.动画[1].显示xy = {x=self.x+379,y=self.y+340}
	end
end

function 奖池抽奖类:显示_获取领取(dt,x,y)
	self.资源组[7]:显示(self.x+62,self.y+0)
	self.按钮组[3]:更新(x,y)
	self.按钮组[3]:显示(self.x+319,self.y+388)
	if self.按钮组[3]:事件判断() then
		发送数据(258)
		self.获得列表={}
		self.界面="主页"
	end
	self:显示_奖励物品(dt,x,y)
end

function 奖池抽奖类:显示_奖励物品(dt,x,y)
	for i=1,#self.获得 do
        if self.获得[i].物品 ~= nil and self.显示物品[i] then
            tp.物品格子背景_:显示(self.x+self.物品坐标[i].x-17,self.y+self.物品坐标[i].y-13)
            self.获得[i]:置坐标(self.x+self.物品坐标[i].x-15,self.y+self.物品坐标[i].y-13)
		    self.获得[i]:显示(dt,x,y,self.鼠标)
            local by=文字居中(self.获得[i].物品.名称)
            zts:显示(self.x+self.物品坐标[i].x-12+by,self.y+self.物品坐标[i].y+45,"" ..self.获得[i].物品.名称)
            zts:显示(self.x+self.物品坐标[i].x-14,self.y+self.物品坐标[i].y-11,self.获得[i].物品.给予数量)
	        if self.获得[i].焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.获得[i].物品)
			end
        end
    end
end

function 奖池抽奖类:开始抽奖(data)
	self.界面="抽奖"
	self.进程=1
	self.奖池列表 = data.奖池
	self.获得列表=data.获得
	self.抽奖机会=data.抽奖机会 or 0
	self.幸运值=data.幸运值 or 0
	self.水晶=data.水晶 or 0
	self.资源组[4]:置区域(0,0,math.min(math.floor(self.幸运值 / self.满幸运 * 610),610),17)
	for i=1,32 do
		self.物品[i]:置物品(self.奖池列表[i])
		if self.奖池列表[i].奖池数量 <= 0 and self.物品[i].物品~=nil then
			self.物品[i].物品.小模型:灰度级()
		end
		if i <= 10 then
			self.获得[i]:置物品(self.获得列表[i])
        end
	end
	self.次数 = #self.获得列表
	for n=1,10 do
        self.显示物品[n]=false
    end
end

function 奖池抽奖类:刷新水晶(sj)
	self.水晶 = sj
end

function 奖池抽奖类:检查点(x,y)
	if self.资源组[1]:是否选中(x,y) or self.资源组[2]:是否选中(x,y) then
		return true
	end
end

function 奖池抽奖类:初始移动(x,y)
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

function 奖池抽奖类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
	self.移动坐标 = {x=self.x+377,y=self.y-150}
	self.动画[1].显示xy = {x=self.x+379,y=self.y+340}
end

return 奖池抽奖类