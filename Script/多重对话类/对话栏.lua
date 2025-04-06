-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-12 06:26:33
local 场景类_对话栏 = class()
local bw = require("gge包围盒")
local floor = math.floor
local ceil = math.ceil
local insert = table.insert
local remove = table.remove
local format = string.format
local random = 引擎.取随机整数
local tp
local max = math.max
local tx = 引擎.取头像
local sort = table.sort
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
local insert = insert
local zts
local qdhys={}

function 场景类_对话栏:初始化(根)
	self.ID = 57
	self.x = 128
	self.y = 300
	self.xx = 0
	self.yy = 0
	self.注释 = "对话栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	tp = 根
	local 资源 = tp.资源
	local 自适应 = tp._自适应
	local 按钮 = 根._按钮
	self.资源组 = {
		[1] = 资源:载入('common/wzife.wdf',"网易WDF动画",0x260BE57C),
		[2] = 自适应.创建(28,1,40,28,1,3,nil,18),
		[3] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x346068E5),0,0,4,true,true),
		[4] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true," 上一页"),
		[5] = 按钮.创建(自适应.创建(12,4,75,22,1,3),0,0,4,true,true," 下一页"),
	}
	-- self.资源组[3]:绑定窗口_(self.ID)
	self.资源组[4]:绑定窗口_(self.ID)
	self.资源组[5]:绑定窗口_(self.ID)
	self.背景窗口 = tp._自适应.创建(76,1,688,220,3,9)
	self.头像 = ""
	self.名称 = ""
	self.头像宽度 = 0
	self.头像高度 = 0
	self.文本高度 = 0
	self.选项 = {}
	-- self.返回寄存 = nil
	self.记录文本 = {}
	self.丰富文本 = 根._丰富文本(570,150,16)
	-- self.背景窗口:置宽高(688,220)
	-- self.丰富文本:置宽度(570) --640
	self.丰富文本.行间距=8
	self.窗口时间 = 0
	self.坐标 = 0
	self.关闭事件 = false
	self.接触按钮 = false
	self.缓冲时间 = 0 -- 都有缓冲时间，避免重复点击
	self.模型头像 = ""
	-- self.当前宽度=800
	qdhys["打造任务"]=-65536
	qdhys["上交物品"]=-65536
	qdhys["师门任务"]=-65536
	qdhys["上交召唤兽"]=-65536
	qdhys["上交乾坤袋"]=-65536
	qdhys["宠物修炼任务"]=-65536
	qdhys["这就拜您为师！"]=0xFF00FF00
	qdhys["初识地宫"]=0xFF00FF00
	qdhys["我要提升召唤兽忠诚"]=0xFF00FF00
	-- qdhys["一键出售"]=0xFFFF0000
	zts = tp.字体表.对话栏文字
end

function 场景类_对话栏:打开()
	if self.可视 then
		self.丰富文本:清空()
		self.选项 = {}
		self.记录文本 = {}
		self.可视 = false
		self.头像 = ""
		self.模型头像 = ""
		self.第二列 = nil
		self.第三列 = nil
		self.第四列 = nil
		-- self.返回寄存 = nil
		self.fujia=nil
		self.文本内容 = nil
		PK选中玩家=0
		tp.场景.事件选中 = false
		self.可视 = false
	else
		-- if self.当前宽度 ~=  全局游戏宽度 then
		-- 	self.当前宽度=全局游戏宽度
		self.x = 取界面坐标(688)
			if 全局游戏宽度==1024 then

				self.y = 360
				-- self.背景窗口:置宽高(688,220)
				-- self.丰富文本:置宽度(570) --640
				-- self.丰富文本.行间距=8
			else
				-- self.x = 63
				self.y = 264
		  --   	self.背景窗口:置宽高(525,180)
				-- self.丰富文本:置宽度(490,150)
			end
		-- end
		self.加入 = 0
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 场景类_对话栏:显示(dt,x,y)
	if self.缓冲时间 > 0  then
		self.缓冲时间 = self.缓冲时间 - 0.2
	end

	self.接触按钮 = false
	if self.头像 ~= "" then
		local v = self.头像宽度
		if v > 50 then
			v = self.x + 13
		end
		self.头像:显示(self.x+15+self.头像.信息组[0][2],self.y-self.头像高度+2,1)
	end
	if self.名称 ~= nil and self.名称 ~= "" then
		self.资源组[1]:显示(self.x,self.y-27)
		zts:置颜色(4294967295):显示(self.x+10 + (78 - #self.名称*3.72),self.y-20,self.名称)
	end
	self.背景窗口:显示(self.x,self.y)
	self.资源组[3]:更新(x,y)
	self.资源组[3]:显示(self.x-20+self.背景窗口.宽度,self.y+3,true)
	self.丰富文本:显示(self.x+18,self.y+17)
	self:选项解析(x,y)
	self.焦点 = false
	if self.鼠标 then
		if self.资源组[3]:是否选中(x,y) then
			-- tp.消息栏焦点=true
			-- tp.按钮焦点=true
			if 引擎.鼠标弹起(左键) then
				self:打开()
				return
			end
		end
		if not self.接触按钮 and not (self.头像 ~= "" and self.头像:是否选中(x,y)) and self.缓冲时间 <= 0 then
			if mouseb(0) then
				if #self.记录文本 > 0 then
					self:下一页()
				else
					if self.选项 == nil or (self.选项 ~= nil and self.选项[1] == nil) then
						-- if self.放载事件 ~= nil then
						-- 	for i=1,#self.放载事件 do
						-- 		loadstring(self.放载事件[i])()
						-- 	end
						-- 	for i=1,#(self.结束事件 or {}) do
						-- 		loadstring(self.结束事件[i])()
						-- 	end
						-- end
						if self.结束事件 == nil then
							self:打开()
						else
							self:下一页()
							self.结束事件 = nil
						end
					end
					return false
				end
			end
		end
	end


	if 引擎.鼠标弹起(右键) then self:打开() return  end
end

function 场景类_对话栏:选项解析(x,y)
	if #self.选项 > 20 then
		if self.加入>0 then
			self.资源组[4]:更新1(x,y,self.加入>0)
			self.资源组[4]:显示(self.x+580,self.y+150)
		end
		if self.加入< #self.选项 - 20 then
			self.资源组[5]:更新1(x,y,self.加入< #self.选项 - 20)
			self.资源组[5]:显示(self.x+580,self.y+180)
		end
		if self.资源组[4]:事件判断() and self.资源组[4]:是否选中(x,y) then
			if self.加入 > 0 then
				self.加入 = self.加入 - 10
				if self.加入 < 0 then
					self.加入 = 0
				end
			end
		end
		if self.资源组[5]:事件判断() and self.资源组[5]:是否选中(x,y) then
			if self.加入 < #self.选项 then
				self.加入 = self.加入 + 10
				if self.加入 > #self.选项 - 20 then
					self.加入 = #self.选项 - 20
				end
			end
		end
	end
	if #self.选项 > 0 then
		for n=1, 20 do
			if self.选项[n+self.加入]~=nil then
				--local 颜色 =
				local xx = 0
				local yy = 0
				if n<=5 then
					self.选项[n+self.加入].选中判断:置坐标(self.x+20,self.y + self.文本高度+((n-1) * 27) )
				elseif n <= 10 then
					self.选项[n+self.加入].选中判断:置坐标(self.x+self.第二列,self.y + self.文本高度+((n-6) * 27 ))
				elseif n <= 15 then
					self.选项[n+self.加入].选中判断:置坐标(self.x+self.第三列,self.y + self.文本高度+((n-11) * 27 ))
				elseif n <= 20 then
					self.选项[n+self.加入].选中判断:置坐标(self.x+self.第四列 ,self.y + self.文本高度+((n-16) * 27 ))
				end
				if self.鼠标 and self.选项[n+self.加入].选中判断:检查点(x,y) and not self.焦点 then
					self.接触按钮 = true
					self.焦点 = true
					if mousea(0) then
						xx = 1
						yy = 1
					end
					self.资源组[2]:置宽高(zts:取宽度(self.选项[n+self.加入].基本内容)+13,28)
					self.资源组[2]:显示(self.选项[n+self.加入].选中判断.x-7+xx,self.选项[n+self.加入].选中判断.y-4+yy)
					if mouseb(0) then
						if self.选项[n+self.加入].跳转链接 ~= nil then
							local 当前地图 = tp.当前地图
							self:事件解析(self.选项[n+self.加入].跳转链接,当前地图,self.名称)
							if self.关闭事件 then
								self.关闭事件 = false
								break
							end
						end
					end
				end
				local ztys=qdhys[self.选项[n+self.加入].基本内容]
				if ztys then
					zts:置颜色(ztys)
				else
					zts:置颜色(0xFFFFFF00)
				end

				if n<=5 then
					zts:显示(self.x+20 + xx,self.y  + yy + self.文本高度+((n-1) * 27) ,self.选项[n+self.加入].基本内容)
				elseif n <= 10 then
					zts:显示(self.x+self.第二列 + xx,self.y  + yy + self.文本高度+((n-6) * 27),self.选项[n+self.加入].基本内容)
				elseif n <= 15 then
					zts:显示(self.x+self.第三列 + xx,self.y  + yy + self.文本高度+((n-11) * 27),self.选项[n+self.加入].基本内容)
				elseif n <= 20 then
					zts:显示(self.x+self.第四列 + xx,self.y  + yy + self.文本高度+((n-16) * 27),self.选项[n+self.加入].基本内容)
				end
			end
		end
	end
end

local 大小排序 = function(a,b)
	return a < b
end

function 场景类_对话栏:文本(头像,名称,内容,选项,放载事件,附加事件,下一页事件)--,寄存
	if 下一页事件~= nil and #下一页事件 < 1 then 下一页事件 = nil end
	if self.可视 then self:打开() end
	if 内容==nil then return  end
	for i=1,#tp.窗口_ do
		if tp.窗口_[i] == self then
			remove(tp.窗口_,i)
			break
		end
	end
	insert(tp.窗口_,self)
	self.第二列 = nil
	self.第三列 = nil
	self.第四列 = nil
	self.文本内容 = 内容
	self.fujia = 附加事件
	if not self.可视 then
		self:打开()
		self.选项 = {}
		self.名称 = 名称
		self.丰富文本:清空()
		self.下一页事件 = 下一页事件
		local ab = self.丰富文本:添加文本(内容)
		if 头像 ~= "" and 头像 ~= nil then
			local 头像资源 = tx(头像)
			if 头像资源[4] and 头像资源[4] ~= 4048229990 and 头像资源[4] ~= 0 then
				self.头像 = tp.资源:载入(头像资源[10] or 头像资源[7],"网易WDF动画",头像资源[4])
				self.头像高度 = self.头像.高度 + tp:取y偏移(头像)
				self.模型头像 = 头像
			else
				self.头像 = ""
				self.模型头像 = ""
			end
		else
			self.头像 = ""
			self.模型头像 = ""
		end
		self.文本高度 = ab+23
		if 选项 ~= nil and 选项 ~= "" and type(选项)=="table" and 选项[1] ~= nil then
			local jc = nil
			if #选项 > 5 then
				jc = {}
			end
			for i=1,#选项 do
				if jc ~= nil then
					insert(jc,zts:取宽度(选项[i]))
					if #jc >= 5 then
						sort(jc,大小排序)
						if self.第二列 == nil then
							self.第二列 = jc[#jc] + 24 + 35
						elseif self.第三列 == nil then
							self.第三列 = self.第二列 + jc[#jc] + 35
						elseif self.第四列 == nil then
							self.第四列 = self.第三列 + jc[#jc] + 35
						end
						jc = {}
					end
				end
				self.选项[i] = {
					基本内容 = 选项[i],
					跳转链接 = 选项[i],
					选中判断 = bw(0,0,zts:取宽度(选项[i]),14)
				}
			end
		end
		self.缓冲时间 = 2
		if self.下一页事件 ~= nil then
			local 记录 = {
				头像_ = self.下一页事件[1],
				名称_ = self.下一页事件[2],
				内容_ = self.下一页事件[3],
				选项_ = self.下一页事件[4],
				下一页事件_ = self.下一页事件[5],
			}
			insert(self.记录文本,记录)
		end
	else
		local 记录 = {
			头像_ = 头像,
			名称_ = 名称,
			内容_ = 内容,
			选项_ = 选项,
			下一页事件_ = 下一页事件,
		}
		insert(self.记录文本,记录)
	end
end

function 场景类_对话栏:下一页()
	if self.记录文本[1] ~= nil then
		for i=1,#tp.窗口_ do
			if tp.窗口_[i] == self then
				remove(tp.窗口_,i)
				break
			end
		end
		insert(tp.窗口_,self)
		self.选项 = {}
		self.第二列 = nil
		self.第三列 = nil
		self.第四列 = nil
		local 内容 = self.记录文本[1].内容_
		local 名称 = self.记录文本[1].名称_
		local 头像 = self.记录文本[1].头像_
		local 选项 = self.记录文本[1].选项_
		self.下一页事件 = self.记录文本[1].下一页事件_
		if self.下一页事件 ~= nil then
			local 记录 = {
				头像_ = self.下一页事件[1],
				名称_ = self.下一页事件[2],
				内容_ = self.下一页事件[3],
				选项_ = self.下一页事件[4],
				下一页事件_ = self.下一页事件[5],
			}
			insert(self.记录文本,记录)
		end
		local w = zts:取宽度(内容)
		if w > 438 then
			w = 438
		end
		self.文本内容 = 内容
		self.名称 = 名称
		if self.模型头像 ~= 头像 then
			if 头像 ~= "" and 头像 ~= nil then
				local 头像资源 = tx(头像)
				if 头像资源[4] and 头像资源[4] ~= 4048229990 and 头像资源[4] ~= 0 then
					self.头像 = tp.资源:载入(头像资源[10] or 头像资源[7],"网易WDF动画",头像资源[4])
					self.头像高度 = self.头像.高度 + tp:取y偏移(头像)
					self.模型头像 = 头像
				else
					self.头像 = ""
					self.模型头像 = ""
				end
			else
				self.头像 = ""
				self.模型头像 = ""
			end
		end

		self.丰富文本:清空()
		local ab = self.丰富文本:添加文本(内容)
		self.文本高度 = ab+23
		if 选项 ~= nil and 选项 ~= "" and 选项[1] ~= nil then
			local jc = nil
			if #选项 > 5 then
				jc = {}
			end
			for i=1,#选项 do
				if jc ~= nil then
					insert(jc,zts:取宽度(选项[i]))
					if #jc >= 5 then
						sort(jc,大小排序)
						if self.第二列 == nil then
							self.第二列 = jc[#jc] + 24 + 35
						elseif self.第三列 == nil then
							self.第三列 = self.第二列 + jc[#jc] + 35
						elseif self.第四列 == nil then
							self.第四列 = self.第三列 + jc[#jc] + 35
						end
						jc = {}
					end
				end
				self.选项[i] = {
					基本内容 = 选项[i],
					跳转链接 = 选项[i],
					选中判断 = bw(0,0,zts:取宽度(选项[i]),14)
				}
			end
		end
		self.缓冲时间 = 3
		remove(self.记录文本,1)
	else
		self.可视 = false
	end
end

function 场景类_对话栏:检查点(x,y)
	if self.可视 and (self.背景窗口:是否选中(x,y)  or (self.头像 ~= nil and self.头像 ~= "" and self.头像:是否选中(x,y))) then
		return true
	else
		return false
	end
end

function 场景类_对话栏:初始移动()
	tp.运行时间 = tp.运行时间 + 1
	self.窗口时间 = tp.运行时间
end

function 场景类_对话栏:开始移动()
end

function 场景类_对话栏:事件解析(事件,地图1,名称,名称1)
	if 事件 == "不了不了" or 事件 == "算了算了" or 事件 == "太贵了我没钱" or 事件 == "我随便逛逛 不好意思" or 事件 == "我只是来看看" or 事件 == "我只是看看" or 事件 == "只是路过" or 事件 == "我只是路过" or 事件 == "我只是随便看看" or 事件 == "我还要逛逛" or 事件 == "我点错了" or 事件 == "我什么也不想做" or 事件 == "我保留意见" or 事件 == "我什么都不想做" or 事件 == "没什么，我只是看看" or 事件 == "我们后会有期" or 事件 =="稍等。"then
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "帮主" or 事件 == "副帮主" or 事件 == "左护法" or 事件 == "右护法" or 事件 == "长老" or 事件 == "堂主" or 事件 == "帮众" or 事件 == "商人" then
		if tp.窗口.帮派界面.在线玩家[tp.窗口.帮派界面.在线选中] == nil  then
			tp.常规提示:打开("#Y/目标不能为空！")
			return
		end
		发送数据(41,{对方数据=tp.窗口.帮派界面.在线玩家[tp.窗口.帮派界面.在线选中],类型="任命职位",职位=事件})
		tp.窗口.帮派界面.在线选中 = 0
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "F1" or 事件 == "F2" or 事件 == "F3" or 事件 == "F4" or 事件 == "F5" or 事件 == "F6" or 事件 == "F7" or 事件 == "F8" then
		发送数据(11.1,{位置=事件,类型=4})
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif tp.窗口.坐骑技能栏.可视 and 事件==" 确认 " then
		发送数据(63,{认证码=tp.窗口.坐骑技能栏.认证码,技能=tp.窗口.坐骑技能栏.技能[tp.窗口.坐骑技能栏.选中].技能.名称})
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "乾元丹学习" then
		self.可视 = false
		self.文本栏焦点 = false
		tp.窗口.兑换乾元:打开()
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "我要吸附魔兽要诀" then
		发送数据(3759,{兽诀格子=tp.窗口.鉴定.选中兽诀})
		tp.窗口.鉴定.选中兽诀=nil
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "购买法系神兽" or 事件 == "购买物理神兽" then
		tp.常规提示:打开("#Y/暂时无法购买此项目")
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "切磋" or 事件 == "单挑" then
		if PK选中玩家==0 then
			tp.常规提示:打开("#Y/先看下他是不是队长吧")
			return 0
		end
		if 事件 == "切磋" then
			发送数据(6561,{序列=PK选中玩家})
		elseif 事件 == "单挑" then
			发送数据(6562,{序列=PK选中玩家})
		end
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "确定购买仓库" or 事件 == "确定购买召唤兽仓库"  then
		if 事件 == "确定购买仓库" then
			发送数据(6704)
		elseif 事件 == "确定购买召唤兽仓库"  then
			发送数据(6804)
		end
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "一键出售" then
		发送数据(3785,{shijian=事件})
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "开通战前施法" or 事件=="查询我现在的战前施法技能" or 事件=="我要转换战前施法技能" or 事件=="暂时停用功能" or 事件=="恢复使用功能" then
		发送数据(676,{shijian=事件})
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "购买自动抓鬼卡" then
		发送数据(3786,{shijian=事件})
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "确定更新回收物品表"  then
		if  引擎.文件是否存在("回收设置/物品回收.txt") then
			local sadwrr=读入文件("回收设置/物品回收.txt")
			发送数据(6905,{sadwrr})
		else
			tp.常规提示:打开("#Y/未检测到文件【回收设置/物品回收.txt】")
		end
		self.可视 = false
		self.文本栏焦点 = false
		return 0
    elseif 名称 == "灵饰基础" then
  	if tp.窗口.灵饰自选.可视 then
  		tp.窗口.灵饰自选:设置基础(事件)
  	end
    elseif 名称 == "灵饰附加" then
  	if tp.窗口.灵饰自选.可视 then
  		tp.窗口.灵饰自选:设置附加(事件)
  	end
	elseif 事件 == "是 " then --潜能果
		发送数据(105)
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 名称 == "天赋符" then
		if 事件~="我再想想" then
			self.fujia.事件=事件
			发送数据(3814,self.fujia)
		end
		self.fujia=nil
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 名称 == "体验状态" then
		if 事件=="消除体验状态" then
			发送数据(6966)
			self.可视 = false
			self.文本栏焦点 = false
		elseif 事件 == "什么是体验状态" then
			self:文本("","体验状态","体验状态下：将对您进行一些游戏体验限制，如（发言、组队、交易、摆摊）等。\n#G解除体验功能，请联系管理员。（免费）",{"消除体验状态"})
		else
			self.可视 = false
			self.文本栏焦点 = false
		end
		return 0
	elseif 事件 == "确定紅" then
		发送数据(6215,self.fujia)
		self.fujia=nil
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "确定藍" then
		发送数据(6216)
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "炼制灵犀之屑" then
		self:文本("","","炼制灵犀之屑需要，150级-160级的“人物装备”，即可兑换到对应数量的灵犀之屑。\n#G150级装备 = 20\n#G160级装备 = 30",{"我要炼制","我再考虑考虑"})
		return 0
	elseif 事件 == "我要炼制" then
		发送数据(6202)
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "合成灵犀玉" then
		发送数据(6218)
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "更换神器五行" then
		发送数据(6201)
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "休息休息准备启程（剧情动画）" then
		self.可视 = false
		self.文本栏焦点 = false
		local 人物组,事件组 = 引擎.场景:获取任务事件(2,14)
		if 人物组[1] ~= nil and 事件组[1] ~= nil then
		  tp.第二场景:载入显示(人物组,事件组,2,13)
		end
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "又是你看打(剧情动画)" then
		self.可视 = false
		self.文本栏焦点 = false
		local 人物组,事件组 = 引擎.场景:获取任务事件(6,10)
		if 人物组[1] ~= nil and 事件组[1] ~= nil then
		  tp.第二场景:载入显示(人物组,事件组,2,13)
		end
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	elseif 事件 == "天雷淬体化境飞升(剧情动画)" then
		self.可视 = false
		self.文本栏焦点 = false
		local 人物组,事件组 = 引擎.场景:获取任务事件(4,4)
		if 人物组[1] ~= nil and 事件组[1] ~= nil then
		  tp.第二场景:载入显示(人物组,事件组,2,13)
		end
		self.可视 = false
		self.文本栏焦点 = false
		return 0
	end

	客户端:发送数据(1502,{事件,地图1,名称,名称1,md55555},1)
	self.可视 = false
	self.文本栏焦点 = false
end

return 场景类_对话栏