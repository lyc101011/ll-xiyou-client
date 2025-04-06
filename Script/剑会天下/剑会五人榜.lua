-- @Author: baidwwy
-- @Date:   2024-09-11 20:07:40
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 16:33:41
-- @Author: baidwwy
-- @Date:   2024-03-03 22:16:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-03-11 01:33:48
local tp,jhzts
local insert = table.insert
local bw = require("gge包围盒")(0,0,131,19)
local box = 引擎.画矩形
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local 子榜选择wz = {"全部门派","方寸山", "女儿村", "神木林", "化生寺", "大唐官府", "盘丝洞", "阴曹地府", "无底洞", "魔王寨", "狮驼岭", "天宫", "普陀山", "凌波城", "五庄观", "龙宫"}--, "花果山"
local 组类={"精锐组","勇武组","神威组","天科组","天启组","天元组"}
local phwz={"排名","名称","门派","积分","胜率"}
local phxy={152,216,312,397,474}

local 场景类_剑会五人榜 = class()
function 场景类_剑会五人榜:初始化(根)
	self.ID = 195
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "剑会五人榜"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.窗口时间 = 0
	tp = 根
	jhzts = tp.字体表.普通字体
end

function 场景类_剑会五人榜:关闭()
	self.资源组=nil
	self.加入=nil
	self.可视 = false
	self.剑会排行=nil
	self.当前分组 = nil
	self.排行信息=nil
	self.门派选择=nil
	return
end

function 场景类_剑会五人榜:打开(内容)
	if self.可视 then
		self:关闭()
		return
	else
		insert(tp.窗口_,self)
        self:加载资源()
        if type(内容)=="table" then
	        for n=1,#组类 do
	        	if 内容[组类[n]]~=nil then
	        		self.剑会排行[组类[n]] = 内容[组类[n]]
	        	end
	        end
	    end
	    self:刷新排行信息()
		self.x = (全局游戏宽度/2)-313
		self.y = (全局游戏高度/2)-260
	    tp.运行时间 = tp.运行时间 + 1
	  	self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_剑会五人榜:加载资源()
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	local 资源 = tp.资源
    self.资源组 = {
    	[1] = 自适应.创建(0,1,529,473,3,9),
    	[2] = 自适应.创建(4,1,129,394,3,9),
    	[3] = 自适应.创建(4,1,366,394,3,9),
    }
    self.按钮组 = {
    	[1] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 精锐组"),
    	[2] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 勇武组"),
    	[3] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 神威组"),
    	[4] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 天科组"),
    	[5] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 天启组"),
    	[6] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true," 天元组"),
    }
    for n=1,#self.按钮组 do
    	self.按钮组[n]:绑定窗口_(self.ID)
    end
    self.加入=0
    self.剑会排行={天元组={},天启组={},天科组={},神威组={},勇武组={},精锐组={}}
    self.当前分组 = 1
    self.排行信息={}
    self.门派选择="全部门派"
end

function 场景类_剑会五人榜:刷新排行信息()
	if 组类[self.当前分组]~=nil and self.剑会排行[组类[self.当前分组]]~=nil then
		self.排行信息={}
		if self.门派选择 == "全部门派" then
			self.排行信息 = table.copy(self.剑会排行[组类[self.当前分组]])
		else
		    for k,v in pairs(self.剑会排行[组类[self.当前分组]]) do
		    	if v.门派 == self.门派选择 then
		    		table.insert(self.排行信息,v)
		    	end
		    end
		end
    end
end

function 场景类_剑会五人榜:显示(dt,x,y)
	---------------------
	-- 素材位置调整()
	-- ax=AFCHX
	-- ay=AFCHY
	-- self.资源组[1] = tp._自适应.创建(0,1,ax,ay,3,9)
	---------------------
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:显示(self.x+13,self.y+64)
	self.资源组[3]:显示(self.x+148,self.y+64)
	jhzts:置颜色(黄色):显示(self.x+222,self.y+3,"天下武功总榜")
	jhzts:置颜色(黑色):显示(self.x+45,self.y+69,"子榜选择")
	for n=1,5 do
		jhzts:显示(self.x+phxy[n],self.y+69,phwz[n])
	end

	for n=1,#子榜选择wz do
		if 子榜选择wz[n]~=nil then
			local jx=self.x+12
			local jy=self.y+92+(n-1)*20
			bw:置坐标(jx,jy)
			local xz = bw:检查点(x,y)
			if xz and self.门派选择 ~= 子榜选择wz[n]then
				box(jx+1,jy+1,jx+130,jy+23,-3551379)
				if mouseb(0) then
					self.门派选择 = 子榜选择wz[n]
					self:刷新排行信息()
				end
			elseif self.门派选择 == 子榜选择wz[n] then
			    box(jx+1,jy+1,jx+130,jy+23,-10790181)
			end

			jhzts:显示(self.x+24,self.y+97+(n-1)*20,子榜选择wz[n])
		end
	end
	if self.资源组[1]:是否选中(x,y) and 引擎.取鼠标滚轮() ==1 and self.加入 >= 1 then
		self.加入 = self.加入 - 1
	elseif self.资源组[1]:是否选中(x,y)  and 引擎.取鼠标滚轮() ==-1 then
		if self.加入+18 < #self.排行信息 then
			self.加入 = self.加入 + 1
		end
	end
	for n=1,18 do
		if self.排行信息[n+self.加入] ~= nil then
			jhzts:显示(self.x+153,self.y+97+(n-1)*20,n+self.加入)
			jhzts:显示(self.x+197,self.y+97+(n-1)*20,self.排行信息[n+self.加入].名称)
			jhzts:显示(self.x+301,self.y+97+(n-1)*20,self.排行信息[n+self.加入].门派)
			jhzts:显示(self.x+393,self.y+97+(n-1)*20,self.排行信息[n+self.加入].积分)
			jhzts:显示(self.x+474,self.y+97+(n-1)*20,self.排行信息[n+self.加入].胜率 .."%")
        end
	end
	for n=1,6 do
		self.按钮组[n]:更新(x,y,self.当前分组~=n)
		self.按钮组[n]:显示(self.x+13+(n-1)*86,self.y+32)
		if self.按钮组[n]:事件判断() then
			self.门派选择="全部门派"
			self.加入 = 0
			self.当前分组=n
			self:刷新排行信息()
		end
	end
end

function 场景类_剑会五人榜:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y) then
		return true
	end
end

function 场景类_剑会五人榜:初始移动(x,y)
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

function 场景类_剑会五人榜:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_剑会五人榜