local 场景类_打造 = class()
local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp,zts1
local tp
local remove = table.remove
local 打造说明 = {
	打造 = {
		强化人物装备 = "百炼精铁，制造指南书",--两个位置
		普通人物装备 = "百炼精铁，制造指南书",--两个位置
		召唤兽装备 = "上古锻造图策，天眼珠",--两个位置
		灵饰淬灵 = "元灵晶石，灵饰指南书",--两个位置
		},
	镶嵌 = {
		宝石 = "人物装备，宝石",--两个位置
		灵石 = "召唤兽装备，灵石",--两个位置
		珍珠 = "人物装备/召唤兽装备，珍珠",--两个位置
		点化石 = "召唤兽装备，点化石",--两个位置
		星辉石 = "人物灵饰，星辉石",--两个位置
		},
	合成 = {
		宝石 = "宝石",--两个位置
		灵石 = "灵石",--两个位置
		变身卡 = "变身卡",--两个位置
		碎石锤 = "碎石锤",--两个位置
		精铁 = "精铁",--两个位置
		暗器 = "暗器",--两个位置
		星辉石 = "星辉石", --三个位置
		钟灵石 = "钟灵石",--两个位置
		玄灵珠 = "玄灵珠",
		},
	修理 = {
		人物装备 = "人物装备，珍珠", --一个位置
		召唤兽装备 = "召唤兽装备，天眼珠/珍珠", --两个位置
		召唤兽装饰 = "召唤兽装饰，珍珠",--一个位置
		坐骑装饰 = "坐骑装饰，珍珠",--一个位置
		},
	熔炼 = {
		熔炼装备 = "人物装备，钨金", --两个位置
		还原装备 = "人物装备", --一个位置
		},
	分解 = {
		分解装备 = "人物装备/召唤兽装备", --一个位置
		分解灵犀玉 = "灵犀玉", --一个位置
		宝石降级 = "人物装备，碎石锤", --一个位置
		},
}
function 场景类_打造:初始化(根)
	self.ID = 31
	self.x = 187
	self.y = 129
	self.xx = 0
	self.yy = 0
	self.注释 = "打造"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 小型选项栏 = 根._小型选项栏
	self.分类标识 = "打造"
	self.功能标识 = "强化人物装备"
	self.资源组 = {
		-- [0] = 自适应.创建(1,1,415,18,1,3,nil,18),
		[1] = 自适应.创建(0,1,451,320,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true,self.分类标识),
		-- [4] = 按钮.创建(自适应.创建(22,4,27,20,4,3),0,0,4,true,true),
		-- [5] = 按钮.创建(自适应.创建(23,4,27,20,4,3),0,0,4,true,true),
		[6] = 按钮.创建(自适应.创建(12,4,55,22,1,3),0,0,4,true,true,"镶嵌"),
		[7] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"打造"),
		[8] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"镶嵌"),
		[9] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"合成"),
		[10] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"修理"),
		[11] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"熔炼"),
		[12] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"分解"),
		[13] = 按钮.创建(自适应.创建(12,4,55,22,1,1),0,0,4,true,true,"神器"),
		[14] = 自适应.创建(103,1,99,22,1,3,nil,18),--下拉框开始--自适应.创建(7,1,99,22,1,3,nil,18),
		[15] = 按钮.创建(自适应.创建(101,4,18,19,4,3),0,0,4,true,true),
		[16] = 小型选项栏.创建(自适应.创建(8,1,120,150,3,9),"功能类别"),
		[17] = 自适应.创建(7,1,92,22,1,3,nil,18),
		[21] = 资源:载入('pic/打造1.png',"图片"),
		[22] = 资源:载入('pic/打造2.png',"图片"),
	}

	self.物品限制 = {5,204} --元身
	self.资源组[3]:置偏移(14,0)
	local 格子 = 根._物品格子
	self.物品 = {}
	for i=1,180 do
		self.物品[i] = 格子(0,0,i1,"打造")
	end
	for n=2,3 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	for n=6,13 do
		self.资源组[n]:绑定窗口_(self.ID)
	end
	self.材料 = {}
	self.材料[1] = 格子(self.x+4,self.y,1,"打造材料")
	self.材料[2] = 格子(self.x+4,self.y,2,"打造材料")
	self.材料[3] = 格子(self.x+4,self.y,2,"打造材料")
	self.材料1位置 = nil
	self.材料2位置 = nil
	self.材料3位置 = nil
	self.开始 = 1
	self.结束 = 20
	self.总价 = 0
	self.体力 = 0
	self.窗口时间 = 0
	tp = 根
	zts = tp.字体表.普通字体
	zts1 = tp.字体表.描边字体
end


function 场景类_打造:打开(ss)
	if self.可视 then
		-- self.随身 = nil
		self.开始 = 1
		self.结束 = 20
		self.可视 = false
		-- if self.材料[1].物品 ~= nil then
		-- tp.道具列表[self.材料1位置] = self.材料[1].物品
		-- tp.窗口.道具行囊.物品[self.材料1位置]:置物品(tp.道具列表[self.材料1位置])
		-- 刷新道具逻辑(tp.道具列表[self.材料1位置],self.材料1位置,true)
		-- end
		-- if self.材料[2].物品 ~= nil then
	 --    tp.道具列表[self.材料2位置] = self.材料[2].物品
		-- tp.窗口.道具行囊.物品[self.材料2位置]:置物品(tp.道具列表[self.材料2位置])
		-- 刷新道具逻辑(tp.道具列表[self.材料2位置],self.材料2位置,true)
		-- end
		-- self.分类标识 = "打造"
		-- self.功能标识 = "强化人物装备"
		for i=1,3 do
			self.材料[i]:置物品(nil)
		end
	else
		insert(tp.窗口_,self)
		-- self.随身 = ss
		for i=self.开始,self.结束 do
			self.物品[i]:置物品(tp.道具列表[i])
		end
		for i=1,3 do
			self.材料[i]:置物品(nil)
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_打造:刷新道具(ss)
	self.开始 = 1
	self.结束 = 20
	for i=self.开始,self.结束 do
		self.物品[i]:置物品(ss[i])
	end
	for i=1,3 do
		self.材料[i]:置物品(nil)
	end
	self.消耗体力=0
	zj=0
end

function 场景类_打造:分类(标识)
	local ls = {}
	if 标识 == "打造" then
		ls = {"强化人物装备","普通人物装备","召唤兽装备","灵饰淬灵"}
	elseif 标识 == "镶嵌" then
		ls = {"宝石","灵石","点化石","星辉石","珍珠"}--,"珍珠"
	elseif 标识 == "合成" then
		ls = {"宝石","灵石","变身卡","碎石锤","精铁","暗器","星辉石","钟灵石","玄灵珠"}
	elseif 标识 == "修理" then
		ls = {"人物装备","召唤兽装备","召唤兽装饰","坐骑装饰"}
	elseif 标识 == "熔炼" then
		ls = {"熔炼装备","还原装备"}
	elseif 标识 == "分解" then
		ls = {"分解装备","分解灵犀玉","宝石降级"}
	elseif 标识 == "神器" then
		ls = {"神器打造"}
	end
	return ls
end
function 场景类_打造:显示(dt,x,y)
	if self.分类标识 == "打造" then
		if self.功能标识 == "强化人物装备" or self.功能标识 == "普通人物装备"  then
			self.物品限制 =  {5,204}
		elseif self.功能标识 == "召唤兽装备" then
			self.物品限制 = {3,3}
		elseif self.功能标识 == "灵饰淬灵" then
			self.物品限制 = {5}
		elseif self.功能标识 == "元身幻化" then
			self.物品限制 = {204,5}
		elseif self.功能标识 == "元身装备" then
			self.物品限制 = {204,5}
		end
	elseif self.分类标识 == "镶嵌" then
		if self.功能标识 == "宝石" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "灵石" then
			self.物品限制 = {2,"召唤兽镶嵌"}
		elseif self.功能标识 == "珍珠" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "点化石" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "星辉石" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "钟灵石" then
			self.物品限制 = {2,5}
		end
	elseif self.分类标识 == "合成" then
		if self.功能标识 == "宝石" then
			self.物品限制 = {5,5}
		elseif self.功能标识 == "灵石" then
			self.物品限制 = {"召唤兽镶嵌","召唤兽镶嵌"}
		elseif self.功能标识 == "变身卡" then
			self.物品限制 = {5,5}
		elseif self.功能标识 == "星辉石" then
			self.物品限制 = {5,5,5}
		elseif self.功能标识 == "钟灵石" then
			self.物品限制 = {5,5,5}
		elseif self.功能标识 == "玄灵珠" then
			self.物品限制 = {5,5,5}
		end
	elseif self.分类标识 == "修理" then
		if self.功能标识 == "人物装备" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "召唤兽装备" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "召唤兽装饰" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "坐骑装饰" then
			self.物品限制 = {2,5}
		end
	elseif self.分类标识 == "熔炼" then
		if self.功能标识 == "熔炼装备" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "还原装备" then
			self.物品限制 = {2}
		end
	elseif self.分类标识 == "分解" then
		if self.功能标识 == "分解装备" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "分解灵犀玉" then
			self.物品限制 = {2,5}
		elseif self.功能标识 == "宝石降级" then
			self.物品限制 = {2,5}
		end
	elseif self.分类标识 == "神器" then

	end
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if #self.物品限制 == 1 then
		self.资源组[3]:更新(x,y,self.材料[1].物品 ~= nil)
	elseif #self.物品限制 == 3 then
		self.资源组[3]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil and self.材料[3].物品 ~= nil)
	else
    	self.资源组[3]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil)
	end
	-- self.资源组[4]:更新(x,y,self.开始 ~= 1)
	-- self.资源组[5]:更新(x,y,self.结束 ~= 160)
	--self.资源组[6]:更新(x,y,self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil)
	self.资源组[7]:更新(x,y,self.分类标识 ~= "打造")
	self.资源组[8]:更新(x,y,self.分类标识 ~= "镶嵌")
	self.资源组[9]:更新(x,y,self.分类标识 ~= "合成")
	self.资源组[10]:更新(x,y,self.分类标识 ~= "修理")
	self.资源组[11]:更新(x,y,self.分类标识 ~= "熔炼")
	self.资源组[12]:更新(x,y,self.分类标识 ~= "分解")
	self.资源组[13]:更新(x,y,self.分类标识 ~= "神器")
	self.资源组[15]:更新(x,y)

	if self.鼠标 then
		if self.资源组[2]:事件判断() then
			if self.材料[1].物品 ~= nil then
				tp.道具列表[self.材料1位置] = self.材料[1].物品
				tp.窗口.道具行囊.物品[self.材料1位置]:置物品(tp.道具列表[self.材料1位置])
				刷新道具逻辑(tp.道具列表[self.材料1位置],self.材料1位置,true)
			end
			if self.材料[2].物品 ~= nil then
				tp.道具列表[self.材料2位置] = self.材料[2].物品
				tp.窗口.道具行囊.物品[self.材料2位置]:置物品(tp.道具列表[self.材料2位置])
				刷新道具逻辑(tp.道具列表[self.材料2位置],self.材料2位置,true)
			end
			if self.材料[3].物品 ~= nil then
				tp.道具列表[self.材料3位置] = self.材料[3].物品
				tp.窗口.道具行囊.物品[self.材料3位置]:置物品(tp.道具列表[self.材料3位置])
				刷新道具逻辑(tp.道具列表[self.材料3位置],self.材料3位置,true)
			end
			self:打开()
			return false
		elseif self.资源组[3]:事件判断() then
			if self.分类标识 == "熔炼" and self.功能标识 == "还原装备" then
			    local 事件 = function()
	            发送数据(4501,{序列=self.材料1位置,序列1=self.材料2位置,序列3=self.材料3位置,分类标识=self.分类标识,功能标识=self.功能标识})
		        end
	            tp.窗口.文本栏:载入("你确定要花"..self.总价.."两来还原这个装备的#R熔炼效果#W吗？",nil,true,事件)
	        else
	        	发送数据(4501,{序列=self.材料1位置,序列1=self.材料2位置,序列3=self.材料3位置,分类标识=self.分类标识,功能标识=self.功能标识})
			end
		elseif self.资源组[6]:事件判断() then
			-- 判断可以打造吗
		elseif self.资源组[7]:事件判断() then
			self.分类标识 = "打造"
			-- self.材料[1]:置物品(nil)
			-- self.材料[2]:置物品(nil)
			self.资源组[3]:置文字(self.分类标识)
			self.资源组[16]:打开(self:分类(self.分类标识))
			self.功能标识 = "强化人物装备"
		elseif self.资源组[8]:事件判断() then
			self.分类标识 = "镶嵌"
			self.资源组[3]:置文字(self.分类标识)
			self.资源组[16]:打开(self:分类(self.分类标识))
			self.功能标识 = "宝石"
		elseif self.资源组[9]:事件判断() then
			self.分类标识 = "合成"
			self.资源组[3]:置文字(self.分类标识)
			self.资源组[16]:打开(self:分类(self.分类标识))
			self.功能标识 = "宝石"
		elseif self.资源组[10]:事件判断() then
			self.分类标识 = "修理"
			self.资源组[3]:置文字(self.分类标识)
			self.资源组[16]:打开(self:分类(self.分类标识))
			self.功能标识 = "人物装备"
		elseif self.资源组[11]:事件判断() then
			self.分类标识 = "熔炼"
			self.资源组[3]:置文字(self.分类标识)
			self.资源组[16]:打开(self:分类(self.分类标识))
			self.功能标识 = "熔炼装备"
		elseif self.资源组[12]:事件判断() then
			self.分类标识 = "分解"
			self.资源组[3]:置文字(self.分类标识)
			self.资源组[16]:打开(self:分类(self.分类标识))
			self.功能标识 = "分解装备"
		elseif self.资源组[13]:事件判断() then
			tp.窗口.对话栏:文本("","","你想进行哪种操作呢？",{"炼制灵犀之屑","合成灵犀玉","更换神器五行"})
			self:打开()
		elseif self.资源组[15]:事件判断() then
			self.资源组[16]:打开(self:分类(self.分类标识))
			self.资源组[16]:置选中(self.功能标识)
		end
	end
	self.资源组[1]:显示(self.x,self.y)

	tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2+5,self.y+3,"制 造")
	self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)
	self.资源组[3]:显示(self.x + 98,self.y + 290,true)
	-- self.资源组[4]:显示(self.x + 369,self.y + 80)
	-- self.资源组[5]:显示(self.x + 398,self.y + 80)
	--self.资源组[6]:显示(self.x + 70,self.y + 122,true)
	tp.物品界面背景_:显示(self.x+184,self.y+93)

	self.资源组[7]:显示(self.x + 15,self.y + 34,true,nil,nil,self.分类标识 == "打造",2)
	self.资源组[8]:显示(self.x + 75 ,self.y + 34,true,nil,nil,self.分类标识 == "镶嵌",2)
	self.资源组[9]:显示(self.x + 135,self.y + 34,true,nil,nil,self.分类标识 == "合成",2)
	self.资源组[10]:显示(self.x + 195,self.y + 34,true,nil,nil,self.分类标识 == "修理",2)
	self.资源组[11]:显示(self.x + 255,self.y + 34,true,nil,nil,self.分类标识 == "熔炼",2)
	self.资源组[12]:显示(self.x + 315,self.y + 34,true,nil,nil,self.分类标识 == "分解",2)
	self.资源组[13]:显示(self.x + 375,self.y + 34,true,nil,nil,self.分类标识 == "神器",2)

	local is = self.开始 - 1

	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51-51 + 175+10 + self.x,h * 51 + self.y + 48-7)
			local xq = nil
			if self.物品[is].物品 and self.物品[is].物品.名称 and (self.物品[is].物品.名称=="红玛瑙"
			or self.物品[is].物品.名称=="太阳石"
			or self.物品[is].物品.名称=="舍利子"
			or self.物品[is].物品.名称=="黑宝石"
			or self.物品[is].物品.名称=="月亮石"
			or self.物品[is].物品.名称=="神秘石"
			or self.物品[is].物品.名称=="光芒石"
			or self.物品[is].物品.名称=="精魄灵石"
			or self.物品[is].物品.名称=="玄灵珠·回春"
			or self.物品[is].物品.名称=="玄灵珠·破军"
			or self.物品[is].物品.名称=="玄灵珠·空灵"
			or self.物品[is].物品.名称=="玄灵珠·噬魂"
			or self.物品[is].物品.名称=="星辉石") then --物品详情
				xq = self.物品[is].物品.级别限制.."级"
			end
			self.物品[is]:显示(dt,x,y,self.鼠标,self.物品限制,nil,nil,nil,xq)
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and self.鼠标 then
					-- local zl = self.物品[is].物品.子类
					-- if self.物品[is].物品.总类 == 5 and self.物品[is].物品.分类 == 4 then
					-- 	zl = nil
					-- end
					-- if self.物品[is].物品.总类 == 2 then
					-- 	zl = self.物品[is].物品.级别限制
					-- end
					if self.分类标识 == "合成" and (self.功能标识 == "星辉石" or  self.功能标识 == "钟灵石" or self.功能标识 == "玄灵珠") then
						if self.材料[1].物品 == nil and self.材料[2].物品 == nil then
							self.材料[1]:置物品(self.物品[is].物品)
							if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil  then
								self.体力,self.总价 = 打造判定消耗(self.材料[1].物品,self.材料[2].物品,self.分类标识,self.功能标识)
							end
							self.材料1位置 = is
							self.物品[is]:置物品(nil)
						elseif self.材料[1].物品 ~= nil and self.材料[2].物品 == nil then
							self.材料[2]:置物品(self.物品[is].物品)
							if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil  then
								self.体力,self.总价 = 打造判定消耗(self.材料[1].物品,self.材料[2].物品,self.分类标识,self.功能标识)
							end
							self.材料2位置 = is
							self.物品[is]:置物品(nil)
						elseif self.材料[1].物品 == nil and self.材料[2].物品 ~= nil then
							self.材料[1]:置物品(self.物品[is].物品)
							if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil  then
								self.体力,self.总价 = 打造判定消耗(self.材料[1].物品,self.材料[2].物品,self.分类标识,self.功能标识)
							end
							self.材料1位置 = is
							self.物品[is]:置物品(nil)
						elseif self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil and self.材料[3].物品 == nil then
							self.材料[3]:置物品(self.物品[is].物品)
							if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil  then
								self.体力,self.总价 = 打造判定消耗(self.材料[1].物品,self.材料[2].物品,self.分类标识,self.功能标识)
							end
							self.材料3位置 = is
							self.物品[is]:置物品(nil)
						end
					elseif self.分类标识 == "熔炼" and self.功能标识 == "还原装备" then
						if self.材料[1].物品 == nil then
							self.材料[1]:置物品(self.物品[is].物品)
							if self.材料[1].物品 ~= nil then
								self.体力,self.总价 = 打造判定消耗(self.材料[1].物品,self.材料[2].物品,self.分类标识,self.功能标识)
							end
							self.材料1位置 = is
							self.物品[is]:置物品(nil)
						end
					else
						if self.材料[1].物品 == nil and self.材料[2].物品 == nil then
							self.材料[1]:置物品(self.物品[is].物品)
							if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil  then
								self.体力,self.总价 = 打造判定消耗(self.材料[1].物品,self.材料[2].物品,self.分类标识,self.功能标识)
							end
							self.材料1位置 = is
							self.物品[is]:置物品(nil)
						elseif self.材料[1].物品 ~= nil and self.材料[2].物品 == nil then
							self.材料[2]:置物品(self.物品[is].物品)
							if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil  then
								self.体力,self.总价 = 打造判定消耗(self.材料[1].物品,self.材料[2].物品,self.分类标识,self.功能标识)
							end
							self.材料2位置 = is
							self.物品[is]:置物品(nil)
						elseif self.材料[1].物品 == nil and self.材料[2].物品 ~= nil then
							self.材料[1]:置物品(self.物品[is].物品)
							if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil  then
								self.体力,self.总价 = 打造判定消耗(self.材料[1].物品,self.材料[2].物品,self.分类标识,self.功能标识)
							end
							self.材料1位置 = is
							self.物品[is]:置物品(nil)
						end
					end
					刷新道具逻辑(self.物品[is].物品,is,true)
				end
			end
			if self.物品[is].焦点 then
				self.焦点 = true
			end
		end
	end
    if self.分类标识 == "合成" and (self.功能标识 == "星辉石" or  self.功能标识 == "钟灵石" or self.功能标识 == "玄灵珠") then
        self.资源组[22]:显示(self.x + 13,self.y + 92)
		tp.物品格子背景_:显示(self.x+13+18,self.y+101)
		tp.物品格子背景_:显示(self.x+13+17+70,self.y+101)
		tp.物品格子背景_:显示(self.x+13+18,self.y+101+58)
		for i=3,4 do
			self.资源组[17]:显示(self.x+80,self.y+169+30*(i-1))
		end
		zts:置颜色(白色)
		zts:显示(self.x+15,self.y+68,self.分类标识.."：	")
		zts:显示(self.x+177,self.y+68,"需要材料：")
		zts:显示(self.x+15,self.y+233,"所需体力")
		zts:显示(self.x+15,self.y+263,"现有体力")
		zts:置颜色(黄色)
		zts:显示(self.x+243,self.y+68,打造说明[self.分类标识][self.功能标识])
		for ns=1,3 do
			if ns==3 then
			    self.材料[ns]:置坐标(self.x+34,self.y+157)
				self.材料[ns]:显示(dt,x,y,self.鼠标,false)
			else
				self.材料[ns]:置坐标(self.x-31-3 + (ns * 68),self.y+116-17)
				self.材料[ns]:显示(dt,x,y,self.鼠标,false)
			end
			if self.材料[ns].物品 ~= nil and self.材料[ns].焦点 and not 引擎.场景.选项栏选中 then
				tp.提示:道具行囊(x,y,self.材料[ns].物品)
				if mouseb(0) and self.鼠标 then
					if 取物品数量() < 160 then
						if ns == 1 then
							tp.道具列表[self.材料1位置] = self.材料[ns].物品
							tp.窗口.道具行囊.物品[self.材料1位置]:置物品(tp.道具列表[self.材料1位置])
							刷新道具逻辑(tp.道具列表[self.材料1位置],self.材料1位置,true)
						elseif ns == 2 then
							tp.道具列表[self.材料2位置] = self.材料[ns].物品
							tp.窗口.道具行囊.物品[self.材料2位置]:置物品(tp.道具列表[self.材料2位置])
							刷新道具逻辑(tp.道具列表[self.材料2位置],self.材料2位置,true)
						elseif ns == 3 then
							tp.道具列表[self.材料3位置] = self.材料[ns].物品
							tp.窗口.道具行囊.物品[self.材料3位置]:置物品(tp.道具列表[self.材料3位置])
							刷新道具逻辑(tp.道具列表[self.材料3位置],self.材料3位置,true)
						end
						self.体力,self.总价 = 0,0
						self.材料[ns]:置物品(nil)
					else
						tp.常规提示:打开("#Y/包裹已满。请及时清理")
					end
					break
				end
			end
			if self.材料[ns].焦点 then
				self.焦点 = true
			end
		end
		if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil and self.材料[3].物品 ~= nil then
			zts:置颜色(0xFF000000)
			-- zts:显示(self.x + 86,self.y + 173,self.总价)
			zts:显示(self.x + 86,self.y + 233,self.体力)
		end
		zts:置颜色(0xFF000000)
		-- zts:显示(self.x + 86,self.y + 203,tp.金钱)
		zts:显示(self.x + 86,self.y + 263,tp.队伍[1].体力)
	elseif self.分类标识 == "熔炼" and self.功能标识 == "还原装备" then
		self.资源组[3]:置文字("还原")
		self.资源组[21]:显示(self.x + 13,self.y + 92)
		tp.物品格子背景_:显示(self.x+13+18,self.y+101)
		-- tp.物品格子背景_:显示(self.x+13+17+70,self.y+101)
		for i=1,4 do
			self.资源组[17]:显示(self.x+80,self.y+169+30*(i-1))
		end
		zts:置颜色(白色)
		zts:显示(self.x+15,self.y+68,self.分类标识.."：	")
		zts:显示(self.x+177,self.y+68,"需要材料：")
		zts:显示(self.x+15,self.y+173,"所需资金")
		zts:显示(self.x+15,self.y+203,"所有资金")
		zts:显示(self.x+15,self.y+233,"所需体力")
		zts:显示(self.x+15,self.y+263,"现有体力")
		zts:置颜色(黄色)
		zts:显示(self.x+243,self.y+68,打造说明[self.分类标识][self.功能标识])
		self.材料[1]:置坐标(self.x-31-3 + (1 * 68),self.y+116-17)
		self.材料[1]:显示(dt,x,y,self.鼠标,false)
		if self.材料[1].物品 ~= nil and self.材料[1].焦点 and not 引擎.场景.选项栏选中 then
			tp.提示:道具行囊(x,y,self.材料[1].物品)
			if mouseb(0) and self.鼠标 then
				if 取物品数量() < 160 then
					tp.道具列表[self.材料1位置] = self.材料[1].物品
					tp.窗口.道具行囊.物品[self.材料1位置]:置物品(tp.道具列表[self.材料1位置])
					刷新道具逻辑(tp.道具列表[self.材料1位置],self.材料1位置,true)
					self.体力,self.总价 = 0,0
					self.材料[1]:置物品(nil)
				else
					tp.常规提示:打开("#Y/包裹已满。请及时清理")
				end
			end
		end
		if self.材料[1].焦点 then
			self.焦点 = true
		end
		if self.材料[1].物品 ~= nil then
			zts:置颜色(0xFF000000)
			zts:显示(self.x + 86,self.y + 173,self.总价)
			zts:显示(self.x + 86,self.y + 233,self.体力)
		end
		zts:置颜色(0xFF000000)
		zts:显示(self.x + 86,self.y + 203,tp.金钱)
		zts:显示(self.x + 86,self.y + 263,tp.队伍[1].体力)
	else
		self.资源组[21]:显示(self.x + 13,self.y + 92)
		tp.物品格子背景_:显示(self.x+13+18,self.y+101)
		tp.物品格子背景_:显示(self.x+13+17+70,self.y+101)
		for i=1,4 do
			self.资源组[17]:显示(self.x+80,self.y+169+30*(i-1))
		end
		zts:置颜色(白色)
		zts:显示(self.x+15,self.y+68,self.分类标识.."：	")
		zts:显示(self.x+177,self.y+68,"需要材料：")
		zts:显示(self.x+15,self.y+173,"所需资金")
		zts:显示(self.x+15,self.y+203,"所有资金")
		zts:显示(self.x+15,self.y+233,"所需体力")
		zts:显示(self.x+15,self.y+263,"现有体力")
		zts:置颜色(黄色)
		zts:显示(self.x+243,self.y+68,打造说明[self.分类标识][self.功能标识])
		for ns=1,2 do
			self.材料[ns]:置坐标(self.x-31-3 + (ns * 68),self.y+116-17)
			self.材料[ns]:显示(dt,x,y,self.鼠标,false)
			if self.材料[ns].物品 ~= nil and self.材料[ns].焦点 and not 引擎.场景.选项栏选中 then
				tp.提示:道具行囊(x,y,self.材料[ns].物品)
				if mouseb(0) and self.鼠标 then
					if 取物品数量() < 160 then
						if ns == 1 then
							tp.道具列表[self.材料1位置] = self.材料[ns].物品
							tp.窗口.道具行囊.物品[self.材料1位置]:置物品(tp.道具列表[self.材料1位置])
							刷新道具逻辑(tp.道具列表[self.材料1位置],self.材料1位置,true)
						elseif ns == 2 then
							tp.道具列表[self.材料2位置] = self.材料[ns].物品
							tp.窗口.道具行囊.物品[self.材料2位置]:置物品(tp.道具列表[self.材料2位置])
							刷新道具逻辑(tp.道具列表[self.材料2位置],self.材料2位置,true)
						end
						self.体力,self.总价 = 0,0
						self.材料[ns]:置物品(nil)
					else
						tp.常规提示:打开("#Y/包裹已满。请及时清理")
					end
					break
				end
			end
			if self.材料[ns].焦点 then
				self.焦点 = true
			end
		end
		if self.材料[1].物品 ~= nil and self.材料[2].物品 ~= nil then
			zts:置颜色(0xFF000000)
			zts:显示(self.x + 86,self.y + 173,self.总价)
			zts:显示(self.x + 86,self.y + 233,self.体力)
		end
		zts:置颜色(0xFF000000)
		zts:显示(self.x + 86,self.y + 203,tp.金钱)
		zts:显示(self.x + 86,self.y + 263,tp.队伍[1].体力)
    end
    self.资源组[14]:显示(self.x+55,self.y+78-13)
	self.资源组[15]:显示(self.x+148,self.y+74-9)
	self.资源组[16]:显示(self.x+55,self.y+94-7,x,y,self.鼠标)



	if self.资源组[16]:事件判断() then
		self.功能标识 = self.资源组[16].弹出事件
		self.资源组[16].弹出事件 = nil
	end
	zts:置颜色(白色)
	zts:显示(self.x+62,self.y+68,self.功能标识)
end

function 场景类_打造:打造成功()
	self.材料[1]:置物品(nil)
	self.材料[2]:置物品(nil)
end

function 场景类_打造:检查点(x,y)
	local n = false
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		n  = true
	end
	return n
end

function 场景类_打造:初始移动(x,y)
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

function 场景类_打造:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end


return 场景类_打造