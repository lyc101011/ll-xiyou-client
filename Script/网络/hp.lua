-- @Author: baidwwy
-- @Date:   2024-06-13 16:59:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-30 12:49:05
local 客户端类 = class()
local 回调 = require("script/网络/数据交换")
--回调:置缓冲区大小(10240)
--回调:置心跳检查间隔(0)
function 客户端类:初始化()
  self.连接账号=""
  self.连接密码=""
  self.连接结果=false
  fgf="*-*"
  fgc="@+@"
end

function 客户端类:更新(dt)
end

function 发送数据(id,内容)
  if 内容==nil then 内容={} end
  客户端:发送数据(id,内容,1)
end

function 客户端类:发送数据(序号,内容,数组转换)
  回调:发送数据(序号,内容,数组转换)
end

function 客户端类:连接处理(ip,端口,账号,密码)
       -- self.连接结果=回调:连接("127.0.0.1",端口)  --------------客户端ip
         self.连接结果=回调:连接(统一ip,端口)
  if self.连接结果==false then
    tp.提示:写入("#Y/啊哦，网络开小差了，请检查#R网络#Y或者检查#R版本#Y是否为最新……")
  end
  self.连接结果 = false----掉线重连
end

---------------------------------------掉线重连-----------------

function 客户端类:重新连接()
  if 回调:连接(系统参数.服务器.ip,系统参数.服务器.端口) then
    当前状态 = true
    重连=true
  else
    停止连接 = false
  end
end
-----------------------------------------------------------------

function 客户端类:取状态(连接)
  return self:取状态()
end

function 客户端类:断开()
  回调:断开()
end

function 客户端类:数据到达(序号,内容,时间)
end

return 客户端类