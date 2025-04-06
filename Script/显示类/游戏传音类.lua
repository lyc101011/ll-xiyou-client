--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2022-09-15 21:24:26
-- 梦幻西游游戏资源破解 baidwwy@vip.qq.com(313738139) 老毕   和 C++PrimerPlus 717535046 这俩位大神破解所以资源
--======================================================================--
local 游戏传音类 = class()

function 游戏传音类:初始化(根)
    self.显示开关=false
    self.丰富文本=根._丰富文本(240,125,根.字体表.道具详情)
    -- self.丰富文本 =根._丰富文本(425,h)
    for n=0,120 do
        self.丰富文本:添加元素(n,根.包子表情动画[n])
    end
    self.资源组 = {
        [1]  = 根._自适应.创建(70,1,267,80,3,9),
        [2]  = 根.资源:载入('common/wzife.wdf',"网易WDF动画",2778073121),
        [3]  = 根.资源:载入('common/wzife.wdf',"网易WDF动画",3970451549),--上
        [4]  = 根.资源:载入('common/wzife.wdf',"网易WDF动画",3455871549), --下
        [5]  = 根.资源:载入('common/wzife.wdf',"网易WDF动画",320759722), --喇叭

        }
end

function 游戏传音类:添加传音(内容)
    -- if self.显示开关==false then
        self.计时=2000
        self.高度 = 0
        if 全局游戏宽度==1024 then
            self.高度 = 150
        end
        self.显示开关=true
        self.丰富文本:清空()
        self.丰富文本:添加文本(内容.内容)
    -- end
    内容=nil
end

function 游戏传音类:更新内容(内容)

end

function 游戏传音类:显示(dt,x,y)

    if self.显示开关 then
        self.计时=self.计时-1
        if self.计时<1 then
            self.丰富文本:清空()
            self.显示开关=false
        end
        -- self.资源组[2]:更新(dt*0.8)
        self.资源组[3]:更新(dt)
        self.资源组[4]:更新(dt)
        self.资源组[1]:显示(0,330+self.高度)
        self.资源组[5]:显示(0,340+self.高度)
        self.资源组[3]:显示(0,330+self.高度)
        self.资源组[4]:显示(0,410+self.高度)
        self.丰富文本:更新(x,y)
        self.丰富文本:显示(20,340+self.高度)
    end
end

return 游戏传音类