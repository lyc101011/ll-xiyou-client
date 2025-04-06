-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-08-01 01:37:33
local _丸子赐福 = class()
local insert = table.insert
local mouseb = 引擎.鼠标弹起
local tx = 引擎.取头像
local tp,lsdh,lsdhb
local bw1 = require("gge包围盒")(0,0,163,39)
local box = 引擎.画矩形
local qmxs = 引擎.取战斗模型
local sxslxy={[1]={x=320,y=160},[5]={x=320,y=160},[25]={x=316,y=160}}

function _丸子赐福:初始化(根)
 	self.ID = 181
	self.x = 158
	self.y = 140
	self.xx = 0
	self.yy = 0
	self.注释 = "_丸子赐福"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
end

function _丸子赐福:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 资源:载入('丸子赐福.png',"图片"),--要复制素材文件
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"  赐福"),
		[4] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
		[5] = tp._滑块.创建(自适应.创建(11,4,15,40,2,3,nil),1,14,180,2),
		[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"保存技能"),
		[7] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"再次赐福"),
		[8] = 资源:载入('小黄锁.png',"图片"),
		[9] = 按钮.创建(资源:载入('wzcf.npk',"网易WDF动画","技能列表"),0,0,4,true,true),
		[10] = 资源:载入('小图标-原.png',"图片"), --超级技能2.6 新增
		---------------------超级技能2.19 新增
		[11] = 资源:载入('wzcf.npk',"网易WDF动画","赐福白神柚"),
		[12] = 资源:载入('wzcf.npk',"网易WDF动画","赐福喷射"),
		[13] = 资源:载入('wzcf.npk',"网易WDF动画","赐福黄神柚"),
	}
	self.锁定按钮组={
		[1] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"锁定"),
		[2] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"锁定"),
		[3] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"锁定"),
		[4] = 按钮.创建(自适应.创建(12,4,43,22,1,3),0,0,4,true,true,"锁定"),
	}
	for n=1,4 do
		self.锁定按钮组[n]:绑定窗口_(self.ID)
	end
	self.资源组[2]:绑定窗口_(self.ID)
	self.资源组[3]:绑定窗口_(self.ID)
	self.资源组[6]:绑定窗口_(self.ID)
	self.资源组[7]:绑定窗口_(self.ID)
	self.资源组[9]:绑定窗口_(self.ID)
	lsdh = tp.字体表.普通字体
	lsdhb = tp.字体表.描边字体
	self.动画开关={[1]=false,[2]=false,[3]=false} --超级技能2.19
	self.动画技能={}
	self.动画技能time={}
	self.主加入 = 0
	self.选中bb=0
    self.锁定={}
    self.锁定所需=1
	self.头像组={}
	self.物品={}
	self.技能={}
	for i=1,20 do
		self.物品[i] = tp._物品格子.创建(0,0,i,"背包_物品")
	end
	for i=1,2 do
		self.材料 = tp._物品格子.创建(0,0,i,"合成材料")
	end
end

function _丸子赐福:打开(数据,丸子赐福)
 	if self.可视 then
		self.可视 = false
		for i=1,20 do
			self.物品[i]:置物品(nil)
		end
		self.材料:置物品(nil)
		self.物品=nil
		self.材料=nil
		self.资源组=nil
		self.头像组=nil
		self.选中bb=nil
		self.锁定=nil
		self.锁定所需=nil
		self.技能=nil
		self.主宠=nil
		self.动画开关=nil --超级技能2.19
		self.动画技能=nil
		self.动画技能time=nil
		return
	else
		insert(tp.窗口_,self)
		self:加载资源()
		self.丸子赐福 = 丸子赐福
		self.x = (全局游戏宽度/2)-246
		self.y = (全局游戏高度/2)-185
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		for q=1,20 do
			self.物品[q]:置根(tp)
			self.物品[q]:置物品(数据[q])
		end
		self.材料:置根(tp)
		self.材料:置物品(nil)
		if tp.窗口.宠物状态栏.可视 then
			tp.窗口.宠物状态栏:打开()
		end
	end
end

function _丸子赐福:刷新(数据,丸子赐福)
	--------------------超级技能2.19
	self.动画开关[1]=true
	--------------------
	self.技能={} --超级技能2.5 增加
	local bbs = tp.队伍[1].宝宝列表
	for q=1,20 do
		self.物品[q]:置根(tp)
		self.物品[q]:置物品(数据[q])
	end
	self.技能 = {} --超级技能2.27
	self.丸子赐福 = {}
	self.丸子赐福 = 丸子赐福
	local tjn={}
	for i=1,4 do
		if self.丸子赐福.技能~=nil and self.丸子赐福.技能[i]~=nil then
			-----------------超级技能2.8 加
			local qgjjn=取技能是否有高级(bbs[self.选中bb],self.丸子赐福.技能[i])
			-----------------
			local qtb=引擎.取技能(qgjjn) --超级技能2.8 改
			self.技能[i]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
			if bbs[self.选中bb] ~= nil and bbs[self.选中bb].认证码==self.丸子赐福.认证码 then
				for kn,vn in pairs(bbs[self.选中bb].技能) do
					if vn.名称 == qgjjn then --超级技能2.8 改
						tjn[i]=true
					end
				end
			end
			---------------------超级技能2.19
			local qgjjnb=取赐福高级技能(self.丸子赐福.技能[i])
			local qtbb=引擎.取技能(qgjjnb)
			self.动画技能[i]=tp.资源:载入(qtbb[6],"网易WDF动画",qtbb[7])
			self.动画技能time[i]=18*i+20
			---------------------
		end
		self.技能[i].可锁定=true
	end
	for i=1,4 do
		if self.丸子赐福.技能~=nil and self.丸子赐福.技能[i]~=nil then
			self.技能[i].名称=取技能是否有高级(bbs[self.选中bb],self.丸子赐福.技能[i]) --超级技能2.8 改
			self.技能[i].原名称 = self.丸子赐福.技能[i]
			if not tjn[i] then
				-- self.技能[i].可锁定=false --超级技能2.27
				self.技能[i]:灰度级()
			end
        end
	end
	local xbh=nil
	if self.材料.物品~=nil and self.物品[self.材料.物品.格子]~=nil then
		xbh=self.材料.物品.格子
	end
	self.材料:置物品(nil)
	if xbh and self.物品[xbh]~=nil and self.物品[xbh].物品 ~= nil then
		self.材料:置根(tp)
		self.材料:置物品(self.物品[xbh].物品)
		self.材料.物品["格子"]=xbh
		self.材料.物品.数量禁显=true
		self.物品[xbh]:置物品(nil)
	end
	self:锁定所需重置()
end

-------------------------------------------超级技能2.5 把这段加上就行
function _丸子赐福:置已赐福技能(bh) --超级技能2.27 大改
	self.技能={}
	local bbs = tp.队伍[1].宝宝列表
	if bbs[self.选中bb]==nil or bbs[self.选中bb].丸子技能 == nil then return end
	self.丸子赐福.技能 = table.copy(bbs[self.选中bb].丸子技能)
	self.丸子赐福.认证码 = bbs[self.选中bb].认证码
	for k,v in pairs(bbs[self.选中bb].丸子技能) do
		if v.有此技能 then
			local qgjjn=取技能是否有高级(bbs[self.选中bb],v.名称)
			local qtb=引擎.取技能(qgjjn)
			self.技能[k]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
			self.技能[k].名称=qgjjn
			self.技能[k].原名称=v.名称
			self.技能[k].超级=true
		else
			local qgjjn=取技能是否有高级(bbs[self.选中bb],v.名称)
		    local qtb=引擎.取技能(qgjjn)
			self.技能[k]=tp.资源:载入(qtb[6],"网易WDF动画",qtb[7])
			self.技能[k]:灰度级()
			self.技能[k].名称=v.名称
			self.技能[k].原名称=qgjjn
			self.技能[k].超级=false
		end
	end
end
-------------------------------------------

function _丸子赐福:显示(dt,x,y)
	----------------------
	-- 素材位置调整()
	-- ax=AFCHX
	-- ay=AFCHY
	------------------------
	local bbs = tp.队伍[1].宝宝列表
	local bbsa = #bbs
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	self.资源组[3]:更新(x,y,self.丸子赐福.进程==1 and self.材料.物品~=nil and bbs[self.选中bb]~=nil)
	self.资源组[6]:更新(x,y,self.丸子赐福.进程==2)
	self.资源组[7]:更新(x,y,self.丸子赐福.进程==2 and self.材料.物品~=nil and bbs[self.选中bb]~=nil)
	self.资源组[9]:更新(x,y,bbs[self.选中bb]~=nil)
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+446,self.y+2)
	if bbs[self.选中bb] ~= nil then
		self.资源组[9]:显示(self.x+102,self.y+39)
	end
	for n=1,4 do
		self.锁定按钮组[n]:更新(x,y,self.技能[n]~=nil) --超级技能2.27
		-- self.锁定按钮组[n]:更新(x,y,self.技能[n]~=nil and self.技能[n].可锁定==true) --超级技能2.27 他要黑的也可锁定就改了这个
		if self.丸子赐福.进程 <= 2 then --超级技能2.19
			self.锁定按钮组[n]:显示(self.x + 212 + (n-1)*61,self.y + 92)
		end
	end
	if self.丸子赐福.进程==1 then
		self.资源组[3]:显示(self.x+288,self.y+186)
	elseif self.丸子赐福.进程==2 then --超级技能2.19改
		self.资源组[6]:显示(self.x+243,self.y+186)
		self.资源组[7]:显示(self.x+333,self.y+186)
	end
	---------------超级技能2.19 改放下面
	if bbs[self.选中bb]~=nil and self.丸子赐福.进程<=2 then
		self.资源组[10]:显示(self.x+422,self.y+187)
		if self.资源组[10]:是否选中(x,y) and bbs[self.选中bb].丸子技能~=nil then
			if bbs[self.选中bb] ~= nil and tp.窗口._赐福效果小窗.可视 == false then
		    	tp.窗口._赐福效果小窗:打开(bbs[self.选中bb],self.x+258,self.y-110,"_丸子赐福")
		    end
		end
	end
	---------------
	lsdh:置颜色(黑色)
	local is = 0
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51+147 + self.x,h * 51 + self.y +172)
			if self.物品[is].物品 ~= nil then
			  self.物品[is]:显示(dt,x,y,self.鼠标,{0,0,self.物品[is].物品.总类==110 and self.物品[is].物品.分类==3},nil,nil,1)
			end
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 and not tp.消息栏焦点 then
				self.焦点 = true
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and  self.鼠标 then
				    if self.物品[is].物品.总类 == 110 then
				    	self.材料:置物品(self.物品[is].物品)
						self.材料.物品.格子 = is
						self.材料.物品.数量禁显=true
						self.物品[is]:置物品(nil)
				    end
				end
			end
			if self.材料.物品 ~= nil then
				self.材料:置坐标(self.x+299 ,self.y+133)
				----------------------------------超级技能2.19
				if self.丸子赐福.进程~= 3 then
					self.材料:显示(dt,x,y,self.鼠标)
					lsdhb:显示(self.x+sxslxy[self.锁定所需].x ,self.y+sxslxy[self.锁定所需].y,self.锁定所需)
				end
				----------------------------------
				if self.材料.焦点 then
					tp.提示:道具行囊(x,y,self.材料.物品)
					if mouseb(0) and self.鼠标 then
						self.物品[self.材料.物品.格子]:置物品(tp.道具列表[self.材料.物品.格子])
						刷新道具逻辑(tp.道具列表[self.材料.物品.格子],self.材料.物品.格子,true)
						self.材料:置物品(nil)
					end
				end
			end
		end
	end
	for i=1,5 do
		if bbs[i] ~= nil then
			local jx = self.x+15
			local jy = self.y+187+(i*40)
			bw1:置坐标(self.x+13,self.y+185+i*39)
			if bw1:检查点(x,y) then
				self.焦点=true
				box(self.x+12,self.y+186+i*40,self.x+174,self.y+226+i*40,-2097481216)
				if 引擎.鼠标弹起(0) and self.鼠标 and not tp.消息栏焦点 then
					if bbs[i + self.主加入].参战信息~=nil or bbs[i + self.主加入].装备[1]~=nil or bbs[i + self.主加入].装备[2]~=nil or bbs[i + self.主加入].装备[3]~=nil then
						tp.常规提示:打开("#Y/已参战、有装备、有饰品的召唤兽，无法进行该操作！")
						return
					elseif bbs[i + self.主加入].加锁~=nil and bbs[i + self.主加入].加锁 then
						tp.常规提示:打开("#Y/加锁的召唤兽无法进行该操作！")
						return
					end
					self.选中bb = i + self.主加入
					self:主置形象()
					-------------------------------------------------------超级技能2.5 把这段加上就行
					if self.丸子赐福.进程 == 1 and bbs[self.选中bb]~=nil then
						self:置已赐福技能()
					end
					-------------------------------------------------------
				end
			end
			if self.选中bb == i + self.主加入 then
				box(self.x+12,self.y+186+i*40,self.x+174,self.y+226+i*40,-9670988)
			end
			if self.头像组[i] == nil then
				local n = tx(bbs[i].模型)
				self.头像组[i] = tp.资源:载入(n[7],"网易WDF动画",n[1])
			end
			self.资源组[4]:显示(jx+1,jy)
			self.头像组[i]:显示(jx+4,jy+4)
			lsdh:显示(jx+41,jy+3,bbs[i].名称)
			lsdh:显示(jx+41,jy+21,bbs[i].等级.."级")
		end
	end
	if self.主宠 ~= nil then
		self.主宠:更新(dt)
	end
	if self.主宠 ~= nil and bbs[self.选中bb] ~= nil then
		tp.影子:显示(self.x + 84,self.y + 172)
	    self.主宠:显示(self.x + 84,self.y + 172)
	end
	for n=1,4 do
		if self.技能[n] ~= nil and self.丸子赐福.进程 <= 2 then
			self.技能[n]:显示(self.x + 213 + (n-1)*61,self.y + 47)
			if self.技能[n]:是否选中(x,y) then
				tp.提示:超级技能(x,y+20,self.技能[n].名称,self.技能[n].超级,nil,true) --超级技能2.5 改
			end
		elseif self.丸子赐福.进程 >= 2 then
			self.动画技能time[n]=self.动画技能time[n]-1
			if self.动画技能[n] and self.动画技能time[n] <= 0 then
			    self.动画技能[n]:显示(self.x + 213 + (n-1)*61,self.y + 47)
			end
		end
	end
	-------------------------超级技能2.19
	-- self.资源组[13]:更新(dt*1)
	-- for nv=1,4 do
	-- 		self.资源组[13]:显示(self.x + 188 + (nv-1)*61,self.y + 9)
	-- end
	---------------------
	if self.丸子赐福.进程==3 then
		if self.动画开关[1] then
			self.资源组[11]:更新(dt*20)
			self.资源组[11]:显示(self.x + 280,self.y + 101)
			if self.资源组[11]:取当前帧(self.资源组[11])>=self.资源组[11]:取结束帧(self.资源组[11]) then
				self.资源组[11].当前帧=1
				self.动画开关[1]=false
				self.动画开关[2]=true
			end
		elseif self.动画开关[2] then
			self.资源组[12]:更新(dt)
			self.资源组[12]:显示(self.x + 198,self.y + 29)
			if self.资源组[12]:取当前帧(self.资源组[12])>=self.资源组[12]:取结束帧(self.资源组[12]) then
				self.资源组[12].当前帧=1
				self.动画开关[2]=false
				self.动画开关[3]=true
			end
		elseif self.动画开关[3] then
		    self.资源组[13]:更新(dt*4)
			for nv=1,4 do
				self.资源组[13]:显示(self.x + 188 + (nv-1)*61,self.y + 9)
			end
			if self.资源组[13]:取当前帧(self.资源组[13])>=self.资源组[13]:取结束帧(self.资源组[13]) then
				self.资源组[13].当前帧=1
				self.动画开关[3]=false
			end
		else
		    self.丸子赐福.进程=2
		end
	end
	-------------------------
	if self.资源组[3]:事件判断() then
		if self.材料.物品~=nil and self.选中bb > 0 then
			发送数据(3902,{材料=self.材料.物品.格子,bb=self.选中bb,认证码=bbs[self.选中bb].认证码,锁定=table.copy(self.锁定)})
		else
		   tp.常规提示:打开("#Y/请放入材料并选择一只BB")
		end
	elseif self.资源组[7]:事件判断() then
		if self.丸子赐福.认证码==nil or bbs[self.选中bb]==nil then tp.常规提示:打开("#Y/选择的BB已变更，禁止作操") return end
		if self.丸子赐福.认证码 ~= bbs[self.选中bb].认证码 then
			tp.常规提示:打开("#Y/选择的BB已变更，禁止作操")
			return
		end
		if self.材料.物品~=nil and self.选中bb > 0 then
			发送数据(3902,{材料=self.材料.物品.格子,bb=self.选中bb,认证码=bbs[self.选中bb].认证码,锁定=table.copy(self.锁定)})
		else
		   tp.常规提示:打开("#Y/请放入材料并选择一只BB")
		end
	elseif self.资源组[6]:事件判断() then
		if self.丸子赐福.认证码==nil or bbs[self.选中bb]==nil then tp.常规提示:打开("#Y/选择的BB已变更，禁止作操") return end
		if self.丸子赐福.技能[1]==nil then tp.常规提示:打开("#Y/获得赐福技能错误，请联系管理员") return end --防错
		if self.丸子赐福.认证码 ~= bbs[self.选中bb].认证码 then
			tp.常规提示:打开("#Y/选择的BB已变更，禁止作操")
			return
		end
		-------------------------------------超级技能2.6 新增
		if tp.窗口._丸子保存技能.可视 then
	    	tp.窗口._丸子保存技能:关闭()
	    else
	    	local zysj={bh=self.选中bb,认证码=bbs[self.选中bb].认证码,锁定=table.copy(self.锁定),技能=self.丸子赐福.技能}
	    	tp.窗口._丸子保存技能:打开(table.copy(zysj))
	    end
	    -------------------------------------
	elseif self.资源组[9]:事件判断() then
		if bbs[self.选中bb] ~= nil then
			if tp.窗口._丸子技能列表.可视 then
		    	tp.窗口._丸子技能列表:关闭()
		    else
		    	tp.窗口._丸子技能列表:打开(self.选中bb)
		    end
		end
	elseif self.锁定按钮组[1]:事件判断() then
		if self:锁定判断(1,bbs) then
		    self.锁定[1]=self.技能[1].原名称
		else
		    self.锁定[1]=nil
		end
		self:锁定所需重置()
	elseif self.锁定按钮组[2]:事件判断() then
	    if self:锁定判断(2,bbs) then
		    self.锁定[2]=self.技能[2].原名称
		else
		    self.锁定[2]=nil
		end
		self:锁定所需重置()
	elseif self.锁定按钮组[3]:事件判断() then
	    if self:锁定判断(3,bbs) then
		    self.锁定[3]=self.技能[3].原名称
		else
		    self.锁定[3]=nil
		end
		self:锁定所需重置()
	elseif self.锁定按钮组[4]:事件判断() then
	    if self:锁定判断(4,bbs) then
		    self.锁定[4]=self.技能[4].原名称
		else
		    self.锁定[4]=nil
		end
		self:锁定所需重置()
	elseif self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	for n=1,4 do
		if self.锁定[n]~=nil then
			self.资源组[8]:显示(self.x + 228 + (n-1)*61,self.y + 77)
		end
	end
	lsdh:置颜色(白色)
end

function _丸子赐福:锁定判断(bh,bbs)
	if bbs[self.选中bb]==nil or self.丸子赐福.认证码==nil then tp.常规提示:打开("#Y/选择的BB已变更，禁止锁定") return false end
	local fh=false
	local qsdcd=0
	for k,v in pairs(self.锁定) do
		qsdcd=qsdcd+1
	end
	if self.技能[bh].原名称~=nil and qsdcd < 2 and self.锁定[bh]==nil then
		fh=true
	elseif qsdcd >= 2 then
	    fh=false
	    tp.常规提示:打开("#Y/最多可锁定两个技能")
	end
	if self.丸子赐福.认证码~=bbs[self.选中bb].认证码 then
		fh=false
		tp.常规提示:打开("#Y/选择的BB已变更，禁止锁定")
	end
	return fh
end

function _丸子赐福:锁定所需重置()
	local sx={1,5,25}
	local qsdcd=1
	for k,v in pairs(self.锁定) do
		qsdcd=qsdcd+1
	end
	self.锁定所需 = sx[qsdcd]
end

function _丸子赐福:主置形象()
	if tp.队伍[1].宝宝列表[self.选中bb]  ~= nil and self.选中bb ~= 0 then
		local 模型=tp.队伍[1].宝宝列表[self.选中bb].模型
		local n = qmxs(模型)
		self.主宠 = tp.资源:载入(n[10],"网易WDF动画",n[6])
		if tp.队伍[1].宝宝列表[self.选中bb].饰品 ~= nil then
			n = qmxs(模型.."_饰品")
			self.资源组[28] = tp.资源:载入(n[10],"网易WDF动画",n[6])
		end
		if tp.队伍[1].宝宝列表[self.选中bb].染色方案 ~= nil then
			self.主宠:置染色(tp.队伍[1].宝宝列表[self.选中bb].染色方案,tp.队伍[1].宝宝列表[self.选中bb].染色组[1],tp.队伍[1].宝宝列表[self.选中bb].染色组[2],tp.队伍[1].宝宝列表[self.选中bb].染色组[3],tp.队伍[1].宝宝列表[self.选中bb].染色组[4])
			self.主宠:置方向(0)
		end
	end
end

function _丸子赐福:初始移动(x,y)
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

function _丸子赐福:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy


	end
end
function _丸子赐福:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end
return _丸子赐福