local 场景类_坐骑属性栏 = class()
local tx = 引擎.取头像
local bw = require("gge包围盒")(0,0,140,30)
local box = 引擎.画矩形
local ani = 引擎.取战斗模型
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local tp,zts,zts1,zts2,ztstt3
local ceil = math.ceil
local tostring = tostring
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = table.insert
local zqj = 引擎.坐骑库
local tx = 引擎.取头像
local function 判断游戏名字(mz)
    if string.find(mz,"[%s%p%c%z%?\\!@#%$%%&%*%(%)%^,%.%+%-/<>;'\"%[%]{}]")~=nil then
        return 1
    elseif string.find(mz,"　")~=nil or string.find(mz, "GM") ~= nil or string.find(mz, "Gm") ~= nil or string.find(mz, "充值") ~= nil or string.find(mz, "gm") ~= nil or string.find(mz, "管理") ~= nil or string.find(mz, "老猫") ~= nil or string.find(mz, "国家") ~= nil or string.find(mz, "主席") ~= nil or string.find(mz, "近平") ~= nil then
        return 1
    end
end
function 场景类_坐骑属性栏:初始化(根)
	self.ID = 75
	self.x = 50
	self.y = 35
	self.xx = 0
	self.yy = 0
	self.注释 = "坐骑属性栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,370,390,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[4] = 自适应.创建(34,1,173,142,3,9),--坐骑选择框171,182  --33
		[5] = 自适应.创建(2,1,158,165,3,9),
		[6] = 按钮.创建(自适应.创建(12,4,84,22,1,3),0,0,4,true,true,"  骑 乘"),
		[7] = 按钮.创建(自适应.创建(12,4,84,22,1,3),0,0,4,true,true,"  驯 养"),
		[8] = 按钮.创建(自适应.创建(12,4,84,22,1,3),0,0,4,true,true,"  放 生"),
		[9] = 按钮.创建(自适应.创建(12,4,84,22,1,3),0,0,4,true,true,"  祥 瑞"),
		[10] = 按钮.创建(自适应.创建(12,4,70,22,1,3),0,0,4,true,true,"请选择"),
		[11] = 自适应.创建(3,1,87,19,1,3),--名称显示框
		[12] = 自适应.创建(3,1,66-11,19,1,3),--环境度
		[13] = 自适应.创建(3,1,87+40,19,1,3),--属性框1
		[14] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000379),0,0,4,true,true),--查看资质
		[15] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"喂养"),
		[16] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"修炼"),
		[17] = 根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,142,2),
		[18] = 资源:载入('org.rpk',"网易WDF动画",0x1000375),--经验
		[19] = 按钮.创建(根.资源:载入('common/wzife.wdf',"网易WDF动画",1518771720),0,0,1,true,true), --焕彩按钮
		[20] = 资源:载入('wzife.wd1',"网易WDF动画",0xE9063B56),--饰品  0x8561289C 空格子  8F00251E项链
		[21] = 按钮.创建(自适应.创建(12,4,30,22,1,3),0,0,4,true,true,"改 "),
		[23] = 自适应.创建(3,1,87+40,19,1,3),--成长那个框框

	}
	self.宝宝头像背景 = 按钮(根.资源:载入("wzife.wdf","网易WDF动画",0xCEC838D7),0,0,1,true,true)
	self.宝宝头像背景2 = 按钮(根.资源:载入("wzife.wdf","网易WDF动画",0xCEC838D7),0,0,1,true,true)
	for i=6,10 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	for i=14,16 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[19]:绑定窗口_(self.ID)
	self.资源组[21]:绑定窗口_(self.ID)


	self.资源组[10]:置偏移(5,0)

	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('坐骑总控件')
	总控件:置可视(true,true)
	self.名称输入框 = 总控件:创建输入("名称输入",0,0,100,14,根,根.字体表.华康14)
	self.名称输入框:置可视(false,false)
	self.名称输入框:置限制字数(12)
	self.名称输入框:置光标颜色(-16777216)
	self.名称输入框:置文字颜色(-16777216)

	zts = tp.字体表.普通字体
	zts1 = tp.字体表.普通字体__
	self.物品 = {}
	local wp = 根._物品格子
	for i=1,1 do
	    self.物品[i] = wp(0,0,i,"坐骑资质物品")--饰品装备框
	end
	self.加入 = 0
	self.选中 = 0
	self.记忆角色={}
	self.记忆角色[1]=nil
	self.记忆角色[2]=nil
	self.窗口时间 = 0

end


function 场景类_坐骑属性栏:打开()
	if self.可视 then
		self.加入 = 0
		self.选中 = 0
		self.可视 = false
		-- if tp.窗口.坐骑资质栏.可视 then
		-- 	tp.窗口.坐骑资质栏:打开()
		-- end
		if tp.窗口.坐骑技能栏.可视 then
			tp.窗口.坐骑技能栏:打开()
		end
		if tp.窗口.坐骑属性选择.可视 then
			tp.窗口.坐骑属性选择:打开()
		end
	else
		insert(tp.窗口_,self)
		if tp.坐骑列表==nil then
		    tp.坐骑列表={}
		end
		for i=1,#tp.坐骑列表 do
			if tp.坐骑列表[i].参战信息 ~= nil then
				if i > 4 then
					self.加入 = i-4
					self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.加入,4,#tp.坐骑列表))
				end
				self.选中 = i
				self.名称输入框:置文本(tp.坐骑列表[self.选中].名称)
				self.名称输入框:置可视(true,true)
				-- if tp.窗口.坐骑资质栏.可视 then
				-- 	tp.窗口.坐骑资质栏:打开(tp.坐骑列表[self.选中])
				-- end
				if tp.窗口.坐骑技能栏.可视 then
					tp.窗口.坐骑技能栏:打开(tp.坐骑列表[self.选中])
				end
				self:置形象()
				break
			end
		end
		if tp.坐骑列表[self.选中]~=nil then
		   	self.物品[i]:置物品(tp.坐骑列表[self.选中].饰品)
		end
		-- tp.窗口.坐骑属性选择:打开()
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_坐骑属性栏:删除统御召唤兽(内容)
	tp.坐骑列表[self.选中]=内容
end

function 场景类_坐骑属性栏:刷新好感度(内容)
	if tp.坐骑列表[self.选中]  ~= nil then
		if tp.队伍[1].宝宝列表[self.选中].认证码==内容.rzm then
		    tp.队伍[1].宝宝列表[self.选中].好感度=内容.hgd
		end
    end
end

function 场景类_坐骑属性栏:置形象()
	if tp.坐骑列表[self.选中]  ~= nil then
		local n = zqj(tp.队伍[1].模型,tp.坐骑列表[self.选中].模型,tp.坐骑列表[self.选中].饰品 or "空",tp.坐骑列表[self.选中].饰品2 or "空")--ani(tp.坐骑列表[self.选中].模型)

		self.资源组[24] = tp.资源:载入(n.坐骑资源,"网易WDF动画",n.坐骑站立)--坐骑
		if tp.坐骑列表[self.选中].炫彩 ~= nil then
			self.资源组[24]:炫彩染色(tp.坐骑列表[self.选中].炫彩,tp.坐骑列表[self.选中].炫彩组)
		end
		self.资源组[24]:置方向(1)
		if tp.坐骑列表[self.选中].饰品 ~= nil then
			self.资源组[25] = tp.资源:载入(n.坐骑饰品资源,"网易WDF动画",n.坐骑饰品站立)--饰品
			self.资源组[25]:置方向(1)
		end
		if tp.坐骑列表[self.选中].饰品2 ~= nil then
			self.资源组[40] = tp.资源:载入(n.坐骑饰品2资源,"网易WDF动画",n.坐骑饰品2站立)--饰品
			self.资源组[40]:置方向(1)
		end
		if tp.坐骑列表[self.选中].染色方案 ~= nil then
			self.资源组[24]:置染色(tp.坐骑列表[self.选中].染色方案,tp.坐骑列表[self.选中].染色组[1],tp.坐骑列表[self.选中].染色组[2],tp.坐骑列表[self.选中].染色组[3])
			self.资源组[24]:置方向(1)
		end
		self.物品[1]:置物品(tp.坐骑列表[self.选中].饰品)
	end
end

function 场景类_坐骑属性栏:显示(dt,x,y)
	-- 变量
	if not self.可视 then return end
	if tp.坐骑列表==nil then
		tp.坐骑列表={}
		self.选中=0
	end
	local bbs = tp.坐骑列表
	local bbsa = #bbs
	local bb
	if self.选中 ~= 0 then
		bb = bbs[self.选中]
	end
	-- 更新
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[6]:更新(x,y,bb ~= nil)
	self.资源组[7]:更新(x,y,bb ~= nil)
	self.资源组[8]:更新(x,y,bb ~= nil)
	self.资源组[9]:更新(x,y,bb ~= nil)
	self.资源组[10]:更新(x,y,bb ~= nil)
	self.资源组[14]:更新(x,y,bb ~= nil) --查看资质
	self.资源组[15]:更新(x,y,bb ~= nil) --查看资质
	self.资源组[16]:更新(x,y,bb ~= nil) --查看资质
	self.资源组[19]:更新(x,y,bb ~= nil)
	self.资源组[21]:更新(x,y,bb ~= nil)



	if self.资源组[19]:事件判断() then
		-- tp.窗口.坐骑炫彩:打开(bb.认证码,bb.模型,bb.饰品)
		tp.窗口.焕彩染色:打开("坐骑焕彩",bb.认证码,bb.模型,bb.饰品)
	elseif self.资源组[9]:事件判断() then
		if tp.窗口.祥瑞界面.可视==false then
			tp.窗口.祥瑞界面:打开()
		end
	end

	-- 显示
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"坐骑属性")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[4]:显示(self.x+12,self.y+29) --两个大白框
	self.资源组[5]:显示(self.x+197,self.y+28) --两个大白框
	self.资源组[6]:显示(self.x+10,self.y+183)--骑乘
	self.资源组[7]:显示(self.x+103,self.y+246-24+20+5-5+29+29+29,true)--驯养
	self.资源组[8]:显示(self.x+10,self.y+246-24+20+5-5+29+29+29,true)--放生
	self.资源组[9]:显示(self.x+103,self.y+183,true)--祥瑞
	self.资源组[14]:显示(self.x+270+11,self.y+418-59-2,true)--查看资质
	self.资源组[15]:显示(self.x+315-3,self.y+246-24+20+5-5+29+29+29,true)--修炼
	self.资源组[16]:显示(self.x+315-3,self.y+246-24+20+5-5+29+29,true)--喂养
	self.资源组[19]:显示(self.x+210,self.y+40)
	self.资源组[20]:显示(self.x+200,self.y+246-38) --物品格子
	self.资源组[21]:显示(self.x+155,self.y+217-5)--改

	zts:置颜色(4294967295)
	zts:显示(self.x+263,self.y+201,"统御的召唤兽")

	zts:显示(self.x+20-9,self.y+217,"名  称")
	self.资源组[11]:显示(self.x+54+5,self.y+246-48+20-5)--名称显示框
	zts:显示(self.x+20-9,self.y+246,"等  级")
	self.资源组[13]:显示(self.x+54+5,self.y+246-24+20+5-5)
	zts:显示(self.x+20-9,self.y+246+29,"成  长")
	self.资源组[23]:显示(self.x+54+5,self.y+246-24+20+5-5+29)
	zts:显示(self.x+20-9,self.y+246+29+29,"主属性")

	zts:显示(self.x+20-9+187,self.y+246+29,"环境度")
	self.资源组[12]:显示(self.x+54+5+187,self.y+246-24+20+5-5+29)

	zts:显示(self.x+20-9+187,self.y+246+29+29,"好感度")
	self.资源组[12]:显示(self.x+54+5+187,self.y+246-24+20+5-5+29+29)
	zts:显示(self.x+20-9+187,self.y+246+29+29+29,"饱食度")
	self.资源组[12]:显示(self.x+54+5+187,self.y+246-24+20+5-5+29+29+29)
	zts:显示(self.x+20-8,self.y+246-24+20+5-5+29+29+29+29+3,"经  验")


	if bbsa > 4 then
		self.资源组[17]:置高度(min(floor(142/(bbsa-4)),80))
		self.加入 = min(ceil((bbsa-4)*self.资源组[17]:取百分比()),bbsa-4)
		self.资源组[17]:显示(self.x+174,self.y+29,x,y,self.鼠标)
	end

	zts:置颜色(-16777216)
	for i=1,4 do
		if bbs[i+self.加入] ~= nil then
			local jx = self.x+18
			local jy = self.y+(i*30)+15
			bw:置坐标(jx,jy+1)
			if self.选中 ~= i+self.加入 then
				if bw:检查点(x,y) then
				    box(jx-1,jy-3,jx+142,jy+41-17,-3551379)
				    if mouseb(0) then
					    self.选中 = i+self.加入
					    self.名称输入框:置文本(bbs[self.选中].名称)
						self.名称输入框:置可视(true,true)
						self:置形象()
					end
				end
			else
				box(jx-1,jy-3,jx+142,jy+41-17,-10790181)
			end
			-- if bbs[i+self.加入].参战信息 ~= nil then
			-- 	zts:置颜色(-256)
			-- else
			-- 	zts:置颜色(-16777216)
			-- end
			zts:显示(jx+41-35,jy+3,bbs[i+self.加入].名称)
		end
	end

	self.物品[1]:置坐标(self.x+203,self.y+246-38)
	self.物品[1]:显示(dt,x,y,self.鼠标)
	if bb ~= nil and self.物品[1].物品 ~= nil and self.物品[1].焦点 then
		tp.提示:道具行囊(x,y,self.物品[1].物品)
	end
	tp.宠物头像背景_:显示(self.x+203+60,self.y+246-24)
	tp.宠物头像背景_:显示(self.x+203+105,self.y+246-24)
	self.宝宝头像背景:更新(x,y)
	self.宝宝头像背景2:更新(x,y)
	self.宝宝头像背景:显示(self.x+203+63,self.y+246-21,true)
	self.宝宝头像背景2:显示(self.x+203+108,self.y+246-21,true)

	if bb ~= nil then
		if bb.统御召唤兽~=nil  then
		    if bb.统御召唤兽[1]~=nil then
				if self.记忆角色[1] ~= bb.统御召唤兽[1] then
					local txmx = "海毛虫"
					for i=1,#tp.队伍[1].宝宝列表 do
						if tp.队伍[1].宝宝列表[i].认证码 == bb.统御召唤兽[1]  then
							txmx = tp.队伍[1].宝宝列表[i].模型
						end
					end
					local n = tx(txmx)
					self.宝宝头像背景 = tp._按钮(tp.资源:载入(n[7],"网易WDF动画",n[1]),0,0,1,true,true)
					self.记忆角色[1] = bb.统御召唤兽[1]
				end
		    else
				if self.记忆角色[1] ~= false then
					self.宝宝头像背景 = tp._按钮(tp.资源:载入("wzife.wdf","网易WDF动画",0xCEC838D7),0,0,1,true,true)
					self.记忆角色[1] = false
				end
		    end
		    if bb.统御召唤兽[2]~=nil then
				if self.记忆角色[2] ~= bb.统御召唤兽[2] then
					local txmx = "海毛虫"
					for i=1,#tp.队伍[1].宝宝列表 do
						if tp.队伍[1].宝宝列表[i].认证码 == bb.统御召唤兽[2]  then
							txmx = tp.队伍[1].宝宝列表[i].模型
						end
					end
					local nn = tx(txmx)
					self.宝宝头像背景2 = tp._按钮(tp.资源:载入(nn[7],"网易WDF动画",nn[1]),0,0,1,true,true)
					self.记忆角色[2] = bb.统御召唤兽[2]
				end
		    else
				if self.记忆角色[2] ~= false then
					self.宝宝头像背景2 = tp._按钮(tp.资源:载入("wzife.wdf","网易WDF动画",0xCEC838D7),0,0,1,true,true)
					self.记忆角色[2] = false
				end
		    end
		else
			if self.记忆角色[1] ~= false then
				self.宝宝头像背景 = tp._按钮(tp.资源:载入("wzife.wdf","网易WDF动画",0xCEC838D7),0,0,1,true,true)
				self.记忆角色[1] = false
			end
			if self.记忆角色[2] ~= false then
				self.宝宝头像背景2 = tp._按钮(tp.资源:载入("wzife.wdf","网易WDF动画",0xCEC838D7),0,0,1,true,true)
				self.记忆角色[2] = false
			end
		end

		local jx = self.x + 280
		local jy = self.y + 145--+25
		tp.影子:显示(jx,jy)
		if self.资源组[24] ~= nil then
			self.资源组[24]:更新(dt)
			self.资源组[24]:显示(jx,jy)
		end
		if self.选中~=0 and tp.队伍[1].坐骑~=nil and tp.坐骑列表 ~= nil and (tp.队伍[1].坐骑.认证码==tp.坐骑列表[self.选中].认证码 or (tp.队伍[1].坐骑~=nil and tp.队伍[1].坐骑[1]~=nil and tp.坐骑列表[self.选中].认证码==tp.队伍[1].坐骑[1].认证码)) then
			self.资源组[6]:置文字("  下 骑")
		else
			self.资源组[6]:置文字("  骑 乘")
		end
		if self.资源组[25] ~= nil then
			self.资源组[25]:更新(dt)
			self.资源组[25]:显示(jx,jy)
		end
		if self.资源组[40] ~= nil then
			self.资源组[40]:更新(dt)
			self.资源组[40]:显示(jx,jy)
		end
		-- 文字
		self.名称输入框:置坐标(self.x+67,self.y+217)
		self.控件类:更新(dt,x,y)
		self.控件类:显示(dt,x,y)
		if self.名称输入框._已碰撞 then
			self.焦点 = true
		end



		zts:置颜色(-16777216):显示(self.x + 67,self.y + 217+29,bb.等级)
		--===============
		zts:置颜色(-16777216):显示(self.x+ 67,self.y + 217+29+29,bb.初始成长+bb.额外成长)--成长
		if bb.主属性~=nil then
			self.资源组[13]:显示(self.x+59,self.y+300)
		    zts:显示(self.x+ 67,self.y + 304,bb.主属性)
		else
			self.资源组[10]:更新(x,y)
			self.资源组[10]:显示(self.x+59,self.y+300)
		end
		zts:置颜色(-16777216):显示(self.x+54+5+187+7,self.y+246+29,"100") --环境
		zts:置颜色(-16777216):显示(self.x+54+5+187+7,self.y+246+29+29,floor(bb.好感度)) --好感
		zts:置颜色(-16777216):显示(self.x+54+5+187+7,self.y+246+29+29+29,"100") --饱食
		tp.经验背景_:显示(self.x+54+5,self.y+246-24+20+5-5+29+29+29+29+3)
		self.资源组[18]:置区域(0,0,min(floor(bb.当前经验 / bb.最大经验 * 173),173),12)
		self.资源组[18]:显示(tp.经验背景_.x+2,tp.经验背景_.y+2)
		zts:置颜色(白色)
		local ts = format("%s/%s",bb.当前经验,bb.最大经验)
		zts1:置描边颜色(-16240640)
		zts1:置颜色(4294967295)
		zts1:显示(self.x + ((272-15 - zts1:取宽度(ts))/2)+8,self.y + 363,ts)

		if self.宝宝头像背景:事件判断() then
			tp.窗口.坐骑统御:打开(bb.认证码,bb.统御召唤兽,1)
			if tp.窗口.坐骑统御.可视 then
			    tp.窗口.坐骑统御.x = self.x + 370
				tp.窗口.坐骑统御.y = self.y
			end
		elseif self.宝宝头像背景2:事件判断() then
			tp.窗口.坐骑统御:打开(bb.认证码,bb.统御召唤兽,2)
			if tp.窗口.坐骑统御.可视 then
			    tp.窗口.坐骑统御.x = self.x + 370
				tp.窗口.坐骑统御.y = self.y
			end
		elseif self.宝宝头像背景:是否选中(x,y) and mouseb(1) then
			tp.禁止关闭 = true
			if bb.统御召唤兽~=nil and bb.统御召唤兽[1]~=nil then
				发送数据(59.1,{坐骑认证码=bb.认证码,编号=1})
			end
		elseif self.宝宝头像背景2:是否选中(x,y) and mouseb(1) then
			tp.禁止关闭 = true
			if bb.统御召唤兽~=nil and bb.统御召唤兽[2]~=nil then
				发送数据(59.1,{坐骑认证码=bb.认证码,编号=2})
			end
		elseif self.资源组[14]:事件判断() then
			tp.窗口.坐骑技能栏:打开(bb,self.选中)
			tp.窗口.坐骑技能栏.x = self.x + 370
			tp.窗口.坐骑技能栏.y = self.y
		-- elseif self.资源组[17]:事件判断() then --驯养
		-- 	发送数据(61,{坐骑编号=self.选中})
		-- elseif self.资源组[38]:事件判断() then  --喂养
		-- 	发送数据(60,{坐骑编号=self.选中})
		elseif self.资源组[23]:是否选中(x,y) then
			tp.提示:自定义(x-42,y+27,"#Y初始成长：#G"..bb.初始成长.." #Y额外成长：#G"..bb.额外成长)
		elseif self.资源组[10]:事件判断() then
			tp.窗口.坐骑属性选择:打开(bb.认证码)
		elseif self.资源组[4]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then--鼠标上滚动
			self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.加入-1,4,bbsa))
		elseif self.资源组[4]:是否选中(x,y) and 引擎.取鼠标滚轮() ==-1 and self.加入 < bbsa - 4 then--鼠标下滚动
			self.资源组[17]:置起始点(self.资源组[17]:取百分比转换(self.加入+1,4,bbsa))
		elseif self.资源组[8]:事件判断() then --放生
			if self.选中~=0 then
			    local 事件 = function()
					发送数据(11.3,{bb.认证码})
				end
				tp.窗口.文本栏:载入("真的要放生#Y/"..bb.等级.."级的坐骑#R/"..bb.名称.."#W/吗?",nil,true,事件)
			end

		elseif self.资源组[6]:事件判断() then --骑乘
			if self.资源组[6]:取文字()=="  骑 乘" then
				发送数据(26,{序列=self.选中})
			elseif self.资源组[6]:取文字()=="  下 骑" then
			    发送数据(27,{序列=0})
			end
		elseif self.资源组[21]:事件判断() then
			if #self.名称输入框:取文本()<12 then
				if 判断游戏名字(self.名称输入框:取文本())==1 then
					引擎.场景.常规提示:打开("#Y/名字不能带有空格或者特殊符号或者敏感词语")
				else
				    发送数据(60,{认证码=bb.认证码,名称=self.名称输入框:取文本()})
				end
			else
				tp.常规提示:打开("#Y/名称不能太长")
			end


		elseif self.资源组[7]:是否选中(x,y) then --驯养 喂经验
			tp.提示:自定义(x-42,y+27,"#Y当前驯养需：#G"..floor(bb.最大经验/2).." #Y点人物经验。")
			if self.资源组[7]:事件判断() then
				发送数据(61,{bb.认证码})
			end
        elseif self.资源组[16]:事件判断() then
        	tp.窗口.坐骑修炼:打开(bb.认证码,"修炼")
		end
	end
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
end

function 场景类_坐骑属性栏:改名(内容)
    tp.常规提示:打开("#Y/改名成功！")
    if self.选中~=0 then
        tp.坐骑列表[self.选中].名称=内容
    end

end

function 场景类_坐骑属性栏:放生()
	-- if tp.窗口.道具行囊.可视 and tp.窗口.道具行囊.窗口 == "坐骑" then
	-- 	if bb == tp.坐骑列表[tp.窗口.道具行囊.选中坐骑] then
	-- 		tp.窗口.道具行囊.选中坐骑 = 0
	-- 		tp.窗口.道具行囊.资源组[4] = nil
	-- 		tp.窗口.道具行囊.坐骑装饰[1]:置物品(nil)
	-- 	end
	-- end
	-- if v == 19 then
	-- 	table.insert(tp.坐骑仓库,bb)
	-- end
	-- table.remove(tp.坐骑列表,self.选中)
	self.名称输入框:置可视(false,false)
	-- if tp.窗口.坐骑资质栏.可视 then
	-- 	tp.窗口.坐骑资质栏:打开()
	-- end
	if tp.窗口.坐骑技能栏.可视 then
		tp.窗口.坐骑技能栏:打开()
	end
	self.选中 = 0
	self.加入 = 0
	self:置形象()
	tp.常规提示:打开("#Y/这只坐骑永久的消失了……")
end

function 场景类_坐骑属性栏:刷新经验(内容)
    if self.选中~=0 then
        tp.坐骑列表[self.选中]=内容
    end
end

function 场景类_坐骑属性栏:刷新(f)
	-- if tp.窗口.坐骑资质栏.可视 then
	-- 	tp.窗口.坐骑资质栏:打开()
	-- end
	if tp.窗口.坐骑技能栏.可视 then
		tp.窗口.坐骑技能栏:打开()
	end
	self.加入 = 0
	self.选中 = 0
	self.拽拖计次 = 0
	self.拽拖对象 = 0
	self.拽拖事件 = 0
	self.插入选区 = 0
	self.头像组 = {}
	self.名称输入框:置可视(false,false)
end

function 场景类_坐骑属性栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_坐骑属性栏:初始移动(x,y)
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

function 场景类_坐骑属性栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_坐骑属性栏