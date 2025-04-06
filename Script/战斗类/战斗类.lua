-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-04-05 21:32:09
local 战斗类 = class()
local mousea = 引擎.鼠标按下
local mouseb = 引擎.鼠标弹起
local jtus = 引擎.截图到纹理
local jl1 = require("gge精灵类")
local function 排序(a,b) return a.显示y < b.显示y end
function 战斗类:初始化(根)
	local jl = require("gge精灵类")
	local 资源 = 根.资源
	local 按钮 = require("script/系统类/按钮")
	self:加载阵法()
	self.纯色背景 = jl(0,0,0,全局游戏宽度+500,全局游戏高度+300)
	-- self.纯色背景:置颜色(ARGB(150,3,20,60))
	self.纯色背景:置颜色(ARGB(160,3,20,70))
	-- self.纯色背景:置颜色(ARGB(170,3,20,70))
	-- self.纯色背景:置颜色(-1189208494)
	self.黑幕背景 = jl(0,0,0,全局游戏宽度+500,全局游戏高度+300)
	self.黑幕背景:置颜色(0xFF000000)
	self.战斗背景 = 资源:载入('addon.wdf',"网易WDF动画",3566119173)
	-------------------------8.18山海BOSS
	self.山海排行 = {}
	self.山海图标 = 资源:载入('wzife.wdf',"网易WDF动画",0x012CAF64)
	self.山海提示 = ""
	-------------------------
	--self.战斗圆背景 = 资源:载入('wzife.wdf',"网易WDF动画",0XD4BAB272)
	self.背景状态 = 0
	self.回合进程="加载"
	self.加载数量=0
	self.战斗单位={}
	self.战斗单位[ljcs]={}
	self.血条背景 = 资源:载入('addon.wdf',"网易WDF动画",0x4D0A334C)
	self.血条栏 = 资源:载入('addon.wdf',"网易WDF动画",0x4FD9FFF3)
	self.血条上限栏=资源:载入('addon.wdf',"网易WDF动画",3805549259)
	-- self.自动栏 = 资源:载入('wzife.wdf',"网易WDF动画",0x1DF7B97D)
	self.自动栏 = require("script/战斗类/战斗自动栏").创建(根)
	self.观战栏 = require("script/战斗类/战斗观战").创建(根)
	self.竖条 = 按钮(根.资源:载入('wzife.wd1',"网易WDF动画",399414929),0,0,1)
	self.横条 = 按钮(根.资源:载入('wzife.wdf',"网易WDF动画",0xe03a06b3),0,0,1)
	self.退出战斗 = 按钮.创建(tp._自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"退出战斗")
	self.结束挂机 = 资源:载入('pic/标题背景.png',"图片")
	self.技能圈 = 资源:载入("pic/11.png","图片")
	self.战斗指令=战斗指令类(根)
	self.伙伴zhil=伙伴命令类(根)
	self.hbk = 资源:载入('pic/hbk.png',"图片")
	self.hbxztx=0
	self.进程="等待"
	self.助战窗体选中=false
	self.助战头像开关=true
	self.自动开关=false
	self.天地洞明=false
	self.单挑模式=nil
	self.PK战斗=nil
	self.数字图片=引擎.场景.战斗文字[5]
	if 引擎.场景.观战中 == false then
		self.请等待=资源:载入('misc.wdf',"网易WDF动画",0xEE1713AC)
	else
		self.请等待=资源:载入('wzife.wd3',"网易WDF动画",4254597813)
	end

	local wz = require("gge文字类")
	self.战斗信息提示={开关=false,内容="",起始时间=0,停止时间=0,字体=wz.创建(nil,16,false,false,false),}
	self.战斗信息提示.字体:置颜色(0xFFE6DB74)
	self.拼接偏移 = 生成XY()
	self.法宝图片 = 引擎.场景.战斗文字[1]
	self.战斗快捷键法术=nil
	self.宠物战斗快捷键法术=nil
	self.拼接特效={}
	self.显示排序={}

	self.回合数 = 0
	self.特殊状态 = {}
	self.无间地狱 = nil
	self.色变动画我方 = nil
	self.色变我方 = nil
	self.媚眼如丝 = nil
	self.过度纹理 = require("gge纹理类")():渲染目标(全局游戏宽度,全局游戏高度)

	self.我方头像组={}
	self.敌方头像组={}
	self.我方头像开关=false
	self.敌方头像开关=false
	self.我方阵型=nil
	self.敌方阵型=nil
	self.阵型组={
	    [1]=资源:载入("pic/ggz.png","图片"),
	    [2]=资源:载入("pic/zf.png","图片"),
	    [3]=资源:载入('wzife.wdf',"网易WDF动画",0xEACCCBE2),
	    [4]=资源:载入('wzife.wdf',"网易WDF动画",0x9F3FDBA6),--左箭头
	    [5]=资源:载入('wzife.wdf',"网易WDF动画",0x8787A405),--右箭头
	    [6]=资源:载入('wzife.wdf',"网易WDF动画",0x439709D9),--克制
	    [7]=资源:载入('wzife.wdf',"网易WDF动画",0x7485AA08),--无克制
	    [8]=资源:载入("pic/tcbj.png","图片"),
	  }
	self.技能展示开关=false
	self.伙伴头像={}
	self.伙伴bb头像={}
	self.技能展示={}
	self.技能待放组={
		[1] = 资源:载入('wzife.wdf',"网易WDF动画",0x52CAD7EE),
		[2] = 资源:载入('wzife.wdf',"网易WDF动画",0x52F42754),
		[3] = 资源:载入("pic/zddt.png","图片"),
		[4] = 资源:载入('wzife.wdf',"网易WDF动画",0x60AAAFDE),--EACCCBE2
		[5] = 资源:载入("pic/6000.png","图片"),
	}
	self.hbjnpng= 资源:载入("pic/bhjn.png","图片")
	self.法术次数图片 = {}
	local tab = {0x00000600,0x00000601,0x00000602,0x00000603,0x00000604}
	for n = 1, 5 do
		self.法术次数图片[n] = 资源:载入("影精灵.wdf", "网易WDF动画", tab[n])
	end
	self.连击图片 = {}
	tab = {0x00000605,0x00000606,0x00000607,0x00000608,0x00000609,0x00000610,0x00000611,0x00000612,0x00000613,0x00000614}
	for n = 1, 10 do
		self.连击图片[n] = 资源:载入("影精灵.wdf", "网易WDF动画", tab[n])
	end
	self.连击背景图片 = 资源:载入("影精灵.wdf", "网易WDF动画", 0x00000615)
	self.攻击动作 = 1
	self:qiehuan(全局界面风格)
	-- self.dt = 1.3
end

function 战斗类:qiehuan(风格)
	local 按钮 = tp._按钮
	if  风格=="国韵" then
		self.zz竖条 = 按钮.创建(tp.资源:载入('common/uigy.wdf',"网易WDF动画",399414929),0,0,1)
	elseif  风格=="水晶" then
		self.zz竖条 = 按钮.创建(tp.资源:载入('common/uisj.wdf',"网易WDF动画",399414929),0,0,1)
	else
		self.zz竖条 = 按钮.创建(tp.资源:载入('wzife.wd1',"网易WDF动画",399414929),0,0,1)
	end

end

function 战斗类:山海BOSS排行(sj) --8.18
	self.山海排行 = sj
	self.山海提示 = ""
	for an=1,#self.山海排行 do
		if self.山海排行[an]~=nil then
			if an==1 then
				self.山海提示 = an .. "" ..self.山海排行[an].名称 .."：" ..self.山海排行[an].伤害
			else
				self.山海提示 = self.山海提示 .. "\n"..an .. "" ..self.山海排行[an].名称 .."：" ..self.山海排行[an].伤害
			end
		end
	end
end

function 战斗类:进入战斗过度()
	print(1)
	self.山海排行 = {}
	jtus(self.过度纹理)
	self.过度精灵 = jl1(self.过度纹理)
	self.过度精灵1 = jl1(self.过度纹理)
	self.过度精灵1:置区域(0,0,全局游戏宽度/2,全局游戏高度/2)
	self.过度精灵2 = jl1(self.过度纹理)
	self.过度精灵2:置区域(全局游戏宽度/2,0,全局游戏宽度/2,全局游戏高度/2)
	self.过度精灵3 = jl1(self.过度纹理)
	self.过度精灵3:置区域(0,全局游戏宽度/2,全局游戏宽度/2,全局游戏高度/2)
	self.过度精灵4 = jl1(self.过度纹理)
	self.过度精灵4:置区域(全局游戏宽度/2,全局游戏高度/2,全局游戏宽度/2,全局游戏高度/2)
	self.过度坐标1 = {x=0,y=0}
	self.过度坐标2 = {x=全局游戏宽度/2,y=0}
	self.过度坐标3 = {x=0,y=全局游戏高度/2}
	self.过度坐标4 = {x = 全局游戏宽度/2,y = 全局游戏高度/2}
	self.过度进度 = 255
	self.过度时间 = 7
		print(2)

end
function 战斗类:退出战斗过度()
	jtus(引擎.场景.场景.过度纹理)
	引擎.场景.场景.过度精灵 = jl1(引擎.场景.场景.过度纹理)
	引擎.场景.场景.过度进度 = 255
	引擎.场景.场景.过度时间 = 3
	引擎.场景.场景.过度减少 = 5
	self.助战窗体选中=false
end

function 战斗类:释放()
	self.进程="等待"
	self.加载数量=0
	-- for i=1,#self.战斗单位[ljcs] do
	 -- self.战斗单位[ljcs][i]:释放()
	-- end
	self.天地洞明=false
	self.战斗单位[ljcs]=nil
	self.战斗流程={}
	self.显示排序={}
	self.拼接特效 = {}

	self.回合数 = 0
	self.特殊状态 = {}
	self.无间地狱 = nil
	self.无间地狱死亡 = nil
	self.无间地狱开关 = nil
	self.清静菩提 = nil
	self.清静菩提动画 = nil
	self.清静菩提开关 = nil
	self.媚眼如丝 = nil
	self.媚眼如丝回血 = nil
	self.媚眼如丝开关 = nil
	self.色变动画我方 = nil
	self.色变我方 = nil
	self.色变进度我方 = nil
	self.色变动画敌方 = nil
	self.色变敌方 = nil
	self.色变进度敌方 = nil

	self.背景状态 = nil

	self.单挑模式=nil
	self.PK战斗=nil

	self.我方头像组={}
	self.敌方头像组={}
	self.技能展示={}
	self.伙伴头像={}
	self.伙伴bb头像={}
	self.我方阵型=nil
	self.敌方阵型=nil
	self.我方头像开关=false
	self.敌方头像开关=false
	self.hbxztx=0

end

function 战斗类:设置命令回合(数据)
	self.回合数 = self.回合数 +1
	if self.PK战斗 and not self.单挑模式 then
		for k,v in pairs(self.技能展示) do
			local x = 引擎.取技能展示("等待")
			local mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
			self.技能展示[k]={名称="等待中",小模型 = mx,偏移=x[10]}
		end
	end

	self.战斗指令:更新类型(数据)
	self.进程="命令"
	self.命令数据={计时=时间,分=5,秒=0}--42
end

function 战斗类:是否开启自动()
	for n=1,#self.战斗单位[ljcs] do
		if self.战斗单位[ljcs][n].数据.自动战斗 and self.战斗单位[ljcs][n].数据.类型=="角色" and self.战斗单位[ljcs][n].数据.id==引擎.场景.队伍[1].数字id then
			self.自动开关=true
		end
	end
end

function 战斗类:加载单位(数据)
	self.战斗单位[ljcs][#self.战斗单位[ljcs]+1]=战斗单位类()
	self.战斗单位[ljcs][#self.战斗单位[ljcs]]:创建单位(数据,self.队伍id,#self.战斗单位[ljcs])
	if #self.战斗单位[ljcs]==self.单位总数 then
		if 引擎.场景.观战中 == false then
			发送数据(5501)
	 	end
		self:是否开启自动()
	end

	if self.我方阵型==nil then
		if self.战斗单位[ljcs][#self.战斗单位[ljcs]].敌我==1 then
			self.我方阵型=self.战斗单位[ljcs][#self.战斗单位[ljcs]].数据.附加阵法
			local 资源 = 引擎.取阵法效果(self.我方阵型)
			self.我方阵法 = tp.资源:载入(资源[2],"网易WDF动画",资源[1])
		end
	end
	if self.敌方阵型==nil then
		if self.战斗单位[ljcs][#self.战斗单位[ljcs]].敌我==2 then
			self.敌方阵型=self.战斗单位[ljcs][#self.战斗单位[ljcs]].数据.附加阵法
			资源 = 引擎.取阵法效果(self.敌方阵型)
			self.敌方阵法 = tp.资源:载入(资源[2],"网易WDF动画",资源[1])
		end
	end

	-- if self.PK战斗 and not self.单挑模式 then
	-- 	if self.战斗单位[ljcs][#self.战斗单位[ljcs]].敌我==1 then
	-- 		local x = 引擎.取技能展示("等待")
	-- 		local mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
	-- 		self.技能展示[self.战斗单位[ljcs][#self.战斗单位[ljcs]].数据.位置]={名称="等待中",小模型 = mx,偏移=x[10]}
	-- 	end
	--     self:加载单位头像(self.战斗单位[ljcs][#self.战斗单位[ljcs]],#self.战斗单位[ljcs])
	-- end

	if  not self.单挑模式 then
		if self.PK战斗 then
			if self.战斗单位[ljcs][#self.战斗单位[ljcs]].敌我==1 then
				local x = 引擎.取技能展示("等待")
				local mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
				self.技能展示[self.战斗单位[ljcs][#self.战斗单位[ljcs]].数据.位置]={名称="等待中",小模型 = mx,偏移=x[11]}
			end
			self:加载单位头像(self.战斗单位[ljcs][#self.战斗单位[ljcs]],#self.战斗单位[ljcs])
		end
		if self.战斗单位[ljcs][#self.战斗单位[ljcs]].助战小号 and self.战斗单位[ljcs][#self.战斗单位[ljcs]].助战小号.主角id==引擎.场景.队伍[1].数字id then
			self:加载伙伴头像(self.战斗单位[ljcs][#self.战斗单位[ljcs]],#self.战斗单位[ljcs])
		end
  end

end


local 门派缩写={}
门派缩写["大唐官府"]="大\n唐"
门派缩写["化生寺"]="化\n生"
门派缩写["龙宫"]="龙\n宫"
门派缩写["魔王寨"]="魔\n王"
门派缩写["神木林"]="神\n木"
门派缩写["方寸山"]="方\n寸"
门派缩写["女儿村"]="女\n儿"
门派缩写["天宫"]="天\n宫"
门派缩写["普陀山"]="普\n陀"
门派缩写["盘丝洞"]="盘\n丝"
门派缩写["阴曹地府"]="地\n府"
门派缩写["狮驼岭"]="狮\n驼"
门派缩写["五庄观"]="五\n庄"
门派缩写["无底洞"]="无\n底"
门派缩写["凌波城"]="凌\n波"
门派缩写["花果山"]="花\n果"
门派缩写["无门派"]="无"
function 战斗类:加载伙伴头像(单位,编号)
	local x = 引擎.取头像(单位.模型)
	self.伙伴头像[#self.伙伴头像+1]=tp.资源:载入(x[7],"网易WDF动画",x[2]) --资源:载入('wzife.wd3',"网易WDF动画",4254597813)
	self.伙伴头像[#self.伙伴头像].num=编号
	self.伙伴头像[#self.伙伴头像].助战id=单位.助战小号.id
	-- self.伙伴头像[#self.伙伴头像].追加法术=单位.追加法术
	self.伙伴头像[#self.伙伴头像].名称=单位.数据.名称
	self.伙伴头像[#self.伙伴头像].门派=门派缩写[单位.数据.门派] or "无"
	self.伙伴头像[#self.伙伴头像].宝宝技能=nil
end

function 战斗类:伙伴设置命令(数据) --	self.战斗指令:更新类型(数据)
	for i=1,#self.伙伴头像 do
		if self.伙伴头像[i] and self.伙伴头像[i].助战id==数据.助战id then
			local 自动="攻击"
			if 数据.zdzl and 数据.zdzl[1] then
				if 数据.zdzl[1].类型~="法术" then
					自动=数据.zdzl[1].类型
				else
					自动=数据.zdzl[1].参数
				end
			end
			if 自动=="道具" then
				自动="攻击"
			end
			local x = 引擎.取技能展示(自动) --数据.zdzl1
			local mx --= tp.资源:载入(x[6],"网易WDF动画",x[7])
			local py= {0,0}
			-- if x[10] then
			-- 	mx = tp.资源:载入("wdf/audio/jmk/无底洞/jineng/"..自动..".png","图片")
			-- 	mx.图片=1
			-- else
			-- 	if x[11] then
			-- 		py=x[11]
			-- 	end
			-- 	mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
			-- end
			mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
			self.伙伴头像[i].伙伴技能={名称=自动,小模型 = mx,偏移=py,主动技能组=数据.zdjn1,自动技能=自动}
			self.伙伴头像[i].操作数据=数据
			if #数据.id>=2 then
				自动="攻击"
				if 数据.zdzl and 数据.zdzl[2] then
					if 数据.zdzl[2].类型~="法术" then
						自动=数据.zdzl[2].类型
					else
						自动=数据.zdzl[2].参数
					end
				end
				if 自动=="道具" then
					自动="攻击"
				end
				x = 引擎.取技能展示(自动) --数据.zdzl1
				--mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
				-- py= {0,0}
				-- if x[10] then
				-- 	mx = tp.资源:载入("wdf/audio/jmk/无底洞/jineng/"..自动..".png","图片")
				-- 	mx.图片=1
				-- else
				-- 	if x[11] then
				-- 		py=x[11]
				-- 	end
				-- 	mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
				-- end
				mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
				self.伙伴头像[i].宝宝技能={名称=自动,小模型 = mx,偏移=py,主动技能组=数据.zdjn2,自动技能=自动}
			else
				self.伙伴头像[i].宝宝技能=nil
			end
			break
		end
	end
end

function 战斗类:更新战斗图标(编号,类型,指令)
	if self.伙伴头像[编号] then
		if 类型==1 then
			if self.伙伴头像[编号].伙伴技能 then
				local x = 引擎.取技能展示(指令) --数据.zdzl1
				local mx --= tp.资源:载入(x[6],"网易WDF动画",x[7])
				local py= {0,0}
				-- if x[10] then
				-- 	mx = tp.资源:载入("wdf/audio/jmk/无底洞/jineng/"..指令..".png","图片")
				-- 	mx.图片=1
				-- else
				-- 	if x[11] then
				-- 		py=x[11]
				-- 	end
				-- 	mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
				-- end
				mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
				self.伙伴头像[编号].伙伴技能.名称=指令
				self.伙伴头像[编号].伙伴技能.小模型=mx
				self.伙伴头像[编号].伙伴技能.偏移=py
				self.伙伴头像[编号].伙伴技能.自动技能=指令
			end
		else
			if self.伙伴头像[编号].宝宝技能 then
				local x = 引擎.取技能展示(指令) --数据.zdzl1
				local mx --= tp.资源:载入(x[6],"网易WDF动画",x[7])
				local py= {0,0}
				-- -- if x[10] then
				-- -- 	py=x[10]
				-- -- end
				-- if x[10] then
				-- 	mx = tp.资源:载入("wdf/audio/jmk/无底洞/jineng/"..指令..".png","图片")
				-- 	mx.图片=1
				-- else
				-- 	if x[11] then
				-- 		py=x[11]
				-- 	end
				-- 	mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
				-- end
				mx = tp.资源:载入(x[6],"网易WDF动画",x[7])
				self.伙伴头像[编号].宝宝技能.名称=指令
				self.伙伴头像[编号].宝宝技能.小模型=mx
				self.伙伴头像[编号].宝宝技能.偏移=py
				self.伙伴头像[编号].宝宝技能.自动技能=指令
			end
		end
	end
	self.hbxztx=0
end

function 战斗类:加载单位头像(单位,编号)
	if 单位.数据.类型=="角色" then -- or 单位.数据.类型=="系统PK角色"
		if 单位.敌我==1 then
			local x = 引擎.取头像(单位.模型)
			self.我方头像组[#self.我方头像组+1]=tp._按钮.创建(tp.资源:载入(x[7],"网易WDF动画",x[2]),0,0,1)
			self.我方头像组[#self.我方头像组].num=编号
			self.我方头像组[#self.我方头像组].敌我=单位.敌我
			self.我方头像组[#self.我方头像组].名称=单位.数据.名称
			self.我方头像组[#self.我方头像组].门派=单位.数据.门派
			self.我方头像组[#self.我方头像组].等级=单位.数据.等级
		else
			local x = 引擎.取头像(单位.模型)
			self.敌方头像组[#self.敌方头像组+1]=tp._按钮.创建(tp.资源:载入(x[7],"网易WDF动画",x[2]),0,0,1)
			self.敌方头像组[#self.敌方头像组].num=编号
			self.敌方头像组[#self.敌方头像组].敌我=单位.敌我
			self.敌方头像组[#self.敌方头像组].名称=单位.数据.名称
			self.敌方头像组[#self.敌方头像组].门派=单位.数据.门派
			self.敌方头像组[#self.敌方头像组].等级=单位.数据.等级
		end
	end
end

function 战斗类:设置战斗流程(内容)
	self.战斗流程=内容
 --    for i=1,#self.特殊状态 do
	-- 	if self.特殊状态[i] ~= nil then
	-- 		if self.特殊状态[i].回合 == 0 then
	-- 			self:特殊状态处理(self.特殊状态[i].名称,2)
	-- 			self.特殊状态[i] = nil
	-- 			table.remove(self.特殊状态,i)
	-- 		else
	-- 			self.特殊状态[i].回合 = self.特殊状态[i].回合 -1
	-- 		end
	-- 	end
	-- end
	for n=1,#self.战斗流程 do
		if self.战斗流程~=nil and self.战斗流程[n]~=nil then
			self.战斗流程[n].执行=false
			self.战斗流程[n].允许=false
		end
	end
	if #self.战斗流程==0 then
		self.进程="等待"
		if 引擎.场景.观战中 == false then
			local  suih = 取随机数(999,9999)
			local  jmyzzd=取MD5(md66666..suih)
			--发送数据(5503,{jmyzzd,suih})
			发送数据(5503.9)
			-- 发送数据(5503,{引擎.场景.队伍[1].数字id+引擎.场景.队伍[1].数字id})
		end
		return
	end
	self.进程="计算"
end

function 战斗类:鬼魂复活(内容)
	--self.战斗单位[ljcs][内容.id].状态特效[内容.名称]=nil
	self.战斗单位[ljcs][内容.id].停止更新=false
	self.战斗单位[ljcs][内容.id]:换动作("待战")
	self.战斗单位[ljcs][内容.id]:设置掉血(内容.气血,2)
end

function 战斗类:取消状态(内容)
	if self.战斗单位[ljcs][内容.id] == nil then  return end
	self.战斗单位[ljcs][内容.id].状态特效[内容.名称]=nil
	if 内容.名称=="金刚护法" or 内容.名称=="分身术" or 内容.名称=="修罗隐身" or 内容.名称=="楚楚可怜" then
		self.战斗单位[ljcs][内容.id]:取消变相()
	end
end

function 战斗类:更新(dt,x,y)
	-- if 引擎.鼠标弹起(1)then
	--   引擎.场景.鼠标.还原鼠标()
	--   引擎.场景.鼠标.置鼠标("普通")
	-- end
	dt=dt--*self.dt

	for n=1,#self.战斗单位[ljcs] do
		if self.进程=="执行" then
			self.战斗单位[ljcs][n]:更新(dt,x,y)
		else
			if self.战斗单位[ljcs][n].敌我==1 and self.战斗单位[ljcs][n].动作=="待战" then --
				self.战斗单位[ljcs][n]:更新(dt*0.3,x,y)
			else
				self.战斗单位[ljcs][n]:更新(dt,x,y)
			end
		end
		if self.战斗单位[ljcs][n]:是否选中(x,y) and 引擎.鼠标弹起(右键)  then
			self.战斗单位[ljcs][n]:设置鼠标跟随()
		end
	end
	if 引擎.鼠标弹起(0x2) and 1==2 then
		local 敌方位置={}
		local 我方位置={}
		for n=1,#self.战斗单位[ljcs] do
			if self.战斗单位[ljcs][n].敌我==1 then
				我方位置[self.战斗单位[ljcs][n].数据.位置]={x=self.战斗单位[ljcs][n].显示xy.x,y=self.战斗单位[ljcs][n].显示xy.y}
			else
				敌方位置[self.战斗单位[ljcs][n].数据.位置]={x=self.战斗单位[ljcs][n].显示xy.x,y=self.战斗单位[ljcs][n].显示xy.y}
			end
		end
	end
	if self.进程=="命令" then
		if self.hbxztx==0 then
			self.战斗指令:更新(dt,x,y)
		else
			self.伙伴zhil:更新(dt,x,y)
		end
		-- self.战斗指令:更新(dt,x,y)
		-- if self.拼接特效 ~= nil then
		-- end
	end
	if self.进程=="计算" and self.战斗流程~=nil and self.战斗流程[1]~=nil then
		if self.战斗流程[1].允许==false then
			if self.战斗流程[1].提示==nil or self.战斗流程[1].提示.允许==false  then
				self.战斗流程[1].可以执行=true
			elseif self.战斗流程[1].提示.类型=="法术" and self.战斗流程[1].可以执行==nil then
				if self.战斗流程[1].特技名称==nil  then
					if self.战斗流程[1].提示.允许 then
						self:添加战斗提醒文字(self.战斗流程[1].提示.名称)
						local lsmc = 分割文本(self.战斗流程[1].提示.名称,"使用了")
						local 临时音乐=引擎.取音效(lsmc[2]) --还是要改 特技先现字，再去打，还还有法术的时候的音效
						if 临时音乐~=nil and 临时音乐.文件~=nil then
							tp:游戏音效类(临时音乐.文件,临时音乐.资源,名称)
						end
					end
				elseif self.战斗流程[1].提示.允许 then
					self.Tejitime=50
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:添加特技内容(self.战斗流程[1].特技名称)
				end
				self.战斗流程[1].可以执行=true
			end
		end
		if self.战斗流程[1].战斗提示 and self.战斗流程[1].战斗提示.内容 and self.战斗流程[1].战斗提示.编号 then
			self.战斗单位[ljcs][self.战斗流程[1].战斗提示.编号]:设置提示(self.战斗流程[1].战斗提示.内容)
			self.战斗流程[1].战斗提示 = nil
		end
		if self.Tejitime then
		    self.Tejitime=self.Tejitime-1
		    if self.Tejitime<0 then
		        self.Tejitime=nil
		        local 临时音乐=引擎.取音效(self.战斗流程[1].特技名称) --还是要改 特技先现字，再去打，还还有法术的时候的音效
				if 临时音乐~=nil and 临时音乐.文件~=nil then
					tp:游戏音效类(临时音乐.文件,临时音乐.资源,名称)
				end
		    end
		end
		if self.战斗流程[1].可以执行 and self.Tejitime==nil then--and not self.Tejitime then --self.战斗单位[ljcs][self.战斗流程[1].攻击方].特技内容开关==false then
			self.战斗流程[1].允许=true
			self.执行流程=self.战斗流程[1].流程
			self.进程="执行"
		end
		if self.背景状态 ~= nil then
			self.背景状态 = 1
		end
	elseif self.进程=="执行" then
		self.hbxztx=0
		self:流程更新()
		if self.拼接特效 ~= nil then
			for n=1,#self.拼接特效 do
				if self.拼接特效[n]~=nil then

					if self.拼接特效[n].延时~= nil then
						self.拼接特效[n].延时 = self.拼接特效[n].延时 -1
						if self.拼接特效[n].延时== 1 then
							self.拼接特效[n].延时 = nil
						end
					else
						self.拼接特效[n].特效:更新(dt*self.全屏加速+tp.施法速度)
						if self.掉血帧~=nil then
							if n==self.掉血特效 then
								if self.拼接特效[n].特效.当前帧 >= self.掉血帧 then
				                    self.掉血流程=nil
				                end
							end
							if self.拼接特效[n].特效.当前帧>=self.拼接特效[n].特效.结束帧 then
								self.拼接特效[n] = nil
								self.掉血帧 = nil
				                table.remove(self.拼接特效,n)
				                -- if #self.拼接特效==self.掉血流程 then self.掉血流程=nil end
				            end
						else
							if self.拼接特效[n].特效.当前帧>=self.拼接特效[n].特效.结束帧 then
								self.拼接特效[n] = nil
								table.remove(self.拼接特效,n)
							end
							if #self.拼接特效==n and self.拼接特效[n].特效.当前帧==math.floor(self.拼接特效[n].特效.结束帧/1.5) then self.掉血流程=nil end
						end
					end
				end
			end
			if #self.拼接特效==0 then
				self.拼接特效=nil
				self.背景状态=nil
			end
		end
	end
end

function 战斗类:施法流程(原始流程,攻击方,挨打方,特效,全屏)
	-- 引擎.场景.窗口.消息框:添加文本(os.time().." 施法流程 ","dq")
	self.施法信息={原始流程=原始流程,攻击方=攻击方,挨打方=挨打方,特效=特效,全屏=全屏}
	self.掉血流程=0
	if self.战斗单位[ljcs][self.战斗流程[1].攻击方].单位类型=="角色" and self.战斗单位[ljcs][self.战斗流程[1].攻击方].数据.锦衣[7]~=nil and skill法攻[特效] then
		self.施法信息.全屏=false
		self.施法信息.特效="齐天大圣·群法"
	end
	self.执行流程="施法流程"
	self.jsq=os.time()
end

function 战斗类:施法流程更新()
	-- 引擎.场景.窗口.消息框:添加文本(os.time().." 施法流程更新 ","dq")
	-- 引擎.场景.窗口.消息框:添加文本("=============","dq")
	if self.施法信息 and os.time()-self.jsq>=1 then
		-- 引擎.场景.窗口.消息框:添加文本(os.time().."取施法完毕","dq")
		if type(self.施法信息.挨打方) == "table" then
			if self.施法信息.全屏 then
				self:置全屏技能(self.施法信息.特效,self.战斗单位[ljcs][self.施法信息.挨打方[1].挨打方])
			else
				for i=1,#self.施法信息.挨打方 do
					if self.施法信息.特效 == "飞镖" then
						self.战斗单位[ljcs][self.施法信息.挨打方[i].挨打方]:设置飞镖(self.战斗单位[ljcs][self.施法信息.攻击方].显示xy,self.战斗单位[ljcs][self.施法信息.攻击方].初始方向,self.施法信息.挨打方[i].伤害,self.施法信息.挨打方[i].死亡,"飞镖")
					else
				    	self.战斗单位[ljcs][self.施法信息.挨打方[i].挨打方]:添加法术特效(self.施法信息.特效)
					end
				end
			end
		else
	    	if self.施法信息.全屏 then
				self:置全屏技能(self.施法信息.特效,self.战斗单位[ljcs][self.施法信息.挨打方])
			else
				self.战斗单位[ljcs][self.施法信息.挨打方]:添加法术特效(self.施法信息.特效)
			end
		end
		self.执行流程 = self.施法信息.原始流程
		self.施法信息 = nil
	end
end
function 战斗类:取九黎攻击动作(攻击方, 排除)
	local 攻击顺序 = {"攻击","连击1","连击3"}
	self.攻击动作 = self.攻击动作 + 1
	if self.战斗单位[ljcs][攻击方].动画.动画[攻击顺序[self.攻击动作]] then
	    if self.攻击动作 > #攻击顺序 then
		    self.攻击动作 = 1
		end
		while self.攻击动作 == 排除 do
			self.攻击动作 = math.random(1, #攻击顺序)
		end
	else
	    self.攻击动作 = 1
	end
	return 攻击顺序[self.攻击动作]
end
function 战斗类:流程更新()
	if self.战斗流程[1] ~= nil and self.战斗流程[1].攻击方 then
		战斗连击单位 = self.战斗流程[1].攻击方 + 0
	end
	if self.战斗单位[ljcs][self.战斗流程[1].攻击方] then
	    if self.战斗单位[ljcs][self.战斗流程[1].攻击方].模型 == '影精灵' then
	        self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("连击3",0.04)
	    end
	end
	if self.执行流程==1 and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态() and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态()  then -- 攻击
		if self.战斗流程[1].战斗法术 then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
			for i=1,#self.战斗流程[1].寄存目标 do
				self.战斗单位[ljcs][self.战斗流程[1].寄存目标[i]]:添加法术特效(self.战斗流程[1].战斗法术)
			end
			self.战斗流程[1].延时等待=os.time()+1
			self.执行流程=1.2
		elseif self.战斗流程[1].前摇掉血 then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:施法前掉血(self.战斗流程[1].前摇掉血)
			self.战斗流程[1].延时等待=os.time()
			self.执行流程=1.2
		elseif self.战斗流程[1].全屏法术 then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
			self:施法流程(1.1,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].全屏法术,true)
		elseif self.战斗流程[1].全屏22 then --破釜沉舟
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
			self:施法流程(1.3,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].全屏22,true)
		else
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关=true
			if self.战斗流程[1].友伤 == true then
				self.战斗单位[ljcs][self.战斗流程[1].攻击方].友伤 = true
				self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("友伤")
			else
				self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("挨打")
			    -----------------------------------超级技能2.8 加
			    if self.战斗单位[ljcs][self.战斗流程[1].攻击方].超级偷袭 then
			    	local abc=self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标
			    	if self.战斗单位[ljcs][self.战斗流程[1].攻击方].敌我==1 then
				    	self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x=abc.x-115
				    	self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=abc.y-55
				    else
				    	self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x=abc.x+115
				    	self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=abc.y+55
				    end
			    end
			    -----------------------------------
			end
			self.执行流程=2
		end
	elseif self.执行流程==1.2 and os.time()-self.战斗流程[1].延时等待>=1 then --掉血等待
		self.战斗流程[1].延时等待=nil
		self.执行流程=1.1
	elseif self.执行流程==1.3  then
		for i=1,#self.战斗流程[1].寄存目标 do
			self.战斗单位[ljcs][self.战斗流程[1].寄存目标[i]]:换动作("挨打",nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].寄存目标[i]]:开启击退(nil,self.战斗单位[ljcs][self.战斗流程[1].寄存目标[i]]:取移动坐标("返回"))
		end
		self.战斗流程[1].延时等待=os.time()
		self.执行流程=1.4
    elseif self.执行流程==1.4 and os.time()-self.战斗流程[1].延时等待>=2 then
    	self.战斗流程[1].延时等待=nil
    	self.执行流程=1.1
	elseif self.执行流程==1.1 and self.掉血流程==nil and self.拼接特效==nil then
		self.战斗流程[1].延时1=nil
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关=true
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("挨打")
		self.执行流程=2
	elseif self.执行流程==2 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关==false then
		if self.战斗流程[1].保护数据==nil then
			-- self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("攻击",true,nil,self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡)
			-- if self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击抖动 and not self.战斗流程[1].躲避 then
			--     self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].物理抖动开关=true
			-- end
			local yjl = ""
			self.战斗流程[1].附带特效 = nil
			if self.战斗单位[ljcs][self.战斗流程[1].攻击方].模型 == "影精灵" and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画.动画.连击1 ~= nil then
				if self.战斗流程[1].技能 == "枫影二刃" then
					if self.战斗流程[1].多次攻击 == 1 then
						yjl = self:取九黎攻击动作(self.战斗流程[1].攻击方 )
					end
				elseif self.战斗流程[1].技能 == "一斧开天" then
					if self.战斗流程[1].致使浮空 == true then
						if self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画.动画.连击2 then
						    yjl = "连击2"
						else
							yjl = '攻击2'
						end
						self.战斗流程[1].附带特效 = '一斧开天成功'
					else
						yjl = self:取九黎攻击动作(self.战斗流程[1].攻击方 )
						self.战斗流程[1].附带特效 = '一斧开天失败'
					end
				elseif self.战斗流程[1].技能 == "铁血生风" then
					yjl = self:取九黎攻击动作(self.战斗流程[1].攻击方)
				elseif self.战斗流程[1].技能 == "三荒尽灭" then
					yjl = self:取九黎攻击动作(self.战斗流程[1].攻击方)
				elseif self.战斗流程[1].技能 == "力辟苍穹" or self.战斗流程[1].技能 == "魔神之刃" then
					yjl = self:取九黎攻击动作(self.战斗流程[1].攻击方)
				end
				collectgarbage("collect");
			end
			if yjl ~= "" and yjl ~= "攻击" then
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作(yjl, true, nil, self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡)

				if self.战斗流程[1].挨打方[1].死亡 ~= nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率(yjl, 0.1 * math.max(10 , 1) / 10)
				end
			elseif self.战斗单位[ljcs][self.战斗流程[1].攻击方].开启暴击 ~= nil then
				yjl = "攻击2"
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("攻击2", true, nil, self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡)
				if self.战斗流程[1].挨打方[1].死亡 ~= nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击2", 0.1 * math.max(10 , 1) / 10)
				end
			else
				yjl = "攻击"
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("攻击",true,nil,self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡)
				if self.战斗流程[1].挨打方[1].死亡 ~= nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击", 0.1 * math.max(10 , 1) / 10)
				end
				if not self.战斗流程[1].假动作 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击抖动  and not self.战斗流程[1].躲避 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].物理抖动开关=true
				end
			end
			self.执行流程=3
		else
			self.执行流程=10
		end
	elseif self.执行流程==3 then
		if self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取间隔() >= self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取中间()+self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击帧  then
			if self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画.攻击方式==1 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:设置弓弩(self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy)--({x=self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画.武器.攻击.x,y=self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画.武器.攻击.y+self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画.武器.攻击.高度},self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始方向,"弓弩"..3)
			    self.执行流程=3.2 --远程攻击
			else
				self.执行流程=3.1
			end
		end
	elseif self.执行流程==3.1 then
		if self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取间隔() >= self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取中间()+self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击帧 then
			if self.战斗流程[1].躲避 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启躲避()
				self.执行流程=7
			elseif self.战斗流程[1].假动作 then
				self.执行流程=7
			elseif self.战斗流程[1].共生 then
                for i=1,#self.战斗流程[1].共生 do
					if self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方] ~= nil then
						self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:设置掉血(self.战斗流程[1].共生[i].伤害,1)
						self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:换动作("挨打",nil,true)
						self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:开启击退(self.战斗流程[1].共生[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
					end
				end
                if self.战斗流程[1].挨打方[1].死亡~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击",0.19)
				end
				for n=1,#self.战斗流程[1].挨打方[1].特效 do
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[1].特效[n])
				end
				self.执行流程=17
			else
				-- self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:换动作(self.战斗流程[1].挨打方[1].动作,nil,true)
				-- self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启击退(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回")) --(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy,self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始方向)
				-- self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:设置掉血(self.战斗流程[1].挨打方[1].伤害,self.战斗流程[1].挨打方[1].伤害类型)
				-- if self.战斗流程[1].反震伤害==nil and self.战斗流程[1].超强力 ~=nil then
				-- 	self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].转圈方向 = self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].初始方向
				-- 	self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].喊话:写入(self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方],self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].动画.动画,"#65")
				-- 	self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启转圈()
				-- end
				-- if self.战斗流程[1].挨打方[1].死亡~=nil then--and  self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].击退开关 then
				-- 	self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击",0.19)
				-- end

				-- for n=1,#self.战斗流程[1].挨打方[1].特效 do
				-- 	self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[1].特效[n])
				-- end
                self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:换动作(self.战斗流程[1].挨打方[1].动作,nil,true)
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启击退(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回")) --(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy,self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始方向)
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:设置掉血(self.战斗流程[1].挨打方[1].伤害,self.战斗流程[1].挨打方[1].伤害类型)
				if self.战斗流程[1].挨打方[1].特效[1] ~= nil and 九黎城攻击技能[self.战斗流程[1].挨打方[1].特效[1]] ~= nil then
					战斗连击单位 = self.战斗流程[1].攻击方
					if 战斗连击显示[self.战斗流程[1].攻击方] == nil then
						战斗连击显示[self.战斗流程[1].攻击方] = 0
					end
					战斗连击显示[self.战斗流程[1].攻击方] = 战斗连击显示[self.战斗流程[1].攻击方] + 1
				else
					战斗连击单位 = 0
				end
				if self.战斗流程[1].挨打方[1].死亡~=nil then--and  self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].击退开关 then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击",0.19)
				end

				if self.战斗流程[1].特殊效果 then
				    self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效(self.战斗流程[1].特殊效果)
				else
					if self.战斗流程[1].附带特效 then
						self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效(self.战斗流程[1].附带特效)
					end
					for n=1,#self.战斗流程[1].挨打方[1].特效 do
						self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[1].特效[n])
					end
				end
				if self.战斗流程[1].浮空目标 then
				    self.战斗单位[ljcs][self.战斗流程[1].浮空目标]:浮空处理()
				end
				if self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].浮空开关 then
				    self.战斗单位[ljcs][self.战斗流程[1].攻击方]:浮空处理1()
				end









				if self.战斗流程[1].吸血伤害~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].吸血伤害,2)
				end
				if self.战斗流程[1].反震伤害~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].反震伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].反震死亡,self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("返回"))--self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].初始xy.x,self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].初始xy.y)
					self.执行流程=8
				else
					self.执行流程=17
				end
			end
		end

	elseif self.执行流程==3.2 then --远程攻击  -- 1 2 3 3.2 17
		if not self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].弓弩开关 then
			if self.战斗流程[1].躲避 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启躲避()
				self.执行流程=7
			elseif self.战斗流程[1].假动作 then
				self.执行流程=7
			elseif self.战斗流程[1].共生 then
                for i=1,#self.战斗流程[1].共生 do
					if self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方] ~= nil then
						self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:设置掉血(self.战斗流程[1].共生[i].伤害,1)
						self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:换动作("挨打",nil,true)
						self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:开启击退(self.战斗流程[1].共生[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
					end
				end
                if self.战斗流程[1].挨打方[1].死亡~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击",0.19)
				end
				for n=1,#self.战斗流程[1].挨打方[1].特效 do
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[1].特效[n])
				end
				self.执行流程=17
			else
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:换动作(self.战斗流程[1].挨打方[1].动作,nil,true)
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启击退(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回")) --(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy,self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始方向)
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:设置掉血(self.战斗流程[1].挨打方[1].伤害,self.战斗流程[1].挨打方[1].伤害类型)
				if self.战斗流程[1].挨打方[1].死亡~=nil then--and  self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].击退开关 then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击",0.19)
				end

				for n=1,#self.战斗流程[1].挨打方[1].特效 do
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[1].特效[n])
				end
				if self.战斗流程[1].吸血伤害~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].吸血伤害,2)
				end
				if self.战斗流程[1].反震伤害~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].反震伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].反震死亡,self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("返回"))--self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].初始xy.x,self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].初始xy.y)
					self.执行流程=8
				else
					self.执行流程=17
				end
			end
		end
	elseif self.执行流程==4 and ((self.战斗流程[1].挨打方[1]==nil or self.战斗流程[1].挨打方[1].挨打方==nil or self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]==nil) or self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态()) then
		if self.战斗流程[1].反击伤害~=nil and  (self.战斗流程[1].挨打方[1]~=nil and self.战斗流程[1].挨打方[1].挨打方~=nil and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]~=nil) then
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:换动作("攻击",true)
			if self.战斗流程[1].反击死亡~=nil then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].动画:置帧率("攻击",0.11)
			end
			self.执行流程=16
		elseif self.战斗流程[1].超反击伤害~=nil and (self.战斗流程[1].挨打方[1]~=nil and self.战斗流程[1].挨打方[1].挨打方~=nil and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]~=nil) and self.战斗流程[1].超反编号~=nil and self.战斗单位[ljcs][self.战斗流程[1].超反编号]~=nil then
		    local xbh = self.战斗流程[1].超反编号
		    self.战斗单位[ljcs][xbh]:换动作("攻击",true)
		    if self.战斗流程[1].超反击死亡~=nil then
				self.战斗单位[ljcs][xbh].动画:置帧率("攻击",0.11)
			end
			self.执行流程=16
		elseif self.战斗流程[1].返回 then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].返回开关=true
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回")
			self.执行流程=5
		else
			self.执行流程=6
		end
	elseif self.执行流程==5 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态() then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换方向(self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始方向)
		self.执行流程=6
	elseif self.执行流程== "施法流程" then
		self:施法流程更新()
	elseif self.执行流程==6 then
		for n=1,#self.战斗单位[ljcs] do
			if self.战斗单位[ljcs][n]:取状态()==false then return  end
		end
		self:流程更新二段()
	elseif self.执行流程==7 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"  then
		self.执行流程=4
	elseif self.执行流程==8 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态() and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态() then
		if self.战斗流程[1].反震死亡==nil  then
			self.执行流程=4
		else
			self.执行流程=6
		end
	elseif self.执行流程==9 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态() and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态() then
		if self.战斗流程[1].反击死亡==nil or self.战斗流程[1].超反击死亡==nil then
			self.战斗流程[1].反击伤害=nil
			self.战斗流程[1].超反击伤害=nil
			self.执行流程=4
		else
			self.执行流程=6
		end
	elseif self.执行流程==10 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关==false then -- 攻击
		self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号].保护 = true
		self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("保护")
		self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号]:添加攻击特效("保护")
		local 临时音乐=引擎.取音效("保护")
		if 临时音乐~=nil and 临时音乐.文件~=nil then
			tp:游戏音效类(临时音乐.文件,临时音乐.资源)
		end
		self.执行流程=11

	elseif self.执行流程==11 and self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号].移动开关==false then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("攻击",true,nil,self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡)
		self.执行流程=12
	elseif self.执行流程==12 then
		if  self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取间隔() >= self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取中间()+self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击帧  then
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:换动作(self.战斗流程[1].挨打方[1].动作,nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启击退(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:设置掉血(self.战斗流程[1].挨打方[1].伤害,self.战斗流程[1].挨打方[1].伤害类型)
			self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号]:换动作("挨打",nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号]:开启击退(self.战斗流程[1].保护数据.死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
			self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号]:设置掉血(self.战斗流程[1].保护数据.伤害,self.战斗流程[1].挨打方[1].伤害类型)
			if self.战斗流程[1].挨打方[1].死亡~=nil then
				self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击",0.19)
			end
			for n=1,#self.战斗流程[1].挨打方[1].特效 do
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[1].特效[n])
			end
			if self.战斗流程[1].吸血伤害~=nil then
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].吸血伤害,2)
			end
			self.执行流程=13
		end
	elseif self.执行流程==13 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态() and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态() and self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号]:取状态() then
		if self.战斗流程[1].保护数据.死亡~=nil then
			self.执行流程=4
		else
			self.执行流程=14
		end
	elseif self.执行流程==14 then
		self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号].返回开关=true
		self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].保护数据.编号]:取移动坐标("返回")
		self.执行流程=15
	elseif self.执行流程==15 then
		self.执行流程=4
	elseif self.执行流程==16 then
		if self.战斗流程[1].超反编号~=nil and self.战斗单位[ljcs][self.战斗流程[1].超反编号]~=nil then
			local xbh=self.战斗流程[1].超反编号
			if  self.战斗单位[ljcs][xbh]:取间隔() >= self.战斗单位[ljcs][xbh]:取中间()+self.战斗单位[ljcs][xbh].攻击帧  then
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].超反击伤害,1)
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].超反击死亡,self.战斗单位[ljcs][xbh]:取移动坐标("返回"))
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:添加攻击特效("暴击")
				self.执行流程=9
			end
		elseif  self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取间隔() >= self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取中间()+self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].攻击帧  then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].反击伤害,1)
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].反击死亡,self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("返回"))
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:添加攻击特效("暴击")
			self.执行流程=9
		end
	elseif self.执行流程==17 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then--and self.战斗单位[ljcs][self.战斗流程[1].攻击方].掉血开关==false then
		if self.战斗流程[1].反击伤害~=nil or self.战斗流程[1].超反击伤害~=nil then
			self.执行流程=4
		elseif self.战斗流程[1].返回 then
		    self.战斗单位[ljcs][self.战斗流程[1].攻击方].返回开关=true
		    self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回")
		    self.执行流程=5
		else
		    self.执行流程=6
		end
	elseif self.执行流程==50 then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true,nil,self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡)
		if self.战斗流程[1].群封 == false then
			self:施法流程(51,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
		else
			if self.战斗流程[1].全屏 then
				self:施法流程(51.1,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],true)
			else
				self:施法流程(51.1,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
			end
		end
	elseif self.执行流程==51 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 then --单体
		if self.战斗流程[1].反弹 then
		    self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:不掉血文字("反弹")
		end
		self.执行流程=52
	elseif self.执行流程==51.1 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0  then --群封 需要测试，还有法系群秒也需要测试
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗流程[1].挨打方[n].反弹 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:不掉血文字("反弹")
			end
		end
		self.执行流程=52
	elseif self.执行流程==52 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
		self.执行流程=6
	elseif self.执行流程==53 and self.拼接特效==nil then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true,nil,self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡)
		if self.战斗流程[1].全屏 == true then
		 	self:施法流程(54.1,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],true)
		else
			self:施法流程(54,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
		end
	elseif self.执行流程==54.1 and self.战斗流程[1].全屏 == true and self.拼接特效==nil then
		self.执行流程=54
	elseif self.执行流程==54 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 then
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗流程[1].挨打方[n].恢复气血~=nil then
			    self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].恢复气血,2)
			end
		end
		self.执行流程=55
	elseif self.执行流程==55 and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].掉血开关==false and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"  then
		self.执行流程=6
	elseif self.执行流程==56 then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
	 	self:施法流程(57,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
	elseif self.执行流程==57 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 then
		if self.战斗流程[1].挨打方[1].气血~=nil then
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:设置掉血(self.战斗流程[1].挨打方[1].气血,1)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:换动作("挨打",nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启击退(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
		elseif self.战斗流程[1].挨打方[1].击退~=nil then
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:换动作("挨打",nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启击退(nil)
		end
		self.执行流程=58
	elseif self.执行流程==58 and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态() then
		if self.战斗流程[1].挨打方[1].特效[1] == "笑里藏刀" and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].单位id == 引擎.场景.队伍[1].数字id then
			引擎.场景.队伍[1].愤怒=self.战斗流程[1].愤怒
		end
		if self.战斗流程[1].增加气血~=nil then
		    self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].增加气血,2)
		end
		self.执行流程=59
	elseif self.执行流程==59 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态() then
		self.执行流程=6
	elseif self.执行流程==60 then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		if self.战斗流程[1].扣除气血~=nil then
			if self.战斗流程[1].全屏法术 then
				self:施法流程(63,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],true)
			else
				self:施法流程(63,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
			end
		else
			if self.战斗流程[1].全屏法术 then
				self:施法流程(61,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],true)
			else
				self:施法流程(61,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
			end
		end
	elseif self.执行流程==61 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0  and self.掉血流程==nil then
		if self.战斗流程[1].愤怒 then --金刚怒目
		    引擎.场景.队伍[1].愤怒=self.战斗流程[1].愤怒
		end
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗流程[1].挨打方[n].恢复气血~=nil then
			    self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].恢复气血,2)
			end
			if self.战斗流程[1].挨打方[n].恢复伤势~=nil then
			    self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:同步伤势(nil,self.战斗流程[1].挨打方[n].恢复伤势)
			end
			if self.战斗流程[1].挨打方[n].复活~=nil then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:换动作("待战")
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方].停止更新=false
			end
		end
		self.执行流程=62
	elseif self.执行流程==62 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态() and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"  then
		local 条件通过=#self.战斗流程[1].挨打方
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取状态() then
				条件通过=条件通过-1
			end
		end
		if 条件通过<=0 then
			self.执行流程=6
		end
	elseif  self.执行流程==63 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" and self.掉血流程==nil then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].扣除气血,1)
		self.执行流程=64
	elseif self.执行流程==64 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态() then
	    self.执行流程=61
    elseif self.执行流程==108 then
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗流程[1].挨打方[n].挨打方==nil or self.战斗流程[1].挨打方[n].挨打方==0 or self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]==nil then
			   table.remove(self.战斗流程[1].挨打方.n)
			end
		end
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true,nil,self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡) --唧唧歪歪
		self:施法流程(109,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
	elseif self.执行流程==109 and (#self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 or self.掉血流程==nil) then --and  self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗流程[1].挨打方[n].特效[2]~=nil then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
			end
			if self.战斗流程[1].挨打方[n].躲避 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("躲避")
			elseif self.战斗流程[1].挨打方[n].免疫 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("免疫")
			elseif self.战斗流程[1].挨打方[n].反弹 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("反弹")
			elseif self.战斗流程[1].挨打方[n].无穷 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("无穷")
			else
                self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].类型)
			end
			if self.战斗流程[1].挨打方[n].死亡 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:换动作("挨打",nil,true)
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
			else
			    self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启转圈()
			end
			if self.战斗流程[1].反震伤害~=nil then
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].反震伤害,1)
				self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].反震死亡,self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取移动坐标("返回"))
			end
		end
		self.执行流程=110
	elseif self.执行流程==110 then
		self.战斗流程[1].等待计时=os.time()
		self.执行流程=111
	elseif self.执行流程==111 then
		if os.time()-self.战斗流程[1].等待计时>=1 then
			for n=1,#self.战斗流程[1].挨打方 do
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:关闭转圈()
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方].动画:置方向(self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方].转圈方向,"待战")
			end
			self.战斗流程[1].等待计时=nil
			self.执行流程=202
		end

	elseif self.执行流程==200 then
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗流程[1].挨打方[n].挨打方==nil or self.战斗流程[1].挨打方[n].挨打方==0 or self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]==nil then
			   table.remove(self.战斗流程[1].挨打方.n)
			end
		end
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true,nil,self.战斗流程[1].结尾气血,self.战斗流程[1].结尾死亡) --唧唧歪歪
		if skill无需抖动[self.战斗流程[1].挨打方[1].特效[1]] then
		    self:施法流程(201,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
		else
			self:施法流程(201.1,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
		end
	--法术抖动--
	elseif self.执行流程==201.1 then
		for n=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方].法术抖动开关 = self.战斗流程[1].挨打方[1].特效[1]
		end
		self.执行流程=203
	elseif self.执行流程==203 and (#self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 or self.掉血流程==nil) then --and  self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"
		if self.战斗流程[1].共生 then
		    for n=1,#self.战斗流程[1].挨打方 do
		    	if self.战斗流程[1].挨打方[n].特效[2]~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
				end
		    end
		    for i=1,#self.战斗流程[1].共生 do
				if self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方] ~= nil then
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:设置掉血(self.战斗流程[1].共生[i].伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:开启击退(self.战斗流程[1].共生[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
				end
			end
		else
			for n=1,#self.战斗流程[1].挨打方 do
				if self.战斗流程[1].挨打方[n].特效[2]~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
				end
				if self.战斗流程[1].挨打方[n].躲避 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("躲避")
				elseif self.战斗流程[1].挨打方[n].免疫 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("免疫")
				elseif self.战斗流程[1].挨打方[n].反弹 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("反弹")
				elseif self.战斗流程[1].挨打方[n].无穷 then
						self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("无穷")
				else
	                self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].类型)
				end
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:抖动挨打音效()
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
				if self.战斗流程[1].反震伤害~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].反震伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].反震死亡,self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取移动坐标("返回"))
				end
			end
		end
		self.执行流程=202
	--法术抖动--
	elseif self.执行流程==201 and (#self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 or self.掉血流程==nil) then --and  self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"
		if self.战斗流程[1].共生 then
		    for n=1,#self.战斗流程[1].挨打方 do
		    	if self.战斗流程[1].挨打方[n].特效[2]~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
				end
		    end
		    for i=1,#self.战斗流程[1].共生 do
				if self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方] ~= nil then
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:设置掉血(self.战斗流程[1].共生[i].伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:开启击退(self.战斗流程[1].共生[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
				end
			end
		else
			for n=1,#self.战斗流程[1].挨打方 do
				if self.战斗流程[1].挨打方[n].特效[2]~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
				end
				if self.战斗流程[1].挨打方[n].躲避 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("躲避")
				elseif self.战斗流程[1].挨打方[n].免疫 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("免疫")
				elseif self.战斗流程[1].挨打方[n].反弹 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("反弹")
				elseif self.战斗流程[1].挨打方[n].无穷 then
						self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("无穷")
				else
	                self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].类型)
				end
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:换动作("挨打",nil,true)
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
				if self.战斗流程[1].反震伤害~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].反震伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].反震死亡,self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取移动坐标("返回"))
				end
			end
		end

		self.执行流程=202
	elseif self.执行流程==202 then
	 	local 条件通过=#self.战斗流程[1].挨打方
	 	for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取状态() then
				条件通过=条件通过-1
			else
				条件通过=条件通过-1
			end
		end
		if 条件通过<=0 and self.拼接特效==nil then --and self.拼接特效==nil  我加的
			self.执行流程=6
		end
	elseif self.执行流程==205 and self.拼接特效==nil then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		if skill无需抖动[self.战斗流程[1].挨打方[1].特效[1]] then
		 	self:施法流程(206,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],true)
		else
			self:施法流程(206.1,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],true)
		end
    elseif self.执行流程==206 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 and self.掉血流程==nil then
		self.执行流程=201
    --法术抖动
    elseif self.执行流程==206.1 then
    	for n=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方].法术抖动开关 = self.战斗流程[1].挨打方[1].特效[1]
		end
		self.执行流程=207
	elseif self.执行流程==207 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 and self.掉血流程==nil then
		if self.战斗流程[1].共生 then
		    for n=1,#self.战斗流程[1].挨打方 do
		    	if self.战斗流程[1].挨打方[n].特效[2]~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
				end
		    end
		    for i=1,#self.战斗流程[1].共生 do
				if self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方] ~= nil then
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:设置掉血(self.战斗流程[1].共生[i].伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:开启击退(self.战斗流程[1].共生[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
				end
			end
		else
			for n=1,#self.战斗流程[1].挨打方 do
				if self.战斗流程[1].挨打方[n].特效[2]~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
				end
				if self.战斗流程[1].挨打方[n].躲避 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("躲避")
				elseif self.战斗流程[1].挨打方[n].免疫 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("免疫")
				elseif self.战斗流程[1].挨打方[n].反弹 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("反弹")
				elseif self.战斗流程[1].挨打方[n].无穷 then
						self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("无穷")
				else
	                self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].类型)
				end
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:抖动挨打音效()
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
				if self.战斗流程[1].反震伤害~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].反震伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].反震死亡,self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取移动坐标("返回"))
				end
			end
		end
		self.执行流程=202
    --法术抖动
	elseif self.执行流程==208 then --只施法
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		self:施法流程(209,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
	elseif self.执行流程==209 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 and self.掉血流程==nil then
		self.执行流程=6
	elseif self.执行流程==210 then--超级神鸡
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("攻击3",true)
		self.执行流程=211
	elseif self.执行流程==211 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
		self.执行流程=6
	elseif self.执行流程==300 then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置抓捕动画(self.战斗流程[1].挨打方[1].挨打方,self.战斗流程[1].宝宝,self.战斗流程[1].捕捉成功,self.战斗流程[1].名称)
		self.执行流程=301
	elseif self.执行流程==301 and  self.战斗单位[ljcs][self.战斗流程[1].攻击方].抓捕开关==false then
		self.执行流程=6
	elseif self.执行流程==311 then --月光
		self:施法流程(201.2,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
	elseif self.执行流程==201.2 then --and  self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"
		if self.战斗流程[1].共生 then
		    for n=1,#self.战斗流程[1].挨打方 do
		    	if self.战斗流程[1].挨打方[n].特效[2]~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
				end
		    end
		    for i=1,#self.战斗流程[1].共生 do
				if self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方] ~= nil then
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:设置掉血(self.战斗流程[1].共生[i].伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].共生[i].挨打方]:开启击退(self.战斗流程[1].共生[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
				end
			end
		else
			for n=1,#self.战斗流程[1].挨打方 do
				if self.战斗流程[1].挨打方[n].特效[2]~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效(self.战斗流程[1].挨打方[n].特效[2])
				end
				if self.战斗流程[1].挨打方[n].躲避 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("躲避")
				elseif self.战斗流程[1].挨打方[n].免疫 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("免疫")
				elseif self.战斗流程[1].挨打方[n].反弹 then
					self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("反弹")
				elseif self.战斗流程[1].挨打方[n].无穷 then
						self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:不掉血文字("无穷")
				else
	                self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].类型)
				end
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:换动作("挨打",nil,true)
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
				if self.战斗流程[1].反震伤害~=nil then
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("挨打",nil,true)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].反震伤害,1)
					self.战斗单位[ljcs][self.战斗流程[1].攻击方]:开启击退(self.战斗流程[1].反震死亡,self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取移动坐标("返回"))
				end
			end
		end
		self.执行流程=6

	elseif self.执行流程==500 then
		 self.战斗单位[ljcs][self.战斗流程[1].攻击方]:设置掉血(self.战斗流程[1].伤害,1)
		 self.执行流程=501
	elseif self.执行流程==501 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态() then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		self:施法流程(502,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
	elseif self.执行流程==502 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 then
		for n=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].类型)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:换动作("挨打",nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
		end
		self.执行流程=503
 	elseif self.执行流程==503 then
		 local 条件通过=#self.战斗流程[1].挨打方
	 	for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取状态() then
				条件通过=条件通过-1
			end
		end
		if 条件通过<=0 then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].是否显示=false
			self.执行流程=6
		end
	elseif self.执行流程==900 then
		if self.战斗流程[1].id==引擎.场景.队伍[1].数字id or self.战斗流程[1].id==0 then
			引擎.场景.常规提示:打开(self.战斗流程[1].内容)
		end
		self.执行流程=6
	elseif self.执行流程==901 then
		if self.战斗流程[1].id==引擎.场景.队伍[1].数字id or self.战斗流程[1].id==0 then
			引擎.场景.窗口.消息框:添加文本(self.战斗流程[1].内容)
		end
		self.执行流程=6
	elseif self.执行流程==600 then
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]=战斗单位类()
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:创建单位(self.战斗流程[1].挨打方[1].数据,self.战斗流程[1].挨打方[1].队伍,self.战斗流程[1].挨打方[1].挨打方)
		self.执行流程=6
	elseif self.执行流程==601 then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].方向=self.战斗单位[ljcs][self.战斗流程[1].攻击方].逃跑方向
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("返回")
		if self.战斗流程[1].喊话 ~= nil then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].喊话:写入(self.战斗单位[ljcs][self.战斗流程[1].攻击方],self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画.动画,self.战斗流程[1].喊话)
		end
		self.战斗流程[1].等待计时=os.time()
		self.执行流程=602
	elseif self.执行流程==602 and os.time()-self.战斗流程[1].等待计时>=3 then
		if self.战斗流程[1].成功==false then
			local 临时音乐=引擎.取音效("逃跑失败")
			if 临时音乐~=nil and 临时音乐.文件~=nil then
				tp:游戏音效类(临时音乐.文件,临时音乐.资源)
			end
			self.执行流程=603
		else
			local 临时音乐=引擎.取音效("逃跑成功")
			if  临时音乐~=nil and 临时音乐.文件~=nil then
				tp:游戏音效类(临时音乐.文件,临时音乐.资源)
			end
			self.执行流程=605
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].逃跑开关=true
			if self.战斗流程[1].追加~=nil then
				self.战斗单位[ljcs][self.战斗流程[1].追加].方向=self.战斗单位[ljcs][self.战斗流程[1].追加].逃跑方向
				self.战斗单位[ljcs][self.战斗流程[1].追加]:换动作("返回")
				self.战斗单位[ljcs][self.战斗流程[1].追加].逃跑开关=true
		    end
		end
	elseif self.执行流程==603 then
		self.战斗流程[1].等待计时=os.time()
		self.战斗流程[1].初始方向=self.战斗单位[ljcs][self.战斗流程[1].攻击方].逃跑方向
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("待战")
		self.执行流程=604
	elseif self.执行流程==604 then
		self.战斗流程[1].初始方向=self.战斗流程[1].初始方向+1
		if self.战斗流程[1].初始方向>=4 then self.战斗流程[1].初始方向=0 end
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].方向=self.战斗流程[1].初始方向
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("待战")
		if os.time()-self.战斗流程[1].等待计时>=1 then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].方向=self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始方向
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("待战")
			self.执行流程=6
		end
	elseif self.执行流程==605 then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy.x=self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy.x+self.战斗单位[ljcs][self.战斗流程[1].攻击方].逃跑坐标
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy.y=self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy.y+self.战斗单位[ljcs][self.战斗流程[1].攻击方].逃跑坐标
		if self.战斗流程[1].追加==nil then
			if 取两点距离(生成XY(self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy.y),生成XY(self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始xy.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始xy.y))>=500 then
				self.执行流程=606
			end
		else
			self.战斗单位[ljcs][self.战斗流程[1].追加].显示xy.x=self.战斗单位[ljcs][self.战斗流程[1].追加].显示xy.x+self.战斗单位[ljcs][self.战斗流程[1].追加].逃跑坐标
			self.战斗单位[ljcs][self.战斗流程[1].追加].显示xy.y=self.战斗单位[ljcs][self.战斗流程[1].追加].显示xy.y+self.战斗单位[ljcs][self.战斗流程[1].追加].逃跑坐标
			if 取两点距离(生成XY(self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy.y),生成XY(self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始xy.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始xy.y))>=500 and 取两点距离(生成XY(self.战斗单位[ljcs][self.战斗流程[1].追加].显示xy.x,self.战斗单位[ljcs][self.战斗流程[1].追加].显示xy.y),生成XY(self.战斗单位[ljcs][self.战斗流程[1].追加].初始xy.x,self.战斗单位[ljcs][self.战斗流程[1].追加].初始xy.y))>=500 then
				self.执行流程=606
			end
		end
	 elseif self.执行流程==606 then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].是否显示=false
			if self.战斗流程[1].结束 and 引擎.场景.队伍[1].数字id==self.战斗流程[1].id then
				发送数据(5506)
				self.执行流程=999999
			else
				self.执行流程=6
			end

	elseif self.执行流程==607 then
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]=战斗单位类()
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:创建单位(self.战斗流程[1].挨打方[1].数据,self.战斗流程[1].挨打方[1].队伍,self.战斗流程[1].挨打方[1].挨打方)
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].是否显示=false
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		self:添加战斗提醒文字(self.战斗单位[ljcs][self.战斗流程[1].攻击方].名称.."使用了召唤")
		self.执行流程=608
	 elseif self.执行流程==608 then
		if self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].是否显示=true
			self.执行流程=609
			self.战斗流程[1].延时等待=os.time()
		end
	elseif self.执行流程==609 and os.time()-self.战斗流程[1].延时等待>=1 then
		self.执行流程=6
	elseif self.执行流程==614 then --无动作召唤
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]=战斗单位类()
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:创建单位(self.战斗流程[1].挨打方[1].数据,self.战斗流程[1].挨打方[1].队伍,self.战斗流程[1].挨打方[1].挨打方)
		self.执行流程=608
	elseif self.执行流程==610 then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].状态特效[self.战斗流程[1].状态]=nil
		self.执行流程=6
	elseif self.执行流程==611 then
		if #self.战斗流程[1].挨打方==0 then
			self.执行流程=6
		else
			self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
			self:施法流程(612,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,"飞镖",false)
		end
	 elseif self.执行流程==612 then
		local 结束=true
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取状态()==false then
				结束=false
			end
		end
		if 结束 then
		    self.执行流程=6
		end
	elseif self.执行流程==613 then
		if #self.战斗流程[1].挨打方==0 then
			self.执行流程=6
		else
			for n=1,#self.战斗流程[1].挨打方 do
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置溅射(self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy,self.战斗单位[ljcs][self.战斗流程[1].攻击方].初始方向,self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].死亡)
			end
			self.执行流程=612
		end
	elseif self.执行流程==620 then
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		for i=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[i].挨打方]=战斗单位类()
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[i].挨打方]:创建单位(self.战斗流程[1].挨打方[i].数据,self.战斗流程[1].挨打方[i].队伍,self.战斗流程[1].挨打方[i].挨打方)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[i].挨打方].是否显示=false
		end
		self.执行流程=621
	 elseif self.执行流程==621 then
		if self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
			for i=1,#self.战斗流程[1].挨打方 do
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[i].挨打方].是否显示=true
			end
			self.执行流程=622
			self.战斗流程[1].延时等待=os.time()
		end
	elseif self.执行流程==622 and os.time()-self.战斗流程[1].延时等待>=1 then
		self.执行流程=6

	elseif self.执行流程==623 then --单挑召唤流程
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		self.执行流程=624
	elseif self.执行流程==624 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]=战斗单位类()
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:创建单位(self.战斗流程[1].挨打方[1].数据,self.战斗流程[1].挨打方[1].队伍,self.战斗流程[1].挨打方[1].挨打方)
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效("召唤")
		self.执行流程=6
    ---地煞
    elseif self.执行流程==625 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
    	self.战斗单位[ljcs][self.战斗流程[1].攻击方].是否显示=false
    	self.执行流程=6
	--惊天动地
    elseif self.执行流程==400 and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态() and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取状态()  then
    	self.战斗单位[ljcs][self.战斗流程[1].攻击方]:施法前掉血(self.战斗流程[1].结尾气血)
    	self.执行流程=401
    	self.战斗流程[1].延时等待=os.time()
    elseif self.执行流程==401 and os.time()-self.战斗流程[1].延时等待>=2  then -- 攻击
    	self.战斗流程[1].延时等待=nil
		self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加攻击特效("惊天动地")
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关=true
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=440,-28--self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("挨打",self.战斗流程[1].攻击方)
        self.执行流程=402
    elseif self.执行流程==402 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关==false then
    	self.战斗单位[ljcs][self.战斗流程[1].攻击方].是否显示=false
    	self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关=true
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取移动坐标("挨打",self.战斗流程[1].攻击方)
    	self.执行流程=403
    	self.战斗流程[1].延时等待=os.time()
    elseif self.执行流程==403 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关==false and os.time()-self.战斗流程[1].延时等待>=1 then
    	self.战斗流程[1].延时等待=nil
    	self.战斗单位[ljcs][self.战斗流程[1].攻击方].是否显示=true
    	self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("攻击",true)
		if self.战斗流程[1].挨打方[1].死亡~=nil then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率("攻击",0.11)
		end
		self.执行流程=404
	elseif self.执行流程==404 then
		if self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取间隔() >= self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取中间()+self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击帧  then
			if self.战斗单位[ljcs][self.战斗流程[1].攻击方].武器子类 ~= nil and self.战斗单位[ljcs][self.战斗流程[1].攻击方].武器子类 == 14 and not self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].弓弩开关 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:设置弓弩(self.战斗单位[ljcs][self.战斗流程[1].攻击方].显示xy,self.战斗单位[self.战斗流程[1].攻击方].初始方向)
			end
			self.执行流程=405
		end
	elseif self.执行流程==405 then
		for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗流程[1].挨打方[n].挨打方==nil or self.战斗流程[1].挨打方[n].挨打方==0 or self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]==nil then
			   table.remove(self.战斗流程[1].挨打方.n)
			end
		end
		self.执行流程=406
	elseif self.执行流程==406 then
		for n=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].类型)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:换动作("挨打",nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
		end

		self.执行流程=407
    elseif self.执行流程==407 and ((self.战斗流程[1].挨打方[1]==nil or self.战斗流程[1].挨打方[1].挨打方==nil or self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]==nil) or self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态()) then
        self.战斗单位[ljcs][self.战斗流程[1].攻击方].返回开关=true
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回")
		local 条件通过=#self.战斗流程[1].挨打方
	 	for n=1,#self.战斗流程[1].挨打方 do
			if self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取状态() then
				条件通过=条件通过-1
			else
				条件通过=条件通过-1
			end
		end
		if 条件通过<=0 then
			self.执行流程=6
		end
	elseif self.执行流程==601.1 then --缩地尺/水遁/
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		self:施法流程(601.2,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].特效,false)
	elseif self.执行流程==601.2 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 then
		self.战斗流程[1].等待计时=os.time()
		self.执行流程=601.3
	elseif self.执行流程==601.3 and os.time()-self.战斗流程[1].等待计时>=2 then
		if self.战斗流程[1].成功 then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].是否显示=false
			if self.战斗流程[1].追加~=nil then
			    self.战斗单位[ljcs][self.战斗流程[1].追加].是否显示=false
			end
		end
		self.执行流程=601.4
	elseif self.执行流程==601.4 then
		if self.战斗流程[1].结束 and 引擎.场景.队伍[1].数字id==self.战斗流程[1].id then
			发送数据(5506)
			self.执行流程=999999
		else
			self.执行流程=6
		end
    --动物套变身
    elseif self.执行流程==707 then
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
        self:添加战斗提醒文字(self.战斗单位[ljcs][self.战斗流程[1].攻击方].名称.."触发了动物套效果")
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:添加法术特效("召唤")
        self.执行流程=708
    elseif self.执行流程==708 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:更改模型(self.战斗流程[1].参数,1)
        self.执行流程=6
    --动物套变身
    elseif self.执行流程==709 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then --八戒上身
    	self.战斗单位[ljcs][self.战斗流程[1].挨打方]:添加法术特效("召唤")
    	self.战斗单位[ljcs][self.战斗流程[1].挨打方]:更改模型(self.战斗流程[1].参数,1)
        self.执行流程=6
    elseif self.执行流程==710 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then --破变身
    	self.战斗单位[ljcs][self.战斗流程[1].挨打方]:更改模型(self.战斗流程[1].参数.模型,"角色",self.战斗流程[1].参数.染色方案,self.战斗流程[1].参数.染色组,self.战斗流程[1].参数.变异,self.战斗流程[1].参数.武器,nil,nil,nil,self.战斗流程[1].参数.炫彩,self.战斗流程[1].参数.炫彩组,nil,self.战斗流程[1].参数.名称)
    	self.执行流程=6
    elseif self.执行流程==711 then --破变身
    	self.战斗单位[ljcs][self.战斗流程[1].挨打方]:更改模型(self.战斗流程[1].参数.模型,self.战斗流程[1].参数.类型,self.战斗流程[1].参数.染色方案,self.战斗流程[1].参数.染色组,self.战斗流程[1].参数.变异,self.战斗流程[1].参数.武器,nil,nil,nil,self.战斗流程[1].参数.炫彩,self.战斗流程[1].参数.炫彩组,nil,self.战斗流程[1].参数.名称)
    	self.执行流程=6
    elseif self.执行流程==800 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then --连破
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
        self:添加战斗提醒文字(self.战斗单位[ljcs][self.战斗流程[1].攻击方].名称.."使用了连破")
        local 临时音乐=引擎.取音效("连破")
		if 临时音乐~=nil and 临时音乐.文件~=nil then
			tp:游戏音效类(临时音乐.文件,临时音乐.资源)
		end
        self:施法流程(801,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,"水清诀",false)
    elseif self.执行流程==801 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
        self.执行流程=6
    elseif self.执行流程==802 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then --披坚执锐
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
        self:添加战斗提醒文字(self.战斗单位[ljcs][self.战斗流程[1].攻击方].名称.."使用了披坚执锐")
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:添加披坚内容(self.战斗流程[1].技能)
        self:施法流程(801,self.战斗流程[1].攻击方,self.战斗流程[1].攻击方,"披坚执锐",false)
    elseif self.执行流程==902 then
        self:添加战斗提醒文字(self.战斗单位[ljcs][self.战斗流程[1].攻击方].名称.."触发了"..self.战斗流程[1].挨打方[1].增加状态)
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:添加法术特效(self.战斗流程[1].挨打方[1].增加状态)
        self.执行流程=903
    elseif self.执行流程==903 then --护盾 风灵 -- 无需动作添加
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:增加状态(self.战斗流程[1].挨打方[1].增加状态)
        self.执行流程=6
    elseif self.执行流程==905 then --风卷残云
    	self:添加战斗提醒文字(self.战斗单位[ljcs][self.战斗流程[1].攻击方].名称.."使用了风卷残云")
    	self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
    	self.执行流程=906
    elseif self.执行流程==906 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" and self.拼接特效==nil then
    	self:添加战斗提醒文字(self.战斗单位[ljcs][self.战斗流程[1].攻击方].名称.."使用了落叶萧萧")
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		local 临时音乐=引擎.取音效("落叶萧萧")
		if 临时音乐~=nil and 临时音乐.文件~=nil then
			tp:游戏音效类(临时音乐.文件,临时音乐.资源)
		end
	    self:施法流程(206.1,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,"落叶萧萧",true)
    elseif self.执行流程==907 then --施法挨打但不掉血  不拼接
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		self:施法流程(908,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
		if self.战斗流程[1].成功 then
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术抖动开关 = self.战斗流程[1].挨打方[1].特效[1]
		end
	elseif self.执行流程==908 and (#self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 or self.掉血流程==nil) then --and  self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"
		if self.战斗流程[1].成功 then
			for n=1,#self.战斗流程[1].挨打方 do
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:换动作("挨打",nil,true)
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
			end
		end
		self.执行流程=202
	elseif self.执行流程==909 and self.拼接特效==nil then --拼接 瘴气
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
	 	self:施法流程(910,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],true)
	elseif self.执行流程==910 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 and self.掉血流程==nil then --and  self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"
		for n=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:换动作("挨打",nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
		end
		self.执行流程=202
    elseif self.执行流程==911 then --琴音三叠
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
        self.执行流程=912
        self.战斗流程[1].延时等待=os.clock()
    elseif self.执行流程==912 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:添加法术特效(self.战斗流程[1].挨打方[1].特效[1])
        self.执行流程=912.1
    elseif self.执行流程==912.1 and os.clock()-self.战斗流程[1].延时等待>=0.7  then
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:换动作("挨打",nil,true)
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:设置掉血(self.战斗流程[1].挨打方[1].伤害,self.战斗流程[1].挨打方[1].类型)
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:开启击退(self.战斗流程[1].挨打方[1].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
        self.执行流程=913
        self.战斗流程[1].延时等待=os.clock()
    elseif self.执行流程==913  and os.clock()-self.战斗流程[1].延时等待>=0.2 then --and os.clock()-self.战斗流程[1].延时等待>=1
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[2].挨打方]:添加法术特效(self.战斗流程[1].挨打方[2].特效[1])
        self.执行流程=913.1
        self.战斗流程[1].延时等待=os.clock()
    elseif self.执行流程==913.1  and os.clock()-self.战斗流程[1].延时等待>=0.2 then
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[2].挨打方]:换动作("挨打",nil,true)
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[2].挨打方]:设置掉血(self.战斗流程[1].挨打方[2].伤害,self.战斗流程[1].挨打方[2].类型)
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[2].挨打方]:开启击退(self.战斗流程[1].挨打方[2].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
        self.执行流程=914
        self.战斗流程[1].延时等待=os.clock()
    elseif self.执行流程==914  and os.clock()-self.战斗流程[1].延时等待>=1  and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态() then
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[3].挨打方]:添加法术特效(self.战斗流程[1].挨打方[3].特效[1])
        self.执行流程=914.1
    elseif self.执行流程==914.1  and os.clock()-self.战斗流程[1].延时等待>=1.5 then
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[3].挨打方]:换动作("挨打",nil,true)
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[3].挨打方]:设置掉血(self.战斗流程[1].挨打方[3].伤害,self.战斗流程[1].挨打方[3].类型)
        self.战斗单位[ljcs][self.战斗流程[1].挨打方[3].挨打方]:开启击退(self.战斗流程[1].挨打方[3].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
        self.执行流程=202
    elseif self.执行流程==915 then --移形换影
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作("施法",true)
		self.战斗单位[ljcs][self.战斗流程[1].攻击方]:添加法术特效("五雷咒")
		self:施法流程(916,self.战斗流程[1].攻击方,self.战斗流程[1].挨打方,self.战斗流程[1].挨打方[1].特效[1],false)
    elseif self.执行流程==916 and #self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].法术特效==0 and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:取状态() then
    	self.执行流程=52
    elseif self.执行流程==917 then
    	self.清静菩提开关=true
    	self.战斗单位[ljcs][self.战斗流程[1].攻击方]:添加法术特效("清静菩提2")
    	self.战斗单位[ljcs][self.战斗流程[1].挨打方]:添加法术特效("清静菩提2")
    	self.执行流程=918
    elseif self.执行流程==918 then
    	if self.清静菩提开关==nil then
    	    self.执行流程=6
    	end
    elseif self.执行流程==919 then --鸣雷诀
        self.战斗单位[ljcs][self.战斗流程[1].挨打方]:添加法术特效("电刑")
        self.执行流程=6
	elseif self.执行流程 == 1000 then
	    self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关=true
	    local axx, ayy = math.floor(全局游戏宽度/2),math.floor(全局游戏高度/2)
	    self.战斗单位[ljcs][self.战斗流程[1].攻击方].坐标记录 = {x = axx , y = ayy}
	    self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=axx,ayy
		self.执行流程 = 1001
	elseif self.执行流程 == 1001 and not self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动开关 then
	    self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作('施法', true)
	    self.执行流程 = 1001.1
	elseif self.执行流程 == 1001.1 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取结束帧() - self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取当前帧() <= 10 then
	    for n=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].目标]:添加法术特效(self.战斗流程[1].特效)
		end
		self.执行流程 = 1002
	elseif self.执行流程 == 1002 and self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取结束帧() - self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取当前帧() <= 5 then
		for n=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].目标].法术抖动开关 = true
			if self.战斗流程[1].挨打方[n].浮空目标 then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].浮空目标]:浮空处理()
			end
		end
		self.执行流程 = 1003
	elseif self.执行流程 == 1003 then-- and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战"
		战斗连击单位 = self.战斗流程[1].攻击方
	    for n=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].目标]:设置掉血(self.战斗流程[1].挨打方[n].伤害,self.战斗流程[1].挨打方[n].伤害类型)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].目标]:抖动挨打音效()
            self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].目标]:开启击退(self.战斗流程[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
			if 战斗连击显示[self.战斗流程[1].攻击方] == nil then
				战斗连击显示[self.战斗流程[1].攻击方] = 0
			end
			战斗连击显示[self.战斗流程[1].攻击方] = 战斗连击显示[self.战斗流程[1].攻击方] + 1
		end
		self.执行流程 = 1004
	elseif self.执行流程 == 1004 then
		local 条件通过=#self.战斗流程[1].挨打方
        for n=1,#self.战斗流程[1].挨打方 do
            if self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].目标]:取状态() then
                条件通过=条件通过-1
            else
                条件通过=条件通过-1
            end
        end
        if 条件通过<=0 then
            if self.战斗流程[1].返回 then
            	self.战斗单位[ljcs][self.战斗流程[1].攻击方].返回开关=true
                self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.x,self.战斗单位[ljcs][self.战斗流程[1].攻击方].移动坐标.y=self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回")
            	self.执行流程=5
            else
                self.执行流程=6
            end
        end
	elseif self.执行流程 == 1005 then
	    if self.战斗流程[1].重复次数 == 1 then
		    self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作('施法', true)
		end
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].行动对象 = self.战斗流程[1].攻击方 + 0
		战斗连击单位 = self.战斗流程[1].攻击方
	    self.执行流程 = 1006
	elseif self.执行流程 == 1006 and (self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取间隔() >= self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取中间()+self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击帧 or self.战斗流程[1].重复次数 ~= 1) then
	    self.战斗单位[ljcs][self.战斗流程[1].攻击方].临时隐藏 = true
	    if self.战斗单位[ljcs][self.战斗流程[1].攻击方].多重攻击 == nil then
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].多重攻击 = {}
		end
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].多重攻击列表 = {}
        for i = 1, #self.战斗流程[1].挨打方 do
			if self.战斗单位[ljcs][self.战斗流程[1].攻击方].多重攻击[self.战斗流程[1].挨打方[i].挨打方] == nil then
				local axx, ayy = self:取攻击位置(self.战斗流程[1].攻击方, self.战斗流程[1].挨打方[i].挨打方, 1)
				self.战斗单位[ljcs][self.战斗流程[1].攻击方].多重攻击[self.战斗流程[1].挨打方[i].挨打方] = { x = axx, y = ayy }
            end
            self.战斗单位[ljcs][self.战斗流程[1].攻击方].多重攻击列表[self.战斗流程[1].挨打方[i].挨打方] = 1
        end
        多重战斗开关 = { 攻击方 = self.战斗流程[1].攻击方 + 0, 挨打方 = DeepCopy(self.战斗单位[ljcs][self.战斗流程[1].攻击方].多重攻击列表) }
		self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:临时染色({ 3447, 15, 5 }, self.战斗流程[1].攻击方)
		local yjl = ''
		if self.战斗流程[1].重复次数 ~= nil then
            yjl = self:取九黎攻击动作(self.战斗流程[1].攻击方)
            if self.战斗流程[1].重复次数[1] == self.战斗流程[1].重复次数[2] then
            	if self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画.动画.连击3 then
            	    yjl = "连击3"
            	end
            end
        end
        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:换动作(yjl, true)

        self.战斗单位[ljcs][self.战斗流程[1].攻击方]:浮空处理1()
        self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:置帧率(yjl,0.06)
        self.执行流程 = 1007
	elseif self.执行流程 == 1007 then
	 --    if self.战斗单位[ljcs][self.战斗流程[1].攻击方].战鼓 ~= nil and self.战斗流程[1].挨打方[1].特效[1] ~= nil and 九黎城攻击技能[self.战斗流程[1].挨打方[1].特效[1]] ~= nil then
		-- 	战斗连击单位 = self.战斗流程[1].攻击方
		-- 	if 战斗连击显示[self.战斗流程[1].攻击方] == nil then
		-- 		战斗连击显示[self.战斗流程[1].攻击方] = 0
		-- 	end
		-- 	战斗连击显示[self.战斗流程[1].攻击方] = 战斗连击显示[self.战斗流程[1].攻击方] + 1
		-- else
		-- 	战斗连击单位 = 0
		-- end
		for i=1,#self.战斗流程[1].挨打方 do
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[i].挨打方]:换动作(self.战斗流程[1].挨打方[i].动作,nil,true)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[i].挨打方]:开启击退(self.战斗流程[1].挨打方[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].攻击方]:取移动坐标("返回"))
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[i].挨打方]:设置掉血(self.战斗流程[1].挨打方[i].伤害,self.战斗流程[1].挨打方[i].伤害类型)
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[i].挨打方]:添加攻击特效('力辟苍穹'..math.random(1, 2))
			if 战斗连击显示[self.战斗流程[1].攻击方] == nil then
				战斗连击显示[self.战斗流程[1].攻击方] = 0
			end
			战斗连击显示[self.战斗流程[1].攻击方] = 战斗连击显示[self.战斗流程[1].攻击方] + 1
		end
		self.执行流程 = 1008
	elseif self.执行流程 == 1008 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].动作=="待战" then
        if self.战斗流程[1].重复次数[1] == self.战斗流程[1].重复次数[2] then
        	if 多重战斗开关 ~= false then
	            多重战斗开关 = false
	        end
            local zs = self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:取结束帧(yjl)
	        for n = 1, #self.战斗流程[1].挨打方 do
	            self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取消浮空(-zs - 10)
	            self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:添加攻击特效('力辟苍穹_落')
	        end
	        if self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击对象 ~= nil then
	            self.战斗单位[ljcs][self.战斗流程[1].攻击方].攻击对象 = nil
	        end
	        if self.战斗单位[ljcs][self.战斗流程[1].攻击方].行动对象 ~= nil then
				self.战斗单位[ljcs][self.战斗流程[1].攻击方].行动对象 = nil
			end
			self.战斗流程[1].还原频率 = true
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].动画:还原染色()
			self.战斗单位[ljcs][self.战斗流程[1].攻击方].临时隐藏 = nil
        end
        self.执行流程 = 6
	elseif self.执行流程 == 1024 then

	    for n = 1, #self.战斗流程[1].挨打方 do
			if self.战斗流程[1].挨打方[n].浮空 ~= nil then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:浮空处理()
			end
			if self.战斗流程[1].挨打方[n].取消浮空 ~= nil then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[n].挨打方]:取消浮空()
			end
		end
		self.执行流程 = 6
	end
end
function 战斗类:取攻击位置(编号, 目标, 不计算浮空高度)
	local 攻击方 = self.战斗单位[ljcs][编号]
	local 挨打方 = self.战斗单位[ljcs][目标]
	local 临时模型 = 攻击方.模型

	if 攻击方.变身数据 ~= nil then
		临时模型 = 攻击方.变身数据
	end

	local Position = 挨打方.数据.位置
	local x, y = self:攻击坐标调整(临时模型, 攻击方.武器子类)
	local offset = 生成XY(x, y)
	local AttackPos = 两点算近战攻击坐标(挨打方.显示xy, 攻击方.初始xy, offset)

	return AttackPos.x, AttackPos.y
end
function 战斗类:攻击坐标调整(模型, zl)
	if 模型 == "蛤蟆精" then
		return 30, 15
	elseif 模型 == "兔子怪" or 模型 == "进阶蝴蝶仙子" or 模型 == "风伯" or 模型 == "镜妖" or 模型 == "进阶芙蓉仙子" or 模型 == "净瓶女娲" or 模型 == "进阶画魂" then
		return 40, 20
	elseif 模型 == "巨蛙" or 模型 == "强盗" or 模型 == "狸" or 模型 == "进阶凤凰" or 模型 == "进阶鲛人" or 模型 == "进阶蛟龙" or 模型 == "鼠先锋" or 模型 == "阴阳伞" or 模型 == "机关鸟" or 模型 == "机关人" or 模型 == "进阶律法女娲" or 模型 == "进阶吸血鬼" or 模型 == "进阶龙龟" or 模型 == "蝎子精" or 模型 == "进阶狂豹人形" or 模型 == "进阶蝎子精" or 模型 == "进阶曼珠沙华" or 模型 == "进阶金身罗汉" or 模型 == "大大王" or 模型 == "杀破狼" and zl == 15 or 模型 == "玄彩娥" and zl == 5 or 模型 == "英女侠" and zl == 10 or 模型 == "骨精灵" and zl == 8 or 模型 == "狐美人" and zl == 10 or 模型 == "鬼潇潇" and zl == 6 or 模型 == "桃夭夭" and zl == 18 then
		return 60, 30
	elseif 模型 == "野猪" or 模型 == "大海龟" or 模型 == "树怪" or 模型 == "赌徒" or 模型 == "大蝙蝠" or 模型 == "护卫" or 模型 == "章鱼" or 模型 == "骷髅怪" or 模型 == "狐狸精" or 模型 == "老虎" or 模型 == "野鬼" or 模型 == "蜘蛛精" or 模型 == "黑熊精" or 模型 == "龟丞相" or 模型 == "马面" or 模型 == "黑山老妖" or 模型 == "进阶古代瑞兽" or 模型 == "进阶雷鸟人" or 模型 == "碧水夜叉" or 模型 == "进阶天将" or 模型 == "进阶地狱战神" or 模型 == "进阶风伯" or 模型 == "如意仙子" or 模型 == "犀牛将军人形" or 模型 == "犀牛将军兽形" or 模型 == "进阶锦毛貂精" or 模型 == "进阶犀牛将军兽形" or 模型 == "进阶野猪精" or 模型 == "画魂" or 模型 == "吸血鬼" or 模型 == "踏云兽" or 模型 == "葫芦宝贝" or 模型 == "幽萤娃娃" or 模型 == "灵鹤" or 模型 == "机关兽" or 模型 == "进阶灵符女娲" or 模型 == "进阶踏云兽" or 模型 == "进阶灵鹤" or 模型 == "进阶机关鸟" or 模型 == "进阶葫芦宝贝" or 模型 == "进阶机关兽" or 模型 == "猫灵兽形" or 模型 == "狂豹人形" or 模型 == "黑白狂豹人形" or 模型 == "进阶黑白狂豹人形" or 模型 == "狂豹兽形" or 模型 == "蜃气妖" or 模型 == "曼珠沙华" or 模型 == "修罗傀儡鬼" or 模型 == "修罗傀儡妖" or 模型 == "毗舍童子" or 模型 == "暗黑毗舍童子" or 模型 == "进阶暗黑毗舍童子" or 模型 == "进阶混沌兽" or 模型 == "进阶长眉灵猴" or 模型 == "进阶巨力神猿" or 模型 == "进阶藤蔓妖花" or 模型 == "进阶修罗傀儡妖" or 模型 == "进阶般若天女" or 模型 == "超级麒麟" or 模型 == "超级白泽" or 模型 == "超级灵鹿" or 模型 == "超级大象" or 模型 == "超级神虎" or 模型 == "超级海豚" or 模型 == "超级人参娃娃" or 模型 == "超级腾蛇" or 模型 == "超级土地公公" or 模型 == "超级六耳猕猴" or 模型 == "镇元大仙" or 模型 == "地涌夫人" or 模型 == "空度禅师" or 模型 == "牛魔王" or 模型 == "神天兵" and zl == 9 or 模型 == "偃无师" and zl == 16 or 模型 == "偃无师" and zl == 3 or 模型 == "舞天姬" and zl == 5 or 模型 == "舞天姬" and zl == 11 or 模型 == "玄彩娥" and zl == 5 or 模型 == "英女侠" and zl == 4 or 模型 == "飞燕女" and zl == 11 or 模型 == "狐美人" and zl == 6 or 模型 == "桃夭夭" and zl == 5 or 模型 == "龙马" then
		return 70, 35
	elseif 模型 == "山贼" or 模型 == "羊头怪" or 模型 == "狼" or 模型 == "蟹将" or 模型 == "雷鸟人" or 模型 == "天兵" or 模型 == "地狱战神" or 模型 == "凤凰" or 模型 == "进阶天兵" or 模型 == "进阶碧水夜叉" or 模型 == "星灵仙子" or 模型 == "进阶巡游天神" or 模型 == "进阶百足将军" or 模型 == "琴仙" or 模型 == "金铙僧" or 模型 == "进阶炎魔神" or 模型 == "进阶大力金刚" or 模型 == "进阶机关人" or 模型 == "进阶夜罗刹" or 模型 == "进阶琴仙" or 模型 == "长眉灵猴" or 模型 == "持国巡守" or 模型 == "进阶蜃气妖" or 模型 == "进阶持国巡守" or 模型 == "进阶灵灯侍者" or 模型 == "超级孔雀" or 模型 == "超级灵狐" or 模型 == "超级青鸾" or 模型 == "超级神鸡" or 模型 == "超级神蛇" or 模型 == "东海龙王" or 模型 == "逍遥生" and zl == 3 or 模型 == "龙太子" and zl == 1 or 模型 == "巨魔王" and zl == 2 or 模型 == "巨魔王" and zl == 12 or 模型 == "虎头怪" and zl == 9 or 模型 == "虎头怪" and zl == 2 or 模型 == "飞燕女" and zl == 4 or 模型 == "骨精灵" and zl == 6 or 模型 == "超级飞廉" or 模型 == "进阶超级飞廉" then
		return 80, 40
	elseif 模型 == "古代瑞兽" or 模型 == "蝴蝶仙子" or 模型 == "芙蓉仙子" or 模型 == "百足将军" or 模型 == "进阶阴阳伞" or 模型 == "炎魔神" or 模型 == "龙龟" or 模型 == "鬼将" or 模型 == "进阶巴蛇" or 模型 == "进阶噬天虎" or 模型 == "进阶连弩车" or 模型 == "进阶金铙僧" or 模型 == "巨力神猿" or 模型 == "金身罗汉" or 模型 == "真陀护法" or 模型 == "增长巡守" or 模型 == "灵灯侍者" or 模型 == "般若天女" or 模型 == "进阶狂豹兽形" or 模型 == "进阶修罗傀儡鬼" or 模型 == "进阶增长巡守" or 模型 == "超级神龙" or 模型 == "超级赤焰兽" or 模型 == "超级大熊猫" or 模型 == "超级泡泡" or 模型 == "超级神牛" or 模型 == "超级小白龙" or 模型 == "超级玉兔" or 模型 == "超级神马" or 模型 == "超级筋斗云" or 模型 == "超级神猪" then
		return 90, 45
	elseif 模型 == "进阶犀牛将军人形" or 模型 == "进阶真陀护法" or 模型 == "超级神猴" or 模型 == "超级神羊" or 模型 == "巫奎虎" or 模型 == "剑侠客" and zl == 3 or 模型 == "剑侠客" and zl == 12 or 模型 == "神天兵" and zl == 1 then
		return 100, 50
	elseif 模型 == "牛妖" or 模型 == "巡游天神" or 模型 == "飞天" then
		return 110, 55
	elseif 模型 == "大力金刚" or 模型 == "连弩车" or 模型 == "二郎神" then
		return 130, 65
	elseif 模型 == "进阶蚩尤" or 模型 == "沙僧" then
		return 140, 70
	elseif 模型 == "超级神鼠" then
		return 200, 100
	elseif 模型 == "恶魔泡泡" or 模型 == "恶魔泡泡(哭泣)" or 模型 == "恶魔泡泡(困惑)" or 模型 == "恶魔泡泡(奸笑)" or 模型 == "恶魔泡泡(白眼)" then
		return 90, 47
	elseif 模型 == "影精灵" or 模型 == "魔化吕布" then
		return 80, 40
	elseif 模型 == "进阶毗舍童子" then
		return 60, 40
	end

	return 50, 25
end
function 战斗类:加载生成怪物(sj)
	for i=1,#sj do
		self.战斗单位[ljcs][sj[i].挨打方]=战斗单位类()
		self.战斗单位[ljcs][sj[i].挨打方]:创建单位(sj[i].数据,sj[i].队伍,sj[i].挨打方)
		self.战斗单位[ljcs][sj[i].挨打方].是否显示=true
	end
end

function 战斗类:流程更新二段()
	if self.战斗流程[1].附加施法 ~= nil and self.战斗流程[1].附加施法.完成 == nil and self.战斗流程[1].附加施法[1] then
		if self.战斗流程[1].附加施法[1].进度 == nil then
			self.战斗流程[1].附加施法[1].进度 =1
		end
		if self.战斗流程[1].附加施法[1].进度 ==1 then
			self.战斗单位[ljcs][self.战斗流程[1].附加施法[1].攻击方]:换动作("施法",true)
			self.战斗流程[1].附加施法[1].进度 =1.1
			self.erjsq=os.time()
		elseif self.战斗流程[1].附加施法[1].进度 ==1.1 and os.time()-self.erjsq>=1 then
			for n=1,#self.战斗流程[1].附加施法[1].挨打方 do
				self.战斗单位[ljcs][self.战斗流程[1].附加施法[1].挨打方[n].挨打方]:添加法术特效(self.战斗流程[1].附加施法[1].挨打方[n].特效[1])
			end
			self.战斗流程[1].附加施法[1].进度 =2
		elseif self.战斗流程[1].附加施法[1].进度 ==2 and #self.战斗单位[ljcs][self.战斗流程[1].附加施法[1].挨打方[1].挨打方].法术特效==0 then
			for n=1,#self.战斗流程[1].附加施法[1].挨打方 do
				if self.战斗流程[1].附加施法[1].挨打方[n].类型 == 2 then
					self.战斗单位[ljcs][self.战斗流程[1].附加施法[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].附加施法[1].挨打方[n].伤害,self.战斗流程[1].附加施法[1].挨打方[n].类型)
				elseif self.战斗流程[1].附加施法[1].挨打方[n].类型==1 or self.战斗流程[1].附加施法[1].挨打方[n].类型==3 or self.战斗流程[1].附加施法[1].挨打方[n].类型==3.5 then
				 	self.战斗单位[ljcs][self.战斗流程[1].附加施法[1].挨打方[n].挨打方]:设置掉血(self.战斗流程[1].附加施法[1].挨打方[n].伤害,self.战斗流程[1].附加施法[1].挨打方[n].类型)
					self.战斗单位[ljcs][self.战斗流程[1].附加施法[1].挨打方[n].挨打方]:开启击退(self.战斗流程[1].附加施法[1].挨打方[n].死亡,self.战斗单位[ljcs][self.战斗流程[1].附加施法[1].攻击方]:取移动坐标("返回"))
				end
			end
			self.战斗流程[1].附加施法[1].完成 = true
		end
	else
    	if self.战斗流程[1].附加施法 == nil then
    		self.战斗流程[1].附加施法={}
    	end
	end
	if self.战斗流程[1].附加施法[1]  then
		if self.战斗流程[1].附加施法[1].完成 then
			table.remove(self.战斗流程[1].附加施法,1)
		end
	else
		self.战斗流程[1].附加施法.完成 = true
	end
	if not self.战斗流程[1].附加施法.完成 then  return  end
	if self.战斗流程[1].溅射 ~= nil and  self.战斗流程[1].溅射.完成== nil then
		for i=1,#self.战斗流程[1].溅射 do
			if self.战斗单位[ljcs][self.战斗流程[1].溅射[i].挨打方] ~= nil then
				self.战斗单位[ljcs][self.战斗流程[1].溅射[i].挨打方]:设置掉血(self.战斗流程[1].溅射[i].伤害,1)
				self.战斗单位[ljcs][self.战斗流程[1].溅射[i].挨打方]:开启击退(self.战斗流程[1].溅射[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].溅射[i].攻击方]:取移动坐标("返回"))
			end
		end
		self.战斗流程[1].溅射.完成 = true
	end
	if self.战斗流程[1].无动作掉血 ~= nil and  self.战斗流程[1].无动作掉血.完成== nil then
		for i=1,#self.战斗流程[1].无动作掉血 do
			if self.战斗单位[ljcs][self.战斗流程[1].无动作掉血[i].挨打方] ~= nil then
				self.战斗单位[ljcs][self.战斗流程[1].无动作掉血[i].挨打方]:设置掉血(self.战斗流程[1].无动作掉血[i].伤害,1)
				if self.战斗流程[1].无动作掉血[i].死亡 then
					self.战斗单位[ljcs][self.战斗流程[1].无动作掉血[i].挨打方]:死亡处理1(self.战斗流程[1].无动作掉血[i].死亡,self.战斗单位[ljcs][self.战斗流程[1].无动作掉血[i].攻击方]:取移动坐标("返回"))
				end
			end
		end
		self.战斗流程[1].无动作掉血.完成 = true
	end
	---一次性处理完
	if self.战斗流程[1].无间地狱 then
	    self.无间地狱开关=true
	end
	if self.战斗流程[1].媚眼如丝 then
	    self.媚眼如丝开关=true
	end
	----------------------------超级技能2.18 超级强力
	if self.战斗流程[1] and type(self.战斗流程[1])=="table" and self.战斗流程[1].挨打方 and type(self.战斗流程[1].挨打方)=="table" then
		if self.战斗流程[1].挨打方[1] and self.战斗流程[1].挨打方[1].挨打方 and self.战斗单位[ljcs] and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方] and self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].转圈方向 then
			if self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].转圈开关==true then
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:关闭转圈()
				self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].动画:置方向(self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方].转圈方向,"待战")
			end
		end
	end
	----------------------------
 	if self.战斗流程[1].状态处理添加 ~= nil and self.战斗流程[1].状态处理添加.完成 == nil then
		for i=1,#self.战斗流程[1].状态处理添加 do
			if self.战斗单位[ljcs][self.战斗流程[1].状态处理添加[i].编号].状态特效[self.战斗流程[1].状态处理添加[i].名称] == nil then
				self.战斗单位[ljcs][self.战斗流程[1].状态处理添加[i].编号]:增加状态(self.战斗流程[1].状态处理添加[i].名称,self.战斗流程[1].状态处理添加[i].回合,self.战斗流程[1].状态处理添加[i].层数,self.战斗流程[1].状态处理添加[i].颜色,self.战斗流程[1].状态处理添加[i].负面状态)
			else
				self.战斗单位[ljcs][self.战斗流程[1].状态处理添加[i].编号].状态特效[self.战斗流程[1].状态处理添加[i].名称].回合 = self.战斗流程[1].状态处理添加[i].回合
			end
		end
		self.战斗流程[1].状态处理添加.完成 = true
	end
	if self.战斗流程[1].状态处理取消 ~= nil and self.战斗流程[1].状态处理取消.完成 == nil  then
		for i=1,#self.战斗流程[1].状态处理取消 do
			if self.战斗单位[ljcs][self.战斗流程[1].状态处理取消[i].编号].状态特效[self.战斗流程[1].状态处理取消[i].名称] ~= nil then
				self.战斗单位[ljcs][self.战斗流程[1].状态处理取消[i].编号].状态特效[self.战斗流程[1].状态处理取消[i].名称]=nil
			end
		end
		self.战斗流程[1].状态处理取消.完成 = true
	end

	if self.战斗流程[1].回复气血 ~= nil and self.战斗流程[1].回复气血.完成 == nil then
		for i=1,#self.战斗流程[1].回复气血 do
			self.战斗单位[ljcs][self.战斗流程[1].回复气血[i].挨打方]:设置掉血(self.战斗流程[1].回复气血[i].气血,2)
		end
		self.战斗流程[1].回复气血.完成 = true
	end
	if self.战斗流程[1].同步气血 ~= nil and self.战斗流程[1].同步气血.完成 == nil then
		for i=1,#self.战斗流程[1].同步气血 do
			self.战斗单位[ljcs][self.战斗流程[1].同步气血[i].挨打方]:同步气血(self.战斗流程[1].同步气血[i].气血,self.战斗流程[1].同步气血[i].气血上限)--,self.战斗流程[1].同步气血[i].气血上限
		end
		self.战斗流程[1].同步气血.完成 = true
	end
	if self.战斗流程[1].减少魔法 ~= nil and self.战斗流程[1].减少魔法.完成 == nil then
		for i=1,#self.战斗流程[1].减少魔法 do
			self.战斗单位[ljcs][self.战斗流程[1].减少魔法[i].挨打方]:魔法更新(self.战斗流程[1].减少魔法[i].魔法)
		end
		self.战斗流程[1].减少魔法.完成 = true
	end
	if not self.战斗流程[1].附加施法.完成 then  return  end
	for n=1,#self.战斗单位[ljcs] do
		if self.战斗单位[ljcs][n]:取状态()==false then return  end
		if #self.战斗流程==1 and self.战斗单位[ljcs][n]:取状态()==false then return  end
	end
	if self.战斗流程[1].添加护盾 ~= nil and self.战斗流程[1].添加护盾.完成 == nil then
		for i=1,#self.战斗流程[1].添加护盾 do
			self.战斗单位[ljcs][self.战斗流程[1].添加护盾[i].挨打方]:护盾更新(self.战斗流程[1].添加护盾[i].护盾)
		end
		self.战斗流程[1].添加护盾.完成 = true
	end
	if self.战斗流程[1].魔法更新~= nil then self.战斗单位[ljcs][self.战斗流程[1].攻击方]:魔法更新(self.战斗流程[1].魔法更新) end
	if self.战斗流程[1].愤怒更新~= nil then self.战斗单位[ljcs][self.战斗流程[1].攻击方]:愤怒更新(self.战斗流程[1].愤怒更新) end
	if self.战斗流程[1].战意更新~= nil then self.战斗单位[ljcs][self.战斗流程[1].攻击方]:战意更新(self.战斗流程[1].战意更新) end
	if self.战斗流程[1].超级战意更新~= nil then self.战斗单位[ljcs][self.战斗流程[1].攻击方]:超级战意更新(self.战斗流程[1].超级战意更新) end
	if self.战斗流程[1].骤雨更新~= nil then self.战斗单位[ljcs][self.战斗流程[1].攻击方]:骤雨更新(self.战斗流程[1].骤雨更新) end
	if self.战斗流程[1].五行珠更新~= nil then self.战斗单位[ljcs][self.战斗流程[1].攻击方]:五行珠更新(self.战斗流程[1].五行珠更新) end
	if self.战斗流程[1].人参果更新~= nil then self.战斗单位[ljcs][self.战斗流程[1].攻击方]:人参果更新(self.战斗流程[1].人参果更新) end --这里好像不操作就不会更新
	if self.战斗流程[1].结尾死亡 then
	   self.战斗单位[ljcs][self.战斗流程[1].攻击方]:死亡处理1(self.战斗流程[1].结尾死亡)
	end
	table.remove(self.战斗流程,1)
	collectgarbage("step")
	self.执行流程=0
	self.进程="计算"

	if #self.战斗流程==0 then
		self.拼接特效=nil
		self.背景状态=nil
		for i=1,#self.战斗单位[ljcs] do
			self.战斗单位[ljcs][i]:回合结束重置()
		end
		self.进程="等待"
		if 引擎.场景.观战中 == false then
			local  saddwrezd = 取随机数(999,9999)
			local  jmyzzd=取MD5(md66666..saddwrezd)
			发送数据(5503.9)
		end
	end
end
local qxbx={}
qxbx["金刚护法"]=1
qxbx["分身术"]=1
qxbx["修罗隐身"]=1
qxbx["楚楚可怜"]=1
function 战斗类:结束流程(内容)
	for i=1,#内容 do
		for k,v in pairs(内容[i]) do
			if 内容[i].挨打方 ~= nil and self.战斗单位[ljcs][内容[i].挨打方] ~= nil then
				if k == "取消状态" then
					for s=1,#内容[i].取消状态 do
						self.战斗单位[ljcs][内容[i].挨打方].状态特效[内容[i].取消状态[s]]=nil
						if qxbx[内容[i].取消状态[s]] then
							self.战斗单位[ljcs][内容[i].挨打方]:取消变相()
						end
					end
				elseif k == "复活" then
					self.战斗单位[ljcs][内容[i].挨打方].停止更新=false
					self.战斗单位[ljcs][内容[i].挨打方]:换动作("待战")
					self.战斗单位[ljcs][内容[i].挨打方]:设置掉血(内容[i].复活.气血,2)
				elseif k == "法术状态" then
					for z,x in pairs(内容[i].法术状态) do
						if self.战斗单位[ljcs][内容[i].挨打方].状态特效[z] == nil then
							self.战斗单位[ljcs][内容[i].挨打方]:增加状态(z)
							self.战斗单位[ljcs][内容[i].挨打方].状态特效[z].回合 = 内容[i].法术状态[z].回合
						else
						    self.战斗单位[ljcs][内容[i].挨打方].状态特效[z].回合 = 内容[i].法术状态[z].回合
						end
						if 内容[i].法术状态[z].层数~=nil then
						    self.战斗单位[ljcs][内容[i].挨打方].状态特效[z].层数=内容[i].法术状态[z].层数
						end
					end
				elseif k == "人物状态" then
					self.战斗单位[ljcs][内容[i].挨打方]:结束同步(内容[i].人物状态.气血,内容[i].人物状态.最大气血,内容[i].人物状态.气血上限,内容[i].人物状态.魔法,内容[i].人物状态.最大魔法,内容[i].人物状态.愤怒,内容[i].人物状态.护盾,内容[i].人物状态.战意,内容[i].人物状态.五行珠,内容[i].人物状态.人参果,内容[i].人物状态.骤雨,内容[i].人物状态.超级战意)
				elseif k == "结尾回血" then
					self.战斗单位[ljcs][内容[i].挨打方]:设置掉血(内容[i].结尾回血.气血,2)
				elseif k == "共生" then
					self.战斗单位[ljcs][内容[i].挨打方].共生=true
				elseif k == "丸子附加" then
					self.战斗单位[ljcs][内容[i].挨打方].超级偷袭 = v.超级偷袭
				end
			end
		end
	end
	for i=1,#self.特殊状态 do --这里加结束流程 特殊状态加在这？
		if self.特殊状态[i] ~= nil then
			if self.特殊状态[i].回合 == 0 then
				self:特殊状态处理(self.特殊状态[i].名称,2)
				self.特殊状态[i] = nil
				table.remove(self.特殊状态,i)
			else
				self.特殊状态[i].回合 = self.特殊状态[i].回合 -1
			end
		end
	end
end

function 战斗类:置全屏技能(jnm,单位)
	if self.战斗单位[ljcs][self.施法信息.攻击方].招式特效 and self.战斗单位[ljcs][self.施法信息.攻击方].招式特效[jnm] then
		jnm = "新_"..jnm
	end
	if jnm=="秘传飞砂走石" then
	    jnm = "飞砂走石2"
	end
	local qp = nil
	self.全屏加速=1.8
	self.掉血流程=0

	if jnm == "新_龙吟" then
		self.全屏加速=1
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("新_龙吟")
		self.拼接特效[#self.拼接特效].偏移 = {x=-75,y=-47}
		qp = true
	elseif jnm == "新_破釜沉舟" then
		self.全屏加速=1
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("新_破釜沉舟")
		self.拼接特效[#self.拼接特效].偏移 = {x=-96,y=-34}
		qp = true
	elseif jnm == "破釜沉舟" then
		self.全屏加速=1
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("破釜沉舟")
		self.拼接特效[#self.拼接特效].偏移 = {x=-109,y=-53}
		qp = true
	elseif jnm == "新_推气过宫" then
		self.全屏加速=2.5
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("新_推气过宫")
		self.拼接特效[#self.拼接特效].偏移 = {x=-40,y=50}
		qp = true
	elseif jnm == "新_雷霆万钧" or jnm == "侵蚀·雷霆万钧·噬魂" or jnm == "侵蚀·雷霆万钧·钻心" or jnm == "侵蚀·雷霆万钧·刻骨"  then
		self.全屏加速=1.2
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("新_雷霆万钧")
		self.拼接特效[#self.拼接特效].偏移 = {x=-73,y=-60}
		qp = true
	elseif jnm == "新_落叶萧萧" then
		self.全屏加速=1
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("新_落叶萧萧")
		self.拼接特效[#self.拼接特效].偏移 = {x=5,y=-25}
		qp = true
	elseif jnm == "新_翻江搅海" then
		self.全屏加速=2.5
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("新_翻江搅海")
		self.拼接特效[#self.拼接特效].偏移 = {x=-62,y=26}
		qp = true
	elseif jnm == "神针撼海" then
		self.全屏加速=3
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("神针撼海")
		self.拼接特效[#self.拼接特效].偏移 = {x=-55+50,y=15-58}
		qp = true

	elseif jnm == "雨落寒沙" then
		self.拼接特效 = {}
		if 单位.敌我==1 then
			self.拼接特效[1] = {}
			self.拼接特效[1].特效 = 单位:加载特效("雨落寒沙_我方")
			self.拼接特效[1].偏移 = {x=-10,y=-41}
		else
			self.拼接特效[1] = {}
			self.拼接特效[1].特效 = 单位:加载特效("雨落寒沙_敌方")
			self.拼接特效[1].偏移 = {x=-60,y=27}
		end
		self.全屏加速=1.2
		qp = true
	elseif jnm == "瘴气" then
		self.拼接特效 = {}
		if 单位.敌我==1 then
			self.拼接特效[1] = {}
			self.拼接特效[1].特效 = 单位:加载特效("瘴气")
			self.拼接特效[1].偏移 = {x=-50,y=-20}
		else
			self.拼接特效[1] = {}
			self.拼接特效[1].特效 = 单位:加载特效("瘴气")
			self.拼接特效[1].偏移 = {x=-80,y=20}
		end
		self.全屏加速=2
		qp = true
	elseif jnm == "龙卷雨击" or jnm == "侵蚀·龙卷雨击·刻骨" or jnm == "侵蚀·龙卷雨击·钻心" or jnm == "侵蚀·龙卷雨击·噬魂"then
		self.拼接特效 = {}
		for s=1,4 do
			self.拼接特效[s] = {}
			self.拼接特效[s].特效 = 单位:加载特效("龙卷雨击"..s)
			self.拼接特效[s].偏移 = {x=0,y=0}
			if s == 1 then
				self.拼接特效[s].偏移 = {x=-30,y=-110}
			elseif s == 2 then
				self.拼接特效[s].偏移 = {x=100,y=-50}
			elseif s == 3 then
				self.拼接特效[s].偏移 = {x=-50,y=-30}
			elseif s == 4 then
				self.拼接特效[s].偏移 = {x=-200,y=-50}
			end
		end
		--self.背景状态 = 1--技能背景
		self.全屏加速=2.2
		qp = true
	elseif jnm == "龙吟" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("龙吟6")
		self.拼接特效[1].偏移 = {x=0,y=-40}
		self.拼接特效[2] = {}
		self.拼接特效[2].特效 = 单位:加载特效("龙吟2")
		self.拼接特效[2].偏移 = {x=-233+90,y=-30}
		self.拼接特效[3] = {}
		self.拼接特效[3].特效 = 单位:加载特效("龙吟2")
		self.拼接特效[3].偏移 = {x=0+90+50,y=-60}
		self.拼接特效[4] = {}
		self.拼接特效[4].特效 = 单位:加载特效("龙吟4")
		self.拼接特效[4].偏移 = {x=0,y=-40}
		self.拼接特效[5] = {}
		self.拼接特效[5].特效 = 单位:加载特效("龙吟7")
		self.拼接特效[5].偏移 = {x=0,y=-40}
		self.背景状态 = 1
		self.全屏加速=2
		qp = true
	elseif jnm == "飞砂走石" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("飞砂走石1")
		self.拼接特效[1].偏移 = {x=-36,y=80}
		self.拼接特效[2] = {}
		self.拼接特效[2].特效 = 单位:加载特效("飞砂走石2")
		self.拼接特效[2].偏移 = {x=-100,y=-15}
		self.拼接特效[3] = {}
		self.拼接特效[3].特效 = 单位:加载特效("飞砂走石2")
		self.拼接特效[3].偏移 = {x=100-36,y=-60}
		self.全屏加速=1.3
		qp = true
	elseif jnm == "超级飞砂走石" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("飞砂走石1")
		self.拼接特效[1].偏移 = {x=-36,y=80}
		self.拼接特效[2] = {}
		self.拼接特效[2].特效 = 单位:加载特效("飞砂走石2")
		self.拼接特效[2].偏移 = {x=-100,y=-15}
		self.拼接特效[3] = {}
		self.拼接特效[3].特效 = 单位:加载特效("飞砂走石2")
		self.拼接特效[3].偏移 = {x=100-36,y=-60}
		self.全屏加速=1.3
		qp = true
	elseif jnm == "风云变色" then
			self.拼接特效 = {}
			self.拼接特效[1] = {}
			self.拼接特效[1].特效 = 单位:加载特效("飞砂走石2")
			self.拼接特效[1].偏移 = {x=0,y=50}
			self.拼接特效[2] = {}
			self.拼接特效[2].特效 = 单位:加载特效("飞砂走石1")
			self.拼接特效[2].偏移 = {x=-100,y=-15}
			self.拼接特效[3] = {}
			self.拼接特效[3].特效 = 单位:加载特效("飞砂走石1")
			self.拼接特效[3].偏移 = {x=0,y=10}
			self.拼接特效[4] = {}
			self.拼接特效[4].特效 = 单位:加载特效("飞砂走石2")
			self.拼接特效[4].偏移 = {x=100,y=-50}
		    self.全屏加速=1.3
		qp = true
		if 单位.敌我 == 1 then
			self:风云变色处理("风云变色1", 全局游戏宽度-262-((全局游戏宽度-800)/2),全局游戏高度-220-((全局游戏高度-600)/2))
		else
			self:风云变色处理("风云变色2", (全局游戏宽度-800)/2+313,(全局游戏高度-600)/2+236)
		end
	elseif jnm == "其疾如风" or jnm == "其徐如林" or jnm == "侵掠如火" or jnm == "岿然如山" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效(jnm)
		self.拼接特效[1].偏移 = {x=0,y=40}
		self.全屏加速=1
		qp = true
	elseif jnm == "无间地狱" then
		self.全屏加速= 1
		self.拼接偏移.x,self.拼接偏移.y =0,0
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("无间地狱")
		self.拼接特效[1].偏移 = {x=全局游戏宽度/2-38+30,y=全局游戏高度/2+20}
		self.特殊状态[#self.特殊状态+1] = {名称 ="无间地狱" ,回合=3 } --要少一回合
		self:特殊状态处理("无间地狱",1)
	elseif jnm == "清静菩提" then
		self.全屏加速= 1
		self.拼接偏移.x,self.拼接偏移.y =0,0
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("清静菩提")
		self.拼接特效[1].偏移 = {x=全局游戏宽度/2-38+30,y=全局游戏高度/2-5}
		self.特殊状态[#self.特殊状态+1] = {名称 ="清静菩提" ,回合=3 } --无间地狱啥的都加到附加流程吧，不然会出现卡顿的情况
		self:特殊状态处理("清静菩提",1)
	elseif jnm == "媚眼如丝" then
		self.全屏加速= 1
		self.拼接偏移.x,self.拼接偏移.y =0,0
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("媚眼如丝")
		self.拼接特效[1].偏移 = {x=全局游戏宽度/2-38+30,y=全局游戏高度/2+20}
		self.特殊状态[#self.特殊状态+1] = {名称 ="媚眼如丝" ,回合=3 }
		self:特殊状态处理("媚眼如丝",1)
	elseif jnm == "诸天看护" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("诸天看护")
		self.拼接特效[1].偏移 = {x=0,y=0}
		self.全屏加速=1
		qp = true
	elseif jnm == "天罚" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("天罚")
		self.拼接特效[1].偏移 = {x=0,y=0}
		self.全屏加速=0.8
		qp = true
	elseif jnm == "法身" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("法身")
		self.拼接特效[1].偏移 = {x=0,y=0}
		self.全屏加速=1
		qp = true
	elseif jnm == "吞云吐雾" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("吞云吐雾")
		self.拼接特效[1].偏移 = {x=-100,y=-200}
		self.全屏加速=1
		qp = true
	elseif jnm == "魔神降临" then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("魔神降临")
		self.拼接特效[1].偏移 = {x=0,y=0}
		self.全屏加速=1
		qp = true
	elseif jnm == "泰山压顶" or jnm == "超级泰山压顶" then
		self.全屏加速= 1.2
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("泰山压顶2")
		self.拼接特效[1].偏移 = {x=-50,y=10}
		self.拼接特效[1].延时=30
		self.拼接特效[2] = {}
		self.拼接特效[2].特效 = 单位:加载特效("泰山压顶")
		self.拼接特效[2].偏移 = {x=-50,y=10}
		qp = true
		self.掉血特效=2
	    self.掉血帧=8
	elseif jnm == "奔雷咒" or jnm == "超级奔雷咒" then
		self.全屏加速= 1.5
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("奔雷咒1")
		self.拼接特效[#self.拼接特效].偏移 = {x=-162,y=-8}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("奔雷咒2")
		self.拼接特效[#self.拼接特效].偏移 = {x=-22,y=-38}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("奔雷咒3")
		self.拼接特效[#self.拼接特效].偏移 = {x=-62,y=-28}
		self.拼接特效[#self.拼接特效].延时=60
		qp = true
	elseif jnm == "天降灵葫_大" then
		self.全屏加速= 1.1
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效(jnm)
		self.拼接特效[1].偏移 = {x=-50,y=-40}
		qp = true
	elseif jnm == "天降灵葫_中" then
		self.全屏加速= 1.1
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效(jnm)
		self.拼接特效[1].偏移 = {x=-50,y=-40}
		qp = true
	elseif jnm == "天降灵葫_小" then
		self.全屏加速= 1.1
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效(jnm)
		self.拼接特效[1].偏移 = {x=-50,y=-40}
		qp = true
	elseif jnm == "水漫金山" or jnm == "超级水漫金山" then
		self.全屏加速= 1.5
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("水漫金山2")
		self.拼接特效[#self.拼接特效].偏移 = {x=-50,y=-50}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("水漫金山2")
		self.拼接特效[#self.拼接特效].偏移 = {x=100,y=-100}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("水漫金山2")
		self.拼接特效[#self.拼接特效].偏移 = {x=-185,y=48}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("水漫金山0")
		self.拼接特效[#self.拼接特效].偏移 = {x=-225,y=-34}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("水漫金山0")
		self.拼接特效[#self.拼接特效].偏移 = {x=-30,y=-168}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("水漫金山1")
		self.拼接特效[#self.拼接特效].偏移 = {x=-221,y=-33}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("水漫金山1")
		self.拼接特效[#self.拼接特效].偏移 = {x=-31,y=-169}
		qp = true
	elseif jnm == "八凶法阵" then
		self.全屏加速= 1.1
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("八凶法阵")
		self.拼接特效[1].偏移 = {x=-50,y=-40}
		qp = true
	elseif jnm == "叱咤风云" then
		self.全屏加速= 1.1
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("叱咤风云")
		self.拼接特效[1].偏移 = {x=-50,y=-40}
		qp = true
	elseif jnm == "流沙轻音" then
		self.全屏加速= 1.1
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("流沙轻音")
		self.拼接特效[1].偏移 = {x=-50,y=-40}
		qp = true
	elseif jnm == "地狱烈火" or jnm == "超级地狱烈火" then
		self.全屏加速= 1.2
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("替换地狱烈火")
		self.拼接特效[1].偏移 = {x=85,y=-167}
		qp = true
	elseif jnm == "刀光剑影" then
		self.全屏加速= 1.4
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("蚩尤技能")
		self.拼接特效[1].偏移 = {x=-135,y=-100}
		for s=2,2 do
		self.拼接特效[s] = {}
		self.拼接特效[s].特效 = 单位:加载特效("刀光剑影")
		self.拼接特效[s].偏移 = {x=-126,y=-30}
		end
		for s=3,3 do
		self.拼接特效[s] = {}
		self.拼接特效[s].特效 = 单位:加载特效("刀光剑影2")
		self.拼接特效[s].偏移 = {x=-360+((s-2)*480-120),y=250-175-((s-2)*75)}
		self.拼接特效[#self.拼接特效].延时=100
		end
		qp = true
	elseif jnm == "毁灭之光" then
		self.全屏加速= 1.4
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("蚩尤技能")
		self.拼接特效[1].偏移 = {x=-135,y=-100}
		for s=2,2 do
			self.拼接特效[s] = {}
			self.拼接特效[s].特效 = 单位:加载特效("毁灭之光")
			self.拼接特效[s].偏移 = {x=-126,y=-30}
		end
		qp = true
	elseif jnm == "武神之怒" then
		self.全屏加速= 1.4
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("蚩尤技能")
		self.拼接特效[1].偏移 = {x=-135,y=-100}
		for s=2,2 do
			self.拼接特效[s] = {}
			self.拼接特效[s].特效 = 单位:加载特效("武神之怒")
			self.拼接特效[s].偏移 = {x=-126,y=-30}
		end
		qp = true
	elseif jnm == "翻江搅海" then
		self.全屏加速= 1
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("翻江搅海")
		self.拼接特效[1].偏移 = {x=-55,y=15}
		qp = true
	elseif jnm == "魔火焚世" then
		self.全屏加速= 1.1
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("魔火焚世")
		if 单位.敌我==1 then --我方
			self.拼接特效[1].偏移 = {x=20,y=0}
		else
		    self.拼接特效[1].偏移 = {x=-40,y=-10}
		end
		qp = true
	elseif jnm == "云暗天昏"  then
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("云暗天昏")
		self.拼接特效[1].偏移 = {x=-55,y=15}
		qp = true
	elseif jnm == "枯木逢春" then
		self.全屏加速= 0.7
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("枯木逢春1")
		self.拼接特效[#self.拼接特效].偏移 = {x=66-100,y=-28}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("枯木逢春2")
		self.拼接特效[#self.拼接特效].偏移 = {x=5-70,y=9+50}
		self.拼接特效[#self.拼接特效].延时=40
		qp = true
	elseif jnm == "蛊木迷瘴" then
		self.全屏加速= 0.7
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("蛊木迷瘴")
		self.拼接特效[#self.拼接特效].偏移 = {x=66-100,y=-28+50}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("蛊木迷瘴2")
		self.拼接特效[#self.拼接特效].偏移 = {x=5-100,y=9+50}
		self.拼接特效[#self.拼接特效].延时=40
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("蛊木迷瘴2")
		self.拼接特效[#self.拼接特效].偏移 = {x=77-100,y=-5+50}
		self.拼接特效[#self.拼接特效].延时=40
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("蛊木迷瘴2")
		self.拼接特效[#self.拼接特效].偏移 = {x=-61-100,y=-29+50}
		self.拼接特效[#self.拼接特效].延时=60
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("蛊木迷瘴2")
		self.拼接特效[#self.拼接特效].偏移 = {x=138-100,y=-23+50}
		self.拼接特效[#self.拼接特效].延时=60
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("蛊木迷瘴2")
		self.拼接特效[#self.拼接特效].偏移 = {x=-109-100,y=-62+50}
		self.拼接特效[#self.拼接特效].延时=90
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("蛊木迷瘴2")
		self.拼接特效[#self.拼接特效].偏移 = {x=22-100,y=-31+50}
		self.拼接特效[#self.拼接特效].延时=80
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("蛊木迷瘴1")
		self.拼接特效[#self.拼接特效].偏移 = {x=162-100,y=-110+50}
		self.拼接特效[#self.拼接特效].延时=90
		qp = true

	elseif jnm == "落叶萧萧" or jnm == "风卷残云" or jnm == "疾风秋叶"  then
		self.全屏加速= 0.8
		self.拼接特效 = {}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("落叶萧萧")
		self.拼接特效[#self.拼接特效].偏移 = {x=66-50,y=-28+40}
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("落叶萧萧2")
		self.拼接特效[#self.拼接特效].偏移 = {x=5-50,y=9+40}
		self.拼接特效[#self.拼接特效].延时=40
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("落叶萧萧2")
		self.拼接特效[#self.拼接特效].偏移 = {x=77-50,y=-5+40}
		self.拼接特效[#self.拼接特效].延时=40
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("落叶萧萧2")
		self.拼接特效[#self.拼接特效].偏移 = {x=-61-50,y=-29+40}
		self.拼接特效[#self.拼接特效].延时=60
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("落叶萧萧2")
		self.拼接特效[#self.拼接特效].偏移 = {x=138-50,y=-23+40}
		self.拼接特效[#self.拼接特效].延时=60
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("落叶萧萧2")
		self.拼接特效[#self.拼接特效].偏移 = {x=-109-50,y=-62+40}
		self.拼接特效[#self.拼接特效].延时=90
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("落叶萧萧2")
		self.拼接特效[#self.拼接特效].偏移 = {x=22-50,y=-31+40}
		self.拼接特效[#self.拼接特效].延时=80
		self.拼接特效[#self.拼接特效+1] = {}
		self.拼接特效[#self.拼接特效].特效 = 单位:加载特效("落叶萧萧1")
		self.拼接特效[#self.拼接特效].偏移 = {x=162-50,y=-110+40}
		self.拼接特效[#self.拼接特效].延时=90
		qp = true
	elseif jnm == "扶摇万里" then
		self.全屏加速= 0.7
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("扶摇万里")
		self.拼接特效[1].偏移 = {x=-0,y=-0}
		qp = true
	elseif jnm == "北冥之渊" then
		self.全屏加速= 0.7
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("北冥之渊")
		self.拼接特效[1].偏移 = {x=-325,y=-110}
		qp = true
	elseif jnm == "天地洞明" then
		self.全屏加速= 0.7
		self.拼接特效 = {}
		self.拼接特效[1] = {}
		self.拼接特效[1].特效 = 单位:加载特效("天地洞明")
		self.拼接特效[1].偏移 = {x=-127,y=-100}
		qp = true
		self.天地洞明=true
	end
	self.全屏加速=self.全屏加速+0.3
	if qp then
		if 单位.敌我 == 1 then
			self.拼接偏移.x,self.拼接偏移.y = 全局游戏宽度-262-((全局游戏宽度-800)/2),全局游戏高度-220-((全局游戏高度-600)/2)--638,449
		else
			self.拼接偏移.x,self.拼接偏移.y = (全局游戏宽度-800)/2+313,(全局游戏高度-600)/2+236
		end
	end
end

function 战斗类:风云变色处理(名称,x,y)
	if 名称 == "风云变色1" then --敌方施法
		self.色变动画我方 = {动画=引擎.场景.资源:载入('waddon.wdf',"网易WDF动画",1514813037),x=x,y=y}
		self.色变进度我方 = 255
		self.色变我方 = os.time()+ 2
	elseif 名称 == "风云变色2" then
		self.色变动画敌方 = {动画=引擎.场景.资源:载入('waddon.wdf',"网易WDF动画",1514813037),x=x,y=y}
		self.色变进度敌方 = 255
		self.色变敌方 = os.time()+ 2
	end
end

function 战斗类:特殊状态处理(名称,类型,x,y)
	if 名称 == "无间地狱" then
		if 类型 == 1 then
			self.无间地狱 = 引擎.场景.资源:载入('waddon.wdf',"网易WDF动画",2808758193)
			self.无间地狱死亡 = 引擎.场景.资源:载入('waddon.wdf',"网易WDF动画",2289147609)
			self.无间地狱开关=nil
		else
			self.无间地狱 = nil
			self.无间地狱死亡 = nil
			self.无间地狱开关=nil
		end
	elseif 名称 == "媚眼如丝" then
		if 类型 == 1 then
			self.媚眼如丝 = {动画=引擎.场景.资源:载入('waddon.wdf',"网易WDF动画",3883598561),x=x,y=y}
			self.媚眼如丝回血 = {动画=引擎.场景.资源:载入('waddon.wdf',"网易WDF动画",2565398678),x=x,y=y}
			self.媚眼如丝开关 = nil
		else
			self.媚眼如丝 = nil
			self.媚眼如丝回血 = nil
			self.媚眼如丝开关 = nil
		end
	elseif 名称 == "清静菩提" then
		if 类型 == 1 then
			self.清静菩提 = {动画=引擎.场景.资源:载入('waddon.wdf',"网易WDF动画",1772528793),x=x,y=y}
			self.清静菩提动画 = {动画=引擎.场景.资源:载入('waddon.wdf',"网易WDF动画",1458710428),x=x,y=y}
			self.清静菩提开关 = nil
		else
			self.清静菩提 = nil
			self.清静菩提动画 = nil
			self.清静菩提开关 = nil
		end
	end
end
function 战斗类:添加战斗提醒文字(q)
	self.战斗信息提示.开关=true
	self.战斗信息提示.文字=q
	self.战斗信息提示.起始时间=os.time()
end

function 战斗类:显示(dt,x,y)
	self.纯色背景:显示(0,0)
	self.战斗信息提示.字体:显示(全局游戏宽度-150,95,"当前第 "..self.回合数.." 回合")
	if self.无间地狱 == nil and self.媚眼如丝 == nil and self.清静菩提 == nil then
		self.战斗背景:显示(全局游戏宽度/2-235,全局游戏高度/2-125)
	else
		if self.无间地狱 ~= nil then
			self.无间地狱:更新()
			self.无间地狱:显示(全局游戏宽度/2,全局游戏高度/2)
			if self.无间地狱开关 then
			    self.无间地狱死亡:更新()
				self.无间地狱死亡:显示(全局游戏宽度/2,全局游戏高度/2+30)
				if self.无间地狱死亡.当前帧>=self.无间地狱死亡.结束帧 then
					self.无间地狱死亡.当前帧=0
				    self.无间地狱开关=nil
				end
			end
		end
		if self.媚眼如丝 ~= nil then
			self.媚眼如丝.动画:更新()
			self.媚眼如丝.动画:显示(全局游戏宽度/2,全局游戏高度/2)
			if self.媚眼如丝开关 then
			    self.媚眼如丝回血.动画:更新()
				self.媚眼如丝回血.动画:显示(全局游戏宽度/2,全局游戏高度/2+10)
				if self.媚眼如丝回血.动画.当前帧>=self.媚眼如丝回血.动画.结束帧 then
					self.媚眼如丝回血.动画.当前帧=0
				    self.媚眼如丝开关=nil
				end
			end
		end
		if self.清静菩提 ~= nil then
			self.清静菩提.动画:更新()
			self.清静菩提.动画:显示(全局游戏宽度/2,全局游戏高度/2)
			if self.清静菩提开关 then
			    self.清静菩提动画.动画:更新()
				self.清静菩提动画.动画:显示(全局游戏宽度/2,全局游戏高度/2+10)
				if self.清静菩提动画.动画.当前帧>=self.清静菩提动画.动画.结束帧 then
					self.清静菩提动画.动画.当前帧=0
				    self.清静菩提开关=nil
				end
			end
		end
	end

	if self.色变我方 ~= nil then
		if os.time() - self.色变我方 >=0  then
			self.色变动画我方.动画:更新()
			self.色变进度我方 = self.色变进度我方 - 0.1
			self.色变动画我方.动画:置颜色(ARGB(self.色变进度我方,255,255,255))
			self.色变动画我方.动画:显示(self.色变动画我方.x,self.色变动画我方.y)
			if self.色变进度我方<=100 then
			    self.色变动画我方=nil
			    self.色变进度我方=nil
			    self.色变我方=nil
			end
		end
	end
	if self.色变敌方 ~= nil then
		if os.time() - self.色变敌方 >=0  then
			self.色变动画敌方.动画:更新()
			self.色变进度敌方 = self.色变进度敌方 - 0.1
			self.色变动画敌方.动画:置颜色(ARGB(self.色变进度敌方,255,255,255))
			self.色变动画敌方.动画:显示(self.色变动画敌方.x,self.色变动画敌方.y)
			if self.色变进度敌方<=100 then
			    self.色变动画敌方=nil
			    self.色变进度敌方=nil
			    self.色变敌方=nil
			end
		end
	end

	if self.背景状态 == 1 then
		self.黑幕背景:显示(0,0)
	end
	if self.PK战斗 then
	    self.竖条:更新(x,y)
		self.横条:更新(x,y)
		self.横条:显示(全局游戏宽度/2-156,5)
		self.竖条:显示(全局游戏宽度-14,全局游戏高度/2-180)
		if self.竖条:是否选中(x,y) and 引擎.鼠标弹起(左键) then
			if self.我方头像开关 then
				self.我方头像开关=false
			else
				self.我方头像开关=true
			end
		end
		if self.横条:是否选中(x,y) and 引擎.鼠标弹起(左键) then
			if self.敌方头像开关 then
				self.敌方头像开关=false
			else
				self.敌方头像开关=true
			end
		end
		if self.我方头像开关 and  self.进程=="命令" then
			for i=1,#self.我方头像组 do
				tp.人物头像背景_:显示(全局游戏宽度-67,全局游戏高度/2-180+(i-1)*55)
				self.我方头像组[i]:更新(x,y)
				self.我方头像组[i]:显示(全局游戏宽度-64,全局游戏高度/2-177+(i-1)*55,true)
				if self.我方头像组[i]:是否选中(x,y) then
					tp.提示:自定义(全局游戏宽度-64,全局游戏高度/2-133+(i-1)*55,"#Y/名称:"..self.我方头像组[i].名称.."\n#Y/等级:"..(self.我方头像组[i].等级 or 0).."\n#Y/门派:"..(self.我方头像组[i].门派 or "无"),93)
				end
			end
		end
		if self.敌方头像开关 and  self.进程=="命令" then
			for i=1,#self.敌方头像组 do
				tp.人物头像背景_:显示(全局游戏宽度/2-157+(i-1)*55,23)
				self.敌方头像组[i]:更新(x,y)
				self.敌方头像组[i]:显示(全局游戏宽度/2-154+(i-1)*55,26,true)
				if self.敌方头像组[i]:是否选中(x,y) then
					tp.提示:自定义(全局游戏宽度/2-194+(i-1)*55,76,"#Y/名称:"..self.敌方头像组[i].名称.."\n#Y/等级:"..(self.敌方头像组[i].等级 or 0).."\n#Y/门派:"..(self.敌方头像组[i].门派 or "无"))
				end
			end
		end
		if self.单挑模式 and self.进程=="命令" then
			self.战斗指令:单挑显示(dt,x,y)
		end
		if (self.技能待放组[1]:是否选中(x,y) or self.技能待放组[2]:是否选中(x,y)) and 引擎.鼠标弹起(左键) and not self.单挑模式 then
			if self.技能展示开关 then
				self.技能展示开关=false
			else
				self.技能展示开关=true
			end
		end
	end
	self.阵型组[1]:显示(全局游戏宽度-26,全局游戏高度/2-210)


	for i=1,#self.战斗单位[ljcs] do
		if self.战斗单位[ljcs][i].初始化结束 == nil then return end
		self.显示排序[i] = {显示y=self.战斗单位[ljcs][i].显示xy.y,编号=i}
	end
	table.sort(self.显示排序,排序)

	for n=1,#self.战斗单位[ljcs] do
		self.战斗单位[ljcs][self.显示排序[n].编号]:显示(dt,x,y)
		if 引擎.鼠标弹起(右键) and self.战斗单位[ljcs][n]:是否选中(x,y) and not tp.窗口.战斗状态栏.可视 then
			if next(self.战斗单位[ljcs][n].状态特效)~=nil or self.战斗单位[ljcs][n].战意>0 or self.战斗单位[ljcs][n].五行珠>0 or self.战斗单位[ljcs][n].人参果.枚>0 or self.战斗单位[ljcs][n].骤雨.层数>0 then --or self.战斗单位[ljcs][n].如意神通~=nil
			    tp.窗口.战斗状态栏:打开(n)
			end
		end
	end
	if self.进程=="命令" then
		self.秒显示=0
		self.分显示=0
		self.结果=时间-self.命令数据.计时
		self.显示时间=0
		if self.结果>=1 then
			self.命令数据.计时=时间
			self.命令数据.秒=self.命令数据.秒-1
			if self.命令数据.秒<0 then
				if self.命令数据.分<=0 and self.命令数据.秒<=0 then
					self.战斗指令:结束()
					self.进程="等待"
					self.显示时间=1
				elseif self.命令数据.秒<=0 then
					self.命令数据.秒=9
					self.命令数据.分=self.命令数据.分-1
				end
			end
		end
		if self.显示时间==0 then
			self.分显示=self.命令数据.分+1
			if self.分显示>10 then
			 self.分显示=1
			end
			self.秒显示=self.命令数据.秒+1
			if self.秒显示>10 then
			 self.秒显示=1
			end
			self.数字图片[self.分显示]:显示(全局游戏宽度/2-70,30)
			self.数字图片[self.秒显示]:显示(全局游戏宽度/2-20,30)
		end
		if self.hbxztx==0 then
			self.战斗指令:显示(dt,x,y)
		else
			self.伙伴zhil:显示(dt,x,y)
		end
		-- self.战斗指令:显示(dt,x,y)

	elseif self.进程=="等待" then
		self.请等待:显示(全局游戏宽度/2-75,70)
	end
	if self.进程=="执行" then
		if self.战斗信息提示.开关 then
			self.战斗信息提示.字体:显示(全局游戏宽度/2-75,全局游戏高度-100,self.战斗信息提示.文字)
			if os.time()-self.战斗信息提示.起始时间 >=2 then
				self.战斗信息提示.开关 =false
			end
		end
		if self.拼接特效 ~= nil then
			for n=1,#self.拼接特效 do
				if self.拼接特效[n] ~= nil and self.拼接特效[n].延时==nil then
					self.拼接特效[n].特效:显示(self.拼接偏移.x + self.拼接特效[n].偏移.x ,self.拼接偏移.y + self.拼接特效[n].偏移.y)
				end
			end
		end
		if self.战斗单位[ljcs] and self.战斗流程[1] and self.战斗流程[1].挨打方 and type(self.战斗流程[1].挨打方)=="table" and self.战斗流程[1].攻击方 and self.战斗单位[ljcs][self.战斗流程[1].攻击方].超级夜战 == 1 then
			self.战斗单位[ljcs][self.战斗流程[1].挨打方[1].挨打方]:单位血条显示()
		end
	end
	for n=1,#self.战斗单位[ljcs] do
		if self.战斗单位[ljcs][n].掉血开关 then
			if self.战斗单位[ljcs][n].伤害类型==1 then
				self.战斗单位[ljcs][n]:掉血显示()
			elseif self.战斗单位[ljcs][n].伤害类型==3 or self.战斗单位[ljcs][n].伤害类型==4  then
				self.战斗单位[ljcs][n]:暴击显示()
			elseif self.战斗单位[ljcs][n].伤害类型==3.5 then
				self.战斗单位[ljcs][n]:法术暴击显示()
			else
				self.战斗单位[ljcs][n]:加血显示()
			end
		end
		if self.战斗单位[ljcs][n].其他掉血开关 then
			self.战斗单位[ljcs][n]:其他掉血显示()
		end
	end
	if self.自动开关 then
		--self.自动栏.鼠标=false
		if self.自动栏.可视化 == false then
			self.自动栏.可视化 = true
		end
		if self.自动栏:检查点(x,y) then
			self.自动栏.鼠标=true
		else
			self.自动栏.鼠标=false
		end
		self.自动栏:显示(dt,x,y)
		if mousea(0) and self.自动栏.可移动 and not 引擎.场景.消息栏焦点 then
			self.自动栏:初始移动(x,y)
		elseif mouseb(0)  or self.隐藏UI or self.消息栏焦点 then
			引擎.场景.场景.战斗.移动窗口 = false
		end
		if 引擎.场景.场景.战斗.移动窗口 and not self.消息栏焦点 then
			self.自动栏:开始移动(x,y)
		end
	end
	-- if self.观战开关 then
	-- 	self.观战栏.鼠标=false
	-- 	self.观战栏:检查点(x,y)
	-- 	self.观战栏:显示(dt,x,y)
	-- end
	if self.观战开关 then
		self.观战栏.鼠标=false
		self.观战栏:检查点(x,y)
		self.观战栏:显示(dt,x,y)
	else
		self:伙伴头像显示(dt,x,y)
	end
    self.退出战斗:更新(x,y)
	self.退出战斗:显示(155,19)

	if tp.窗口.辅助内挂类.可视 and tp.窗口.辅助内挂类.开始挂机 then
		zts1 = tp.字体表.普通字体_
		zts1:置颜色(黄色)
		self.结束挂机:显示(175,-2)
		zts1:显示(220,2,"结 束 挂 机")
	end

	if self.结束挂机:是否选中(x,y) and mouseb(0) and not self.消息栏焦点 then
		发送数据(554)
	end

    if self.退出战斗:是否选中(x,y) and mouseb(0) and not self.消息栏焦点 then
		发送数据(401)
	end
	if #self.山海排行 > 0 then --8.18
		self.山海图标:显示(全局游戏宽度/2+57,12)
		if self.山海图标:是否选中(x,y) then
			tp.提示:自定义(x-1,y+23,self.山海提示)
		end
	end

	if tp.窗口.战斗状态栏.可视 then
		tp.窗口.战斗状态栏:显示(dt,x,y)
	end

	if self.过度精灵 ~= nil then
		self.过度时间 = self.过度时间 - 0.55
		if self.过度时间 <= 0 then
			self.过度进度 = self.过度进度 - (10)
			self.过度时间 = 0
			if self.过度进度 <= 0 then
				self.过度进度 = 0
			end
		end
		self.过度坐标1.x,self.过度坐标1.y = self.过度坐标1.x -6,self.过度坐标1.y -6
		self.过度坐标2.x,self.过度坐标2.y = self.过度坐标2.x +6,self.过度坐标2.y -6
		self.过度坐标3.x,self.过度坐标3.y = self.过度坐标3.x -6,self.过度坐标3.y +6
		self.过度坐标4.x,self.过度坐标4.y = self.过度坐标4.x +6,self.过度坐标4.y +6
		self.过度精灵1:显示(self.过度坐标1.x,self.过度坐标1.y)
		self.过度精灵2:显示(self.过度坐标2.x,self.过度坐标2.y)
		self.过度精灵3:显示(self.过度坐标3.x,self.过度坐标3.y)
		self.过度精灵4:显示(self.过度坐标4.x,self.过度坐标4.y)
		if self.过度进度 <= 0 then
			self.过度精灵 = nil
			self.过度精灵1= nil
			self.过度精灵2= nil
			self.过度精灵3= nil
			self.过度精灵4= nil
			self.过度减少 = nil
		end
	end
end

local xzlx=0
local format = string.format
function 战斗类:伙伴头像显示(dt,x,y)
	self.助战窗体选中=false
	if #self.伙伴头像>0 then
		self.zz竖条:更新(x,y)
		self.zz竖条:显示(1,112)
		if self.zz竖条:是否选中(x,y) and 引擎.鼠标弹起(左键) then
			self.助战头像开关=not self.助战头像开关
		end
		if self.助战头像开关 then
			for i=1,#self.伙伴头像 do
				self.hbjnpng:显示(54-3+10,129+(i-1)*58)
				tp.窗口.人物框.人物tx背景_:显示(10-3+10,130+(i-1)*58)
				self.伙伴头像[i]:显示(13-3+10,133+(i-1)*58)
				self.技能待放组[4]:显示(78+1+10,133+(i-1)*58)
				tp.字体表.伙伴战斗zt:置颜色(黄色)
				tp.字体表.伙伴战斗zt:显示(14+47+10,140+(i-1)*58,self.伙伴头像[i].门派)
				if self.伙伴头像[i]:是否选中(x,y)  then
					local sdw=self.战斗单位[ljcs][self.伙伴头像[i].num]
					if sdw and sdw.愤怒 then
						tp.提示:自定义(鼠标.x,鼠标.y,format("#G/气血：%d/%d/%d\n#S/魔法：%d/%d\n#Y/愤怒：%d/150",sdw.气血,sdw.气血上限,sdw.最大气血,sdw.魔法,sdw.最大魔法,sdw.愤怒))
					end
				end
				if self.伙伴头像[i].伙伴技能 then
					self.伙伴头像[i].伙伴技能.小模型:显示(81+1+10+self.伙伴头像[i].伙伴技能.偏移[1],135+(i-1)*58+self.伙伴头像[i].伙伴技能.偏移[2])
					if  self.伙伴头像[i].伙伴技能.小模型:是否选中(x,y)  then
						if self.伙伴头像[i].伙伴技能.小模型.图片 then
						else
							self.伙伴头像[i].伙伴技能.小模型:置高亮()
						end
						self.助战窗体选中=true
						tp.提示:自定义(鼠标.x,鼠标.y,"#Y"..self.伙伴头像[i].伙伴技能.名称)
					else
						if self.伙伴头像[i].伙伴技能.小模型.图片 then
						else
							self.伙伴头像[i].伙伴技能.小模型:取消高亮()
						end
					end

					self.技能待放组[5]:显示(78+1+10,132+(i-1)*58)
					if  self.技能待放组[5]:是否选中(x,y)  then
						if 引擎.鼠标弹起(左键) and self.进程=="命令"  then --and (self.战斗指令 and self.战斗指令.法术开关 ==false)
							self.hbxztx=i
							xzlx=1
							self.伙伴zhil:更新角色类型(self.伙伴头像[i].操作数据)
							--self.伙伴jnlan:打开(self.伙伴头像[i].伙伴技能.主动技能组,"法术","人物",self.伙伴头像[i].追加法术)
						end
					end
				end
				if self.伙伴头像[i].宝宝技能 and self.伙伴头像[i].宝宝技能.小模型 then
					self.技能待放组[4]:显示(142-3+10,133+(i-1)*58)
					self.伙伴头像[i].宝宝技能.小模型:显示(145-3+10+self.伙伴头像[i].宝宝技能.偏移[1],135+(i-1)*58+self.伙伴头像[i].宝宝技能.偏移[2])
					if  self.伙伴头像[i].宝宝技能.小模型:是否选中(x,y)  then
						if self.伙伴头像[i].宝宝技能.小模型.图片 then
						else
							self.伙伴头像[i].宝宝技能.小模型:置高亮()
						end
						self.助战窗体选中=true
						tp.提示:自定义(鼠标.x,鼠标.y,"#Y"..self.伙伴头像[i].宝宝技能.名称)
					else
						if self.伙伴头像[i].宝宝技能.小模型.图片 then
						else
							self.伙伴头像[i].宝宝技能.小模型:取消高亮()
						end
					end
					self.技能待放组[5]:显示(142-3+10,132+(i-1)*58)
					if  self.技能待放组[5]:是否选中(x,y)  then
						if 引擎.鼠标弹起(左键) and self.进程=="命令"  then --and (self.战斗指令 and self.战斗指令.法术开关 ==false)
							self.hbxztx=i
							xzlx=2
							self.伙伴zhil:更新bb类型(self.伙伴头像[i].操作数据)
							--self.伙伴jnlan:打开(self.伙伴头像[i].伙伴技能.主动技能组,"法术","人物",self.伙伴头像[i].追加法术)
						end
					end
				end

				if self.hbxztx~=0 then
					self.hbk:显示(14,129+4-6+(self.hbxztx-1)*58)
					if xzlx~=0 then
						tp.圈圈:显示(72+10+(xzlx-1)*60,129+4-6+(self.hbxztx-1)*58)
					end
				end
			end
		else
			self.hbxztx=0
		end
	end
end

function 战斗类:加载阵法()
	self.敌方位置={
		[1]={["y"]=192,["x"]=347},
		[3]={["y"]=155,["x"]=410},
		[2]={["y"]=230,["x"]=280},
		[5]={["y"]=119,["x"]=477},
		[4]={["y"]=270,["x"]=211},
		[6]={["y"]=233,["x"]=398},
		[7]={["y"]=268,["x"]=333},
		[8]={["y"]=195,["x"]=463},
		[9]={["y"]=309,["x"]=267},
		[10]={["y"]=160,["x"]=528},
		[11]={["y"]=100,["x"]=250},
	}
	self.我方位置={
		[1]={["y"]=421,["x"]=709},
		[2]={["y"]=450,["x"]=640},
		[3]={["y"]=380,["x"]=770},
		[4]={["y"]=485,["x"]=575},
		[5]={["y"]=345,["x"]=835},
		[6]={["y"]=355,["x"]=635},
		[7]={["y"]=390,["x"]=570},
		[8]={["y"]=320,["x"]=700},
		[9]={["y"]=425,["x"]=505},
		[10]={["y"]=285,["x"]=765}
	}

	self.阵型位置={}
	self.阵型位置.天覆阵={
	我方={
		[1]={["y"]=464,["x"]=758},
		[2]={["y"]=445,["x"]=645},
		[3]={["y"]=385,["x"]=765},
		[4]={["y"]=475,["x"]=585},
		[5]={["y"]=355,["x"]=825},
		[6]={["y"]=355,["x"]=635},
		[7]={["y"]=385,["x"]=575},
		[8]={["y"]=325,["x"]=695},
		[9]={["y"]=415,["x"]=515},
		[10]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=183,["x"]=310},
		[2]={["y"]=240,["x"]=295},
		[3]={["y"]=180,["x"]=415},
		[4]={["y"]=270,["x"]=235},
		[5]={["y"]=150,["x"]=475},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}}
	self.阵型位置.云垂阵={
	我方={[1]={["y"]=499,["x"]=808},
		[3]={["y"]=445,["x"]=645},
		[2]={["y"]=385,["x"]=765},
		[5]={["y"]=475,["x"]=585},
		[4]={["y"]=355,["x"]=825},
		[6]={["y"]=355,["x"]=635},
		[8]={["y"]=385,["x"]=575},
		[7]={["y"]=325,["x"]=695},
		[10]={["y"]=415,["x"]=515},
		[9]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=156,["x"]=269},
		[2]={["y"]=240,["x"]=295},
		[3]={["y"]=180,["x"]=415},
		[4]={["y"]=270,["x"]=235},
		[5]={["y"]=150,["x"]=475},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}}
	self.阵型位置.风扬阵={
	我方={[1]={["y"]=483,["x"]=776},
		[2]={["y"]=451,["x"]=845},
		[3]={["y"]=526,["x"]=701},
		[4]={["y"]=390,["x"]=769},
		[5]={["y"]=454,["x"]=648},
		[6]={["y"]=355,["x"]=635},
		[8]={["y"]=385,["x"]=575},
		[7]={["y"]=325,["x"]=695},
		[10]={["y"]=415,["x"]=515},
		[9]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=189,["x"]=287},
		[2]={["y"]=214,["x"]=220},
		[3]={["y"]=143,["x"]=352},
		[4]={["y"]=248,["x"]=280},
		[5]={["y"]=191,["x"]=406},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}}
	self.阵型位置.虎翼阵={
	我方={[1]={["y"]=501,["x"]=801},
		[2]={["y"]=411,["x"]=803},
		[3]={["y"]=496,["x"]=679},
		[4]={["y"]=329,["x"]=825},
		[5]={["y"]=480,["x"]=568},
		[6]={["y"]=355,["x"]=635},
		[8]={["y"]=385,["x"]=575},
		[7]={["y"]=325,["x"]=695},
		[10]={["y"]=415,["x"]=515},
		[9]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=142,["x"]=257},
		[2]={["y"]=209,["x"]=230},
		[3]={["y"]=146,["x"]=365},
		[4]={["y"]=275,["x"]=223},
		[5]={["y"]=160,["x"]=459},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}}
	self.阵型位置.鸟翔阵={
	我方={[1]={["y"]=438,["x"]=732},
		[2]={["y"]=433,["x"]=864},
		[3]={["y"]=516,["x"]=690},
		[4]={["y"]=341,["x"]=813},
		[5]={["y"]=480,["x"]=568},
		[6]={["y"]=355,["x"]=635},
		[8]={["y"]=385,["x"]=575},
		[7]={["y"]=325,["x"]=695},
		[10]={["y"]=415,["x"]=515},
		[9]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=203,["x"]=347},
		[2]={["y"]=196,["x"]=239},
		[3]={["y"]=136,["x"]=369},
		[4]={["y"]=275,["x"]=223},
		[5]={["y"]=154,["x"]=470},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}} }
	self.阵型位置.地载阵={
	我方={[1]={["y"]=464,["x"]=754},
		[2]={["y"]=412,["x"]=689},
		[3]={["y"]=437,["x"]=813},
		[4]={["y"]=488,["x"]=674},
		[5]={["y"]=525,["x"]=821},
		[6]={["y"]=355,["x"]=635},
		[8]={["y"]=385,["x"]=575},
		[7]={["y"]=325,["x"]=695},
		[10]={["y"]=415,["x"]=515},
		[9]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=167,["x"]=306},
		[2]={["y"]=211,["x"]=355},
		[3]={["y"]=200,["x"]=242},
		[4]={["y"]=134,["x"]=376},
		[5]={["y"]=121,["x"]=251},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}}
	self.阵型位置.龙飞阵={
	我方={[1]={["y"]=468,["x"]=753},
		[2]={["y"]=512,["x"]=810},
		[3]={["y"]=347,["x"]=808},
		[4]={["y"]=439,["x"]=618},
		[5]={["y"]=414,["x"]=696},
		[6]={["y"]=355,["x"]=635},
		[10]={["y"]=385,["x"]=575},
		[8]={["y"]=325,["x"]=695},
		[9]={["y"]=415,["x"]=515},
		[7]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=174,["x"]=277},
		[2]={["y"]=124,["x"]=215},
		[3]={["y"]=269,["x"]=223},
		[4]={["y"]=168,["x"]=407},
		[5]={["y"]=212,["x"]=330},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}}
	self.阵型位置.蛇蟠阵={
	我方={[1]={["y"]=468,["x"]=753},
		[2]={["y"]=505,["x"]=682},
		[3]={["y"]=448,["x"]=820},
		[4]={["y"]=439,["x"]=618},
		[5]={["y"]=535,["x"]=826},
		[6]={["y"]=355,["x"]=635},
		[7]={["y"]=385,["x"]=575},
		[8]={["y"]=325,["x"]=695},
		[9]={["y"]=415,["x"]=515},
		[10]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=174,["x"]=277},
		[2]={["y"]=132,["x"]=351},
		[3]={["y"]=218,["x"]=201},
		[4]={["y"]=168,["x"]=407},
		[5]={["y"]=128,["x"]=223},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}
	}
	self.阵型位置.鹰啸阵={
	我方={[1]={["y"]=468,["x"]=753},
		[2]={["y"]=444,["x"]=623},
		[3]={["y"]=381,["x"]=759},
		[4]={["y"]=416,["x"]=688},
		[5]={["y"]=532,["x"]=826},
		[6]={["y"]=355,["x"]=635},
		[7]={["y"]=385,["x"]=575},
		[8]={["y"]=325,["x"]=695},
		[9]={["y"]=415,["x"]=515},
		[10]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=174,["x"]=277},
		[2]={["y"]=168,["x"]=408},
		[3]={["y"]=247,["x"]=274},
		[4]={["y"]=211,["x"]=341},
		[5]={["y"]=128,["x"]=223},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}
	}
	self.阵型位置.雷绝阵={
	我方={[1]={["y"]=509,["x"]=834},
		[2]={["y"]=507,["x"]=705},
		[3]={["y"]=429,["x"]=853},
		[4]={["y"]=445,["x"]=631},
		[5]={["y"]=379,["x"]=763},
		[6]={["y"]=355,["x"]=635},
		[7]={["y"]=385,["x"]=575},
		[8]={["y"]=325,["x"]=695},
		[9]={["y"]=415,["x"]=515},
		[10]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=130,["x"]=234},
		[2]={["y"]=131,["x"]=335},
		[3]={["y"]=201,["x"]=234},
		[4]={["y"]=170,["x"]=401},
		[5]={["y"]=253,["x"]=289},
		[6]={["y"]=250,["x"]=400},
		[7]={["y"]=280,["x"]=340},
		[8]={["y"]=220,["x"]=460},
		[9]={["y"]=310,["x"]=280},
		[10]={["y"]=190,["x"]=520}}
	}
	self.阵型位置.boss阵法1={我方={[1]={["y"]=464,["x"]=758},[2]={["y"]=445,["x"]=645},[3]={["y"]=385,["x"]=765},[4]={["y"]=475,["x"]=585},[5]={["y"]=355,["x"]=825},[6]={["y"]=355,["x"]=635},[7]={["y"]=385,["x"]=575},[8]={["y"]=325,["x"]=695},[9]={["y"]=415,["x"]=515},[10]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=183,["x"]=310},[2]={["y"]=240,["x"]=295},[3]={["y"]=180,["x"]=415},[4]={["y"]=270,["x"]=235},[5]={["y"]=150,["x"]=475},[6]={["y"]=250,["x"]=400},[7]={["y"]=280,["x"]=340},[8]={["y"]=220,["x"]=460},[9]={["y"]=310,["x"]=280},[10]={["y"]=190,["x"]=520}}}
	self.阵型位置.烛龙阵法={我方={[1]={["y"]=464,["x"]=758},[2]={["y"]=445,["x"]=645},[3]={["y"]=385,["x"]=765},[4]={["y"]=475,["x"]=585},[5]={["y"]=355,["x"]=825},[6]={["y"]=355,["x"]=635},[7]={["y"]=385,["x"]=575},[8]={["y"]=325,["x"]=695},[9]={["y"]=415,["x"]=515},[10]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=392,["x"]=304},[2]={["y"]=240,["x"]=295},[3]={["y"]=180,["x"]=415},[4]={["y"]=270,["x"]=235},[5]={["y"]=150,["x"]=475},[6]={["y"]=250,["x"]=400},[7]={["y"]=280,["x"]=340},[8]={["y"]=220,["x"]=460},[9]={["y"]=310,["x"]=280},[10]={["y"]=190,["x"]=520}}}
	self.阵型位置.自在天魔阵法={我方={[1]={["y"]=464,["x"]=758},[2]={["y"]=445,["x"]=645},[3]={["y"]=385,["x"]=765},[4]={["y"]=475,["x"]=585},[5]={["y"]=355,["x"]=825},[6]={["y"]=355,["x"]=635},[7]={["y"]=385,["x"]=575},[8]={["y"]=325,["x"]=695},[9]={["y"]=415,["x"]=515},[10]={["y"]=295,["x"]=755}},
	敌方={[1]={["y"]=188,["x"]=347},[3]={["x"]=322-60,["y"]=432-130},[2]={["x"]=238-60,["y"]=416-130},[4]={["x"]=396-60,["y"]=424-130},[5]={["x"]=469-60,["y"]=405-130},[6]={["x"]=519-60,["y"]=369-130},[7]={["x"]=566-60,["y"]=316-130},[8]={["x"]=575-60,["y"]=267-130},[9]={["x"]=255-60,["y"]=319-130},[10]={["x"]=392,["y"]=93}}}

    self.阵型位置.单挑={
	    我方={
			[1]={["x"]=709,["y"]=421},
			[2]={["x"]=631,["y"]=362},
			[3]={["x"]=596,["y"]=488},
			[4]={["x"]=794,["y"]=358},
			[5]={["x"]=788,["y"]=485},
			[6]={["x"]=598,["y"]=342},
			[7]={["x"]=570,["y"]=390},
			[8]={["x"]=700,["y"]=320},
			[9]={["x"]=505,["y"]=425},
			[10]={["x"]=765,["y"]=285}
		},
		敌方={
			[1]={["x"]=361,["y"]=185},
			[2]={["x"]=422,["y"]=243},
			[3]={["x"]=250,["y"]=231},
			[4]={["x"]=450,["y"]=129},
			[5]={["x"]=282,["y"]=109},
			[6]={["x"]=398,["y"]=233},
			[7]={["x"]=333,["y"]=268},
			[8]={["x"]=463,["y"]=195},
			[9]={["x"]=267,["y"]=309},
			[10]={["x"]=528,["y"]=160}
		}
	}
end

return 战斗类