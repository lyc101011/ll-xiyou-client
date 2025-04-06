-- @Author: baidwwy
-- @Date:   2024-05-23 06:05:09
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-11 10:39:26
local tp,zts
local insert = table.insert
local tx = 引擎.取头像
local 角色转换 = class()


local txb={{"狐美人","骨精灵","鬼潇潇"},{"舞天姬","玄彩娥","桃夭夭"},{"飞燕女","英女侠","巫蛮儿"},{"巨魔王","虎头怪","杀破狼"},{"羽灵神","神天兵","龙太子"},{"逍遥生","剑侠客","偃无师"}}
function 角色转换:初始化(根)
	self.ID = 130
	self.x = 255
	self.y = 242
	self.xx = 0
	self.yy = 0
	self.注释 = "角色转换"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	self.窗口时间 = 0
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,320,432,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 资源:载入("pic/转门派/底图.png","图片"),
		[4] = 资源:载入("pic/转门派/当前.png","图片"),
		[5] = 自适应.创建(4,1,1,1,3,nil),
		[6] = 资源:载入("pic/转门派/人魔仙.png","图片"),
		[7] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1894227293),0,0,4,true,true),
		[8] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"重选"),
		[9] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"重选"),
		[10] = 按钮.创建(自适应.创建(12,4,44,22,1,3),0,0,4,true,true,"重选"),
		[11] = 按钮.创建(自适应.创建(12,4,100,22,1,3),0,0,4,true,true,"我要转换门派"),
		[12] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1187031669),0,0,4,true,true),
		[13] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1187031669),0,0,4,true,true),
		[14] = 资源:载入("pic/转门派/底图1.png","图片"),
	}
	self.资源组[11]:置偏移(-1,0)
    self.圈圈 = 资源:载入("pic/转门派/光圈.png","图片")
	for i=7,13 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[2]:绑定窗口_(self.ID)
	self.支付方式="经验银子"

	zts = tp.字体表.猫猫字体1
end

function 角色转换:打开()
	if self.可视 then
		self.选中头像=nil
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
		self.门派图片={}

		self.状态=1
		self.标题="转换角色"

	    self.男人={}
		self.男魔={}
		self.男仙={}
		self.女人={}
		self.女魔={}
		self.女仙={}

		for i=1,3 do
	    	local xsw = tx(txb[6][i])
	    	self.男人[i]=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
	    	self.男人[i].模型=txb[6][i]
	    	xsw = tx(txb[4][i])
	    	self.男魔[i]=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
	    	self.男魔[i].模型=txb[4][i]
	    	xsw = tx(txb[5][i])
	    	self.男仙[i]=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
	    	self.男仙[i].模型=txb[5][i]
	    	xsw = tx(txb[2][i])
	    	self.女仙[i]=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
	    	self.女仙[i].模型=txb[2][i]
	    	xsw = tx(txb[1][i])
	    	self.女魔[i]=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
	    	self.女魔[i].模型=txb[1][i]
	    	xsw = tx(txb[3][i])
	    	self.女人[i]=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
	    	self.女人[i].模型=txb[3][i]
	    end
		local zy = tx('影精灵')
		self.女魔[4]=tp.资源:载入(zy[7],"网易WDF动画",zy[2])
		self.女魔[4].模型='影精灵'
	    self.选中角色=tp.队伍[1].模型
	    self.选中门派=tp.队伍[1].门派
	    self.选中头像=nil

	    self.性别=tp.队伍[1].性别
	    self.免费="是"
	    if tp.队伍[1].转门派 then
	        -- self.免费="否"
	        self.免费="是"
	    end
	    self.自己=tp.资源:载入(tx(tp.队伍[1].模型)[7],"网易WDF动画",tx(tp.队伍[1].模型)[2])

	    tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end
function 角色转换:载入门派()
	if self.选中角色=="飞燕女" or self.选中角色=="英女侠" or self.选中角色=="巫蛮儿" then
        local mp={"大唐官府","方寸山","女儿村","神木林"}
	    for i=1,#mp do
	    	self.门派图片[i]=tp.资源:载入("pic/转门派/"..mp[i]..".png","图片")
	    	self.门派图片[i].名称=mp[i]
	    end
    elseif self.选中角色=="偃无师" or self.选中角色=="逍遥生" or self.选中角色=="剑侠客" then
    	local mp={"大唐官府","方寸山","化生寺","神木林"}
	    for i=1,#mp do
	    	self.门派图片[i]=tp.资源:载入("pic/转门派/"..mp[i]..".png","图片")
	    	self.门派图片[i].名称=mp[i]
	    end
	elseif self.选中角色=="狐美人" or self.选中角色=="骨精灵" or self.选中角色=="鬼潇潇" or self.选中角色=="影精灵" then
		local mp={"魔王寨","阴曹地府","盘丝洞","无底洞"}
		if self.选中角色=="影精灵" then
		    mp={"魔王寨","阴曹地府","盘丝洞","无底洞",'九黎城'}
		end
		for i=1,#mp do
			self.门派图片[i]=tp.资源:载入("pic/转门派/"..mp[i]..".png","图片")
			self.门派图片[i].名称=mp[i]
		end
    elseif self.选中角色=="杀破狼" or self.选中角色=="巨魔王" or self.选中角色=="虎头怪" then
		local mp={"魔王寨","阴曹地府","狮驼岭","无底洞"}
	    for i=1,#mp do
	    	self.门派图片[i]=tp.资源:载入("pic/转门派/"..mp[i]..".png","图片")
	    	self.门派图片[i].名称=mp[i]
	    end
    elseif self.选中角色=="舞天姬" or self.选中角色=="玄彩娥" or self.选中角色=="桃夭夭" then
		local mp={"天宫","龙宫","普陀山","凌波城","花果山"}
	    for i=1,#mp do
	    	self.门派图片[i]=tp.资源:载入("pic/转门派/"..mp[i]..".png","图片")
	    	self.门派图片[i].名称=mp[i]
	    end
    elseif self.选中角色=="羽灵神" or self.选中角色=="神天兵" or self.选中角色=="龙太子" then
		local mp={"天宫","龙宫","五庄观","凌波城","花果山"}
	    for i=1,#mp do
	    	self.门派图片[i]=tp.资源:载入("pic/转门派/"..mp[i]..".png","图片")
	    	self.门派图片[i].名称=mp[i]
	    end
	end

end
function 角色转换:显示(dt,x,y)
	self.焦点= false
	self.资源组[2]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,self.标题)
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)


	if self.资源组[2]:事件判断() then
	   self:打开()
	   return
	end
	zts:置样式(0)
	if self.状态==1 then
		self.资源组[5]:置宽高(303,302)
		self.资源组[3]:显示(self.x+9,self.y+28)
		self.资源组[5]:显示(self.x+9,self.y+121)
		tp.物品格子背景_:显示(self.x+27,self.y+44)
		self.标题="转换角色"
		self.自己:显示(self.x+30,self.y+48)
		zts:置颜色(黑色)
		zts:显示(self.x+160,self.y+48,tp.队伍[1].模型)
		zts:显示(self.x+160,self.y+79,tp.队伍[1].门派)

		self.资源组[6]:显示(self.x+26,self.y+165)
		self.资源组[7]:更新(x,y)
		self.资源组[7]:显示(self.x+247,self.y+123)
		if self.资源组[7]:事件判断() then
			if self.性别=="男" then
				self.性别="女"
			else
			    self.性别="男"
			end
		end
		zts:置颜色(白色)
		zts:显示(self.x+20,self.y+127,"请问您想转换为下面哪个角色呢？")
		zts:显示(self.x+257+18,self.y+127,self.性别)
		-- for i=1,3 do
		-- 	tp.物品格子背景_:显示(self.x+98+(i-1)*74,self.y+165)
		-- 	tp.物品格子背景_:显示(self.x+98+(i-1)*74,self.y+165+88)
		-- 	tp.物品格子背景_:显示(self.x+98+(i-1)*74,self.y+165+88+88)
		-- 	if self.性别=="男" then
		-- 	    self.男人[i]:显示(self.x+101+(i-1)*74,self.y+169)
		-- 		self.男魔[i]:显示(self.x+101+(i-1)*74,self.y+169+88)
		-- 		self.男仙[i]:显示(self.x+101+(i-1)*74,self.y+169+88+88)
		-- 		if self.男人[i]:是否选中(x,y) then
		-- 			self.焦点=true
		-- 		    tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+162+5)
		-- 		    if 引擎.鼠标弹起(左键) then
		-- 		        self.选中角色=self.男人[i].模型
		-- 		        local xsw = tx(self.选中角色)
		-- 		    	self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
		-- 		    	self:载入门派()
		-- 		        self.状态=2
		-- 		    end
		-- 		elseif self.男魔[i]:是否选中(x,y)  then
		-- 			self.焦点=true
		-- 		    tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+250+5)
		-- 		    if 引擎.鼠标弹起(左键) then
		-- 		        self.选中角色=self.男魔[i].模型
		-- 		        local xsw = tx(self.选中角色)
		-- 		    	self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
		-- 		    	self:载入门派()
		-- 		        self.状态=2
		-- 		    end
		-- 	    elseif self.男仙[i]:是否选中(x,y)  then
		-- 	    	self.焦点=true
		-- 		    tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+338+5)
		-- 		    if 引擎.鼠标弹起(左键) then
		-- 		        self.选中角色=self.男仙[i].模型
		-- 		        local xsw = tx(self.选中角色)
		-- 		    	self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
		-- 		    	self:载入门派()
		-- 		        self.状态=2
		-- 		    end
		-- 		end
		-- 	else
		-- 		self.女人[i]:显示(self.x+101+(i-1)*74,self.y+169)
		-- 		self.女魔[i]:显示(self.x+101+(i-1)*74,self.y+169+88)
		-- 		self.女仙[i]:显示(self.x+101+(i-1)*74,self.y+169+88+88)
		-- 		if self.女人[i]:是否选中(x,y)  then
		-- 			self.焦点=true
		-- 		    tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+162+5)
		-- 		    if 引擎.鼠标弹起(左键) then
		-- 		        self.选中角色=self.女人[i].模型
  --                       local xsw = tx(self.选中角色)
		-- 		    	self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
		-- 		    	self:载入门派()
		-- 		        self.状态=2
		-- 		    end
		-- 		elseif self.女魔[i]:是否选中(x,y) then
		-- 			self.焦点=true
		-- 		    tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+250+5)
		-- 		    if 引擎.鼠标弹起(左键) then
		-- 		        self.选中角色=self.女魔[i].模型
		-- 		        local xsw = tx(self.选中角色)
		-- 		    	self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
		-- 		    	self:载入门派()
		-- 		        self.状态=2
		-- 		    end
		-- 	    elseif self.女仙[i]:是否选中(x,y) then
		-- 	    	self.焦点=true
		-- 		    tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+338+5)
		-- 		    if 引擎.鼠标弹起(左键) then
		-- 		        self.选中角色=self.女仙[i].模型
		-- 		        local xsw = tx(self.选中角色)
		-- 		    	self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
		-- 		    	self:载入门派()
		-- 		        self.状态=2
		-- 		    end
		-- 		end
		-- 	end
		-- end
		for i=1,4 do
            if self.性别=="男" then
                if i <= 3 then
                    if self.男人[i] then
                    	tp.物品格子背景_:显示(self.x+98+(i-1)*74,self.y+165)
                        self.男人[i]:显示(self.x+101+(i-1)*74,self.y+169)
                        if self.男人[i]:是否选中(x,y) then
                            self.焦点=true
                            tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+162+5)
                            if 引擎.鼠标弹起(左键) then
                                self.选中角色=self.男人[i].模型
                                local xsw = tx(self.选中角色)
                                self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
                                self:载入门派()
                                self.状态=2
                            end
                        end
                    end
                    if self.男魔[i] then
                    	tp.物品格子背景_:显示(self.x+98+(i-1)*74,self.y+165+88)
                        self.男魔[i]:显示(self.x+101+(i-1)*74,self.y+169+88)
                        if self.男魔[i]:是否选中(x,y)  then
                            self.焦点=true
                            tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+250+5)
                            if 引擎.鼠标弹起(左键) then
                                self.选中角色=self.男魔[i].模型
                                local xsw = tx(self.选中角色)
                                self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
                                self:载入门派()
                                self.状态=2
                            end
                        end
                    end
                    if self.男仙[i] then
                    	tp.物品格子背景_:显示(self.x+98+(i-1)*74,self.y+165+88+88)
                        self.男仙[i]:显示(self.x+101+(i-1)*74,self.y+169+88+88)
                        if self.男仙[i]:是否选中(x,y)  then
                            self.焦点=true
                            tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+338+5)
                            if 引擎.鼠标弹起(左键) then
                                self.选中角色=self.男仙[i].模型
                                local xsw = tx(self.选中角色)
                                self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
                                self:载入门派()
                                self.状态=2
                            end
                        end
                    end
                end
            else
                if self.女人[i] and i <= 3 then
                	tp.物品格子背景_:显示(self.x+98+(i-1)*74,self.y+165)
                    self.女人[i]:显示(self.x+101+(i-1)*74,self.y+169)
                    if self.女人[i]:是否选中(x,y)  then
                        self.焦点=true
                        tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+162+5)
                        if 引擎.鼠标弹起(左键) then
                            self.选中角色=self.女人[i].模型
                            local xsw = tx(self.选中角色)
                            self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
                            self:载入门派()
                            self.状态=2
                        end
                    end
                end
                if self.女魔[i] then
                	tp.物品格子背景_:显示(self.x+98+(i-1)*52,self.y+165+88)
                    self.女魔[i]:显示(self.x+101+(i-1)*52,self.y+169+88)
                    if self.女魔[i]:是否选中(x,y) then
                        self.焦点=true
                        tp.物品格子焦点_:显示(self.x+100+(i-1)*52,self.y+250+5)
                        if 引擎.鼠标弹起(左键) then
                            self.选中角色=self.女魔[i].模型
                            local xsw = tx(self.选中角色)
                            self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
                            self:载入门派()
                            self.状态=2
                        end
                    end
                end
                if self.女仙[i] and i <= 3 then
                	tp.物品格子背景_:显示(self.x+98+(i-1)*74,self.y+165+88+88)
                    self.女仙[i]:显示(self.x+101+(i-1)*74,self.y+169+88+88)
                    if self.女仙[i]:是否选中(x,y) then
                        self.焦点=true
                        tp.物品格子焦点_:显示(self.x+100+(i-1)*74,self.y+338+5)
                        if 引擎.鼠标弹起(左键) then
                            self.选中角色=self.女仙[i].模型
                            local xsw = tx(self.选中角色)
                            self.选中头像=tp.资源:载入(xsw[7],"网易WDF动画",xsw[2])
                            self:载入门派()
                            self.状态=2
                        end
                    end
                end
            end
        end
	elseif self.状态==2 then
		self.资源组[5]:置宽高(303,302)
		self.资源组[3]:显示(self.x+9,self.y+28)
		self.资源组[5]:显示(self.x+9,self.y+121)
		tp.物品格子背景_:显示(self.x+27,self.y+44)
		self.标题="转换门派"
		self.选中头像:显示(self.x+30,self.y+48)
		self.资源组[8]:更新(x,y)
		self.资源组[8]:显示(self.x+251,self.y+43)
		if self.资源组[8]:事件判断() then
			self.状态=1
		end
		zts:置颜色(白色)
		zts:显示(self.x+20,self.y+127,"请问您想转换为下面哪个门派呢？")
		zts:置颜色(黑色)
		zts:显示(self.x+160,self.y+48,self.选中角色)
		zts:显示(self.x+160,self.y+79,tp.队伍[1].门派)
		local xx,yy=0,0
		zts:置样式(1)
		for i=1,#self.门派图片 do
			self.门派图片[i]:显示(self.x+38+xx*103,self.y+165+yy*88)
			if self.门派图片[i]:是否选中(x,y) then
				self.圈圈:显示(self.x+38-10+xx*103,self.y+165-6+yy*88)
				self.焦点=true
			    if 引擎.鼠标弹起(左键) then
			    	self.选中门派=self.门派图片[i].名称
			    	self.状态=3
			    end
			end
			zts:显示(self.x+36+24+xx*103,self.y+165+55+yy*88,self.门派图片[i].名称)
			xx = xx + 1
			if xx >= 3 then
				xx = 0
				yy = yy + 1
			end
		end
		zts:置样式(0)
	elseif self.状态==3 then
		zts:置样式(0)
		self.标题="角色选择"
		self.资源组[5]:置宽高(303,160)
		self.资源组[14]:显示(self.x+9,self.y+28)
		self.资源组[5]:显示(self.x+9,self.y+206)
		self.资源组[9]:更新(x,y)
		self.资源组[10]:更新(x,y)
		self.资源组[11]:更新(x,y)
		self.资源组[12]:更新(x,y)
		self.资源组[13]:更新(x,y)
		self.资源组[9]:显示(self.x+255,self.y+134)
		self.资源组[10]:显示(self.x+255,self.y+160)
		self.资源组[11]:显示(self.x+114,self.y+398)
		self.资源组[12]:显示(self.x+265,self.y+243,true,nil,nil,self.支付方式=="经验银子",2)
		self.资源组[13]:显示(self.x+265,self.y+320,true,nil,nil,self.支付方式=="银子",2)
		if self.资源组[12]:事件判断() then
			if self.支付方式=="经验银子" then
			    self.支付方式="银子"
			else
				self.支付方式="经验银子"
			end
		elseif self.资源组[13]:事件判断() then
			if self.支付方式=="银子" then
			    self.支付方式="经验银子"
			else
				self.支付方式="银子"
			end
		elseif self.资源组[9]:事件判断() then
			self.状态=1
		elseif self.资源组[10]:事件判断() then
			self.状态=2
		elseif self.资源组[11]:事件判断() then
			if self.选中门派==tp.队伍[1].门派 and self.选中角色==tp.队伍[1].模型 then
				引擎.场景.常规提示:打开("#Y/请选择一个门派")
		    else
		    	发送数据(91,{门派=self.选中门派,角色=self.选中角色,支付方式=self.支付方式})
			end
		end
		zts:置颜色(黑色)
		zts:显示(self.x+150,self.y+50,tp.队伍[1].种族)
		zts:显示(self.x+150,self.y+51+28,tp.队伍[1].模型)
		zts:显示(self.x+150,self.y+51+28*2,tp.队伍[1].门派)
		zts:显示(self.x+150,self.y+53+28*3,self.选中角色)
		zts:显示(self.x+150,self.y+51+28*4,self.选中门派)
		zts:显示(self.x+27,self.y+243,"方式一：消耗经验银两")
		zts:显示(self.x+27,self.y+320,"方式二：仅消耗银两")
		zts:置颜色(红色)
		if self.选中角色==tp.队伍[1].模型 then
		    zts:显示(self.x+83,self.y+265,"经验：1000万")
			zts:显示(self.x+83,self.y+243+24+20,"银两：500万")
			zts:显示(self.x+83,self.y+243+22+75,"银两：1000万")
		else
			zts:显示(self.x+83,self.y+265,"经验：2000万")
			zts:显示(self.x+83,self.y+243+24+20,"银两：500万")
			zts:显示(self.x+83,self.y+243+22+75,"银两：1500万")
		end

		zts:置颜色(白色)
		zts:显示(self.x+27,self.y+210,"消费方式")
		zts:显示(self.x+95,self.y+377,"是否含免费洗点机会：")
		zts:置颜色(绿色)
		zts:显示(self.x+234,self.y+377,self.免费)
	end

end


function 角色转换:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 角色转换:初始移动(x,y)
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

function 角色转换:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 角色转换