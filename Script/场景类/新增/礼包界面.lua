-- @Author: baidwwy
-- @Date:   2024-07-25 18:19:13
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-30 11:32:22
local 场景类_礼包界面 = class()
local tp,zts1
local floor = math.floor
local format = string.format
local insert = table.insert
local box = 引擎.画矩形
local 主分类={"累充奖励","VIP特权","七日登录","等级礼包","我要充值"}
function 场景类_礼包界面:初始化(根)
	self.ID = 501
	self.x = 126
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "礼包界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	self.加入=0
	self.下一页=0
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('召唤兽总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("卡号输入",0,0,180,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(30)
	self.输入框:置光标颜色(-16777216)
	self.输入框:置文字颜色(0XFF844F26)
end

function 场景类_礼包界面:打开(数据)
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		self.主按钮=nil
		self.状态=nil
		self.字体=nil
		self.充值分段=nil
		self.领取按钮=nil
		self.bw=nil
		self.VIP提示=nil
		self.物品数据=nil
		self.充值金额=nil
		self.七日背景=nil
		self.描边字体=nil
		self.七日按钮=nil
		self.七天签到=nil
		self.月卡=nil
		self.等级分段=nil
		self.加入=nil
		self.下一页=nil
		self.输入框:置可视(false,false)
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.状态=1
	    self.下一页=0
	    self.数据=数据.数据
	    self.充值金额=数据.充值.充值数额
	    self.月卡=数据.月卡
	    self:加载物品()
	    self.开关判断=false
	end
end
function 场景类_礼包界面:加载资源()
	local 资源=tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
		self.资源组 = {
			[1] = tp.资源:载入(wdf配置.."/pic/vip背景.png", "图片"),--资源:载入('登陆资源.wdf',"网易WDF动画",0xAABBCC8E),
			[2] = 资源:载入('新物品图标.wdf',"网易WDF动画",0xe010a015),--首冲道具横条背景
			[3] = 资源:载入('新物品图标.wdf',"网易WDF动画",0xe010a016),--七天登录背景
			[4] = 资源:载入('登陆资源.wdf',"网易WDF动画",0x37A705D6),
			[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,1,true,true),
			[6] = 资源:载入('登陆资源.wdf',"网易WDF动画",0xD06DDC41),
			[7] = nil,
			[8] = 资源:载入('登陆资源.wdf',"网易WDF动画",0xD06DDC41),
			[9] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"充值"),
		    [10] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"每日领取"),
            [11] = 资源:载入('item.wdf',"网易WDF动画",0x5453A471),
            [12] = 资源:载入('item.wdf',"网易WDF动画",1241924823),
            [13] = 资源:载入('item.wdf',"网易WDF动画",0x30BB01D5),
            [14] = 资源:载入('item.wdf',"网易WDF动画",0x50808141),
            [15] = 资源:载入('item.wdf',"网易WDF动画",0x19CEE771),
		    [16] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"开启移动加速"),
		    [17] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"关闭移动加速"),
		    [18] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"开启攻击加速"),
		    [19] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"关闭攻击加速"),
		    [20] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"开启施法加速"),
		    [21] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"关闭施法加速"),

		    [22] = 按钮.创建(自适应.创建(12,4,101,22,1,3),0,0,4,true,true,"开通战前施法"),
		    [23] = 按钮.创建(自适应.创建(12,4,101,22,1,3),0,0,4,true,true,"转换战前技能"),
		     }
      self.主按钮={
            [1] = 按钮.创建(资源:载入('vip.wdf',"网易WDF动画",0x10000004),0,0,1,true,true),--月卡福利
            [2] = 按钮.创建(资源:载入('vip.wdf',"网易WDF动画",0x10000003),0,0,1,true,true),
            [3] = 按钮.创建(资源:载入('vip.wdf',"网易WDF动画",0x10000005),0,0,1,true,true),
            [4] = 按钮.创建(资源:载入('vip.wdf',"网易WDF动画",0x10000001),0,0,1,true,true),
            [5] = 按钮.创建(资源:载入('vip.wdf',"网易WDF动画",0x10000003),0,0,1,true,true),
             }
        self.七日背景={}
        self.七日按钮={}
self.资源组[16]:置偏移(0,0)
self.资源组[17]:置偏移(0,0)
self.资源组[18]:置偏移(0,0)
self.资源组[19]:置偏移(0,0)
self.资源组[20]:置偏移(0,0)
self.资源组[21]:置偏移(0,0)
      self.shang=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1221744906),0,0,4,true,true," 上一页")
      self.xia=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1221744906),0,0,4,true,true," 下一页")
     for n=1,7 do
         self.七日背景[n]=tp.资源:载入(wdf配置.."/pic/商城小背景.png", "图片")
         self.七日按钮[n]=按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,1,true,true,"领取")
     end
  	local wz = require("gge文字类")
	self.字体=wz.创建("wdf/font/hkyt.ttf",14,false,false,true):置颜色(0XFF844F26)
	self.描边字体=wz.创建("wdf/font/hkyt.ttf",16,false,true,true)
	self.描边字体:置颜色(白色)
	self.描边字体:置描边颜色(0XFFA75A5F)
	self.充值分段={"6累充奖励","30累充奖励","68累充奖励","128累充奖励","198累充奖励","328累充奖励","648累充奖励","1280累充奖励"}
	self.等级分段={"60级礼包","80级礼包","100级礼包","120级礼包","140级礼包","150级礼包"}
    self.七天签到={"快\n速\n升\n级","实\n力\n倍\n增","宝\n石\n提\n升","修\n炼\n提\n升","丰\n厚\n货\n币","稀\n有\n萌\n宠","爱\n宠\n强\n化"}
	self.bw = require("gge包围盒")(0,0,45,45)
	self.七天选中=0
	self.加入=0
	self.下一页=0
end
function 场景类_礼包界面:刷新数据(数据)
	self.数据=数据.数据
	self.充值=数据.充值
	self.月卡=数据.月卡
	if self.状态==1 then
		self:加载物品()
	elseif self.状态==3 then
		self:加载七日物品()
	elseif self.状态==4 then
		self:加载等级物品()
	end
end
function 场景类_礼包界面:加载七日物品()
	self.物品数据={}
	for n=1,#self.数据 do
		self.物品数据[n]={}
	end
    for n=1,#self.数据 do
    	for a=1,#self.数据[n] do
    		if self.物品数据[n][a]==nil then
    			self.物品数据[n][a]={}
    		end
			self.物品数据[n][a] = tp._物品格子.创建(0,0,i,"给予_物品")
			self.物品数据[n][a]:置物品(self.数据[n][a])
    	end
    end
end
function 场景类_礼包界面:加载物品()
	local 自适应 = tp._自适应
	self.物品数据={}
	self.领取按钮={}
	for n=1,#self.数据 do
		self.物品数据[n]={}
		self.领取按钮[n]=tp._按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,1,true,true,"领取奖励")
	end
    for n=1,#self.数据 do
    	for a=1,#self.数据[n] do
    		if self.物品数据[n][a]==nil then
    			self.物品数据[n][a]={}
    		end
			self.物品数据[n][a] = tp._物品格子.创建(0,0,i,"给予_物品")
			self.物品数据[n][a]:置物品(self.数据[n][a])
    	end
    end
end
function 场景类_礼包界面:加载等级物品()
	local 自适应 = tp._自适应
	self.物品数据={}
	self.领取按钮={}
	for n=1,#self.数据 do
		self.物品数据[n]={}
		self.领取按钮[n]=tp._按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,1,true,true,"领取奖励")
	end
    for n=1,#self.数据 do
    	for a=1,#self.数据[n] do
    		if self.物品数据[n][a]==nil then
    			self.物品数据[n][a]={}
    		end
			self.物品数据[n][a] = tp._物品格子.创建(0,0,i,"给予_物品")
			self.物品数据[n][a]:置物品(self.数据[n][a])
    	end
    end
end
function 场景类_礼包界面:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
    for n=1,5 do
    	self.主按钮[n]:更新(x,y)
        self.主按钮[n]:显示(self.x+103-20,self.y-50+n*75+30)
        self.字体:显示(self.x+191-20,self.y-26+n*75+30,主分类[n])
        if self.主按钮[n]:事件判断() then
        	if n==5 then
        		发送数据(121.6)
        	else
        	发送数据(121.1,{类型=主分类[n]})
        	self.状态=n
        	self.下一页=0
        	end
        end
        if self.状态==n then
        self.主按钮[n]:置颜色(0XFFFECD56,1)
    	self.主按钮[n]:置颜色(0XFFE7D383,2)
        else
        self.主按钮[n]:置颜色(4294967295)
        end
    end
	if  引擎.取鼠标滚轮() ==1 or self.shang:事件判断() then
		if self.下一页 >0 then
			self.下一页 = self.下一页 - 1
		end
		self:累充奖励(dt,x,y)
	elseif  引擎.取鼠标滚轮() ==-1 or self.xia:事件判断() then
		if self.下一页 < 10 then
			self.下一页 = self.下一页 + 1
		end
		self:累充奖励(dt,x,y)
	end
	if self.资源组[16]:事件判断() then
		 发送数据(204)
	elseif self.资源组[17]:事件判断() then
		 发送数据(204.1)
	elseif self.资源组[18]:事件判断() then
		 发送数据(205)
	elseif self.资源组[19]:事件判断() then
		 发送数据(205.1)
	elseif self.资源组[20]:事件判断() then
		发送数据(206)
	elseif self.资源组[21]:事件判断() then
		发送数据(206.1)
	-- if self.资源组[16]:事件判断() then
	-- 	if self.开关判断== false then 发送数据(204) self.开关判断=true else 发送数据(204.1) self.开关判断=false end
	-- elseif self.资源组[18]:事件判断() then
	-- 	if self.开关判断== false then 发送数据(205) self.开关判断=true else 发送数据(205.1) self.开关判断=false end
	-- elseif self.资源组[20]:事件判断() then
	-- 	if self.开关判断== false then 发送数据(206) self.开关判断=true else 发送数据(206.1) self.开关判断=false end

	-- elseif self.资源组[22]:事件判断() then--战前施法
	-- 	tp.窗口.礼包界面:打开()
	-- 	tp.窗口.对话栏:文本("","","少侠您确定要开通战前施法功能吗？战前施法：战斗开始前额外施放一次法术。",{"开通战前施法",--[["我要转换战前施法技能",]]"暂时停用功能","恢复使用功能","查询我现在的战前施法技能","我点错了"})
	-- elseif self.资源组[23]:事件判断() then--战前施法转换
	-- 	发送数据(676,{shijian="我要转换战前施法技能"})
	end






    if self.状态==1 then
    	self:累充奖励(dt,x,y)
	elseif self.状态==2 then
		self:VIP特权(dt,x,y)
	elseif self.状态==3 then
		self:七日登录(dt,x,y)
	elseif self.状态==4 then
		self:等级礼包(dt,x,y)
	elseif self.状态==5 then
		self:我要充值(dt,x,y)
    end
   if self.状态==5 then
   	self.输入框:置可视(true,true)
   else
      self.输入框:置可视(false,false)
   end
end
function 场景类_礼包界面:累充奖励(dt,x,y)
	self.shang:更新(x,y)
	self.xia:更新(x,y)
	self.shang:显示(self.x+302+131,self.y+437)
	self.xia:显示(self.x+302+218,self.y+437)
    self.字体:显示(self.x+97,self.y+399+30,"累计充值:"..(self.充值金额 or 0))
if self.数据~=nil then
	for n=1,#self.数据 do
        if self.下一页==0 then
        if n<=4 then
	    self.资源组[2]:显示(self.x+303-20,self.y-76+n*100+32)
	    self.字体:显示(self.x+314-20,self.y-71+n*100+30,self.充值分段[n])
	    if self.领取按钮[n]~=nil then
	    self.领取按钮[n]:更新(x,y)
	    self.领取按钮[n]:显示(self.x+656-20,self.y-47+n*100+30)
	    if self.领取按钮[n]:事件判断() then
	    	发送数据(121.2,{编号=n})
	    end
	    end
	   for a=1,#self.数据[n] do
	    self.物品数据[n][a]:置坐标(self.x+253-20+a*60,self.y-51+n*100+30)
		self.物品数据[n][a]:显示(dt,x,y,self.鼠标)
 		if self.物品数据[n][a].焦点 then
			tp.提示:道具行囊(x,y,self.物品数据[n][a].物品)
		    end
        end
    end
    elseif self.下一页==1 then
        if n>=5 and n<=8 then
	    self.资源组[2]:显示(self.x+303-20,self.y-76-400+n*100+32)
	    self.字体:显示(self.x+314-20,self.y-71-400+n*100+30,self.充值分段[n])
	    if self.领取按钮[n]~=nil then
	    self.领取按钮[n]:更新(x,y)
	    self.领取按钮[n]:显示(self.x+656-20,self.y-47-400+n*100+30)
	    if self.领取按钮[n]:事件判断() then
	    	发送数据(121.2,{编号=n})
	    end
	    end

	   for a=1,#self.数据[n] do
	    self.物品数据[n][a]:置坐标(self.x+253-20+a*60,self.y-451+n*100+30)
		self.物品数据[n][a]:显示(dt,x,y,self.鼠标)
 		if self.物品数据[n][a].焦点 then
			tp.提示:道具行囊(x,y,self.物品数据[n][a].物品)
		end
    end
end

    elseif self.下一页==2 then
        if n>=9 and n<=12 then
	    self.资源组[2]:显示(self.x+303-20,self.y-76-800+n*100+32)
	    self.字体:显示(self.x+314-20,self.y-71-800+n*100+30,self.充值分段[n])
	    if self.领取按钮[n]~=nil then
	    self.领取按钮[n]:更新(x,y)
	    self.领取按钮[n]:显示(self.x+656-20,self.y-47-800+n*100+30)
	    if self.领取按钮[n]:事件判断() then
	    	发送数据(121.2,{编号=n})
	    end
	end
	   for a=1,#self.数据[n] do
	    self.物品数据[n][a]:置坐标(self.x+253-20+a*60,self.y-851+n*100+30)
		self.物品数据[n][a]:显示(dt,x,y,self.鼠标)
 		if self.物品数据[n][a].焦点 then
			tp.提示:道具行囊(x,y,self.物品数据[n][a].物品)
		end
                    end
                end
	        end
        end
    end
end
function 场景类_礼包界面:VIP特权(dt,x,y)
	    self.资源组[10]:更新(x,y)
	    self.资源组[16]:更新(x,y)
	    self.资源组[17]:更新(x,y)
	    self.资源组[18]:更新(x,y)
	    self.资源组[19]:更新(x,y)
	    self.资源组[20]:更新(x,y)
	    self.资源组[21]:更新(x,y)
	    self.资源组[22]:更新(x,y)
	    self.资源组[23]:更新(x,y)
     	self.资源组[10]:显示(self.x+320,self.y+170)
		self.资源组[11]:显示(self.x+432-90,self.y+100)
		self.资源组[12]:显示(self.x+518-90,self.y+100)
		self.资源组[13]:显示(self.x+604-90,self.y+100)
		self.资源组[14]:显示(self.x+690-90,self.y+100)
		self.资源组[15]:显示(self.x+760-90,self.y+100)

		self.资源组[16]:显示(self.x+320,self.y+200)
		self.资源组[17]:显示(self.x+500-70,self.y+200)


		self.资源组[18]:显示(self.x+320,self.y+200+30)
		self.资源组[19]:显示(self.x+500-70,self.y+200+30)

		self.资源组[20]:显示(self.x+320,self.y+200+60)
		self.资源组[21]:显示(self.x+500-70,self.y+200+60)

		-- self.资源组[22]:显示(self.x+500-50,self.y+200)
		-- self.资源组[23]:显示(self.x+500-50+120,self.y+200)

		--self.字体:显示(self.x+524-60,self.y+170,"←激活月卡可在此按钮每日领取奖励。")
		--zts1:置颜色(黑色):显示(self.x+450,self.y+235-130,"累 充 金 额:")
 		self.字体:置颜色(黑色):显示(self.x+555-100,self.y+200+85,"赞 助 表")
		self.字体:置颜色(黑色):显示(self.x+440-80,self.y+300+5,"1、充值比例100:100w仙玉")
		self.字体:置颜色(黑色):显示(self.x+440-80,self.y+300+30,"2、月卡：领取每日福利，加速，武神坛，称号，挂机")
		self.字体:置颜色(黑色):显示(self.x+440-80,self.y+300+55,"3、全服抽奖：2元/次")--月卡：100/张
 		self.字体:置颜色(黑色):显示(self.x+420-60,self.y+270+130,"所有充值都计算累充，累充达到即可领取对应福利")
		self.字体:置颜色(红色):显示(self.x+410-60,self.y+270+160,"注：充值请联系管理员，请勿相信他人，谨防上当受骗")
	if self.月卡.到期时间 ~= 0 then
		tp.字体表.通用字体14:置颜色(红色)
		tp.字体表.通用字体14:显示(self.x+524-60-30,self.y+172,"←月卡到期时间: ")
		tp.字体表.通用字体14:置颜色(红色)
		tp.字体表.通用字体14:显示(self.x+524-60+80-5,self.y+172,时间转换(self.月卡.到期时间))
	end
	    if self.资源组[11]:是否选中(x,y)  then
	         tp.提示:自定义(x-42,y+27,"#Y/每日领取获得#G[1000W银子]#")    --至尊月卡物品
	     elseif self.资源组[12]:是否选中(x,y)  then
	         tp.提示:自定义(x-42,y+27,"#Y/每日领取获得#G[特殊兽诀·碎片*5]#")
	     elseif self.资源组[13]:是否选中(x,y)  then
	         tp.提示:自定义(x-42,y+27,"#Y/每日领取获得#G[超级兽诀·碎片*5]#")
	     elseif self.资源组[14]:是否选中(x,y)  then
	         tp.提示:自定义(x-42,y+27,"#Y/你将获得#G[神兜兜*10]#")
	     elseif self.资源组[15]:是否选中(x,y)  then
	         tp.提示:自定义(x-42,y+27,"#Y/你将获得#G[修炼果*10]#")
	    end
	    if self.资源组[10]:事件判断() then
           发送数据(208)
    end
end

function 场景类_礼包界面:七日登录(dt,x,y)
    self.资源组[3]:显示(self.x+302-30,self.y+29+30)
    for n=1,7 do
    self.七日按钮[n]:显示(self.x+233+n*70-10,self.y+357+30)
    if self.七日按钮[n]:事件判断() then
    	发送数据(121.4,{编号=n})
    end
    if self.七日背景[n]:是否选中(x,y) then
          self.七日选中=n
    end
    if self.充值~=nil then
	    if n > (self.充值.七日领取天数 or 0)then
	    	self.七日按钮[n]:更新(x,y)
	    end
	    if n<= (self.充值.七日领取天数 or 0)then
		elseif self.七日选中==n then
	    else
	    end
    end
end
if self.数据~=nil then
	for n=1,#self.数据 do
	   for a=1,#self.数据[n] do
	    self.物品数据[n][a]:置坐标(self.x+244+n*70-23,self.y+184+a*60+30)
		self.物品数据[n][a]:显示(dt,x,y,self.鼠标)
		if a==2 then
	    end
 		if self.物品数据[n][a].焦点 then
			tp.提示:道具行囊(x,y,self.物品数据[n][a].物品)
		end
       end
	end
end
end
function 场景类_礼包界面:等级礼包(dt,x,y)
	self.shang:更新(x,y)
	self.xia:更新(x,y)
	self.shang:显示(self.x+302+131,self.y+437)
	self.xia:显示(self.x+302+218,self.y+437)
if self.数据~=nil then
	for n=1,#self.数据 do
    if self.下一页==0   then
	if n<=4 then
	    self.资源组[2]:显示(self.x+303-20,self.y-76+n*100+32)
	    self.字体:显示(self.x+314-20,self.y-71+n*100+30,self.等级分段[n])
	    if self.领取按钮[n]~=nil then
	    self.领取按钮[n]:更新(x,y)
	    self.领取按钮[n]:显示(self.x+656-20,self.y-47+n*100+30)
	    if self.领取按钮[n]:事件判断() then
	    	发送数据(121.5,{编号=n})
	    end
	    end
	   for a=1,#self.数据[n] do
	    self.物品数据[n][a]:置坐标(self.x+253-20+a*60,self.y-51+n*100+30)
		self.物品数据[n][a]:显示(dt,x,y,self.鼠标)
 		if self.物品数据[n][a].焦点 then
			tp.提示:道具行囊(x,y,self.物品数据[n][a].物品)
		end
       end
       end
    elseif self.下一页==1 then
if n>=5  and n<=8   then
	    self.资源组[2]:显示(self.x+303-20,self.y-76-400+n*100+32)
	    self.字体:显示(self.x+314-20,self.y-71-400+n*100+30,self.等级分段[n])
	    if self.领取按钮[n]~=nil then
	    self.领取按钮[n]:更新(x,y)
	    self.领取按钮[n]:显示(self.x+656-20,self.y-47-400+n*100+30)
	    if self.领取按钮[n]:事件判断() then
	    	发送数据(121.5,{编号=n})
	    end
	    end
	   for a=1,#self.数据[n] do
	    self.物品数据[n][a]:置坐标(self.x+253-20+a*60,self.y-451+n*100+30)
		self.物品数据[n][a]:显示(dt,x,y,self.鼠标)
 		if self.物品数据[n][a].焦点 then
			tp.提示:道具行囊(x,y,self.物品数据[n][a].物品)
		end
       end
end
    elseif self.下一页==2 then
if n>=9  and n<=12   then
	    self.资源组[2]:显示(self.x+303-20,self.y-76-800+n*100+32)
	    self.字体:显示(self.x+314-20,self.y-71-800+n*100+30,self.等级分段[n])
	    if self.领取按钮[n]~=nil then
	    self.领取按钮[n]:更新(x,y)
	    self.领取按钮[n]:显示(self.x+656-20,self.y-47-800+n*100+30)
	    if self.领取按钮[n]:事件判断() then
	    	发送数据(121.5,{编号=n})
	    end
	    end
	   for a=1,#self.数据[n] do
	    self.物品数据[n][a]:置坐标(self.x+253-20+a*60,self.y-851+n*100+30)
		self.物品数据[n][a]:显示(dt,x,y,self.鼠标)
 		if self.物品数据[n][a].焦点 then
			tp.提示:道具行囊(x,y,self.物品数据[n][a].物品)
		end
       end
     end
	end
  end
end
end
function 场景类_礼包界面:我要充值(dt,x,y)
self.字体:显示(self.x+320,self.y+334,"输入卡号:")
self.输入框:置坐标(self.x+386,self.y+336)
self.控件类:更新(dt,x,y)
self.控件类:显示(dt,x,y)
引擎.画线(self.x+386,self.y+353,self.x+624,self.y+353,0XFF844F26)
self.资源组[9]:显示(self.x+586,self.y+380)
self.资源组[9]:更新(x,y,self.输入框:取文本()~=nil and self.输入框:取文本()~="")
if self.资源组[9]:事件判断() then
发送数据(100,{卡号=self.输入框:取文本()})
self.输入框:置文本("")
end
end

function 场景类_礼包界面:检查点(x,y)
	if self.可视 and self.资源组 ~= nil and self.资源组[1]:是否选中(x,y) then
		return true
	else
		return false
	end
end

function 场景类_礼包界面:初始移动(x,y)
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

function 场景类_礼包界面:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_礼包界面

