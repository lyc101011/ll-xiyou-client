-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-02 07:02:03
local 场景类_召唤兽属性栏 = class()
local tx = 引擎.取头像
local bw = require("gge包围盒")(0,0,140,34)
local box = 引擎.画矩形
local ani = 引擎.取战斗模型
local format = string.format
local floor = math.floor
local min = math.min
local max = math.max
local tp,sxzt,zts1,ztstt3
local ceil = math.ceil
local keyaz = 引擎.按键按住
local tostring = tostring
local bd0 = {"气血","魔法","攻击","防御","速度","灵力"}
local bd = {"体质","魔力","力量","耐力","敏捷"}
local xas = {"体质","法力","力量","耐力","敏捷"}
local tainfufu = {"最大气血","最大魔法","攻击","防御","速度","灵力"}
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = table.insert
local function 判断游戏名字(mz)
    if string.find(mz,"[%s%p%c%z%?\\!@#%$%%&%*%(%)%^,%.%+%-/<>;'\"%[%]{}]")~=nil then
        return 1
    elseif string.find(mz,"　")~=nil or string.find(mz, "GM") ~= nil or string.find(mz, "Gm") ~= nil or string.find(mz, "充值") ~= nil or string.find(mz, "gm") ~= nil or string.find(mz, "管理") ~= nil or string.find(mz, "老猫") ~= nil or string.find(mz, "国家") ~= nil or string.find(mz, "主席") ~= nil or string.find(mz, "近平") ~= nil then
        return 1
    end
end
function 场景类_召唤兽属性栏:初始化(根)
	self.ID = 11
	self.x = 0
	self.y = 95
	self.xx = 0
	self.yy = 0
	self.注释 = "召唤兽属性栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,368,454,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"参战"),
		[4] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"改名"),
		[5] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[7] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[8] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[9] = 按钮.创建(自适应.创建(25,4,19,19,4,3),0,0,4,true,true),
		[10] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[11] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[12] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[13] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[14] = 按钮.创建(自适应.创建(26,4,19,19,4,3),0,0,4,true,true),
		[15] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"推荐加点"),
		[16] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"预览"),
		[17] = 按钮.创建(根.资源:载入('common/wzife.wdf',"网易WDF动画",1518771720),0,0,1,true,true),
		[18] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"放生"),
		[19] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"观看"),
		[20] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"鉴定"),
		[21] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确认加点"),
		[22] = 按钮.创建(资源:载入('org.rpk',"网易WDF动画",0x1000379),0,0,4,true,true),--查看资质
		[23] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
		[26] = 资源:载入('org.rpk',"网易WDF动画",0x1000375),--经验
		[29] = 自适应.创建(34,1,173,182,3,9),--召唤兽选择框，左边大框
		[30] = 自适应.创建(2,1,158,153,3,9),--宠物显示框
		[31] = 自适应.创建(3,1,109,19,1,3),
		[32] = 自适应.创建(3,1,97,19,1,3),
		[33] = 自适应.创建(3,1,40,19,1,3),
		[35] = 根._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,180,2),
		[37] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"驯养"),
		[38] = 按钮.创建(根.资源:载入('org.rpk',"网易WDF动画",0x1000390),0,0,1,true,true),
		-- [39] = 按钮.创建(根.资源:载入('sjm.wdf',"网易WDF动画",0x10000380),0,0,4,true,true),---宝宝进化图标 宠物进化
		[39] = 按钮.创建(根.资源:载入('wzife.wdf',"网易WDF动画",0x9E8DAFFB),0,0,4,true,true),---宝宝进化图标 宠物进化
	}
	self.资源组[22]:置偏移(0,3)
	self.tsk={
		[1] =自适应.创建(3,1,97,19,1,3),
		[2] =自适应.创建(3,1,97,19,1,3),
		[3] =自适应.创建(3,1,97,19,1,3),
		[4] =自适应.创建(3,1,97,19,1,3),
		[5] =自适应.创建(3,1,97,19,1,3),
		[6] =自适应.创建(3,1,97,19,1,3),
	}
	self.饰品={}
	self.饰品图标 = 资源:载入('wzife.wd2',"网易WDF动画",0xA4F1E391)
	self.追加法术 = 资源:载入('wzife.wdf',"网易WDF动画",0xef45cdc6)
	for i=2,26 do
		if i ~= 23 and i ~= 24 and i ~= 25 and i ~= 26 and i ~= 15 then
			self.资源组[i]:绑定窗口_(11)
		end
	end
	self.资源组[37]:绑定窗口_(11)
	self.资源组[38]:绑定窗口_(11)
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('召唤兽总控件')
	总控件:置可视(true,true)
	self.名称输入框 = 总控件:创建输入("名称输入",0,0,100,14,根,根.字体表.华康14)
	self.名称输入框:置可视(false,false)
	self.名称输入框:置限制字数(12)
	self.名称输入框:置光标颜色(-16777216)
	self.名称输入框:置文字颜色(-16777216)
	self.临时潜力 = {}
	self.预览属性 = {}
	for i=0,17 do
		self.临时潜力[i] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
		self.预览属性[i] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
	end
	self.加入 = 0
	self.选中 = 0
	self.拽拖计次 = 0
	self.拽拖对象 = 0
	self.拽拖事件 = 0
	self.插入选区 = 0
	self.操作 = nil
	self.头像组 = {}
	self.窗口时间 = 0
	self.动画={}
	tp = 根
	sxzt = tp.字体表.普通字体
	zts1 = tp.字体表.猫猫字体3

end

function 场景类_召唤兽属性栏:打开()
	if self.可视 then
		for i=0,17 do
			if tp.队伍[1] ~= nil and tp.队伍[1].宝宝列表[i] ~= nil then
				tp.队伍[1].宝宝列表[i].潜力 = tp.队伍[1].宝宝列表[i].潜力 + (self.临时潜力[i].体质+self.临时潜力[i].魔力+self.临时潜力[i].力量+self.临时潜力[i].耐力+self.临时潜力[i].敏捷)
			end
			self.临时潜力[i] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
			self.预览属性[i] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
		end
		self.加入 = 0
		self.选中 = 0
		self.拽拖计次 = 0
		self.拽拖对象 = 0
		self.拽拖事件 = 0
		self.插入选区 = 0
		self.头像组 = {}
		self.窗口时间 = 0
		self.名称输入框:置可视(false,false)
		self.可视 = false
		self.资源组[35]:置起始点(0)
		-- if tp.窗口.召唤兽资质栏.可视 then
		-- 	tp.窗口.召唤兽资质栏:打开()
		-- end
	else
		if tp.战斗中 then
		    insert(tp.战斗窗口_,self)
		else
			insert(tp.窗口_,self)
		end
		for i=1,#tp.队伍[1].宝宝列表 do
			if tp.队伍[1].宝宝列表[i].参战信息 ~= nil then
				-- if i > 4 then
				-- 	self.加入 = i-4
				-- 	self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入,4,#tp.队伍[1].宝宝列表))
				-- end
				self.选中 = i
				self.名称输入框:置文本(tp.队伍[1].宝宝列表[self.选中].名称)
				self.名称输入框:置可视(true,true)
				if tp.窗口.召唤兽资质栏.可视 then
					tp.窗口.召唤兽资质栏:打开(tp.队伍[1].宝宝列表[self.选中],self.选中)
				end
				self:置形象()
				self.拽拖计次 = 0
				break
			end
		end
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_召唤兽属性栏:置形象()
	self.动画={}
	if tp.队伍[1].宝宝列表[self.选中]  ~= nil then
		local n = ani(tp.队伍[1].宝宝列表[self.选中].模型)
		self.动画.主体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		self.动画.主体:置方向(0)
		n = ani(tp.队伍[1].宝宝列表[self.选中].模型.."_身体")
		if n[6] ~= nil then
			self.动画.身体 = tp.资源:载入(n[10],"网易WDF动画",n[6])
			self.动画.身体:置方向(0)
		end
		if tp.队伍[1].宝宝列表[self.选中].饰品 ~= nil then
			n = ani(tp.队伍[1].宝宝列表[self.选中].模型.."_饰品")
			if n[6] ~= nil then
				self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				if tp.队伍[1].宝宝列表[self.选中].饰品颜色 then
				    self.动画.饰品:置颜色(tp.队伍[1].宝宝列表[self.选中].饰品颜色,-1)
				end
				self.动画.饰品:置方向(0)
			end
			-- local wp = tp._物品
		 --    local qq = wp()
		 --    qq:置对象(tp.队伍[1].宝宝列表[self.选中].模型.."饰品")
		 --    self.饰品[1]:置物品(qq)
		 --    self.饰品[1].物品.总类=57
		 --    self.饰品[1].物品.玄天灵力=tp.队伍[1].宝宝列表[self.选中].饰品.玄天灵力 or 0
		    local wp=引擎.取物品(tp.队伍[1].宝宝列表[self.选中].模型.."饰品")
			self.饰品.小动画=tp.资源:载入(wp[11],"网易WDF动画",wp[12])
			self.饰品.大动画=tp.资源:载入(wp[11],"网易WDF动画",wp[13])
			self.饰品.名称=tp.队伍[1].宝宝列表[self.选中].模型.."饰品"
			-- self.饰品.玄天灵力=tp.队伍[1].宝宝列表[self.选中].饰品.玄天灵力 or 0
			self.饰品.说明=wp[1]
		else
			n = ani(tp.队伍[1].宝宝列表[self.选中].模型.."_装饰")
			if n[6] ~= nil then
				self.动画.饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
				self.动画.饰品:置方向(0)
			end
		end
		if tp.队伍[1].宝宝列表[self.选中].炫彩 ~= nil then
			self.动画.主体:炫彩染色(tp.队伍[1].宝宝列表[self.选中].炫彩,tp.队伍[1].宝宝列表[self.选中].炫彩组)
			if self.动画.身体 ~= nil then
				self.动画.身体:炫彩染色(tp.队伍[1].宝宝列表[self.选中].炫彩,tp.队伍[1].宝宝列表[self.选中].炫彩组)
			end
		else
			if tp.队伍[1].宝宝列表[self.选中].染色方案 ~= nil and tp.队伍[1].宝宝列表[self.选中].染色组~=nil then
				self.动画.主体:置染色(tp.队伍[1].宝宝列表[self.选中].染色方案,tp.队伍[1].宝宝列表[self.选中].染色组[1],tp.队伍[1].宝宝列表[self.选中].染色组[2],tp.队伍[1].宝宝列表[self.选中].染色组[3])
				self.动画.主体:置方向(0)
				if self.动画.身体 ~= nil then
					self.动画.身体:置染色(tp.队伍[1].宝宝列表[self.选中].染色方案,tp.队伍[1].宝宝列表[self.选中].染色组[1],tp.队伍[1].宝宝列表[self.选中].染色组[2],tp.队伍[1].宝宝列表[self.选中].染色组[3])
					self.动画.身体:置方向(0)
				end
			end
		end
	end
end

function 场景类_召唤兽属性栏:刷新忠诚(内容)
	if tp.队伍[1].宝宝列表[self.选中]~= nil then
		if tp.队伍[1].宝宝列表[self.选中].认证码==内容.rzm then
		    tp.队伍[1].宝宝列表[self.选中].忠诚=内容.zc
		end
    end
end

function 场景类_召唤兽属性栏:显示(dt,x,y)
	-- 变量
	local bbs = tp.队伍[1].宝宝列表
	local bbsa = #bbs
	local bb,ls,yl
	if self.选中 ~= 0 then
		bb = bbs[self.选中]
		ls = self.临时潜力[self.选中]
		yl = self.预览属性[self.选中]
		if bb ~= nil and bb.参战信息 ~= nil then
			self.资源组[3]:置文字("休息")
		else
			self.资源组[3]:置文字("参战")
		end
	end
	-- 更新
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,bb ~= nil)
	self.资源组[4]:更新(x,y,bb ~= nil)
	for i=5,9 do
	   self.资源组[i]:更新(x,y,bb ~= nil and bb.潜力 > 0)
	   if self.资源组[i]:事件判断() and not tp.战斗中 then
	   		bb.潜力 = bb.潜力 - 1
	   		ls[bd[i-4]] = ls[bd[i-4]] + 1
	   end
	end
	for i=10,14 do
	   self.资源组[i]:更新(x,y,bb ~= nil and ls~=nil and ls[bd[i-9]] ~= nil and ls[bd[i-9]] > 0)
	   if self.资源组[i]:事件判断() and not tp.战斗中 then
	   		bb.潜力 = bb.潜力 + 1
	   		ls[bd[i-9]] = ls[bd[i-9]] - 1
	   end
	end
	self.资源组[15]:更新(x,y,bb ~= nil and bb.潜力 > 0)
	self.资源组[16]:更新(x,y,bb ~= nil)
	self.资源组[17]:更新(x,y,bb ~= nil)
	self.资源组[18]:更新(x,y,bb ~= nil)
	self.资源组[19]:更新(x,y,bb~= nil and #bb>1000)
	self.资源组[20]:更新(x,y,bb ~= nil)
	self.资源组[21]:更新(x,y,bb ~= nil)
	self.资源组[22]:更新(x,y,bb ~= nil)
	self.资源组[37]:更新(x,y,bb ~= nil)
	-- 显示
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x+96,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"召唤兽属性")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
	self.资源组[29]:显示(self.x+12,self.y+29)
	self.资源组[30]:显示(self.x+197,self.y+28)
	self.资源组[31]:显示(self.x+197,self.y+217)
	tp.经验背景_:显示(self.x+55,self.y+426)
	sxzt:置颜色(4294967295)
	sxzt:显示(self.x+19,self.y+222,"召唤兽携带数量："..bbsa.."/"..引擎.场景.队伍[1].召唤兽携带上限)
	sxzt:显示(self.x+21,self.y+427,"经验")
	if bb == nil then
		sxzt:显示(self.x+200,self.y+194,"参战等级：--")
	else
		sxzt:显示(self.x+200,self.y+194,"参战等级："..bb.参战等级)
		if bb~=nil and bb.饰品~=nil and self.饰品.大动画 then
			self.饰品图标:显示(self.x+200,self.y+145)
		    if self.饰品图标:是否选中(x,y) then
				tp.禁止关闭 = true
				tp.提示:商城提示(self.x+200,self.y+145,self.饰品.名称,self.饰品.说明,self.饰品.大动画,self.饰品.备注)
				if mouseb(1) then
			        发送数据(5019,{bb.认证码})
			    end
	        end
		end
	end
	for i=1,6 do
		-- self.资源组[32]:显示(self.x+54,self.y+243+i*24)
		self.tsk[i]:显示(self.x+54,self.y+243+(i-1)*24)
		sxzt:显示(self.x+20,self.y+247+(i-1)*24,bd0[i])
	end
	for i=0,4 do
		self.资源组[31]:显示(self.x+197,self.y+243+i*24)
		sxzt:显示(self.x+163,self.y+247+i*24,xas[i+1])
	end
	sxzt:置颜色(-1404907)
	sxzt:显示(self.x+20,self.y+397,"忠诚")
	sxzt:显示(self.x+163,self.y+367,"潜能")
	self.资源组[33]:显示(self.x+53,self.y+393)
	self.资源组[33]:显示(self.x+197,self.y+363)
	self.资源组[3]:显示(self.x+312,self.y+188)
	self.资源组[4]:显示(self.x+312,self.y+217)
	for i=5,9 do
		self.资源组[i]:显示(self.x+317,self.y+246+((i-5)*24))
	end
	for i=10,14 do
		self.资源组[i]:显示(self.x+338,self.y+246+((i-10)*24))
	end
	self.资源组[15]:显示(self.x+237,self.y+365,true)
	self.资源组[16]:显示(self.x+311,self.y+365,true)
	self.资源组[17]:显示(self.x+244,self.y+40,true)
	self.资源组[37]:显示(self.x+96,self.y+393,true)
	self.资源组[18]:显示(self.x+143,self.y+393,true)
	self.资源组[19]:显示(self.x+190,self.y+393,true)
	self.资源组[20]:显示(self.x+237,self.y+393,true)
	self.资源组[21]:显示(self.x+284,self.y+393,true)
	self.资源组[22]:显示(self.x+280,self.y+420,true)
	if bbsa > 4 then
		self.资源组[35]:置高度(min(floor(180/(bbsa-4)),170))
		self.加入 = min(ceil((bbsa-4)*self.资源组[35]:取百分比()),bbsa-4)
		if self.加入 == bbsa-4 then
			self.加入 = self.加入+1
		end
		self.资源组[35]:显示(self.x+176,self.y+30,x,y,self.鼠标)
	end
	-- self.资源组[27]:更新(x,y,self.加入 > 0)
	-- self.资源组[28]:更新(x,y,self.加入 < bbsa - 4)
	-- self.资源组[27]:显示(self.x+167,self.y+31)
	-- self.资源组[28]:显示(self.x+167,self.y+193)
	-- 真
	sxzt:置颜色(-16777216)
	for i=1,4 do
		if bbs[i+self.加入] ~= nil then
			local jx = self.x+18
			local jy = self.y+(i*43)-6
			bw:置坐标(jx,jy+1)
			if self.头像组[i+self.加入] == nil then
				local n = tx(bbs[i+self.加入].模型)
				self.头像组[i+self.加入] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			-- 拽拖
			local xz = bw:检查点(x,y)
			if not self.资源组[35].接触 and xz and self.鼠标 and not tp.消息栏焦点 and self.拽拖对象 == 0 then
				if mousea(0) then
					self.拽拖计次 = self.拽拖计次 + 1
					if self.拽拖计次 >= 28 then
						self.拽拖对象 = i+self.加入
						self.拽拖事件 = {self.头像组[i+self.加入]}
						self.拽拖计次 = 0
					end
				end
			end
			-- 其他
			if self.选中 ~= i+self.加入 then
				if not self.资源组[35].接触 and xz and not tp.消息栏焦点 and self.鼠标 then
					if self.拽拖对象 ~= 0 then
						box(jx+70,jy+34,jx+125,jy+39,-16777216)
						self.插入选区 = i+self.加入
					end
					if mouseb(0) and self.拽拖对象 == 0 and not keyaz(KEY.SHIFT) then
						self.选中 = i+self.加入
						self.名称输入框:置文本(bbs[self.选中].名称)
						self.名称输入框:置可视(true,true)
						if tp.窗口.召唤兽资质栏.可视 then
							tp.窗口.召唤兽资质栏:打开(bbs[self.选中],self.选中)
						end
						self:置形象()
						self.拽拖计次 = 0
					end
					self.焦点 = true
				end
			else
				if mouseb(0) and keyaz(KEY.SHIFT) and xz and bbs[self.选中] then
					-- if tp.窗口.消息框.序列 == 3 or tp.窗口.消息框.序列 == 10 then
						if #tp.窗口.消息框.超链接>=1 then
						    tp.常规提示:打开("#Y一次最多发送一条链接")
						else
							tp.窗口.消息框.输入:添加文本("["..bbs[self.选中].名称.."]")
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接+1] = {}
							tp.窗口.消息框.发送方式=2
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接].类型 = "召唤兽"
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接].点击类型 = "召唤兽"
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接].名称= bbs[self.选中].名称
							tp.窗口.消息框.超链接[#tp.窗口.消息框.超链接].编号= bbs[self.选中].认证码
						end
					-- else
					-- 	tp.常规提示:打开("#Y请使用世界频道或传音频道发送")
					-- end
				end
				if not self.资源组[35].接触 and xz and not tp.消息栏焦点 and self.鼠标 then
					self.焦点 = true
				end
				if self.拽拖对象 ~= i+self.加入 then
					box(jx-1,jy-3,jx+152,jy+41,-10790181)
				end
			end
			self.资源组[23]:显示(jx+1,jy)
			self.头像组[i+self.加入]:显示(jx+4,jy+4)
			if bbs[i+self.加入].参战信息 ~= nil then
				sxzt:置颜色(-256)
				zts1:置颜色(-256)
			else
				sxzt:置颜色(-16777216)
				zts1:置颜色(-16777216)
			end
			sxzt:显示(jx+41,jy+3,bbs[i+self.加入].名称)
			zts1:显示(jx+43,jy+22,bbs[i+self.加入].等级.."级")

		end
	end
	-- zts1:置颜色(白色)
	if self.加入 == bbsa-4+1 then
		self.资源组[38]:更新(x,y)
		self.资源组[38]:显示(self.x+20,self.y+166)
		sxzt:置颜色(0xFFFFFFFF)
		sxzt:显示(self.x + 57,self.y + 177,"开启新召唤兽栏")
		if self.资源组[38]:事件判断() and not tp.战斗中 then
			local 数额 = 10000000
		    if 引擎.场景.队伍[1].召唤兽携带上限 == 8 then
		      数额 = 5000000
		    elseif 引擎.场景.队伍[1].召唤兽携带上限 == 9 then
		      数额 = 5000000
		    elseif 引擎.场景.队伍[1].召唤兽携带上限 == 10 then
		      数额 = 5000000
		    end
		    local 上限 = 引擎.场景.队伍[1].召唤兽携带上限+1
			tp.窗口.文本栏:载入("扩展你的召唤兽栏位需要花费#Y"..数额.."#W两银子，扩展后可携带召唤兽变为#Y"..上限.."#W只，确认对你的召唤兽栏进行扩展吗？","召唤兽携带上限",true)
		end
	end
	if bb ~= nil then
		local jx = self.x + 280
		local jy = self.y + 145
		local fjsx = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
		if bb.进阶属性~=nil then
			fjsx = bb.进阶属性
		end
		tp.影子:显示(jx,jy)
		if self.动画.主体~=nil then
			self.动画.主体:更新()
			self.动画.主体:显示(jx,jy)
			if self.动画.身体~=nil then
				self.动画.身体:更新()
				self.动画.身体:显示(jx,jy)
			end
			--self.资源组[36]:显示(self.x+244,self.y+40)
			if self.动画.饰品 ~= nil then
				self.动画.饰品:更新()
				self.动画.饰品:显示(jx,jy)
			end
		end
		-- 文字
		self.名称输入框:置坐标(self.x + 204,self.y + 220)
		self.控件类:更新(dt,x,y)
		self.控件类:显示(dt,x,y)
		if self.名称输入框._已碰撞 then
			self.焦点 = true
		end

		if tp.队伍[1].宝宝列表[self.选中].种类 ~= nil then
			sxzt:置颜色(黑色)
    		sxzt:显示(self.x+204,self.y+38,tp.队伍[1].宝宝列表[self.选中].种类)
		end
		local weizhi
		local shux=""
		if bb.天赋符 then
			weizhi=bb.天赋符.khdwz
			shux=bb.天赋符.lx
			if self.tsk[weizhi]:是否选中(x,y) then
			    tp.提示:自定义(x-42,y+27,"#Y天赋符效果：#G"..tainfufu[weizhi].."+"..bb.天赋符.zhi)
			end
		end

        if shux=="最大气血" then
        	zts1:置颜色(0xffCC0033):显示(self.x + 60,self.y + 247,format("%d/%d",bb.气血,bb.最大气血))
        else
        	zts1:置颜色(-16777216):显示(self.x + 60,self.y + 247,format("%d/%d",bb.气血,bb.最大气血))
        end

		-- zts3:显示(self.x + 226,self.y + 46,"+"..yl.种类)
		if yl.气血 > 0 then
			zts1:置颜色(-65536):显示(self.x + 126,self.y + 246,"+"..yl.气血)
		end
		zts1:置颜色(-16777216):显示(self.x + 60,self.y + 271,format("%d/%d",bb.魔法,bb.最大魔法))
		if yl.魔法 > 0 then
			zts1:置颜色(-65536):显示(self.x + 126,self.y + 270,"+"..yl.魔法)
		end
		if shux=="伤害" then
        	zts1:置颜色(0xffCC0033):显示(self.x + 60,self.y + 295,bb.伤害)
        else
        	zts1:置颜色(-16777216):显示(self.x + 60,self.y + 295,bb.伤害)
        end

		if yl.伤害 > 0 then
			zts1:置颜色(-65536):显示(self.x + 126,self.y + 295,"+"..yl.伤害)
		end
		if shux=="防御" then
        	zts1:置颜色(0xffCC0033):显示(self.x + 60,self.y + 319,bb.防御)
        else
        	zts1:置颜色(-16777216):显示(self.x + 60,self.y + 319,bb.防御)
        end

		if yl.防御 > 0 then
			zts1:置颜色(-65536):显示(self.x + 126,self.y + 319,"+"..yl.防御)
		end
		if shux=="速度" then
        	zts1:置颜色(0xffCC0033):显示(self.x + 60,self.y + 343,bb.速度)
        else
        	zts1:置颜色(-16777216):显示(self.x + 60,self.y + 343,bb.速度)
        end

		if yl.速度 > 0 then
			zts1:置颜色(-65536):显示(self.x + 126,self.y + 343,"+"..yl.速度)
		end
		if shux=="灵力" then
        	zts1:置颜色(0xffCC0033):显示(self.x + 60,self.y + 367,bb.灵力)
        else
        	zts1:置颜色(-16777216):显示(self.x + 60,self.y + 367,bb.灵力)
        end

		if yl.灵力 > 0 then
			zts1:置颜色(-65536):显示(self.x + 126,self.y + 367,"+"..yl.灵力)
		end
		zts1:置颜色(-16777216):显示(self.x + 60,self.y + 397,到整数(bb.忠诚 ))
		-- ls
		local wwsx = {体质=bb.体质+bb.特性五维.体质,魔力=bb.魔力+bb.特性五维.魔力,力量=bb.力量+bb.特性五维.力量,耐力=bb.耐力+bb.特性五维.耐力,敏捷=bb.敏捷+bb.特性五维.敏捷}
		zts1:置颜色(-16777216)
		zts1:显示(self.x + 204,self.y + 247,wwsx.体质)
		if ls.体质 > 0 then
			zts1:置颜色(-65536)
			zts1:显示(self.x + 204 + (#tostring(wwsx.体质)*20) + 1,self.y + 247,"+"..ls.体质)
			zts1:置颜色(-16777216)
		end
		zts1:显示(self.x + 204,self.y + 271,wwsx.魔力)
		if ls.魔力 > 0 then
			zts1:置颜色(-65536)
			zts1:显示(self.x + 204 + (#tostring(wwsx.魔力)*20) + 1,self.y + 271,"+"..ls.魔力)
			zts1:置颜色(-16777216)
		end
		zts1:显示(self.x + 204,self.y + 296,wwsx.力量)
		if ls.力量 > 0 then
			zts1:置颜色(-65536)
			zts1:显示(self.x + 204 + (#tostring(wwsx.力量)*20) + 1,self.y + 296,"+"..ls.力量)
			zts1:置颜色(-16777216)
		end
		zts1:显示(self.x + 204,self.y + 320,wwsx.耐力)
		if ls.耐力 > 0 then
			zts1:置颜色(-65536)
			zts1:显示(self.x + 204 + (#tostring(wwsx.耐力)*20) + 1,self.y + 320,"+"..ls.耐力)
			zts1:置颜色(-16777216)
		end
		zts1:显示(self.x + 204,self.y + 344,wwsx.敏捷)
		if ls.敏捷 > 0 then
			zts1:置颜色(-65536)
			zts1:显示(self.x + 204 + (#tostring(wwsx.敏捷)*20) + 1,self.y + 344,"+"..ls.敏捷)
			zts1:置颜色(-16777216)
		end
		zts1:显示(self.x + 204,self.y + 367,bb.潜力)
		if bb.进阶属性~=nil and fjsx.体质>0 then
			zts1:置颜色(0xFFFF00FF)
			zts1:显示(self.x + 204 + (#tostring(wwsx.体质)*7)+3,self.y + 247,"+"..fjsx.体质)
			zts1:显示(self.x + 204 + (#tostring(wwsx.魔力)*7)+3,self.y + 271,"+"..fjsx.魔力)
			zts1:显示(self.x + 204 + (#tostring(wwsx.力量)*7)+3,self.y + 296,"+"..fjsx.力量)
			zts1:显示(self.x + 204 + (#tostring(wwsx.耐力)*7)+3,self.y + 320,"+"..fjsx.耐力)
			zts1:显示(self.x + 204 + (#tostring(wwsx.敏捷)*7)+3,self.y + 344,"+"..fjsx.敏捷)
			zts1:置颜色(-16777216)
		end
		self.资源组[26]:置区域(0,0,min(floor(bb.当前经验 / bb.最大经验 * 173),173),12)
		self.资源组[26]:显示(tp.经验背景_.x+2,tp.经验背景_.y+2)

		zts1:置颜色(4294967295)
		-- zts1:置描边颜色(-16777216)
		local ts = format("%s/%s",bb.当前经验,bb.最大经验)
		zts1:显示(self.x + ((255 - zts1:取宽度(ts))/2)+8,self.y + 427,ts)
		-- zts1:显示(self.x + ((255 - zts1:取宽度(ts))/2)+8,self.y + 426,ts.."("..到整数(取百分比转换(bb.当前经验,1,bb.最大经验)*100).."%)")
	end
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	elseif self.资源组[3]:事件判断() and not tp.战斗中 then
		发送数据(5002,{序列=bb.认证码})
	elseif self.资源组[4]:事件判断() and not tp.战斗中 then
		if 判断游戏名字(self.名称输入框:取文本())==1 then
			引擎.场景.常规提示:打开("#Y/名字不能带有空格或者特殊符号或者敏感词语")
		else
			tp.常规提示:打开("#Y/改名成功！")
			bb.名称 = self.名称输入框:取文本()
			发送数据(5003,{序列=bb.认证码,名称=self.名称输入框:取文本()})
		end
	elseif self.资源组[39]:事件判断()  then
	if bb~=nil then
		tp.窗口.进化宝宝:打开()
        tp.常规提示:打开("#Y/当前进化次数: #G"..bb.元宵.进化次数.." #Y/还可进化: #G"..8-bb.元宵.进化次数.." #Y/次")
	end
	elseif self.资源组[20]:事件判断() then
		if bb~=nil then
			tp.常规提示:打开("#Y/这只召唤兽还可以用喂食#G"..bb.元宵.可用.."#Y个元宵，#G"..bb.元宵.炼兽真经.."#Y本炼兽珍经，#G"..bb.元宵.如意丹.."#Y个如意丹，#G"..bb.元宵.千金露.."#Y个千金露，#G"..bb.元宵.水晶糕.."#Y个水晶糕。")
	    end

	elseif self.资源组[15]:事件判断() and not tp.战斗中 then
		-- 力耐加点
		-- local zt = 1
		-- while true do
		-- 	if zt == 1 then
		-- 		bb.潜力 = bb.潜力 - 1
		-- 		ls.体质 = ls.体质 + 1
		-- 		zt = 2
		-- 	elseif zt == 2 then
		-- 		bb.潜力 = bb.潜力 - 1
		-- 		ls.耐力 = ls.耐力 + 1
		-- 		zt = 1
		-- 	end
		-- 	if bb.潜力 <= 0 then
		-- 		break
		-- 	end
		-- end


		while true do
			if bb.魔力 > bb.体质 and bb.魔力 > bb.力量 and bb.魔力 > bb.耐力  and bb.魔力 > bb.敏捷 then
				bb.潜力 = bb.潜力 - 1
				ls.魔力 = ls.魔力 + 1
			elseif bb.力量 > bb.体质 and bb.力量 > bb.魔力 and bb.力量 > bb.耐力  and bb.力量 > bb.敏捷 then
				bb.潜力 = bb.潜力 - 1
				ls.力量 = ls.力量 + 1
			elseif bb.体质 > bb.力量 and bb.体质 > bb.魔力 and bb.体质 > bb.耐力  and bb.体质 > bb.敏捷 then
				bb.潜力 = bb.潜力 - 1
				ls.体质 = ls.体质 + 1
			elseif bb.耐力 > bb.体质 and bb.耐力 > bb.魔力 and bb.耐力 > bb.力量  and bb.耐力 > bb.敏捷 then
				bb.潜力 = bb.潜力 - 1
				ls.耐力 = ls.耐力 + 1
			elseif bb.敏捷 > bb.体质 and bb.敏捷 > bb.魔力 and bb.敏捷 > bb.耐力  and bb.敏捷 > bb.力量 then
				bb.潜力 = bb.潜力 - 1
				ls.敏捷 = ls.敏捷 + 1
			else
				tp.常规提示:打开("#W/有属性点相等，默认加点最高属性")
				break
			end
			if bb.潜力 <= 0 then
				break
			end
		end

	elseif self.资源组[16]:事件判断() and not tp.战斗中 then
		if bb~=nil then
		    self.预览属性[self.选中] = self:取差异属性(ls,bb)
		end
	elseif self.资源组[17]:事件判断() and not tp.战斗中 then
		if self.选中 ~= 0 then
			-- tp.窗口.召唤兽炫彩:打开(bb.认证码,tp.队伍[1].宝宝列表[self.选中].模型,tp.队伍[1].宝宝列表[self.选中].饰品,tp.队伍[1].宝宝列表[self.选中].饰品颜色)
			tp.窗口.焕彩染色:打开("召唤兽焕彩",认证码,模型,饰品,饰品颜色,bb)
		else
		    tp.常规提示:打开("请选择召唤兽")
		end
	elseif self.资源组[18]:事件判断() and not tp.战斗中 then
		local 事件 = function()
			发送数据(5005,{序列=bb.认证码})
		end
		tp.窗口.文本栏:载入("真的要放生#Y/"..bb.等级.."级的#R/"..bb.名称.."#W/吗?",nil,true,事件)
	-- elseif self.资源组[19]:事件判断() then
		-- tp.窗口.召唤兽仓库:打开()
	elseif self.资源组[21]:事件判断() and not tp.战斗中 then
		self.临时潜力[self.选中] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
		self.预览属性[self.选中] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
		ls.序列=bb.认证码
		发送数据(5004,ls)
	elseif self.资源组[22]:事件判断() then
		tp.窗口.召唤兽资质栏:打开(bb,self.选中)
		tp.窗口.召唤兽资质栏.x = self.x + 368
		tp.窗口.召唤兽资质栏.y = self.y
	-- elseif self.资源组[27]:事件判断() and self.加入 == bbsa-4+1 then--上滚动
	-- 	self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-2,4,bbsa))
	-- 	self.头像组 = {}
	-- elseif self.资源组[27]:事件判断() then--上滚动
	-- 	self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-1,4,bbsa))
	-- 	self.头像组 = {}
	-- elseif self.资源组[28]:事件判断() then--下滚动
	-- 	self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入+1,4,bbsa))
	-- 	self.头像组 = {}
	elseif(self.资源组[29]:是否选中(x,y) or  self.资源组[35]:是否选中(x,y)) and (引擎.取鼠标滚轮() ==1 and self.加入 > 0)  then--鼠标上滚动
		if self.加入-1 == bbsa-4 then
			self.加入=self.加入-1
		end
		self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入-1,4,bbsa))
		self.头像组 = {}
	elseif (self.资源组[29]:是否选中(x,y) or self.资源组[35]:是否选中(x,y)) and (引擎.取鼠标滚轮() ==-1 and self.加入 < bbsa - 4) then--鼠标下滚动
		self.资源组[35]:置起始点(self.资源组[35]:取百分比转换(self.加入+1,4,bbsa))
		self.头像组 = {}
	end

		if tp.当前地图==6227 then  -----------武神坛进化图标不显示
			return
		else
		self.资源组[39]:显示(self.x+327+5,self.y+155)---------宝宝进化图标 召唤兽右下角的  待开放
		end

		self.资源组[39]:更新(x,y)
	-- 拖拽事件
	if self.拽拖对象 ~= 0 then
		box(x-70,y-25,x+73,y+19,-849650981)
		self.资源组[23]:显示(x-67,y-22)
		self.拽拖事件[1]:显示(x-63,y-18)
		if bbs[self.拽拖对象].参战信息 ~= nil then
			sxzt:置颜色(-256)
		end
		sxzt:显示(x-27,y-19,bbs[self.拽拖对象].名称)
		sxzt:显示(x-27,y,bbs[self.拽拖对象].等级.."级")
		if mouseb(0) then
			if self.鼠标 then
				if self.插入选区 == 0 then
					self.拽拖计次 = 0
					self.拽拖对象 = 0
					self.拽拖事件 = 0
					self.插入选区 = 0
					tp.禁止关闭 = false
				else
					self:排列(self.拽拖对象,self.插入选区)
					self.拽拖计次 = 0
					self.拽拖对象 = 0
					self.拽拖事件 = 0
					self.插入选区 = 0
					tp.禁止关闭 = false
				end
			else
				self.拽拖计次 = 0
				self.拽拖对象 = 0
				self.拽拖事件 = 0
				self.插入选区 = 0
				tp.禁止关闭 = false
			end
		end
		tp.禁止关闭 = true
		self.焦点 = true
	end
	if self.资源组[35].接触 then
		self.焦点 = true
	end
end

function 场景类_召唤兽属性栏:取差异属性(sxb,宠物)
	local sx1 = 宠物.最大气血
	local sx2 = 宠物.最大魔法
	local sx3 = 宠物.伤害
	local sx4 = 宠物.防御
	local sx5 = 宠物.速度
	local sx6 = 宠物.灵力
	if 宠物.装备属性==nil then
	    宠物.装备属性={气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	end
	local 体质 = 宠物.体质 + 宠物.装备属性.体质 + sxb.体质
	local 魔力 = 宠物.魔力 + 宠物.装备属性.魔力 + sxb.魔力
	local 力量 = 宠物.力量 + 宠物.装备属性.力量 + sxb.力量
	local 耐力 = 宠物.耐力 + 宠物.装备属性.耐力 + sxb.耐力
	local 敏捷 = 宠物.敏捷 + 宠物.装备属性.敏捷 + sxb.敏捷
	local 最大气血 = ceil(宠物.等级*宠物.体力资质/1000+体质*宠物.成长*6) + 宠物.装备属性.气血
	local 最大魔法 = ceil(宠物.等级*宠物.法力资质/500+魔力*宠物.成长*3) + 宠物.装备属性.魔法
	local 伤害1 = ceil(宠物.等级*宠物.攻击资质*(宠物.成长+1.4)/750+力量*宠物.成长) + 宠物.装备属性.伤害
	local 防御1 = ceil(宠物.等级*宠物.防御资质*(宠物.成长+1.4)/1143+耐力*(宠物.成长-1/253)*253/190)+ 宠物.装备属性.防御
	local 速度1 = ceil(宠物.速度资质 * 敏捷/1000)  + 宠物.装备属性.速度
	local 灵力1 = ceil(宠物.等级*(宠物.法力资质+1666)/3333+魔力*0.7+力量*0.4+体质*0.3+耐力*0.2) + 宠物.装备属性.灵力
	return {气血=最大气血-sx1,魔法=最大魔法-sx2,伤害=伤害1-sx3,防御=防御1-sx4,速度=速度1-sx5,灵力=灵力1-sx6}
end

function 场景类_召唤兽属性栏:排列(a,b)
	local bbx = tp.队伍[1].宝宝列表
	local abs = bbx[a]
	local bbs = bbx[b]
	local aba = self.临时潜力[a]
	local bba = self.临时潜力[b]
	local abc = self.预览属性[a]
	local bbc = self.预览属性[b]
	bbx[a] = bbs
	self.临时潜力[a] = bba
	self.预览属性[a] = bbc
	bbx[b] = abs
	self.临时潜力[b] = aba
	self.预览属性[b] = abc
	if self.选中 ~= 0 then
		self.选中 = b
		self:置形象()
		self.名称输入框:置文本(bbx[self.选中].名称)
		self.名称输入框:置可视(true,true)
		if tp.窗口.召唤兽资质栏.可视 then
			tp.窗口.召唤兽资质栏:打开(bbx[self.选中],self.选中)
		end
	end
	self.头像组 = {}
end

function 场景类_召唤兽属性栏:放生()
	self.临时潜力[self.选中] = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
	self.预览属性[self.选中] = {气血=0,魔法=0,伤害=0,速度=0,灵力=0,防御=0}
	if tp.窗口.道具行囊.可视 and tp.窗口.道具行囊.窗口 == "召唤兽" then
		if bb == tp.队伍[1].宝宝列表[tp.窗口.道具行囊.选中召唤兽] then
			tp.窗口.道具行囊.选中召唤兽 = 0
			tp.窗口.道具行囊.资源组[4] = nil
			for s=1,3 do
				tp.窗口.道具行囊.召唤兽装备[s]:置物品(nil)
			end
		end
	end
	-- if v == 19 then
	-- 	table.insert(tp.召唤兽仓库,bb)
	-- end
	table.remove(tp.队伍[1].宝宝列表, self.选中)
	self.名称输入框:置可视(false,false)
	-- if tp.窗口.召唤兽资质栏.可视 then
	-- 	tp.窗口.召唤兽资质栏:打开()
	-- end
	self.选中 = 0
	self.加入 = max(self.加入 - 1,0)
	self:置形象()
	-- if 禁止==nil then
	-- 	self:打开()
	-- 	发送数据(5001)
	-- end
end

function 场景类_召唤兽属性栏:刷新(f)
	-- if tp.窗口.召唤兽资质栏.可视 then
	-- 	tp.窗口.召唤兽资质栏:打开()
	-- end
	self.加入 = 0
	self.选中 = 0
	self.拽拖计次 = 0
	self.拽拖对象 = 0
	self.拽拖事件 = 0
	self.插入选区 = 0
	self.头像组 = {}
	self.名称输入框:置可视(false,false)
end

function 场景类_召唤兽属性栏:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_召唤兽属性栏:初始移动(x,y)
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

function 场景类_召唤兽属性栏:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_召唤兽属性栏