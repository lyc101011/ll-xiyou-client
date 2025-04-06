--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-05-18 16:53:59
--======================================================================--
local 场景类_坐骑炫彩 = class()
local zqj = 引擎.坐骑库
local ceil = math.ceil
local tp,zts,zts1
local insert = table.insert

function 场景类_坐骑炫彩:初始化(根)
	self.ID = 77
	self.x = 183
	self.y = 125
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽炫彩"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	tp = 根
	self.资源组 = {
		[1] = 自适应.创建(0,1,470,305,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFAB3913C),0,0,4,true,true),
		[4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x92ABEFD3),0,0,4,true,true),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x5F339316),0,0,4,true,true),
		[6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x0AA7176D),0,0,4,true,true),
		[7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8773AFEA),0,0,4,true,true),
		[8] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"确定"),
		[9] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[10] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[11] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[12] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[13] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[14] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[15] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[16] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[17] = tp._滑块.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8D4BBC26),1,199,16,1),
		[18] = 自适应.创建(34,1,173,182,3,9),
		[19] = 自适应.创建(3,1,40,19,1,3),
		[20] = 自适应.创建(3,1,215,20,1,3),
	}
	for i=2,17 do
	  	self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[8]:置偏移(-1,0)
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	self.炫彩 = {}
	self.炫彩染色 = {}
	self.炫彩染色[1]={}
	self.炫彩染色[1][1]={R=255,G=0,B=0}
	self.炫彩染色[1][2]={R=255,G=0,B=0}
	self.炫彩染色[1][3]={R=255,G=0,B=0}
	self.炫彩染色[2]={}
	self.炫彩染色[2][1]={R=255,G=0,B=0}
	self.炫彩染色[2][2]={R=255,G=0,B=0}
	self.炫彩染色[2][3]={R=255,G=0,B=0}
	self.炫彩染色[3]={}
	self.炫彩染色[3][1]={R=255,G=0,B=0}
	self.炫彩染色[3][2]={R=255,G=0,B=0}
	self.炫彩染色[3][3]={R=255,G=0,B=0}
	self.位置=1
end

function 场景类_坐骑炫彩:打开(bb认证,bb模型,bb饰品) -- 服饰染色 召唤兽染色
	if self.可视 then
		self.彩果 = nil
		self.方向 = nil
		self.染色方案 = nil
		self.人物组 = nil
		self.染色组 = nil
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.分类 = 分类 or "坐骑炫彩"
		-- if tp.队伍[1].模型 == "巫蛮儿" or tp.队伍[1].模型 == "杀破狼" or tp.队伍[1].模型 == "羽灵神" or tp.队伍[1].模型 == "偃无师" or tp.队伍[1].模型 == "鬼潇潇"  or tp.队伍[1].模型 == "桃夭夭" then
		-- 	tp.提示:写入("#Y/该角色暂未开放染色")
		-- 	return
		-- end
		self.认证 = bb认证
		self.方向 = 4
		self.彩果 = 0
		self.饰品 = bb饰品
		self.人物组 = {}
		self.饰品组 = {}
		self.染色组 = {0,0,0}
		--if 炫彩 == nil then
			self.炫彩[1]={R=255,G=0,B=0}
			self.炫彩[2]={R=255,G=0,B=0}
			self.炫彩[3]={R=255,G=0,B=0}
		--else
		   --self.炫彩 = 炫彩
		--end

		self.染色方案 = 0
		self.资源组[9]:置起始点(self.资源组[9]:取百分比转换(self.炫彩[1].R,0,512))
		self.资源组[10]:置起始点(self.资源组[10]:取百分比转换(self.炫彩[1].G,0,512))
		self.资源组[11]:置起始点(self.资源组[11]:取百分比转换(self.炫彩[1].B,0,512))
		self.资源组[12]:置起始点(self.资源组[12]:取百分比转换(self.炫彩[2].R,0,512))
		self.资源组[13]:置起始点(self.资源组[13]:取百分比转换(self.炫彩[2].G,0,512))
		self.资源组[14]:置起始点(self.资源组[14]:取百分比转换(self.炫彩[2].B,0,512))
		self.资源组[15]:置起始点(self.资源组[15]:取百分比转换(self.炫彩[3].R,0,512))
		self.资源组[16]:置起始点(self.资源组[16]:取百分比转换(self.炫彩[3].G,0,512))
		self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.炫彩[3].B,0,512))
		local 资源 = tp.资源
		local n = zqj(tp.队伍[1].模型,bb模型,bb饰品)
		self.人物组[1] = 资源:载入(n.坐骑资源,"网易WDF动画",n.坐骑站立)
		self.人物组[1]:置方向(0)
		if self.饰品 ~= nil then
			self.饰品组[1] = tp.资源:载入(n.坐骑饰品资源,"网易WDF动画",n.坐骑饰品站立)
			self.饰品组[1]:置方向(0)
		end
		if 染色信息[bb模型]~= nil then
			self.染色方案 = 染色信息[bb模型].id
		else
		    self.染色方案 = 65
		end
		self.染色组   = {0,0,0}
		self.初始染色组 = self.染色组
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.炫彩染色 = {}
		self.炫彩染色[1]={}
		self.炫彩染色[1][1]={R=255,G=0,B=0}
		self.炫彩染色[1][2]={R=255,G=0,B=0}
		self.炫彩染色[1][3]={R=255,G=0,B=0}
		self.炫彩染色[2]={}
		self.炫彩染色[2][1]={R=255,G=0,B=0}
		self.炫彩染色[2][2]={R=255,G=0,B=0}
		self.炫彩染色[2][3]={R=255,G=0,B=0}
		self.炫彩染色[3]={}
		self.炫彩染色[3][1]={R=255,G=0,B=0}
		self.炫彩染色[3][2]={R=255,G=0,B=0}
		self.炫彩染色[3][3]={R=255,G=0,B=0}
	    self:置染色()
	end
end

function 场景类_坐骑炫彩:显示(dt,x,y)
	self.焦点 = false
	self.人物组[1]:更新(dt)
	if self.饰品 ~= nil then
	self.饰品组[1]:更新(dt)
	end
	self.资源组[2]:更新(x,y)
	self.资源组[5]:更新(x,y,not (self.位置==1),2)
	self.资源组[6]:更新(x,y,not (self.位置==2),2)
	self.资源组[7]:更新(x,y,not (self.位置==3),2)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[8]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() then
	--	self.染色组 = self.初始染色组
		self.炫彩[1]={R=255,G=0,B=0}
		self.炫彩[2]={R=255,G=0,B=0}
		self.炫彩[3]={R=255,G=0,B=0}
	    self.炫彩染色[1]={}
		self.炫彩染色[1][1]={R=255,G=0,B=0}
		self.炫彩染色[1][2]={R=255,G=0,B=0}
		self.炫彩染色[1][3]={R=255,G=0,B=0}
		self.炫彩染色[2]={}
		self.炫彩染色[2][1]={R=255,G=0,B=0}
		self.炫彩染色[2][2]={R=255,G=0,B=0}
		self.炫彩染色[2][3]={R=255,G=0,B=0}
		self.炫彩染色[3]={}
		self.炫彩染色[3][1]={R=255,G=0,B=0}
		self.炫彩染色[3][2]={R=255,G=0,B=0}
		self.炫彩染色[3][3]={R=255,G=0,B=0}

	elseif self.资源组[4]:事件判断() then
		self.方向 = self.方向 - 1
		if self.方向 < 0 then
			self.方向 = 7
		end
		self:置方向()
	elseif self.资源组[5]:事件判断() then
		self.位置=1
	elseif self.资源组[6]:事件判断() then
		self.位置=2
	elseif self.资源组[7]:事件判断() then
		self.位置=3
	elseif self.资源组[8]:事件判断() then
		发送数据(67,{认证码=self.认证,染色id=self.染色方案,炫彩=self.炫彩染色})
	end
	self.资源组[1]:显示(self.x,self.y-20)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3-20,self.分类)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+6-20)
	self.资源组[5]:显示(self.x+18,self.y+220,true,nil,nil,self.位置==1,2)
	self.资源组[6]:显示(self.x+46,self.y+220,true,nil,nil,self.位置==2,2)
	self.资源组[7]:显示(self.x+74,self.y+220,true,nil,nil,self.位置==3,2)
	self.资源组[3]:显示(self.x+103,self.y+220,nil,nil,nil,nil,nil,2,0,1)
	self.资源组[4]:显示(self.x+130,self.y+220,nil,nil,nil,nil,nil,2,0,1)
	self.资源组[8]:显示(self.x+119,self.y+251)
	self.资源组[20]:显示(self.x+200,self.y+18-10)
	self.资源组[20]:显示(self.x+200,self.y+43-10)
	self.资源组[20]:显示(self.x+200,self.y+68-10)
	self.资源组[20]:显示(self.x+200,self.y+118-10)
	self.资源组[20]:显示(self.x+200,self.y+143-10)
	self.资源组[20]:显示(self.x+200,self.y+168-10)
	self.资源组[20]:显示(self.x+200,self.y+218-10)
	self.资源组[20]:显示(self.x+200,self.y+243-10)
	self.资源组[20]:显示(self.x+200,self.y+268-10)
	self.资源组[9]:显示(self.x + 210,self.y + 20-10,x,y,self.鼠标)
	self.资源组[10]:显示(self.x + 210,self.y + 45-10,x,y,self.鼠标)
	self.资源组[11]:显示(self.x + 210,self.y + 70-10,x,y,self.鼠标)
	self.资源组[12]:显示(self.x + 210,self.y + 120-10,x,y,self.鼠标)
	self.资源组[13]:显示(self.x + 210,self.y + 145-10,x,y,self.鼠标)
	self.资源组[14]:显示(self.x + 210,self.y + 170-10,x,y,self.鼠标)
	self.资源组[15]:显示(self.x + 210,self.y + 220-10,x,y,self.鼠标)
	self.资源组[16]:显示(self.x + 210,self.y + 245-10,x,y,self.鼠标)
	self.资源组[17]:显示(self.x + 210,self.y + 270-10,x,y,self.鼠标)
	self.资源组[18]:显示(self.x+16,self.y+25)
	self.资源组[19]:显示(self.x+74,self.y+252)
	zts:置颜色(4294967295)
	zts:显示(self.x+14,self.y+255,"所需仙玉")
	zts:置颜色(-16777216)
	zts:显示(self.x+81,self.y+256,"500")
	zts:置颜色(0xFFFF0000)
	zts:显示(self.x+420,self.y+18-10,"红  色")
	zts:显示(self.x+420,self.y+43-10,"高亮红")
	zts:显示(self.x+420,self.y+68-10,"对比红")
	zts:置颜色(0xFF00FF00)
	zts:显示(self.x+420,self.y+118-10,"绿  色")
	zts:显示(self.x+420,self.y+143-10,"高亮绿")
	zts:显示(self.x+420,self.y+168-10,"对比绿")
	zts:置颜色(0xFF0000FF)
	zts:显示(self.x+420,self.y+218-10,"蓝  色")
	zts:显示(self.x+420,self.y+243-10,"高亮蓝")
	zts:显示(self.x+420,self.y+268-10,"对比蓝")

	zts1:置字间距(2.5)
	zts1:显示(self.x+54,self.y+3,self.分类)
	zts1:置字间距(0)
	tp.影子:显示(self.x+79,self.y+164)
	self.人物组[1]:显示(self.x+99,self.y+164)
	if self.饰品 ~= nil then
		self.饰品组[1]:显示(self.x+99,self.y+164)
	end
	if self.资源组[9].接触 then--音量"
		self.炫彩染色[self.位置][1].R = ceil(512*self.资源组[9]:取百分比())
		self:置染色()
		self.焦点 = true
	elseif self.资源组[10].接触 then--音量"
		self.炫彩染色[self.位置][1].G = ceil(512*self.资源组[10]:取百分比())
		self:置染色()
		self.焦点 = true
	elseif self.资源组[11].接触 then--音量"
		self.炫彩染色[self.位置][1].B = ceil(512*self.资源组[11]:取百分比())
		self:置染色()
		self.焦点 = true
	elseif self.资源组[12].接触 then--音量"
		self.炫彩染色[self.位置][2].R = ceil(512*self.资源组[12]:取百分比())
		self:置染色()
		self.焦点 = true
	elseif self.资源组[13].接触 then--音量"
		self.炫彩染色[self.位置][2].G = ceil(512*self.资源组[13]:取百分比())
		self:置染色()
		self.焦点 = true
	elseif self.资源组[14].接触 then--音量"
		self.炫彩染色[self.位置][2].B = ceil(512*self.资源组[14]:取百分比())
		self:置染色()
		self.焦点 = true
	elseif self.资源组[15].接触 then--音量"
		self.炫彩染色[self.位置][3].R = ceil(512*self.资源组[15]:取百分比())
		self.焦点 = true
	elseif self.资源组[16].接触 then--音量"
		self.炫彩染色[self.位置][3].G = ceil(512*self.资源组[16]:取百分比())
		self:置染色()
		self.焦点 = true
	elseif self.资源组[17].接触 then--音量"
		self.炫彩染色[self.位置][3].B = ceil(512*self.资源组[17]:取百分比())
		self:置染色()
		self.焦点 = true
	end
	if self.人物组[2] ~= nil then
		self.人物组[2]:更新(dt)
		self.人物组[2]:显示(self.x+99,self.y+164)
	end
end

function 场景类_坐骑炫彩:置方向()
	self.人物组[1]:置方向(self.方向)
	if self.人物组[2] ~= nil then
		self.人物组[2]:置方向(self.方向)
	end
end

function 场景类_坐骑炫彩:置染色()
	self.人物组[1]:炫彩染色(self.染色方案,self.炫彩染色)
	self.人物组[1]:置方向()
end

function 场景类_坐骑炫彩:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_坐骑炫彩:初始移动(x,y)
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

function 场景类_坐骑炫彩:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_坐骑炫彩