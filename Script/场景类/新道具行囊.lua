-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-04-06 18:43:41
local bw = require("gge包围盒")(0,0,100,22)
local bw1= require("gge包围盒")(0,0,100,17)
local box = 引擎.画矩形
local floor = math.floor
local tp,xinzts,jiuzts
local format = string.format
local mousea = 引擎.鼠标弹起
local qtxs = 引擎.取头像
local qzdmx = 引擎.取战斗模型
local keyaz = 引擎.按键按住
local xys = 生成XY
local insert = table.insert
local type = type
local min = math.min
local ceil = math.ceil
local qjq = 引擎.取摊位金钱颜色
local zqj = 引擎.坐骑库
local qmx = 引擎.取模型

local keyax = 引擎.按键按下

local j玄灵珠={回春={子类=1,总类=199,名称="玄灵珠·回春",分类=8,级别限制=1},破军={子类=1,总类=199,名称="玄灵珠·破军",分类=9,级别限制=1},
空灵={子类=1,总类=199,名称="玄灵珠·空灵",分类=6,级别限制=1},噬魂={子类=1,总类=199,名称="玄灵珠·噬魂",分类=7,级别限制=1}}
local 场景类_道具行囊 = class()

function 场景类_道具行囊:初始化(根)
	self.ID = 142
	self.x = 250
	self.y = 185
	self.xx = 0
	self.yy = 0
	self.注释 = "道具行囊"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口 = "主人公"
	self.召唤兽 = 0
	self.新界面=true
	local xjm = 读配置("./config.ini","mhxy","新道具界面")
	if xjm=="false" then
	self.新界面=false
	end
	tp = 根
	self.qiehuan=根._按钮.创建(根.资源:载入('nice.wdf',"网易WDF动画",1238408331),0,0,4,true,true)
	self.窗口时间 = 0
	self.当前银行 = "现金"
	xinzts = 根.字体表.普通字体
	jiuzts = 根.字体表.旧道具字体
end

function 场景类_道具行囊:关闭()
	self:打开()
	return false
end

function 场景类_道具行囊:加载新资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.Pages=1
	self.xin资源 = {
		[1] = 自适应.创建(0,1,540,330,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
		[3] = 按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true," 人物"),
		[4] = 按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true,"召唤兽"),
		[5] = 按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true," 坐骑"),
		[6] = 按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true," 子女"),
		[7] = 按钮.创建(自适应.创建(12,4,77,22,1,3),0,0,4,true,true,"  道具"),
		[8] = 按钮.创建(自适应.创建(12,4,77,22,1,3),0,0,4,true,true,"  行囊"),
		[9] = 按钮.创建(自适应.创建(12,4,77,22,1,3),0,0,4,true,true,"  任务"),
		[10] = 自适应.创建(2,1,112,120,3,9),
		[11] = 按钮.创建(自适应.创建(17,4,22,22,1,3),0,0,4,true,true,"1"),
		[12] = 按钮.创建(自适应.创建(17,4,22,22,1,3),0,0,4,true,true,"2"),
		[13] = 按钮.创建(自适应.创建(17,4,22,22,1,3),0,0,4,true,true,""),

		[14] = 按钮.创建(自适应.创建(17,4,22,22,1,3),0,0,4,true,true,"矿"),
		[15] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"锦衣"),
		[16] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"法宝"),
		[17] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"现金"),
		[18] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"摆摊"),
		[19] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"仓房"),---新界面的
		[20] =资源:载入("wdf/audio/jmk/背包/灵饰1.png","图片"),
		[21] =资源:载入("wdf/audio/jmk/背包/灵饰2.png","图片"),
		[22] =资源:载入("wdf/audio/jmk/背包/灵饰3.png","图片"),
		[23] =资源:载入("wdf/audio/jmk/背包/灵饰4.png","图片"),
		[24] =资源:载入("wdf/audio/jmk/背包/头盔.png","图片"),
		[25] =资源:载入("wdf/audio/jmk/背包/武器.png","图片"),
		[26] =资源:载入("wdf/audio/jmk/背包/腰带.png","图片"),
		[27] =资源:载入("wdf/audio/jmk/背包/项链.png","图片"),
		[28] =资源:载入("wdf/audio/jmk/背包/铠甲.png","图片"),
		[29] =资源:载入("wdf/audio/jmk/背包/鞋子.png","图片"),
		[30] =资源:载入("wdf/audio/jmk/背包/背景条.png","图片"),
		[31] =资源:载入("wdf/audio/jmk/背包/钥匙.png","图片"),
		[32] = 自适应.创建(34,1,112,178,3,9),  --召唤兽右侧大框
		[33] = 自适应.创建(3,1,150,19,1,3),   --金钱 背景
		[34] = 自适应.创建(3,1,79,19,1,3),   --宝宝血条 背景
		[35] =资源:载入("wdf/audio/jmk/背包/护腕.png","图片"),
		[36] = 按钮.创建(自适应.创建(12,4,77,22,1,3),0,0,4,true,true,"更换装备"),
		[37] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"骑乘"),
		[38] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"属性"),
		[39] = 自适应.创建(3,1,35,19,1,3),
		[40] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"修炼"),
		[41] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"喂养"),
		[42] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"查看"),
		[43] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true," 放出"),
		[44] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true," 属性"),
		[45] = 按钮.创建(自适应.创建(12,4,77,22,1,3),0,0,4,true,true,"孩子衣柜"),
		[46] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,180,2),
		[55] = 按钮.创建(自适应.创建(10,4,24,20,1,3),0,0,4,true,true,"整"),
		[56] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"出售"),
		[57] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"仓库"),---不用了
		[101]=按钮.创建(资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"壹"),
		[102]=按钮.创建(资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"贰"),
		[103]=按钮.创建(资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"叁"),
		[104]=按钮.创建(资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"肆"),
	}
	self.xin资源[3]:置偏移(-3,0)
	self.xin资源[4]:置偏移(-3,0)
	self.xin资源[5]:置偏移(-3,0)
	self.xin资源[6]:置偏移(-3,0)
	self.xin资源[7]:置偏移(2,0)
	self.xin资源[8]:置偏移(2,0)
	self.xin资源[9]:置偏移(2,0)
	self.xin资源[14]:置偏移(-4,0)
	self.xin资源[15]:置偏移(3,0)
	self.xin资源[16]:置偏移(3,0)
	self.xin资源[18]:置偏移(3,0)
	self.xin资源[36]:置偏移(3,0)
	self.xin资源[37]:置偏移(3,0)
	self.xin资源[38]:置偏移(3,0)
	self.xin资源[42]:置偏移(3,0)
	self.xin资源[43]:置偏移(-3,0)
	self.xin资源[44]:置偏移(-3,0)
	self.xin资源[45]:置偏移(3,0)
	self.xin资源[46]:置起始点(0)
	self.召唤兽装备坐标 = {x={10,10+60*1,10+60*2,10+60*3},y={267,267,267,267}}
	self.灵饰坐标 = {x={10+60*1,10+60*2,10,10+60*3},y={59,59,59,59}}
	self.人物装备 = {}
	self.人物装备窗口=1
	self.召唤兽装备 = {}
	self.坐骑装饰 = {}
	self.动画 = {}
	local 格子 = tp._物品格子
	local 底图 =资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
	for i=1,6 do
	self.人物装备[i] = 格子(0,0,i,"道具行囊_人物装备",底图)
	end
	self.人物装备[1]:置根(tp)
	self.灵饰 = {}
	for i=1,4 do
	self.灵饰[i] = 格子(0,0,i,"道具行囊_灵饰",tp.底图)
	end
	for i=1,3 do
	self.召唤兽装备[i] = 格子(0,0,i,"道具行囊_召唤兽装备",底图)
	end
	for i=1,1 do
	self.坐骑装饰[i] = 格子(0,0,i,"道具行囊_坐骑装饰",底图)
	end
	self.物品 = {}
	for i=1,180 do
	self.物品[i] = 格子.创建(0,0,i,"道具行囊_物品")
	end
	self.选中召唤兽 = 0
	self.加入 = 0
	self.结束 = 80
	for i=1,4 do
		if tp.队伍[1].灵饰[i] ~= nil and  tp.队伍[1].灵饰[i].名称 ~= nil then
	self.灵饰[i]:置物品(tp.队伍[1].灵饰[i])
		end
	end
	for n=36,46 do
		if self.xin资源[n] ~= nil and n ~= 39 then
		self.xin资源[n]:绑定窗口_(self.ID)
		end
	end
	for n=2,9 do
		self.xin资源[n]:绑定窗口_(self.ID)
	end
	for n=11,19 do
		self.xin资源[n]:绑定窗口_(self.ID)
	end
	    self.整理=按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true,"出售")
	    self.整理:置偏移(3,0)
	for n=101,104 do
	    self.xin资源[n]:绑定窗口_(self.ID)
	    self.xin资源[n]:置偏移(-5,14)
	end
end

function 场景类_道具行囊:加载旧资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.Pages=1
	self.jiu资源 = {
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x83084DEB),
		[2] = 资源:载入('wzife.wdf',"网易WDF动画",0x4B2AFA64),
		[3] = 资源:载入('wzife.wdf',"网易WDF动画",0x9B1DB10D),
		[5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4,true,true), --关闭
		[6] = 按钮.创建(自适应.创建(10,4,37,20,1,3),0,0,4,true,true,"人物"),
		[7] = 按钮.创建(自适应.创建(10,4,37,20,1,3),0,0,4,true,true,"召唤"),
		[8] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"现金"),
		[9] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xFD3D61F2),0,0,4,true,true),
		[10] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x09217E13),0,0,4,true,true),
		[11] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"道具"), --11道具 12行囊 44法宝 54回收 61传送
		[12] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"行囊"),
		-- [13] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x00D13BBF),0,0,4,true,true,"法宝"),
		[14] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x5F339316),0,0,4,true,true),
		[15] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x0AA7176D),0,0,4,true,true),
		[16] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x8773AFEA),0,0,4,true,true),
		[17] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x612D9651),0,0,4,true,true),
		[18] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x27031D21),0,0,4,true,true),
		[30] = 按钮.创建(自适应.创建(10,4,37,20,1,3),0,0,4,true,true,"坐骑"),
		[31] = 按钮.创建(自适应.创建(10,4,37,20,1,3),0,0,4,true,true,"子女"),
		-- [34] = 资源:载入('wzife.wdf',"网易WDF动画",0xA7CE2F61),
		[34] = 资源:载入('XWD.wdf',"网易WDF动画",0x7D82B9DF),
		[35] = 资源:载入('wzife.wd2',"网易WDF动画",0x115E9954),
		[36] = 按钮.创建(自适应.创建(120,4,55,22,1,3),0,0,4,true,true,"查看"),
		[37] = 按钮.创建(自适应.创建(120,4,55,22,1,3),0,0,4,true,true,"抛弃"),
		[38] = 按钮.创建(自适应.创建(10,4,24,20,1,3),0,0,4,true,true,"1"),
		[39] = 按钮.创建(自适应.创建(10,4,24,20,1,3),0,0,4,true,true,"2"),
		[40] = 按钮.创建(自适应.创建(10,4,24,20,1,3),0,0,4,true,true,"锦"),
		[41] = 按钮.创建(自适应.创建(10,4,24,20,1,3),0,0,4,true,true,"饰"),
		[55] = 按钮.创建(自适应.创建(10,4,24,20,1,3),0,0,4,true,true,"整"),
		[42] = 按钮.创建(自适应.创建(120,4,55,22,1,3),0,0,4,true,true,"骑乘"),
		[43] = 按钮.创建(自适应.创建(120,4,55,22,1,3),0,0,4,true,true,"属性"),
		-- [44] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x00D13BBF),0,0,4,true,true,"法宝"),
		[45] = 资源:载入('wzife.wdf',"网易WDF动画",0X419DCF2A),
		[46] = 资源:载入('wzife.wdf',"网易WDF动画",0X300C54D8),
		[47] = 资源:载入('wzife.wdf',"网易WDF动画",0xCF39217A),
		[48] = 资源:载入('wzife.wdf',"网易WDF动画",0xFE7DE843),
		[49] = 资源:载入('wzife.wdf',"网易WDF动画",0xC0520208),
		[50] =按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"使用"),
		[51] =按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"修炼"),
		[52] = 资源:载入('wzife.wdf',"网易WDF动画",0xA393A808),
		[53] = 按钮.创建(自适应.创建(10,4,24,20,1,3),0,0,4,true,true,"仓"),
		[54] = 资源:载入('wzife.wdf',"网易WDF动画",0xef45cdc6),
		[56] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"出售"),
		[57] = 按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"仓库"),----无用
		[82] = 按钮.创建(自适应.创建(10,4,24,20,1,3),0,0,4,true,true,"拆"),
		[101]=按钮.创建(资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"壹"),
		[102]=按钮.创建(资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"贰"),
		[103]=按钮.创建(资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"叁"),
		[104]=按钮.创建(资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"肆"),
		[108] =按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"切换"), --玄灵珠
		[109] =按钮.创建(资源:载入('nvdi1.wdf',"网易WDF动画",0X04200420),0,0,4,true,true), --关闭 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"使用"),--资源:载入('nvdi1.wdf',"网易WDF动画",0X04200420),
	}
	self.x = 0
	self.y = 90
	self.人物装备 = {}
	self.人物装备窗口=1
	self.召唤兽装备 = {}
	self.坐骑装饰 = {}
	self.动画 = {}
	local 格子 = tp._物品格子
	local 底图 =资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
	for i=1,6 do
		self.人物装备[i] = 格子(0,0,i,"道具行囊_人物装备",底图)
	end
	self.人物装备[1]:置根(tp)
	for i=1,3 do
		self.召唤兽装备[i] = 格子(0,0,i,"道具行囊_召唤兽装备",底图)
	end
	for i=1,1 do
		self.坐骑装饰[i] = 格子(0,0,i,"道具行囊_坐骑装饰",底图)
	end
	self.物品 = {}
	for i=1,180 do
		self.物品[i] = 格子.创建(0,0,i,"道具行囊_物品")
	end
	self.选中召唤兽 = 0
	self.加入 = 0
	self.结束 = 80
	self.套装激活 = 0
	self.套装名称 = "无"
	for n=5,33 do
		if self.jiu资源[n] ~= nil and n ~= 19 then
			self.jiu资源[n]:绑定窗口_(self.ID)
		end
	end
	for n=36,43 do
		self.jiu资源[n]:绑定窗口_(self.ID)
	end
	self.jiu资源[53]:绑定窗口_(self.ID)
	for n=50,51 do
		self.jiu资源[n]:绑定窗口_(self.ID)
	end
	self.法宝按钮=按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"法宝")
	self.法宝按钮:绑定窗口_(self.ID)
	self.任务按钮=按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"任务")
	self.任务按钮:绑定窗口_(self.ID)
	self.出售按钮=按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"出售")
	self.出售按钮:绑定窗口_(self.ID)
	self.仓库按钮=按钮.创建(自适应.创建(120,4,43,22,1,3),0,0,4,true,true,"仓房")
	self.仓库按钮:绑定窗口_(self.ID)
	self.锁图标=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1951685695),0,0,4,true,true)
	self.锁图标:绑定窗口_(self.ID)
	self.jiu资源[40]:置偏移(-2,-1)
	self.jiu资源[41]:置偏移(-2,-1)
	self.jiu资源[55]:置偏移(-2,-1)
	self.jiu资源[53]:置偏移(-2,-1)
	self.jiu资源[82]:置偏移(-2,-1)
	for n=101,104 do
	      self.jiu资源[n]:绑定窗口_(self.ID)
	      self.jiu资源[n]:置偏移(-5,14)
	end
end

function 场景类_道具行囊:打开()
	if self.可视 then
		self.可视 = false
		self.选中召唤兽 = nil
		self.加入 = nil
		self.套装名称 = nil
		self.当前银行 = nil
		self.窗口 = nil
		self.套装激活 = nil
		for s=1,3 do
			self.召唤兽装备[s]:置物品(nil)
		end
		for s=1,1 do
			self.坐骑装饰[s]:置物品(nil)
		end
		for i=1,6 do
			self.人物装备[i]:置物品(nil)
		end
		if tp.窗口.灵饰.可视 then
			tp.窗口.灵饰:打开()
		end
		if tp.窗口.锦衣.可视 then
			tp.窗口.锦衣:打开()
		end
		self.玄灵珠=nil
		self.坐骑偏移=nil
	else
		insert(tp.窗口_,self)
		self:重置窗口()
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.Pages=1
		self.坐骑偏移={x=0,y=0}
		self.玄灵珠 = {}
		self.玄灵珠模型 = tp._物品格子.创建(0,0,i,"假玄灵珠数据")
		if tp.队伍[1].玄灵珠~=nil and tp.队伍[1].玄灵珠.类型~=nil then
			self.玄灵珠.类型 = tp.队伍[1].玄灵珠.类型
			if self.玄灵珠.类型=="回春" then
				self.玄灵珠.等级 = tp.队伍[1].玄灵珠.回春
			elseif self.玄灵珠.类型=="破军" then
				self.玄灵珠.等级 = tp.队伍[1].玄灵珠.破军
			elseif self.玄灵珠.类型=="空灵" then
				self.玄灵珠.等级 = tp.队伍[1].玄灵珠.空灵
			elseif self.玄灵珠.类型=="噬魂" then
				self.玄灵珠.等级 = tp.队伍[1].玄灵珠.噬魂
			end
			if j玄灵珠[self.玄灵珠.类型]~=nil then
				j玄灵珠[self.玄灵珠.类型].级别限制 = self.玄灵珠.等级
				self.玄灵珠模型:置物品(j玄灵珠[self.玄灵珠.类型])
			end
		end
	end
end

function 场景类_道具行囊:刷新玄灵珠(nr)
	self.玄灵珠 = {}
	self.玄灵珠=nr
	if self.玄灵珠.类型~=nil and j玄灵珠[self.玄灵珠.类型]~=nil then
		if self.玄灵珠.类型=="回春" then
			self.玄灵珠.等级 = tp.队伍[1].玄灵珠.回春
		elseif self.玄灵珠.类型=="破军" then
			self.玄灵珠.等级 = tp.队伍[1].玄灵珠.破军
		elseif self.玄灵珠.类型=="空灵" then
				self.玄灵珠.等级 = tp.队伍[1].玄灵珠.空灵
		elseif self.玄灵珠.类型=="噬魂" then
			self.玄灵珠.等级 = tp.队伍[1].玄灵珠.噬魂
		end
		j玄灵珠[self.玄灵珠.类型].级别限制 = self.玄灵珠.等级
		self.玄灵珠模型:置物品(j玄灵珠[self.玄灵珠.类型])
	end
end

function 场景类_道具行囊:重置窗口()
	self.选中召唤兽 = 0
	self.加入 = 0
	self.当前银行 = "现金"
	self.窗口 = "主人公"
	if self.新界面 then
		if self.xin资源==nil then
			self:加载新资源()
		end
		self.装备坐标 = {x={10,10+51*3+9*3,10,10+51*3+9*3,10,10+51*3+9*3},y={120,120,120+59*1,120+59*1,120+59*2,120+59*2}}
		self:取人物形象()
	else
		if self.jiu资源==nil then
			self:加载旧资源()
		end
		self.装备坐标 = {x={195,249,195,249,195,249},y={24,24,79,79,133,133},xx={10,63,115},yy={144,144,144}}
		self:取人物头像()
	end
	self.开始 = 1
	self.结束 = 80
	for i=1,6 do
		self.人物装备[i]:置物品(tp.队伍[1].装备[i])
	end
	for q=self.开始,self.结束 do
		self.物品[q]:置物品(tp.道具列表[q])
	end
	self.点击类型="道具"
end

function 场景类_道具行囊:切换界面()
	self.新界面=not self.新界面
	if tp.窗口.灵饰.可视 then
		tp.窗口.灵饰:打开()
	end
	if tp.窗口.锦衣.可视 then
		tp.窗口.锦衣:打开()
	end
	self:重置窗口()
	写配置("./config.ini","mhxy","新道具界面",self.新界面)
end

function 场景类_道具行囊:显示(dt,x,y)
	右键弹起=false
	self.焦点 = false
	if self.新界面 then
		self:新界面显示(dt,x,y)
	else
		self:旧界面显示(dt,x,y)
	end
	-- self.xin资源[56]:更新(x,y)
	-- self.xin资源[57]:更新(x,y)
	-- self.jiu资源[56]:更新(x,y)
	-- self.jiu资源[57]:更新(x,y)
	local o = self.开始 - 1+((self.Pages-1)*20)
	for h=1,4 do
		for l=1,5 do
			o = o + 1
			if self.新界面 then
				self.物品[o]:置坐标(l * 51 + self.x + 206,h * 51 + self.y + 7)
			else
				self.物品[o]:置坐标(l * 51 - 22 + self.x,h * 51 + 146 + self.y)
			end
			self.物品[o]:显示(dt,x,y,self.鼠标)
			if self.物品[o].焦点 and not tp.消息栏焦点 then
				if self.物品[o].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[o].物品)
				end
				self.焦点 = true
			end
			if  tp.场景.地图.抓取物品 == nil and self.物品[o]~=nil and self.物品[o].焦点 and self.物品[o].物品 ~= nil and not tp.消息栏焦点 and self.物品[o].物品.分类~=nil then
				if 引擎.鼠标弹起(0x01) and 右键弹起==false then --self.物品[o].右键
					右键弹起=true
					if self.物品[o].物品.总类=="可使用" or self.物品[o].物品.名称=="特殊兽诀·碎片"or self.物品[o].物品.名称=="超级兽诀·碎片" or  ((self.物品[o].物品.分类 <=12 or self.物品[o].物品.总类==144) and self.物品[o].物品.总类~=2) then
						发送数据(3705,{类型=self.点击类型,编号=o-self.开始+1,窗口=self.窗口,序列=self.选中召唤兽})
						return
					end
					if self.物品[o].物品.总类==889 or self.物品[o].物品.总类==149 then
						发送数据(3705,{类型=self.点击类型,编号=o,窗口=self.窗口,序列=self.选中召唤兽})
						return
					end
					if self.物品[o].物品.总类=="更改鼠标" then
						tp.鼠标.置鼠标("铁锤点击")
						return
					elseif self.物品[o].物品.总类=="自选灵饰礼包" then
						tp.窗口.对话栏:文本("",self.物品[o].物品.名称,"请选择你想要的部位，开启一次可获得五套同类型的灵饰书铁。请选择部位：",{"手镯","戒指","佩饰","耳饰"})
						return
					elseif self.物品[o].物品.总类=="天赋符" then
						if self.物品[o].物品.属性 then
							发送数据(3705,{类型=self.点击类型,编号=o,窗口=self.窗口,序列=self.选中召唤兽})
						else
							tp.窗口.对话栏:文本("",self.物品[o].物品.名称,"你想加强召唤兽的哪种天赋呢？",{"攻击","气血","防御","速度","灵力","躲闪","我再想想"},nil,{类型=self.点击类型,编号=o})
						end
						return
					end
				end
			end
			if tp.场景.地图.抓取物品 == nil and self.物品[o].焦点 and self.物品[o].物品 ~= nil  then
				if mousea(1) then
					if self.物品[o].物品.总类 == 2 then
						if self.窗口 == "主人公" and self.物品[o].物品.分类 < 10 then
							if keyaz(KEY.SHIFT) == false then
								发送数据(3703,{类型=self.点击类型,角色="主角",道具=o-self.开始+1})
							elseif keyaz(KEY.SHIFT) and self.物品[o].物品.开运孔数.当前 > 0 then
								发送数据(3800,{装备=o,类型=self.点击类型})
								-- if tp.窗口.符石镶嵌.可视 ~= true then
								-- 	tp.窗口.符石镶嵌:打开(self.物品[o].物品)
								-- end
							end
						elseif self.窗口 == "召唤兽" and self.选中召唤兽 ~= 0 then
							发送数据(3708,{类型=self.点击类型,角色="bb",道具=o-self.开始+1,编号=self.选中召唤兽})
						end
						if self.物品[o].物品 ~= nil and self.物品[o].物品.分类 >= 10 and self.物品[o].物品.分类 <= 13 then
							-- if tp.窗口.灵饰.可视 ~= true then
							-- 	tp.窗口.灵饰:打开(self.x+312,self.y+1)
							-- end
							发送数据(3703,{类型=self.点击类型,角色="主角",道具=o-self.开始+1})
						end
						if self.物品[o].物品 ~= nil and self.物品[o].物品.分类 >= 14 and self.物品[o].物品.分类 <= 21 then
							if tp.窗口.锦衣.可视 ~= true then
								tp.窗口.锦衣:打开(self.x+542,self.y+63)
							end
							发送数据(3703,{类型=self.点击类型,角色="主角",道具=o-self.开始+1})
						end
					end
				end
			end
			-- 点击物品逻辑
			if self.物品[o].事件  then
				if tp.拆分开关 and self.物品[o].物品 ~= nil and self.点击类型 == "道具" then
					if self.物品[o].物品.数量 and self.物品[o].物品.可叠加 then
					tp.拆分开关=false
           		    tp.鼠标:还原鼠标()
					   tp.窗口.组合输入框:打开("拆分",{"请输入要拆分【" ..self.物品[o].物品.名称.."】的数量",ARGB(255,255,255,0)},o)
					else
						tp.提示:写入("#y/只能拆分叠加的物品")
					end
					return
				elseif tp.拆分开关 then
				    tp.拆分开关=false
           		    tp.鼠标:还原鼠标()
				end
				if self.物品[o].事件 and keyaz(KEY.SHIFT) then
					-- if tp.窗口.消息框.序列 == 3 or tp.窗口.消息框.序列 == 10 then
						if #tp.窗口.消息框.超链接>=1 then
							tp.常规提示:打开("#Y一次最多发送一条链接")
						else
							tp.窗口.消息框.输入:添加文本("["..self.物品[o].物品.名称.."]")
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接+1] = {}
							tp.窗口.消息框.发送方式=2
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接].类型 = "道具"
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接].点击类型 = self.点击类型
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接].名称= self.物品[o].物品.名称
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接].编号= o-self.开始+1
						end

							--------=======================+++++++++++++++++++++++++++++++
				elseif self.物品[o].事件 and keyaz(KEY.TAB) then--ctrl
					发送数据(3702,{物品=o-self.开始+1,类型="道具"})
					tp.常规提示:打开("#Y道具摧毁成功！#R(谨慎使用)")
								--------=======================+++++++++++++++++++++++++++++++


				    else
					if tp.场景.抓取物品 == nil and self.物品[o].物品 ~= nil and 引擎.鼠标弹起(0x00) then
						local 允许拿起=true
						if 允许拿起 then
							tp.场景.抓取物品 = self.物品[o].物品
							tp.场景.抓取物品ID = o-self.开始+1
							tp.场景.抓取物品注释 = self.物品[o].注释
							self.物品[tp.场景.抓取物品ID].确定 = true
							self.物品[o]:置物品(nil)
							self.抓取类型=self.点击类型
							tp.场景.抓取物品类型 = self.抓取类型
						end
					elseif tp.场景.抓取物品 ~= nil and self.物品[o].物品 == nil and (tp.场景.抓取物品注释 == "道具行囊_物品" or tp.场景.抓取物品注释 == "道具行囊_灵饰" or tp.场景.抓取物品注释 == "道具行囊_锦衣")  then
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o-self.开始+1,放置类型=self.点击类型,抓取类型=self.抓取类型})
						if tp.场景.抓取物品注释 == "道具行囊_物品" then
							self.物品[tp.场景.抓取物品ID].确定 = false
						elseif tp.场景.抓取物品注释 == "道具行囊_灵饰" then
							tp.窗口.灵饰.物品[tp.场景.抓取物品ID].确定 = false
						elseif tp.场景.抓取物品注释 == "道具行囊_锦衣" then
							tp.窗口.锦衣.物品[tp.场景.抓取物品ID].确定 = false
						elseif tp.场景.抓取物品注释 == "道具行囊_符石" then
							tp.窗口.符石镶嵌.物品[tp.场景.抓取物品ID].确定 = false
						end
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					elseif tp.场景.抓取物品 ~= nil and self.物品[o].物品 ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品"  then
						local jy = self.物品[o].物品
						local jy1 = tp.场景.抓取物品
						local jy2 = tp.场景.抓取物品ID
						发送数据(3701,{抓取id=tp.场景.抓取物品ID,放置id=o-self.开始+1,放置类型=self.点击类型,抓取类型=self.抓取类型})
						self.物品[tp.场景.抓取物品ID].确定 = false
						tp.场景.抓取物品 = nil
						tp.场景.抓取物品ID = nil
						tp.场景.抓取物品注释 = nil
					end
				end
			end
		end
	end
	if not self.鼠标 and not tp.窗口.灵饰.鼠标 and not tp.窗口.锦衣.鼠标 then
		if mousea(0) and tp.窗口.符石镶嵌.可视 == false and tp.窗口.法宝.可视 == false and tp.窗口.宝宝进阶.可视 == false and not tp.窗口.修复神器.可视 and not tp.窗口.合成灵犀玉.可视 then
			if tp.场景.抓取物品 ~= nil and not tp.窗口.文本栏.可视 then
				tp.窗口.文本栏:载入("你确定要#R/摧毁#G/"..tp.场景.抓取物品.名称.."#W/吗？".." 按住TAB，点击道具可快速摧毁道具！","丢弃物品",true)--Ctrl

			end
		end
	end
	self.qiehuan:更新(x,y)
	self.qiehuan:显示(self.x+2,self.y+2)
	if self.qiehuan:事件判断() and not tp.战斗中 then
		self:切换界面()
		return
	end
end
---------------------------------------------------------新
function 场景类_道具行囊:新界面显示(dt,x,y)
	右键弹起=false
	self.焦点 = false
	self.xin资源[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-88+self.xin资源[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.xin资源[1].宽度/2,self.y+3,"道具行囊")
	self.xin资源[2]:更新(x,y)
	self.xin资源[3]:更新(x,y)
	self.xin资源[4]:更新(x,y)
	self.xin资源[5]:更新(x,y)
	self.xin资源[6]:更新(x,y)
	self.xin资源[7]:更新(x,y)
	self.xin资源[8]:更新(x,y)
	self.xin资源[9]:更新(x,y)
	self.xin资源[17]:更新(x,y)
	self.xin资源[18]:更新(x,y)
	self.xin资源[19]:更新(x,y)
	self.xin资源[2]:显示(self.x-18+self.xin资源[1].宽度,self.y+2)
	self.xin资源[3]:显示(self.x+10,self.y+30,nil,nil,nil,self.窗口 == "主人公",2)
	self.xin资源[4]:显示(self.x+10+51+9,self.y+30,nil,nil,nil,self.窗口 == "召唤兽",2)
	self.xin资源[5]:显示(self.x+10+51*2+9*2,self.y+30,nil,nil,nil,self.窗口 == "坐骑",2)
	self.xin资源[6]:显示(self.x+10+51*3+9*3,self.y+30,nil,nil,nil,self.窗口 == "子女",2)
	self.xin资源[7]:显示(self.x+10+51*3+7*3+75,self.y+30,nil,nil,nil,self.点击类型 == "道具",2)
	self.xin资源[8]:显示(self.x+10+51*3+7*3+75+77+7,self.y+30,nil,nil,nil,self.点击类型 == "行囊",2)
	self.xin资源[9]:显示(self.x+10+51*3+7*3+75+77*2+7*2,self.y+30,nil,nil,nil,self.点击类型 == "任务包裹",2)
	tp.物品界面背景_:显示(self.x+256,self.y+59)
	xinzts:置颜色(白色)
	xinzts:显示(self.x+10+51*3+7*3+83,self.y+273+22+6,"存银")
	self.xin资源[17]:置文字(self.当前银行)
	self.xin资源[17]:显示(self.x+10+51*3+7*3+75,self.y+270)
	self.xin资源[18]:显示(self.x+472,self.y+270)
	self.xin资源[19]:显示(self.x+472,self.y+270+27)
	self.xin资源[30]:显示(self.x+513,self.y+55)
	self.xin资源[31]:显示(self.x+513,self.y+31)
	self.xin资源[33]:显示(self.x+312,self.y+270)
	self.xin资源[33]:显示(self.x+312,self.y+270+27)
	-- self.xin资源[56]:显示(self.x+513,self.y+55)
	-- self.xin资源[57]:显示(self.x+513,self.y+55)
	-- self.xin资源[56]:更新(x,y)
	-- self.xin资源[57]:更新(x,y)
	-- self.jiu资源[56]:更新(x,y)
	-- self.jiu资源[57]:更新(x,y)

	if self.xin资源[19]:是否选中(x,y)  then
		tp.提示:自定义(x+10,y+10,"快捷键：ALT+V")
	end


	local jq
	if self.当前银行 == "现金" then
		jq = tp.金钱
	elseif self.当前银行 == "储备" then
		jq = tp.储备
	end
	xinzts:置颜色(qjq(jq))
	xinzts:显示(self.x + 322,self.y + 274,jq)
	xinzts:置颜色(qjq(tp.存银))
	xinzts:显示(self.x + 322,self.y + 274+27,tp.存银)
	if self.窗口 == "主人公" then
		self.人物组[1]:更新(dt)
		self.xin资源[11]:更新(x,y)
		self.xin资源[12]:更新(x,y)
		self.xin资源[13]:更新(x,y)
		self.xin资源[14]:更新(x,y)
		self.xin资源[15]:更新(x,y)
		self.xin资源[16]:更新(x,y)
		self.整理:更新(x,y)
		self.xin资源[10]:显示(self.x+10+51+6+3,self.y+67+53)
		self.xin资源[11]:显示(self.x+10+51+9,self.y+67+51+120+8+23)
		self.xin资源[12]:显示(self.x+10+51+9+22+8,self.y+67+51+120+8+23)
		self.xin资源[13]:显示(self.x+10+51+9+22*2+8*2,self.y+67+51+120+8+23)
		xinzts:置颜色(白色)
		xinzts:显示(self.x + 10+51+9+22*2+8*2+3,self.y +67+51+120+8+27,"仓")

		self.xin资源[14]:显示(self.x+10+51+9+22*3+8*3,self.y+67+51+120+8+23)
		self.xin资源[15]:显示(self.x+10+51+9,self.y+67+51+120+8+21+30)
		self.整理:显示(self.x+15,self.y+67+51+120+8+21+30)
		self.xin资源[16]:显示(self.x+131,self.y+67+51+120+8+21+30)
		-- self.huishou:更新(x,y)
		--self.huishou:显示(self.x+131+61,self.y+67+51+120+8+21+30)
		tp.影子:显示(self.x+128,self.y+220)
		self.人物组[1]:显示(self.x+128,self.y+220)
		if self.人物组[2] ~= nil then
			self.人物组[2]:更新(dt)
			self.人物组[2]:显示(self.x+128,self.y+220)
		end
		--20-23 灵饰 24 头盔 25 武器 26 腰带 27 项链 28 铠甲 29 鞋子
		self.xin资源[20]:显示(self.x+10,self.y+59)
		self.xin资源[21]:显示(self.x+10+60,self.y+59)
		self.xin资源[22]:显示(self.x+10+60*2,self.y+59)
		self.xin资源[23]:显示(self.x+10+60*3,self.y+59)
		self.xin资源[24]:显示(self.x+10,self.y+120)
		self.xin资源[25]:显示(self.x+10,self.y+120+59)
		self.xin资源[26]:显示(self.x+10,self.y+120+59*2)
		self.xin资源[27]:显示(self.x+10+51*3+9*3,self.y+120)
		self.xin资源[28]:显示(self.x+10+51*3+9*3,self.y+120+59)
		self.xin资源[29]:显示(self.x+10+51*3+9*3,self.y+120+59*2)
		xinzts:置颜色(白色)
		xinzts:显示(self.x+10+51+6+3,self.y+67+51+120+10,"快速切换套装")
		-- xinzts:显示(self.x+191,self.y+273+22+7,"已装备:0")
		if self.点击类型=="道具" then
		    for i=1,4 do
		        self.xin资源[100+i]:更新(x,y,self.Pages~=i)
    		    self.xin资源[100+i]:显示(self.x + 510,floor(self.y + 60+(i-1)*50),nil,nil,true,self.Pages==i,2)
                if self.xin资源[100+i]:事件判断() then
                self.Pages=i
                发送数据(3699)
                end
            end
		end
		if self.xin资源[18]:事件判断() and not tp.战斗中 then
			发送数据(3720)
		elseif self.xin资源[19]:事件判断() and not tp.战斗中 then
			发送数据(3832,{序列=1})
		elseif self.xin资源[13]:事件判断() and not tp.战斗中 then
			if tp.窗口.仓库类.可视 then
				tp.窗口.仓库类:打开()
			else
				发送数据(6701)
			end

		elseif self.xin资源[14]:是否选中(x,y) then
            tp.提示:自定义(鼠标.x+10,鼠标.y+20,"#G采矿熟练度：#R"..tp.熟练度1.."\n#G采矿声望  ：#R"..tp.矿业声望.."\n#G采矿次数  ：#R"..tp.次数1.."\n#Y每日20次采矿次数。")
		elseif self.xin资源[16]:事件判断() and not tp.战斗中 then
			if tp.场景.抓取物品 ~= nil and tp.场景.抓取物品ID ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品" and tp.场景.抓取物品.总类 == 1000 then
				发送数据(3746,{序列=tp.场景.抓取物品ID,放置类型="法宝",抓取类型=self.抓取类型})
				self.物品[tp.场景.抓取物品ID].确定 = false
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
			elseif tp.场景.抓取物品 == nil then
				tp.窗口.法宝:打开()
				发送数据(3732)
			else
				tp.常规提示:打开("#Y/不是什么东西都可以放到法宝里的")
			end
		elseif self.xin资源[15]:事件判断() and not tp.战斗中 then
			tp.窗口.锦衣:打开(self.x+542,self.y+63)
		-- elseif self.huishou:事件判断() and not tp.战斗中 then --，也可通过鼠标左键抓取拖拽实现出售 tp.场景.抓取物品==nil and
		-- 	tp.窗口.对话栏:文本("","","出售道具栏特定物品，该功能出售的物品无法恢复！请谨慎操作！”",{"一键出售","我点错了"})
		-- 	--     tp.窗口.对话栏:文本("","","出售道具栏特定物品，该功能出售的物品无法恢复！目前能出售的物品有：\n#G“低兽诀”“彩果”“五宝”“一级宝石”“宝宝洗练物品”",{"确定出售","一键出售环装","我点错了"})

		end
		for i=1,6 do
			self.人物装备[i]:置坐标(self.x+self.装备坐标.x[i]+1,self.y+self.装备坐标.y[i]-1,nil,nil,4,-1)
			self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,3)
			if self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then
				tp.提示:道具行囊(x,y,self.人物装备[i].物品)
			end
			if self.人物装备[i].焦点 then
				self.焦点 = true
			end
			if not tp.消息栏焦点 then
				if tp.场景.抓取物品 == nil and self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点   then
					if mousea(1) then
						发送数据(3704,{类型=self.点击类型,角色="主角",道具=i})
					end
				end
				-- 事件开始
				if self.人物装备[i].事件 then--鼠标左键点击人物装备会自动下装备
					if self.人物装备[i].焦点 and tp.场景.抓取物品 == nil and self.人物装备[i].物品 ~= nil then--鼠标 我等于空
						if 引擎.鼠标弹起 then
						end
					elseif  tp.场景.抓取物品 ~= nil and self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then-- 鼠标带物品的
						if 引擎.鼠标弹起 then
							self.物品[tp.场景.抓取物品ID].确定 = false
							tp.场景.抓取物品 = nil
							发送数据(3703,{类型=self.点击类型,角色="主角",道具=tp.场景.抓取物品ID})
						end
					end
				end
			end
		end

		for i=1,4 do
			self.灵饰[i]:置坐标(self.x + self.灵饰坐标.x[i]+1,self.y + self.灵饰坐标.y[i]-1,nil,nil,4,-1)
			self.灵饰[i]:显示(dt,x,y,self.鼠标,nil,3)
			if self.灵饰[i].物品 ~= nil and self.灵饰[i].焦点 then
				tp.提示:道具行囊(x,y,self.灵饰[i].物品,true)
			end
			if self.灵饰[i].事件 then
				if tp.场景.抓取物品 ~= nil and self.灵饰[i].物品 == nil and self.灵饰[i].焦点 then
				elseif tp.场景.抓取物品 ~= nil and self.灵饰[i].物品 ~= nil and self.灵饰[i].焦点 then
				elseif tp.场景.抓取物品 == nil and self.灵饰[i].物品 ~= nil and self.灵饰[i].焦点 then
					发送数据(3704,{类型=tp.窗口.道具行囊.点击类型,角色="主角",灵饰=true,道具=i})
				end
			elseif self.灵饰[i].右键 then
				if  self.灵饰[i].物品 ~= nil then
					发送数据(3704,{类型=tp.窗口.道具行囊.点击类型,角色="主角",灵饰=true,道具=i})
				end
			end
		end

	elseif self.窗口 == "召唤兽" or self.窗口 == "子女" then
		self.xin资源[10]:显示(self.x+10,self.y+59)
		self.xin资源[32]:显示(self.x+10+51*2+9*2,self.y+59)
		self.xin资源[35]:显示(self.x+10,self.y+267)           --护腕
		self.xin资源[29]:显示(self.x+10+51+9,self.y+267)         --鞋子
		self.xin资源[28]:显示(self.x+10+51*2+9*2,self.y+267)   --铠甲
		local bbsa
		if self.窗口 == "召唤兽" then
			self.xin资源[34]:显示(self.x+43,self.y+59+129)
			self.xin资源[34]:显示(self.x+43,self.y+59+129+29)
			xinzts:置颜色(白色)
			xinzts:显示(self.x+10,self.y+63+129,"气血")
			xinzts:显示(self.x+10,self.y+63+129+29,"魔法")
			self.xin资源[22]:显示(self.x+10+51*3+9*3,self.y+267)      --饰品
			xinzts:显示(self.x+10,self.y+246,"召唤兽装备")
			xinzts:显示(self.x+200,self.y+246,"饰品")
			self.xin资源[36]:显示(self.x+97,self.y+241)
			dxs = tp.队伍[1].宝宝列表
			bbsa = #dxs
			if bbsa > 8 then
				self.xin资源[46]:置高度(min(floor(180/(bbsa-8)),170))
				self.加入 = min(ceil((bbsa-8)*self.xin资源[46]:取百分比()),bbsa-8)
				if self.加入 == bbsa-8 then
					self.加入 = self.加入+1
				end
				self.xin资源[46]:显示(self.x+232,self.y+60,x,y,self.鼠标)
			end
		else
			self.xin资源[43]:显示(self.x+10,self.y+208)
			self.xin资源[44]:显示(self.x+70,self.y+208)
			xinzts:置颜色(白色)
			xinzts:显示(self.x+10,self.y+246,"子女装备")
			self.xin资源[45]:显示(self.x+108,self.y+242)
			dxs = tp.队伍[1].子女列表
		end
		for m=1,8 do
			if dxs[m + self.加入] ~= nil then
				bw:置坐标(self.x + 135,self.y + 39 + m * 22)
				local xz = bw:检查点(x,y)
				if not self.xin资源[46].接触 and xz and self.鼠标 and not tp.消息栏焦点 and self.拽拖对象 == 0 then
					if mousea(0) then
						self.拽拖计次 = self.拽拖计次 + 1
						if self.拽拖计次 >= 28 then
							self.拽拖对象 = i+self.加入
							self.拽拖计次 = 0
						end
					end
				end
				if self.选中召唤兽 ~= m + self.加入 then
					if bw:检查点(x,y) then
						tp.禁止关闭 = true
						box(self.x + 132,self.y + 39 + m * 22,self.x + 228,self.y + 39 + m * 22 + 22,-3551379)
						if mousea(0) and self.鼠标 then
							self.选中召唤兽 = m + self.加入
							self:置形象()
						end
						self.焦点 = true
					end
				else
					local ys = -10790181
					if bw:检查点(x,y) then
						tp.禁止关闭 = true
						ys = -9670988
						self.焦点 = true
						if 引擎.鼠标弹起(右键) then
							tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[m + self.加入])
						end
					end
					box(self.x + 132,self.y + 39 + m * 22,self.x + 228,self.y + 39 + m * 22 + 22,ys)
				end
				xinzts:置颜色(黑色)
				xinzts:显示(self.x + 137,self.y + 43 + m * 22,dxs[m + self.加入].名称)
			end
		end
		if self.窗口 == "召唤兽" and dxs[self.选中召唤兽] ~= nil then
			xinzts:置颜色(黑色)
			xinzts:显示(self.x + 49,self.y + 192 ,format("%s/%s",tp.队伍[1].宝宝列表[self.选中召唤兽].气血,tp.队伍[1].宝宝列表[self.选中召唤兽].最大气血))
			xinzts:显示(self.x + 49,self.y + 221 ,format("%s/%s",tp.队伍[1].宝宝列表[self.选中召唤兽].魔法,tp.队伍[1].宝宝列表[self.选中召唤兽].最大魔法))

		end
		if self.动画.主体 ~= nil then
			tp.影子:显示(self.x + 67,self.y + 160)
			self.动画.主体:更新(dt)
			self.动画.主体:显示(self.x + 67,self.y + 160)
			if self.动画.身体 ~= nil then
				self.动画.身体:更新(dt)
				self.动画.身体:显示(self.x + 67,self.y + 160)
			end
			if self.动画.饰品 ~= nil then
				self.动画.饰品:更新(dt)
				self.动画.饰品:显示(self.x + 67,self.y + 160)
			end
		end
		for i=1,3 do
			self.召唤兽装备[i]:置坐标(self.x+self.召唤兽装备坐标.x[i]+3,self.y+self.召唤兽装备坐标.y[i]-2)
			self.召唤兽装备[i]:显示(dt,x,y,self.鼠标)
			if not tp.消息栏焦点 then
				if self.召唤兽装备[i].物品 ~= nil and self.召唤兽装备[i].焦点 then
					tp.提示:道具行囊(x,y,self.召唤兽装备[i].物品)
				end
				if tp.队伍[1].宝宝列表[self.选中召唤兽] ~= nil then
					if tp.场景.抓取物品 == nil and self.召唤兽装备[i].物品 ~= nil and self.召唤兽装备[i].焦点  then
						if mousea(1) then
							发送数据(3709,{类型=self.点击类型,角色="bb",道具=i,编号=self.选中召唤兽})
						end
					end
					if self.召唤兽装备[i].事件 then
					end
				end
				if self.召唤兽装备[i].焦点 then
					self.焦点 = true
				end
			end
		end

		if(self.xin资源[32]:是否选中(x,y) or  self.xin资源[46]:是否选中(x,y)) and (引擎.取鼠标滚轮() ==1 and self.加入 > 0)  then--鼠标上滚动
			if self.加入-1 == bbsa-8 then
				self.加入=self.加入-1
			end
			self.xin资源[46]:置起始点(self.xin资源[46]:取百分比转换(self.加入-1,8,bbsa))
		elseif (self.xin资源[32]:是否选中(x,y) or  self.xin资源[46]:是否选中(x,y)) and (引擎.取鼠标滚轮() ==-1 and self.加入 < bbsa - 8) then--鼠标下滚动
			self.xin资源[46]:置起始点(self.xin资源[46]:取百分比转换(self.加入+1,8,bbsa))
		end
		if self.xin资源[46].接触 then
			self.焦点 = true
		end
	elseif self.窗口 == "坐骑" then
		self.xin资源[37]:更新(x,y,self.选中召唤兽 ~= 0 )
		self.xin资源[38]:更新(x,y)
		self.xin资源[40]:更新(x,y,self.选中召唤兽 ~= 0)
		self.xin资源[41]:更新(x,y,self.选中召唤兽 ~= 0)
		self.xin资源[42]:更新(x,y)
		self.xin资源[10]:显示(self.x+10,self.y+59)
		self.xin资源[32]:显示(self.x+10+51*2+9*2,self.y+59)
		self.xin资源[22]:显示(self.x+10,self.y+186)      --饰品
		self.xin资源[37]:显示(self.x+71,self.y+186)  --骑乘
		self.xin资源[38]:显示(self.x+71,self.y+215)  --属性
		xinzts:置颜色(白色)
		xinzts:显示(self.x+10,self.y+246,"坐骑操作")
		xinzts:显示(self.x+10+51*2+9*2,self.y+246,"祥瑞操作")
		xinzts:显示(self.x+10,self.y+273,"好感")
		xinzts:显示(self.x+10,self.y+273+22+6,"饱食")
		tp.物品格子背景_:显示(self.x+10+51*2+9*2,self.y+267)
		self.xin资源[39]:显示(self.x+40,self.y+270)
		self.xin资源[39]:显示(self.x+40,self.y+270+22+6)
		self.xin资源[40]:显示(self.x+80,self.y+270)
		self.xin资源[41]:显示(self.x+80,self.y+270+22+6)
		self.xin资源[42]:显示(self.x+196,self.y+270)

		if self.选中召唤兽 ~= 0 and tp.坐骑列表 ~=nil and tp.坐骑列表[self.选中召唤兽] ~=nil then
			local bb = tp.坐骑列表[self.选中召唤兽]
			xinzts:置颜色(-16777216):显示(self.x+45,self.y+273,floor(bb.好感度)) --好感
			xinzts:置颜色(-16777216):显示(self.x+45,self.y+273+22+6,"100") --饱食
			if bb ~= nil and tp.队伍[1].坐骑~=nil and (tp.队伍[1].坐骑.认证码==bb.认证码 or (tp.队伍[1].坐骑~=nil and tp.队伍[1].坐骑[1]~=nil and bb.认证码==tp.队伍[1].坐骑[1].认证码)) then
				self.xin资源[37]:置文字("下骑")
			else
				self.xin资源[37]:置文字("骑乘")
			end
		end
		if self.xin资源[37]:事件判断() then
			if self.xin资源[37]:取文字()=="骑乘" then
			发送数据(26,{序列=self.选中召唤兽})
			elseif self.xin资源[37]:取文字()=="下骑" then
			发送数据(27,{序列=0})
			end
		elseif self.xin资源[38]:事件判断() then
			tp.窗口.坐骑属性栏:打开()
		elseif self.xin资源[40]:事件判断() then
			if self.选中召唤兽 ~= 0 then
				tp.窗口.坐骑修炼:打开(tp.坐骑列表[self.选中召唤兽].认证码,"修炼")
			end
		elseif self.xin资源[41]:事件判断() then
			if self.选中召唤兽 ~= 0 then
				tp.常规提示:打开("#Y暂无此功能")
			end
		elseif self.xin资源[42]:事件判断() then
			if tp.窗口.祥瑞界面.可视==false then
				tp.窗口.祥瑞界面:打开()
			end
		end
		for m=1,8 do
			if tp.坐骑列表[m + self.加入] ~= nil then
				bw1:置坐标(self.x + 135,self.y + 39 + m * 22)
				if self.选中召唤兽 ~= m + self.加入 then
					if bw1:检查点(x,y) then
						box(self.x + 132,self.y + 39 + m * 22,self.x + 228,self.y + 39 + m * 22 + 22,-3551379)
						if mousea(0) and self.鼠标 then
							self.选中召唤兽 = m + self.加入
							self:置形象()
						end
						self.焦点 = true
					end
				else
					local ys = -10790181
					if bw1:检查点(x,y) then
						ys = -9670988
						self.焦点 = true
					end
					box(self.x + 132,self.y + 39 + m * 22,self.x + 228,self.y + 39 + m * 22 + 22,-3551379)
				end
				if tp.队伍[1].坐骑 ~= nil and tp.队伍[1].坐骑[1] == tp.坐骑列表[m + self.加入].名称 then
					xinzts:置颜色(-256)
				else
					xinzts:置颜色(-16777216)
				end
				xinzts:显示(self.x + 137,self.y + 43 + m * 22,tp.坐骑列表[m + self.加入].名称)
			end
		end
		for i=1,1 do
			self.坐骑装饰[i]:置坐标(self.x+self.装备坐标.x[i]+2,self.y+self.装备坐标.y[i]+65)
			self.坐骑装饰[i]:显示(dt,x,y,self.鼠标)
			if not tp.消息栏焦点 then
				if self.坐骑装饰[i].物品 ~= nil and self.坐骑装饰[i].焦点 then
					tp.提示:道具行囊(x,y,self.坐骑装饰[i].物品)
				end
				if tp.队伍[1].坐骑列表[self.选中召唤兽] ~= nil then
					if tp.场景.抓取物品 == nil and self.坐骑装饰[i].物品 ~= nil and self.坐骑装饰[i].焦点  then
						if mousea(1) then
							发送数据(3747,{类型=self.点击类型,角色="坐骑",道具=i,编号=self.选中召唤兽})
						end
					end
					if self.坐骑装饰[i].事件 then
					end
				end
				if self.坐骑装饰[i].焦点 then
					self.焦点 = true
				end
			end
		end
		if self.动画.主体 ~= nil then
			tp.影子:显示(self.x + 67,self.y + 160)
			self.动画.主体:更新(dt)
			self.动画.主体:显示(self.x + 67,self.y + 160)
			if self.动画.饰品 ~= nil then
				self.动画.饰品:更新(dt)
				self.动画.饰品:显示(self.x + 67,self.y + 160)
			end
		end
	end

	if self.鼠标 then
		if self.xin资源[2]:事件判断() then
			self:打开()
			return false
		elseif self.xin资源[3]:事件判断() then
			for s=1,3 do
				self.召唤兽装备[s]:置物品(nil)
			end
			for n=1,6 do
				self.人物装备[n]:置物品(tp.队伍[1].装备[n])
			end
			self.当前银行 = "现金"
			self.窗口 = "主人公"
			self.选中召唤兽 = 0
			self.加入 = 0
		elseif self.xin资源[4]:事件判断() then
			self.动画 = {}
			for s=1,3 do
				self.召唤兽装备[s]:置物品(nil)
			end
			self.当前银行 = "现金"
			self.窗口 = "召唤兽"
			self.选中召唤兽 = 0
			self.加入 = 0
		elseif self.xin资源[5]:事件判断() then
			self.动画 = {}
			self.窗口 = "坐骑"
			self.选中召唤兽 = 0
			self.加入 = 0
			for s=1,1 do
				self.坐骑装饰[s]:置物品(nil)
			end
		elseif self.xin资源[6]:事件判断() then
			for s=1,3 do
				self.召唤兽装备[s]:置物品(nil)
			end
			self.选中召唤兽 = 0
			self.加入 = 0
			self.动画 = {}
			self.窗口 = "子女"
		elseif self.xin资源[7]:事件判断() then
			if tp.场景.抓取物品 ~= nil and tp.场景.抓取物品ID ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品"  then
				发送数据(3746,{序列=tp.场景.抓取物品ID,放置类型="道具",抓取类型=self.抓取类型})
				self.物品[tp.场景.抓取物品ID].确定 = false
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
			else
				self.开始 = 1
				self.结束 = 20
				发送数据(3699)
				self.点击类型="道具"
			end
		elseif self.xin资源[8]:事件判断() then
			if tp.场景.抓取物品 ~= nil and tp.场景.抓取物品ID ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品"  then
				发送数据(3746,{序列=tp.场景.抓取物品ID,放置类型="行囊",抓取类型=self.抓取类型})
				self.物品[tp.场景.抓取物品ID].确定 = false
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
			else
				self.开始 = 21
				self.结束 = 40
				发送数据(3700)
				self.点击类型="行囊"
				self.Pages=1
			end
		elseif self.xin资源[9]:事件判断() then
			if tp.场景.抓取物品 ~= nil and tp.场景.抓取物品ID ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品"  then
				发送数据(3746,{序列=tp.场景.抓取物品ID,放置类型="任务包裹",抓取类型=self.抓取类型})
				self.物品[tp.场景.抓取物品ID].确定 = false
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
			else
				self.开始 = 41
				self.结束 = 60
				发送数据(3750)
				self.点击类型="任务包裹"
			end
		elseif self.xin资源[17]:事件判断() then
			if self.当前银行 == "现金" then
				self.当前银行 = "储备"
			elseif self.当前银行 == "储备" then
				self.当前银行 = "现金"
			end
		end
	end
end

--------------------------------------------------------------旧界面显示
function 场景类_道具行囊:旧界面显示(dt,x,y)
	self.jiu资源[5]:更新(x,y)
	self.jiu资源[8]:更新(x,y,self.窗口 == "主人公")
	self.jiu资源[9]:更新(x,y,self.加入 > 0)
	self.jiu资源[10]:更新(x,y,(self.窗口 == "召唤兽" and self.加入 <  #tp.队伍[1].宝宝列表 - 4) or (self.窗口 == "子女" and self.加入 <  #tp.队伍[1].子女列表 - 4))
	self.jiu资源[11]:更新(x,y, not (self.点击类型=="道具")and tp.窗口.符石镶嵌.可视 == false,2)
	self.jiu资源[12]:更新(x,y, not (self.点击类型=="行囊")and tp.窗口.符石镶嵌.可视 == false,2)
	self.法宝按钮:更新(x,y, not (self.点击类型=="法宝")and tp.窗口.符石镶嵌.可视 == false,2)
	self.任务按钮:更新(x,y, not (self.点击类型=="任务包裹")and tp.窗口.符石镶嵌.可视 == false,2)
	self.仓库按钮:更新(x,y)
	self.出售按钮:更新(x,y)
	self.锁图标:更新(x,y)


	if self.仓库按钮:是否选中(x,y)  then
		tp.提示:自定义(x+10,y+10,"快捷键：ALT+V")
	end

	if self.鼠标 and not tp.战斗中 then
		if self.jiu资源[5]:事件判断() then
			self:打开()
			return false
		elseif self.jiu资源[8]:事件判断() then
			if self.当前银行 == "现金" then
				self.当前银行 = "储备"
			elseif self.当前银行 == "储备" then
				self.当前银行 = "现金"
			end
		elseif self.jiu资源[9]:事件判断() then
			self.加入 = self.加入 - 1
		elseif self.jiu资源[10]:事件判断() then
			self.加入 = self.加入 + 1
		elseif self.jiu资源[11]:事件判断() then --11道具
			if tp.场景.抓取物品 ~= nil and tp.场景.抓取物品ID ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品"  then
				发送数据(3746,{序列=tp.场景.抓取物品ID,放置类型="道具",抓取类型=self.抓取类型})
				self.物品[tp.场景.抓取物品ID].确定 = false
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
			else
				self.开始 = 1
				self.结束 = 20
				发送数据(3699)
				self.点击类型="道具"
				self.Pages=1
			end
		elseif self.jiu资源[12]:事件判断() then --12行囊
			if tp.场景.抓取物品 ~= nil and tp.场景.抓取物品ID ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品"  then
				发送数据(3746,{序列=tp.场景.抓取物品ID,放置类型="行囊",抓取类型=self.抓取类型})
				self.物品[tp.场景.抓取物品ID].确定 = false
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
			else
				self.开始 = 21
				self.结束 = 40
				发送数据(3700)
				self.点击类型="行囊"
				self.Pages=1
			end
			elseif self.法宝按钮:事件判断() then
				if tp.场景.抓取物品 ~= nil and tp.场景.抓取物品ID ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品" and tp.场景.抓取物品.总类 == 1000 then
				发送数据(3746,{序列=tp.场景.抓取物品ID,放置类型="法宝",抓取类型=self.抓取类型})
				self.物品[tp.场景.抓取物品ID].确定 = false
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
			elseif tp.场景.抓取物品 == nil then
				tp.窗口.法宝:打开()
				发送数据(3732)
			else
				tp.常规提示:打开("#Y/不是什么东西都可以放到法宝里的")
			end
		elseif self.仓库按钮:事件判断() then -- if keyaz(KEY.SHIFT) == false then
			发送数据(3832,{序列=1})
		elseif self.任务按钮:事件判断() then
			if tp.场景.抓取物品 ~= nil and tp.场景.抓取物品ID ~= nil and tp.场景.抓取物品注释 == "道具行囊_物品"  then
				发送数据(3746,{序列=tp.场景.抓取物品ID,放置类型="任务包裹",抓取类型=self.抓取类型})
				self.物品[tp.场景.抓取物品ID].确定 = false
				tp.场景.抓取物品 = nil
				tp.场景.抓取物品ID = nil
				tp.场景.抓取物品注释 = nil
			else
				self.开始 = 41
				self.结束 = 60
				发送数据(3750)
				self.点击类型="任务包裹"
			end
		elseif self.jiu资源[38]:事件判断() then
			self.人物装备窗口=1
			if tp.窗口.锦衣.可视 then
				tp.窗口.锦衣.可视 = false
			elseif tp.窗口.灵饰.可视 then
				tp.窗口.灵饰.可视 = false
			end
		elseif self.出售按钮:事件判断() then --，也可通过鼠标左键抓取拖拽实现出售 tp.场景.抓取物品==nil and
			tp.窗口.对话栏:文本("","","出售道具栏特定物品，该功能出售的物品无法恢复！请谨慎操作！”",{"一键出售","我点错了"}, nil, {page=self.Pages, type=self.点击类型})
		end
	end

	self.jiu资源[1]:显示(self.x,self.y)
	self.jiu资源[11]:显示(self.x + 18-5,self.y + 410,nil,true,nil,self.点击类型=="道具",2) --道具
	self.jiu资源[12]:显示(self.x + 59,self.y + 410,nil,true,nil,self.点击类型=="行囊",2) --行囊
	self.任务按钮:显示(self.x + 105,self.y + 410,nil,true,nil,self.点击类型=="任务包裹",2)--任务
	self.法宝按钮:显示(self.x + 151,self.y + 410,nil,true,nil,self.点击类型=="法宝",2)  --法宝
	self.仓库按钮:显示(self.x + 197,self.y + 410,nil,true)--仓库
	self.出售按钮:显示(self.x + 243,self.y + 410,nil,true)--加锁
	self.锁图标:显示(self.x + 288,self.y + 410,nil,true)--加锁
	self.jiu资源[38]:更新(x,y)
	self.jiu资源[39]:更新(x,y)
	self.jiu资源[38]:显示(self.x + 170,floor(self.y + 1 * 23.5),nil,true,nil,self.人物装备窗口==1,2)--装备1
	self.jiu资源[39]:显示(self.x + 170,floor(self.y + 2 * 23.5),nil,true,nil,self.人物装备窗口==2,2)--装备2
	    if self.窗口 == "主人公" then
		self.jiu资源[2]:显示(self.x-1,self.y + 22)
		self.jiu资源[4]:显示(self.x + 38,self.y + 21)
		self.jiu资源[8]:置文字(self.当前银行)
		self.jiu资源[8]:显示(self.x + 5,self.y + 147,nil,true)
		self.jiu资源[40]:更新(x,y,not tp.窗口.锦衣.可视)
		self.jiu资源[41]:更新(x,y,not tp.窗口.灵饰.可视)
		self.jiu资源[109]:更新(x,y,self.套装激活==1,1)
		self.jiu资源[53]:更新(x,y)
		self.jiu资源[55]:更新(x,y)
		self.jiu资源[82]:更新(x,y)
		if self.jiu资源[40]:事件判断() then
			tp.窗口.锦衣:打开(self.x+312,self.y+156)
		elseif self.jiu资源[41]:事件判断() then
			tp.窗口.灵饰:打开(self.x+312,self.y+1)
		elseif self.jiu资源[82]:事件判断() then
			if self.点击类型 ~= "道具" then
				tp.常规提示:打开("#Y/只有背包道具才可进行拆分")
			elseif tp.场景.抓取物品 == nil  then
        	  tp.拆分开关=true
	          tp.鼠标.置鼠标("拆分")
	          tp.常规提示:打开("#Y/您现在可以点击包裹内的物品进行拆分")
	    	else
	    	  tp.常规提示:打开("#Y/请取消现在所抓取的物品")
            end
		elseif self.jiu资源[53]:事件判断() then
			if tp.窗口.仓库类.可视 then
				tp.窗口.仓库类:打开()
			else
				发送数据(6701)
			end
		elseif self.jiu资源[54]:是否选中(x,y) then
		elseif self.jiu资源[55]:事件判断(x,y) then
			发送数据(3815,{类型=self.点击类型})
		end
		for s=1,1 do
			self.jiu资源[37+s]:更新(x,y)   --38 39 40 41 55 53 82
			self.jiu资源[37+s]:显示(self.x + 170,floor(self.y + s * 23.5),nil,true)
		end
		self.jiu资源[40]:显示(self.x + 170,floor(self.y + 3 * 23.5),nil,true,nil,tp.窗口.锦衣.可视,2)--法宝
		self.jiu资源[41]:显示(self.x + 170,self.y + 4 * 23.5,nil,true,nil,tp.窗口.灵饰.可视,2)--灵饰
		self.jiu资源[55]:显示(self.x + 170,self.y + 5 * 23.5,nil,true,nil,tp.窗口.灵饰.可视,2)--灵饰
		self.jiu资源[53]:显示(self.x + 170,floor(self.y + 2 * 23.5),nil,true,nil,self.人物装备窗口==3,2)--装备3
		self.jiu资源[55]:显示(self.x + 170,floor(self.y + 5 * 23.5),nil,true,nil,nil,2)--装备3
        self.jiu资源[82]:显示(self.x + 170,self.y + 6 * 23.5,nil,true)
	    self.jiu资源[109]:显示(self.x + 170,self.y + 7 *  23.5)
        if self.jiu资源[109]:是否选中(x,y) and self.套装名称~=nil then
        	if self.套装名称[2]~=nil then
        tp.提示:自定义(x-42,y+27,"#Y套装效果:#G"..self.套装名称[2] )
        end
      end
		if self.点击类型=="道具" then
		    for i=1,4 do
		        self.jiu资源[100+i]:更新(x,y,self.Pages~=i)
    		    self.jiu资源[100+i]:显示(self.x + 283,floor(self.y + 200+(i-1)*50),nil,nil,true,self.Pages==i,2)
                if self.jiu资源[100+i]:事件判断() then
                self.Pages=i
                发送数据(3699)
                end
            end
		end
		for i=1,6 do
			local 补差高度=3
			if i~=3 and i ~= 4 then
				补差高度=1
			end
			if self.人物装备窗口 == 1 then
				self.人物装备[i]:置坐标(self.x+self.装备坐标.x[i]+2,self.y+self.装备坐标.y[i]-补差高度,nil,nil,4,-1)
				self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,3)
			end
			if self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then
				tp.提示:道具行囊(x,y,self.人物装备[i].物品)
			end
			if self.人物装备[i].焦点 then
				self.焦点 = true
			end
			if not tp.消息栏焦点 then
				if tp.场景.抓取物品 == nil and self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点   then
					if mousea(1) then
						发送数据(3704,{类型=self.点击类型,角色="主角",道具=i})
					end
				end
				-- 事件开始
				if self.人物装备[i].事件 then--鼠标左键点击人物装备会自动下装备
					if self.人物装备[i].焦点 and tp.场景.抓取物品 == nil and self.人物装备[i].物品 ~= nil then--鼠标 我等于空
						if 引擎.鼠标弹起 then
						end
					elseif  tp.场景.抓取物品 ~= nil and self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then-- 鼠标带物品的
						if 引擎.鼠标弹起 then
							self.物品[tp.场景.抓取物品ID].确定 = false
							发送数据(3703,{类型=self.点击类型,角色="主角",道具=tp.场景.抓取物品ID})
						end
					end
				end
			-- 事件结束
			end
		end
		local jq
		if self.当前银行 == "现金" then
			jq = tp.金钱
		elseif self.当前银行 == "储备" then
			jq = tp.储备
		-- elseif self.当前银行 == "积分" then
		-- 	jq = tp.积分
		end
		jiuzts:置颜色(qjq(jq))
		jiuzts:显示(self.x + 65,self.y + 153,jq)
		jiuzts:置颜色(qjq(tp.存银))
		jiuzts:显示(self.x + 65,self.y + 174,tp.存银)
	elseif self.窗口 == "召唤兽" or self.窗口 == "子女" then
		if self.窗口 == "召唤兽" then
			self.jiu资源[3]:显示(self.x,self.y+22)
		elseif self.窗口 == "子女" then
			self.jiu资源[35]:显示(self.x,self.y+22)
			self.jiu资源[36]:更新(x,y,tp.队伍[1].子女列表[self.选中召唤兽] ~= nil)
			self.jiu资源[37]:更新(x,y,tp.队伍[1].子女列表[self.选中召唤兽] ~= nil)
			self.jiu资源[36]:显示(self.x+180,self.y+145,nil,true)
			self.jiu资源[37]:显示(self.x+240,self.y+145,nil,true)
			-- if self.jiu资源[36]:事件判断() then
			-- 	tp.窗口.召唤兽查看栏:打开(tp.队伍[1].子女列表[self.选中召唤兽])
			-- end
		end
		self.jiu资源[9]:显示(self.x + 289,self.y + 23,true)
		self.jiu资源[10]:显示(self.x + 285,self.y + 115,true)
		local 列表 = 0
		jiuzts:置颜色(-16777216)
		local dxs = nil
		if self.窗口 == "召唤兽" then
			dxs = tp.队伍[1].宝宝列表
		else
			dxs = tp.队伍[1].子女列表
		end
		for m=1,4 do
			if dxs[m + self.加入] ~= nil then
				bw:置坐标(self.x + 182,self.y + 24 + m * 23)
				if self.选中召唤兽 ~= m + self.加入 then
					if bw:检查点(x,y) then
						tp.禁止关闭 = true
						box(self.x + 179,self.y + 24 + m * 22,self.x + 283,self.y + 24 + m * 22 + 22,-3551379)
						if mousea(0) and self.鼠标 then
							self.选中召唤兽 = m + self.加入
							self:置形象()
						end
						self.焦点 = true
					end
				else
					local ys = -10790181
					if bw:检查点(x,y) then
						tp.禁止关闭 = true
						ys = -9670988
						self.焦点 = true
						if 引擎.鼠标弹起(右键) then
							tp.窗口.召唤兽查看栏:打开(tp.队伍[1].宝宝列表[m + self.加入])
						end
					end
					box(self.x + 179,self.y + 24 + m * 22,self.x + 283,self.y + 24 + m * 22 + 22,ys)
				end
				jiuzts:显示(self.x + 182,self.y + 27 + m * 23,dxs[m + self.加入].名称)
			end
		end
		if self.窗口 == "召唤兽" and dxs[self.选中召唤兽] ~= nil then
			jiuzts:显示(self.x + 209,self.y + 152 ,format("%s/%s",tp.队伍[1].宝宝列表[self.选中召唤兽].气血,tp.队伍[1].宝宝列表[self.选中召唤兽].最大气血))
			jiuzts:显示(self.x + 209,self.y + 172 ,format("%s/%s",tp.队伍[1].宝宝列表[self.选中召唤兽].魔法,tp.队伍[1].宝宝列表[self.选中召唤兽].最大魔法))
		end
		if self.动画.主体 ~= nil then
			tp.影子:显示(self.x + 98,self.y + 115)
			self.动画.主体:更新(dt)
			self.动画.主体:显示(self.x + 98,self.y + 115)
			if self.动画.身体 ~= nil then
				self.动画.身体:更新(dt)
				self.动画.身体:显示(self.x + 98,self.y + 115)
			end
			if self.动画.饰品 ~= nil then
				self.动画.饰品:更新(dt)
				self.动画.饰品:显示(self.x + 98,self.y + 115)
			end
		end
		for i=1,3 do
			self.召唤兽装备[i]:置坐标(self.x+self.装备坐标.xx[i]+3,self.y+self.装备坐标.yy[i]-2)
			self.召唤兽装备[i]:显示(dt,x,y,self.鼠标)
			if not tp.消息栏焦点 then
				if self.召唤兽装备[i].物品 ~= nil and self.召唤兽装备[i].焦点 then
					tp.提示:道具行囊(x,y,self.召唤兽装备[i].物品)
				end
				if tp.队伍[1].宝宝列表[self.选中召唤兽] ~= nil then
					if tp.场景.抓取物品 == nil and self.召唤兽装备[i].物品 ~= nil and self.召唤兽装备[i].焦点  then
						if mousea(1) then

							发送数据(3709,{类型=self.点击类型,角色="bb",道具=i,编号=self.选中召唤兽})
						end
					end
					if self.召唤兽装备[i].事件 then
					end
				end
				if self.召唤兽装备[i].焦点 then
					self.焦点 = true
				end
			end
		end
	elseif self.窗口 == "坐骑" then
		self.jiu资源[34]:显示(self.x,self.y + 25)
		self.jiu资源[42]:更新(x,y,self.选中召唤兽 ~= 0 )
		self.jiu资源[43]:更新(x,y)
		self.jiu资源[108]:更新(x,y) --玄灵珠
		if self.玄灵珠.类型~=nil and self.玄灵珠模型~=nil and self.玄灵珠模型.物品~=nil and self.玄灵珠.等级~=nil then
			self.玄灵珠模型:置坐标(self.x + 42,self.y + 130)
			self.玄灵珠模型:显示(dt,x,y,self.鼠标)
			if self.玄灵珠模型.焦点 and not tp.消息栏焦点 then
				tp.提示:道具行囊(x,y,self.玄灵珠模型.物品)
                self.焦点 = true
			end
			jiuzts:置颜色(白色):显示(self.x + 111,self.y + 136,self.玄灵珠.等级 .."级" ..self.玄灵珠.类型)
		end
		if self.选中召唤兽 ~= 0 and tp.坐骑列表 ~=nil and tp.坐骑列表[self.选中召唤兽] ~=nil then
			local bb = tp.坐骑列表[self.选中召唤兽]
			if bb ~= nil and tp.队伍[1].坐骑~=nil and (tp.队伍[1].坐骑.认证码==bb.认证码 or (tp.队伍[1].坐骑~=nil and tp.队伍[1].坐骑[1]~=nil and bb.认证码==tp.队伍[1].坐骑[1].认证码)) then
				self.jiu资源[42]:置文字("下骑")
			else
				self.jiu资源[42]:置文字("骑乘")
			end
		end
		if self.jiu资源[42]:事件判断() then
			if self.jiu资源[42]:取文字()=="骑乘" then
				发送数据(26,{序列=self.选中召唤兽})
			elseif self.jiu资源[42]:取文字()=="下骑" then
				发送数据(27,{序列=0})
			end
		elseif self.jiu资源[43]:事件判断() then
			tp.窗口.坐骑属性栏:打开()
		end
		self.jiu资源[42]:显示(self.x+240,self.y+131,nil,true)
		self.jiu资源[43]:显示(self.x+240,self.y+161,nil,true)
		self.jiu资源[108]:显示(self.x+115,self.y+161,nil,true)
		for m=1,4 do
			if tp.坐骑列表[m + self.加入] ~= nil then
				bw1:置坐标(self.x + 184,self.y + 37 + m * 18)
				if self.选中召唤兽 ~= m + self.加入 then
					if bw1:检查点(x,y) then
						box(self.x + 184,self.y + 37 + m * 18,self.x + 285,self.y + 37 + m * 18 + 17,-3551379)
						if mousea(0) and self.鼠标 then
							self.选中召唤兽 = m + self.加入
							self:置形象()
						end
						self.焦点 = true
					end
				else
					local ys = -10790181
					if bw1:检查点(x,y) then
						ys = -9670988
						self.焦点 = true
					end
					box(self.x + 184,self.y + 37 + m * 18,self.x + 285,self.y + 37 + m * 18 + 17,ys)
				end
				if tp.队伍[1].坐骑 ~= nil and tp.队伍[1].坐骑[1] == tp.坐骑列表[m + self.加入].名称 then
					jiuzts:置颜色(-256)
				else
					jiuzts:置颜色(-16777216)
				end
				jiuzts:显示(self.x + 189,self.y + 38 + m * 18,tp.坐骑列表[m + self.加入].名称)
			end
		end
		for i=1,1 do
			self.坐骑装饰[i]:置坐标(self.x+self.装备坐标.xx[i]+176,self.y+self.装备坐标.yy[i]-15)
			self.坐骑装饰[i]:显示(dt,x,y,self.鼠标)
			if not tp.消息栏焦点 then
				if self.坐骑装饰[i].物品 ~= nil and self.坐骑装饰[i].焦点 then
					tp.提示:道具行囊(x,y,self.坐骑装饰[i].物品)
				end
				if tp.队伍[1].坐骑列表[self.选中召唤兽] ~= nil then
					if tp.场景.抓取物品 == nil and self.坐骑装饰[i].物品 ~= nil and self.坐骑装饰[i].焦点  then
						if mousea(1) then
							发送数据(3747,{类型=self.点击类型,角色="坐骑",道具=i,编号=self.选中召唤兽})
						end
					end
					if self.坐骑装饰[i].事件 then
					end
				end
				if self.坐骑装饰[i].焦点 then
					self.焦点 = true
				end
			end
		end
		if self.动画.主体 ~= nil then
			tp.影子:显示(self.x + 112,self.y + 108)
			self.动画.主体:更新(dt)
			self.动画.主体:显示(self.x + 112,self.y + 108+self.坐骑偏移.y)
			if self.动画.饰品 ~= nil then
				self.动画.饰品:更新(dt)
				self.动画.饰品:显示(self.x + 112,self.y + 108)
			end
		end
	end
	if self.鼠标 then
		if self.jiu资源[6]:事件判断() then
			-- local n = qtxs(tp.队伍[1].模型)
			-- self.jiu资源[4] = tp.资源:载入(n[7],"网易WDF动画",n[3])
			for s=1,3 do
				self.召唤兽装备[s]:置物品(nil)
			end
			for n=1,6 do
				self.人物装备[n]:置物品(tp.队伍[1].装备[n])
			end
			self.当前银行 = "现金"
			self.窗口 = "主人公"
			self.选中召唤兽 = 0
			self.加入 = 0
		elseif self.jiu资源[7]:事件判断() then
			self.动画 = {}
			for s=1,3 do
				self.召唤兽装备[s]:置物品(nil)
			end
			self.当前银行 = "现金"
			self.窗口 = "召唤兽"
			self.选中召唤兽 = 0
			self.加入 = 0
		elseif self.jiu资源[30]:事件判断() then
			self.动画 = {}
			self.窗口 = "坐骑"
		elseif self.jiu资源[31]:事件判断() then
			-- self.jiu资源[4] = nil
			for s=1,3 do
				self.召唤兽装备[s]:置物品(nil)
			end
			self.选中召唤兽 = 0
			self.加入 = 0
			self.动画 = {}
			self.窗口 = "子女"
		elseif self.jiu资源[108]:事件判断() then
			发送数据(451) --玄灵珠切换
		end
	end
	if self.窗口~="法宝" then
		self.jiu资源[6]:更新(x,y,self.窗口 ~= "主人公")
		self.jiu资源[7]:更新(x,y,self.窗口 ~= "召唤兽")
		self.jiu资源[30]:更新(x,y,self.窗口 ~= "坐骑")
		self.jiu资源[31]:更新(x,y,self.窗口 ~= "子女")
		self.jiu资源[6]:显示(self.x+2,self.y + 28,nil,true,nil,self.窗口 == "主人公",2)
		self.jiu资源[7]:显示(self.x+2,self.y + 57,nil,true,nil,self.窗口 == "召唤兽",2)
		self.jiu资源[30]:显示(self.x+2,self.y + 84,nil,true,nil,self.窗口 == "坐骑",2)
		self.jiu资源[31]:显示(self.x+2,self.y + 111,nil,true,nil,self.窗口 == "子女",2)
	end
	self.jiu资源[5]:显示(self.x + 291,self.y + 6,true)
	xinzts:置颜色(-256):显示(self.x + 20,self.y + 435,"点击鼠标左键抓取物品，鼠标右键使用物品")
end

-------------------------------------------------------------
function 场景类_道具行囊:刷新装备()
	--self.人物装备={}
	for i=1,6 do
		self.人物装备[i]:置物品(nil)
		self.人物装备[i]:置物品(tp.队伍[1].装备[i])
	end
	if self.新界面 and self.窗口 =="主人公" then--引擎.场景.窗口.道具行囊.可视 and 引擎.场景.窗口.道具行囊.窗口 =="主人公" then
		self:取人物形象()
	end
end

function 场景类_道具行囊:置形象()
	if self.窗口 == "召唤兽" then
		self.动画 = {}
		if self.选中召唤兽 ~= 0 and tp.队伍[1].宝宝列表[self.选中召唤兽]  ~= nil then
			local n = qzdmx(tp.队伍[1].宝宝列表[self.选中召唤兽].模型)
			self.动画.主体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			n = qzdmx(tp.队伍[1].宝宝列表[self.选中召唤兽].模型.."_身体")
			if n[6]~=nil then
				self.动画.身体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			end
			if tp.队伍[1].宝宝列表[self.选中召唤兽].饰品 ~= nil then
				n = qzdmx(tp.队伍[1].宝宝列表[self.选中召唤兽].模型.."_饰品")
				if n[6]~=nil then
					self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
					self.动画.饰品:置颜色(tp.队伍[1].宝宝列表[self.选中召唤兽].饰品颜色,-1)
				end
			else
				n = qzdmx(tp.队伍[1].宝宝列表[self.选中召唤兽].模型.."_装饰")
				if n[6]~=nil then
					self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				end
			end
			if tp.队伍[1].宝宝列表[self.选中召唤兽].炫彩 ~= nil then
				self.动画.主体:炫彩染色(tp.队伍[1].宝宝列表[self.选中召唤兽].炫彩,tp.队伍[1].宝宝列表[self.选中召唤兽].炫彩组)
				if self.动画.身体 ~= nil then
					self.动画.身体:炫彩染色(tp.队伍[1].宝宝列表[self.选中召唤兽].炫彩,tp.队伍[1].宝宝列表[self.选中召唤兽].炫彩组)
				end
			else
				if tp.队伍[1].宝宝列表[self.选中召唤兽].染色方案 ~= nil then
					self.动画.主体:置染色(tp.队伍[1].宝宝列表[self.选中召唤兽].染色方案,tp.队伍[1].宝宝列表[self.选中召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.选中召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.选中召唤兽].染色组[3])
					self.动画.主体:置方向(0)
					if self.动画.身体 ~= nil then
						self.动画.身体:置染色(tp.队伍[1].宝宝列表[self.选中召唤兽].染色方案,tp.队伍[1].宝宝列表[self.选中召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.选中召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.选中召唤兽].染色组[3])
						self.动画.身体:置方向(0)
					end
				end
			end
			for i=1,3 do
				self.召唤兽装备[i]:置物品(tp.队伍[1].宝宝列表[self.选中召唤兽].装备[i])
			end
		end
	elseif self.窗口 == "子女" then
		self.动画 = {}
		if self.选中召唤兽 ~= 0 and tp.队伍[1].子女列表[self.选中召唤兽]  ~= nil then
			local n = qzdmx(tp.队伍[1].子女列表[self.选中召唤兽].模型)
			self.动画.主体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			if tp.队伍[1].子女列表[self.选中召唤兽].饰品 ~= nil then
				n = qzdmx(tp.队伍[1].子女列表[self.选中召唤兽].模型.."_饰品")
				if n[6]~=nil then
					self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				end
			else
				n = qzdmx(tp.队伍[1].子女列表[self.选中召唤兽].模型.."_装饰")
				if n[6]~=nil then
					self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				end

			end
			n = qzdmx(tp.队伍[1].子女列表[self.选中召唤兽].模型)
			if tp.队伍[1].子女列表[self.选中召唤兽].染色方案 ~= nil then
				self.动画.主体:置染色(tp.队伍[1].子女列表[self.选中召唤兽].染色方案,tp.队伍[1].子女列表[self.选中召唤兽].染色组[1],tp.队伍[1].子女列表[self.选中召唤兽].染色组[2],tp.队伍[1].子女列表[self.选中召唤兽].染色组[3])
				self.动画.主体:置方向(0)
			end
			for i=1,3 do
				self.召唤兽装备[i]:置物品(tp.队伍[1].子女列表[self.选中召唤兽].装备[i])
			end
		end
	elseif self.窗口 == "坐骑" then
		if tp.队伍[1].模型=="影精灵" and tp.坐骑列表[self.选中召唤兽].模型=="魔力斗兽" then return end
		self.动画 = {}
		if self.选中召唤兽 ~= 0 and tp.坐骑列表[self.选中召唤兽]  ~= nil then
			if tp.坐骑列表[self.选中召唤兽].模型=="闲云野鹤" or tp.坐骑列表[self.选中召唤兽].模型=="宝贝葫芦" then
				self.坐骑偏移.y = 30
			else
				self.坐骑偏移.y = 0
			end
			local n = zqj(tp.队伍[1].模型,tp.坐骑列表[self.选中召唤兽].模型,tp.坐骑列表[self.选中召唤兽].饰品 or "空",tp.坐骑列表[self.选中召唤兽].饰品2 or "空")
			self.动画.主体 = tp.资源:载入(n.坐骑资源,"网易WDF动画",n.坐骑站立)
			if tp.坐骑列表[self.选中召唤兽].饰品 ~= nil then
				self.动画.饰品 = tp.资源:载入(n.坐骑饰品资源,"网易WDF动画",n.坐骑饰品站立)
			end
		end
		for i=1,1 do
			self.坐骑装饰[i]:置物品(tp.坐骑列表[self.选中召唤兽].饰品)
		end
	end
end

function 场景类_道具行囊:刷新好感度(ss)
	if self.窗口 == "坐骑" then
		if self.选中召唤兽 ~= 0 and tp.坐骑列表[self.选中召唤兽]  ~= nil then
			if tp.坐骑列表[self.选中召唤兽].认证码==ss.rzm then
				tp.坐骑列表[self.选中召唤兽].好感度=ss.hgd
			end
		end
	end
end

function 场景类_道具行囊:刷新道具(ss)
	for q=1,80 do
		self.物品[q]:置物品(ss[q])
	end
end

function 场景类_道具行囊:刷新()
	-- if self.窗口 == "主人公" then
	-- 	local n = qtxs(tp.队伍[1].模型)
	-- 	self.jiu资源[4] = tp.资源:载入(n[7],"网易WDF动画",n[3])
	-- 	for n=1,6 do
	-- 		self.人物装备[n]:置物品(tp.队伍[1].装备[n])
	-- 	end
	-- elseif self.窗口 == "召唤兽" then
	-- 	self.选中召唤兽 = 0
	-- 	self.加入 = 0
	-- 	for n=1,3 do
	-- 		self.召唤兽装备[n]:置物品(nil)
	-- 	end
	-- end
end

function 场景类_道具行囊:刷新灵饰()
	if self.新界面 then
		for i=1,4 do
			self.灵饰[i]:置物品(nil)
			if tp.队伍[1].灵饰[i] ~= nil and  tp.队伍[1].灵饰[i].名称 ~= nil then
				self.灵饰[i]:置物品(tp.队伍[1].灵饰[i],nil,nil,nil,1)
			end
		end
	else
		if 引擎.场景.窗口.灵饰.可视 then
			引擎.场景.窗口.灵饰:刷新()
		end
	end
end

function 场景类_道具行囊:可装备(i1,i2)
	if i2 > 6 and self.窗口 == "主人公" then
		tp.常规提示:打开("#Y/该装备与你的种族不符")
		return false
	elseif i2 < 6 and self.窗口 == "召唤兽" then
		tp.常规提示:打开("#Y/召唤兽不能穿戴该装备")
		return false
	end
	if i1.总类 ~= 2 then
		tp.常规提示:打开("#Y/这个物品不可以装备")
		return false
	end
	if i1 ~= nil and i1.分类 == i2 then
		if i2 == 1 or i2 == 4 then
			if i1.性别限制 ~= 0 and i1.性别限制 == tp.队伍[1].性别 then
					if (i1.级别限制 == 0 or i1.特效 == "无级别限制" or tp.队伍[1].等级 >= i1.级别限制) then
						return true
					else
					if tp.队伍[1].等级 < i1.级别限制 then
						tp.常规提示:打开("#Y/你的等级不够呀")
					end
				end
			else
				tp.常规提示:打开("#Y/该装备您无法使用呀")
			end
		elseif i2 == 2 or i2 == 5 or i2 == 6 then
			if (i1.级别限制 == 0 or i1.特效 == "无级别限制" or tp.队伍[1].等级 >= i1.级别限制) then
				return true
			else
				if i1.级别限制 > tonumber(tp.队伍[1].等级) then
					tp.常规提示:打开("#Y/你的等级不够呀")
				end
			end
		elseif i2 == 3 then
			if i1.角色限制 ~= 0 and (i1.角色限制[1] == tp.队伍[1].模型 or i1.角色限制[2] == tp.队伍[1].模型) then
					if (i1.级别限制 == 0 or i1.特效 == "无级别限制" or tp.队伍[1].等级 >= i1.级别限制) then
						return true
					else
					if tp.队伍[1].等级 < i1.级别限制 then
						tp.常规提示:打开("#Y/你的等级不够呀")
					end
				end
			else
				tp.常规提示:打开("#Y/该装备您无法使用呀")
			end
		end
	end
	return false
end

function 场景类_道具行囊:召唤兽可装备(i1,i2)
	if i1 ~= nil and i1.分类 - 6 == i2 then
		if (i1.级别限制 == 0 or i1.特效 == "无级别限制" or tp.队伍[1].宝宝列表[self.选中召唤兽].等级 >= i1.级别限制) then
			return true
		else
			if i1.级别限制 > tp.队伍[1].宝宝列表[self.选中召唤兽].等级 then
				tp.常规提示:打开("#Y/你的召唤兽等级不足哦")
			end
		end
	end
	return false
end

function 物品判断(道具,数量,失去)
	local a = false
	for n=1,160 do
		if tp.道具列表[n] ~= nil and tp.道具列表[n].名称 == 道具 and tp.道具列表[n].数量 >= (数量 or 1) then
			if 失去 ~= nil then
				if not tp.道具列表[n].可叠加 then
					tp.道具列表[n] = nil
				else
					tp.道具列表[n].数量 = tp.道具列表[n].数量 - 数量
					if tp.道具列表[n].数量 <= 0 then
						tp.道具列表[n] = nil
					end
				end
				if tp.窗口.道具行囊.可视 then
					tp.窗口.道具行囊.物品[n]:置物品(tp.道具列表[n])
				end
				刷新道具逻辑(tp.道具列表[n],n,true)
			end
			a = true
			break
		end
	end
	return a
end

function 物品失去(道具,数量)
	local sq = 0
	for n=1,160 do
		if tp.道具列表[n] ~= nil and tp.道具列表[n].名称 == 道具 then
			if 数量 == nil then -- nil为全部失去
				sq = tp.道具列表[n].数量
				if sq == nil or sq <= 0 then
					sq = 1
				end
				tp.道具列表[n] = nil
			else
				sq = 数量
				if tp.道具列表[n].数量 == nil or tp.道具列表[n].数量 <= 0 then
					tp.道具列表[n].数量 = 1
				end
				if sq >= tp.道具列表[n].数量 then
					sq = tp.道具列表[n].数量
				end
				tp.道具列表[n].数量 = tp.道具列表[n].数量 - sq
				if tp.道具列表[n].数量 <= 0 then
					tp.道具列表[n] = nil
				end
			end
			if tp.窗口.道具行囊.可视 then
			   tp.窗口.道具行囊.物品[n]:置物品(tp.道具列表[n])
			end
			刷新道具逻辑(tp.道具列表[n],n,true)
			break
		end
	end
	return sq
end

function 取指定物品数量(道具)
	local sq = 0
	for n=1,160 do
		if tp.道具列表[n] ~= nil and tp.道具列表[n].名称 == 道具 then
			sq = tp.道具列表[n].数量 or 1
			if sq <= 0 then
				sq = 1
			end
			break
		end
	end
	return sq
end

function 取物品数量()
	local sl = 0
	for i=1,160 do
		if tp.道具列表[i] ~= nil then
			sl = sl + 1
		end
	end
	return sl
end

function 增加物品(名称,打造,数量)
	if 名称 == "" or 名称 == nil then
		return false
	end
	if 数量 == nil then
		数量= 1
	end
	if 取物品数量() == 160 then
		tp.常规提示:打开("#Y/少侠您的包裹已满，请及时清理")
	else
		local 物品 = nil
		if type(名称) == "table" then
			物品 = 名称
		else
			local item = tp._物品.创建()
			item:置对象(名称,打造,数量)
			物品 = item
		end
		if 物品.数量 == nil then
			物品.数量 = 1
		end
		if 物品.数量 <= 0 then
			物品.数量 = 1
		end
		-- 判断是否为数组
		local sx = 0
		local xt = false
		if 物品.可叠加 ~= nil and 物品.可叠加 ~= false then
			物品.数量 = 数量
			for s=1,160 do
				if tp.道具列表[s] ~= nil and tp.道具列表[s].名称 == 物品.名称 then
					sx = s
					xt = true
					break
				end
			end
		end
		if xt == false then
			for n=1,160 do
				if tp.道具列表[n] == nil then
					tp.道具列表[n] = 物品
					sx = n
					if tp.窗口.道具行囊.可视 then
						tp.窗口.道具行囊.物品[sx]:置物品(物品)
					end
					break
				end
			end
		else
			if tp.道具列表[sx].数量 < 10000 then
				物品 = nil
				tp.道具列表[sx].数量 = tp.道具列表[sx].数量 + 数量
			else
				tp.常规提示:打开("#Y/超出物品上限无法获得")
			end
		end
		刷新道具逻辑(tp.道具列表[sx],sx)
	end
	return true
end

function 复制物品(物品)
	local 道具数据 = tp._物品()
	道具数据:置对象(物品.名称)
	道具数据.总类 = 物品.总类
	道具数据.分类 = 物品.分类
	道具数据.子类 = 物品.子类
	if 物品.伤害 ~= nil then
		道具数据.伤害 = 物品.伤害
	end
	if 物品.气血 ~= nil then
		道具数据.气血 = 物品.气血
	end
	if 物品.魔法 ~= nil then
		道具数据.魔法 = 物品.魔法
	end
	if 物品.愤怒 ~= nil then
		道具数据.愤怒 = 物品.愤怒
	end
	if 物品.体力 ~= nil then
		道具数据.体力 = 物品.体力
	end
	if 物品.活力 ~= nil then
		道具数据.活力 = 物品.活力
	end
	if 物品.命中 ~= nil then
		道具数据.命中 = 物品.命中
	end
	if 物品.伤害 ~= nil then
		道具数据.伤害 = 物品.伤害
	end
	if 物品.防御 ~= nil then
		道具数据.防御 = 物品.防御
	end
	if 物品.速度 ~= nil then
		道具数据.速度 = 物品.速度
	end
	if 物品.躲避 ~= nil then
		道具数据.躲避 = 物品.躲避
	end
	if 物品.灵力 ~= nil then
		道具数据.灵力 = 物品.灵力
	end
	if 物品.体质 ~= nil then
		道具数据.体质 = 物品.体质
	end
	if 物品.魔力 ~= nil then
		道具数据.魔力 = 物品.魔力
	end
	if 物品.力量 ~= nil then
		道具数据.力量 = 物品.力量
	end
	if 物品.耐力 ~= nil then
		道具数据.耐力 = 物品.耐力
	end
	if 物品.敏捷 ~= nil then
		道具数据.敏捷 = 物品.敏捷
	end
	if 物品.品质 ~= nil then
		道具数据.品质 = 物品.品质
	end
	if 物品.附带技能 ~= nil then
		道具数据.附带技能 = 物品.附带技能
	end
	if 物品.镶嵌四相 ~= nil then
		道具数据.镶嵌四相 = 物品.镶嵌四相
	end
	if 物品.锻炼等级 ~= nil then
		道具数据.锻炼等级 = 物品.锻炼等级
	end
	if 物品.镶嵌宝石 ~= nil then
		道具数据.镶嵌宝石 = 物品.镶嵌宝石
	end
	if 物品.级别限制 ~= nil then
		道具数据.级别限制 = 物品.级别限制
	end
	if 物品.特效 ~= nil then
		道具数据.特效 = 物品.特效
	end
	if 物品.特技 ~= nil then
		道具数据.特技 = 物品.特技
	end
	if 物品.价格 ~= nil then
		道具数据.价格 = 物品.价格
	end
	if 物品.五行 ~= nil then
		道具数据.五行 = 物品.五行
	end
	if 物品.数量 ~= nil and 物品.可叠加 then
		道具数据.数量 = 物品.数量
	end
	if 物品.制造者 ~= nil then
		道具数据.制造者 = 物品.制造者
	end
	return 道具数据
end

function 场景类_道具行囊:取人物形象()
	local 资源 = tp.资源
	local q = qmx(tp.队伍[1].模型)
	local 人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
	self.人物组 = {}
	if tp.队伍[1].装备[3] ~= nil and  (not tp.队伍[1].锦衣[1]  or  tp.队伍[1].锦衣[1].名称~="新斗战胜佛") then
		local wq = nil
		local v = tp:取武器子类(tp.队伍[1].装备[3].子类)
		if tp.队伍[1].装备[3].名称 == "龙鸣寒水" or tp.队伍[1].装备[3].名称 == "非攻" then
			v = "弓弩1"
		end
		local q = qmx(tp.队伍[1].模型,v)
		人物模型 = 资源:载入(q[3],"网易WDF动画",q[1])
		local m = tp:取武器附加名称(tp.队伍[1].装备[3].子类,tp.队伍[1].装备[3].级别限制,tp.队伍[1].装备[3].名称)
		local x = qmx(m.."_"..tp.队伍[1].模型)
		local wq = 资源:载入(x[3],"网易WDF动画",x[1])
		wq:置差异(wq.帧数-人物模型.帧数)
		self.人物组[2] = wq
	end
	人物模型:置染色(tp.队伍[1].染色方案,tp.队伍[1].染色组[1],tp.队伍[1].染色组[2],tp.队伍[1].染色组[3])
	if tp.队伍[1].锦衣[1] ~= nil then
		local wq = nil
		if tp.队伍[1].装备[3] ~= nil then
			wq = tp.队伍[1].装备[3].子类
		end
		local 临时资源=引擎.取普通锦衣模型(tp.队伍[1].锦衣[1].名称,tp.队伍[1].模型,nil,wq)
		人物模型 = 资源:载入(临时资源[3],"网易WDF动画",临时资源[1])
	end
	self.人物组[1] = 人物模型
end

function 场景类_道具行囊:取人物头像()
	local n = qtxs(tp.队伍[1].模型)
	self.jiu资源[4] = tp.资源:载入(n[7],"网易WDF动画",n[3])
	for n=1,6 do
		self.人物装备[n]:置物品(tp.队伍[1].装备[n])
	end
end
-------------------------------------------------------------
function 场景类_道具行囊:检查点(x,y)
	if self.可视 and self.新界面 and self.xin资源[1]:是否选中(x,y) then
		return true
	elseif self.可视 and self.新界面==false and self.jiu资源[1]:是否选中(x,y) then
		return true
	else
		return false
	end
end

function 场景类_道具行囊:初始移动(x,y)
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

function 场景类_道具行囊:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
		-- if tp.窗口.锦衣.可视 then
		-- 	 tp.窗口.锦衣.x = x - self.xx+312
		-- 	 tp.窗口.锦衣.y = y - self.yy+206
		-- end
		-- if tp.窗口.灵饰.可视 then
		-- 	tp.窗口.灵饰.x = x - self.xx+312
		-- 	tp.窗口.灵饰.y = y - self.yy+1
		-- end
	end
end

return 场景类_道具行囊