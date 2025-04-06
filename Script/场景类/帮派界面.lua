-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-17 14:37:41
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-07-19 11:38:11
--======================================================================--
local 场景类_帮派界面 = class()

local bwh = require("gge包围盒")
local bw1 = bwh(0,0,548,25)
local bw2 = bwh(0,0,308,30)
local bw3 = bwh(0,0,325,317)
local bw4 = bwh(0,0,226,87)

local box = 引擎.画矩形
local tp,zts,zts1,rwa,zts2,zts3
local mousea = 引擎.鼠标弹起
local insert = table.insert
local tos = 引擎.取摊位金钱颜色
local min = math.min
local ceil = math.ceil
local qjn = 引擎.取技能
local 帮派建筑升级经验 = {
  [0]=1600,
  [1]=1600,
  [2]=3200,
  [3]=5200,
  [4]=7500,
  [5]=10300,
  [6]=13600,
  [7]=17900,
  [8]=23100,
  [9]=29500,
  [10]=37200,
  [11]=46600,
  [12]=57800,
  [13]=71100,
  [14]=86700,
  [15]=104900,
  [16]=128000
}

local bpxx = {"金 库 数","物价指数","书 院 数","修理指数","兽 室 数","守 护 兽","厢 房 数","帮派迷宫","药 房 数","当前内政","仓 库 数","百 草 谷","药品增量","藏 宝 室"}
local bzgk = {"帮 派 名","帮派资金","敌对帮派","帮派规模","储 备 金","同盟帮派","帮派编号","维护情况","安 定 度","创 始 人","维护时间","人 气 度","帮    主","目前资材","行 动 力","成    员","最大资材","研 究 力","繁荣等级","掌控区域","繁 荣 度"}
local bpbb = {"当前建筑进度","需要建筑进度","需要耗繁荣度","需要耗人气度"}--{"需要损耗资金","需要建筑进度","需要耗繁荣度","需要耗人气度"}
local bpjn = {"强壮","神速","灵石技巧","强身术","健身术","冥想","炼金术","打造技巧","裁缝技巧","熔炼技巧","暗器技巧","烹饪技巧","中医药理","巧匠之术","逃离技巧","追捕技巧","淬灵之术","养身之道"}

local function 取繁荣等级(zz)
	if zz<8000 then
	    return "无"
    elseif zz>=8000 then
	    return "初显"
    elseif zz>=25000 then
	    return "名门"
    elseif zz>=35000 then
	    return "鼎盛"
    elseif zz>=45000 then
	    return "泰山北斗"
    elseif zz>=50000 then
	    return "天下盟主"
	end
end

function 场景类_帮派界面:初始化(根)
	self.ID = 28
	self.x = 187
	self.y = 70
	self.xx = 0
	self.yy = 0
	self.注释 = "帮派界面"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
    self.本类开关=false
    tp=根
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,594,410,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 自适应.创建(7,1,1,1,1,3,nil,18), --名称显示底图
		[4] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"  基 础"),
		[5] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"  成 员"),
		[6] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"  统 计"), --统 计
		[7] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"  技 能"),
		[8] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"  建 筑"),
		[9] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"  联 赛"),
		[10] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"申请列表"),
		[11] =自适应.创建(4,1,1,1,3,nil),
		[12] =资源:载入('pic/fenge.png',"图片"), --分割条
		[13] =资源:载入('pic/fenge.png',"图片"), --职位底图
		[14] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"堂务管理"),
		[15] = 按钮(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"逐出帮众"), --这个改改
		[16] = 按钮(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"脱离帮派"),
		[17] =资源:载入('pic/bp/jn.png',"图片"),
		[18] =资源:载入('pic/bp/jz.png',"图片"),
		[19] =资源:载入('pic/bp/liansai.png',"图片"),
		[20] =自适应.创建(41,4,15,40,2,3,nil),--竖条
		[21] = 按钮(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,"同意申请"),
		[22] = 按钮(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"清空列表"),
		[23] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,261,2), --界面2滑块 (文件,数量,终点x,终点y,方式)
		[24] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,261,2), --界面3滑块 (文件,数量,终点x,终点y,方式)
		[25] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,314,2), --界面4滑块
		[26] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,86,2), --界面4修炼滑块
		[27] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,134,2), --界面5建筑滑块
		[28] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,259,2), --界面6申请滑块
		[29] = 按钮(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"研究技能"),
		[30] = 按钮(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"提升等级"),
		[31] = 按钮(自适应.创建(17,4,75,22,1,3),0,0,4,true,true,"  研 究"),
		[32] = 按钮(自适应.创建(17,4,101,22,1,3),0,0,4,true,true,"提升帮派规模"),
		[33] = 资源:载入('common/wzife.wdf',"网易WDF动画",824286013),
		-- [34] =资源:载入('pic/bp/dt.png',"图片"),
	}
	for n=4,10 do
		self.资源组[n]:绑定窗口_(self.ID)
		if n~=10 then
		    self.资源组[n]:置偏移(-3,0)
		end
	end
	 -- self.资源组[32]:置偏移(0,0)
	for n=14,16 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	for n=21,22 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	for n=23,28 do
		self.资源组[n]:置起始点(0)
	end
	for n=29,32 do
		self.资源组[n]:绑定窗口_(self.ID)
	end

	self.本类进程 = 1
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.华康15粗
	-- zts2 = tp.字体表.帮派字体
	zts3 = tp.字体表.普通字体__

	self.数据 = {}
	self.介绍文本 = 根._丰富文本(130,150)
	self.技能丰富文本 =  根._丰富文本(210,100)
	-- self.加入= 0
end

function 场景类_帮派界面:打开(数据)
	if self.可视 then
		self.介绍文本:清空()
		self.技能丰富文本:清空()
		-- self.帮派名称:置可视(false,false)
		-- self.帮派宗旨:置可视(false,false)
		self.本类进程 = 1
		self.加入= 0
		self.修炼选中= 0
		self.在线选中=0
		self.离线选中=0
		self.技能选中=0
		self.建筑选中=0
		self.申请选中=0
		for n=23,24 do
			self.资源组[n]:置起始点(0)
		end
		self.在线玩家 = {}
	    self.离线玩家 = {}
	    self.帮派技能 = {}
		self.修炼技能 = {}
		self.建筑情况 = {}
		self.权限= 0
		self.数据 = nil
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.数据 = 数据
		self.权限 = 0
	    self.加入= 0
	    self.修炼选中= 0
	    self.在线选中=0
		self.离线选中=0
		self.技能选中=0
		self.建筑选中=0
		self.申请选中=0
	    --要先拷贝一份帮派成员数据，自己排在前面--接下来是官职排序，接下来是在线玩家
        self.在线玩家 = {}
	    for i ,v in pairs(self.数据.成员数据) do
	    	if v.id==tp.队伍[1].数字id then
	    		self.权限 = v.权限
	    		v.权限 = v.权限+100 --给玩家自己赋值一个最大的权限，排第一
	    		self.在线玩家[#self.在线玩家+1]=v
	    	else
	    		if v.职务~="帮众" then
	    		    self.在线玩家[#self.在线玩家+1]=v
    		    else
    		    	if v.在线 then
    		    	    self.在线玩家[#self.在线玩家+1]=v
    		    	end
	    		end
	    	end
	    end
	    table.sort(self.在线玩家, function(a, b) return a.权限 > b.权限 end)
        self.离线玩家 = {}
	    for i ,v in pairs(self.数据.成员数据) do
	    	if v.在线==false then
	    	    self.离线玩家[#self.离线玩家+1]=v
	    	end
	    end
	    table.sort(self.离线玩家, function(a, b) return a.离线时间 < b.离线时间 end)

	    self.帮派技能 = {}
	    for k,v in pairs(self.数据.技能数据) do
	    	self.帮派技能[#self.帮派技能+1] = v
	    	self.帮派技能[#self.帮派技能].名称 = k
	    end
	    self.修炼技能 = {}
	    for k,v in pairs(self.数据.修炼数据) do
	    	self.修炼技能[#self.修炼技能+1] = v
	    	self.修炼技能[#self.修炼技能].名称 = k
	    end
	    self.建筑情况 = {}
	    for k,v in pairs(self.数据.帮派建筑) do
	    	self.建筑情况[#self.建筑情况+1] = v
	    	self.建筑情况[#self.建筑情况].名称 = k
	    end
		self.介绍文本:清空()
		self.介绍文本:添加文本("#N/"..self.数据.帮派公告)
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间

	    self.可视 = true
	end
	数据=nil
end

function 场景类_帮派界面:更新数据(内容)
	if 内容.类型=="任命职位" then
		self.数据.成员数据=内容.成员数据
	    self.在线玩家 = {}
	    for i ,v in pairs(self.数据.成员数据) do
	    	if v.id==tp.队伍[1].数字id then
	    		self.权限 = v.权限
	    		v.权限 = v.权限+100 --给玩家自己赋值一个最大的权限，排第一
	    		self.在线玩家[#self.在线玩家+1]=v
	    	else
	    		if v.职务~="帮众" then
	    		    self.在线玩家[#self.在线玩家+1]=v
    		    else
    		    	if v.在线 then
    		    	    self.在线玩家[#self.在线玩家+1]=v
    		    	end
	    		end
	    	end
	    end
	    table.sort(self.在线玩家, function(a, b) return a.权限 > b.权限 end)
	elseif 内容.类型=="逐出帮派" then
		self.数据.成员数据=内容.成员数据
		self.离线玩家 = {}
	    for i ,v in pairs(self.数据.成员数据) do
	    	if v.在线==false then
	    	    self.离线玩家[#self.离线玩家+1]=v
	    	end
	    end
	    table.sort(self.离线玩家, function(a, b) return a.离线时间 < b.离线时间 end)
    elseif 内容.类型=="修改内政" then
    	self.数据.当前内政=内容.当前内政
	elseif 内容.类型=="提升规模" then
		self.数据.帮派规模=内容.帮派规模
		self.数据.帮派资金.上限=内容.帮派资金
		self.数据.帮派资材.上限=内容.资材上限
		self.数据.成员数量.上限=内容.成员上限
		self.数据.当前维护费=内容.维护费
	end
end
function 场景类_帮派界面:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)--关闭
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"帮 派")

	for i=1,7 do
    	self.资源组[i+3]:更新(x,y)
    	self.资源组[i+3]:显示(self.x+10+83*(i-1),self.y+30,nil,nil,nil,self.本类进程 == i,2) --按钮
    end
    if #self.数据.申请人员>0 then
       self.资源组[33]:更新(dt)
       self.资源组[33]:显示(self.x+575,self.y+38) --白框
    end
    -- ,nil,true,nil,self.点击类型=="道具",2)
    if self.资源组[2]:事件判断() then --关闭
        self:打开()
    elseif self.资源组[4]:事件判断() then --基础界面
    	self.本类进程 = 1
    elseif self.资源组[5]:事件判断() then --成员界面
    	self.本类进程 = 2
    elseif self.资源组[6]:事件判断() then --统计界面 --暂无
    	self.本类进程 = 3
    elseif self.资源组[7]:事件判断() then --技能界面
    	self.本类进程 = 4
    elseif self.资源组[8]:事件判断() then --建筑界面
    	self.本类进程 = 5
    elseif self.资源组[9]:事件判断() then --联赛
    	self.本类进程 = 6
    elseif self.资源组[10]:事件判断() then --申请列表
    	self.本类进程 = 7
    end

    if self.本类进程 == 1 then --基础界面
    	self.资源组[11]:置宽高(557,132)
        self.资源组[11]:显示(self.x+18,self.y+267) --白框
        self.资源组[3]:置宽高(100,22)
	    local 行数 = 0
	    local 列数 = 0
	    zts:置颜色(白色)
		for i=1,21 do
			self.资源组[3]:显示(self.x+86+195*行数,self.y+59+列数*30)
			zts:显示(self.x+86-68+195*行数,self.y+63+列数*30,bzgk[i])
			行数=行数+1
			if 行数==3 then
				行数 = 0
			    列数 = 列数 + 1
			end
		end
		self.介绍文本:显示(self.x+201-166,self.y+300)

		zts:置颜色(0xFF222222)
		---竖1
		zts:显示(self.x+96,self.y+63,self.数据.帮派名称)
		zts:显示(self.x+96,self.y+63+30,self.数据.帮派规模)
		zts:显示(self.x+96,self.y+63+30*2,self.数据.帮派编号)
		zts:显示(self.x+96,self.y+63+30*3,self.数据.创始人.名称)
		zts:显示(self.x+96,self.y+63+30*4,self.数据.现任帮主.名称)
		zts:显示(self.x+96,self.y+63+30*5,self.数据.成员数量.当前.."/"..self.数据.成员数量.上限) --需要有 成员数量上限
		zts:显示(self.x+96,self.y+63+30*6,取繁荣等级(self.数据.繁荣度))
		--竖2
		zts:置颜色(tos(tonumber(self.数据.帮派资金.当前))):显示(self.x+96+195,self.y+63,self.数据.帮派资金.当前)
		zts:置颜色(tos(tonumber(self.数据.储备金))):显示(self.x+96+195,self.y+63+30,self.数据.储备金)
		zts:置颜色(0xFF222222)
		zts:显示(self.x+96+195,self.y+63+30*2,self.数据.维护情况) --需要 维护情况
		zts:显示(self.x+96+195,self.y+63+30*3,"整点") -- 需要 维护时间
		zts:显示(self.x+96+195,self.y+63+30*4,self.数据.帮派资材.当前) -- 需要 目前资材
		zts:显示(self.x+96+195,self.y+63+30*5,self.数据.帮派资材.上限)  -- 需要 最大资材
		zts:显示(self.x+96+195,self.y+63+30*6,self.数据.掌控区域) -- 需要 掌控区域
		---竖3
		zts:显示(self.x+486,self.y+63,self.数据.敌对帮派.名称) --需要 敌对帮派
		zts:显示(self.x+486,self.y+63+30,self.数据.同盟帮派.名称) --需要 同盟帮派
		zts:显示(self.x+486,self.y+63+30*2,self.数据.安定度)
		zts:显示(self.x+486,self.y+63+30*3,self.数据.人气度)
		zts:显示(self.x+486,self.y+63+30*4,self.数据.行动力)
		zts:显示(self.x+486,self.y+63+30*5,self.数据.研究力) --需要有 研究力
		zts:显示(self.x+486,self.y+63+30*6,self.数据.繁荣度) --需要 繁荣等级

	elseif self.本类进程 == 2 then --成员界面 在线
		self.资源组[11]:置宽高(561,288)
        self.资源组[11]:显示(self.x+16,self.y+82) --白框
        self.资源组[20]:置宽高(14,262) --比 11  少 26的高度 多2的宽度
        self.资源组[20]:显示(self.x+563,self.y+108) --竖条

        zts:置颜色(白色)
        zts:显示(self.x+16,self.y+58,"帮派在线玩家和管理人员：")
        zts:显示(self.x+38+21+2,self.y+87,"名称")
        zts:显示(self.x+16+65+38+20,self.y+87,"等级")
        zts:显示(self.x+16+65+38+71+20,self.y+87,"ID")
        zts:显示(self.x+16+65+38+71+65+20+5,self.y+87,"门派")
        zts:显示(self.x+16+65+38+71+65+55+20+17,self.y+87,"职位")
        zts:显示(self.x+16+65+38+71+65+55+55+20+30,self.y+87,"贡献")
        zts:显示(self.x+16+65+38+71+65+55+55+75+20+40,self.y+87,"离线")
        self.资源组[12]:显示(self.x+132,self.y+82) --分割
        self.资源组[12]:显示(self.x+132+39,self.y+82)
        self.资源组[12]:显示(self.x+132+29+100,self.y+82)
        self.资源组[12]:显示(self.x+132+39+100+56,self.y+82)
        self.资源组[12]:显示(self.x+132+39+100+56+63,self.y+82)
        self.资源组[12]:显示(self.x+132+39+100+56+63+72,self.y+82)
	    self.资源组[14]:更新(x,y,self.权限 >=4,2)
    	self.资源组[14]:显示(self.x+340,self.y+379) --按钮 --15那个按钮暂时不要 成员申请
    	self.资源组[15]:更新(x,y,self.权限 >=4,2)
    	self.资源组[15]:显示(self.x+340+83*1,self.y+379) --按钮 踢出按钮
    	self.资源组[16]:更新(x,y)
    	self.资源组[16]:显示(self.x+340+83*2,self.y+379) --按钮 --15那个按钮暂时不要 成员申请

	    --滑块处理
	    self.加入 = 0
	    local cysl = #self.在线玩家
	    if cysl>8 then
	    	self.资源组[23]:置高度(min(math.floor(262/(cysl-8)),104,25))
		    self.加入 = min(ceil((cysl-8)*self.资源组[23]:取百分比()),cysl-8)
            self.资源组[23]:显示(self.x+565,self.y+108,x,y,self.鼠标)--滑块
        end
	    if self.资源组[11]:是否选中(x,y) then
	        if 引擎.取鼠标滚轮() ==-1 and self.加入 < cysl-8 then--and self.加入 < cysl then --往下滚动
	        	self.资源组[23]:置起始点(self.资源组[23]:取百分比转换(self.加入+1,8,cysl))
	        elseif 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then
	        	self.资源组[23]:置起始点(self.资源组[23]:取百分比转换(self.加入-1,8,cysl))
	        end
	    end
	    --滑块处理

	    for i=1,8 do
	    	if self.在线玩家[i+self.加入] ~= nil and not tp.消息栏焦点 then
	    		bw1:置坐标(self.x+13,self.y+89+i*31)
	    		if self.在线选中 ~= self.加入 + i then
	    			if bw1:检查点(x,y) then
	    				self.焦点=true
	    				box(self.x + 17,self.y+89+20+i*31, self.x + 544+18,self.y+89+18-26+i*31,-3551379)
	    				if 引擎.鼠标按住(0) and not tp.窗口.文本栏.可视 and not tp.窗口.对话栏.可视 then
							self.在线选中 = self.加入 + i
						end
	    			end
	    		else
	    			box(self.x + 17,self.y+89+20+i*31, self.x + 544+18,self.y+89+18-26+i*31,-9670988)
	    		end
	    		zts:置颜色(0xFF222222)
               --置样式(1)
	    		zts:显示(self.x+13+((118 - zts:取宽度(self.在线玩家[i+self.加入].名称))/2),self.y+89+i*31,self.在线玩家[i+self.加入].名称)--self.在线玩家[i+self.加入].名称
	    		zts:显示(self.x+16+65+38+15+((40 - zts:取宽度(self.在线玩家[i+self.加入].等级))/2),self.y+89+i*31,self.在线玩家[i+self.加入].等级)
	    		zts:显示(self.x+195,self.y+89+i*31,self.在线玩家[i+self.加入].id)
	    		zts:显示(self.x+260+((67 - zts:取宽度(self.在线玩家[i+self.加入].门派))/2),self.y+89+i*31,self.在线玩家[i+self.加入].门派)
	    		zts:显示(self.x+330+((64 - zts:取宽度(self.在线玩家[i+self.加入].职务))/2),self.y+89+i*31,self.在线玩家[i+self.加入].职务)
	    		zts:显示(self.x+391+((73 - zts:取宽度(self.在线玩家[i+self.加入].帮贡.当前))/2),self.y+89+i*31,self.在线玩家[i+self.加入].帮贡.当前)
	    		if self.在线玩家[i+self.加入].在线 then
	    			zts:置颜色(0xff009933)
	    			zts:显示(self.x+500,self.y+89+i*31,"在线")
    		    else
    		    	zts:显示(self.x+491,self.y+89+i*31,os.date("%m", self.在线玩家[i+self.加入].离线时间).. "-" .. os.date("%d", self.在线玩家[i+self.加入].离线时间))
	    		end
	    	end
	    end

	    if self.资源组[16]:事件判断() then
	        if self.权限 == 5 then
	            local 事件 = function()
	            发送数据(37)
	            self:打开()
		        end
	            tp.窗口.文本栏:载入("你现在是帮派的帮主，如果你退出帮派，#Y你的帮派会因此#R解散#W，请谨慎选择，你确定要退出帮派吗？",nil,true,事件)
	        else
	        	local 事件 = function()
	            发送数据(37.2)
	            self:打开()
		        end
	            tp.窗口.文本栏:载入("你真的要脱离帮派吗？",nil,true,事件)
	        end
        elseif self.资源组[14]:事件判断() then  --任命职位
        	if self.在线选中 == 0 then
				tp.常规提示:打开("#Y/请选择你要任命的玩家！")
			else
	        	local 选项信息 = {}
				if self.权限 == 5 then
					选项信息 = {"帮主","副帮主","左护法","右护法","长老","堂主","帮众","商人"}
				elseif self.权限 == 4 then
					选项信息 = {"左护法","右护法","长老","堂主","帮众","商人"}
				elseif self.权限 ==3 then
					选项信息 = {"长老","堂主","帮众","商人"}
				end
				if #选项信息>0 then
				    tp.窗口.对话栏:文本("男人_兰虎","帮派总管","请选中你要任命玩家#Y"..self.在线玩家[self.在线选中].名称.."#W的职位",选项信息)
				end
			end
		elseif self.资源组[15]:事件判断() and self.在线玩家[self.在线选中] then
    		if self.权限 >= 4 then
	            local 事件 = function()
	            发送数据(41,{对方数据=self.在线玩家[self.在线选中],类型="逐出帮派"}) --踢出帮派
	            self.在线选中 = 0
				self.加入 = 0
		        end
	            tp.窗口.文本栏:载入("你确定要将#Y"..self.在线玩家[self.在线选中].名称.."#R逐出帮派#W吗？",nil,true,事件)
	        end
	    end
	elseif self.本类进程 == 3 then --成员界面 离线
		self.资源组[11]:置宽高(561,288)
        self.资源组[11]:显示(self.x+16,self.y+82) --白框
        self.资源组[20]:置宽高(14,262) --比 11  少 26的高度
        self.资源组[20]:显示(self.x+563,self.y+108) --竖条

        zts:置颜色(白色)
        zts:显示(self.x+16,self.y+58,"帮派离线玩家：")
        zts:显示(self.x+38+21+2,self.y+87,"名称")
        zts:显示(self.x+16+65+38+20,self.y+87,"等级")
        zts:显示(self.x+16+65+38+71+20,self.y+87,"ID")
        zts:显示(self.x+16+65+38+71+65+20+5,self.y+87,"门派")
        zts:显示(self.x+16+65+38+71+65+55+20+17,self.y+87,"职位")
        zts:显示(self.x+16+65+38+71+65+55+55+20+30,self.y+87,"贡献")
        zts:显示(self.x+16+65+38+71+65+55+55+75+20+40,self.y+87,"离线")
        self.资源组[12]:显示(self.x+132,self.y+82) --分割
        self.资源组[12]:显示(self.x+132+39,self.y+82)
        self.资源组[12]:显示(self.x+132+29+100,self.y+82)
        self.资源组[12]:显示(self.x+132+39+100+56,self.y+82)
        self.资源组[12]:显示(self.x+132+39+100+56+63,self.y+82)
        self.资源组[12]:显示(self.x+132+39+100+56+63+72,self.y+82)

        --滑块处理
	    self.加入 = 0
	    local cysl = #self.离线玩家
	    if cysl>8 then
	    	self.资源组[24]:置高度(min(math.floor(262/(cysl-8)),104,25))
		    self.加入 = min(ceil((cysl-8)*self.资源组[24]:取百分比()),cysl-8)
            self.资源组[24]:显示(self.x+565,self.y+108,x,y,self.鼠标)--滑块
        end
	    if self.资源组[11]:是否选中(x,y) then
	        if 引擎.取鼠标滚轮() ==-1 and self.加入 < cysl-8 then--and self.加入 < cysl then --往下滚动
	        	self.资源组[24]:置起始点(self.资源组[24]:取百分比转换(self.加入+1,8,cysl))
	        elseif 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then
	        	self.资源组[24]:置起始点(self.资源组[24]:取百分比转换(self.加入-1,8,cysl))
	        end
	    end
	    --滑块处理
        zts:置颜色(0xFF222222)
	    for i=1,8 do
	    	if self.离线玩家[i+self.加入] ~= nil then
	    		bw1:置坐标(self.x+13,self.y+89+i*31)

	    		if self.离线选中 ~= self.加入 + i then
	    			if bw1:检查点(x,y) then
	    				self.焦点=true
	    				box(self.x + 17,self.y+109+i*31, self.x + 562,self.y+81+i*31,-3551379)
	    				if 引擎.鼠标按住(0) and not tp.窗口.文本栏.可视 and not tp.窗口.对话栏.可视 then
							self.离线选中 = self.加入 + i
						end
	    			end
	    		else
	    			box(self.x + 17,self.y+109+i*31, self.x + 562,self.y+81+i*31,-9670988)
	    		end
	    		zts:显示(self.x+13+((118 - zts:取宽度(self.离线玩家[i+self.加入].名称))/2),self.y+89+i*31,self.离线玩家[i+self.加入].名称)--self.离线玩家[i+self.加入].名称
	    		zts:显示(self.x+16+65+38+15+((40 - zts:取宽度(self.离线玩家[i+self.加入].等级))/2),self.y+89+i*31,self.离线玩家[i+self.加入].等级)
	    		zts:显示(self.x+195,self.y+89+i*31,self.离线玩家[i+self.加入].id)
	    		zts:显示(self.x+260+((67 - zts:取宽度(self.离线玩家[i+self.加入].门派))/2),self.y+89+i*31,self.离线玩家[i+self.加入].门派)
	    		zts:显示(self.x+330+((64 - zts:取宽度(self.离线玩家[i+self.加入].职务))/2),self.y+89+i*31,self.离线玩家[i+self.加入].职务)
	    		zts:显示(self.x+391+((73 - zts:取宽度(self.离线玩家[i+self.加入].帮贡.当前))/2),self.y+89+i*31,self.离线玩家[i+self.加入].帮贡.当前)
	    		zts:显示(self.x+491,self.y+89+i*31,os.date("%m", self.离线玩家[i+self.加入].离线时间).. "-" .. os.date("%d", self.离线玩家[i+self.加入].离线时间))
	    	end
	    end

        self.资源组[15]:更新(x,y,self.权限 >=4,2)
    	self.资源组[15]:显示(self.x+340+83*2,self.y+379) --按钮 踢出按钮
    	if self.资源组[15]:事件判断() and self.离线玩家[self.离线选中] then
    		if self.权限 >= 4 then
	            local 事件 = function()
	            发送数据(41,{对方数据=self.离线玩家[self.离线选中],类型="逐出帮派"}) --踢出帮派
	            self.离线选中 = 0
				self.加入 = 0
		        end
	            tp.窗口.文本栏:载入("你确定要将#Y"..self.离线玩家[self.离线选中].名称.."#R逐出帮派#W吗？",nil,true,事件)
	        end
    	end

    elseif self.本类进程 == 4 then --技能界面
    	self.资源组[17]:显示(self.x+370,self.y+60)
    	self.资源组[11]:置宽高(323,340)
    	self.资源组[11]:显示(self.x+11,self.y+60) --白框
    	self.资源组[20]:置宽高(14,314) --比 11  少 3的宽度 26的高度
        self.资源组[20]:显示(self.x+320,self.y+60+26) --竖条
    	self.资源组[3]:置宽高(150,22)
    	self.资源组[3]:显示(self.x+428,self.y+108) --白框
    	self.资源组[3]:显示(self.x+428,self.y+108+32) --白框
    	self.资源组[11]:置宽高(239,112)
    	self.资源组[11]:显示(self.x+345,self.y+287) --白框
    	self.资源组[20]:置宽高(14,86) --比 11  少 3的宽度 26的高度
        self.资源组[20]:显示(self.x+570,self.y+313) --竖条

    	zts:置颜色(白色)
    	zts:显示(self.x+38,self.y+68,"技能")
    	zts:显示(self.x+110,self.y+68,"当前等级")
    	zts:显示(self.x+195,self.y+68,"上限等级")
    	zts:显示(self.x+433,self.y+292,"修炼项目")
    	self.资源组[12]:显示(self.x+91,self.y+60) --分割
    	self.资源组[12]:显示(self.x+181,self.y+60) --分割
    	self.资源组[12]:显示(self.x+181+85,self.y+60) --分割
    	--技能项目
    	self.加入 = 0
    	local cysl = 16--#self.帮派技能
	    -- if cysl>10 then
	    	self.资源组[25]:置高度(min(math.floor(314/(cysl-10)),104,100))
	    	-- self.资源组[25]:置高度(80)
		    self.加入 = min(ceil((cysl-10)*self.资源组[25]:取百分比()),cysl-10)
            self.资源组[25]:显示(self.x+322,self.y+60+26,x,y,self.鼠标)--滑块
        -- end
        bw3:置坐标(self.x+13,self.y+91) --左边的技能栏 范围
        if bw3:检查点(x,y) then
        	if 引擎.取鼠标滚轮() ==-1 and self.加入 < cysl-10 then--and self.加入 < cysl then --往下滚动
	        	self.资源组[25]:置起始点(self.资源组[25]:取百分比转换(self.加入+1,10,cysl))
	        elseif 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then
	        	self.资源组[25]:置起始点(self.资源组[25]:取百分比转换(self.加入-1,10,cysl))
	        end
        end

    	zts:置颜色(0xFF222222)
    	zts:置样式(1)
    	for i=1,10 do
    		if self.帮派技能[i+self.加入] ~= nil then
    			bw2:置坐标(self.x+13,self.y+65+i*31)
				if self.技能选中 ~= self.加入 + i then
	    			if bw2:检查点(x,y) then
	    				self.焦点=true
	    				box(self.x + 13,self.y+65+22+i*31, self.x + 297+23,self.y+65+18-24+i*31,-3551379)--画线
	    				if 引擎.鼠标按住(0) then
							self.技能选中 = self.加入 + i
						end
	    			end
	    		else
	    			box(self.x + 13,self.y+65+22+i*31, self.x + 297+23,self.y+65+18-24+i*31,-9670988)
	    		end
	    		zts:显示(self.x+38+15,self.y+65+i*31,self.帮派技能[i+self.加入].名称)
	    		zts:显示(self.x+122+17,self.y+65+i*31,self.帮派技能[i+self.加入].当前)
	    		zts:显示(self.x+207+17,self.y+65+i*31,self.帮派技能[i+self.加入].上限)
    		end
    	end
    	--技能项目
    	zts:置样式(0)
    	--修炼项目
    	self.修炼加入=0
    	--滑块
    	local cysl = 4--#self.帮派技能
    	self.资源组[26]:置高度(min(math.floor(314/(cysl-3)),65))
	    self.加入 = min(ceil((cysl-3)*self.资源组[26]:取百分比()),cysl-3)
        self.资源组[26]:显示(self.x+572,self.y+313,x,y,self.鼠标)--滑块
        bw4:置坐标(self.x+346,self.y+313)
        if bw4:检查点(x,y) then
        	if 引擎.取鼠标滚轮() ==-1 and self.修炼加入 < cysl-3 then--往下滚动
	        	self.资源组[26]:置起始点(self.资源组[26]:取百分比转换(self.修炼加入+1,3,cysl))
	        elseif 引擎.取鼠标滚轮() ==1 and self.修炼加入 > 0 then
	        	self.资源组[26]:置起始点(self.资源组[26]:取百分比转换(self.修炼加入-1,3,cysl))
	        end
        end

    	for i=1,3 do
    		if self.修炼技能[i+self.修炼加入] ~= nil then
	    		zts:显示(self.x+387-29,self.y+287+i*31,self.修炼技能[i+self.修炼加入].名称)
    		end
    	end
    	--修炼项目
    	zts1:置颜色(白色)
    	zts1:置样式(1)
    	zts1:显示(self.x+384,self.y+112,"研究经验")
    	zts1:显示(self.x+384,self.y+144,"升级经验")
    	if self.帮派技能[self.技能选中] then
    	    zts1:显示(self.x+472,self.y+16+51,self.帮派技能[self.技能选中].名称)
    	    zts1:置样式(0)
    	    zts1:置颜色(黑色):显示(self.x+442,self.y+112,29852)  --取研究经验.研究经验
    	    zts1:置颜色(黑色):显示(self.x+442,self.y+144,654545) --取研究经验.升级经验
    	    self.技能丰富文本:清空()
    	    self.技能丰富文本:添加文本("#G/"..qjn(self.帮派技能[self.技能选中].名称)[1])
    	    self.技能丰富文本:显示(self.x+384-32,self.y+170)
    	end
    	if self.权限>=4 then
    	    self.资源组[29]:更新(x,y)
	    	self.资源组[29]:显示(self.x+425,self.y+258)--研究技能
	    	self.资源组[30]:更新(x,y)
	    	self.资源组[30]:显示(self.x+508,self.y+258) --提升等级
	    	if self.资源组[30]:事件判断() or self.资源组[29]:事件判断() then  --研究改成扣除 帮派资金 --测试模式
	    	    tp.常规提示:打开("#Y/当前帮派技能满级无需研究！")
	    	end
    	end
    elseif self.本类进程 == 5 then --建筑界面

		self.资源组[18]:显示(self.x+13,self.y+56)
		self.资源组[11]:置宽高(243,160)
    	self.资源组[11]:显示(self.x+337,self.y+70) --白框
    	self.资源组[20]:置宽高(14,134) --比 11  少 3的宽度 26的高度
        self.资源组[20]:显示(self.x+566,self.y+96) --竖条
    	self.资源组[3]:置宽高(149,22)
    	zts1:置颜色(白色)
    	zts1:置样式(0)
    	for i=1,4 do
    	zts1:显示(self.x+337,self.y+241+35*(i-1),bpbb[i])
    	self.资源组[3]:显示(self.x+432,self.y+237+35*(i-1)) --白框
    	end
    	zts:显示(self.x+427,self.y+75,"建筑项目")
    	zts:置颜色(黑色)
		zts:显示(self.x+88,self.y+70,self.数据.帮派建筑.金库.数量)
		zts:显示(self.x+243,self.y+70,self.数据.物价指数)
		zts:显示(self.x+88,self.y+71+39,self.数据.帮派建筑.书院.数量)
		zts:显示(self.x+243,self.y+71+39,5)--self.数据.修理指数
		zts:显示(self.x+88,self.y+71+39*2,self.数据.帮派建筑.兽室.数量)--兽室数
		zts:显示(self.x+243,self.y+71+39*2,150)--守护兽等级
		zts:显示(self.x+88,self.y+71+39*3,self.数据.帮派建筑.厢房.数量)
		zts:显示(self.x+243,self.y+71+39*3,"21:00开启")
		zts:显示(self.x+88,self.y+71+39*4,self.数据.帮派建筑.药房.数量)
		zts:显示(self.x+243,self.y+71+39*4,self.数据.当前内政)
		zts:显示(self.x+88,self.y+71+39*5,self.数据.帮派建筑.仓库.数量)
		zts:显示(self.x+243,self.y+71+39*5,0) --百谷草
		zts:显示(self.x+88,self.y+71+39*6,self.数据.药品增加量)
		zts:显示(self.x+243,self.y+71+39*6,0)--藏宝室
		zts:显示(self.x+88,self.y+71+39*8-20,self.数据.当前维护费)
        self.加入=0
        local cysl = #self.建筑情况
    	self.资源组[27]:置高度(min(math.floor(134/(cysl-4))))
	    self.加入 = min(ceil((cysl-4)*self.资源组[27]:取百分比()),cysl-4)
        self.资源组[27]:显示(self.x+568,self.y+96,x,y,self.鼠标)--滑块

        if self.资源组[11]:是否选中(x,y) then
        	if 引擎.取鼠标滚轮() ==-1 and self.加入 < cysl-4 then--and self.加入 < cysl then --往下滚动
	        	self.资源组[27]:置起始点(self.资源组[27]:取百分比转换(self.加入+1,4,cysl))
	        elseif 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then
	        	self.资源组[27]:置起始点(self.资源组[27]:取百分比转换(self.加入-1,4,cysl))
	        end
        end
		for i=1,4 do
    		if self.建筑情况[i+self.加入] ~= nil then
    			bw2:置坐标(self.x+13+325,self.y+65+12+i*31)
				if self.建筑选中 ~= self.加入 + i then
	    			if bw2:检查点(x,y) then
	    				self.焦点=true
	    				box(self.x + 13+325,self.y+65+22+13+i*31, self.x + 297+23+246,self.y+65+18-24+13+i*31,-3551379)--画线
	    				if 引擎.鼠标按住(0) then
							self.建筑选中 = self.加入 + i --等会儿给每个建筑选中 区分开
						end
	    			end
	    		else
	    			box(self.x + 13+325,self.y+65+22+13+i*31, self.x + 297+23+246,self.y+65+18-24+13+i*31,-9670988)
	    		end

	    		zts:置颜色(0xFF222222):显示(self.x+353,self.y+81+i*31,self.建筑情况[i+self.加入].名称)
	    		if self.数据.当前内政==self.建筑情况[i+self.加入].名称 then
	    		    zts:置颜色(0xff009933):显示(self.x+496,self.y+81+i*31,"研究中")
	    		end
    		end
		end

		if self.权限>=4 then
    	    self.资源组[31]:更新(x,y)
	    	self.资源组[31]:显示(self.x+425-25,self.y+258+117)--研究
	    	self.资源组[32]:更新(x,y)
	    	self.资源组[32]:显示(self.x+508-25,self.y+258+117) --提升规模
	    end
	    zts:置颜色(黑色)
		if self.建筑情况[self.建筑选中] then
			zts:显示(self.x+535-91,self.y+242,self.建筑情况[self.建筑选中].当前经验)
		    zts:显示(self.x+535-91,self.y+242+35,帮派建筑升级经验[self.建筑情况[self.建筑选中].数量])
		    zts:显示(self.x+535-91,self.y+242+35*2,0)
		    zts:显示(self.x+535-91,self.y+242+35*3,0)
	    	if self.资源组[31]:事件判断() then --研究
	    	    发送数据(42,self.建筑情况[self.建筑选中])
	    	end
		end
		if self.资源组[32]:事件判断() then --提升规模
    		发送数据(43)
    	end

    elseif self.本类进程 == 6 then --联赛
    	self.资源组[19]:显示(self.x+18,self.y+57)
    elseif self.本类进程 == 7 then --申请列表
    	self.资源组[11]:置宽高(561,285)
        self.资源组[11]:显示(self.x+16,self.y+82) --白框
        self.资源组[20]:置宽高(14,259) --比 11  少 26的高度
        self.资源组[20]:显示(self.x+563,self.y+108) --竖条
        zts:置颜色(白色)
        zts:显示(self.x+16,self.y+58,"成员申请：")
        zts:显示(self.x+38+21,self.y+87,"名称")
        zts:显示(self.x+16+65+38+20+30,self.y+87,"ID")
        zts:显示(self.x+16+65+38+71+20+40,self.y+87,"等级")
        zts:显示(self.x+16+65+38+71+65+20+10+60,self.y+87,"门派")
        zts:显示(self.x+16+65+38+71+65+55+20+20+100,self.y+87,"申请时间")

        self.资源组[12]:显示(self.x+128,self.y+82) --分割
        self.资源组[12]:显示(self.x+218,self.y+82) --分割
        self.资源组[12]:显示(self.x+316,self.y+82) --分割
        self.资源组[12]:显示(self.x+404,self.y+82) --分割

	    --滑块处理
	    self.加入 = 0
	    local cysl = #self.数据.申请人员
	    if cysl>8 then
	    	self.资源组[28]:置高度(min(math.floor(262/(cysl-8)),104,25))
		    self.加入 = min(ceil((cysl-8)*self.资源组[28]:取百分比()),cysl-8)
            self.资源组[28]:显示(self.x+565,self.y+108,x,y,self.鼠标)--滑块
        end
	    if self.资源组[11]:是否选中(x,y) then
	        if 引擎.取鼠标滚轮() ==-1 and self.加入 < cysl-8 then--and self.加入 < cysl then --往下滚动
	        	self.资源组[28]:置起始点(self.资源组[28]:取百分比转换(self.加入+1,8,cysl))
	        elseif 引擎.取鼠标滚轮() ==1 and self.加入 > 0 then
	        	self.资源组[28]:置起始点(self.资源组[28]:取百分比转换(self.加入-1,8,cysl))
	        end
	    end
	    --滑块处理
	    for i=1,8 do
	    	if self.数据.申请人员[i+self.加入] ~= nil and not tp.消息栏焦点 then
	    		bw1:置坐标(self.x+13,self.y+89+i*31)

	    		if self.申请选中 ~= self.加入 + i then
	    			if bw1:检查点(x,y) then
	    				self.焦点=true
	    				box(self.x + 17,self.y+109+i*31, self.x + 562,self.y+81+i*31,-3551379)
	    				if 引擎.鼠标按住(0) then
							self.申请选中 = self.加入 + i
						end
	    			end
	    		else
	    			box(self.x + 17,self.y+109+i*31, self.x + 562,self.y+81+i*31,-9670988)
	    		end
	    		zts:置颜色(0xFF222222)
               --置样式(1)
	    		zts:显示(self.x+13+((118 - zts:取宽度(self.数据.申请人员[i+self.加入].名称))/2),self.y+89+i*31,self.数据.申请人员[i+self.加入].名称)--self.数据.申请人员[i+self.加入].名称
	    		zts:显示(self.x+153,self.y+89+i*31,self.数据.申请人员[i+self.加入].数字id)
	    		zts:显示(self.x+251-11+((40 - zts:取宽度(self.数据.申请人员[i+self.加入].等级))/2),self.y+89+i*31,self.数据.申请人员[i+self.加入].等级)
	    		zts:显示(self.x+348-23+((67 - zts:取宽度(self.数据.申请人员[i+self.加入].门派))/2),self.y+89+i*31,self.数据.申请人员[i+self.加入].门派)
	    		zts:显示(self.x+468-7,self.y+89+i*31,os.date("%m", self.数据.申请人员[i+self.加入].申请时间).. "-" .. os.date("%d", self.数据.申请人员[i+self.加入].申请时间))
	    	end
	    end
	    if self.权限>=3 then
	        for i=1,2 do
		    	self.资源组[i+20]:更新(x,y)
		    	self.资源组[i+20]:显示(self.x+340+83*i,self.y+379) --按钮
		    end
		    if self.资源组[21]:事件判断() then --同意申请
	    	    if self.申请选中~=0 then
	    	        发送数据(41,{对方数据=self.数据.申请人员[self.申请选中],类型="同意加入"})
					table.remove(self.数据.申请人员,self.申请选中)
					self.申请选中 = 0
					self.加入 = 0
	    	    end
	    	elseif self.资源组[22]:事件判断() then --清空申请列表
	    		if #self.数据.申请人员>0 then
	    		    self.数据.申请人员={}
		    		self.申请选中 = 0
					self.加入 = 0
					发送数据(40)
	    		end
	    	end
	    end
    end
	-- if self.资源组[20]:事件判断() then
	-- 	tp.窗口.帮派管理:打开(self.数据.成员数据,self.数据.申请人员,self.数据.帮派编号)
	-- elseif self.资源组[21]:事件判断() then
	-- 	--tp.窗口.修炼升级:打开()
	-- end
	-- if self.资源组[7]:事件判断() then
	-- 	self:打开()
	-- end
end

function 场景类_帮派界面:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_帮派界面:初始移动(x,y)
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

function 场景类_帮派界面:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_帮派界面