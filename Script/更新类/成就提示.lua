--======================================================================--
local 成就提示 = class()
local tp,zts1,zts2
local mousea = 引擎.鼠标弹起
local insert = table.insert
local 字体 = require("gge文字类")

local function 取成就头像(头像)
	if 头像=="通用" then
	    return 2
	elseif 头像=="双蓝字" then
	    return 1
    elseif 头像=="三蓝字" then
	    return 3
    elseif 头像=="四蓝字" then
	    return 6
    elseif 头像=="PK成就" then
	    return 5
    elseif 头像=="特技" then
	    return 4
    elseif 头像=="物理系的追求" then
	    return {"item.wdf",0x9FBE6EC2}
    elseif 头像=="物理系的梦想" then
	    return {"item.wdf",0xA1B47E39}
    elseif 头像=="法系的追求" then
	    return {"item.wdf",234019286}
    elseif 头像=="法系的梦想" then
	    return {"item.wdf",4273718431}
    elseif 头像=="一样的加成之手镯" then
	    return {"item.wd1",0x5B5A5A7B}
    elseif 头像=="一样的加成之戒指" then
	    return {"item.wd1",0x8245870F}
    elseif 头像=="一样的加成之佩饰" then
	    return {"item.wd1",0xE07ABFDD}
    elseif 头像=="一样的加成之耳饰" then
	    return {"item.wd1",0x447CB949}
	elseif 头像=="进阶" then
	    return {"item.wd1",0xE0D95C88}
	end
	return 2
end

function 成就提示:初始化(根)
	self.ID = 128
	self.x = 0
	self.y = 0
	self.xx = 0
	self.yy = 0
	self.注释 = "成就提示"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	-- self.右键关闭=1
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 资源:载入('wzife.wd1',"网易WDF动画",821484421),
		[2] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB),0,0,4,true,true), --关闭
		[3] = 资源:载入('wzife.wd1',"网易WDF动画",3863545155),
		[4] = 资源:载入('wzife.wd1',"网易WDF动画",2944627499),
		[5] = 资源:载入('wzife.wd1',"网易WDF动画",4132097164),

	}
    self.资源组[2]:绑定窗口_(self.ID)
    self.标题={}
    self.说明={}
    self.加载头像={}
    self.烟花=true
    -- self.滚动值 = 250
	self.窗口时间 = 0
	tp = 根
	zts1 = 字体.创建("wdf/font/hyh1gjm.ttf",21,false,false,true)
	zts2 = 字体.创建(nil,15,false,false,false)
end

function 成就提示:打开(内容)
	if self.可视 then
		table.remove(self.标题, 1)
		table.remove(self.说明, 1)
		table.remove(self.加载头像, 1)
        -- self.滚动值 = 250
		if #self.标题<=0 then
			self.标题={}
		    self.说明={}
		    self.加载头像={}
		    self.烟花=nil
			self.可视 = false
		else
            self.烟花=tp.资源:载入('wzife.wd1',"网易WDF动画",2944627499)
		end
	else
		insert(tp.窗口_,self)
		if 全局游戏宽度==1024 then
		    self.x = 330
			self.y = 全局游戏高度-180
		else
			self.x = 250
			self.y = 全局游戏高度-180
		end
		-- self.滚动值 = 250

		self.标题[1]=内容.标题
		self.说明[1]=内容.说明

		local 资源 = tp.资源
		local wj = 取成就头像(内容.头像)
		if type(wj)=="table" then
			self.加载头像[1]=资源:载入(wj[1],"网易WDF动画",wj[2])
			self.加载头像[1].是否偏移=true
		else
		    self.加载头像[1]=资源:载入('pic/成就/'..wj..'.png',"图片")
		end

		self.烟花=资源:载入('wzife.wd1',"网易WDF动画",2944627499)

		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 成就提示:新增内容(内容)

    self.标题[#self.标题+1]=内容.标题
	self.说明[#self.说明+1]=内容.说明
	local 资源 = tp.资源
	local wj = 取成就头像(内容.头像)
	if type(wj)=="table" then
		self.加载头像[#self.加载头像+1]=资源:载入(wj[1],"网易WDF动画",wj[2])
		self.加载头像[#self.加载头像].是否偏移=true
	else
	    self.加载头像[#self.加载头像+1]=资源:载入('pic/成就/'..wj..'.png',"图片")
	end
	self.烟花=资源:载入('wzife.wd1',"网易WDF动画",2944627499)
end

function 成就提示:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	self.资源组[2]:显示(self.x+337,self.y+22)
	self.资源组[3]:显示(self.x+28,self.y+32)
	if self.资源组[2]:事件判断() then
        self:打开()
		return
    end
    if self.加载头像[1]  then
        if self.加载头像[1].是否偏移 then
            self.加载头像[1]:显示(self.x+29,self.y+32)
        else
        	self.加载头像[1]:显示(self.x+31,self.y+35)
        end
        if self.烟花~=nil then
			self.烟花:更新(dt)
			self.烟花:显示(self.x-12,self.y-62)
			if self.烟花.结束帧==self.烟花.当前帧 then
				self.烟花=nil
			end
		end
		self.资源组[5]:更新()
		self.资源组[5]:显示(self.x,self.y)
		zts1:置颜色(黑色):显示(self.x+87,self.y+34,self.标题[1])
	    -- if #self.说明[1]>34 then
	    -- 	self.滚动值=self.滚动值-1
	    -- 	zts2:置颜色(黑色):显示(self.x+84+self.滚动值,self.y+63,self.说明[1])
	    -- else
	    	zts2:置颜色(黑色):显示(self.x+84,self.y+63,self.说明[1])
    end

end



function 成就提示:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 成就提示:初始移动(x,y)
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

function 成就提示:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 成就提示