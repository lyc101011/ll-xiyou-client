
local 场景类_战斗召唤栏 = class()
local tp
local bw = require("gge包围盒")(0,0,140,34)
local tx = 引擎.取头像
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local box = 引擎.画矩形
local zts1,zts2
local floor = math.floor
local min = math.min
local max = math.max
local ceil = math.ceil

function 场景类_战斗召唤栏:初始化(根)
	self.ID = 107
	self.x =  350
	self.y =  140
	self.xx = 0
	self.yy = 0
	self.注释 = "战斗召唤栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	self.选中召唤兽 = 0
	self.加入 = 0
	self.人物 = ""
    tp = 根
	zts1 = tp.字体表.普通字体
	self.介绍文本 = require("script/系统类/丰富文本")(280,32)
	self.技能起始=1
	self.技能结束=12
end

function 场景类_战斗召唤栏:打开(人物,数量,伙伴id)

	self.召唤数量 = 数量
	self.伙伴id=伙伴id
	if self.可视 then
		self.加入 = 0
		self.选中召唤兽 = 0
		self.可视 = false
		-- 战斗类.战斗指令.召唤开关=false
		if self.伙伴id then
			战斗类.伙伴zhil.召唤开关=false
		else
			战斗类.战斗指令.召唤开关=false
		end

		self.介绍文本:清空()
		self.头像组={}
		return
	else
        self:加载资源()
		self.介绍文本.文字.大小 = 9
		self.介绍文本.文字高度 = 14
		self.介绍文本.文字宽度 = 6
		if not 战斗类.单挑模式 then
		self.介绍文本:添加文本("#Y/本场战斗还可以召唤#R/"..10-#self.召唤数量.."#Y/只召唤兽参战")
		end
		self.选中召唤兽 = 0
		self.人物 = 人物
		for i=1,#self.人物.宝宝列表 do
			local n = tx(self.人物.宝宝列表[i].模型)
			self.头像组[i] = tp.资源:载入(n[7],"网易WDF动画",n[1])
		end
		if 全局游戏宽度~=1024 then
		    self.x =  190
			self.y =  75
		else
			self.x =  350
			self.y =  140
		end
		self.可视 = true
		tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	  	-- 战斗类.战斗指令.召唤开关=true
	  	if self.伙伴id then
			战斗类.伙伴zhil.召唤开关=true
		else
			战斗类.战斗指令.召唤开关=true
		end
	end
end

function 场景类_战斗召唤栏:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[0] = 资源:载入('wzife.wd3',"网易WDF动画",1335849132),
		[1] = 自适应.创建(0,1,386,446,3,9),  --背景
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,nil,nil), --关闭
		[3] = 自适应.创建(34,1,165,226,3,9),--自适应.创建(2,1,165,226,3,9),  --头像背景
		[4] = 自适应.创建(3,1,140,20,1,3),  --文字背景
		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,nil,nil,"召唤上场"),
		[6] = tp._滑块.创建(自适应.创建(11,4,35,40,2,3,nil),1,14,192,2),--tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),4,14,192,2),  --滑块
		[7] = 按钮.创建(自适应.创建(20,4,18,19,4,3),0,0,4,nil,nil),  --上
		[8] = 按钮.创建(自适应.创建(21,4,18,19,4,3),0,0,4,nil,nil),  --下
		[9] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
		[11] = 按钮.创建(资源:载入(tp.宠物技能箭头,"网易WDF动画",0x7AB5584C),0,0,4,true,true),
		[12] = 按钮.创建(资源:载入(tp.宠物技能箭头,"网易WDF动画",0xCB50AB1D),0,0,4,true,true),
		[13] = 资源:载入('org.rpk',"网易WDF动画",0x1000368),
	}
	self.资源组[6]:置起始点(0)
	self.头像组={}
	self.物品={}
	self.技能={}
	local wp = tp._物品格子
	for i=1,3 do
	    self.物品[i] = wp(0,0,i,"召唤兽战斗物品")
	    self.物品[i]:置根(tp)
	    self.物品[i]:置物品(nil)
	end
	self.技能 = {}
	local jn = tp._技能格子
	for i=1,24 do
	    self.技能[i] = jn(0,0,i,"召唤兽战斗技能")
	end
	self.认证格子=jn(0,0,i,"召唤兽资质技能")
end

function 场景类_战斗召唤栏:更新(dt,mx,my)
	self:检查点(mx,my)
	if self.可视 then
		self.焦点 = false
		if self.鼠标 then
			if self.资源组[2]:事件判断()  then
				self:打开()
				return
			end
			if self.资源组[7]:事件判断() or (引擎.取鼠标滚轮() ==1 and self.加入>0) then
				self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.加入-1,5,#self.人物.宝宝列表))
			end
			if self.资源组[8]:事件判断() or (引擎.取鼠标滚轮() ==-1 and self.加入 < #self.人物.宝宝列表 - 10 ) then
				self.资源组[6]:置起始点(self.资源组[6]:取百分比转换(self.加入+1,5,#self.人物.宝宝列表))
			end
			if self.资源组[5]:事件判断() then
				if self:取是否召唤(self.选中召唤兽) then
					tp.常规提示:打开("#Y/该召唤兽已经参加过战斗了")
					return
                -- elseif self.人物.宝宝列表[self.选中召唤兽].参战等级>self.人物.等级 then
                -- 	tp.常规提示:打开("#Y/以你目前的能力还不足以驾驭此类型召唤兽")
                --  	return
                -- elseif self.人物.宝宝列表[self.选中召唤兽].等级>self.人物.等级+10 then
                -- 	tp.常规提示:打开("#Y/你不能召唤超过等级高于自己10级的召唤兽")
                --  	return
                else
                	if 10-#self.召唤数量<=0 and not 战斗类.单挑模式 then
                		tp.常规提示:打开("#Y/你在本次战斗中召唤已达10只上限！")
                		self:打开()
                		return
                	end

                	if self.伙伴id then
						战斗类.伙伴zhil:设置召唤(self.选中召唤兽,self.伙伴id)
					else
						战斗类.战斗指令:设置召唤(self.选中召唤兽)
					end
					-- 战斗类.战斗指令:设置召唤(self.选中召唤兽)
					self:打开()
					return
				end
			end
			if 引擎.鼠标弹起(1) and not tp.禁止关闭 then
				self:打开()
				return
			end
			if not self.资源组[6].接触 then
				tp.第一窗口移动中=false
			end
			if tp.按钮焦点 then
				self.焦点 = true
			end
		end
	end
end

function 场景类_战斗召唤栏:载入选中数据(选中)
	self.技能起始=1
	self.技能结束=12
	for i=1,3 do
	    self.物品[i]:置物品(self.人物.宝宝列表[选中].装备[i])
	end
	local 序列=0
	self.认证格子:置技能(nil)
	for i=1,24 do
		self.技能[i]:置技能(nil)
	end
	for i=1,24 do
   		序列=序列+1
   		local show = {}
   		show.名称=self.人物.宝宝列表[选中].技能[i]
   		if self.人物.宝宝列表[选中].技能[i]==self.人物.宝宝列表[选中].法术认证 then
   			序列=序列-1
   			self.认证格子:置技能(show)
   		else
   			self.技能[序列]:置技能(show)
   		end
	end
end

function 场景类_战斗召唤栏:显示(dt,mx,my)
	if self.可视 then
		--更新
		if #self.人物.宝宝列表 > 5 then
			self.资源组[6]:置高度(min(floor(192/(#self.人物.宝宝列表-5)),104))
			self.加入 = min(ceil((#self.人物.宝宝列表-5)*self.资源组[6]:取百分比()),#self.人物.宝宝列表-5)
		end
		self.资源组[2]:更新(mx,my)
		self.资源组[5]:更新1(mx,my,self.选中召唤兽 ~= 0 and self.人物.参战宝宝 ~= self.人物.宝宝列表[self.选中召唤兽])
		self.资源组[7]:更新(mx,my,self.加入 > 0)
		self.资源组[8]:更新(mx,my,self.加入 < #self.人物.宝宝列表 - 5)
		--显示
		self.资源组[1]:显示(self.x,self.y)
		self.资源组[2]:显示(self.x+364,self.y+3)
		tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
		引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+3,self.y+3,"选择上场召唤兽")
		self.资源组[3]:显示(self.x+16,self.y+35)
		self.资源组[7]:显示(self.x+170,self.y+35)
		self.资源组[8]:显示(self.x+170,self.y+244)
		self.资源组[5]:显示(self.x + 297,self.y + 418,true)
		if #self.人物.宝宝列表 > 5 then
			self.资源组[6]:显示(self.x+171,self.y+52,mx,my,self.鼠标)
		end
		for i=1,5 do
			if self.人物.宝宝列表[i+self.加入] ~= nil then
				local jx = self.x+21
				local jy = self.y+(i*43)
				bw:置坐标(jx,jy+1)
				local xz = bw:检查点(mx,my)
				-- 其他
				if self.选中召唤兽 ~= i+self.加入 then
					if not self.资源组[6].接触 and xz and self.鼠标 then
						if mouseb(0) then
							self.选中召唤兽 = i+self.加入
							self:载入选中数据(self.选中召唤兽)
						end
						self.焦点 = true
					end
				else
					box(jx-1,jy-3,jx+142,jy+41,0xffd4d870)
				end
				self.资源组[9]:显示(jx+1,jy)
				self.头像组[i+self.加入]:显示(jx+4,jy+4)

				if self:取是否召唤(i + self.加入)==false then
					zts:置颜色(黑色):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)
					zts:置颜色(黑色):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级")
				else
					if self.伙伴id then
						if self.人物.宝宝列表[i+self.加入].参战信息==1 then
							zts:置颜色(0xFF009900):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)--绿色以后统一一下
							zts:置颜色(0xFF009900):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级（战斗中）")
						else
							zts:置颜色(红色):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)
							zts:置颜色(红色):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级（已出场）")
						end
					else
						if tp.队伍[1].参战宝宝.认证码==self.人物.宝宝列表[i+self.加入].认证码 then
							zts:置颜色(0xFF009900):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)--绿色以后统一一下
							zts:置颜色(0xFF009900):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级（战斗中）")
						else
							zts:置颜色(红色):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)
							zts:置颜色(红色):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级（已出场）")
						end
					end
				end

				-- if self:取是否召唤(i + self.加入)==false then
			 --  		zts:置颜色(黑色):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)
				-- 	zts:置颜色(黑色):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级")
				-- else
				--     if tp.队伍[1].参战宝宝.认证码==self.人物.宝宝列表[i+self.加入].认证码 then
				--         zts:置颜色(0xFF009900):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)--绿色以后统一一下
				-- 		zts:置颜色(0xFF009900):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级（战斗中）")
				-- 	else
				-- 		zts:置颜色(红色):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)
				-- 		zts:置颜色(红色):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级（已出场）")
				--     end
			 -- 	-- 	zts:置颜色(红色):显示(jx+41,jy+3,self.人物.宝宝列表[i+self.加入].名称)
				-- 	-- zts:置颜色(红色):显示(jx+41,jy+21,self.人物.宝宝列表[i+self.加入].等级.."级")
			 -- 	end
			end
		end
		zts1:置颜色(白色):显示(self.x + 16,self.y+277,"名称")
		self.资源组[4]:显示(self.x+50,self.y+273)
		----
		zts1:置颜色(白色):显示(self.x + 196,self.y+277,"攻击")
		self.资源组[4]:显示(self.x+230,self.y+273)
		----
		zts1:置颜色(白色):显示(self.x + 16,self.y+307,"等级")
		self.资源组[4]:显示(self.x+50,self.y+303)
		----
		zts1:置颜色(白色):显示(self.x + 196,self.y+307,"防御")
		self.资源组[4]:显示(self.x+230,self.y+303)
		----
		zts1:置颜色(白色):显示(self.x + 16,self.y+337,"气血")
		self.资源组[4]:显示(self.x+50,self.y+333)
		----
		zts1:置颜色(白色):显示(self.x + 196,self.y+337,"速度")
		self.资源组[4]:显示(self.x+230,self.y+333)
		----
		zts1:置颜色(白色):显示(self.x + 16,self.y+367,"魔法")
		self.资源组[4]:显示(self.x+50,self.y+363)
		----
		zts1:置颜色(白色):显示(self.x + 196,self.y+367,"灵力")
		self.资源组[4]:显示(self.x+230,self.y+363)
		----
		zts1:置颜色(黄色):显示(self.x + 16,self.y+397,"寿命")
		self.资源组[4]:显示(self.x+50,self.y+393)
		----
		zts1:置颜色(白色):显示(self.x + 196,self.y+397,"忠诚")
		self.资源组[4]:显示(self.x+230,self.y+393)
		if self.选中召唤兽 ~= 0 then
			zts1:置颜色(黑色):显示(self.x + 238,self.y+337,self.人物.宝宝列表[self.选中召唤兽].速度)
			zts1:置颜色(黑色):显示(self.x + 58,self.y+337,self.人物.宝宝列表[self.选中召唤兽].气血.."/"..self.人物.宝宝列表[self.选中召唤兽].最大气血)
			zts1:置颜色(黑色):显示(self.x + 58,self.y+307,self.人物.宝宝列表[self.选中召唤兽].等级)
			zts1:置颜色(黑色):显示(self.x + 238,self.y+277,self.人物.宝宝列表[self.选中召唤兽].伤害)
			zts1:置颜色(黑色):显示(self.x + 58,self.y+277,self.人物.宝宝列表[self.选中召唤兽].名称)
			zts1:置颜色(黑色):显示(self.x + 238,self.y+307,self.人物.宝宝列表[self.选中召唤兽].防御)
			zts1:置颜色(黑色):显示(self.x + 238,self.y+397,floor(self.人物.宝宝列表[self.选中召唤兽].忠诚))
			zts1:置颜色(黑色):显示(self.x + 58,self.y+397,self.人物.宝宝列表[self.选中召唤兽].寿命)
			zts1:置颜色(黑色):显示(self.x + 238,self.y+367,self.人物.宝宝列表[self.选中召唤兽].灵力)
			zts1:置颜色(黑色):显示(self.x + 58,self.y+367,self.人物.宝宝列表[self.选中召唤兽].魔法.."/"..self.人物.宝宝列表[self.选中召唤兽].最大魔法)
			if self.人物.宝宝列表[self.选中召唤兽].进阶~= nil and self.人物.宝宝列表[self.选中召唤兽].进阶.灵性>80 and self.人物.宝宝列表[self.选中召唤兽].进阶.特性~="无" then
			    self.资源组[0]:显示(self.x+329,self.y+26)
			    zts:置颜色(0xFFFFFF00):显示(self.x+329+3,self.y+26+8,self.人物.宝宝列表[self.选中召唤兽].进阶.特性)
			end
		end
		self.介绍文本:显示(self.x+20,self.y+422)
		zts1:置颜色(白色):显示(self.x + 198,self.y+36,"召唤兽装备")
		-- self.资源组[10]:显示(self.x+193,self.y+56)
		tp.宝宝装备背景[1]:显示(self.x+199,self.y+61)
		tp.宝宝装备背景[2]:显示(self.x+199+60,self.y+61)
		tp.宝宝装备背景[3]:显示(self.x+199+60+60,self.y+61)
		local xx = 0
		local yy = 0
		for i=self.技能起始,self.技能结束 do
			local jx = self.x+198+(xx*41)
			local jy = self.y+123+(yy*41)
			self.资源组[13]:显示(jx,jy)
			if self.选中召唤兽 ~= 0 then
				self.技能[i]:置坐标(jx+1,jy+1)
				self.技能[i]:显示(mx,my,self.鼠标)
				if self.技能[i].焦点 and self.技能[i].技能 ~= nil then
					tp.提示:技能(mx,my,self.技能[i].技能)
				end
			end
			xx = xx + 1
			if xx > 3 then
				xx = 0
				yy = yy + 1
			end
		end
		if self.选中召唤兽~=0 and self.人物.宝宝列表[self.选中召唤兽].法术认证~=nil then
			if #self.人物.宝宝列表[self.选中召唤兽].技能>12 and self.技能结束==12 then

			else
				local xx=3
				local yy=2
				local jx = self.x+198+(xx*41)
				local jy = self.y+123+(yy*41)
				self.资源组[13]:显示(jx,jy)
				self.认证格子:置坐标(jx+3,jy+2)
				self.认证格子:显示(x,y,self.鼠标)
				引擎.画线(jx+3,jy+2,jx+3+40,jy+2,红色)
				引擎.画线(jx+3,jy+2+40,jx+3+40,jy+2+40,红色)
				引擎.画线(jx+3,jy+2,jx+3,jy+2+40,红色)
				引擎.画线(jx+3+40,jy+2,jx+3+40,jy+2+40,红色)
				if self.认证格子.焦点 and self.认证格子.技能 ~= nil then
					tp.提示:技能(mx,my,self.认证格子.技能)
				end
			end
		end
		if self.选中召唤兽~=0 and #self.人物.宝宝列表[self.选中召唤兽].技能>12 then
			self.资源组[11]:更新1(mx,my)
			self.资源组[12]:更新1(mx,my)
			self.资源组[11]:显示(self.x+368,self.y+130)
			self.资源组[12]:显示(self.x+368,self.y+220)
			if self.资源组[11]:事件判断() then
				self.技能起始=1
				self.技能结束=12
			elseif self.资源组[12]:事件判断() then
				self.技能起始=13
				self.技能结束=24
			end
		end
		if self.选中召唤兽 ~= 0 then
			for i=1,3 do
			    self.物品[i]:置坐标(self.x + 202 + (i-1) *60,self.y + 62)
			    self.物品[i]:显示(dt,mx,my,self.鼠标)
				if self.物品[i].物品 ~= nil and self.物品[i].焦点 then
					tp.提示:道具行囊(mx,my,self.物品[i].物品)
				end
			end
		end
	end
end

function 场景类_战斗召唤栏:取是否召唤(id)
	for n=1,#self.召唤数量 do
		if self.召唤数量[n]==id then
			return true
	 	end
	end
	return false
end

function 场景类_战斗召唤栏:检查点(x,y)
	local n = false
	self.鼠标=false
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		n  = true
		self.鼠标=true
	end
	return n
end

function 场景类_战斗召唤栏:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not 引擎.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	-- if not self.焦点 then
	-- 	tp.移动窗口 = true
	-- end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_战斗召唤栏:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_战斗召唤栏