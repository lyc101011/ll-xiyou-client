-- @Author: baidwwy
-- @Date:   2024-10-15 01:51:34
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-01 05:29:41
local 登录类 = class()

local tp
local mouseb = 引擎.鼠标按下

function 登录类:初始化(根)

    local 资源 = 根.资源
    local 按钮 = 根._按钮
    tp = 根
    self.右键关闭=1
    -- self.上一步 = 根._按钮(资源:载入('org.rpk',"网易WDF动画",0x1000255),0,0,3,true,true)
    -- self.创建 = 根._按钮(资源:载入('wzife.wdf',"网易WDF动画",0x75D9CC0E),0,0,3,true,true)
    -- self.下一步 = 根._按钮(资源:载入('org.rpk',"网易WDF动画",0x1000254),0,0,3,true,true)
 --    self.注册账号 = 根._按钮(资源:载入('org.rpk',"网易WDF动画",0x1000246),0,0,3,true,true)

    -- self.背景图片=资源:载入('org.rpk',"网易WDF动画",0x1000260)
 --  self.上一步:置颜色(ARGB(230,255,255,255))
 --  self.下一步:置颜色(ARGB(230,255,255,255))
 --  self.背景图片:置颜色(ARGB(220,255,255,255))
    self.控件类 = require("ggeui/加载类")()
    local 总控件 = self.控件类:创建控件('创建控件')
    总控件:置可视(true,true)
    self.账号输入框 = 总控件:创建输入("账号输入",325+5,268-10,210,18,根,根.字体表.华康14)
    self.账号输入框:置可视(false,false)
    self.账号输入框:置限制字数(15)
    self.账号输入框:置光标颜色(4294967295)
    self.账号输入框:置文字颜色(4294967295)
    self.账号输入框:置文本("888888888")
              self.账号输入框:置帐号模式()
    self.密码输入框 = 总控件:创建输入("密码输入",325+5,268-10+37,210,18,根,根.字体表.华康14)
    self.密码输入框:置可视(false,false)
    self.密码输入框:置限制字数(12)
    self.密码输入框:置光标颜色(4294967295)
    self.密码输入框:置文字颜色(4294967295)
    self.密码输入框:置密码模式()
    self.账号输入框:置文本(f函数.读配置(程序目录.."config.ini","mhxy","账号"))
    self.密码输入框:置文本(f函数.读配置(程序目录.."config.ini","mhxy","密码"))
            self.lan=资源:载入('wdf/audio/tupian/dl1.png',"图片")
            self.shur=资源:载入('wdf/audio/tupian/dl2.png',"图片")
            self.普通登录 = 根._按钮(资源:载入('common/wzife.wdf',"网易WDF动画",3441288625),0,0,3,true,true)
            self.二维码 = 根._按钮(资源:载入('common/wzife.wdf',"网易WDF动画",3877193719),0,0,3,true,true)
            self.登录1 = 根._按钮(资源:载入('common/wzife.wdf',"网易WDF动画",3554811947),0,0,3,true,true)
            self.返回1 = 根._按钮(资源:载入('common/wzife.wdf',"网易WDF动画",137664855),0,0,3,true,true)
            self.注册账号 = 根._按钮(资源:载入('wzife.wdf',"网易WDF动画",120445191),0,0,3,true,true)
            self.花好月圆 = 资源:载入('common/wzife.wdf',"网易WDF动画",2433817108)


    self.事件 = false
    self.焦点 = false
    self.开启 = false
    self.编号 = 编号
    self.双击 = nil
    self.时间 = 0
end

function 登录类:更新(dt)

end


function 登录类:显示(dt,x,y)
    引擎.置标题(__game.." - 请输入账号密码")
    self.普通登录:显示(270,170,nil,nil,nil,true,2)
    self.二维码:更新(x,y)
    self.登录1:更新(x,y)
    self.返回1:更新(x,y)
    self.注册账号:更新(x,y)
    self.二维码:显示(270+144,170)
    self.lan:显示(239,234)
            self.shur:显示(262,254)
    self.返回1:显示(270,170+170)
    self.登录1:显示(270+144,170+170)
    self.注册账号:显示(595,251)

    self.账号输入框:置可视(true,true)
    self.密码输入框:置可视(true,true)
    -- self.花好月圆:显示(40,70+59)
    -- self.背景图片:显示(225,178)
    self.控件类:更新(dt,x,y)
    self.控件类:显示(x,y)
    if 引擎.按键弹起(键盘符号.tab) then
        if self.账号输入框:取焦点() then
            self.账号输入框:置焦点(false)
            self.密码输入框:置焦点(true)
        elseif self.密码输入框:取焦点() then
            self.密码输入框:置焦点(false)
            self.账号输入框:置焦点(true)
        else
            self.账号输入框:置焦点(true)
        end
    end
--------------------------------------------------------------------------------------------
    if 掉线重连[1]~=nil and 掉线重连[2]~=nil then
        客户端:发送数据(1,版本号..fgc..掉线重连[1]..fgc..掉线重连[2]..fgc..f函数.取硬盘序列号())
    end
-------------------------------------------------------------------------------------------
    if self.注册账号:事件判断() then
        tp.进程 = 5
    elseif self.返回1:事件判断() then
        tp.进程 = 1
        系统退出=true
        客户端:断开()
    elseif self.登录1:事件判断() or 引擎.按键按下(KEY.ENTER) then
        if self.账号输入框:取文本()=="" or self.密码输入框:取文本()=="" then
            tp.提示:写入("#Y/账号或密码格式不正确")
            return 0
        elseif #self.账号输入框:取文本() <6 or #self.密码输入框:取文本() <6  then
            tp.提示:写入("#Y/账号或密码格式不正确")
            return 0
        elseif self:字符串判定(self.账号输入框:取文本(),"\\") then
            tp.提示:写入("#Y/账号或密码格式不正确")
        elseif self:字符串判定(self.账号输入框:取文本(),"/") then
            tp.提示:写入("#Y/账号或密码格式不正确")
        else
            系统参数.账号=self.账号输入框:取文本()
            系统参数.密码=self.密码输入框:取文本()
            f函数.写配置(程序目录.."config.ini","mhxy","账号",系统参数.账号)
            f函数.写配置(程序目录.."config.ini","mhxy","密码",系统参数.密码)
            -- self.密码输入框:置文本("")
            -- self.账号输入框:置文本("")
            self.账号输入框:置可视(false)
            self.密码输入框:置可视(false)
            客户端:发送数据(1,版本号..fgc..系统参数.账号..fgc..系统参数.密码..fgc..f函数.取硬盘序列号())
        end
    end
    -- if self.上一步:事件判断() then
    --     tp.进程 = 8
    -- elseif self.注册账号:事件判断() then
    --     tp.进程 = 5

    -- elseif self.下一步:事件判断() or 引擎.按键按下(KEY.ENTER) then
    --     if self.账号输入框:取文本()=="" or self.密码输入框:取文本()=="" then
    --         tp.提示:写入("#Y/请先输入账号或密码")
    --         return 0
    --     elseif #self.账号输入框:取文本() <6 or #self.密码输入框:取文本() <6  then
    --         tp.提示:写入("#Y/账号或密码格式不正确")
    --         return 0
    --     elseif self:字符串判定(self.账号输入框:取文本(),"\\") then
    --         tp.提示:写入("#Y账号账号存在非法字符")
    --     elseif self:字符串判定(self.账号输入框:取文本(),"/") then
    --         tp.提示:写入("#Y账号账号存在非法字符")
    --     else
    --         系统参数.账号=self.账号输入框:取文本()
    --         系统参数.密码=self.密码输入框:取文本()
    --         f函数.写配置(程序目录.."config.ini","mhxy","账号",系统参数.账号)
    --         f函数.写配置(程序目录.."config.ini","mhxy","密码",系统参数.密码)
    --         self.密码输入框:置文本("")
    --         self.账号输入框:置文本("")
    --         self.账号输入框:置可视(false)
    --         self.密码输入框:置可视(false)
    --         客户端:发送数据(1,版本号..fgc..系统参数.账号..fgc..系统参数.密码..fgc..f函数.取硬盘序列号())
    --     end
    -- end
end

function 登录类:字符串判定(str,item)
    local t = {}
    local l = {}
    local index = 0
    for i = 1, string.len(str) do
        table.insert(t, string.byte(string.sub(str, i, i)))
    end

    for i = 1, string.len(item) do
        table.insert(l, string.byte(string.sub(item, i, i)))
    end
    if #l > #t then
        return false
    end

    for k, v1 in pairs(t) do
        index = index + 1
        if v1 == l[1] then
            local iscontens = true
            for i = 1, #l do
                if t[index + i - 1] ~= l[i] then
                    iscontens = false
                end
            end
            if iscontens then
                return iscontens
            end
        end
    end
    return false
end
return 登录类