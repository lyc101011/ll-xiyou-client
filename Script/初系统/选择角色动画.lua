-- @Author: baidwwy
-- @Date:   2024-09-08 18:20:46
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-08 23:19:55
local 人物动画类 = class()

local txs = 引擎.取头像
local mxs = 引擎.取模型
local insert = table.insert
--local tp = nil
local tonumber = tonumber
local pairs = pairs
local tq  = 引擎.鼠标弹起

function 人物动画类:初始化1(类型,根,模型,武器,染色)
end

function 人物动画类:初始化(类型,根,模型,武器,染色,方案,炫彩,炫彩组,id,副武器)
    if not 副武器 then
        副武器 = {}
    end
  local s = txs(模型)
  local q = mxs(模型)
  self.右键关闭=1
  self.方向=2
  if 类型==1 then --进入游戏时的选择角色
    local s = txs(模型)
    local q = mxs(模型)
    self.人物头像 = 根.资源:载入(s[7],"网易WDF动画",s[6])
    if 武器.名称=="" and 副武器.名称 == "" then
      self.动作="静立"
      self[self.动作] = 根.资源:载入(q[3],"网易WDF动画",q[1],nil,nil,nil,nil,素材id)
       if 炫彩 ~= nil then
         self[self.动作]:炫彩染色(方案,炫彩组)
      else
        if 方案~=0 then
          self[self.动作]:置染色(方案,染色[1],染色[2],染色[3],0)
        end
      end
    else
      self.武器={}
      self.动作="静立"
      local ssss = 武器.子类
      if 武器.名称 == "龙鸣寒水" or 武器.名称 == "非攻" then
        ssss = "弓弩1"
      else
        ssss = tp:取武器子类(武器.子类)
      end
      q = mxs(模型,ssss)
      self[self.动作] = 根.资源:载入(q[3],"网易WDF动画",q[1])
      if 炫彩组 ~= nil then
         self[self.动作]:炫彩染色(方案,炫彩组)
      else
        if 方案~=0 then
          self[self.动作]:置染色(方案,染色[1],染色[2],染色[3],0)
        end
      end
      local m = tp:取武器附加名称(武器.子类,武器.级别限制,武器.名称)
      local x = mxs(m.."_"..模型,nil)
      self.武器[self.动作] = 根.资源:载入(x[3],"网易WDF动画",x[1])
      self.武器[self.动作]:置差异(self.武器[self.动作].帧数-self[self.动作].帧数)
      if 副武器 ~= nil and 副武器.名称 ~= "" then
          self.副武器 = {}
          self.动作 = "静立"
          local ssss = 副武器.子类
          local sss = nil
          ssss = tp:取武器子类(副武器.子类)
          q = mxs(模型, ssss)
          sss = ssss == "弓弩1" and "弓弩" or ssss

          if 武器.名称 == "" then
              self[self.动作] = 根.资源:载入(q[3], "网易WDF动画", q[1])

              if 方案 ~= 0 then
                  self[self.动作]:置染色(方案, 染色[1], 染色[2], 染色[3], 0)
              end
          end
          local m = tp:取武器附加名称(副武器.子类, 副武器.级别限制, 副武器.名称, 副武器.光武拓印)
          local x = mxs(m .. "_" .. 模型, nil)
          self.副武器[self.动作] = 根.资源:载入(x[3], "网易WDF动画", x[1])

          if 锦衣 == nil then
              self.副武器[self.动作]:置差异(self.副武器[self.动作].帧数 - self[self.动作].帧数)
          end

          if 副武器.染色方案 ~= 0 and 副武器.染色组 ~= 0 and 副武器.染色组 ~= nil and #副武器.染色组 > 0 then
              self.副武器[self.动作]:置染色(副武器.染色方案, 副武器.染色组[1], 副武器.染色组[2], 副武器.染色组[3])
          end
      end
    end
  end
end



function 人物动画类:点击事件()
  if self[self.动作]:是否选中(鼠标.x,鼠标.y) and 引擎.鼠标弹起(左键) then
    return true
  elseif self.武器~=nil and self.武器[self.动作]:是否选中(鼠标.x,鼠标.y) and 引擎.鼠标弹起(左键) then
    return true
  else
    return false
  end
end

function 人物动画类:更新(dt)

  self[self.动作]:更新(dt)
  self[self.动作]:置方向(4)
  if self.武器~=nil then
    self.武器[self.动作]:置方向(4)
    self.武器[self.动作]:更新(dt)
  end
    if self.副武器 ~= nil then
        self.副武器[self.动作]:更新(dt)
        self.副武器[self.动作]:置方向(4)
    end
end

function 人物动画类:显示(x,y)
  tp.影子:显示(x,y)
  -- self[self.动作]:置方向(4)
  self[self.动作]:显示(x,y)
  if self.武器~=nil then
    -- self.武器[self.动作]:置方向(4)
    self.武器[self.动作]:显示(x,y)
  end
    if self.副武器 ~= nil then
        self.副武器[self.动作]:显示(x, y)
    end
end

return 人物动画类