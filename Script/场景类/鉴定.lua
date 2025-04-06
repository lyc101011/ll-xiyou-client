-- @Author: baidwwy
-- @Date:   2024-12-14 19:52:27
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-16 11:19:05
-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-15 13:47:03
-- @Author: baidwwy
-- @Date:   2023-08-31 22:54:45
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-10-01 00:56:53

local 场景类_鉴定 = class()
local floor = math.floor
local insert = table.insert
local random = 引擎.取随机整数
local mouseb = 引擎.鼠标弹起
local zts,tp,zts1
local tp
local remove = table.remove

function 场景类_鉴定:初始化(根)
	self.ID = 47
	self.x = 365
	self.y = 100
	self.xx = 0
	self.yy = 0
	self.注释 = "鉴定"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	tp = 根
	self.资源组 = {
		[1] = 资源:载入('pic/jdkk.png',"图片"),--自适应.创建(0,1,288,257,3,9),
	}
	self.gb = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4,true,true) --关闭
	local 格子 = 根._物品格子
	self.物品 = {}
	for i=1,180 do
		self.物品[i] = 格子(0,0,i,"打造")
	end
	self.开始 = 1
	self.结束 = 20
	self.窗口时间 = 0
end

function 场景类_鉴定:打开(sj,内丹,吸附石,合宠物品)
	if self.可视 then
		self.宝宝 = nil
		self.开始 = 1
		self.结束 = 20
		self.可视 = false
	else
		insert(tp.窗口_,self)
		if not 内丹 and not 吸附石 and not 合宠物品 then
		    self.符纸格子 = sj[1]
			self.符纸总类 = sj[2]
			self.符纸分类 = sj[3]
			self.符纸子类 = sj[4]
			self.功能分类 = sj[5]
		elseif 内丹 then
			self.宝宝 = 内丹
			self.功能分类 = "打内丹"
		elseif 吸附石 then
			self.选中兽诀 = 0
			self.功能分类 = "吸附石"
		elseif 合宠物品 then
			self.选中物品 = 0
			self.功能分类 = "合宠物品"
		end

		for i=self.开始,self.结束 do
			self.物品[i]:置物品(tp.道具列表[i])
		end
	    tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_鉴定:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x-3,self.y-1)
	self.gb:更新(x,y)
	self.gb:显示(self.x+270,self.y+2)
	if self.gb:事件判断() then
	    self:打开()
	    return
	end

	local is = self.开始 - 1
	for h=1,4 do
		for l=1,5 do
			is = is + 1
			self.物品[is]:置坐标(l * 51-51 + 18 + self.x,h * 51 + self.y - 20)
			if self.功能分类 == "打内丹" then
				self.物品[is]:显示(dt,x,y,self.鼠标,{203,1})
			elseif self.功能分类 == "吸附石" then
				self.物品[is]:显示(dt,x,y,self.鼠标,{3,1})
			elseif self.功能分类 == "光武拓印" then
				self.物品[is]:显示(dt,x,y,self.鼠标,{2,3})
			elseif self.功能分类 == "合宠物品" then
				self.物品[is]:显示(dt,x,y,self.鼠标,{2,2})
			else
				self.物品[is]:显示(dt,x,y,self.鼠标,{2,2})
			end
			if self.物品[is].物品 ~= nil and self.物品[is].焦点 then
				tp.提示:道具行囊(x,y,self.物品[is].物品)
				if self.物品[is].事件 and self.鼠标 then

					if self.功能分类 == "鉴定" and self.物品[is].物品.总类 == 2 then
						if self.物品[is].物品.鉴定 ~= nil and  self.物品[is].物品.鉴定 == false then
							if self.符纸总类 == 111 then
								if self.符纸子类 >= self.物品[is].物品.级别限制 then
									if self.符纸分类 == 1 and (self.物品[is].物品.分类 == 3 or self.物品[is].物品.分类 == 4) then
										引擎.场景:播放音效类("鉴定" )
										if self.物品[is].物品.专用提示 then
										    self:打开()
										    tp.窗口.鉴定提示:打开({标题="鉴定装备",文本="#W恭喜！这物品可能变为特有装备，#Y特有装备只能由你本人使用#W，你需要将它鉴定成特有装备吗？",鉴定内容={类型="装备鉴定",道具格子=is,符纸格子=self.符纸格子}})
										    return
										end
										发送数据(3738,{类型="装备鉴定",道具格子=is,符纸格子=self.符纸格子})
										self:打开()
									elseif self.符纸分类 == 2 and (self.物品[is].物品.分类 == 1 or  self.物品[is].物品.分类 == 2 or self.物品[is].物品.分类 == 5 or self.物品[is].物品.分类 == 6) then
										引擎.场景:播放音效类("鉴定" )
										if self.物品[is].物品.专用提示 then
										    self:打开()
										    tp.窗口.鉴定提示:打开({标题="鉴定装备",文本="#W恭喜！这物品可能变为特有装备，#Y特有装备只能由你本人使用#W，你需要将它鉴定成特有装备吗？",鉴定内容={类型="装备鉴定",道具格子=is,符纸格子=self.符纸格子}})
										    return
										end
										发送数据(3738,{类型="装备鉴定",道具格子=is,符纸格子=self.符纸格子})
										self:打开()
									elseif self.符纸分类 == 3 and (self.物品[is].物品.分类 == 10 or self.物品[is].物品.分类 == 11 or self.物品[is].物品.分类 == 12 or self.物品[is].物品.分类 == 13) then
										引擎.场景:播放音效类("鉴定" )
										发送数据(3738,{类型="灵饰鉴定",道具格子=is,符纸格子=self.符纸格子})
										self:打开()
									else
										tp.常规提示:打开("#Y/此图鉴类型无法鉴定该装备")
									end
								else
									tp.常规提示:打开("#Y/此图鉴的等级过低无法鉴定该装备")
								end
							else
								tp.常规提示:打开("#Y/这个物品不能用于鉴定！")
							end
						else
							if self.符纸总类 == 101 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="强化符",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							elseif self.符纸总类 == 180 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="特技书",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							elseif self.符纸总类 == 181 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="装备特效宝珠",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							elseif self.符纸总类 == 182 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="灵饰特效宝珠",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							    引擎.场景:播放音效类("鉴定" )
							    发送数据(3738,{类型="上古残符",道具格子=is,符纸格子=self.符纸格子})
							    self:打开()
							 elseif self.符纸总类 == 190  then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="上古残符",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							elseif self.符纸总类 == 198  then
							    引擎.场景:播放音效类("鉴定" )
							    发送数据(3738,{类型="器灵·金蝉",道具格子=is,符纸格子=self.符纸格子})
							    self:打开()
							elseif self.符纸总类 == 199  then
							    引擎.场景:播放音效类("鉴定" )
							    发送数据(3738,{类型="器灵·无双",道具格子=is,符纸格子=self.符纸格子})
							    self:打开()
							elseif self.符纸总类 == 201  then
							    引擎.场景:播放音效类("鉴定" )
							    发送数据(3738,{类型="元素曜石",道具格子=is,符纸格子=self.符纸格子})
							    self:打开()
							elseif self.符纸总类 == 191  then
							    引擎.场景:播放音效类("鉴定" )
							    发送数据(3738,{类型="青铜灵物",道具格子=is,符纸格子=self.符纸格子})
							    self:打开()
							elseif self.符纸总类 == 183 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="愤怒符",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							elseif self.符纸总类 == 5 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="钟灵石",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							elseif self.符纸总类 == 82 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="淬灵石",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							else
								tp.常规提示:打开("#Y/这件装备已经鉴定过了")
							end
						end
					elseif self.功能分类 == "特效" and self.物品[is].物品.总类 == 2 and self.物品[is].物品.分类 < 7 then
					    if self.物品[is].物品.鉴定 then
							if self.符纸总类 == 183 and self.符纸分类 == 4 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="不磨符",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							end
						else
							tp.常规提示:打开("#Y/这件装备还没鉴定")
						end
					elseif self.功能分类 == "双加转换" and self.物品[is].物品.总类 == 2 and (self.物品[is].物品.分类==3 or self.物品[is].物品.分类==4)  then
						if self.物品[is].物品.鉴定 then
							if self.符纸总类 == 183 and self.符纸分类 == 5 then
								引擎.场景:播放音效类("鉴定" )
								发送数据(3738,{类型="双加转换",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							end
						else
							tp.常规提示:打开("#Y/这件装备还没鉴定")
						end
					elseif self.功能分类 == "附魔" and self.物品[is].物品.总类 == 2 then
						if self.物品[is].物品.鉴定 ~= nil and  self.物品[is].物品.鉴定 then
							if self.物品[is].物品.分类 <= 6 then
								发送数据(3738,{类型="装备附魔",道具格子=is,符纸格子=self.符纸格子})
								self:打开()
							end
						end
					elseif self.功能分类 == "打内丹" and self.物品[is].物品.总类 == 203 then
						发送数据(5014,{类型="宝宝打内丹",道具格子=is,bb=self.宝宝})
						self:打开()
					elseif self.功能分类 == "吸附石" then
						if self.物品[is].物品.名称 == "魔兽要诀" or self.物品[is].物品.名称 == "高级魔兽要诀" or self.物品[is].物品.名称 == "特殊魔兽要诀" then
							self.选中兽诀 = is
							tp.窗口.对话栏:文本("","","吸附石可直接吸附消耗魔兽要诀来获得对应的点化石。有一定概率失败，失败后会损失吸附石。（魔兽要诀不会损失）",{"我要吸附魔兽要诀","取消"})
							self:打开()
						else
							tp.常规提示:打开("#Y/我不认识这个技能哦")
						end
					elseif self.功能分类 == "光武拓印" then
						发送数据(3781,{道具格子=is})
						self:打开()
					elseif self.功能分类 == "合宠物品" then ----特地把数量判断和名称判断分开写,一个写在客户端 一个写在服务端 供你理解。)
							发送数据(3781.1,{道具格子=is})
							self:打开()
					elseif self.功能分类 == "武器附神" then---武器附神
						if self.物品[is].物品.总类 == 2 and self.物品[is].物品.分类==3  then else tp.常规提示:打开("#W/少侠！只有“武器”才可以附神！") self:打开() return  end
						if self.物品[is].物品.鉴定 ==false then tp.常规提示:打开("#W/拿回去！该物品尚未鉴定！") self:打开() return end

						发送数据(3738,{类型="武器附神",道具格子=is,符纸格子=self.符纸格子})
						引擎.场景:播放音效类("鉴定")
						self:打开()



					end
				end
			end
			if self.物品[is].焦点 then
				self.焦点 = true
			end
		end
	end
end

function 场景类_鉴定:检查点(x,y)
	local n = false
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		n  = true
	end
	return n
end

function 场景类_鉴定:初始移动(x,y)
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

function 场景类_鉴定:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_鉴定