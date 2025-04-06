-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:50
-- @Author: baidwwy
-- @Date:   2023-12-06 15:00:46
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-12-06 20:09:03
--======================================================================--
-- [1] = 自适应.创建(99,1,456,427,3,9), --xa新大底图
-- [5] = 按钮.创建(自适应.创建(18,4,16,16,4,1),0,0,4,true,true), --旧版关闭
-- [5] = 按钮.创建(资源:载入('nice.rpk',"网易WDF动画",0x01343E13),0,0,3,true,true), --新关闭
-- [2] = 资源:载入('pic/标题背景.png',"图片"), --[2] = 自适应.创建(1,1,518,18,1,3,nil,18), --字体背景
-- self.资源组[2]:显示(self.x+136,self.y-1)
-- self.字体1 = tp.字体表.常用字体14 -- 描边字体
-- self.字体1:显示(self.x+194,self.y+1,"系统设置")
--======================================================================--
local 场景类_祥瑞界面 = class()
local bw = require("gge包围盒")(0,0,100,22)
local bw1= require("gge包围盒")(0,0,100,17)
local mousea = 引擎.鼠标弹起
local box = 引擎.画矩形
local zqj = 引擎.坐骑库
local tp
local insert = table.insert
function 场景类_祥瑞界面:初始化(根)
	self.ID = 39
	self.x = 全局游戏宽度/2-160+50
	self.y = 全局游戏高度/2-160
	self.xx = 0
	self.yy = 0
	self.注释 = "祥瑞界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中 = 0
	self.加入 = 0
	self.选中召唤兽 = 0
	tp = 根
	self.窗口时间 = 0
	self.字体 = tp.字体表.普通字体
	self.进程=1
end

function 场景类_祥瑞界面:打开()
	if self.可视 then
		self.可视 = false
		self.资源组=nil
		self.选中召唤兽 = nil
		self.加入 = nil
		self.飞行图标 = nil
		return
	else
		insert(tp.窗口_,self)
		local 资源 = tp.资源
		local 按钮 = tp._按钮
		local 自适应 = tp._自适应
		self.资源组 = {
			[1] = 自适应.创建(0,1,547,426,3,9),
			[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true), --叉叉
			-- [3] = 自适应.创建(1,1,518,18,1,3,nil,18), --字体背景
			[4] = 自适应.创建(34,1,130,282,3,9),--召唤兽选择框
			[5] = 按钮.创建(自适应.创建(12,4,130,22,1,3),0,0,4,true,true,"      骑 乘"),
			-- [6] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),--上滚动
			-- [7] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),--下滚动
			[8] = 自适应.创建(34,1,380,282,3,9),--召唤兽选择框
			[10] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"使用 "),
			[11] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"全部 "),
			[12] = tp.技能格子背景_,
			[13] = 自适应.创建(3,1,160,19,1,3),--属性框1
			[14] = 自适应.创建(3,1,160,19,1,3),--属性框1
			[15] = 按钮.创建(自适应.创建(12,4,130,22,1,3),0,0,4,true,true,"  设置快捷骑乘 "),

		}
		self.资源组[2]:绑定窗口_(self.ID)
		self.资源组[5]:绑定窗口_(self.ID)
		self.资源组[10]:绑定窗口_(self.ID)
		self.资源组[11]:绑定窗口_(self.ID)
		self.资源组[15]:绑定窗口_(self.ID)

		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.人物坐骑可视 = false
	    self.可视 = true
	    self.进程=1
	    self.飞行图标 = 0
	    self.信息=1
	    self.选中召唤兽 = 0
		self.加入 = 0

	end
end

function 场景类_祥瑞界面:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[15]:更新(x,y)
	-- self.资源组[6]:更新(x,y)
	-- self.资源组[7]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+10,self.y+3,"祥 瑞")
	self.资源组[2]:显示(self.x+528,self.y+3)
	-- self.资源组[3]:显示(self.x+4,self.y+2)
	-- tp.窗口标题背景_:置区域(0,0,82,16)
	-- tp.窗口标题背景_:显示(self.x+227,self.y+3)

	-- self.字体:置颜色(白色):显示(self.x+256,self.y+3,"祥瑞")
	self.字体:置颜色(白色):显示(self.x+153,self.y+359,"凌霄玉露")
	self.字体:置颜色(白色):显示(self.x+153,self.y+389,"飞行技能")
	self.字体:置颜色(黄色):显示(self.x+153,self.y+329,"骑乘祥瑞不影响坐骑加成效果")
	self.资源组[4]:显示(self.x+14,self.y+33)
	self.资源组[5]:显示(self.x+14,self.y+325)--骑乘
	self.资源组[10]:显示(self.x+13,self.y+398)--全部
	self.资源组[15]:显示(self.x + 390,self.y+325)--设置快捷骑乘
	-- self.资源组[11]:显示(self.x+10,self.y+30)
	-- tp.竖排花纹背景_:置区域(0,0,18,238)
	-- tp.竖排花纹背景_:显示(self.x+119,self.y+70)
	-- self.资源组[6]:显示(self.x+119,self.y+63)
	-- self.资源组[7]:显示(self.x+119,self.y+298)
	-- tp.画线:置区域(0,0,15,213)--滑块虚线
	-- tp.画线:显示(self.x+123,self.y+82)
	self.资源组[8]:显示(self.x+153,self.y+33)
	self.资源组[12]:显示(self.x + 17,self.y+347+5) --技能格子
	self.资源组[13]:显示(self.x+227,self.y+356)
	self.资源组[14]:显示(self.x+227,self.y+386)
	self.字体:置颜色(黑色):显示(self.x+266,self.y+359,"50000".."/".."50000")
	self.字体:置颜色(黑色):显示(self.x+246,self.y+390,"移动速度与地面一致")
	if self.选中召唤兽~=0 and tp.队伍[1].坐骑~=nil and tp.坐骑列表 ~= nil and (tp.队伍[1].坐骑.认证码==tp.坐骑列表[self.选中召唤兽].认证码 or (tp.队伍[1].坐骑~=nil and tp.队伍[1].坐骑[1]~=nil and tp.坐骑列表[self.选中].认证码==tp.队伍[1].坐骑[1].认证码)) then
		self.资源组[5]:置文字("      下 骑")
	else
		self.资源组[5]:置文字("      骑 乘")
	end
	local jx = self.x + 339
	local jy = self.y + 234--+25

	tp.影子:显示(jx,jy)
	if self.资源组[24] ~= nil then --坐骑
		self.资源组[24]:更新(dt)
		self.资源组[24]:显示(jx,jy)
		local ski    = 引擎.取技能(" 飞行 ")
		self.飞行图标 = tp.资源:载入(ski[6],"网易WDF动画",ski[7])
		self.飞行图标:显示(self.x+18,self.y+351+3)
		if self.飞行图标:是否选中(x,y) and self.鼠标 then
			self.焦点 = true
			tp.提示:飞行坐骑提示(x,y,"飞行","飞行在非战斗状态下使用。使用后可骑乘飞行祥瑞翱翔空中。骑乘飞行祥瑞时有效，#G空中飞行移动速度与地面一致。",self.飞行图标)
		end
	end
	if self.资源组[25] ~= nil then--饰品
		self.资源组[25]:更新(dt)
		self.资源组[25]:显示(jx,jy)
	end
	if self.资源组[40] ~= nil then--饰品
		self.资源组[40]:更新(dt)
		self.资源组[40]:显示(jx,jy)
	end

 --    if self.资源组[9] ~= nil then
	-- 	self.资源组[9]:更新(dt)
	-- 	self.资源组[9]:显示(self.x + 339,self.y + 234)
	-- 	tp.影子:显示(self.x + 339,self.y + 254)
	-- 	local ski    = 引擎.取技能(" 飞行 ")
	-- 	self.飞行图标 = tp.资源:载入(ski[6],"网易WDF动画",ski[7])
	-- 	self.飞行图标:显示(self.x+19,self.y+351+5)
	-- 	if self.飞行图标:是否选中(x,y) and self.鼠标 then
	-- 		self.焦点 = true
	-- 		tp.提示:飞行坐骑提示(x,y,"飞行","飞行在非战斗状态下使用。使用后可骑乘飞行祥瑞翱翔空中。骑乘飞行祥瑞时有效，#G空中飞行移动速度与地面一致。",self.飞行图标)
	-- 	end
	-- end
	for m=1,9 do
		if tp.坐骑列表[m+self.加入] ~= nil then
			bw1:置坐标(self.x +29,self.y + 52-28 + m * 25)
			if self.选中召唤兽 ~= m+self.加入 then
				if bw1:检查点(x,y) then
					box(self.x + 16,self.y + 52-30+ m * 25,self.x + 117+15,self.y + 69-26 + m * 25 ,-3551379)
					if mousea(0) and self.鼠标 then
						self.选中召唤兽 = m+self.加入
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
				box(self.x + 16,self.y + 52-30+ m * 25,self.x + 117+15,self.y + 69-26 + m * 25 ,ys)
			end
			self.字体:置颜色(0xFF222222)
			self.字体:显示(self.x + 34,self.y + 53-28 + m * 25,tp.坐骑列表[m+self.加入].模型)
			if self.资源组[15]:事件判断() then
				if self.资源组[24] == nil then
				   tp.常规提示:打开( "#Y/请先选择一只祥瑞")
			       return
				end

				if self.选中召唤兽 == m+self.加入 then
					-- if tp.坐骑列表[m+self.加入].模型=="深海狂鲨" or tp.坐骑列表[m+self.加入].模型=="冰晶雪魄" or tp.坐骑列表[m+self.加入].模型=="帝江白"
					-- 	or tp.坐骑列表[m+self.加入].模型=="飞马黑" or tp.坐骑列表[m+self.加入].模型=="金色浪漫" or tp.坐骑列表[m+self.加入].模型=="青花瓷"
					-- 	or tp.坐骑列表[m+self.加入].模型=="齐天小圣" or tp.坐骑列表[m+self.加入].模型=="海豚之恋" or tp.坐骑列表[m+self.加入].模型=="冰晶雪灵"
					-- 	or tp.坐骑列表[m+self.加入].模型=="蓝色妖姬" or tp.坐骑列表[m+self.加入].模型=="蒹葭苍苍" or tp.坐骑列表[m+self.加入].模型=="霜雪龙宝"
					-- 	or tp.坐骑列表[m+self.加入].模型=="水晶芭蕉" or tp.坐骑列表[m+self.加入].模型=="七彩祥云" or tp.坐骑列表[m+self.加入].模型=="粉红火鸡" then
     --                    if not tp.快捷技能显示 then
					-- 		tp.快捷技能显示=true
					-- 	end
                         tp.窗口.对话栏:文本("","","请设置你要飞行的快捷键",{"F1","F2","F3","F4","","F5","F6","F7","F8"})
					-- else
					--     tp.常规提示:打开( "#Y/只有祥瑞才可以执行此操作")
					-- end
				end
				-- 发送数据(3805,{选择个数=self.选择个数})
			   -- tp.窗口.快捷技能栏:设置技能(ski,x,y)
			end
		end
	end
	if self.资源组[2]:事件判断() then
		self:打开()
		return
	elseif self.资源组[10]:事件判断() then
		tp.常规提示:打开( "#Y/请设置快捷键骑乘使用")

	end
end

function 场景类_祥瑞界面:置形象()

	if self.选中召唤兽 ~= 0 and tp.坐骑列表[self.选中召唤兽]  ~= nil and tp.坐骑列表[self.选中召唤兽].模型 ~= nil then
		local n = zqj(tp.队伍[1].模型,tp.坐骑列表[self.选中召唤兽].模型,tp.坐骑列表[self.选中召唤兽].饰品 or "空",tp.坐骑列表[self.选中召唤兽].饰品2 or "空")--ani(tp.坐骑列表[self.选中召唤兽].模型)
		self.资源组[24] = tp.资源:载入(n.坐骑资源,"网易WDF动画",n.坐骑站立)--坐骑
		self.资源组[24]:置方向(0)
		if tp.坐骑列表[self.选中召唤兽].饰品 ~= nil then
			self.资源组[25] = tp.资源:载入(n.坐骑饰品资源,"网易WDF动画",n.坐骑饰品站立)--饰品
			self.资源组[25]:置方向(0)
		end
		if tp.坐骑列表[self.选中召唤兽].饰品2 ~= nil then
			self.资源组[40] = tp.资源:载入(n.坐骑饰品2资源,"网易WDF动画",n.坐骑饰品2站立)--饰品
			self.资源组[40]:置方向(0)
		end


	end
end

function 场景类_祥瑞界面:检查点(x,y)
	if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 场景类_祥瑞界面:初始移动(x,y)
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

function 场景类_祥瑞界面:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_祥瑞界面