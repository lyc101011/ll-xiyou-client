-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-03 01:17:14

local 场景类_宠物打书内丹栏 = class()
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
function 场景类_宠物打书内丹栏:初始化(根)
	self.ID = 118
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "宠物打书内丹栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.主状态=1
	self.主选择=nil
	self.主选择认证=nil
	self.主选择界面=false
	self.主头像组 = {}
	self.主加入 = 0
	self.主技能加入 = 0
	self.主内丹数据 = nil
	self.主宠 = nil
	self.界面 = 1
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
	ztx = tp.字体表.普通字体_
	ztxx = tp.字体表.普通字体__
	dsmszt = tp.字体表.描边字体
	self.时间 = 0
end

function 场景类_宠物打书内丹栏:加载资源()
	local 按钮 = tp._按钮
	local 资源 = tp.资源
	local 自适应 = tp._自适应
	local 物品 = tp._物品格子
	self.资源组 = {
		[1] = 自适应.创建(0,1,535,450,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"打书"),
		[4] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"选择"),
		[5] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"内丹"),
		[6] = 自适应.创建(2,1,130,117,3,9),
		[7] = 自适应.创建(3,1,148,20,1,3),
		[8] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"技\n能"),
		[9] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"内\n丹"),
		[10] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000381),0,0,4,true,true,"进\n阶"),
		[11] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD),
		[12] = 资源:载入('wzife.wd1',"网易WDF动画",0x7367031D),
		[13] = 资源:载入('wzife.wd1',"网易WDF动画",0x1E714129),
		[14] = 资源:载入('wzife.wd1',"网易WDF动画",0xF2FC2425),
		[15] = 按钮.创建(自适应.创建(12,4,80,22,1,3),0,0,4,true,true,"其他"),
		[16] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true," 使 用 "),
		-- [17] = 按钮.创建(资源:载入('wzife.wd4',"网易WDF动画",0xCD999F0B),0,0,4,true,true),
		[17] = 资源:载入('wzife.wdf',"网易WDF动画",0x661470ed),
		[18] = 自适应.创建(0,1,170,240,3,9),
		[19] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,true,true),
		[20] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,true,true),
		[21] =  tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,177,2),
		[22] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
		[23] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true," 打 书 "),
		[24] = 按钮.创建(自适应.创建(12,4,65,22,1,3),0,0,4,true,true," 学 习 "),
		[25] =  tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,177,2),
		[26] = 资源:载入('wzife.wd1',"网易WDF动画",0x68D384BD),
	}
	for n=2,5 do
		self.资源组[n]:绑定窗口_(118)
	end
	for n=8,10 do
		self.资源组[n]:置偏移(-4,2)
		self.资源组[n]:绑定窗口_(118)
	end
	for n=15,16 do
		self.资源组[n]:绑定窗口_(118)
	end
	for n=19,20 do
		self.资源组[n]:绑定窗口_(118)
	end
	for n=23,24 do
		self.资源组[n]:绑定窗口_(118)
	end
	self.物品 = {}
	for i=1,20 do
		self.物品[i] = 物品.创建(0,0,i,"道具物品")
	end
	self.主技能 = {}
	local jn = tp._技能格子
	for i=1,24 do
	    self.主技能[i] = jn(0,0,i,"主召唤兽资质技能")
	end
	self.主认证格子=jn(0,0,i,"主召唤兽资质技能")
	self.材料物品 = 物品.创建(0,0,0,"材料_物品")
	self.主上页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x7AB5584C),0,0,4,true,true)
    self.主下页=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCB50AB1D),0,0,4,true,true)
end

function 场景类_宠物打书内丹栏:打开(数据,编号)
	if self.可视 then
		self.可视 = false
		self.主选择=nil
		self.主宠 = nil
		self.主选择界面=false
		self.主头像组 = {}
		self.资源组=nil
		self.主认证格子=nil
		self.材料物品=nil
		self.主上页=nil
		self.主下页=nil
		return
	else
		if 编号 == 1 then
			self.界面 = 1
			self.主状态 = 1
		elseif 编号 == 2 then
			self.界面 = 2
			self.主状态 = 2
		end

		insert(tp.窗口_,self)
		self:加载资源()
		self.x = (全局游戏宽度/2)-220
		self.y = (全局游戏高度/2)-200
		self.开始=1
		self.结束=20
		for n=self.开始,self.结束 do
			self.物品[n]:置根(tp)
			self.物品[n]:置物品(数据[n])
		end
	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	    self.材料物品.物品 = nil
	    self.主选择认证 = nil
	    self.主头像组 = {}
	    self.主内丹数据 = {}
	end
end

function 场景类_宠物打书内丹栏:刷新道具(数据)
    self.开始=1
    self.结束=20
    for n=self.开始,self.结束 do
	    self.物品[n]:置物品(nil)
	    self.物品[n]:置物品(数据[n])
    end
    self.材料物品:置物品(nil)
    if self.界面~=3 and self.主选择~=nil then
	    local bbs = tp.队伍[1].宝宝列表
	    local bb = bbs[self.主选择]
		local 序列=0
		self.主认证格子:置技能(nil)
		for n=1,24 do
			序列=序列+1
			if bb.技能[n]~=nil and bb.技能[n].名称==bb.法术认证 then
				序列=序列-1
				self.主认证格子:置技能(bb.技能[n])
			else
				self.主技能[序列]:置技能(bb.技能[n])
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
			end
       	end

	end
end



function 场景类_宠物打书内丹栏:清除()
 	tp.窗口.召唤兽属性栏:刷新()
	self.材料物品:置物品(nil)
	if self.界面 == 3 then
		self.主召唤兽 = nil
		self.主选择 = nil
		self.主选择认证 = nil
		self.主头像组 = {}
		self.主宠 = nil
	end
end

function 场景类_宠物打书内丹栏:主置形象()
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

function 场景类_宠物打书内丹栏:显示(dt,x,y)
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
	-- self.资源组[17]:更新(x,y,false)
	if self.主宠 ~= nil then
		self.主宠:更新(dt)
	end
	if self.副宠 ~= nil then
		self.副宠:更新(dt)
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	self.资源组[6]:置宽高(210,120)
	self.资源组[6]:显示(self.x + 15, self.y + 28)
	self.资源组[7]:显示(self.x + 15, self.y + 160)
	ztx:置颜色(白色):显示(self.x + 15, self.y + 191,"攻击资质:")
	ztx:置颜色(白色):显示(self.x + 135, self.y + 191,"法力资质:")
	ztx:置颜色(白色):显示(self.x + 15, self.y + 211,"防御资质:")
	ztx:置颜色(白色):显示(self.x + 135, self.y + 211,"速度资质:")
	ztx:置颜色(白色):显示(self.x + 15, self.y + 231,"体力资质:")
	ztx:置颜色(白色):显示(self.x + 135, self.y + 231,"躲闪资质:")
	ztx:置颜色(白色):显示(self.x + 15, self.y + 251,"寿 命:")
	ztx:置颜色(白色):显示(self.x + 135, self.y + 251,"成 长:")
	ztx:置颜色(白色):显示(self.x + 15, self.y + 271,"五 行:")
	if self.主选择 ~= nil and bblb[self.主选择]~=nil then
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
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[3]:显示(self.x + 265,self.y + 35,nil,nil,nil,self.界面 == 1,2)
	self.资源组[5]:显示(self.x + 350,self.y + 35,nil,nil,nil,self.界面 == 2,2)
	self.资源组[15]:显示(self.x + 435,self.y + 35,nil,nil,nil,self.界面 == 3,2)
	self.资源组[3]:置偏移(17,-1)
	self.资源组[5]:置偏移(17,-1)
	self.资源组[15]:置偏移(17,-1)
	tp.物品格子背景_:显示(self.x+267,self.y+75)
	tp.竖排花纹背景_:置区域(0,0,20,415)
	tp.竖排花纹背景_:显示(self.x+235,self.y+30)
	self.资源组[4]:显示(self.x + 170,self.y + 159)
	self.资源组[8]:显示(self.x + 210,self.y + 297,nil,nil,nil,self.主状态==1,2)
	self.资源组[9]:显示(self.x + 210,self.y + 342,nil,nil,nil,self.主状态==2,2)
	self.资源组[10]:显示(self.x + 210,self.y + 387)

	if self.资源组[2]:事件判断() then
    	self:打开()
    	return
    elseif self.资源组[3]:事件判断() then
    	self.界面 = 1
		if self.材料物品.物品~=nil then
			if self.材料物品.物品.可叠加 then
				增加物品(self.材料物品.物品,nil,self.材料物品.物品.数量,self.材料物品.物品编号)
			else
			    增加物品(self.材料物品.物品,nil,nil,self.材料物品.物品编号)
			end
		end
		self.材料物品:置物品(nil)
		self.主选择=nil
		self.主宠 = nil
		self.主选择界面=false
		self.主选择认证=nil
		self.主状态=1
    elseif self.资源组[5]:事件判断() then
    	self.界面 = 2
    	if self.材料物品.物品~=nil then
			if self.材料物品.物品.可叠加 then
				增加物品(self.材料物品.物品,nil,self.材料物品.物品.数量,self.材料物品.物品编号)
			else
			    增加物品(self.材料物品.物品,nil,nil,self.材料物品.物品编号)
			end
		end
		self.材料物品:置物品(nil)
		self.主选择=nil
		self.主宠 = nil
		self.主选择界面=false
		self.主选择认证=nil
		self.主状态=2
	elseif self.资源组[15]:事件判断() then
    	self.界面 = 3
    	if self.材料物品.物品~=nil then
			if self.材料物品.物品.可叠加 then
				增加物品(self.材料物品.物品,nil,self.材料物品.物品.数量,self.材料物品.物品编号)
			else
			    增加物品(self.材料物品.物品,nil,nil,self.材料物品.物品编号)
			end
		end
		self.材料物品:置物品(nil)
		self.主选择=nil
		self.主宠 = nil
		self.主选择界面=false
		self.主选择认证=nil
		self.主状态=1
    elseif self.资源组[4]:事件判断() then
    	if self.主选择界面==false then
			self.主选择界面=true
			self.主头像组 = {}
			self.资源组[21]:置起始点(0)
		else
		   	self.主选择界面=false
		end
    elseif self.资源组[23]:事件判断() then --打书
    	if self.主选择认证~=nil and (os.time() - self.时间 > 0 --[[ 可以设置间隔1秒]] or self.时间 == 0) then
    		self.时间 = os.time()
    		发送数据(5008,{序列=self.材料物品.物品编号,序列1=self.主选择认证})


    	elseif self.主选择认证==nil then
    	    tp.常规提示:打开("#Y/请先选择需要操作的召唤兽")

    	end
    elseif self.资源组[24]:事件判断() then --内丹
    	if self.主选择认证~=nil and (os.time() - self.时间 > 1 or self.时间 == 0) then
    		self.时间 = os.time()
    		发送数据(5011,{序列=self.材料物品.物品编号,序列1=self.主选择认证})
    	elseif self.主选择认证==nil then
    	    tp.常规提示:打开("#Y/请先选择需要操作的召唤兽")
    	end
    elseif self.资源组[16]:事件判断() then --其他
    	if self.主选择认证~=nil and (os.time() - self.时间 > 1 or self.时间 == 0) then
    		self.时间 = os.time()
    		发送数据(5008,{序列=self.材料物品.物品编号,序列1=self.主选择认证})
    		self:清除()
    	elseif self.主选择认证==nil then
    	    tp.常规提示:打开("#Y/请先选择需要操作的召唤兽")
    	end
    elseif self.资源组[8]:事件判断() then
    	self.主状态=1
    elseif self.资源组[9]:事件判断() then
    	self.主状态=2
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
					self.资源组[17]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.主选择].技能 >12 and #tp.队伍[1].宝宝列表[self.主选择].技能 <=24 and self.主技能加入 == 12 then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[17]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.主选择].技能 >24 and #tp.队伍[1].宝宝列表[self.主选择].技能 <=36  then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[17]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.主选择].技能 >36 and #tp.队伍[1].宝宝列表[self.主选择].技能 <=48  then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[17]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.主选择].技能 >48 and #tp.队伍[1].宝宝列表[self.主选择].技能 <=60  then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[17]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.主选择].技能 >60 and #tp.队伍[1].宝宝列表[self.主选择].技能 <=72  then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[17]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.主选择].技能 >72 and #tp.队伍[1].宝宝列表[self.主选择].技能 <=84  then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[17]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end
				elseif #tp.队伍[1].宝宝列表[self.主选择].技能 >84 then
					local xx=3
					local yy=2
					local jx = self.x + 20 + (xx * 41)
					local jy = self.y + 299 + (yy * 41)
					self.资源组[11]:显示(jx,jy)
					self.主认证格子:置坐标(jx+3,jy+2)
					self.主认证格子:显示(x,y,self.鼠标)
					self.资源组[17]:显示(jx+2,jy+2)
					if self.主认证格子.焦点 and self.主认证格子.技能 ~= nil and self.主选择界面==false and self.鼠标 then
						tp.提示:技能(x,y,self.主认证格子.技能)
					end

				end
			end
			if #tp.队伍[1].宝宝列表[self.主选择].技能 > 12 then
				self.主上页:更新(x,y) --要有x y .不然无法点击
				self.主上页:显示(self.x+192,self.y+310)
				self.主下页:更新(x,y)
				self.主下页:显示(self.x+192,self.y+390)
				if self.主上页:事件判断() then
					if self.主技能加入 == 0 then
						tp.常规提示:打开("#Y/已经是首页了")
					else
						self.主技能加入 = 0
					end
				elseif self.主下页:事件判断() then
					if self.主技能加入 == 0 then
						self.主技能加入 = 12
					else
						tp.常规提示:打开("#Y/已经是第二页了")
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
	if self.主选择界面 then
		self:主选择召唤兽(x,y)
	end
	if self.资源组[21].接触 then
		self.焦点 = true
	end
	if self.界面 == 1 then
		self:打书界面(dt,x,y)
	elseif self.界面 == 2 then
		self:内丹界面(dt,x,y)
	elseif self.界面 == 3 then
		self:其他界面(dt,x,y)
	end
end

function 场景类_宠物打书内丹栏:打书界面(dt,x,y)
	self.资源组[23]:更新(x,y,self.材料物品.物品~=nil)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"打 书")
	ztx:置颜色(白色):显示(self.x + 327, self.y + 75,"请放入魔兽要诀")
	self.资源组[23]:显示(self.x + 327,self.y + 105)
	tp.物品界面背景_:显示(self.x+265,self.y+145)
	ztxx:置颜色(白色):显示(self.x + 265, self.y + 365,"说明：")
	ztxx:置颜色(黄色):显示(self.x + 265, self.y + 385,"魔兽要诀能赋予召唤兽某种技能，但是每次使用\n有概率会消失该召唤兽的一项技能，也有概率直\n接在原有的技能基础上增加魔兽要诀的这个技能。")
	local p = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			p = p + 1
			self.物品[p]:置坐标(l * 51 + self.x+216,h * 51+self.y+95)
			if self.物品[p].物品~=nil then
				local xq = nil
				if self.物品[p].物品.名称 and (self.物品[p].物品.名称=="魔兽要诀" or self.物品[p].物品.名称=="高级魔兽要诀") then --物品详情
					xq=取兽诀缩写(self.物品[p].物品.附带技能)
				end
		    	self.物品[p]:显示(dt,x,y,self.鼠标,{0,0,self.物品[p].物品.总类 == 3 and self.物品[p].物品.分类 == 1},nil,nil,nil,xq) --and self.物品[p].名称~="召唤兽内丹" and self.物品[p].名称~="高级召唤兽内丹"
		    end
			if self.物品[p].焦点 then
				if self.物品[p].物品 ~= nil and self.鼠标 then
					tp.提示:道具行囊(x,y,self.物品[p].物品)
					if mouseb(0) and (self.物品[p].物品.总类 == 3 and self.物品[p].物品.分类 == 1) and self.物品[p].名称~="召唤兽内丹" and self.物品[p].名称~="高级召唤兽内丹" then
				    	if self.材料物品.物品 == nil then
				    		self.材料物品:置物品(self.物品[p].物品)
				    		self.材料物品.物品编号=p
				    		刷新道具逻辑(nil,p,true)
				    	end
				   	end
				end
			end
		end
	end
	dsmszt:置样式(0)
	if self.材料物品.物品~=nil then
		local xq = nil
		if self.材料物品.物品.名称 and (self.材料物品.物品.名称=="魔兽要诀" or self.材料物品.物品.名称=="高级魔兽要诀") then
			xq=取兽诀缩写(self.材料物品.物品.附带技能)
		end
		self.材料物品:置坐标(self.x+269,self.y+75)
		self.材料物品:显示(dt,x,y,self.鼠标,nil,nil,nil,nil,xq)
		if self.材料物品.焦点 and self.鼠标 then
			tp.提示:道具行囊(x,y,self.材料物品.物品)
			if mouseb(0) and self.鼠标 then
				if self.材料物品.物品.可叠加 then
					增加物品(self.材料物品.物品,nil,self.材料物品.物品.数量,self.材料物品.物品编号)
				else
				    增加物品(self.材料物品.物品,nil,nil,self.材料物品.物品编号)
				end
				self.材料物品:置物品(nil)
			end
		end
	end
end

function 场景类_宠物打书内丹栏:内丹界面(dt,x,y)
	self.资源组[24]:更新(x,y,self.材料物品.物品~=nil)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"内 丹")
	ztx:置颜色(白色):显示(self.x + 327, self.y + 75,"请放入内丹或者高级内丹")
	self.资源组[24]:显示(self.x + 327,self.y + 105)
	tp.物品界面背景_:显示(self.x+265,self.y+145)
	ztxx:置颜色(白色):显示(self.x + 265, self.y + 365,"说明：")
	ztxx:置颜色(黄色):显示(self.x + 265, self.y + 385,"新学习的内丹技能自动占据空余的内丹格子，\n如果没有空余内丹格子，则替换掉玩家指定的\n内丹（原内丹消失）。")
	local p = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			p = p + 1
			self.物品[p]:置坐标(l * 51 + self.x+216,h * 51+self.y+95)
			if self.物品[p].物品~=nil then
				local xq = nil
				if self.物品[p].物品.总类 == 203 and self.物品[p].物品.分类 == 1 and self.物品[p].物品.特效 then
				    xq = self.物品[p].物品.特效
				end
		    	self.物品[p]:显示(dt,x,y,self.鼠标,{0,0,self.物品[p].物品.总类 == 203 and self.物品[p].物品.分类 == 1},nil,nil,nil,xq)
		    end
			if self.物品[p].焦点 and self.鼠标 then
				if self.物品[p].物品 ~= nil then
					tp.提示:道具行囊(x,y,self.物品[p].物品)
					if mouseb(0) and (self.物品[p].物品.总类 == 203 and self.物品[p].物品.分类 == 1) then-- and self.物品[p].名称~="高级魔兽要诀" and self.物品[p].名称~="魔兽要诀"
				    	if self.材料物品.物品 == nil then
				    		self.材料物品:置物品(self.物品[p].物品)
				    		self.材料物品.物品编号=p
				    		刷新道具逻辑(nil,p,true)
				    	end
				   	end
				end
			end
		end
	end
	dsmszt:置样式(0)
	if self.材料物品.物品~=nil then
		local xq = nil
		if self.材料物品.物品.总类 == 203 and self.材料物品.物品.分类 == 1 and self.材料物品.物品.特效 then
		    xq = self.材料物品.物品.特效
		end
		self.材料物品:置坐标(self.x+269,self.y+75)
		self.材料物品:显示(dt,x,y,self.鼠标,nil,nil,nil,nil,xq)
		if self.材料物品.焦点 and self.鼠标 then
			tp.提示:道具行囊(x,y,self.材料物品.物品)
			if mouseb(0) and self.鼠标 then
				if self.材料物品.物品.可叠加 then
					增加物品(self.材料物品.物品,nil,self.材料物品.物品.数量,self.材料物品.物品编号)
				else
				    增加物品(self.材料物品.物品,nil,nil,self.材料物品.物品编号)
				end
				self.材料物品:置物品(nil)
			end
		end
	end
end

function 场景类_宠物打书内丹栏:其他界面(dt,x,y)
	self.资源组[16]:更新(x,y,self.材料物品.物品~=nil)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"使用道具")
	ztx:置颜色(白色):显示(self.x + 327, self.y + 75,"请放入要使用的道具")
	self.资源组[16]:显示(self.x + 327,self.y + 105)
	tp.物品界面背景_:显示(self.x+265,self.y+145)
	ztxx:置颜色(白色):显示(self.x + 265, self.y + 365,"说明：")
	ztxx:置颜色(黄色):显示(self.x + 265, self.y + 385,"可使用的道具包括吸附石与圣兽丹等。")
	local p = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			p = p + 1
			self.物品[p]:置坐标(l * 51 + self.x+216,h * 51+self.y+95)
			if self.物品[p].物品~=nil then
				if self.物品[p].名称=="吸附石" then
					self.物品[p]:显示(dt,x,y,self.鼠标)
				else
					self.物品[p]:显示(dt,x,y,self.鼠标,{0,0,((self.物品[p].物品.总类 == 3 and self.物品[p].物品.分类 == 2) or self.物品[p].物品.总类 == 683) and self.物品[p].名称~="魔兽要诀"
					and self.物品[p].名称~="高级魔兽要诀"  and self.物品[p].名称~="召唤兽内丹" and self.物品[p].名称~="高级召唤兽内丹" and self.物品[p].名称~="金柳露" and self.物品[p].名称~="超级金柳露" })
				end
		    end
			if self.物品[p].焦点 then
				if self.物品[p].物品 ~= nil and self.鼠标 then
					tp.提示:道具行囊(x,y,self.物品[p].物品)
					if mouseb(0) and ((self.物品[p].物品.总类 == 3 and self.物品[p].物品.分类 == 2) or self.物品[p].物品.总类 == 683) and self.物品[p].名称~="魔兽要诀" and self.物品[p].名称~="高级魔兽要诀"  and
						self.物品[p].名称~="召唤兽内丹" and self.物品[p].名称~="高级召唤兽内丹" and self.物品[p].名称~="金柳露"and self.物品[p].名称~="超级金柳露" then
				    	if self.材料物品.物品 == nil then
				    		self.材料物品:置物品(self.物品[p].物品)
				    		self.材料物品.物品编号=p
				    		刷新道具逻辑(nil,p,true)
				    	end
				   	end
				end
			end
		end
	end
	dsmszt:置样式(0)
	if self.材料物品.物品~=nil then
		self.材料物品:置坐标(self.x+269,self.y+75)
		self.材料物品:显示(dt,x,y,self.鼠标)
		if self.材料物品.焦点 and self.鼠标 then
			tp.提示:道具行囊(x,y,self.材料物品.物品)
			if mouseb(0) and self.鼠标 then
				if self.材料物品.物品.可叠加 then
					增加物品(self.材料物品.物品,nil,self.材料物品.物品.数量,self.材料物品.物品编号)
				else
				    增加物品(self.材料物品.物品,nil,nil,self.材料物品.物品编号)
				end
				self.材料物品:置物品(nil)
			end
		end
	end
end

function 场景类_宠物打书内丹栏:主选择召唤兽(x,y)
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
			if bw1:检查点(x,y) then
				self.焦点=true
				box(self.x+20,self.y+160+14+i*42,self.x+130,self.y+200+14+i*42,-2097481216)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					if (bbs[i + self.主加入].参战信息~=nil or bbs[i + self.主加入].装备[1]~=nil or bbs[i + self.主加入].装备[2]~=nil or bbs[i + self.主加入].装备[3]~=nil) and self.界面 == 3 then
						tp.常规提示:打开("#Y/已参战、有装备、有饰品的召唤兽，无法进行该操作！")
						return
					elseif bbs[i + self.主加入].种类~=nil and bbs[i + self.主加入].种类=="神兽" and self.界面 == 3 then
						tp.常规提示:打开("#Y/神兽无法进行该操作！")
						return
					elseif bbs[i + self.主加入].加锁~=nil and bbs[i + self.主加入].加锁 then
						tp.常规提示:打开("#Y/加锁的召唤兽无法进行该操作！")
						return
					end
					if bbs[i + self.主加入].参战信息~=nil and self.界面 ~= 3 then
						tp.常规提示:打开("#Y/已参战的召唤兽，无法进行该操作！")
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

function 场景类_宠物打书内丹栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_宠物打书内丹栏:初始移动(x,y)
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

function 场景类_宠物打书内丹栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_宠物打书内丹栏