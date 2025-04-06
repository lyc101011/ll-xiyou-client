-- @Author: baidwwy
-- @Date:   2024-09-11 20:07:40
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 16:33:40
-- @Author: baidwwy
-- @Date:   2024-02-16 22:28:46
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-30 22:27:57
local 场景类_剑会房间列表 = class()
local qmx = 引擎.取模型
local tp,jhzts
local insert = table.insert
local tx = 引擎.取头像
local fjbt={"编号","房主名称","等级","门派","房主积分","人数","状态"}
local fjbtxy={15,106,197,260,323,391,444}
local srk={"设置密码","密码输入"}
local dwjsxy={[1]={x=214,y=117},[2]={x=214,y=117},[3]={x=214,y=117},[4]={x=214,y=117},[5]={x=214,y=117}}

function 场景类_剑会房间列表:初始化(根)
	self.ID = 190
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "剑会房间列表"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	jhzts = tp.字体表.普通字体
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('剑会总控件')
	总控件:置可视(true,true)
	self.输入框={}
	for n=1,#srk do
		self.输入框[srk[n]] = 总控件:创建输入(srk[n],0,0,100,14)
		self.输入框[srk[n]]:置可视(false,false)
		self.输入框[srk[n]]:置限制字数(8)
		self.输入框[srk[n]]:置文本("")
		self.输入框[srk[n]]:置光标颜色(-16777216)
		self.输入框[srk[n]]:置文字颜色(-16777216)
	end
end

function 场景类_剑会房间列表:关闭()
	self.界面=nil
	self.房间列表=nil
	self.资源组 = nil
	self.队伍数据=nil
	self.我方头像=nil
	self.敌方头像=nil
	self.选中人物=nil
	self.建房打勾=nil
	self.我的房间=nil
	self.我的模型=nil
	self.房间总数=nil
	self.页数=nil
	for n=1,#srk do
		self.输入框[srk[n]]:置焦点(false)
	    self.输入框[srk[n]]:置可视(false,false)
    end
	self.可视 = false
	return
end

function 场景类_剑会房间列表:打开(内容)
	if self.可视 then
		self:关闭()
		return
	else
		insert(tp.窗口_,self)
        self:加载资源()
        self.界面=1
        self.页数=1
        self:刷新房间列表(内容)
		self.x = (全局游戏宽度/2)-313
		self.y = (全局游戏高度/2)-160
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_剑会房间列表:加载资源()
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local 资源 = tp.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,579,426,3,9),
		[2] = 自适应.创建(76,1,534,342,3,9),
		[3] = 资源:载入('小黄锁.png',"图片"),
		[4] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true), --打钩框
		[5] = 自适应.创建(4,1,555,330,3,9), --房间列表白底
		[6] = 资源:载入('smap.wdf',"网易WDF动画",0xDF6D2B20), --创建房间白底
		[7] = 自适应.创建(40,1,118,19,1,3), --输入框底
		[8] = 自适应.创建(76,1,551,154,3,9), --房间黑底
		[9] = 资源:载入('wzife.wdf',"网易WDF动画",0x183DC759), --旗子
		[10] = 资源:载入('wzife.wdf',"网易WDF动画",0x3B3D19C0), --准备 5F6D37B8.was 32BE710D.was 131AF602.was
	}
	self.按钮组 = {
		[1] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"创建房间"),
		[2] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"确认创建"),
		[3] = 按钮.创建(自适应.创建(12,4,59,22,1,3),0,0,4,true,true,"上一页"),
		[4] = 按钮.创建(自适应.创建(12,4,59,22,1,3),0,0,4,true,true,"下一页"),
		[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"快速组队"),
		[6] = 按钮.创建(自适应.创建(12,4,87,22,1,3),0,0,4,true,true,"玩家排行榜"),
		[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"返回主页"),
		[8] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"退出房间"),
		[9] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"准备游戏"),
		[10] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x81DD40D3),0,0,3,true,true),
	}
	self.进入按钮组 = {}
	for n=1,10 do
		self.进入按钮组[n] = 按钮.创建(自适应.创建(12,4,56,22,1,3),0,0,4,true,true," 进入")
		self.进入按钮组[n]:绑定窗口_(self.ID)
	end
	for n=1,#self.按钮组 do
		self.按钮组[n]:绑定窗口_(self.ID)
	end
	self.房间列表={}
	self.队伍数据={}
	self.我方头像={}
	self.敌方头像={}
	self.选中人物=0
	self.建房打勾=false
	self.我的房间=false
	local abq = qmx(tp.队伍[1].模型)
	self.我的模型 = 资源:载入(abq[3],"网易WDF动画",abq[1])
	for n=1,#srk do
		self.输入框[srk[n]]:置文本("")
    end
	self.资源组[4]:置打勾框(self.建房打勾)
	self.资源组[4]:绑定窗口_(self.ID)
end

---------------------------------------------------------------界面显示
function 场景类_剑会房间列表:显示(dt,x,y)
	---------------------
	-- 素材位置调整()
	-- ax=AFCHX
	-- ay=AFCHY
	-- self.资源组[1] = tp._自适应.创建(0,1,ax,ay,3,9)
	---------------------
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	if tp.当前地图 ~= 6136 then
		self:关闭()
		return
	end
	-- self.资源组[2]:显示(self.x+14,self.y+47)
	local btwz="房间列表"
	if self.界面 == 1 then
		self.输入框["设置密码"]:置可视(false,false)
		self:显示_主界面(dt,x,y)
	elseif self.界面 == 2 then
		btwz="创建房间"
		self:显示_创建房间(dt,x,y)
	elseif self.界面 == 3 then
		btwz="我的房间"
		self.输入框["设置密码"]:置可视(false,false)
		self:显示_我的房间(dt,x,y)
	end
	jhzts:置颜色(黄色):显示(self.x+259,self.y+3,btwz)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	-- jhzts:置颜色(白色)
end

function 场景类_剑会房间列表:显示_主界面(dt,x,y)
	-- jhzts:置颜色(黑色) --这勾八端只能每个都置颜色
	self.资源组[5]:显示(self.x+12,self.y+50)
	for n=1,7 do
		jhzts:置颜色(黑色):显示(self.x+fjbtxy[n],self.y+56,fjbt[n])
	end
	self.按钮组[1]:更新(x,y)
	self.按钮组[3]:更新(x,y)
	self.按钮组[4]:更新(x,y)
	self.按钮组[5]:更新(x,y)
	for n=1,10 do
		self.进入按钮组[n]:更新(x,y)
	end
	self.按钮组[6]:显示(self.x+48,self.y+390)
	self.按钮组[3]:显示(self.x+192,self.y+390)
	local 房间总页 = math.ceil(self.房间总数/10)
	if 房间总页 <= 0 then 房间总页 = 1 end
	jhzts:置颜色(白色):显示(self.x+266,self.y+393,self.页数 .."/" ..房间总页)
	self.按钮组[4]:显示(self.x+300,self.y+390)
	self.按钮组[5]:显示(self.x+406,self.y+390)
	self.按钮组[1]:显示(self.x+496,self.y+390)
	local 缩放x,缩放y = nil,nil
	local lba = (self.页数-1)*10
	for n=1,10 do
		if self.房间列表[n+lba]~=nil then
			local yy=(n-1)*30
	        if self.房间列表[n+lba].头像.宽度 > 18 then
	            缩放x,缩放y = 等比例缩放公式(18,18,self.房间列表[n+lba].头像.宽度 , self.房间列表[n+lba].头像.高度)
	        end
	        jhzts:置颜色(黑色):显示(self.x+21,self.y+54+31+yy,self.房间列表[n+lba].房间编号)
	        if self.房间列表[n+lba].房间密码 then
				self.资源组[3]:显示(self.x+46,self.y+55+31+yy) --锁
			end
			self.房间列表[n+lba].头像:显示(self.x+79,self.y+50+31+yy,缩放x,缩放y)
			jhzts:置颜色(黑色):显示(self.x+101,self.y+54+31+yy,self.房间列表[n+lba].名称)
			jhzts:置颜色(黑色):显示(self.x+198,self.y+54+31+yy,self.房间列表[n+lba].等级)
			jhzts:置颜色(黑色):显示(self.x+247,self.y+54+31+yy,self.房间列表[n+lba].门派)
			-- jhzts:显示(self.x+370,self.y+58+yy,self.房间列表[n].胜率)
			jhzts:置颜色(黑色):显示(self.x+332,self.y+54+31+yy,self.房间列表[n+lba].房主积分)
			jhzts:置颜色(黑色):显示(self.x+395,self.y+54+31+yy,self.房间列表[n+lba].人数 .."/5")
			self.进入按钮组[n]:显示(self.x+501,self.y+81+yy)
			if self.房间列表[n+lba].zhandou ~= 0 then
				jhzts:置颜色(黑色):显示(self.x+438,self.y+54+31+yy,"战斗中")
			else
			    jhzts:置颜色(黑色):显示(self.x+438,self.y+54+31+yy,"等待中")
			end
			if self.进入按钮组[n]:事件判断() then
				if tp.队伍[1].数字id == self.房间列表[n+lba].队长id then
					发送数据(400,{操作="我的房间"})
				elseif self.房间列表[n+lba].房间密码 then
					if not tp.窗口.剑会房间密码.可视 then
						tp.窗口.剑会房间密码:打开(self.房间列表[n+lba],self.x,self.x)
					end
				else
					发送数据(400,{操作="加入房间",房间编号=self.房间列表[n+lba].房间编号})
				end
			end
		end
	end
	if self.按钮组[1]:事件判断() then
		if self.我的房间 then
			发送数据(400,{操作="我的房间"})
		else
           self.界面=2
        end
    elseif self.按钮组[3]:事件判断() then
        self.页数 = self.页数 - 1
        if self.页数 <= 0 then self.页数 = 1 end
    elseif self.按钮组[4]:事件判断() then
        self.页数 = self.页数 + 1
        if self.页数 > 房间总页 then self.页数 = 房间总页 end
    elseif self.按钮组[5]:事件判断() then
        发送数据(400,{操作="快速组队"})
	end
	-------------------------测试用
	-- for n=1,10 do
	-- 	local yy=(n-1)*30
	-- 	jhzts:置颜色(黑色):显示(self.x+101,self.y+54+30+yy,"测试用" ..n)
 --    end
	-------------------------
end

function 场景类_剑会房间列表:显示_创建房间(dt,x,y)
	self.资源组[6]:显示(self.x+19,self.y+39)
	if self.建房打勾 then
		sfxyma = "需要密码："
	else
	    sfxyma = "无需密码："
	end
	jhzts:置颜色(白色):显示(self.x+180-142,self.y+160+224,sfxyma) --111
	self.我的模型:更新(dt)
	self.我的模型:显示(self.x+275,self.y+224)
	self.按钮组[2]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.按钮组[7]:更新(x,y)
	self.按钮组[10]:更新(x,y)
	self.资源组[7]:显示(self.x+246-142,self.y+157+224) --111
	self.按钮组[2]:显示(self.x+233,self.y+380)
	self.按钮组[7]:显示(self.x+496,self.y+380)
	self.资源组[4]:显示(self.x+154-142,self.y+156+224,true,nil,nil,self.建房打勾,2) --11
	self.按钮组[10]:显示(self.x+554,self.y-4)
	self.输入框["设置密码"]:置可视(true,true)
	self.输入框["设置密码"]:置坐标(self.x+112,self.y+384)
	if self.按钮组[2]:事件判断() then
		if self.建房打勾 and string.len(self.输入框["设置密码"]:取文本()) < 6 then
			tp.常规提示:打开("#Y/设置的房间密码不可少于6位")
		elseif not self.建房打勾 and self.输入框["设置密码"]:取文本()~="" then
			tp.常规提示:打开("#Y/你输入了密码但未勾选")
		else
	        发送数据(400,{操作="创建房间",建房打勾=self.建房打勾,建房密码=self.输入框["设置密码"]:取文本()})
	    end
    elseif self.资源组[4]:事件判断() then
        if self.建房打勾 then
        	self.输入框["设置密码"]:置文本("")
        	self.建房打勾 = false
        else
            self.建房打勾 = true
        end
        self.资源组[4]:置打勾框(self.建房打勾)
    elseif self.按钮组[7]:事件判断() then
        self.界面=1
    elseif self.按钮组[10]:事件判断() then
        self:打开()
        return false
	end
end

function 场景类_剑会房间列表:显示_我的房间(dt,x,y)
	-- local dwjsxy={[1]={x=211,y=134},[2]={x=58,y=51},[3]={x=420,y=51},[4]={x=58,y=229},[5]={x=420,y=229}}
	-- self.资源组[8] = tp._自适应.创建(76,1,551,ax,3,9)
	---------------
	if not self.我的房间 then
	    self:关闭()
	    return false
	end
	self.资源组[8]:显示(self.x+13,self.y+47)
	self.资源组[8]:显示(self.x+13,self.y+229)
	jhzts:显示(self.x+21,self.y+27,"队伍1：")
	jhzts:显示(self.x+21,self.y+208,"队伍2：")
	self.按钮组[8]:更新(x,y)
    self.按钮组[9]:更新(x,y)
	self.按钮组[8]:显示(self.x+12,self.y+392)
	self.按钮组[9]:显示(self.x+493,self.y+392)
	-- if self.选中人物~=0 and self.队伍数据[self.选中人物]~=nil then
	-- 	-- tp.绿标选中:显示(self.x + dwjsxy[self.选中人物].x +54, self.y + dwjsxy[self.选中人物].y +59)
	-- end
	local 缩放x,缩放y = nil,nil
	for n=1,5 do
		if self.队伍数据[n] ~= nil and self.我方头像[n]~=nil then
		    if self.我方头像[n].宽度 > 18 then
	            缩放x,缩放y = 等比例缩放公式(18,18,self.我方头像[n].宽度 , self.我方头像[n].高度)
	        end
			self.我方头像[n]:显示(self.x+22,self.y+57+(n-1)*29,缩放x,缩放y)
			if self.队伍数据[n].id == self.队伍数据.队长id then
				self.资源组[9]:显示(self.x+138,self.y+(n-1)*29+63,缩放x,缩放y)
			elseif self.队伍数据[n].准备 then
				self.资源组[10]:显示(self.x+137,self.y+(n-1)*29+89,缩放x,缩放y)
			end
			jhzts:显示(self.x+44,self.y+(n-1)*29+60,self.队伍数据[n].名称)
			jhzts:显示(self.x+175,self.y+(n-1)*29+60,self.队伍数据[n].门派)
			jhzts:显示(self.x+266,self.y+(n-1)*29+60,self.队伍数据[n].等级 .."级")
			jhzts:显示(self.x+361,self.y+(n-1)*29+60,"积分：" ..self.队伍数据[n].剑会数据.赛季积分)
			jhzts:显示(self.x+484,self.y+(n-1)*29+60,"胜率：" ..self.队伍数据[n].剑会数据.胜率 .."%")
		end
	end
	if self.按钮组[8]:事件判断() then
		发送数据(400,{操作="退出房间"})
	elseif self.按钮组[9]:事件判断() then
		发送数据(400,{操作="准备游戏"})
	end
end
---------------------------------------------------------------
function 场景类_剑会房间列表:刷新房间列表(数据)
	self.房间列表={}
	if type(数据) == "table" then
		for k,v in pairs(数据) do
			local 临时数据 = {}
			if type(数据[k]) == "table" and v.队长编号 ~= nil and v.成员数据[v.队长编号] ~= nil then
				临时数据.名称 = v.成员数据[v.队长编号].名称
				临时数据.等级 = v.成员数据[v.队长编号].等级
				临时数据.门派 = v.成员数据[v.队长编号].门派
				临时数据.房间编号 = v.房间编号
				临时数据.队长id = v.队长id
				临时数据.房主积分 = v.成员数据[v.队长编号].剑会数据.赛季积分
				临时数据.房间密码 = v.房间密码 or false
				local x = tx(v.成员数据[v.队长编号].模型)
				临时数据.头像 = tp.资源:载入(x[7],"网易WDF动画",x[2])
				临时数据.人数 = #v.id组
				临时数据.zhandou = v.zhandou
				table.insert(self.房间列表,临时数据)
			end
		end
		self.房间总数 = 数据.房间总数 or 1
		self.我的房间 = 数据.已有房间
		if self.我的房间 then
			self.按钮组[1].按钮文字="我的房间"
		end
	end
end

function 场景类_剑会房间列表:刷新我的房间(数据)
	self.我的房间 = 数据.已有房间
	self.队伍数据=数据.成员数据
	self.队伍数据.队长id = 数据.队长id or 0
	self.我方头像={}
	if type(self.队伍数据)=="table" then
		for n=1,#self.队伍数据 do
			if self.队伍数据[n]~=nil then
				local x = tx(self.队伍数据[n].模型)
				self.我方头像[n]=tp.资源:载入(x[7],"网易WDF动画",x[2])
				if tp.队伍[1].数字id == self.队伍数据[n].id then
					if self.队伍数据[n].准备 then
						self.按钮组[9].按钮文字="取消准备"
					else
						self.按钮组[9].按钮文字="准备游戏"
					end
				end
			end
		end
	end
	if self.队伍数据.队长id == tp.队伍[1].数字id then
		self.按钮组[9].按钮文字="开始匹配"
	end
	self.界面=3
end

function 场景类_剑会房间列表:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 场景类_剑会房间列表:初始移动(x,y)
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

function 场景类_剑会房间列表:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_剑会房间列表