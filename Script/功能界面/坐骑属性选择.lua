local 场景类_坐骑属性选择 = class()
local zts,bb,tp,zts1
local insert = table.insert

function 场景类_坐骑属性选择:初始化(根)
	self.ID = 139
	self.xx = 0
	self.yy = 0
	self.x = 350
	self.y = 200
	self.注释 = "坐骑属性选择"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.资源组 = {
		[1] = 自适应.创建(0,1,236,240,3,9),
		[2] = 自适应.创建(78,1,212,120,3,9),--白色
		[4] = 按钮.创建(自适应.创建(12,4,69,22,1,3),0,0,4,true,true," 确 定"),
		[5] = 按钮.创建(自适应.创建(12,4,69,22,1,3),0,0,4,true,true," 取 消"),
		[6] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
		[7] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),--打勾框
		[8] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),--打勾框
		[9] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),--打勾框
		[10] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),--打勾框
		[11] = 按钮.创建(资源:载入('aaa.wdf',"网易WDF动画",0x1343E14),0,0,4,true,true),--打勾框
	}

	for i=4,11 do
	    self.资源组[i]:绑定窗口_(self.ID)
	end
	self.属性="无"
	tp = 根
	zts = tp.字体表.普通字体
	self.窗口时间 = 0
end

function 场景类_坐骑属性选择:打开(认证码)
	if self.可视 then
	    self.坐骑认证码 = nil
	    self.属性="无"
	    self.可视 = false
	else
		insert(tp.窗口_,self)
		self.坐骑认证码 = 认证码
		tp.运行时间 = tp.运行时间 + 1
	    self.窗口时间 = tp.运行时间
	    self.可视 = true
	end
end

function 场景类_坐骑属性选择:显示(dt,x,y)
	self.焦点 = false

	self.资源组[4]:更新(x,y)
	self.资源组[5]:更新(x,y)
	self.资源组[6]:更新(x,y)
	self.资源组[7]:更新(x,y)
	self.资源组[8]:更新(x,y)
	self.资源组[9]:更新(x,y)
	self.资源组[10]:更新(x,y)
	self.资源组[11]:更新(x,y)
	self.资源组[1]:显示(self.x,self.y)
	zts:置颜色(白色):显示(self.x+68,self.y+3,"选择坐骑主属性")
	zts:置颜色(白色):显示(self.x+13,self.y+33,"主属性确定后")
	zts:置颜色(红色):显示(self.x+13,self.y+33,"            不能")
	zts:置颜色(白色):显示(self.x+13,self.y+33,"                更改，你可通过")
	zts:置颜色(白色):显示(self.x+13,self.y+53,"洗点的方式进行重置。")
	self.资源组[2]:显示(self.x+12,self.y+76)

	self.资源组[7]:显示(self.x+40,self.y+92,true,nil,nil,self.属性=="体质",2)
	self.资源组[8]:显示(self.x+40,self.y+124,true,nil,nil,self.属性=="魔力",2)
	self.资源组[9]:显示(self.x+40,self.y+156,true,nil,nil,self.属性=="敏捷",2)
	self.资源组[10]:显示(self.x+147,self.y+92,true,nil,nil,self.属性=="力量",2)
	self.资源组[11]:显示(self.x+147,self.y+124,true,nil,nil,self.属性=="耐力",2)
	if self.资源组[7]:事件判断() then
	    self.属性="体质"
	elseif self.资源组[8]:事件判断() then
	    self.属性="魔力"
    elseif self.资源组[9]:事件判断() then
	    self.属性="敏捷"
    elseif self.资源组[10]:事件判断() then
	    self.属性="力量"
    elseif self.资源组[11]:事件判断() then
	    self.属性="耐力"
    elseif self.资源组[4]:事件判断() then
    	if self.属性=="无" then
    	    tp.常规提示:打开("#Y/请先选择坐骑主属性")
    	else
    		发送数据(11.2,{属性=self.属性,认证码=self.坐骑认证码})
    		self:打开()
    	end
	elseif self.资源组[5]:事件判断() then
		self:打开()
	end

	zts:置颜色(0xFF222222)
	zts:显示(self.x+70,self.y+96,"体质")
	zts:显示(self.x+70,self.y+96+32,"魔力")
	zts:显示(self.x+70,self.y+96+32+32,"敏捷")
	zts:显示(self.x+177,self.y+96,"力量")
	zts:显示(self.x+177,self.y+96+32,"耐力")




	self.资源组[4]:显示(self.x+45,self.y+209) --确定
	self.资源组[5]:显示(self.x+120,self.y+209) --取消

	-- self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+3)

end

function 场景类_坐骑属性选择:检查点(x,y)
	if self.资源组[1]:是否选中(x,y)  then
		return true
	end
end

function 场景类_坐骑属性选择:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
  		self.窗口时间 = tp.运行时间
 	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.鼠标 and not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 场景类_坐骑属性选择:开始移动(x,y)
	if self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end

return 场景类_坐骑属性选择