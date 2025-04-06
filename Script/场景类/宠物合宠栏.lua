-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-27 18:37:17
-- @Author: baidwwy
-- @Date:   2024-11-01 04:10:22
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-13 14:40:06

local 场景类_宠物合宠栏 = class()
local bw = require("gge包围盒")(0,0,120,37)
local box = 引擎.画矩形
local remove = table.remove
local insert = table.insert
local random = 引擎.取随机整数
local min = math.min
local cfs = 删除重复
local qmxs = 引擎.取战斗模型
local mouseb = 引擎.鼠标弹起
local tx = 引擎.取头像
local yx = {{68,4},{25,28},{111,28},{24,75},{111,75},{68,97}}
local zts,tp,zts1
local insert = table.insert
local bw1 = require("gge包围盒")(0,0,120,43)
local qmx = 引擎.取模型
local 技能最大数量=0
local 合宠材料=0
local 合宠材料数量=0
function 场景类_宠物合宠栏:初始化(根)
	self.ID = 117
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "宠物合宠栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.主状态=1
	self.副状态=1
	self.主选择=nil
	self.主选择认证=nil
	self.主选择界面=false
	self.副选择=nil
	self.副选择界面=false
	self.副选择认证=nil
	self.主头像组 = {}
	self.副头像组 = {}
	self.主加入 = 0
	self.主技能加入 = 0
	self.主内丹数据 = nil
	self.副加入 = 0
	self.副技能加入 = 0
	self.副内丹数据 = nil
	self.主宠 = nil
	self.副宠 = nil
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	ztx = tp.字体表.普通字体_
	self.时间 = 0
end

function 场景类_宠物合宠栏:加载资源()
	local 按钮 = tp._按钮
	local 资源 = tp.资源
	local 自适应 = tp._自适应
	local 物品 = tp._物品格子
	self.资源组 = {
		-- [0] = 自适应.创建(1,1,535,18,1,3,nil,18),
		[1] = 自适应.创建(0,1,570,450,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"合宠"),
		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"选择"),
		[5] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"选择"),
		[6] = 自适应.创建(34,1,130,117,3,9),
		[7] = 自适应.创建(3,1,148,20,1,3),
		[8] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"技\n能"),
		[9] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"内\n丹"),
		[10] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"进\n阶"),
		[11] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD),
		[12] = 资源:载入('wzife.wd1',"网易WDF动画",0x7367031D),
		[13] = 资源:载入('wzife.wd1',"网易WDF动画",0x1E714129),
		[14] = 资源:载入('wzife.wd1',"网易WDF动画",0xF2FC2425),
		[15] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"技\n能"),
		[16] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"内\n丹"),
		[17] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"进\n阶"),
		[18] = 自适应.创建(0,1,170,257,3,9),
		[19] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[20] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[21] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,180,2),
		[22] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
		[23] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[24] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[25] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,180,2),
		[26] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD),
		[27] = 资源:载入('wzife.wdf',"网易WDF动画",0x661470ed),--认证框

	}
	for n=2,5 do
		self.资源组[n]:绑定窗口_(117)
	end

	for n=8,10 do
		self.资源组[n]:置偏移(-4,2)
		self.资源组[n]:绑定窗口_(117)
	end
	for n=15,17 do
		self.资源组[n]:置偏移(-4,2)
		self.资源组[n]:绑定窗口_(117)
	end
	for n=19,20 do
		self.资源组[n]:绑定窗口_(117)
	end
	for n=23,24 do
		self.资源组[n]:绑定窗口_(117)
	end
	self.主上页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true)
    self.主下页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true)
    self.副上页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true)
    self.副下页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true)
	-- for i=1,1 do
	-- 	self.物品[i] = 物品.创建(0,0,i,"合宠物品")
	-- end

	self.物品 = {}
	for i=1,20 do
		self.物品[i] = 物品.创建(0,0,i,"合宠物品")
	end


	self.主技能 = {}
	self.副技能 = {}
	local jn = tp._技能格子
	for i=1,24 do
	    self.主技能[i] = jn(0,0,i,"主召唤兽资质技能")
	end
	for i=1,24 do
	    self.副技能[i] = jn(0,0,i,"副召唤兽资质技能")
	end

	self.合宠物品 = 物品.创建(0,0,0,"合宠_物品")
	self.合宠物品:置根(tp)

	self.主认证格子=jn(0,0,i,"主召唤兽资质技能")
	self.副认证格子=jn(0,0,i,"副召唤兽资质技能")
end

function 场景类_宠物合宠栏:打开(数据)
	if self.可视 then
		self.可视 = false
		self.主选择=nil
		self.副选择=nil
		self.主宠 = nil
		self.副宠 = nil
		self.主选择界面=false
		self.副选择界面=false
		self.主选择认证 = nil
	    self.副选择认证 = nil
	    self.资源组=nil
	    self.主上页=nil
	    self.主下页=nil
	    self.副上页=nil
	    self.副下页=nil
	    self.物品=nil
	    self.主技能=nil
	    self.副技能=nil
	    self.合宠物品=nil
	    self.主认证格子=nil
	    self.副认证格子=nil
	    return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.x = (全局游戏宽度/2)-220
		self.y = (全局游戏高度/2)-200
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true

	    self.合宠物品:置物品(nil)

	    self.主选择认证 = nil
	    self.副选择认证 = nil
	    self.主选择=nil
		self.副选择=nil
		self.主宠 = nil
		self.副宠 = nil
		self.主状态=1
		self.副状态=1
		self.时间 = 0
		self.主内丹数据 = {}
	end
end

function 场景类_宠物合宠栏:清除()
 	tp.窗口.召唤兽属性栏:刷新()
	self.合宠物品:置物品(nil)
	self.主召唤兽 = nil
	self.副召唤兽 = nil
	self.主选择 = nil
	self.副选择 = nil
	self.主选择认证 = nil
	self.副选择认证 = nil
	self.主状态=1
	self.副状态=1
	合宠材料数量=0

end

function 场景类_宠物合宠栏:主置形象()
	self.资源组[28]=nil
	self.资源组[29]=nil
	if tp.队伍[1].宝宝列表[self.主召唤兽]  ~= nil and self.主召唤兽 ~= 0 then
		local 模型=tp.队伍[1].宝宝列表[self.主召唤兽].模型
		-- if tp.队伍[1].宝宝列表[self.主召唤兽].进阶 and tp.队伍[1].宝宝列表[self.主召唤兽].还原造型==nil then
		-- 	模型="进阶"..模型
		-- end
		local n = qmxs(模型)
		self.主宠 = tp.资源:载入(n[10],"网易WDF动画",n[6])

		if tp.队伍[1].宝宝列表[self.主召唤兽].饰品 ~= nil then
			n = qmxs(模型.."_饰品")
			self.资源组[28] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if tp.队伍[1].宝宝列表[self.主召唤兽].染色方案 ~= nil then
			self.主宠:置染色(tp.队伍[1].宝宝列表[self.主召唤兽].染色方案,tp.队伍[1].宝宝列表[self.主召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[3],tp.队伍[1].宝宝列表[self.主召唤兽].染色组[4])
			self.主宠:置方向(0)
		end
	end
end

function 场景类_宠物合宠栏:副置形象()
	self.资源组[30]=nil
	self.资源组[31]=nil
	if tp.队伍[1].宝宝列表[self.副召唤兽]  ~= nil and self.副召唤兽 ~= 0 then
		local 模型=tp.队伍[1].宝宝列表[self.副召唤兽].模型
		-- if tp.队伍[1].宝宝列表[self.副召唤兽].进阶 and tp.队伍[1].宝宝列表[self.副召唤兽].还原造型==nil then
		-- 	模型="进阶"..模型
		-- end
		local n = qmxs(模型)
		self.副宠 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if tp.队伍[1].宝宝列表[self.副召唤兽].饰品 ~= nil then
			n = qmxs(模型.."_饰品")
			self.资源组[30] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if tp.队伍[1].宝宝列表[self.副召唤兽].染色方案 ~= nil then
			self.副宠:置染色(tp.队伍[1].宝宝列表[self.副召唤兽].染色方案,tp.队伍[1].宝宝列表[self.副召唤兽].染色组[1],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[2],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[3],tp.队伍[1].宝宝列表[self.副召唤兽].染色组[4])
			self.副宠:置方向(0)
		end
	end
end

function 场景类_宠物合宠栏:引所数据(技能最大数量)
	self.技能最大数量=技能最大数量
end

function 场景类_宠物合宠栏:刷新(sj)
	if not self.可视 then
		return
	end
	self.道具格子 = nil
	self.合宠物品:置物品(nil)
	self.选择物品=nil

	-- if sj[1] then
	-- 	if tp.道具列表[sj[1]] and tp.道具列表[sj[1]].名称 == "神兜兜"  then
			self.道具格子 = sj.道具格子
			self.合宠物品:置物品(tp.道具列表[sj.道具格子])
		-- end
	-- end
	合宠材料=sj
	-- if tp.道具列表[sj.道具格子].数量>10 then
	-- 	合宠材料数量=10
	-- else
		合宠材料数量=tp.道具列表[sj.道具格子].数量
	-- end
	-- tp.常规提示:打开("#Y/你的各项炼妖指标提升了#R"..合宠材料数量/.."%")
end


function 场景类_宠物合宠栏:显示(dt,x,y)
	if tp.窗口.宠物状态栏.可视 then
		tp.窗口.宠物状态栏:打开()
	end
	-- if tp.窗口.道具行囊.可视 then
	-- 	tp.窗口.道具行囊:打开()
	-- end
	local bblb = tp.队伍[1].宝宝列表
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y,false)
	self.资源组[15]:更新(x,y)
	self.资源组[16]:更新(x,y)
	self.资源组[17]:更新(x,y,false)
	if self.主宠 ~= nil then
		self.主宠:更新(dt)
	end
	if self.副宠 ~= nil then
		self.副宠:更新(dt)
	end
	self.资源组[1]:显示(self.x,self.y)
	-- self.资源组[0]:显示(self.x+6,self.y+3)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"合 宠")
	zts1:置颜色(白色):显示(self.x+254,self.y+32,"合宠材料")
	self.资源组[6]:置宽高(210,120)
	for i=1,2 do
		self.资源组[6]:显示(self.x + 15 + (i-1) * 330, self.y + 28)
		self.资源组[7]:显示(self.x + 15 + (i-1) * 330, self.y + 160)
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 191,"攻击资质:")
		ztx:置颜色(白色):显示(self.x + 135 + (i-1) * 330, self.y + 191,"法力资质:")
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 211,"防御资质:")
		ztx:置颜色(白色):显示(self.x + 135 + (i-1) * 330, self.y + 211,"速度资质:")
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 231,"体力资质:")
		ztx:置颜色(白色):显示(self.x + 135 + (i-1) * 330, self.y + 231,"躲闪资质:")
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 251,"寿 命:")
		ztx:置颜色(白色):显示(self.x + 135 + (i-1) * 330, self.y + 251,"成 长:")
		ztx:置颜色(白色):显示(self.x + 15 + (i-1) * 330, self.y + 271,"五 行:")
	end
	if self.主选择 ~= nil then
		local 主宝宝 = bblb[self.主选择]
		if 主宝宝~=nil then
			zts:置颜色(黑色):显示(self.x + 20, self.y + 163,主宝宝.名称 .. "  "..主宝宝.等级.."级")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 191,主宝宝.攻击资质)
			ztx:置颜色(白色):显示(self.x + 200, self.y + 191,主宝宝.法力资质)
			ztx:置颜色(白色):显示(self.x + 80, self.y + 211,主宝宝.防御资质)
			ztx:置颜色(白色):显示(self.x + 200, self.y + 211,主宝宝.速度资质)
			ztx:置颜色(白色):显示(self.x + 80, self.y + 231,主宝宝.体力资质)
			ztx:置颜色(白色):显示(self.x + 200, self.y + 231,主宝宝.躲闪资质)
			ztx:置颜色(白色):显示(self.x + 80, self.y + 251,主宝宝.寿命)
			ztx:置颜色(白色):显示(self.x + 200, self.y + 251,主宝宝.成长)
			ztx:置颜色(白色):显示(self.x + 80, self.y + 271,主宝宝.五行)
		else
		    zts:置颜色(黑色):显示(self.x + 20, self.y + 163,"请选择召唤兽->")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 191,"-")
			ztx:置颜色(白色):显示(self.x + 200, self.y + 191,"-")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 211,"-")
			ztx:置颜色(白色):显示(self.x + 200, self.y + 211,"-")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 231,"-")
			ztx:置颜色(白色):显示(self.x + 200, self.y + 231,"-")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 251,"-")
			ztx:置颜色(白色):显示(self.x + 200, self.y + 251,"-")
			ztx:置颜色(白色):显示(self.x + 80, self.y + 271,"-")
		end
	elseif self.主选择 == nil then
		zts:置颜色(黑色):显示(self.x + 20, self.y + 163,"请选择召唤兽->")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 191,"-")
		ztx:置颜色(白色):显示(self.x + 200, self.y + 191,"-")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 211,"-")
		ztx:置颜色(白色):显示(self.x + 200, self.y + 211,"-")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 231,"-")
		ztx:置颜色(白色):显示(self.x + 200, self.y + 231,"-")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 251,"-")
		ztx:置颜色(白色):显示(self.x + 200, self.y + 251,"-")
		ztx:置颜色(白色):显示(self.x + 80, self.y + 271,"-")
	end
	if self.副选择 ~= nil then
		local 副宝宝 = bblb[self.副选择]
		if 副宝宝~=nil then
			zts:置颜色(黑色):显示(self.x + 20 + 330 , self.y + 163,副宝宝.名称 .. "  "..副宝宝.等级.."级")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 191,副宝宝.攻击资质)
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 191,副宝宝.法力资质)
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 211,副宝宝.防御资质)
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 211,副宝宝.速度资质)
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 231,副宝宝.体力资质)
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 231,副宝宝.躲闪资质)
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 251,副宝宝.寿命)
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 251,副宝宝.成长)
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 271,副宝宝.五行)

		else
		    zts:置颜色(黑色):显示(self.x + 20 + 330 , self.y + 163,"请选择召唤兽->")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 191,"-")
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 191,"-")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 211,"-")
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 211,"-")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 231,"-")
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 231,"-")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 251,"-")
			ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 251,"-")
			ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 271,"-")
		end
	elseif self.副选择 == nil then
		zts:置颜色(黑色):显示(self.x + 20 + 330 , self.y + 163,"请选择召唤兽->")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 191,"-")
		ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 191,"-")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 211,"-")
		ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 211,"-")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 231,"-")
		ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 231,"-")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 251,"-")
		ztx:置颜色(白色):显示(self.x + 200 + 330, self.y + 251,"-")
		ztx:置颜色(白色):显示(self.x + 80 + 330, self.y + 271,"-")
	end
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x + 256,self.y + 125)


	tp.物品格子背景_:显示(self.x+257,self.y+55)

	self.合宠物品:置坐标(self.x+259,self.y+55)
	self.合宠物品:显示(dt,x,y,self.鼠标)



	tp.竖排花纹背景_:置区域(0,0,20,280)
	tp.竖排花纹背景_:显示(self.x+264,self.y+162)
	tp.竖排花纹背景_:显示(self.x+284,self.y+162)
	self.资源组[4]:显示(self.x + 170,self.y + 159)
	self.资源组[5]:显示(self.x + 500,self.y + 159)
	self.资源组[8]:显示(self.x + 210,self.y + 297,nil,nil,nil,self.主状态==1,2)
	self.资源组[9]:显示(self.x + 210,self.y + 342,nil,nil,nil,self.主状态==2,2)
	self.资源组[10]:显示(self.x + 210,self.y + 387)
	self.资源组[15]:显示(self.x + 540,self.y + 297,nil,nil,nil,self.副状态==1,2)
	self.资源组[16]:显示(self.x + 540,self.y + 342,nil,nil,nil,self.副状态==2,2)
	self.资源组[17]:显示(self.x + 540,self.y + 387)

	if self.资源组[2]:事件判断() then
    	self:打开()
    	return
    elseif self.资源组[3]:事件判断() then
    	if self.主选择认证 == nil or self.副选择认证 == nil then
    		tp.常规提示:打开("#Y/请先选择需要合成的召唤兽")
    		return
    	elseif self.主选择认证 == self.副选择认证 then
    		tp.常规提示:打开("#Y/同一只召唤兽怎么合成呢？")
    		return
    	end
    	if (os.time() - self.时间 > 1 or self.时间 == 0) then
    		self.时间 = os.time()

    		发送数据(5009,{序列=self.主选择认证,序列1=self.副选择认证,合宠材料=合宠材料})

    		self:清除()
    	end
    elseif self.资源组[4]:事件判断() then
    	if self.主选择界面==false then
			self.主选择界面=true
			self.主头像组 = {}
			self.资源组[21]:置起始点(0)
		else
		   	self.主选择界面=false
		end
	elseif self.资源组[5]:事件判断() then
    	if self.副选择界面==false then
			self.副选择界面=true
			self.副头像组 = {}
			self.资源组[25]:置起始点(0)
		else
		   	self.副选择界面=false
		end
    elseif self.资源组[8]:事件判断() then
    	self.主状态=1
    elseif self.资源组[9]:事件判断() then
    	self.主状态=2
    elseif self.资源组[15]:事件判断() then
    	self.副状态=1
    elseif self.资源组[16]:事件判断() then
    	self.副状态=2

	end
	if self.主状态==1 then
		local xx = 0
		local yy = 0
		for n=1,12 do
			local jx = self.x + 20 + (xx * 41)
			local jy = self.y + 299 + (yy * 41)
			self.资源组[11]:显示(jx,jy)
			if self.主选择~=nil then
				self.主技能[n+self.主技能加入]:置坐标(jx+3,jy+2)
				self.主技能[n+self.主技能加入]:显示(x,y,self.鼠标)
				if self.主技能[n+self.主技能加入].焦点 and self.主技能[n+self.主技能加入].技能 ~= nil and self.主选择界面==false and self.鼠标 then
					tp.提示:技能(x,y,self.主技能[n+self.主技能加入].技能)
				end
			end
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
		if self.主选择~=nil and tp.队伍[1].宝宝列表[self.主选择]~=nil then
			if tp.队伍[1].宝宝列表[self.主选择].法术认证~=nil then
				if #tp.队伍[1].宝宝列表[self.主选择].技能 <=12 and self.主技能加入 == 0 then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[27]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.主选择].技能 >12 and self.主技能加入 == 12 then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[27]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				end
			end
			if #tp.队伍[1].宝宝列表[self.主选择].技能 > 12 then
				self.主上页:更新(x,y)
				self.主上页:显示(self.x+192,self.y+310)
				self.主下页:更新(x,y)
				self.主下页:显示(self.x+192,self.y+390)
				if self.主上页:事件判断() then
					if self.主技能加入 == 0 then
						tp.常规提示:打开("#Y/已经是第一页技能了")
					else
						self.主技能加入 = 0
					end
				elseif self.主下页:事件判断() then
					if self.主技能加入 == 0 then
						self.主技能加入 = 12
					else
						tp.常规提示:打开("#Y/已经是第二页技能了")
					end
				end
			end
		end
	elseif self.主状态==2 then
		local jx = self.x+20
		local jy = self.y+299
		self.资源组[12]:显示(jx,jy)
		local bb = tp.队伍[1].宝宝列表[self.主选择]
		for i=1,6 do
			local jxx = jx + yx[i][1]
			local jxy = jy + yx[i][2]
			if bb~=nil then
				if i<= bb.内丹.内丹上限 then
			      	if self.主内丹数据[i] ~= nil then
					  	self.主内丹数据[i].内丹.模型:显示(jxx,jxy)
			   	      	if self.主内丹数据[i].内丹.模型:是否选中(鼠标.x,鼠标.y) then
					    	tp.提示:内丹提示2(x,y,self.主内丹数据[i])
					 	end
			        else
			        	self.资源组[14]:显示(jxx,jxy)
						if self.鼠标 and self.资源组[14]:是否选中(x,y) and self.主选择界面==false then
							tp.提示:内丹提示(x,y,self.资源组[14],{名称="可用的内丹技能格",介绍="可以学习的内丹技能"})
							self.焦点 = true
						end
					end
				else
					self.资源组[13]:显示(jxx,jxy)
					if self.鼠标 and self.资源组[13]:是否选中(x,y) and self.主选择界面==false then
						tp.提示:内丹提示(x,y,self.资源组[13],{名称="不可用内丹技能格",介绍="召唤兽可用内丹格数量与其参战等级相关"})
						self.焦点 = true
					end
				end
			else
			    if i == 1 then
			    	self.资源组[14]:显示(jxx,jxy)
			    	if self.鼠标 and self.资源组[14]:是否选中(x,y) and self.主选择界面==false then
						tp.提示:内丹提示(x,y,self.资源组[14],{名称="可用的内丹技能格",介绍="可以学习的内丹技能"})
						self.焦点 = true
					end
			    else
			        self.资源组[13]:显示(jxx,jxy)
					if self.鼠标 and self.资源组[13]:是否选中(x,y) and self.主选择界面==false then
						tp.提示:内丹提示(x,y,self.资源组[13],{名称="不可用内丹技能格",介绍="召唤兽可用内丹格数量与其参战等级相关"})
						self.焦点 = true
					end
			    end
			end
		end
	end

	if self.副状态==1 then
		local xx = 0
		local yy = 0
		for n=1,12 do
			local jx = self.x + 20 + (xx * 41) + 330
			local jy = self.y + 299 + (yy * 41)
			self.资源组[26]:显示(jx,jy)
			if self.副选择~=nil then
				self.副技能[n+self.副技能加入]:置坐标(jx+3,jy+2)
				self.副技能[n+self.副技能加入]:显示(x,y,self.鼠标)
				if self.副技能[n+self.副技能加入].焦点 and self.副技能[n+self.副技能加入].技能 ~= nil and self.副选择界面==false and self.鼠标 then
					tp.提示:技能(x,y,self.副技能[n+self.副技能加入].技能)
				end
			end
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
		if self.副选择~=nil and tp.队伍[1].宝宝列表[self.副选择]~=nil then

			if tp.队伍[1].宝宝列表[self.副选择].法术认证~=nil then
				local xx=3
				local yy=2
				local jx = self.x + 20 + (xx * 41) + 330
				local jy = self.y + 299 + (yy * 41)
				if #tp.队伍[1].宝宝列表[self.副选择].技能 <=12 and self.副技能加入 == 0 then
					self.资源组[11]:显示(jx,jy)
					self.副认证格子:置坐标(jx+3,jy+2)
					self.副认证格子:显示(x,y,self.鼠标)
					self.资源组[27]:显示(jx+2,jy+2)
					if self.副认证格子.焦点 and self.副认证格子.技能 ~= nil and self.副选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.副认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.副选择].技能 >12 and self.副技能加入 == 12 then
					self.资源组[11]:显示(jx,jy)
					self.副认证格子:置坐标(jx+3,jy+2)
					self.副认证格子:显示(x,y,self.鼠标)
					self.资源组[27]:显示(jx+2,jy+2)
					if self.副认证格子.焦点 and self.副认证格子.技能 ~= nil and self.副选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.副认证格子.技能)
					end
				end
			end
			if #tp.队伍[1].宝宝列表[self.副选择].技能 > 12 then
				self.副上页:更新(x,y)
				self.副上页:显示(self.x+192+330,self.y+310)
				self.副下页:更新(x,y)
				self.副下页:显示(self.x+192+330,self.y+390)
				if self.副上页:事件判断() then
					if self.副技能加入 == 0 then
						tp.常规提示:打开("#Y/已经是第一页技能了")
					else
						self.副技能加入 = 0
					end
				elseif self.副下页:事件判断() then
					if self.副技能加入 == 0 then
						self.副技能加入 = 12
					else
						tp.常规提示:打开("#Y/已经是第二页技能了")
					end
				end
			end
		end
	elseif self.副状态==2 then
		local jx = self.x+20 + 330
		local jy = self.y+299
		self.资源组[12]:显示(jx,jy)
		local bb = tp.队伍[1].宝宝列表[self.副选择]
		for i=1,6 do
			local jxx = jx + yx[i][1]
			local jxy = jy + yx[i][2]
			if bb~=nil then
				if i<= bb.内丹.内丹上限 then
			      	if self.副内丹数据[i] ~= nil then
					  	self.副内丹数据[i].内丹.模型:显示(jxx,jxy)
			   	      	if self.副内丹数据[i].内丹.模型:是否选中(鼠标.x,鼠标.y) then
					    	tp.提示:内丹提示2(x,y,self.副内丹数据[i])
					 	end
			        else
			        	self.资源组[14]:显示(jxx,jxy)
						if self.鼠标 and self.资源组[14]:是否选中(x,y) and self.副选择界面==false then
							tp.提示:内丹提示(x,y,self.资源组[14],{名称="可用的内丹技能格",介绍="可以学习的内丹技能"})
							self.焦点 = true
						end
					end
				else
					self.资源组[13]:显示(jxx,jxy)
					if self.鼠标 and self.资源组[13]:是否选中(x,y) and self.副选择界面==false then
						tp.提示:内丹提示(x,y,self.资源组[13],{名称="不可用内丹技能格",介绍="召唤兽可用内丹格数量与其参战等级相关"})
						self.焦点 = true
					end
				end
			else
			    if i == 1 then
			    	self.资源组[14]:显示(jxx,jxy)
			    	if self.鼠标 and self.资源组[14]:是否选中(x,y) and self.副选择界面==false then
						tp.提示:内丹提示(x,y,self.资源组[14],{名称="可用的内丹技能格",介绍="可以学习的内丹技能"})
						self.焦点 = true
					end
			    else
			        self.资源组[13]:显示(jxx,jxy)
					if self.鼠标 and self.资源组[13]:是否选中(x,y) and self.副选择界面==false then
						tp.提示:内丹提示(x,y,self.资源组[13],{名称="不可用内丹技能格",介绍="召唤兽可用内丹格数量与其参战等级相关"})
						self.焦点 = true
					end
			    end
			end
		end
	end

	if self.主宠 ~= nil and self.主召唤兽 ~= nil then
		tp.影子:显示(self.x + 120,self.y + 120)
		self.主宠:显示(self.x + 120,self.y + 120)
		if self.资源组[28] ~= nil then
			self.资源组[28]:更新(dt)
			self.资源组[28]:显示(self.x + 120,self.y + 120)
		end
		if self.资源组[29] ~= nil then
			self.资源组[29]:更新(dt)
			self.资源组[29]:显示(self.x + 120,self.y + 120)
		end
	end
	if self.副宠 ~= nil and self.副召唤兽 ~= nil then
		tp.影子:显示(self.x + 450,self.y + 120)
		self.副宠:显示(self.x + 450,self.y + 120)
		if self.资源组[30] ~= nil then
			self.资源组[30]:更新(dt)
			self.资源组[30]:显示(self.x + 450,self.y + 120)
		end
		if self.资源组[31] ~= nil then
			self.资源组[31]:更新(dt)
			self.资源组[31]:显示(self.x + 450,self.y + 120)
		end
	end
	if self.主选择界面 then
		self:主选择召唤兽(x,y)
	end
	if self.副选择界面 then
		self:副选择召唤兽(x,y)
	end
	if self.资源组[21].接触 or self.资源组[25].接触 then
		self.焦点 = true
	end

	if self.主选择 ~= nil and self.副选择 ~= nil then
		发送数据(5009.1,{序列=self.主选择认证,序列1=self.副选择认证})
	end
	if self.资源组[3]:是否选中(x,y)  then
		if self.主选择 ~= nil and self.副选择 ~= nil then
		local 主宝宝 = bblb[self.主选择]
		local 副宝宝 = bblb[self.副选择]
		if 主宝宝~=nil and 副宝宝~=nil then

tp.提示:自定义(x-150,y-280,"#P攻击资质："..(math.floor((主宝宝.攻击资质+副宝宝.攻击资质)/2*0.95)).."#R +"..string.format("%.1f",合宠材料数量/100).."% #P".."- "..(math.floor((主宝宝.攻击资质+副宝宝.攻击资质)/2*1.05)).."\n"..
							"#P防御资质："..(math.floor((主宝宝.防御资质+副宝宝.防御资质)/2*0.95)).."#R +"..string.format("%.1f",合宠材料数量/100).."% #P".."- "..(math.floor((主宝宝.防御资质+副宝宝.防御资质)/2*1.05)).."\n"..
							"#P体力资质："..(math.floor((主宝宝.体力资质+副宝宝.体力资质)/2*0.95)).."#R +"..string.format("%.1f",合宠材料数量/100).."% #P".."- "..(math.floor((主宝宝.体力资质+副宝宝.体力资质)/2*1.05)).."\n"..
							"#P法力资质："..(math.floor((主宝宝.法力资质+副宝宝.法力资质)/2*0.95)).."#R +"..string.format("%.1f",合宠材料数量/100).."% #P".."- "..(math.floor((主宝宝.法力资质+副宝宝.法力资质)/2*1.05)).."\n"..
							"#P速度资质："..(math.floor((主宝宝.速度资质+副宝宝.速度资质)/2*0.95)).."#R +"..string.format("%.1f",合宠材料数量/100).."% #P".."- "..(math.floor((主宝宝.速度资质+副宝宝.速度资质)/2*1.05)).."\n"..
							"#P躲闪资质："..(math.floor((主宝宝.躲闪资质+副宝宝.躲闪资质)/2*0.95)).."#R +"..string.format("%.1f",合宠材料数量/100).."% #P".."- "..(math.floor((主宝宝.躲闪资质+副宝宝.躲闪资质)/2*1.05)).."\n"..
							"#P成　　长："..string.format("%.3f",(主宝宝.成长+副宝宝.成长)/2*0.92).."#R+"..(合宠材料数量/100).."%".."#P - "..string.format("%.3f",(副宝宝.成长+副宝宝.成长)/2*1.02).."\n"..
							"#P技能结果："..math.floor(self.技能最大数量/2).." - "..self.技能最大数量.."#R+"..string.format("%.2f",合宠材料数量/100).."%".." 继承率"
					)
	-- tp.提示:自定义(x-100,y-280,"#P攻击资质："..(math.floor((主宝宝.攻击资质+副宝宝.攻击资质)/2*0.95)).."-"..(math.floor((主宝宝.攻击资质+副宝宝.攻击资质)/2*1.05)).."\n"..
	-- 						"#P防御资质："..(math.floor((主宝宝.防御资质+副宝宝.防御资质)/2*0.95)).."-"..(math.floor((主宝宝.防御资质+副宝宝.防御资质)/2*1.05)).."\n"..
	-- 						"#P体力资质："..(math.floor((主宝宝.体力资质+副宝宝.体力资质)/2*0.95)).."-"..(math.floor((主宝宝.体力资质+副宝宝.体力资质)/2*1.05)).."\n"..
	-- 						"#P法力资质："..(math.floor((主宝宝.法力资质+副宝宝.法力资质)/2*0.95)).."-"..(math.floor((主宝宝.法力资质+副宝宝.法力资质)/2*1.05)).."\n"..
	-- 						"#P速度资质："..(math.floor((主宝宝.速度资质+副宝宝.速度资质)/2*0.95)).."-"..(math.floor((主宝宝.速度资质+副宝宝.速度资质)/2*1.05)).."\n"..
	-- 						"#P躲闪资质："..(math.floor((主宝宝.躲闪资质+副宝宝.躲闪资质)/2*0.95)).."-"..(math.floor((主宝宝.躲闪资质+副宝宝.躲闪资质)/2*1.05)).."\n"..
	-- 						"#P成　　长："..string.format("%.3f",(主宝宝.成长+副宝宝.成长)/2*0.95).."-"..string.format("%.3f",(副宝宝.成长+副宝宝.成长)/2*1.05).."\n"..
	-- 						"#P技能结果："..math.floor(self.技能最大数量/2).."-"..self.技能最大数量
	-- 				)


			end
		end

	elseif tp.物品格子背景_:是否选中(x,y) and 引擎.鼠标弹起(0) then
		发送数据(3782.1)
		tp.常规提示:打开("#Y/请放入神兜兜")


	end






end

function 场景类_宠物合宠栏:主选择召唤兽(x,y)
	self.主加入 = 0
	self.资源组[18]:显示(self.x,self.y+185)
	self.资源组[6]:置宽高(135,217)
	self.资源组[6]:显示(self.x+18,self.y+185+12+15)
	local bbs = tp.队伍[1].宝宝列表
	local bbsa = #bbs
	if bbsa > 5 then
		self.资源组[21]:置高度(min(math.floor(143/(bbsa-5)),104))
		self.主加入 = min(math.ceil((bbsa-5)*self.资源组[21]:取百分比()),bbsa-5)
	end
	self.资源组[19]:更新(x,y,self.主加入 > 0)
	self.资源组[20]:更新(x,y,self.主加入 < bbsa - 5)
	-- tp.画线:置区域(0,0,15,190)
	-- tp.画线:显示(self.x+141,self.y+215)
	self.资源组[19]:显示(self.x+142,self.y+198+14)
	self.资源组[20]:显示(self.x+142,self.y+393+14-8+16)
	if bbsa > 5 then
		self.资源组[21]:显示(self.x+142,self.y+227,x,y,self.鼠标)
	end
	if self.资源组[20]:事件判断() or ( self.资源组[18]:是否选中(x,y) and 引擎.取鼠标滚轮() ==-1 and self.主加入 < bbsa - 5 ) then--鼠标下滚动
		self.资源组[21]:置起始点(self.资源组[21]:取百分比转换(self.主加入+1,5,bbsa))
		self.主头像组 = {}
	elseif self.资源组[19]:事件判断() or ( self.资源组[18]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.主加入 > 0 ) then--鼠标上滚动
		self.资源组[21]:置起始点(self.资源组[21]:取百分比转换(self.主加入-1,5,bbsa))
		self.主头像组 = {}
	end
	for i=1,5 do
		if bbs[i+self.主加入] ~= nil then
			local jx = self.x+20
			local jy = self.y+160+14+(i*42)
			bw1:置坐标(self.x+20,self.y+160+14+i*42)
			if bw1:检查点(x,y) and self.鼠标 then
				self.焦点=true
				box(self.x+20,self.y+160+14+i*42,self.x+130,self.y+200+14+i*42,-2097481216)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					if bbs[i + self.主加入].参战信息~=nil or bbs[i + self.主加入].装备[1]~=nil or bbs[i + self.主加入].装备[2]~=nil or bbs[i + self.主加入].装备[3]~=nil or bbs[i + self.主加入].进阶==true then
						tp.常规提示:打开("#Y/已参战、有装备、有饰品、进阶的召唤兽，无法进行该操作！")
						return
					elseif bbs[i + self.主加入].等级 < 30 then
						tp.常规提示:打开("#Y/召唤兽未到30级，无法进行该操作！")
						return
					elseif bbs[i + self.主加入].种类~=nil and bbs[i + self.主加入].种类=="神兽" then
						tp.常规提示:打开("#Y/神兽无法进行该操作！")
						return
					elseif bbs[i + self.主加入].加锁~=nil and bbs[i + self.主加入].加锁 then
						tp.常规提示:打开("#Y/加锁的召唤兽无法进行该操作。")
						return
					end
					self.主选择 = i + self.主加入
					self.主选择界面=false
					self.主召唤兽 = i + self.主加入
					self.主选择认证 = i + self.主加入
					self:主置形象()
					self.主技能加入 = 0
					local bb = bbs[self.主选择]
					local 序列=0
					self.主认证格子:置技能(nil)
					for n=1,24 do
						序列=序列+1
						if bb.技能[n]~=nil and bb.技能[n].名称==bb.法术认证 then
							序列=序列-1
							self.主认证格子:置技能(bb.技能[n])
						else
							self.主技能[序列]:置技能(DeepCopy(bb.技能[n]))
						end
					end
					self.主内丹数据 = {}
					zjcz=0
					for n = 1,#tp.坐骑列表 do
				    	if tp.坐骑列表[n].统御召唤兽[1] == bb.认证码 or tp.坐骑列表[n].统御召唤兽[2] == bb.认证码 then
					    	zjcz = tp.坐骑列表[n].初始成长
					    end
					end
					for n=1,bb.内丹.内丹上限 do
						if bb.内丹.格子 ~= nil and bb.内丹.格子[n] ~= nil then
				         	self.主内丹数据[n] =tp._内丹.创建()
							-- local item = self:取内丹数据(bb.内丹[n].技能,bb.内丹[n].等级)
							self.主内丹数据[n]:置内丹(bb.内丹.格子[n],zjcz,bb)
							-- self.主内丹数据[n].说明= item.说明
							-- self.主内丹数据[n].效果 = item.效果
							-- self.主内丹数据[n].模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
							-- self.主内丹数据[n].小模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
						end
			       	end
				end
			end
			if self.主头像组[i+self.主加入] == nil then
				local n = tx(bbs[i+self.主加入].模型)
				self.主头像组[i+self.主加入] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			self.资源组[22]:显示(jx+1,jy)
			self.主头像组[i+self.主加入]:显示(jx+4,jy+4)
			if bbs[i+self.主加入].参战信息 ~= nil then
				zts:置颜色(-256)
			else
				zts:置颜色(-16777216)
			end
			zts:显示(jx+41,jy+3,bbs[i+self.主加入].名称)
			zts:显示(jx+41,jy+21,bbs[i+self.主加入].等级.."级")
		end
	end
end

function 场景类_宠物合宠栏:副选择召唤兽(x,y)
	self.副加入 = 0
	self.资源组[18]:显示(self.x+340,self.y+185)
	self.资源组[6]:置宽高(135,217)
	self.资源组[6]:显示(self.x+358,self.y+185+12+15)
	local bbs = tp.队伍[1].宝宝列表
	local bbsa = #bbs
	if bbsa > 5 then
		self.资源组[25]:置高度(min(math.floor(143/(bbsa-5)),104))
		self.副加入 = min(math.ceil((bbsa-5)*self.资源组[25]:取百分比()),bbsa-5)
	end
	self.资源组[23]:更新(x,y,self.副加入 > 0)
	self.资源组[24]:更新(x,y,self.副加入 < bbsa - 5)

	self.资源组[23]:显示(self.x+476+5,self.y+198+14)
	self.资源组[24]:显示(self.x+476+5,self.y+393+14-8+16)
	if bbsa > 5 then
		self.资源组[25]:显示(self.x+478+5,self.y+227,x,y,self.鼠标)
	end
	if self.资源组[24]:事件判断() or ( self.资源组[18]:是否选中(x,y) and 引擎.取鼠标滚轮() ==-1 and self.副加入 < bbsa - 5 ) then--鼠标下滚动
		self.资源组[25]:置起始点(self.资源组[25]:取百分比转换(self.副加入+1,5,bbsa))
		self.副头像组 = {}
	elseif self.资源组[23]:事件判断()  or ( self.资源组[18]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.副加入 > 0 ) then--鼠标上滚动
		self.资源组[25]:置起始点(self.资源组[25]:取百分比转换(self.副加入-1,5,bbsa))
		self.副头像组 = {}
	end
	for i=1,5 do
		if bbs[i+self.副加入] ~= nil then
			local jx = self.x+360
			local jy = self.y+160+14+(i*42)
			bw1:置坐标(self.x+360,self.y+160+14+i*42)
			if bw1:检查点(x,y) and self.鼠标 then
				self.焦点=true
				box(self.x+360,self.y+160+14+i*42,self.x+470,self.y+200+14+i*42,-2097481216)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					if bbs[i + self.副加入].参战信息~=nil or bbs[i + self.副加入].装备[1]~=nil or bbs[i + self.副加入].装备[2]~=nil or bbs[i + self.副加入].装备[3]~=nil or bbs[i + self.副加入].进阶==true then
						tp.常规提示:打开("#Y/参战、有装备、有饰品、进阶的召唤兽，无法进行合成！")
						return
					elseif bbs[i + self.副加入].等级 < 30 then
						tp.常规提示:打开("#Y/召唤兽未到30级，无法进行合成！")
						return
					elseif bbs[i + self.副加入].种类~=nil and bbs[i + self.副加入].种类=="神兽" then
						tp.常规提示:打开("#Y/神兽无法进行合成！")
						return
					elseif bbs[i + self.副加入].加锁~=nil and bbs[i + self.副加入].加锁 then
						tp.常规提示:打开("#Y/加锁的召唤兽无法进行该操作。")
						return
					end
					self.副选择 = i + self.副加入
					self.副选择界面=false
					self.副召唤兽 = i + self.副加入
					self.副选择认证 = i + self.副加入
					self:副置形象()
					self.副技能加入 = 0
					local bb = bbs[self.副选择]
					local 序列=0
					self.副认证格子:置技能(nil)
					for n=1,24 do
						序列=序列+1
						if bb.技能[n]~=nil and bb.技能[n].名称==bb.法术认证 then
							序列=序列-1
							self.副认证格子:置技能(bb.技能[n])
						else
							self.副技能[序列]:置技能(DeepCopy(bb.技能[n]))
						end
					end
					self.副内丹数据 = {}
					local zjcz=0
					for n = 1,#tp.坐骑列表 do
				    	if tp.坐骑列表[n].统御召唤兽[1] == bb.认证码 or tp.坐骑列表[n].统御召唤兽[2] == bb.认证码 then
					    	zjcz = tp.坐骑列表[n].初始成长
					    end
					end
					for n=1,bb.内丹.内丹上限 do
						if bb.内丹.格子 ~= nil and bb.内丹.格子[n] ~= nil then
				         	self.副内丹数据[n] =tp._内丹.创建()
							-- local item = self:取内丹数据(bb.内丹[n].技能,bb.内丹[n].等级)
							self.副内丹数据[n]:置内丹(bb.内丹.格子[n],zjcz,bb)
							-- self.主内丹数据[n].说明= item.说明
							-- self.主内丹数据[n].效果 = item.效果
							-- self.主内丹数据[n].模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
							-- self.主内丹数据[n].小模型 = 引擎.场景.资源:载入(item.资源,"网易WDF动画",item.模型)
						end
			       	end
				end
			end
			if self.副头像组[i+self.副加入] == nil then
				local n = tx(bbs[i+self.副加入].模型)
				self.副头像组[i+self.副加入] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			self.资源组[22]:显示(jx+1,jy)
			self.副头像组[i+self.副加入]:显示(jx+4,jy+4)
			if bbs[i+self.副加入].参战信息 ~= nil then
				zts:置颜色(-256)
			else
				zts:置颜色(-16777216)
			end
			zts:显示(jx+41,jy+3,bbs[i+self.副加入].名称)
			zts:显示(jx+41,jy+21,bbs[i+self.副加入].等级.."级")
		end
	end
end

function 场景类_宠物合宠栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_宠物合宠栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if  self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_宠物合宠栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_宠物合宠栏