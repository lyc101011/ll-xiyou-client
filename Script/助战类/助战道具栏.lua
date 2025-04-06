-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:17:05
-- @Author: baidwwy
-- @Date:   2024-07-11 20:41:12
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-11 16:12:21
local box = 引擎.画矩形
local floor = math.floor
local tp,xinzts,jiuzts,zts1,zts2
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

local 助战道具栏 = class()
local sdert = {"人\n物\n界\n面","宝\n宝\n界\n面","技\n能\n界\n面"}
function 助战道具栏:初始化(根)
	self.ID = 166
	self.x = 250-119
	self.y = 185+45
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
	self.分页按钮={
		[1]=根._按钮.创建(根.资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"壹"),
		[2]=根._按钮.创建(根.资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"贰"),
		[3]=根._按钮.创建(根.资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"叁"),
		[4]=根._按钮.创建(根.资源:载入('XWD.wdf',"网易WDF动画",0x72116F63),0,0,4,true,true,"肆"),
		-- [1] = 根._按钮.创建(根.资源:载入('wzife.wd5',"网易WDF动画",0x00000033),0,0,4,true,true),
		-- [2] = 根._按钮.创建(根.资源:载入('wzife.wd5',"网易WDF动画",0x00000033),0,0,4,true,true),
		-- [3] = 根._按钮.创建(根.资源:载入('wzife.wd5',"网易WDF动画",0x00000033),0,0,4,true,true),
		-- [4] = 根._按钮.创建(根.资源:载入('wzife.wd5',"网易WDF动画",0x00000033),0,0,4,true,true),
	}
	for i=1,4 do
		self.分页按钮[i]:绑定窗口_(self.ID)
		-- self.分页按钮[i]:置拉伸(19,33,22,44)
	end
	self.zbxx={}
	self.lsxx={}
	self.jyxx={}
	self.主角={}
	self.窗口时间 = 0
	xinzts = 根.字体表.普通字体
	zts1 = 根.字体表.描边字体
	-- zts2 = tp.字体表.普通字体__
	-- zts2:置行间距(2.7)
end
local 补差坐标y=27+14
function 助战道具栏:加载新资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应

	self.xin资源 = {
		[1] = 自适应.创建(0,1,540,330+16,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --关闭
		-- [3] = 按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true," 人物"),
		-- [4] = 按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true,"召唤兽"),
		-- [5] = 按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true," 坐骑"),
		-- [6] = 按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true," 子女"),
		-- [7] = 按钮.创建(自适应.创建(12,4,77,22,1,3),0,0,4,true,true,"  道具"),
		-- [8] = 按钮.创建(自适应.创建(12,4,77,22,1,3),0,0,4,true,true,"  行囊"),
		-- [9] = 按钮.创建(自适应.创建(12,4,77,22,1,3),0,0,4,true,true,"  任务"),
		[10] = 自适应.创建(2,1,112,169,3,9), --120
		-- [11] = 按钮.创建(自适应.创建(17,4,22,22,1,3),0,0,4,true,true,"1"),
		-- [12] = 按钮.创建(自适应.创建(17,4,22,22,1,3),0,0,4,true,true,"2"),
		-- [13] = 按钮.创建(自适应.创建(17,4,22,22,1,3),0,0,4,true,true,"3"),
		-- [14] = 按钮.创建(自适应.创建(17,4,22,22,1,3),0,0,4,true,true,"看"),
		-- [15] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"锦衣"),
		[16] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"法宝"),
		[17] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"现金"),
		[18] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"摆摊"),
		-- [19] = 按钮.创建(自适应.创建(12,4,51,22,1,3),0,0,4,true,true,"仓库"),
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
		-- [31] =资源:载入("wdf/audio/jmk/背包/钥匙.png","图片"),
		[32] = 自适应.创建(34,1,112,178,3,9),  --召唤兽右侧大框
		-- [33] = 自适应.创建(3,1,150,19,1,3),   --金钱 背景
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
	}
	self.xin资源[1]:置颜色(ARGB(223,255,255,255))
	-- self.人物界面 = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true)
	-- self.宝宝界面 = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true)
	-- self.技能界面  = 按钮.创建(自适应.创建(27,4,25,69,4,3),0,0,5,true,true)
	-- self.人物界面:绑定窗口_(self.ID)
	-- self.宝宝界面:绑定窗口_(self.ID)
	-- self.技能界面:绑定窗口_(self.ID)
	self.输入背景=自适应.创建(3,1,116,19,1,3)
	self.上横=require("gge精灵类")(0,0,0,0,0)
	self.上横:置区域(0,0,512,60)
	self.上横:置颜色(ARGB(150,0,0,0))

	self.xin资源[16]:置偏移(3,0)
	self.xin资源[18]:置偏移(3,0)
	-- self.xin资源[19]:置偏移(3,0)
	self.xin资源[36]:置偏移(3,0)
	self.xin资源[37]:置偏移(3,0)
	self.xin资源[38]:置偏移(3,0)
	self.xin资源[42]:置偏移(3,0)
	self.xin资源[43]:置偏移(-3,0)
	self.xin资源[44]:置偏移(-3,0)
	self.xin资源[45]:置偏移(3,0)
	self.xin资源[46]:置起始点(0)
	self.召唤兽装备坐标 = {x={10,10+60*1,10+60*2,10+60*3},y={267,267,267,267}}
	self.装备坐标 = {x={10,10+51*3+9*3,10,10+51*3+9*3,10,10+51*3+9*3},y={120+补差坐标y,120+补差坐标y,120+59*1+补差坐标y,120+59*1+补差坐标y,120+59*2+补差坐标y,120+59*2+补差坐标y}}
	self.灵饰坐标 = {x={10+60*1,10+60*2,10,10+60*3},y={59+补差坐标y,59+补差坐标y,59+补差坐标y,59+补差坐标y}}
	-- self.锦衣坐标 = {x={10+60*1,10+60*2,10+60*1,10+60*2},y={146+33+补差坐标y,146+33+补差坐标y,146+33+59+补差坐标y,146+33+59+补差坐标y}}
	self.锦衣坐标 = {x={285,285+60*1,285+60*2,285+60*3},y={35,35,35,35}}
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
	self.jingyi = {}
	for i=1,4 do
		self.jingyi[i] = 格子(0,0,i,"道具行囊_锦衣",tp.底图)
	end
	for i=1,3 do
		self.召唤兽装备[i] = 格子(0,0,i,"道具行囊_召唤兽装备",底图)
	end
	for i=1,1 do
		self.坐骑装饰[i] = 格子(0,0,i,"道具行囊_坐骑装饰",底图)
	end
	self.物品 = {}
	for i=1,80 do
		self.物品[i] = 格子.创建(0,0,i,"道具行囊_物品")
	end
	self.选中召唤兽 = 0
	self.加入 = 0
	self.结束 = 20
	for i=1,4 do
		if self.lsxx[i] ~= nil and  self.lsxx[i].名称 ~= nil then
			self.灵饰[i]:置物品(self.lsxx[i])
		end
	end
	for n=36,46 do
		if self.xin资源[n] ~= nil and n ~= 39 then
			self.xin资源[n]:绑定窗口_(self.ID)
		end
	end
	for n=2,2 do
		self.xin资源[n]:绑定窗口_(self.ID)
	end
	for n=16,18 do
		self.xin资源[n]:绑定窗口_(self.ID)
	end
	-- self.锦衣背景 = {
	-- 	[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x9CC4F242),
	-- 	[2] = 资源:载入('wzife.wdf',"网易WDF动画",0xC0520208),
	-- 	[3] = 资源:载入('wzife.wdf',"网易WDF动画",0xCF39217A),
	-- 	[4] = 资源:载入('wzife.wdf',"网易WDF动画",0xFE7DE843),
	-- }
	-- self.huishou=按钮.创建(自适应.创建(17,4,51,22,1,3),0,0,4,true,true,"其它")
	-- self.huishou:置偏移(3,0)
end

function 助战道具栏:打开(助战信息,装备,灵饰,锦衣)
	if self.可视 then
		self.可视 = false
		self.选中召唤兽 = nil
		self.加入 = nil
		self.窗口 = nil
		self.zbxx={}
		self.lsxx={}
		self.jyxx={}
		self.主角={}
		-- self.人物组 = nil
		-- for s=1,3 do
		-- 	self.召唤兽装备[s]:置物品(nil)
		-- end
		-- for s=1,1 do
		-- 	self.坐骑装饰[s]:置物品(nil)
		-- end
		for i=1,6 do
			self.人物装备[i]:置物品(nil)
		end
	else
		insert(tp.窗口_,self)
		if self.xin资源==nil then
			self:加载新资源()
		end
		self.选中召唤兽 = 0
		self.加入 = 0
		self.窗口 = "主人公"

		self.分页状态=1
		self.开始 = 1
		self.结束 = 20
		for q=self.开始,self.结束 do
			self.物品[q]:置物品(__助战道具[q])
		end
		self.点击类型="道具"
		self.选择类型="道具"
		self.主角=助战信息
		self.助战编号=助战信息.助战编号
		self:取人物形象()
		self:刷新装备(装备)
		self:刷新灵饰(灵饰)
		self:刷新锦衣(锦衣)
		-- self.zbxx=装备
		-- self.lsxx=灵饰
		-- self.jyxx=锦衣
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end





function 助战道具栏:显示(dt,x,y)
	local 右键弹起=false
	self.焦点 = false
	self:新界面显示(dt,x,y)
	if self.点击类型=="道具" then
		for i=1,4 do
			self.分页按钮[i]:更新(x,y)
			self.分页按钮[i]:显示(self.x+284+225,self.y+200-140+(i-1)*53+补差坐标y,nil,true,nil,self.分页状态==i,2)
			zts1:置颜色(白色):显示(self.x+284+5+225,self.y+200-140+13+(i-1)*51+补差坐标y)
			if  not tp.战斗中 then
				if self.分页按钮[i]:事件判断() then
					self.分页状态=i
					self.开始=(i-1)*20+1
					self.结束=(i-1)*20+20
					self:刷新道具(__助战道具)
				end
			end
		end
	end
	local o = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			o = o + 1
			self.物品[o]:置坐标(l * 51 + self.x + 206,h * 51 + self.y + 7+补差坐标y)
			self.物品[o]:显示(dt,x,y,self.鼠标)
			if self.物品[o].焦点 and not tp.消息栏焦点 then
				if self.物品[o].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[o].物品)
				end
				self.焦点 = true
			end
			-- if  tp.场景.地图.抓取物品 == nil and self.物品[o]~=nil and self.物品[o].焦点 and self.物品[o].物品 ~= nil and not tp.消息栏焦点 and self.物品[o].物品.分类~=nil then
			-- 	if 引擎.鼠标弹起(0x01) and 右键弹起==false then --self.物品[o].右键
			-- 		右键弹起=true
			-- 		if self.物品[o].物品.总类=="坐骑礼包" or self.物品[o].物品.总类=="装备礼包" then
			-- 			发送数据(2013,{类型=self.点击类型,编号=(self.分页状态-1)*20+o-self.开始+1,窗口=self.窗口,序列=self.选中召唤兽})
			-- 			return
			-- 		end
			-- 	end
			-- end
			if self.物品[o]  and tp.场景.地图.抓取物品 == nil and self.物品[o].焦点 and self.物品[o].物品 ~= nil  then --穿装备
				if mousea(1) and 右键弹起==false then
					右键弹起=true
					-- if self.物品[o].物品.总类=="坐骑礼包" or self.物品[o].物品.总类=="装备礼包" then --使用
					-- 	发送数据(2013,{编号=(self.分页状态-1)*20+o-self.开始+1,序列=self.选中召唤兽,助战编号=self.助战编号})
					-- 	return
					-- end
					if self.物品[o].物品.总类=="可使用" or ((self.物品[o].物品.分类 <=12 or self.物品[o].物品.总类==144) and self.物品[o].物品.总类~=2) then
						发送数据(2013,{编号=(self.分页状态-1)*20+o-self.开始+1,序列=self.选中召唤兽,助战编号=self.助战编号})
						return
					end
					if self.物品[o].物品.总类 == 2 then --穿戴装备。灵饰。锦衣等
						if self.窗口 == "主人公" then
							if self.物品[o].物品.分类 <= 19 then
								发送数据(2014,{角色="主角",道具=(self.分页状态-1)*20+o-self.开始+1,助战编号=self.助战编号})
							end
						end
					end
				end
			end
		end
	end

end

---------------------------------------------------------新
function 助战道具栏:新界面显示(dt,x,y)
	local 右键弹起=false
	self.焦点 = false
	self.xin资源[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-88+self.xin资源[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.xin资源[1].宽度/2,self.y+3,self.主角.id.."的道具")
	self.xin资源[2]:更新(x,y)
	self.xin资源[2]:显示(self.x-18+self.xin资源[1].宽度,self.y+2)
	self.xin资源[18]:更新(x,y)
	tp.物品界面背景_:显示(self.x+256,self.y+59+补差坐标y)
	self.xin资源[16]:更新(x,y)
	self.xin资源[16]:显示(self.x+135+122,self.y+270+补差坐标y)--法宝
	self.xin资源[18]:显示(self.x+472,self.y+270+补差坐标y) --摆摊
	self.xin资源[30]:显示(self.x+513,self.y+55+补差坐标y)

	if self.窗口 == "主人公" then
		--20-23 灵饰 24 头盔 25 武器 26 腰带 27 项链 28 铠甲 29 鞋子
		self.xin资源[10]:显示(self.x+10+51+6+3,self.y+120+补差坐标y)
		self.xin资源[20]:显示(self.x+10,self.y+59+补差坐标y)
		self.xin资源[21]:显示(self.x+10+60,self.y+59+补差坐标y)
		self.xin资源[22]:显示(self.x+10+60*2,self.y+59+补差坐标y)
		self.xin资源[23]:显示(self.x+10+60*3,self.y+59+补差坐标y)
		self.xin资源[24]:显示(self.x+10,self.y+120+补差坐标y)
		self.xin资源[25]:显示(self.x+10,self.y+120+59+补差坐标y)
		self.xin资源[26]:显示(self.x+10,self.y+120+59*2+补差坐标y)
		self.xin资源[27]:显示(self.x+10+51*3+9*3,self.y+120+补差坐标y)
		self.xin资源[28]:显示(self.x+10+51*3+9*3,self.y+120+59+补差坐标y)
		self.xin资源[29]:显示(self.x+10+51*3+9*3,self.y+120+59*2+补差坐标y)

		-- xinzts:显示(self.x+191,self.y+273+22+7,"已装备:0")
		if self.xin资源[18]:事件判断() and not tp.战斗中 then
			--发送数据(3720)
		elseif self.xin资源[16]:事件判断() and not tp.战斗中 then
			-- if tp.场景.抓取物品 == nil then
			-- 	tp.窗口.法宝:打开()
			-- 	发送数据(3732)
			-- else
			-- 	tp.常规提示:打开("#Y/不是什么东西都可以放到法宝里的")
			-- end
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
						发送数据(2015,{角色="主角",道具=i,助战编号=self.助战编号})
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
			if self.灵饰[i].事件 or self.灵饰[i].右键 then
				if tp.场景.抓取物品 == nil and self.灵饰[i].物品 ~= nil and self.灵饰[i].焦点 then
					发送数据(2015,{角色="主角",灵饰=true,道具=i,助战编号=self.助战编号})
				end
			end
		end
		if tp.窗口.助战列表.可视==false then
			tp.窗口.助战列表.助战格子[self.助战编号]:更新1(dt,x,y)
		end
		tp.窗口.助战列表.助战格子[self.助战编号]:置坐标(self.x+128-67+9,self.y+74+220-129+9)
		tp.窗口.助战列表.助战格子[self.助战编号]:显示1(dt,x,y)
	end
	---------------
	self.上横:显示(self.x+10,self.y+30)
	tp.窗口.人物框.人物tx背景_:显示(self.x+10+5,self.y+30+5)
	if self.touxiang then
		self.touxiang:显示(self.x+10+5+2,self.y+30+5+2)
	end
	self.输入背景:显示(self.x+10+110,self.y+30+5)
	self.输入背景:显示(self.x+10+110,self.y+57+5)
	xinzts:置颜色(白色)
	xinzts:显示(self.x+21+56,self.y+30+5+4,"I  D")
	xinzts:显示(self.x+21+56,self.y+57+5+4,"门派")
	xinzts:置颜色(绿色)
	xinzts:显示(self.x+21+56+168,self.y+30+11+5+4,"锦衣：")
	xinzts:置颜色(浅黑)
	xinzts:显示(self.x+21+56+59,self.y+30+5+4,self.主角.id)
	xinzts:显示(self.x+21+56+59,self.y+57+5+4,self.主角.门派)
	-- self.xin资源[20]:显示(self.x + self.锦衣坐标.x[i]-1,self.y + self.锦衣坐标.y[i]-1)
	-- self.xin资源[21]:显示(self.x+10+60,self.y+59+补差坐标y)
	-- self.xin资源[22]:显示(self.x+10+60*2,self.y+59+补差坐标y)
	-- self.xin资源[23]:显示(self.x+10+60*3,self.y+59+补差坐标y)
	self.xin资源[28]:显示(self.x + self.锦衣坐标.x[1]-1,self.y + self.锦衣坐标.y[1]-1)
	self.xin资源[23]:显示(self.x + self.锦衣坐标.x[2]-1,self.y + self.锦衣坐标.y[2]-1)
	self.xin资源[29]:显示(self.x + self.锦衣坐标.x[3]-1,self.y + self.锦衣坐标.y[3]-1)
	self.xin资源[21]:显示(self.x + self.锦衣坐标.x[4]-1,self.y + self.锦衣坐标.y[4]-1)
	for i=1,4 do
		--self.锦衣背景[i]:显示(self.x + self.锦衣坐标.x[i]-1,self.y + self.锦衣坐标.y[i]-1)
		-- self.xin资源[19+i]:显示(self.x + self.锦衣坐标.x[i]-1,self.y + self.锦衣坐标.y[i]-1)
		self.jingyi[i]:置坐标(self.x + self.锦衣坐标.x[i],self.y + self.锦衣坐标.y[i]-2,nil,nil,4,-1)
		self.jingyi[i]:显示(dt,x,y,self.鼠标,nil,3)
		if self.jingyi[i].物品 ~= nil and self.jingyi[i].焦点 then
			tp.提示:道具行囊(x,y,self.jingyi[i].物品,true)
		end
		if self.jingyi[i].事件 or self.jingyi[i].右键 then
			if tp.场景.抓取物品 == nil and self.jingyi[i].物品 ~= nil and self.jingyi[i].焦点 then
				发送数据(2015,{角色="主角",锦衣=true,道具=i,助战编号=self.助战编号})
			end
		end
	end
	-- xinzts:显示(self.x+19+51+57,self.y+120+8+补差坐标y,"ID:"..self.主角.id)
	-- xinzts:显示(self.x+19+51+57,self.y+120+8+21+补差坐标y,self.主角.门派)
	-- self.人物界面:更新(x,y,self.窗口 ~= "主人公")
	-- self.宝宝界面:更新(x,y,self.窗口 ~= "宝宝")
	-- self.技能界面:更新(x,y,self.窗口 ~= "技能")
	-- self.人物界面:显示(self.x-23,self.y+41+(1-1)*74,nil,nil,nil,self.窗口 == "主人公",2)
	-- self.宝宝界面:显示(self.x-23,self.y+41+(2-1)*74,nil,nil,nil,self.窗口 == "宝宝",2)
	-- self.技能界面:显示(self.x-23,self.y+41+(3-1)*74,nil,nil,nil,self.窗口 == "技能",2)
	-- zts2:置颜色(4294967295)
	-- zts2:显示(self.x-23+7,self.y+41+(1-1)*74+8,sdert[1])
	-- zts2:显示(self.x-23+7,self.y+41+(2-1)*74+8,sdert[2])
	-- zts2:显示(self.x-23+7,self.y+41+(3-1)*74+8,sdert[3])
	-- if self.人物界面:事件判断() then
	-- elseif self.人物界面:事件判断() then
	-- elseif self.人物界面:事件判断() then
	-- end
	-- bw1:置坐标(self.x-24,self.y+36)
	--------
	if self.鼠标 then
		if self.xin资源[2]:事件判断() then
			self:打开()
			return false
		end
	end
end

-------------------------------------------------------------
function 助战道具栏:刷新装备(装备)
	--self.人物装备={}
	self.zbxx=装备
	for i=1,6 do
		self.人物装备[i]:置物品(nil)
		self.人物装备[i]:置物品(self.zbxx[i])
	end
	tp.窗口.助战列表.助战格子[self.助战编号]:刷新武器(装备[3],self.主角.模型)
	if tp.窗口.助战详情.可视 and tp.窗口.助战详情.助战编号==self.助战编号 then
		tp.窗口.助战详情:刷新装备(装备)
	end
end

function 助战道具栏:刷新锦衣(锦衣)
	self.jyxx=锦衣
	for i=1,4 do
		self.jingyi[i]:置物品(nil)
		if self.jyxx[i] ~= nil and  self.jyxx[i].名称 ~= nil then
			self.jingyi[i]:置物品(self.jyxx[i],nil,nil,nil,1)
		end
	end
	tp.窗口.助战列表.助战格子[self.助战编号]:刷新锦衣(锦衣[1],self.主角.模型)
end

function 助战道具栏:刷新好感度(ss)
	if self.窗口 == "坐骑" then
		if self.选中召唤兽 ~= 0 and tp.坐骑列表[self.选中召唤兽]  ~= nil then
			if tp.坐骑列表[self.选中召唤兽].认证码==ss.rzm then
				tp.坐骑列表[self.选中召唤兽].好感度=ss.hgd
			end
		end
	end
end

function 助战道具栏:刷新道具(ss,装备,灵饰,锦衣)
	for q=self.开始,self.结束 do
		self.物品[q]:置物品(ss[q])
	end
	if 装备 then
	    self:刷新装备(装备)
	end
	if 灵饰 then
	    self:刷新灵饰(灵饰)
	end
	if 锦衣 then
	    self:刷新锦衣(锦衣)
	end
end

function 助战道具栏:刷新()
	-- if self.窗口 == "主人公" then
	-- 	local n = qtxs(角色信息.模型)
	-- 	self.jiu资源[4] = tp.资源:载入(n[7],"网易WDF动画",n[3])
	-- 	for n=1,6 do
	-- 		self.人物装备[n]:置物品(self.zbxx.装备[n])
	-- 	end
	-- elseif self.窗口 == "召唤兽" then
	-- 	self.选中召唤兽 = 0
	-- 	self.加入 = 0
	-- 	for n=1,3 do
	-- 		self.召唤兽装备[n]:置物品(nil)
	-- 	end
	-- end
end

function 助战道具栏:刷新灵饰(灵饰)
	self.lsxx=灵饰
	for i=1,4 do
		self.灵饰[i]:置物品(nil)
		if self.lsxx[i] ~= nil and  self.lsxx[i].名称 ~= nil then
			self.灵饰[i]:置物品(self.lsxx[i],nil,nil,nil,1)
		end
	end
	if tp.窗口.助战详情.可视 and tp.窗口.助战详情.助战编号==self.助战编号 then
		tp.窗口.助战详情:刷新灵饰(灵饰)
	end
end

function 助战道具栏:取人物形象()
	local q = 引擎.取头像(self.主角.模型)
	self.touxiang=tp.资源:载入(q[7],"网易WDF动画",q[2])
end

-------------------------------------------------------------
function 助战道具栏:检查点(x,y)
	if self.可视 and self.xin资源[1]:是否选中(x,y) then--(self.xin资源[1]:是否选中(x,y) or bw1:检查点(x,y)) then
		return true
	else
		return false
	end
end

function 助战道具栏:初始移动(x,y)
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

function 助战道具栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 助战道具栏