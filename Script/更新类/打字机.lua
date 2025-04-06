local tp,zts
local insert = table.insert
local wz = require("gge文字类")
local 打字机 = class()
local zb={全局游戏宽度-300,全局游戏宽度-450,全局游戏宽度-600,全局游戏宽度-750}

function 打字机:初始化(根)
	self.ID = 139
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "打字机"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	-- self.可移动 = true
	-- self.右键关闭 = 1
	tp = 根
	self.窗口时间 = 0
end

function 打字机:加载资源(背景)
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.背景=nil
	if 背景==nil then --默认背景
		self.背景=require("gge精灵类")(0,0,0,0,0)
		self.背景:置颜色(ARGB(255,0,0,0))
		self.背景:置区域(0,0,全局游戏宽度,全局游戏高度)
	else
		self.背景= 资源:载入(背景[1],"网易WDF动画",背景[2])
	end

end

function 打字机:打开(文本,类型,字体,音乐,背景,横排显示,动画调用)
	if self.可视 then
		self.文本=nil
		self.类型=nil
		self.下一页=false
		self.播放下一页=0
		self.进程={}
		self.文本={}
		self.倒计时=nil
		self.关闭计时=nil
		self.横排显示=nil
		self.可关闭=false
		self.发送=true
		self.可视 = false
		return
	else
		insert(tp.窗口_,self)
		self:加载资源(背景)
		self.类型=类型
		self.动画调用=动画调用 or nil
		self.横排显示=横排显示
		---重置
		self.计时器=0
		self.发送=true
		self.下一页=false
		self.播放下一页=1
		self.进程={}
		self.文本={}
		self.倒计时=nil
		self.关闭计时=nil
		self.可关闭=false
		---重置
		local sj=0
		if type(文本[1])=="table" then
			self.下一页=true
			for k,v in pairs(文本) do
				self.文本[k]={}
				for a,b in pairs(v) do
					self.文本[k][a]={}
					self.文本[k][a]=分割字符(b)
				end
			end
			for k,v in pairs(self.文本) do
				self.进程[k]={}
				for a,b in pairs(v) do
					self.进程[k][a]={}
					for i=1,#b do
						self.进程[k][a][i]=sj+i*15
						if k~=1 and a==1 then --翻页显示倒计时
							self.进程[k][a][i]=self.进程[k][a][i]+150
						end
						if i==#b then --下一列额外停顿时间
							sj=self.进程[k][a][i]+30
						end
					end
				end
			end
		else
			for k,v in pairs(文本) do
				self.文本[k]={}
				self.文本[k]=分割字符(v)
			end
			for k,v in pairs(self.文本) do
				self.进程[k]={}
				for i=1,#v do
					self.进程[k][i]=sj+i*15
					if i==#v then
						sj=self.进程[k][i]+30
					end
				end
			end
		end
		if 字体 then
			self.字体=wz.创建("wdf/font/"..字体..".ttf",50,false,false,true)
		else
			self.字体=wz.创建("wdf/font/hyj4gjm.ttf",50,false,false,true)
		end
		if 音乐 then
			if tp.音乐~=nil then
			  tp.音乐:停止()
			end
			tp.音乐 = tp.资源:载入("WDF/Audio/"..音乐..".mp3","音乐",nil)
			tp.音乐:播放(true)
			tp.音乐:置音量(tp.音量)
		end
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 打字机:显示(dt,x,y)
	self.焦点= false
	self.背景:显示(0,0)
	self.计时器=self.计时器+1
	if self.横排显示 then
		for k,v in pairs(self.文本) do
			local 显示x=0
			显示y=275+(k-1)*50
			for i=1,#v do
				显示x=math.floor(全局游戏宽度/2-150+i*50)-#v*10
				if self.计时器>=self.进程[k][i] then
					self.进程[k][i]=0
				end
				if self.进程[k][i]==0 then
					self.字体:显示(显示x,显示y,v[i])
					if k==#self.文本 and i==#v and self.关闭计时==nil then
						self.关闭计时=0
					end
				end
			end
		end
	else
		if self.下一页 then
			if self.播放下一页 ~= #self.文本 then
				for k,v in pairs(self.文本[self.播放下一页]) do
					local 显示y=0
					for i=1,#v do
						显示y=100+i*50
						if self.计时器>=self.进程[self.播放下一页][k][i] then
							self.进程[self.播放下一页][k][i]=0
						end
						if self.进程[self.播放下一页][k][i]==0 then
							self.字体:显示(zb[k],显示y,v[i])
							if k==#self.文本[self.播放下一页] and i==#v and self.倒计时==nil then
								self.倒计时=0
							end
						end
					end
				end
				if self.倒计时~=nil then
					self.倒计时=self.倒计时+1
					if self.倒计时>=150 then
						self.播放下一页=self.播放下一页 + 1
						self.倒计时 = nil
					end
				end
			else
				for k,v in pairs(self.文本[self.播放下一页]) do
					local 显示y=0
					for i=1,#v do
						显示y=100+i*50
						if self.计时器>=self.进程[self.播放下一页][k][i] then
							self.进程[self.播放下一页][k][i]=0
						end
						if self.进程[self.播放下一页][k][i]==0 then
							self.字体:显示(zb[k],显示y,v[i])
							if k==#self.文本[self.播放下一页] and i==#v and self.关闭计时==nil then
								self.关闭计时=0
							end
						end
					end
				end
			end
		else
			for k,v in pairs(self.文本) do
				local 显示y=0
				for i=1,#v do
					显示y=100+i*50
					if self.计时器>=self.进程[k][i] then
						self.进程[k][i]=0
					end
					if self.进程[k][i]==0 then
						self.字体:显示(zb[k],显示y,v[i])
						if k==#self.文本 and i==#v and self.关闭计时==nil then
							self.关闭计时=0
						end
					end
				end
			end
		end
	end

	if self.关闭计时~=nil then
		self.可关闭=true
		self.关闭计时=self.关闭计时+1
		if self.关闭计时>=150 then
			if self.发送 then
				self.发送=false
				self:回调()
			end
			self:打开()
			return
		end
	end
end

function 打字机:回调()
	if self.动画调用~=nil then
		local 人物组,事件组 = 引擎.场景:获取任务事件(self.动画调用[1],self.动画调用[2])
		if 人物组[1] ~= nil and 事件组[1] ~= nil then
			tp.第二场景:载入显示(人物组,事件组,2,13,self.动画调用)
		end
	else
		发送数据(97,{类型=self.类型})
	end
end

function 打字机:检查点(x,y)
end

function 打字机:初始移动(x,y)
end

function 打字机:开始移动(x,y)
end

return 打字机