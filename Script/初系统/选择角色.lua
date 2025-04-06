-- @Author: baidwwy
-- @Date:   2024-09-08 18:20:46
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-25 04:10:28
local 选择角色 = class()

local tp
local qtx = 引擎.取头像
local mouseb = 引擎.鼠标按下
local qmx = 引擎.取模型
local qzd = 引擎.取战斗模型

-------
local keytq = 引擎.按键弹起
local keyaz = 引擎.按键按住
local keyax = 引擎.按键按下


function 选择角色:初始化(根)
    local 资源 = 根.资源
    tp = 根
    self.右键关闭=1
    local 按钮 = 根._按钮

    self.xzjs = 资源:载入('common/wzife.wdf',"网易WDF动画",2749093512)
    -- self.dit = 资源:载入('wzife.wdf',"网易WDF动画",4101314240)
    self.dit={}
    for i=1,6 do
        self.dit[i]=资源:载入('wdf/audio/tupian/jsk.png',"图片")
    end
    self.xz=资源:载入('wdf/audio/tupian/xz.png',"图片")
    self.menp = 资源:载入('common/wzife.wdf',"网易WDF动画",285732441)
    self.xingm = 资源:载入('common/wzife.wdf',"网易WDF动画",2175247762)
    self.dengji = 资源:载入('common/wzife.wdf',"网易WDF动画",334502404)
    self.aidi = 资源:载入('common/wzife.wdf',"网易WDF动画",816273486)
    self.beij=根._自适应.创建(71,1,487,127,3,9)
    self.角色创建按钮 = 根._按钮(资源:载入('common/wzife.wdf',"网易WDF动画",2053192425),0,0,3,true,true)
    self.进入游戏按钮 = 根._按钮(资源:载入('wzife.wdf',"网易WDF动画",170160535),0,0,3,true,true)
    self.角色组={
        飞燕女={头像=资源:载入(qtx("飞燕女")[7],"网易WDF动画",qtx("飞燕女")[6])},
        英女侠={头像=资源:载入(qtx("英女侠")[7],"网易WDF动画",qtx("英女侠")[6])},
        巫蛮儿={头像=资源:载入(qtx("巫蛮儿")[7],"网易WDF动画",qtx("巫蛮儿")[6])},
        偃无师={头像=资源:载入(qtx("偃无师")[7],"网易WDF动画",qtx("偃无师")[6])},
        逍遥生={头像=资源:载入(qtx("逍遥生")[7],"网易WDF动画",qtx("逍遥生")[6])},
        剑侠客={头像=资源:载入(qtx("剑侠客")[7],"网易WDF动画",qtx("剑侠客")[6])},
        狐美人={头像=资源:载入(qtx("狐美人")[7],"网易WDF动画",qtx("狐美人")[6])},
        骨精灵={头像=资源:载入(qtx("骨精灵")[7],"网易WDF动画",qtx("骨精灵")[6])},
        鬼潇潇={头像=资源:载入(qtx("鬼潇潇")[7],"网易WDF动画",qtx("鬼潇潇")[6])},
        杀破狼={头像=资源:载入(qtx("杀破狼")[7],"网易WDF动画",qtx("杀破狼")[6])},
        巨魔王={头像=资源:载入(qtx("巨魔王")[7],"网易WDF动画",qtx("巨魔王")[6])},
        虎头怪={头像=资源:载入(qtx("虎头怪")[7],"网易WDF动画",qtx("虎头怪")[6])},
        舞天姬={头像=资源:载入(qtx("舞天姬")[7],"网易WDF动画",qtx("舞天姬")[6])},
        玄彩娥={头像=资源:载入(qtx("玄彩娥")[7],"网易WDF动画",qtx("玄彩娥")[6])},
        桃夭夭={头像=资源:载入(qtx("桃夭夭")[7],"网易WDF动画",qtx("桃夭夭")[6])},
        羽灵神={头像=资源:载入(qtx("羽灵神")[7],"网易WDF动画",qtx("羽灵神")[6])},
        神天兵={头像=资源:载入(qtx("神天兵")[7],"网易WDF动画",qtx("神天兵")[6])},
        龙太子={头像=资源:载入(qtx("龙太子")[7],"网易WDF动画",qtx("龙太子")[6])},
        影精灵={头像=资源:载入(qtx("影精灵")[7],"网易WDF动画",qtx("影精灵")[6])},
    }
    self.wenzi=require("gge文字类").创建(nil,14,false,false,false)





    self.角色数据={}
    self.角色信息={}
    self.角色选中号码=1
    self.双击 = nil
    self.时间 = 0
end

function 选择角色:显示(dt,x,y)
    self.xzjs:显示(278+32,68)
    -- self.dit:显示(297,142)
    self.beij:显示(110,440)
    self.xingm:显示(165,440+26)
    self.dengji:显示(165,440+26+48)
    self.aidi:显示(300+100,440+26)
    self.menp:显示(300+80,440+26+48)
    self.进入游戏按钮:更新(x,y)
    self.进入游戏按钮:显示(639,440+74)
     local xx,yy,xx1,yy1 = 0,0,0,0
     -- local go = false
     for n=1,6 do
         self.dit[n]:显示(297+xx1*100,142+yy1*130)
         if self.dit[n]:是否选中(x,y)  then
            self.xz:显示(297+xx1*100,142+yy1*130)
         end
         if self.角色数据[n] then
             self.角色数据[n]:更新(dt)
            self.角色数据[n]:显示(345+xx*100,245+yy*130)
            -- if  self.角色数据[n]:点击事件() then
            --     self.角色选中号码=n
            -- end
            if self.dit[n]:是否选中(x,y) then
                 if  mouseb(0) then
                     self.角色选中号码=n
                     -- go=true
                 end
                 if 引擎.鼠标弹起(0) then
                    if self.双击 == nil then
                        self.事件 = true
                        self.双击 = 1
                        self.haoma=self.角色选中号码
                    else
                        self.事件 = nil
                        self.载入 = 1
                    end
                end
                if self.双击 == 1 then
                    self.时间 = self.时间 + 1
                    if self.时间 >= 16 then
                        self.双击 = nil
                        self.时间 = 0
                    end
                end
                if self.载入 ~= nil then
                    if self.haoma~=self.角色选中号码 then
                        self.双击 = nil
                        self.时间 = 0
                        self.载入 = nil
                        -- return
                    else
                        -- 系统参数.选中玩家id = self.角色信息[self.角色选中号码].id
                        客户端:发送数据(4,self.角色信息[self.角色选中号码].id)
                        -- 全局登陆内容()
                        self.载入 = nil
                    end
                end

             end
            xx=xx+1
            if xx>=3 then
                xx=0
                yy=1
            end
         end
           xx1=xx1+1
            if xx1>=3 then
                xx1=0
                yy1=1
            end
     end
    if #self.角色数据~=0 and self.角色信息[self.角色选中号码]  then
        self.角色组[self.角色信息[self.角色选中号码].造型].头像:显示(163,410)
        self.wenzi:置颜色(白色)
        self.wenzi:显示(165+76,440+33,self.角色信息[self.角色选中号码].名称)
        self.wenzi:显示(165+76,440+33+48,self.角色信息[self.角色选中号码].等级)
        self.wenzi:显示(300+75+80,440+33,self.角色信息[self.角色选中号码].id)
        self.wenzi:显示(300+75+80,440+33+48,self.角色信息[self.角色选中号码].门派)
        if self.进入游戏按钮:事件判断() or 引擎.按键按下(KEY.ENTER)  then
            -- 系统参数.选中玩家id = self.角色信息[self.角色选中号码].id
            客户端:发送数据(4,self.角色信息[self.角色选中号码].id)

        end
    end
    if #self.角色数据<6 then
        self.角色创建按钮:更新(x,y)
        self.角色创建按钮:显示(639,444)
        if self.角色创建按钮:事件判断() then
            tp.创建:刷新位置()
            客户端:发送数据(2)
            tp.创建.种族选中 = "人"
            tp.创建.选中人物 = 1
        end
    end

---------------------------------------------掉线重连----------------------------------------
        if 掉线重连[3]~=nil then
            掉线重连[1]=nil
            掉线重连[2]=nil
            if #self.角色信息<tonumber(掉线重连[3]) then
              写配置("./掉线重连.ini","明夜西游","重连失败","该账号下无该角色")
            else
              写配置("./掉线重连.ini","明夜西游","重连成功",self.角色信息[tonumber(掉线重连[3])].名称)
              写配置("./掉线重连.ini","明夜西游","hahaha",进程id)
              客户端:发送数据(4,掉线重连[3]..fgc..f函数.取硬盘序列号()..fgc.."掉线重连")
            end
            掉线重连[3]=nil
        end
------------------------------------------------------------------------------------







end

function 选择角色:置方向(方向,n)
  self.创建人物精灵[n]["静立"]:置方向(方向)
  self.创建人物精灵[n]["行走"]:置方向(方向)
  self.创建人物精灵[n]["攻击"]:置方向(取四至八方向(方向))
  self.创建人物精灵[n]["施法"]:置方向(取四至八方向(方向))
end

function 选择角色:置染色(人物ID,染色方案,染色ID,方向)
  self.创建人物精灵[人物ID]["静立"]:置染色(染色方案,染色ID,染色ID,染色ID)
  self.创建人物精灵[人物ID]["行走"]:置染色(染色方案,染色ID,染色ID,染色ID)
  self.创建人物精灵[人物ID]["攻击"]:置染色(染色方案,染色ID,染色ID,染色ID)
  self.创建人物精灵[人物ID]["施法"]:置染色(染色方案,染色ID,染色ID,染色ID)
  self:置方向(方向,人物ID)
end

function 选择角色:后退方向()
  if self.方向 < 7 then
    self.方向 = self.方向 + 1
    self:置方向(self.方向,self.选中人物)
  else
    self.方向 = 0
    self:置方向(self.方向,self.选中人物)
  end
end

function 选择角色:前进方向()
  if self.方向 >= 1 then
    self.方向 = self.方向 - 1
    self:置方向(self.方向,self.选中人物)
  else
    self.方向 = 7
    self:置方向(self.方向,self.选中人物)
  end
end

function 选择角色:更新(dt)
end


function 选择角色:添加角色信息(信息)
  self.角色数据={}
  self.角色信息={}
  for n=1,#信息 do
        self.角色数据[n]= require("script/初系统/选择角色动画")(1,tp,信息[n].造型,信息[n].武器数据,信息[n].染色组,信息[n].染色方案,信息[n].炫彩,信息[n].炫彩组,信息[n].id,信息[n].副武器数据) --信息[n].武器数据
        self.角色信息[n]=信息[n]
    -- self.角色数据[n]= require("script/初系统/选择角色动画")(1,tp,信息[n].造型,信息[n].武器数据,信息[n].染色组,信息[n].染色方案,信息[n].锦衣数据,信息[n].光环数据,信息[n].足迹数据) --信息[n].武器数据
    -- self.角色信息[n]=信息[n]
  end
  tp.进程 = 2
  tp.选中窗口 = nil
end

return 选择角色