-- @Author: 源梦屋资源网:www.52luntan.cn
-- @Date:   2021-12-11 02:54:04
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-01-04 12:07:57
local 场景类_套装属性栏 = class()
local floor = math.floor
local min = math.min
local format = string.format
local zts6,zts11,zts22,zts33,tp
local insert = table.insert
function 场景类_套装属性栏:初始化(根)
    self.ID = 612
    self.x = 220+(全局游戏宽度-800)/2
    self.y = 80
    self.xx = 0
    self.yy = 0
    self.注释 = "套装属性栏"
        tp = 根
end

function 场景类_套装属性栏:加载(根)
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    local 资源 = 根.资源
    local 按钮 = 根._按钮
    local 自适应 = 根._自适应
    self.资源组 = {
        [1] = 资源:载入('zdtb.wdf',"网易WDF动画",0x116),
        [2] = 资源:载入('zdtb.wdf',"网易WDF动画",0xEE171336),
        [3] = 资源:载入('zdtb.wdf',"网易WDF动画",0x111),--初级
        [4] = 资源:载入('zdtb.wdf',"网易WDF动画",0x112),--中级
        [5] = 资源:载入('zdtb.wdf',"网易WDF动画",0x113),--高级
        [6] = 资源:载入('zdtb.wdf',"网易WDF动画",0x114),--超级
        [7] = 资源:载入('zdtb.wdf',"网易WDF动画",0x115),--终极
    }
    self.窗口时间 = 0
    zts6 = tp.字体表.普通字体
    zts11 = tp.字体表.普通字体
    zts22 = tp.字体表.普通字体
    zts33 = tp.字体表.普通字体
end

function 场景类_套装属性栏:打开(数据)
    if self.可视 then
        进程 = 1
        self.可视 = false
    else
    if  self.x > 全局游戏宽度 then
       self.x = 260+(全局游戏宽度-800)/2
    end
    self.套装数据 = 数据
    self:加载(tp)
        insert(tp.窗口_,self)
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
    end
end

function 场景类_套装属性栏:显示(dt,x,y)
    self.焦点 = false
    self.资源组[1]:显示(self.x,self.y)
    for i=2,7 do
       self.资源组[i]:更新(x,y)
    end
    self.资源组[2]:显示(self.x+40,self.y+53)
    self.资源组[2]:显示(self.x+40,self.y+190)

    zts11:置颜色(0xFFFFFFFF):显示(self.x+125,self.y+27,"套装加成")
    zts6:置颜色(0xFF3535ff)
    zts6:显示(self.x + 50,self.y + 55,"(当前)")
    zts6:显示(self.x + 50,self.y + 192,"(下一级)")



    if self.套装数据.套装等级 == 0 then
       zts:显示(self.x + 95,self.y + 55,"暂无")


    end

       zts6:显示(self.x + 100,self.y + 55,self.套装数据.套装等级)
           self.资源组[7]:显示(self.x+115,self.y+56)
           zts22:显示(self.x+50,self.y+80,"气血上限 + ")
           zts22:显示(self.x+50,self.y+100,"魔法上限 + ")
           zts22:显示(self.x+50,self.y+120,"物理伤害 + ")
           zts22:显示(self.x+50,self.y+140,"灵力 + ")
           zts22:显示(self.x+50,self.y+160,"人物速度 + ")
           zts33:置颜色(0xFFf79652)
           zts33:显示(self.x+150,self.y+80,self.套装数据.气血上限.." %")
           zts33:显示(self.x+150,self.y+100,self.套装数据.魔法上限.." %")
           zts33:显示(self.x+150,self.y+120,self.套装数据.物理攻击.." %")
           zts33:显示(self.x+150,self.y+140,self.套装数据.灵力.." %")
           zts33:显示(self.x+150,self.y+160,self.套装数据.速度.." %")

       zts6:显示(self.x + 115,self.y + 192,self.套装数据.套装等级+4)
       self.资源组[3]:显示(self.x+130,self.y+193)
       zts22:显示(self.x+50,self.y+217,"气血上限 + ")
       zts22:显示(self.x+50,self.y+237,"魔法上限 + ")
       zts22:显示(self.x+50,self.y+257,"物理伤害 + ")
       zts22:显示(self.x+50,self.y+277,"灵力 + ")
       zts22:显示(self.x+50,self.y+297,"人物速度 + ")
       zts22:置颜色(0xFFf79652)
       zts33:显示(self.x+150,self.y+217,1+self.套装数据.气血上限.." %")
       zts33:显示(self.x+150,self.y+237,1+self.套装数据.魔法上限.." %")
       zts33:显示(self.x+150,self.y+257,1+self.套装数据.物理攻击.." %")
       zts33:显示(self.x+150,self.y+277,1+self.套装数据.灵力.." %")
       zts33:显示(self.x+150,self.y+297,1+self.套装数据.速度.." %")





end

function 场景类_套装属性栏:检查点(x,y)
  if self.资源组 ~= nil and self.资源组[1]:是否选中(x,y)  then
    return true
  end
end

function 场景类_套装属性栏:初始移动(x,y)
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

function 场景类_套装属性栏:开始移动(x,y)
  if self.鼠标 then
    self.x = x - self.xx
    self.y = y - self.yy
  end
end


return 场景类_套装属性栏

