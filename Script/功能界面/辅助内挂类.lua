-- @Author: baidwwy
-- @Date:   2024-08-15 09:12:54
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-02 04:50:41
--======================================================================--
local 辅助内挂类 = class()

local bwh = require("gge包围盒")
local bw = bwh(0,0,25,276)
local mousea = 引擎.鼠标弹起
local tp,zts,zts1,zts2
local insert = table.insert
local zbwz = {"场\n景\n挂\n机","活\n动\n挂\n机","抓\n鬼\n系\n列"}

function 辅助内挂类:初始化(根)
	self.ID = 213
	self.x = 21
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "辅助内挂类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = false
	tp = 根
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体_
	zts2 = tp.字体表.普通字体__
	-- zts2 = tp.字体表.道具字体
end

function 辅助内挂类:关闭()
	发送数据(553)
	self.资源组 = nil
	self.按钮组 = nil
	self.打勾组_明雷 = nil
	self.展开 = nil
	self.开始挂机 = nil
	self.可视 = false
end

function 辅助内挂类:打开(数据)
	if self.可视 then
		self:关闭()
		return
	else
		insert(tp.窗口_,self)
		-------------------
		self.开通 = 数据.vip
		self.明雷表 = 数据.mlb
		self.活动表 = 数据.hdb
		self.抓鬼表 = 数据.zgb
		self.玩家表 = 数据.data
		-------------------
		self:加载资源()
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 辅助内挂类:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1]=自适应.创建(76,1,471,312,3,9),
		[2]=资源:载入('pic/标题背景.png',"图片"),
		[3]=资源:载入('wzife.wd1',"网易WDF动画",0x3B80B18F), --展开
		[4]=资源:载入('wzife.wd1',"网易WDF动画",0x6A72085A), --收起
		-- wzife.wd1 3B80B18F.was 6A72085A.was 7C36B47E.was 上
		-- wzife.wd1 AF3A68F8.was 9C908DAB.was 下
	}
	self.左边按钮组={
		[1] = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[2] = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
		[3] = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true),
	}
	self.按钮组 = {
		[1] = 按钮.创建(资源:载入('wzife.wd1',"网易WDF动画",0x3B80B18F),0,0,3,true,true), --展开
		[2] = 按钮.创建(资源:载入('wzife.wd1',"网易WDF动画",0x6A72085A),0,0,3,true,true), --收起
		[3] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"开通内挂"),
		[4] = 按钮.创建(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"开始挂机"),
		[5] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
	} -- wzife.wd1 3B80B18F.was 6A72085A.was 7C36B47E.was 上   -- wzife.wd1 AF3A68F8.was 9C908DAB.was 下
	for an=1,#self.按钮组 do
		self.按钮组[an]:绑定窗口_(self.ID)
	end
	self.打勾组_明雷={}
	self.打勾组_活动={}
	self.打勾组_抓鬼={}
	for n=1,#self.明雷表 do
		self.打勾组_明雷[n] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true)
		self.打勾组_明雷[n]:置打勾框(self.玩家表.明雷[n])
		self.打勾组_明雷[n]:绑定窗口_(self.ID)
	end
	for n=1,#self.活动表 do
		self.打勾组_活动[n] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true)
		self.打勾组_活动[n]:置打勾框(self.玩家表.活动[n])
		self.打勾组_活动[n]:绑定窗口_(self.ID)
	end
	for n=1,#self.抓鬼表 do
		self.打勾组_抓鬼[n] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true)
		self.打勾组_抓鬼[n]:置打勾框(self.玩家表.抓鬼[n])
		self.打勾组_抓鬼[n]:绑定窗口_(self.ID)
	end
	self.界面=1
	self.展开 = true
	self.开始挂机 = false
	bw = bwh(0,0,25,276)
end

function 辅助内挂类:显示(dt,x,y)
	-----------------------
	-- 素材位置调整()
	-- ax = AFCHX
	-- ay = AFCHY
	-- self.资源组[1] = tp._自适应.创建(76,1,ax+100,ay+100,3,9)
	-----------------------
	self.焦点 = false
	for n=1,#self.按钮组 do
	  self.按钮组[n]:更新(x,y)
	end
	for n=1,#self.左边按钮组 do
		self.左边按钮组[n]:更新(x,y,self.界面~=n)
	end
	if self.展开 then
		bw:置坐标(self.x-24,self.y+36)
		self.资源组[1]:显示(self.x,self.y)
		self.资源组[2]:显示(self.x-86+self.资源组[1].宽度/2,self.y)
		self.按钮组[2]:显示(self.x+450,self.y+296)
		self.按钮组[3]:显示(self.x+74,self.y+268)
		self.按钮组[4]:显示(self.x+313,self.y+268)
		self.按钮组[5]:显示(self.x+449,self.y+4)


		self.左边按钮组[1]:显示(self.x-21,self.y+34)
		self.左边按钮组[2]:显示(self.x-21,self.y+74+34)
		self.左边按钮组[3]:显示(self.x-21,self.y+148+34)
		zts1:显示(self.x-16,self.y+11+34,zbwz[1])
		zts1:显示(self.x-16,self.y+86+34,zbwz[2])
		zts1:显示(self.x-16,self.y+159+34,zbwz[3])
		zts:显示(self.x+11,self.y+208,"注意:勾选后自动保存配置，点击开始挂机后。在哪个界面点开始挂机，只\n会进行该界面的挂机功能。\n\n关闭界面即停止挂机，【收起】界面不会停止。")
		zts:显示(self.x+9,self.y+8,"挂机功能：")
		if self.开通 then
			zts:置颜色(绿色)
			zts:显示(self.x+74,self.y+8,"已开通")
		else
			zts:置颜色(红色)
		    zts:显示(self.x+74,self.y+8,"未开通")
		end
	else
		self.资源组[2]:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	    self.按钮组[1]:显示(self.x+288,self.y+6)
	end
	zts1:置颜色(黄色)
	if self.按钮组[4].按钮文字 == "停止挂机" then
		zts1:显示(self.x+201,self.y+4,"挂 机 中 ...")
	else
		zts1:显示(self.x+201,self.y+4,"辅 助 内 挂")
	end
	if self.按钮组[1]:事件判断() then
		self.展开 = true
		self:重置背景()
	elseif not self.展开 and mousea(0) and self.资源组[2]:是否选中(x,y) then
		self.展开 = true
		self:重置背景()
	elseif self.按钮组[2]:事件判断() then
		self.展开 = false
		self:重置背景()
	elseif self.按钮组[5]:事件判断() then
		self:关闭()
		return false
	elseif self.按钮组[3]:事件判断() then
		tp.常规提示:打开("#Y/使用月卡后即自动开通")

	elseif self.按钮组[4]:事件判断() then
		self.开始挂机 = not self.开始挂机
		self:变更挂机文字()
		发送数据(552,{界面=self.界面,变更=self.开始挂机})
	elseif self.左边按钮组[1]:事件判断() then
		self.界面=1
	elseif self.左边按钮组[2]:事件判断() then
		self.界面=2
	elseif self.左边按钮组[3]:事件判断() then
		self.界面=3
	end
	if self.展开 then
		if self.界面==1 then
			self:显示_明雷(dt,x,y)
		elseif self.界面==2 then
			self:显示_活动(dt,x,y)
		elseif self.界面==3 then
			self:显示_抓鬼(dt,x,y)
		end
	end
	zts:置颜色(白色)
	zts1:置颜色(白色)
end

function 辅助内挂类:显示_明雷(dt,x,y)
	zts:置颜色(白色)
	for n=1,#self.打勾组_明雷 do
		self.打勾组_明雷[n]:更新(x,y)
	end
	local o = 0
	for h=1,6 do
		for l=1,4 do
			o = o + 1
			if self.打勾组_明雷[o] then
			   self.打勾组_明雷[o]:显示(self.x + (l-1) * 120 + 12,self.y + h * 28 + 4,true,nil,nil,self.玩家表.明雷[o],2)
			   zts:显示(self.x + (l-1) * 120 + 42,self.y + h * 28 + 8,self.明雷表[o].名称)
			   if self.打勾组_明雷[o]:事件判断() then
			   	  if self.玩家表.明雷[o] then
			   	  	 self.玩家表.明雷[o] = false
			   	  else
			   	     self.玩家表.明雷[o] = true
			   	  end
			   	  self.打勾组_明雷[o]:置打勾框(self.玩家表.明雷[o])
			   	  发送数据(551,self.玩家表)
			   end
			end
		end
	end
end

function 辅助内挂类:显示_活动(dt,x,y)
	zts:置颜色(白色)
	for n=1,#self.打勾组_活动 do
		self.打勾组_活动[n]:更新(x,y)
	end
	local o = 0
	for h=1,6 do
		for l=1,4 do
			o = o + 1
			if self.打勾组_活动[o] then
			    self.打勾组_活动[o]:显示(self.x + (l-1) * 120 + 12,self.y + h * 28 + 4,true,nil,nil,self.玩家表.活动[o],2)
			    zts:显示(self.x + (l-1) * 120 + 42,self.y + h * 28 + 8,self.活动表[o].名称)
			    if self.打勾组_活动[o]:事件判断() then
			   	    if self.玩家表.活动[o] then
			   	  	    self.玩家表.活动[o] = false
			   	    else
			   	        self.玩家表.活动[o] = true
			   	        for an=1,#self.玩家表.活动 do
			   	        	if an ~= o then
			   	        		self.玩家表.活动[an] = false
			   	        		self.打勾组_活动[an]:置打勾框(false)
			   	        	end
			   	        end
			   	    end
			   	    self.打勾组_活动[o]:置打勾框(self.玩家表.活动[o])
			   	    发送数据(551,self.玩家表)
			    end
			end
		end
	end
end

function 辅助内挂类:显示_抓鬼(dt,x,y)
	zts:置颜色(白色)
	for n=1,#self.打勾组_抓鬼 do
		self.打勾组_抓鬼[n]:更新(x,y)
	end
	local o = 0
	for h=1,6 do
		for l=1,4 do
			o = o + 1
			if self.打勾组_抓鬼[o] then
			   self.打勾组_抓鬼[o]:显示(self.x + (l-1) * 120 + 12,self.y + h * 28 + 4,true,nil,nil,self.玩家表.抓鬼[o],2)
			   zts:显示(self.x + (l-1) * 120 + 42,self.y + h * 28 + 8,self.抓鬼表[o].名称)
			   if self.打勾组_抓鬼[o]:事件判断() then
			   	  if self.玩家表.抓鬼[o] then
			   	  	 self.玩家表.抓鬼[o] = false
			   	  else
			   	    self.玩家表.抓鬼[o] = true
			   	    for an=1,#self.玩家表.抓鬼 do
		   	        	if an ~= o then
		   	        		self.玩家表.抓鬼[an] = false
		   	        		self.打勾组_抓鬼[an]:置打勾框(false)
		   	        	end
		   	        end
			   	  end
			   	  self.打勾组_抓鬼[o]:置打勾框(self.玩家表.抓鬼[o])
			   	  发送数据(551,self.玩家表)
			   end
			end
		end
	end
end

function 辅助内挂类:变更挂机文字(sj)
	if sj~=nil then --一种是服务端传，一种是内部
		self.开始挂机 = sj
	end
	if not self.开始挂机 then
		self.按钮组[4].按钮文字 = "开始挂机"
	else
		self.按钮组[4].按钮文字 = "停止挂机"
	end
end

function 辅助内挂类:变更勾选(数据)
	self.玩家表 = 数据
	for n=1,#self.明雷表 do
		self.打勾组_明雷[n]:置打勾框(self.玩家表.明雷[n])
	end
	for n=1,#self.活动表 do
		self.打勾组_活动[n]:置打勾框(self.玩家表.活动[n])
	end
	for n=1,#self.抓鬼表 do
		self.打勾组_抓鬼[n]:置打勾框(self.玩家表.抓鬼[n])
	end
end

function 辅助内挂类:重置背景()
	if self.展开 then
		self.资源组[1] = tp._自适应.创建(76,1,471,312,3,9)
		bw = bwh(0,0,25,276)
	else
	    self.资源组[1] = tp._自适应.创建(76,1,471,1,3,9)
	    bw = bwh(0,0,0,0)
	end
end

function 辅助内挂类:界面收起()
	self.展开 = false
	self:重置背景()
end

function 辅助内挂类:检查点(x,y)
	if self.可视 and (self.资源组[1]:是否选中(x,y) or self.资源组[2]:是否选中(x,y) or bw:检查点(x,y)) then
		return true
	else
		return false
	end
end

function 辅助内挂类:初始移动(x,y)
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

function 辅助内挂类:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy

	end
end

return 辅助内挂类