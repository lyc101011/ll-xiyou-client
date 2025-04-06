-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-01 15:31:46
local 场景类_战斗状态栏 = class()
local tp,zts1,zts2
local ARGB = ARGB
local insert = table.insert

function 场景类_战斗状态栏:初始化(根)
	self.ID = 116
	self.x =  300
	self.y =  140
	self.xx = 0
    self.yy = 0
    self.注释 = "战斗状态栏"
    self.可视 = false
    self.可视化 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
    self.窗口时间 = 0
    local 自适应 = 根._自适应
    local 资源 = 根.资源
    self.资源组 = {
        [1] = 自适应.创建(92,1,150,80,3,9),
        [2] = 资源:载入('pic/xian.png',"图片")
    }
    -- self.资源组[1]:置颜色(黑色)
    self.选中=nil
    tp = 根
    self.战意图标=tp.资源:载入('wzife.wd3',"网易WDF动画",2844166683)
    -- self.五行珠图标=tp.资源:载入('wzife.wd3',"网易WDF动画",2844166683)
    -- self.人参果图标=tp.资源:载入('wzife.wd3',"网易WDF动画",2844166683)
    zts1 = tp.字体表.猫猫字体
    zts2 = tp.字体表.猫猫字体1
    -- zts1:置颜色(白色)
    -- zts2:置颜色(白色)
end

function 场景类_战斗状态栏:打开(编号)
  if self.可视 then
    self.选中=nil
    self.可视 = false
    return
  else
    insert(tp.窗口_,self)
    tp.运行时间 = tp.运行时间 + 1
    self.窗口时间 = tp.运行时间
    self.可视 = true
    if 全局游戏宽度/2>鼠标.x then
       self.x=鼠标.x
       self.y=鼠标.y-50
    else
       self.x=鼠标.x-130
       self.y=鼠标.y-150
    end
    self.选中=编号
    tp.运行时间 = tp.运行时间 + 1
    self.窗口时间 = tp.运行时间
    self.可视 = true
  end
end

function 场景类_战斗状态栏:显示(dt,x,y)
    if not tp.战斗中 or not 战斗类.战斗单位[ljcs][self.选中] then return end
    local num=0
    local xx,yy = 140,70
    local n=0
    local s=0
    local b=0
    self.资源组[1]:显示(self.x,self.y)
    zts1:置颜色(白色)
    zts2:置颜色(白色)
    if 战斗类.战斗单位[ljcs][self.选中].战意>0 then
        n=n+1
        b=b+1
        num=num+1
        self.战意图标:显示(self.x+10,self.y+17)
        zts1:显示(self.x+45,self.y+25,"战意("..战斗类.战斗单位[ljcs][self.选中].战意.."层)")
        if 战斗类.战斗单位[ljcs][self.选中].超级战意>0 then
            zts2:显示(self.x+45,self.y+45,"超级战意("..战斗类.战斗单位[ljcs][self.选中].超级战意..")层")
        else
            zts2:显示(self.x+45,self.y+45,"永久")
        end
    end
    if 战斗类.战斗单位[ljcs][self.选中].五行珠>0 then
        n=n+1
        b=b+1
        num=num+1
        self.战意图标:显示(self.x+10,self.y+17)
        zts1:显示(self.x+45,self.y+25,"五行珠("..战斗类.战斗单位[ljcs][self.选中].五行珠.."枚)")
        zts2:显示(self.x+45,self.y+45,"永久")
    end
    if 战斗类.战斗单位[ljcs][self.选中].人参果.枚>0 then
        n=n+1
        b=b+1
        num=num+1
        self.战意图标:显示(self.x+10,self.y+17)
        zts1:显示(self.x+45,self.y+25,"人参果("..战斗类.战斗单位[ljcs][self.选中].人参果.枚.."枚)")
        zts2:显示(self.x+45,self.y+45,"剩余"..战斗类.战斗单位[ljcs][self.选中].人参果.回合.."回合")
    end
    if 战斗类.战斗单位[ljcs][self.选中].骤雨.层数>0 then
        n=n+1
        b=b+1
        num=num+1
        self.战意图标:显示(self.x+10,self.y+17)
        zts1:显示(self.x+45,self.y+25,"骤雨("..战斗类.战斗单位[ljcs][self.选中].骤雨.层数.."层)")
        zts2:显示(self.x+45,self.y+45,"剩余"..战斗类.战斗单位[ljcs][self.选中].骤雨.回合.."回合")
    end
    for k,v in pairs(战斗类.战斗单位[ljcs][self.选中].状态特效) do
        if v.小图标 == nil then
            local qtb = 引擎.取技能(k)
            if qtb[8]~= nil then --有这个图标
                v.小图标=tp.资源:载入(qtb[6],"网易WDF动画",qtb[8])
            else
                v.小图标=tp.资源:载入('wzife.wd3',"网易WDF动画",2844166683)
            end
        end
        local 缩放x,缩放y = nil,nil
        if v.小图标.宽度 > 24 then
            缩放x,缩放y = 等比例缩放公式(24,24,v.小图标.宽度 , v.小图标.高度)
        end
        if k == "护盾" then
            self.战意图标:显示(self.x+10+n*xx,self.y+17+s*yy)
            zts1:显示(self.x+45+n*xx,self.y+25+s*yy,k.."("..战斗类.战斗单位[ljcs][self.选中].护盾..")")
            zts2:显示(self.x+45+n*xx,self.y+45+s*yy,"永久")
        elseif v.层数~=nil then
            v.小图标:显示(self.x+10+n*xx,self.y+17+s*yy,缩放x,缩放y)
            zts1:显示(self.x+45+n*xx,self.y+25+s*yy,k.."("..v.层数.."层"..")")
            if v.回合<=50 then
                zts2:显示(self.x+45+n*xx,self.y+45+s*yy,"剩余"..v.回合.."回合")
            else
                zts2:显示(self.x+45+n*xx,self.y+45+s*yy,"永久")
            end
        elseif k == "生命之泉" then
            v.小图标:显示(self.x+10+n*xx,self.y+17+s*yy,缩放x,缩放y)
            if v.陌宝 then
                zts1:显示(self.x+45+n*xx,self.y+25+s*yy,k.."(陌宝)")
            -- elseif v.归本 then
            --     zts1:显示(self.x+45+n*xx,self.y+25+s*yy,k.."(归本)")
            else
                zts1:显示(self.x+45+n*xx,self.y+25+s*yy,k)
            end
            zts2:显示(self.x+45+n*xx,self.y+45+s*yy,"剩余"..v.回合.."回合")
        else
            v.小图标:显示(self.x+10+n*xx,self.y+17+s*yy,缩放x,缩放y)
            zts1:显示(self.x+45+n*xx,self.y+25+s*yy,k)              --名称显示
            zts2:显示(self.x+45+n*xx,self.y+45+s*yy,"剩余"..v.回合.."回合")
        end

        n=n+1
        b=b+1
        num=num+1
        if n>1 then n=0 end
        if b>1 then s=1 end
        if b>3 then s=2 end
        if b>5 then s=3 end
        if b>7 then s=4 end
        if b>9 then s=4 end
    end
    -- if 战斗类.战斗单位[ljcs][self.选中].如意神通~=nil then
    --     n=n+1
    --     b=b+1
    --     -- if num==0 then
    --     --     num = num + 2
    --     -- else
    --         num = num + 2
    --     -- end
    --     -- self.人参果图标:显示(self.x+10,self.y+17)
    --     zts2:显示(self.x+15,self.y+25,"如意神通："..战斗类.战斗单位[ljcs][self.选中].如意神通[1].."，"..战斗类.战斗单位[ljcs][self.选中].如意神通[2].."，"..战斗类.战斗单位[ljcs][self.选中].如意神通[3])
    -- end

    if num<=0 then self.可视=false return end

    if 引擎.鼠标按下(右键) or 引擎.鼠标按下(左键) then self.可视=false return  end

    if num<=1 then
        self.资源组[1]:置宽高(150,80)
    elseif num<=2 then
        self.资源组[1]:置宽高(260,80)
    elseif num<=4 then
        self.资源组[1]:置宽高(260,145)
        self.资源组[2]:显示(self.x+8,self.y+67)
    elseif num<=6 then
        self.资源组[1]:置宽高(260,210)
        self.资源组[2]:显示(self.x+8,self.y+67)
        self.资源组[2]:显示(self.x+8,self.y+137)
    elseif num<=8 then
        self.资源组[1]:置宽高(260,279)
        self.资源组[2]:显示(self.x+8,self.y+67)
        self.资源组[2]:显示(self.x+8,self.y+137)
        self.资源组[2]:显示(self.x+8,self.y+207)
    else
        self.资源组[1]:置宽高(260,345)
        self.资源组[2]:显示(self.x+8,self.y+67)
        self.资源组[2]:显示(self.x+8,self.y+137)
        self.资源组[2]:显示(self.x+8,self.y+207)
        self.资源组[2]:显示(self.x+8,self.y+277)
    end

end

function 场景类_战斗状态栏:检查点(x,y)
    if self.可视 and self.资源组[1]:是否选中(x,y)  then
        return true
    end
    return false
end

function 场景类_战斗状态栏:初始移动(x,y)
    tp.运行时间 = tp.运行时间 + 1
    if not 引擎.消息栏焦点 then
        self.窗口时间 = tp.运行时间
    end
    if not self.焦点 then
        tp.场景.战斗.移动窗口 = true
    end
    if self.可视 and self.鼠标 and  not self.焦点 then
        self.xx = x - self.x
        self.yy = y - self.y
    end
end

function 场景类_战斗状态栏:开始移动(x,y)
    if self.可视 and self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

return 场景类_战斗状态栏