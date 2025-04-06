-- @Author: baidwwy
-- @Date:   2024-10-20 02:54:35
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-31 04:19:12
local 排行榜类 = class()
local mousea = 引擎.鼠标弹起
local tos = 取金钱颜色
local insert = table.insert
local remove = table.remove
local floor = math.floor
local move = table.move
local min = math.min
local max = math.max
local ceil = math.ceil
local tx = 引擎.取头像
local ani = 引擎.取战斗模型
local x类 = {"杂货","内丹","装备","符石","宝宝","锦衣","称谓","坐骑","法宝"}
local zts,zts2
local bw = require("gge包围盒")(0,0,20,20)

function 排行榜类:初始化(根)
	self.ID = 47
	self.宽 = 644
    self.高 = 544
    self.x = 全局游戏宽度/2-self.宽/2+50
    self.y = 全局游戏高度/2-self.高/2
    self.临时窗宽=全局游戏宽度
    self.临时窗高=全局游戏高度
	self.xx = 0
	self.yy = 0
	self.注释 = "排行榜"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
	[1]=资源:载入("登陆资源.wdf","网易WDF动画",0X00010025),
	-- [1]=资源:载入('pic/排行榜.png',"图片")
	-- [2]=按钮.创建(资源:载入('UI.wdf',"网易WDF动画",0x00000606),0,0,4,true,true),
	-- [3] =  根._滑块.创建(自适应.创建(115,4,10,20,4,3,nil),4,10,290,2),
	-- [4]=资源:载入('pic/11.png', "图片"),
	-- [5]=资源:载入('pic/22.png', "图片"),
	-- [6]=资源:载入('pic/33.png', "图片"),

	}

	self.玩家伤害排行=按钮(资源:载入("登陆资源.wdf","网易WDF动画",0X00010026),0,0,3,true,true,"  伤害排行")
	self.玩家灵力排行=按钮(资源:载入("登陆资源.wdf","网易WDF动画",0X00010026),0,0,3,true,true,"  灵力排行")
	self.玩家防御排行=按钮(资源:载入("登陆资源.wdf","网易WDF动画",0X00010026),0,0,3,true,true,"  防御排行")
	self.玩家速度排行=按钮(资源:载入("登陆资源.wdf","网易WDF动画",0X00010026),0,0,3,true,true,"  速度排行")
	self.玩家财富排行=按钮(资源:载入("登陆资源.wdf","网易WDF动画",0X00010026),0,0,3,true,true,"  财富排行")
	self.玩家等级排行=按钮(资源:载入("登陆资源.wdf","网易WDF动画",0X00010026),0,0,3,true,true,"  等级排行")
	self.玩家仙玉排行=按钮(资源:载入("登陆资源.wdf","网易WDF动画",0X00010026),0,0,3,true,true,"  仙玉排行")

	self.玩家气血排行=按钮(资源:载入("登陆资源.wdf","网易WDF动画",0X00010026),0,0,3,true,true,"  气血排行")

	self.风云榜标题=资源:载入("登陆资源.wdf","网易WDF动画",0X75B260A7) --风云榜标题
    zts = tp.字体表.描边字体
    zts2 = tp.字体表.普通字体
    self.排行榜数据={}
    self.查看类型="玩家等级排行"
end

function 排行榜类:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y) then
		return true
	else
		return false
	end
end

function 排行榜类:打开(内容)
	if self.临时窗宽~=全局游戏宽度 or self.临时窗高~=全局游戏高度 then
        self.x = 全局游戏宽度/2-self.宽/2+50
        self.y = 全局游戏高度/2-self.高/2
        self.临时窗宽=全局游戏宽度
        self.临时窗高=全局游戏高度
    end
	if self.可视 then
		self.可视=false
		self.排行榜数据={}
		return
	else
		insert(tp.窗口_,self)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视=true
		self.排行榜数据=内容
		-- 发送数据(39)
	end
end


function 排行榜类:显示(dt,x,y)
	self.焦点=false

	self.玩家伤害排行:更新(x,y)
	self.玩家灵力排行:更新(x,y)
	self.玩家防御排行:更新(x,y)
	self.玩家速度排行:更新(x,y)
	self.玩家财富排行:更新(x,y)
	self.玩家气血排行:更新(x,y)
	self.玩家等级排行:更新(x,y)
	self.玩家仙玉排行:更新(x,y)



	self.资源组[1]:显示(self.x-50, self.y-20)--背景+
	-- self.资源组[4]:显示(self.x-50+57+33-12, self.y-20+144-5)
	-- self.资源组[5]:显示(self.x-50+57+33-10, self.y-20+144+29)
	-- self.资源组[6]:显示(self.x-50+57+33-5, self.y-20+144+30*2)

	self.玩家伤害排行:显示(self.x+300, self.y+41)
	self.玩家灵力排行:显示(self.x+300, self.y+67)
	self.玩家防御排行:显示(self.x+400, self.y+41)
	self.玩家速度排行:显示(self.x+400, self.y+67)
	self.玩家财富排行:显示(self.x+500, self.y+41)
	self.玩家气血排行:显示(self.x+200, self.y+67)
	self.玩家等级排行:显示(self.x+200, self.y+41)
	self.玩家仙玉排行:显示(self.x+500, self.y+67)



	self.风云榜标题:显示(self.x-50,self.y+50)

	self.显示名字={"","","","","","","","","",""}
	self.显示分数={"","","","","","","","","",""}
	self.显示id={"","","","","","","","","",""}

	if self.排行榜数据[self.查看类型]~= nil then
		if #self.排行榜数据[self.查看类型]>0 then
			local 人数=#self.排行榜数据[self.查看类型]
			if 人数>10 then 人数=0 end
			for i=1,人数 do
				self.显示名字[i]=self.排行榜数据[self.查看类型][i].名称
				self.显示分数[i]=self.排行榜数据[self.查看类型][i].分数
				if self.排行榜数据[self.查看类型][i].id ~= nil then
					self.显示id[i]=self.排行榜数据[self.查看类型][i].id
					--self.显示名字[i]=self.显示名字[i].." (ID: "..self.显示id[i]..")"
				end
			end
		end
	end

	--显示排名
	--self.起始x=138
	self.起始y=160
	self.高度差=32
	self.文字起始y=138
	self.文字x1=138
	self.文字x2=260
	self.文字x3=490

    zts2:置颜色(红色)
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*0-5, self.显示名字[1].."("..self.显示id[1]..")")
    zts2:置颜色(红色)
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*0-5, self.显示分数[1])
    zts2:置颜色(紫色)
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*1-5, self.显示名字[2].."("..self.显示id[2]..")")
	zts2:置颜色(紫色)
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*1-5, self.显示分数[2])
    zts2:置颜色(蓝色)
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*2-5, self.显示名字[3].."("..self.显示id[3]..")")
	zts2:置颜色(蓝色)
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*2-5, self.显示分数[3])
	zts2:置颜色(0xFF8C3A39)
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*3-5, self.显示名字[4].."("..self.显示id[4]..")")
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*3-5, self.显示分数[4])
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*4-5, self.显示名字[5].."("..self.显示id[5]..")")
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*4-5, self.显示分数[5])
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*5-5, self.显示名字[6].."("..self.显示id[6]..")")
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*5-5, self.显示分数[6])
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*6-5, self.显示名字[7].."("..self.显示id[7]..")")
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*6-5, self.显示分数[7])
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*7-5, self.显示名字[8].."("..self.显示id[8]..")")
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*7-5, self.显示分数[8])
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*8-5, self.显示名字[9].."("..self.显示id[9]..")")
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*8-5, self.显示分数[9])
	zts2:显示(self.x+self.文字x2-22, self.y+self.文字起始y+self.高度差*9-5, self.显示名字[10].."("..self.显示id[10]..")")
	zts2:显示(self.x+self.文字x3-22, self.y+self.文字起始y+self.高度差*9-5, self.显示分数[10])

	zts2:置颜色(黑色)
	local 关键字={"伤害","灵力","防御","速度","财富","气血","等级","仙玉"}
	for i=1,#关键字 do
		if string.find(self.查看类型,关键字[i]) then
			zts2:显示(self.x+461, self.y+103,string.format("%s",关键字[i]))
		end
	end
	-- zts2:置颜色(0xFF8C3A39)
	zts2:置颜色(黑色)
	zts2:显示(self.x-30, self.y+425,"*玩家进入游戏时排行会自动刷新")

	if self.玩家伤害排行:事件判断() then
		self.查看类型="玩家伤害排行"
		--self.玩家伤害排行:置文字颜色(绿色)
	elseif self.玩家防御排行:事件判断() then
		self.查看类型="玩家防御排行"
		--self.玩家防御排行:置文字颜色(绿色)
	elseif self.玩家灵力排行:事件判断() then
		self.查看类型="玩家灵力排行"
		--self.玩家防御排行:置文字颜色(绿色)
	elseif self.玩家速度排行:事件判断() then
		self.查看类型="玩家速度排行"
		--self.玩家速度排行:置文字颜色(绿色)
	elseif self.玩家财富排行:事件判断() then
		self.查看类型="玩家财富排行"
		--self.玩家财富排行:置文字颜色(绿色)
	elseif self.玩家气血排行:事件判断() then
		self.查看类型="玩家气血排行"
		--self.宝宝伤害排行:置文字颜色(绿色)

	elseif self.玩家等级排行:事件判断() then
		self.查看类型="玩家等级排行"
		--self.宝宝伤害排行:置文字颜色(绿色)

	elseif self.玩家仙玉排行:事件判断() then
	--财富
		self.查看类型="玩家仙玉排行"
		--self.宝宝伤害排行:置文字颜色(绿色)

end

end

function 排行榜类:检查点(x,y)
	if self.资源组[1]:是否选中(x+110,y) or self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 排行榜类:初始移动(x,y)
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

function 排行榜类:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 排行榜类



