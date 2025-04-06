-- @Author: baidwwy
-- @Date:   2024-09-11 20:07:40
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 16:33:40
-- @Author: baidwwy
-- @Date:   2023-09-25 12:05:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-12 16:26:35
-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2015-06-18 02:56:19
-- @最后修改来自: baidwwy
-- @Last Modified time: 2023-06-29 10:29:05
local 丰富文本类 = class()

local type = type
local insert = table.insert
local remove = table.remove
local floor = math.floor
local tostring = tostring
local pairs = pairs
local min = math.min
local max = math.max
local mousea = 引擎.鼠标弹起
function 丰富文本类:初始化(...)
	local arg = {...}
	if arg[1] == nil then
		return
	end
	self.宽度 		= arg[1]
	self.高度 		= arg[2]
	self.符号 	= "#"
	self.换行符 	= ""
	self.文字 		= arg[3] or require("gge文字类").创建("wdf/font/hkyt_w6.ttf",14,false,false,true)
	if self.宽度==570 or self.宽度==9999 then
		self.文字 		= require("gge文字类").创建("wdf/font/hkyt_w5.ttf",16,false,false,true)
	elseif self.宽度==153 then --任务追踪
		self.文字 		= require("gge文字类").创建()
	end
	self.文字:置行间距(1)
	-- self.文字 		= require("gge文字类").创建("wdf/font/hkyt_w5.ttf",14,false,false,true):置行间距(1)--arg[3] or require("gge文字类").创建():置行间距(1)
	self.文字宽度,self.文字高度 	= 7,15
	self.行间距 		=  1--arg[4] or 2
	self.添加间隔 = arg[5] or 15
	self.元素表 		= {W=0xFFFFFFFF,
						H=0xFF000000,
						Y=0xFFFFFF00,
						L=-16776961,
						R=4294901760,
						K=0xffCC0033, --淡红
						M=0xFF222222, --淡黑
						P=0xFF00FFFF, --青色
						G=4278255360,
						S=-16466190,
						Z=-16711681,
						N=-16777216,
						gray=0xFF808080,
						C=ARGB(255,125,125,125),
						F=ARGB(255,255,129,255)
					}
	self.显示表 		= {高度 = 0,宽度 = 0}
	self.画线 		= require("gge引擎").画线
	self.回调包围盒 = require("gge包围盒96")()
	self.默认颜色 	= 0xFFFFFFFF--0xFF222222--0xFFFFFFFF
	self.默认元素 	= 'W'
	self.行数量 	= 0
	self.起始值 	= 0
	self.目标值 	= 0
	self.递增值 	= 1
	self.鼠标x 		= 0
	self.鼠标y 		= 0
	self.默认宽度 	= self.宽度

	self.添加记录 	= {}
	self.溢出行数 	= 500--最多存放数量
	self.滚动值 	= 0 --显示偏移
	self.加入 = 0
	self.焦点 = false
	for n=0,120 do
		self:添加元素(n,tp.包子表情动画[n])
	end
	for n=0,9 do
		self:添加元素("js"..n,tp.金色id[n])
		self:添加元素("zs"..n,tp.紫色id[n])
		self:添加元素("ls"..n,tp.绿色id[n])
		self:添加元素("ns"..n,tp.蓝色id[n])
	end
	self:添加元素("dw",tp.包子表情动画[525])
end

function 丰富文本类:置元素函数(v)
	self.元素函数 = v
end
function 丰富文本类:置加入(v)
	self.加入 = v
end
function 丰富文本类:置行距(v)
	self.行间距 	= v
	return self
end
function 丰富文本类:置宽度(v)
	self.宽度 = v
	-- self.默认宽度 = v
	self:_计算显示模式()
end
function 丰富文本类:置高度(v)
	self.高度 	= v
	self:_计算显示模式()
end
function 丰富文本类:滚动(v)
	self.滚动值 = self.滚动值+v
	if self.滚动值 < 0 then--到底
		self.滚动值 = 0
	elseif self.滚动值 > self.行数量 then
		self.滚动值 = self.行数量
	end
	self:_计算显示模式()
	return self.滚动值 == 0
end
function 丰富文本类:置换行符(v)
	self.换行符 	= v or ''
end
function 丰富文本类:置默认颜色(v)
	self.默认颜色 	= v
end
function 丰富文本类:置文字 (v)
	self.文字 		= v
	self.文字宽度,self.文字高度 	= self.文字:取宽高("A")
	return self
end
function 丰富文本类:置画线(v)
	self.画线 		= v
	return self
end
function 丰富文本类:置行度(v)
	self.文字高度 = self.文字高度 + v
end
function 丰富文本类:添加元素(标识,数据,默认)
	标识 = tostring(标识)
	if type(数据) == 'table' then
		数据.标识 = 标识
	end
	if 默认 and type(数据)=='number' then
		self.默认元素 = 标识
	end
	self.元素表[标识] = 数据
	return self
end
function 丰富文本类:检查元素(标识)
	if self.元素表[标识] then
		return self.元素表[标识]
	elseif self.元素函数 then
		return self.元素函数()
	end
end
function 丰富文本类:_取元素(标识)--向元素表查找元素，找不到向用户函数获取
	if self.元素表[标识] then
		return self.元素表[标识]
	elseif self.元素函数 then
		return self.元素函数()
	else
		return self.元素表[self.默认元素]
	end
end
function 丰富文本类:_生成段数据(元素,内容)
	local 段数据 = {}
	if type(元素) == 'number' then
		段数据.x 	= 0
		段数据.颜色 = 元素
		段数据.内容 = 内容 == '井\0' and '#' or 内容 -- 内容:gsub("井\0","#")
		段数据.类型 = 0
		段数据.宽度 = self.文字:取宽度(段数据.内容)
		段数据.高度 = self.文字高度
	else
		段数据.x 	= 0
		段数据.内容 = 元素
		段数据.类型 = 1
		if 元素.帧数 == 1 then
			段数据.宽度 = 元素:取宽度()
		else
			段数据.宽度 = 元素:取宽度()+2
		end
		段数据.高度 = 元素:取高度()
	end
	return 段数据
end
function 丰富文本类:_生成样式(段数据,内容)
	-- local 样式 	= 内容:match("%l*")
	-- local 值 	= 内容:match("%l*|(.*)")
	local 样式,值 = 内容:match("(%l*)|?(.*)")
	if 样式 == 'xx' then --下划线
		段数据.下划线 	= true
	elseif 样式 == 'sx' then --删除线
		段数据.删除线 	= true
	elseif 样式 == 'bj' then --背景颜色
		段数据.背景颜色 = self:_取元素(值)
	elseif 样式 == 'pz' then --碰撞颜色
		段数据.碰撞颜色 = self:_取元素(值)
	elseif 样式 == 'pb' then --碰撞背景颜色
		段数据.碰撞背色 = self:_取元素(值)
	elseif 样式 == 'qqq' then --回调标识
		段数据.回调 	= 值 or ''
	elseif 样式 == 'djy' then --段居右
		段数据.居右 = true
	elseif 样式 == 'an' then--按钮
		段数据.按钮 = true
	elseif 样式 == 'n' then--换行
		if 段数据.换行内容 then
			段数据.换行内容 = 段数据.换行内容.."\n"..值
		else
			段数据.换行内容 = 值
		end
	elseif 段数据.类型 == 0 and 样式 ~="jz" and 样式 ~="jy" then --带有/符号的文本
		if 段数据.换行内容 then
			段数据.内容 = " "..段数据.换行内容.."\n"..内容
			段数据.换行内容 = nil
		else
			段数据.内容 = 段数据.内容.."/"..内容
		end

		段数据.宽度 = self.文字:取宽度(段数据.内容)
		段数据.高度 = self.文字:取高度(段数据.内容)
	end
	return 段数据
end
function 丰富文本类:_解析(数据)
	local x 		= 0
	local 行数据  	= {x = 0,宽度 = 0,高度 = self.文字高度,内容 = ''}
	if 数据 == "#W" then
		行数据.高度 = self.添加间隔
	end
	--行初始化
	if 数据:find('#') then
		for m in (数据.."#"):gmatch("(.-)#") do
			if m ~= '' then
				local 段内容,段数据 	= {},{}--解析前,解析后
				local 数量,主元素 = 0
				if m:find('/') then
					for match2 in (m.."/"):gmatch("(.-)/") do
						insert(段内容, match2)
					end
					主元素 	= 段内容[1]
					数量 	= #段内容
				else
					主元素,段内容[2] =m:match("(%w*)(.*)")
					if self:检查元素(主元素) and type(self:_取元素(主元素))~='table' then
						数量 = 2
					else
						数量 = 1
						主元素 = m
					end
				end
				if 数量 == 1 then
					if self:检查元素(主元素) then
						段数据 = self:_生成段数据(self:_取元素(主元素))
					else--表情和文本同一行 如(#11文本)
						local _,长度,标识 = 主元素:find('(%w*)')
						if 长度 >0  then
							if self:检查元素(主元素:sub(1,3)) then
								标识 	= 主元素:sub(1,3)
								主元素 	= 主元素:sub(4)
							elseif self:检查元素(主元素:sub(1,2)) then
								标识 	= 主元素:sub(1,2)
								主元素 	= 主元素:sub(3)
							elseif self:检查元素(主元素:sub(1,1)) then
								标识 	= 主元素:sub(1,1)
								主元素 	= 主元素:sub(2)
							end
						end
						if self:检查元素(标识) and type(self:检查元素(标识))=='table' then
							段数据 		= self:_生成段数据(self:_取元素(标识))
							段数据.x 	= x
							行数据 		= self:_添加段数据(行数据,段数据)
							x = 行数据.宽度
						end
						if  (self:检查元素(标识) and type(self:检查元素(标识))~='table') then
							段数据 = self:_生成段数据(self:_取元素(标识),主元素)
						else
							段数据 = self:_生成段数据(self.默认颜色,主元素)
						end
					end
				elseif 数量 == 2 then--指定颜色文本
					if type(self:_取元素(主元素)) == 'table' then--是否动画
						段数据 = self:_生成段数据(self:_取元素(主元素))
						段数据 = self:_生成样式(段数据,段内容[2])
					else
						段数据 = self:_生成段数据(self:_取元素(主元素),段内容[2])
					end
				else--带有特殊样式的
					段数据 = self:_生成段数据(self:_取元素(主元素),"")
					for i=2,数量 do
						段数据 = self:_生成样式(段数据,段内容[i])
						if 段内容[i] == 'jz' then --居中
							行数据.居中 = true
						elseif 段内容[i] == 'jy' then --居右
							行数据.居右 = true
						end
					end
					if 段数据.类型 == 0 then --带有/符号的文本
						段数据.内容 = 段数据.内容:sub(2)
						段数据.宽度 = self.文字:取宽度(段数据.内容)
					end
				end
				段数据.x = x
				if 段数据.居右 then 段数据.x = self.宽度-段数据.宽度 end
				行数据 = self:_添加段数据(行数据,段数据)
				x = 行数据.宽度
			else
				-- 段数据 = self:_生成段数据(self.默认颜色,'#')
				-- 行数据 = self:_添加段数据(行数据,段数据)
				-- x = 行数据.宽度
			end
		end
	else
		行数据 = self:_添加段数据(行数据,self:_生成段数据(self.默认颜色,数据))
	end

	if 行数据.居中 then 行数据.x = (self.宽度 -行数据.宽度)/2 end
	if 行数据.居右 then 行数据.x = self.宽度 -行数据.宽度 end
	self:_添加行数据(行数据)
end

function 丰富文本类:_复制样式(数据)
	local ret = {}
	for k,v in pairs(数据) do
		ret[k] = v
	end
	ret.x = 0
	return ret
end

function 丰富文本类:_取文本左边(文本,字符数)
	local i = 1
	local ascii = 0
	local ret = ''
	while true do
		ascii = 文本:byte(i)
		if ascii and 字符数 > 0 then
			if ascii < 127 then
				ret = ret ..文本:sub(i, i)
				i = i+1
				字符数 = 字符数 -1
			else
				字符数 = 字符数 -2
				if 字符数 >= 0 then
					ret = ret ..文本:sub(i, i+1)
						i = i+2
				end
			end
		else
				break
		end
	end
	return ret,文本:sub(i)
end
function 丰富文本类:_添加行数据(行数据)
	insert(self.显示表, 行数据)
	self.显示表.高度  = self.显示表.高度 + 行数据.高度 + self.行间距
	if 行数据.宽度 > self.显示表.宽度 then
			self.显示表.宽度 = 行数据.宽度
	end
	return {x = 0,宽度 = 0,高度 = self.文字高度,内容 = ''}--行初始化
end

function 丰富文本类:_添加段数据(行数据,段数据)
	if 段数据.类型 == 0 then--文本
		if 行数据.宽度 + 段数据.宽度 > self.宽度 then--大于就折行
			local 剩下长度 = floor((self.宽度 - 行数据.宽度)/self.文字宽度)
			local 剩下文本 = ''

			段数据.内容,剩下文本 = self:_取文本左边(段数据.内容,剩下长度)
			--段数据.折行 = true --用作判断下行高亮
			insert(行数据, 段数据)
			行数据.宽度 = self.宽度
			行数据  	= self:_添加行数据(行数据)

			段数据 		= self:_复制样式(段数据)--上一行的样式
			段数据.内容	= self.换行符..剩下文本
			段数据.宽度 = self.文字:取宽度(段数据.内容)
			行数据 = self:_添加段数据(行数据,段数据)
		else
			--行数据.内容 = 行数据.内容..段数据.内容--无样式，用于搜索
			行数据.宽度 = 行数据.宽度 + 段数据.宽度
			insert(行数据, 段数据)--有样式
			--行数据.数量 = #行数据
		end
	else--对象(动画,图片等)
		if 行数据.宽度 + 段数据.宽度 > self.宽度 then--大于就折行
			行数据.宽度 = self.宽度
			行数据  	= self:_添加行数据(行数据)
			if self.换行符 ~='' then 行数据  	= self:_添加段数据(行数据,self:_生成段数据(self.默认颜色,self.换行符)) end
			段数据.x 	= 行数据.宽度
			行数据 = self:_添加段数据(行数据,段数据)
		else
			行数据.宽度 = 行数据.宽度 + 段数据.宽度
			insert(行数据, 段数据)
			--行数据.数量 = #行数据
			if 段数据.高度 > 行数据.高度 then
					行数据.高度 = 段数据.高度
			end
		end
	end
	return 行数据
end

function 丰富文本类:_计算显示模式()
	if self.显示表.高度 > self.高度 then
		local 当前高度,行底部 = 0,self.行数量-self.滚动值
		self.目标值 = 1
		for i=行底部,1,-1 do
			当前高度 = 当前高度 + self.显示表[i].高度+self.行间距
			if 当前高度 >self.高度 then
				self.起始y = 当前高度-self.显示表[i].高度-self.行间距
				self.目标值 = i+1
				break
			end
		end
		self.起始值 = 行底部
		self.递增值 = -1
	else
		self.起始值 = 1
		self.目标值 = self.行数量
		self.递增值 = 1
		self.起始y  = 0
	end
	self.显示模式 = (self.递增值 == 1)
end

function 丰富文本类:置文本(s)
	self:清空()
	self:添加文本(s)
	return self
end

function 丰富文本类:添加文本(数据,宽度)
	if 数据 == nil then
		return
	end
	insert(self.添加记录, 数据)
	数据 = 数据:gsub('##','#井\0')
	if 数据:sub(1,1)~='#' then
		数据 = '#'..self.默认元素 .. 数据
	end
	-- self.宽度 = 宽度 or self.默认宽度
	self.宽度 = 宽度 or self.宽度
	for match in (数据.."\n"):gmatch("(.-)\n") do
		self:_解析(match)
		self.行数量 = #self.显示表
	end
	self:_计算显示模式()
	return self.显示表.高度
end

function 丰富文本类:清空()
	self.显示表 	= {高度 = 0,宽度 = 0}
	self.行数量 = 0
	self.滚动值 = 0
	self.加入 = 0
	return self
end

function 丰富文本类:更新(x,y)
	self.鼠标x,self.鼠标y = x,y
end

function 丰富文本类:显示(x,y,a)
	self.x,self.y=x,y
	if (self.行数量 > 0) and  gd == nil then
		local 起始y = self.起始y
		local 文字 	= self.文字
		local g = nil
		for i=self.起始值,self.目标值,self.递增值 do
			--if (self.显示表[i+self.加入]) then
				local 行数据 = self.显示表[i+self.加入]
				if (self.显示模式 and i ~= self.起始值 ) then
					起始y = 起始y  + self.行间距 + self.显示表[i-1].高度
				elseif (not self.显示模式 ) and 行数据~=nil then
					起始y = 起始y  - self.行间距 - 行数据.高度
				end

				if 行数据~=nil then
					for i,v in ipairs(行数据) do
						local 显示x		= 行数据.x+x+v.x
						local 显示y0 	= floor(起始y + y + (行数据.高度 - v.高度)/2)
						local 颜色 = v.颜色
						if g ~= nil and a then
							if 颜色 ~= 4294901760 and 颜色 ~= 4278255360 and 颜色~=4294967040 then
								颜色 = a
							end
							g = nil
						end
						g = 1
						if v.回调 and tp.选中窗口 == 0 then
							self.回调包围盒:置坐标宽高(显示x ,显示y0,v.宽度,v.高度)
							--self.回调包围盒:显示(显示x,显示y0)
							if self.回调包围盒:检查点(self.鼠标x,self.鼠标y) then
								--  if v.碰撞颜色 then 颜色 = v.碰撞颜色 end
								--  if v.碰撞背色 then
								-- 背景:置区域(0,0,v.宽度,v.高度)
								-- 	:置颜色(v.碰撞背色)
								-- 	:显示(显示x,显示y0)
								-- end
								if 引擎.鼠标弹起(1) then--and tp.选中窗口 == 0 then
									tp:丰富点击回调(v.回调)
								-- elseif yq.外部 ~= nil and yq.外部.鼠标按下(1) then
								-- 	tp:丰富点击回调(v.回调)
								elseif 引擎.鼠标弹起(0) then--and tp.选中窗口 == 0 then
									tp:丰富文本回调行走(v.回调)
								else
									tp:丰富文本回调(v.回调)
								end
								-- if v.按钮 and self.左键按下 then
								-- 		显示x ,显示y0 = 显示x +1,显示y0+1
								-- end
								if Wbltkdj  or not tp.wbltk then
								    引擎.场景.文本回调 = true
								end
							end
						end
						if v.类型 == 0 then
							if v.下划线 then
								self.画线(显示x,显示y0+v.高度-1 ,显示x+v.宽度,显示y0+v.高度-1,颜色)
							end
							if v.删除线 then
								self.画线(显示x,显示y0+v.高度-5  ,显示x+v.宽度,显示y0+v.高度-5,颜色)
							end
							文字:置颜色(颜色)
							文字:显示(显示x+2 ,显示y0+1,v.内容)
						elseif v.类型 == 1 then
							if v.内容.帧数 == 1 then
								v.内容:显示(显示x+3 ,显示y0+19)
							else
								local sj = max(v.内容.高度,26)
								v.内容:显示(显示x+4 ,显示y0+sj)
							end
						end
					end
				end
			-- end
		end
	end
end

return 丰富文本类