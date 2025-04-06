-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:52
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-13 12:52:43
--======================================================================--
local 经脉切换 = class()
local tp,zts,zys
local mousea = 引擎.鼠标弹起
local insert = table.insert

local function 取流派专属技能(流派)
	if 流派=="无双战神" then
		return  {紫薇之术={"连破"}}
	elseif 流派=="虎贲上将" then
		return  {文韬武略={"披坚执锐"}}
	elseif 流派=="杏林妙手" then --这里我们只需要把想要新增的技能写进去就行，都有的技能不用删除
		return  {小乘佛法={"明光","佛眷"}}
	elseif 流派=="护法金刚" then
		return  {小乘佛法={"明光","聚气"}}
	elseif 流派=="无量尊者" then
		return  {小乘佛法={"度厄"},佛光普照={"功德无量"},歧黄之术={"六尘不染"}}
	end
end

function 经脉切换:初始化(根)
	self.ID = 115
	self.x = 113
	self.y = 230
	self.xx = 0
	self.yy = 0
	self.注释 = "经脉切换"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	local 资源 = 根.资源
	self.资源组 = {
		[1] = 自适应.创建(0,1,618,178,3,9),
		[2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
		[3] = 资源:载入('pic/qh.png',"图片"),
		[4] = 按钮.创建(自适应.创建(12,4,120,22,1,3),0,0,4,true,true,"     确 认"),
		[5] = 按钮.创建(自适应.创建(12,4,120,22,1,3),0,0,4,true,true,"     取 消"),
	}
	for i=4,5 do
		self.资源组[i]:绑定窗口_(self.ID)
	end
	self.资源组[2]:绑定窗口_(self.ID)
	self.窗口时间 = 0
	self.删除技能 = nil
	self.新增技能 = nil
	tp = 根
	zys = 资源
	zts = tp.字体表.普通字体
	self.介绍文本 = require("script/系统类/丰富文本")(320,32)

end

function 经脉切换:打开(旧,新)
	if self.可视 then
		self.新流派=nil
		self.删除技能 = {}
		self.新增技能 = {}
		self.介绍文本:清空()
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.介绍文本.文字.大小 = 9
		self.介绍文本.文字高度 = 14
		self.介绍文本.文字宽度 = 6
		self.旧流派=旧
		self.新流派=新
		self.删除技能 = 取流派专属技能(旧)
		self.新增技能 = 取流派专属技能(新)
		self.显示旧 = {}
		self.显示新 = {}
		if self.删除技能~=nil then
		    for i=1,#self.删除技能 do
		    	self.显示旧[i]=tp.资源:载入(引擎.取技能(self.删除技能[i])[6],"网易WDF动画",引擎.取技能(self.删除技能[i])[8])
		    end
		end
		if self.新增技能~=nil then
		    for i=1,#self.新增技能 do
		    	self.显示新[i]=tp.资源:载入(引擎.取技能(self.新增技能[i])[6],"网易WDF动画",引擎.取技能(self.新增技能[i])[8])
		    end
		end
		self.介绍文本:添加文本("流派从#G/"..旧.."#W/切换到#G"..新.."#W，以下调整将会生效：")
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end

function 经脉切换:显示(dt,x,y)
	self.焦点 = false
	self.资源组[1]:显示(self.x,self.y)
	self.资源组[2]:更新(x,y)
	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	if self.资源组[2]:事件判断() or self.资源组[5]:事件判断() then
		self:打开()
		return false
	end
	self.资源组[3]:显示(self.x+10,self.y+52)
	tp.窗口标题背景_:显示(self.x-90+self.资源组[1].宽度/2,self.y)--标准
    引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"切换流派确认")--标准
    self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)--标准
	self.介绍文本:显示(self.x+8,self.y+29)
	self.资源组[4]:显示(self.x+184,self.y+149)
	self.资源组[5]:显示(self.x+317,self.y+149)
	zts:置颜色(白色)
	zts:显示(self.x+200,self.y+128,"是否消耗")
	zts:显示(self.x+301,self.y+128,"和")
	zts:显示(self.x+360,self.y+128,"切换流派？")
	zts:置颜色(绿色)
	zts:显示(self.x+257,self.y+128,"10体力")
	zts:显示(self.x+315,self.y+128,"10活力")
	zts:置颜色(0xFF393000)
	if self.显示旧~=nil and #self.显示旧>0 then
        for i=1,#self.显示旧 do
        	self.显示旧[i]:显示(self.x-46+i*83,self.y+87)
        	self.显示旧[i].精灵:灰度级()
        	zts:显示(self.x-20+i*83,self.y+93,self.删除技能[i])
        end
    end
    if self.显示新~=nil and #self.显示新>0 then
        for i=1,#self.显示新 do
        	self.显示新[i]:显示(self.x+255+i*83,self.y+87)
        	zts:显示(self.x+281+i*83,self.y+93,self.新增技能[i])
        end
    end
	if self.资源组[4]:事件判断() then
		-- if tp.队伍[1].体力>=10 and tp.队伍[1].活力>=10 then --测试模式
		    发送数据(64,{新流派=self.新流派,旧流派=self.旧流派})
			self:打开()
		-- else
		-- 	tp.常规提示:打开("#Y/体活不足！")
		-- 	return
		-- end
	end

end



function 经脉切换:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 经脉切换:初始移动(x,y)
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

function 经脉切换:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 经脉切换