-- @Author: baidwwy
-- @Date:   2023-10-28 22:52:18
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2023-11-24 21:13:44
--======================================================================--
-- @作者: QQ381990860
-- @创建时间:   2019-12-03 02:17:19
-- @Last Modified time: 2023-10-27 00:35:15
--======================================================================--
local 采矿兑换  = class()
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下
local qmx = 引擎.取战斗模型
local mouseb = 引擎.鼠标弹起
local insert = table.insert
function 采矿兑换:初始化(根)
    self.ID = 4199
    self.x = 140
    self.y = 85
    self.xx = 0
    self.yy = 0
    self.注释 = "采矿兑换"
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    local 资源 = 根.资源
    local 按钮 = 根._按钮
    local 自适应 = 根._自适应
    self.资源组 = {
        [1] = 自适应.创建(0,1,577,400,3,9),
        [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),--关闭
        [3] = 资源:载入("pic111/兑换宝宝.png","图片"),
        [4] = 资源:载入("pic111/孩子介绍.png","图片"),
        [5] = 按钮(自适应.创建(12,4,108,22,1,3),0,0,4,true,true,"    兑 换"),
        [6] = 资源:载入("pic111/进阶.png","图片"),

    }

    self.宠物说明 = {
    {"小毛头","人族孩子","★消耗20个地心印记可兑换,此模型为佩戴饰品造型，购买不会佩戴饰品。"},
    {"小丫丫","人族孩子","★消耗20个地心印记可兑换,此模型为佩戴饰品造型，购买不会佩戴饰品。"},
    {"小仙灵","仙族孩子","★消耗20个地心印记可兑换,此模型为佩戴饰品造型，购买不会佩戴饰品。"},
    {"小仙女","仙族孩子","★消耗20个地心印记可兑换,此模型为佩戴饰品造型，购买不会佩戴饰品。"},
    {"小精灵","魔族孩子","★消耗20个地心印记可兑换,此模型为佩戴饰品造型，购买不会佩戴饰品。"},
    {"小魔头","魔族孩子","★消耗20个地心印记可兑换,此模型为佩戴饰品造型，购买不会佩戴饰品。"},
    {"进阶小毛头","人族孩子","★消耗50个地心印记可兑换,此模型为佩戴进阶饰品造型，购买不会佩戴饰品。"},
    {"进阶小丫丫","人族孩子","★消耗50个地心印记可兑换,此模型为佩戴进阶饰品造型，购买不会佩戴饰品。"},
    {"进阶小仙灵","仙族孩子","★消耗50个地心印记可兑换,此模型为佩戴进阶饰品造型，购买不会佩戴饰品。"},
    {"进阶小仙女","仙族孩子","★消耗50个地心印记可兑换,此模型为佩戴进阶饰品造型，购买不会佩戴饰品。"},
    {"进阶小精灵","魔族孩子","★消耗50个地心印记可兑换,此模型为佩戴进阶饰品造型，购买不会佩戴饰品。"},
    {"进阶小魔头","魔族孩子","★消耗50个地心印记可兑换,此模型为佩戴进阶饰品造型，购买不会佩戴饰品。"}
    }
      self.动画组 = {}
    for i=1,12 do
        local n = qmx(self.宠物说明[i][1])
        self.动画组[i] = 资源:载入(n[10],"网易WDF动画",n[6])
        self.动画组[i]:置方向(0)
    end
    for i=1,12 do
        local n = qmx(self.宠物说明[i][1].."_饰品")
        self.动画组[i].饰品 = tp.资源:载入(n[10],"网易WDF动画",n[6])
        self.动画组[i].饰品:置方向(0)
        end
    self.控件类 = require("ggeui/加载类")()
    local 总控件 = self.控件类:创建控件('商店总控件')
    总控件:置可视(true,true)
    self.窗口时间 = 0
    tp = 根
    self.选中焦点=根.资源:载入("pic111/采矿选中.png","图片")
    self.选中确定=根.资源:载入("pic111/采矿选中.png","图片")
    self.选中宠物 = 0
    self.介绍文本 = 根._丰富文本(108,600,根.字体表.普通字体)


end

function 采矿兑换:打开()
    if self.可视 then
        self.可视 = false
        self.介绍文本:清空()
        self.选中宠物 = 0
    else
        table.insert(tp.窗口_,self)
        tp.运行时间 = tp.运行时间 + 1
        self.窗口时间 = tp.运行时间
        self.可视 = true
        self.选中宠物 = 0

    end
end

function 采矿兑换:显示(dt,x,y)
    self.焦点 = false
    self.资源组[2]:更新(x,y)
    self.资源组[5]:更新(x,y,self.选中宠物 ~= 0)
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:显示(self.x+558,self.y+4)
    tp.窗口标题背景_:显示(self.x-86+self.资源组[1].宽度/2,self.y)
    引擎.场景.字体表.标题字体:置颜色(白色):显示(self.x+self.资源组[1].宽度/2,self.y+3,"兑换界面")
    tp.字体表.普通字体:置颜色(黄色):显示(self.x+63,self.y+32,"孩子们除外形外，没有任何区别。少侠可以根据自己心意选择孩子嗷！")
    self.资源组[4]:显示(self.x+452,self.y+59)
    self.资源组[5]:显示(self.x+455,self.y+362)
    self.介绍文本:显示(self.x + 430+28,self.y + 40+36)
    local xx = 0
    local yy = 0
    for i=1,12 do
    self.资源组[3]:显示(self.x+19+xx*109,self.y + 63 + yy * 110)
            xx = xx + 1
            if xx >= 4 then
                xx = 0
                yy = yy + 1
            end
        end
    self.资源组[6]:显示(self.x+238,self.y+176)
    self.资源组[6]:显示(self.x+238+109,self.y+176)

    self.资源组[6]:显示(self.x+238-218,self.y+286)
    self.资源组[6]:显示(self.x+238-109,self.y+286)
    self.资源组[6]:显示(self.x+238,self.y+286)
    self.资源组[6]:显示(self.x+238+109,self.y+286)

    self.资源组[6]:显示(self.x+238-218,self.y+176)
    self.资源组[6]:显示(self.x+238-109,self.y+176)

    self.资源组[6]:显示(self.x+238-218,self.y+65)
    self.资源组[6]:显示(self.x+238-109,self.y+65)
    self.资源组[6]:显示(self.x+238,self.y+65)
    self.资源组[6]:显示(self.x+238+109,self.y+65)

    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7-218,self.y+65+7,"普")
    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7-109,self.y+65+7,"普")
    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7,self.y+65+7,"普")
    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7+109,self.y+65+7,"普")


    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7-218,self.y+183,"普")
    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7-109,self.y+183,"普")


    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7-218,self.y+293,"进")
    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7-109,self.y+293,"进")
    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7,self.y+293,"进")
    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7+109,self.y+293,"进")

    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7,self.y+183,"进")
    引擎.场景.字体表.通用字体14:置颜色(黑色):显示(self.x+252-7+109,self.y+183,"进")
    local xx = 0
    local yy = 0
    for i=1,12 do
        local jx = self.x+69+xx*109
        local jy = self.y+133+yy*110

        tp.影子:显示(jx,jy)
        self.动画组[i]:更新(dt)
        self.动画组[i]:显示(jx,jy)
        self.动画组[i].饰品:更新(dt)
        self.动画组[i].饰品:显示(jx,jy)
        --self.动画组[i]:取消高亮()
        if self.动画组[i]:是否选中(x,y) then
            self.焦点 = true
            --self.动画组[i]:置高亮()
            self.选中焦点:显示(self.x+19+xx*109,self.y + 63 + yy * 110)
            if mouseb(0) then
                self.选中宠物 = i
                self.介绍文本:清空()
                if self.选中宠物 > 6 then
                self.介绍文本:添加文本("#W/  "..self.宠物说明[self.选中宠物][1])
                else
                self.介绍文本:添加文本("#W/    "..self.宠物说明[self.选中宠物][1])
                end
                self.介绍文本:添加文本("\n#Y/"..self.宠物说明[self.选中宠物][2])
                self.介绍文本:添加文本("#Y/"..self.宠物说明[self.选中宠物][3])

            end

        end
            if self.选中宠物 == i then
            self.选中确定:显示(self.x+19+xx*109,self.y + 63 + yy * 110)
            end
        xx = xx + 1
        if xx > 3 then
            xx = 0
            yy = yy + 1
        end

    end


if self.资源组[2]:事件判断() then
        self:打开()
        return false
elseif self.资源组[5]:事件判断() then
    if self.选中宠物~=nil and self.选中宠物~=0 then
           发送数据(3801.5,{参数=self.选中宠物})
    else
    tp.提示:写入("请选择要操作的召唤兽")
    end

end
end
function 采矿兑换:检查点(x,y)
    if self.资源组[1]:是否选中(x,y)  then
        return true
    end
end
function 采矿兑换:初始移动(x,y)
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

function 采矿兑换:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 采矿兑换