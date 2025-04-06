-- @Author: baidwwy
-- @Date:   2024-12-14 19:52:27
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-26 12:56:34
-- @Author: baidwwy
-- @Date:   2023-10-25 19:31:19
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-10-25 21:56:07

local 藏宝阁最终支付 = class()
local tp
local insert = table.insert
function 藏宝阁最终支付:初始化(根)
	self.ID = 103.1
	self.x = 158
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "最终支付"
	self.窗口 = "最终支付"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
end
function 藏宝阁最终支付:打开(dh,jg,bh,jm)
	-- 打开(self.跳转动画,self.跳转价格,self.显示数据[self.跳转bh].编号,self.跳转界面)--12/26
	if self.可视 then
		self.可视=false
		self.资源组=nil
		self.状态=nil
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
		    [1] = pwddd("2260"),
			[2] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"快捷支付"),
			[3] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"余额支付"),
			[4] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"扫码支付"),
			[5] = 按钮.创建(pwddd("2234"),0,0,4,true,true,"网页支付"),
			[6] = 按钮.创建(pwddd("2264"),0,0,1,true,true),
			[7] = pwddd("2261"),
			[8] = 按钮.创建(pwddd("2256"),0,0,1,true,true),


}
		local wz = require("gge文字类")
		self.文字 = wz.创建(nil,14,false,false,false)
        self.dh=dh
        self.jg=jg
        self.bh=bh
        self.jm=jm
        self.daicoco=0
        self.状态=0
        self.介绍文本 = tp._丰富文本(600,20)
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end


function 藏宝阁最终支付:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	       self.资源组[2]:更新(x,y)
	       self.资源组[3]:更新(x,y,self.状态~=2)
	       self.资源组[4]:更新(x,y,self.状态~=1)
	       self.资源组[5]:更新(x,y)
	       self.资源组[6]:更新(x,y)
	       self.资源组[2]:显示(self.x+126,self.y+141,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
	       self.资源组[3]:显示(self.x+225,self.y+141,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
	       self.资源组[4]:显示(self.x+324,self.y+141,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
	       self.资源组[5]:显示(self.x+423,self.y+141,nil,nil,nil,nil,nil,nil,nil,nil,"跳色")
           self.资源组[6]:显示(self.x+592,self.y+5)
           if self.资源组[4]:事件判断() then
           	--self.状态=1
           	elseif self.资源组[3]:事件判断() then
           		self.状态=2
           	elseif self.资源组[6]:事件判断() then
           		self:打开()
           		return
           end
         if self.dh~=nil then
         	self.dh:显示(self.x+25,self.y+60)
	        self.文字:置颜色(红色)
	        self.文字:显示(self.x+500,self.y+73,self.jg)
	        self.文字:置颜色(黑色)
         end
       if self.状态==1 then
       	     if self.daicoco<40 then
       	     	self.daicoco=self.daicoco+0.1
       	     end
	       if self.daicoco<40 then
	        	self.资源组[7]:显示(self.x+4,self.y+182)
	        	self.介绍文本:清空()
	        	self.介绍文本:添加文本("#H/使用#R/微信#H/支付:#R/"..self.jg.."#R/元 #H/(含微信官方额外收取的#R/0#H/元通道费用)")
	            self.介绍文本:显示(self.x+15,self.y+184)
	            self.文字:置颜色(黑色)
	            self.文字:显示(self.x+283,self.y+369,"剩余:"..math.floor(40-self.daicoco))

	        end
	        if self.daicoco>=38 and  self.daicoco<=39 then
					发送数据(60.9,{编号=self.bh,类型=self.jm})
					self.daicoco=40
					self:打开()
			 end
         elseif self.状态==2 then
            	self.资源组[8]:更新(x,y)
             	self.资源组[8]:显示(self.x+266,self.y+424)
         		self.介绍文本:清空()
	        	self.介绍文本:添加文本("#H/您的网易支付账户当前有#R/"..tp.金钱.."#H/元(若支付额度过低,请前往网易支付进行实名认证)")
	            self.介绍文本:显示(self.x+15,self.y+184)
	       	    self.文字:置颜色(黑色)
	            self.文字:显示(self.x+190,self.y+279,"使用余额中的")
	            self.文字:置颜色(红色)
	            self.文字:显示(self.x+277,self.y+279,self.jg)
	            self.文字:置颜色(黑色)
	            self.文字:显示(self.x+300+string.len(self.jg)*2,self.y+279,"     元进行支付")
           if self.资源组[8]:事件判断() then
           	  发送数据(60.9,{编号=self.bh,类型=self.jm})
           	  self:打开()
           	  return
           end
       end
end

function 藏宝阁最终支付:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 藏宝阁最终支付:初始移动(x,y)
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

function 藏宝阁最终支付:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end


return 藏宝阁最终支付