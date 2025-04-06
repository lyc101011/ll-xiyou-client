--======================================================================--
local 良师册 = class()
local mousea = 引擎.鼠标弹起
local tp,zts,zts1,zts2
local insert = table.insert
local box = 引擎.画矩形
local bw = require("gge包围盒")(0,0,100,22)
local 取文字 = {
	[1] = {"强化打造装备","普通打造装备","召唤兽装备"},
}
function 良师册:初始化(根)
	self.ID = 9020
	self.x = 全局游戏宽度/2-200
	self.y = 全局游戏高度/2-180
	self.xx = 0
	self.yy = 0
	self.注释 = "良师册"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = 0
	self.加入 = 0
	self.进度1 = 0
	self.进度2 = 0
	self.进度3 = 0
	self.进度4 = 0
	self.进度5 = 0
	self.进度6 = 0
	self.领取1 = false
	self.领取2 = false
	self.领取3 = false
	self.领取4 = false
	self.领取5 = false
	self.领取6 = false
	self.下拉选中 = ""
	self.下拉状态 = true
	self.徒弟名称 = nil
	self.选中徒弟 = nil
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.汉仪字体4
	zts1 = tp.字体表.猫猫字体
	zts2 = tp.字体表.猫猫字体3
	self.进程=1
end

function 良师册:打开(内容)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		self.加入 = nil
		self.进度1 = nil
		self.进度2 = nil
		self.进度3 = nil
		self.进度4 = nil
		self.进度5 = nil
		self.进度6 = nil
		self.领取1 = false
		self.领取2 = false
		self.领取3 = false
		self.领取4 = false
		self.领取5 = false
		self.领取6 = false
		self.显示信息 = false
		self.徒弟名称 = nil
		self.选中徒弟 = nil
		self.徒弟信息 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 资源:载入('wzife.wdf',"网易WDF动画",982999291), --主页 982999291 --4276715923
			[2] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1952328867),0,0,3,true,true), --关闭
			[3] = 资源:载入('wzife.wdf',"网易WDF动画",2645076360), --小框 29575224 2651807835 2645076360
			[4] = 资源:载入('wzife.wdf',"网易WDF动画",1747581255), --标题
            [5] = 资源:载入('wzife.wdf',"网易WDF动画",4284352477), --横线
            [6] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",4085983023),0,0,3,true,true), --领取按钮 2865538989
            [7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",4085983023),0,0,3,true,true),
            [8] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",4085983023),0,0,3,true,true),
            [9] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",4085983023),0,0,3,true,true),
            [10] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",4085983023),0,0,3,true,true),
            [11] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",4085983023),0,0,3,true,true),
            [12] = 资源:载入('wzife.wdf',"网易WDF动画",2668418331), --奖励
            [13] = 资源:载入('xzjm.wdf',"网易WDF动画",0xBBAA8805), --进度
            [14] = 资源:载入('wzife.wd1',"网易WDF动画",1621583496), --完成
            [15] = 按钮.创建(资源:载入('xzjm.wdf',"网易WDF动画",4294912004),0,0,3,true,true), --下拉按钮
            [16] = 自适应.创建(6,1,100,70,3,9),--自适应.创建(9,1,100,67,3,9),
		}
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.进程=1
	    self.信息=1
		self.加入 = 0
		self.下拉选中 = ""
		self.下拉状态 = true
		self.显示信息 = false
		self.徒弟信息 = 内容.徒弟信息
		self.选中徒弟 = nil
		self. 字体 = tp.字体表.普通字体
	end
end

function 良师册:数据处理(内容)
	self.进度1 = 内容.进度.进度1
	self.进度2 = 内容.进度.进度2
	self.进度3 = 内容.进度.进度3
	self.进度4 = 内容.进度.进度4
	self.进度5 = 内容.进度.进度5
	self.进度6 = 内容.进度.进度6
	self.领取1 = 内容.是否领取.领取1
	self.领取2 = 内容.是否领取.领取2
	self.领取3 = 内容.是否领取.领取3
	self.领取4 = 内容.是否领取.领取4
	self.领取5 = 内容.是否领取.领取5
	self.领取6 = 内容.是否领取.领取6
	self.显示信息 = true
end

function 良师册:领取处理(内容)
	self.领取1 = 内容.领取1
	self.领取2 = 内容.领取2
	self.领取3 = 内容.领取3
	self.领取4 = 内容.领取4
	self.领取5 = 内容.领取5
	self.领取6 = 内容.领取6
	-- self.显示信息 = true
end

function 良师册:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[15]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[4]:显示(self.x+5,self.y-34)
	-- self.资源组[5]:显示(self.x+138,self.y+220)
	-- self.资源组[5]:显示(self.x+402,self.y+220)
	self.资源组[2]:显示(self.x+579,self.y-1)
	self.资源组[13]:显示(self.x+5+52+36,self.y-34+69+11)
	self.资源组[15]:显示(self.x+5+52+7+150-12,self.y-34+69+11)
	zts:置颜色(黑色):显示(self.x+276,self.y+3,"良师册")
	zts:置颜色(黑色):显示(self.x+276-233,self.y+3+44,"徒弟")
	zts1:置颜色(黑色):显示(self.x+62+42,self.y+3+49,self.下拉选中)
	self.资源组[3]:显示(self.x+53,self.y+56+21)
	self.资源组[3]:显示(self.x+239,self.y+56+21)
	self.资源组[3]:显示(self.x+430,self.y+56+21)
	self.资源组[3]:显示(self.x+53,self.y+238)
	self.资源组[3]:显示(self.x+239,self.y+238)
	self.资源组[3]:显示(self.x+430,self.y+238)
	self.资源组[13]:显示(self.x+63,self.y+119+21)
	self.资源组[13]:显示(self.x+250,self.y+119+21)
	self.资源组[13]:显示(self.x+440,self.y+119+21)
	self.资源组[13]:显示(self.x+63,self.y+305)
	self.资源组[13]:显示(self.x+250,self.y+305)
	self.资源组[13]:显示(self.x+440,self.y+305)
	self.资源组[12]:显示(self.x+61,self.y+178+21)
	self.资源组[12]:显示(self.x+247,self.y+178+21)
	self.资源组[12]:显示(self.x+436,self.y+178+21)
	self.资源组[12]:显示(self.x+61,self.y+364)
	self.资源组[12]:显示(self.x+247,self.y+364)
	self.资源组[12]:显示(self.x+436,self.y+364)
	zts1:置颜色(白色):显示(self.x+67,self.y+157+21,"奖")
	zts1:置颜色(白色):显示(self.x+253,self.y+157+21,"奖")
	zts1:置颜色(白色):显示(self.x+442,self.y+157+21,"奖")
	zts1:置颜色(白色):显示(self.x+67,self.y+343,"奖")
	zts1:置颜色(白色):显示(self.x+253,self.y+343,"奖")
	zts1:置颜色(白色):显示(self.x+442,self.y+343,"奖")
	zts1:置颜色(黑色):显示(self.x+69,self.y+71+21,"徒弟五项师门技能\n等级≥79级")
	zts1:置颜色(黑色):显示(self.x+254,self.y+71+21,"徒弟完成100次青龙\n任务")
	zts1:置颜色(黑色):显示(self.x+447,self.y+71+21,"徒弟完成100环任\n务链任务")
	zts1:置颜色(黑色):显示(self.x+69,self.y+257,"和徒弟一起参加三\n次彩虹争霸活动")
	zts1:置颜色(黑色):显示(self.x+256,self.y+257,"和徒弟一起参加三\n次帮派迷宫活动")
	zts1:置颜色(黑色):显示(self.x+445,self.y+257,"徒弟修炼总和达到\n50级")
	if self.显示信息 then
	    zts1:置颜色(黑色):显示(self.x+93,self.y+124+21,"进度: "..self.进度1.."/5")
		zts1:置颜色(黑色):显示(self.x+272,self.y+124+21,"进度: "..self.进度2.."/100")
		zts1:置颜色(黑色):显示(self.x+463,self.y+124+21,"进度: "..self.进度3.."/100")
	    zts1:置颜色(黑色):显示(self.x+93,self.y+310,"进度: "..self.进度4.."/3")
		zts1:置颜色(黑色):显示(self.x+272,self.y+310,"进度: "..self.进度5.."/3")
		zts1:置颜色(黑色):显示(self.x+467,self.y+310,"进度: "..self.进度6.."/50")
		if self.领取1 then
			self.资源组[14]:显示(self.x+93,self.y+136+21)
		else
			self.资源组[6]:更新(x,y)
			self.资源组[6]:显示(self.x+194,self.y+86+21)
			zts:置颜色(黑色):显示(self.x+198,self.y+97+21,"领\n\n取")
			zts2:置颜色(黑色):显示(self.x+92,self.y+155+21,"5000000经验")
			zts2:置颜色(黑色):显示(self.x+92,self.y+170+21,"2000000储备")
		end
		if self.领取2 then
			self.资源组[14]:显示(self.x+280,self.y+136+21) --完成
		else
			self.资源组[7]:更新(x,y)
			self.资源组[7]:显示(self.x+380,self.y+86+21)
			zts:置颜色(黑色):显示(self.x+384,self.y+97+21,"领\n\n取")
			zts2:置颜色(黑色):显示(self.x+279,self.y+155+21,"10000000经验")
			zts2:置颜色(黑色):显示(self.x+279,self.y+170+21,"3000000储备")
		end
		if self.领取3 then
			self.资源组[14]:显示(self.x+469,self.y+136+21) --完成
		else
			self.资源组[8]:更新(x,y)
			self.资源组[8]:显示(self.x+571,self.y+86+21)
			zts:置颜色(黑色):显示(self.x+575,self.y+97+21,"领\n\n取")
			zts2:置颜色(黑色):显示(self.x+467,self.y+155+21,"150造作指南书")
			zts2:置颜色(黑色):显示(self.x+467,self.y+170+21,"150百炼精铁")
		end
		if self.领取4 then
			self.资源组[14]:显示(self.x+93,self.y+320) --完成
		else
			self.资源组[9]:更新(x,y)
			self.资源组[9]:显示(self.x+194,self.y+268)
			zts:置颜色(黑色):显示(self.x+198,self.y+279,"领\n\n取")
			zts2:置颜色(黑色):显示(self.x+92,self.y+341,"炼兽真经*15")
			zts2:置颜色(黑色):显示(self.x+92,self.y+356,"元宵*15")
		end
		if self.领取5 then
			self.资源组[14]:显示(self.x+280,self.y+320) --完成
		else
			self.资源组[10]:更新(x,y)
			self.资源组[10]:显示(self.x+380,self.y+268)
			zts:置颜色(黑色):显示(self.x+384,self.y+279,"领\n\n取")
			zts2:置颜色(黑色):显示(self.x+279,self.y+341,"特技书*1")
			zts2:置颜色(黑色):显示(self.x+279,self.y+356,"修炼果*10")
		end
		if self.领取6 then
			self.资源组[14]:显示(self.x+469,self.y+320) --完成
		else
			self.资源组[11]:更新(x,y)
			self.资源组[11]:显示(self.x+571,self.y+268)
			zts:置颜色(黑色):显示(self.x+575,self.y+279,"领\n\n取")
			zts2:置颜色(黑色):显示(self.x+467,self.y+341,"150制造指南书*2")
			zts2:置颜色(黑色):显示(self.x+467,self.y+356,"150百炼精铁*2")
		end
	end
	if self.下拉状态 then
		self.资源组[16]:显示(self.x+55+42,self.y+85-13)
		for i=1,#self.徒弟信息 do
			bw:置坐标(self.x + 55+42,self.y + 85 + (i-1)*24-13)
			if bw:检查点(x,y) then
				box(self.x + 55+42,self.y + 85-13 + (i-1)*24,self.x + 155+42,self.y + 105-13 + (i-1)*24,-3551379)
				if mousea(0) and self.鼠标 and not tp.消息栏焦点 then
					self.下拉选中 = self.徒弟信息[i].名称
					self.下拉状态 = false
					self.显示信息 = false
					self.选中徒弟 = self.徒弟信息[i].id
					发送数据(155,{事件=self.徒弟信息[i].id})
				end
			end
			zts1:置颜色(白色):显示(self.x+62+42,self.y+87-13+(i-1)*24,self.徒弟信息[i].名称)
		end
	end
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[15]:是否选中(x,y) and mousea(0) then
		if self.下拉状态  then
		    self.下拉状态=false
		else
			self.下拉状态 = true
		end
	elseif self.资源组[6]:是否选中(x,y) and mousea(0) then
		发送数据(156,{事件=1,徒弟id=self.选中徒弟})
	elseif self.资源组[7]:是否选中(x,y) and mousea(0) then
		发送数据(156,{事件=2,徒弟id=self.选中徒弟})
	elseif self.资源组[8]:是否选中(x,y) and mousea(0) then
		发送数据(156,{事件=3,徒弟id=self.选中徒弟})
	elseif self.资源组[9]:是否选中(x,y) and mousea(0) then
		发送数据(156,{事件=4,徒弟id=self.选中徒弟})
	elseif self.资源组[10]:是否选中(x,y) and mousea(0) then
		发送数据(156,{事件=5,徒弟id=self.选中徒弟})
	elseif self.资源组[11]:是否选中(x,y) and mousea(0) then
		发送数据(156,{事件=6,徒弟id=self.选中徒弟})
	end

end

function 良师册:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 良师册:初始移动(x,y)
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

function 良师册:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 良师册