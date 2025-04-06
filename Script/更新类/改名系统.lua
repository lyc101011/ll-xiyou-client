-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-11 10:46:16
local tp,zts
local insert = table.insert
local 改名系统 = class()
local function 判断游戏名字(mz)
    if string.find(mz,"[%s%p%c%z%?\\!@#%$%%&%*%(%)%^,%.%+%-/<>;'\"%[%]{}]")~=nil then
        return 1
    elseif string.find(mz,"　")~=nil or string.find(mz, "GM") ~= nil or string.find(mz, "Gm") ~= nil or string.find(mz, "充值") ~= nil or string.find(mz, "gm") ~= nil or string.find(mz, "管理") ~= nil or string.find(mz, "老猫") ~= nil or string.find(mz, "国家") ~= nil or string.find(mz, "主席") ~= nil or string.find(mz, "近平") ~= nil then
        return 1
    end
end
function 改名系统:初始化(根)
	self.ID = 147
	self.x = 340
	self.y = 300
	self.xx = 0
	self.yy = 0
	self.注释 = "改名系统"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	zts = tp.字体表.普通字体
	self.窗口时间 = 0
end

function 改名系统:打开(内容)
	if self.可视 then
		self.shuru:置可视(false,false)
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
		if self.资源组==nil then
		    self:加载资源()
		end
		self.shuru:置可视(true,true)
		self.yz=内容.银子
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 改名系统:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,337,230,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"  确 定"),
		[4] = 按钮.创建(自适应.创建(12,4,50,22,1,3),0,0,4,true,true,"  检测"),
		[5] = 自适应.创建(78,1,309,75,3,9),
		[6] = 自适应.创建(7,1,168,22,1,3,nil,18),
	}
	for n=2,4 do
	   self.资源组[n]:绑定窗口_(self.ID)
	end
	self.资源组[4]:置偏移(-12,0)
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('srkj')
	总控件:置可视(true,true)
	self.shuru={}
	self.shuru=总控件:创建输入("shuru",0,0,150,16,tp,tp.字体表.华康14)
	self.shuru:置可视(true,true)
	-- self.shuru:置数字模式()
	self.shuru:置限制字数(14)
	self.shuru:置光标颜色(黑色)
	self.shuru:置文字颜色(黑色)
end

function 改名系统:显示(dt,x,y)
	self.焦点= false
	self.资源组[1]:显示(self.x,self.y)
	for i=2,4 do
		self.资源组[i]:更新(x,y)
	end
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,"角色改名")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x+120,self.y+165+30)
	self.资源组[4]:显示(self.x+265,self.y+126)
	self.资源组[5]:显示(self.x+15,self.y+35)
	zts:置颜色(黑色)
	zts:显示(self.x+23,self.y+45,"改变当前角色的名字，每0天可修改1次，每次")
	zts:显示(self.x+23,self.y+70,"修改需扣除银子=修改次数*200万两。")
	zts:置颜色(白色)
	zts:显示(self.x+23,self.y+130,"修改名字")
	-- zts:显示(self.x+23,self.y+130+35,"花费银子")
	zts:置颜色(红色)
	zts:显示(self.x+94,self.y+130+35,self.yz)
	self.资源组[6]:显示(self.x+86,self.y+126)
	if self.shuru._已碰撞 then
		self.焦点 = true
	end
	self.shuru:置坐标(self.x+94,self.y+130)
	if self.shuru._已碰撞 then
		self.焦点 = true
	end
	self.控件类:更新(dt,x,y)
	self.控件类:显示(dt,x,y)
	if self.资源组[2]:事件判断() then
        self:打开()
		return
	elseif self.资源组[3]:事件判断() then --确定
		if 判断游戏名字(self.shuru:取文本())==1 then
			引擎.场景.常规提示:打开("#Y/名字不能带有空格或者特殊符号或者敏感词语")
		else
			发送数据(71,{检测=false,名称=self.shuru:取文本()})
		end
	elseif self.资源组[4]:事件判断() then --检测
		if 判断游戏名字(self.shuru:取文本())==1 then
			引擎.场景.常规提示:打开("#Y/名字不能带有空格或者特殊符号或者敏感词语")
		else
			发送数据(71,{检测=true,名称=self.shuru:取文本()})
		end
    end
end


function 改名系统:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 改名系统:初始移动(x,y)
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

function 改名系统:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 改名系统