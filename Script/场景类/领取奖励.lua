-- @Author: baidwwy
-- @Date:   2024-04-03 22:06:51
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-04-08 23:49:49

-- local 场景类_领取奖励 = class()
-- local floor = math.floor
-- local insert = table.insert
-- local random = 引擎.取随机整数
-- local mouseb = 引擎.鼠标弹起
-- local floor = math.floor
-- local format = string.format
-- local zts,tp
-- local min = math.min
-- local remove = table.remove
-- local lqjl = {"全服击杀远古数量","全服捉鬼数量"}
-- function 场景类_领取奖励:初始化(根)
--     self.ID = 55
--     self.x = 67
--     self.y = 96
--     self.xx = 0
--     self.yy = 0
--     self.注释 = "领取奖励"
--     self.可视 = false
--     self.鼠标 = false
--     self.焦点 = false
--     self.可移动 = true
--     self.窗口 = "全服奖励"
--     --self.小窗口 = "20级奖励"
--     local 按钮 = 根._按钮
--     local 资源 = 根.资源
--     local 自适应 = 根._自适应
--     local 格子 = 根._物品格子
--    self.资源组 = {
--         [1] = 自适应.创建(0,1,542,349,3,9),
--         [2] = 按钮.创建(自适应.创建(18,4,16,16,4,3),0,0,4,true,true),
--         [10] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"全服奖励"),
--         [11] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"活动奖励"),
--         [12] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"等级奖励"),
--         [13] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"测试按钮"),
--         [16] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"20级奖励"),
--         [17] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"30级奖励"),
--         [18] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"50级奖励"),
--         [19] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"60级奖励"),
--         [20] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"80级奖励"),
--         [21] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"90级奖励"),
--         [22] = 按钮(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"100级奖励"),
--         [23] = 按钮(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"120级奖励"),
--         [24] = 按钮(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"140级奖励"),
--         [25] = 按钮(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"160级奖励"),
--         [26] = 按钮(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"170级奖励"),
--         [27] = 按钮(自适应.创建(12,4,78,22,1,3),0,0,4,true,true,"180级奖励"),
--         [28] = 按钮(自适应.创建(12,4,74,22,1,3),0,0,4,true,true,"领取奖励"),
--         [41] =  资源:载入('common/wzife.wdf',"网易WDF动画",0x3906F9F1),
--         [42] =  资源:载入('common/wzife.wdf',"网易WDF动画",0x3906F9F1),
--         [43] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [44] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [45] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [46] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [47] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [48] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [49] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [50] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [51] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [52] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [53] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [54] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),

--         [57] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [58] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [99] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xA3115320),0,0,4,true,true),
--         [110] = 自适应.创建(6,1,255,173,3,9),
--               }

--     self.在线 =0
--     self.杀怪 =0
--     self.元宵积分 =0
--     self.世界积分 =0
--     self.领取列表={领取1=0,领取2=0,领取3=0,领取4=0,领取5=0,领取6=0,领取7=0,领取8=0,领取9=0,领取10=0,领取11=0,领取12=0,领取13=0}
--     tp = 根
--     ztb = tp.字体表.描边字体
-- end

-- function 场景类_领取奖励:打开(sj)
--     if self.可视 then
--     -- self.窗口 = ""
--     else
--         insert(tp.窗口_,self)
--         tp.运行时间 = tp.运行时间 + 1
--         self.窗口时间 = tp.运行时间
--         self.可视 = true
--         self.在线 =sj.奖励.在线
--     	self.杀怪 =sj.奖励.杀怪
--     	self.元宵积分 =sj.元宵积分
--     	self.世界积分 =sj.世界积分
--         self.领取列表=sj.奖励.领取列表
--     self.窗口 = "全服奖励"
--     self.小窗口 = "20级奖励"
--     end
-- end

-- function 场景类_领取奖励:显示(dt,x,y)
--     self.焦点 = false
--     self.资源组[2]:更新(x,y)
--     self.资源组[99]:更新(x,y,false)
--     self.资源组[10]:更新(x,y,self.窗口 ~= "全服奖励")
--     self.资源组[11]:更新(x,y,self.窗口 ~= "活动奖励")
--     self.资源组[12]:更新(x,y,self.窗口 ~= "等级奖励")
--     self.资源组[16]:更新(x,y,self.小窗口 ~= "20级奖励")
--     self.资源组[17]:更新(x,y,self.小窗口 ~= "30级奖励")
--     self.资源组[18]:更新(x,y,self.小窗口 ~= "50级奖励")
--     self.资源组[19]:更新(x,y,self.小窗口 ~= "60级奖励")
--     self.资源组[20]:更新(x,y,self.小窗口 ~= "80级奖励")
--     self.资源组[21]:更新(x,y,self.小窗口 ~= "90级奖励")
--     self.资源组[22]:更新(x,y,self.小窗口 ~= "100级奖励")
--     self.资源组[23]:更新(x,y,self.小窗口 ~= "120级奖励")
--     self.资源组[24]:更新(x,y,self.小窗口 ~= "140级奖励")
--     self.资源组[25]:更新(x,y,self.小窗口 ~= "160级奖励")
--     self.资源组[26]:更新(x,y,self.小窗口 ~= "170级奖励")
--     self.资源组[27]:更新(x,y,self.小窗口 ~= "180级奖励")




--     --self.资源组[13]:更新(x,y)
--     self.资源组[1]:显示(self.x,self.y)
--    tp.窗口标题背景_:显示(self.x-76+self.资源组[1].宽度/2,self.y)
--     引擎.场景.字体表.标题字体:显示(self.x+self.资源组[1].宽度/2,self.y+3,"领取奖励")
--     self.资源组[2]:显示(self.x-18+self.资源组[1].宽度,self.y+2)
--     if self.资源组[2]:事件判断() then
--         self.可视 = false
--     end
--     if self.鼠标 then
--         if self.资源组[10]:事件判断() then
--             self.窗口 = "全服奖励"
--             elseif self.资源组[11]:事件判断() then
--             self.窗口 = "活动奖励"
--             elseif self.资源组[12]:事件判断() then
--             self.窗口 = "等级奖励"
--             self.小窗口 = "20级奖励"
--             elseif self.资源组[16]:事件判断() then
--             self.小窗口 = "20级奖励"
--             elseif self.资源组[17]:事件判断() then
--             self.小窗口 = "30级奖励"
--             elseif self.资源组[18]:事件判断() then
--              self.小窗口 = "50级奖励"
--             elseif self.资源组[19]:事件判断() then
--              self.小窗口 = "60级奖励"
--             elseif self.资源组[20]:事件判断() then
--              self.小窗口 = "80级奖励"
--             elseif self.资源组[21]:事件判断() then
--              self.小窗口 = "90级奖励"
--             elseif self.资源组[22]:事件判断() then
--              self.小窗口 = "100级奖励"
--             elseif self.资源组[23]:事件判断() then
--              self.小窗口 = "120级奖励"
--             elseif self.资源组[24]:事件判断() then
--              self.小窗口 = "140级奖励"
--             elseif self.资源组[25]:事件判断() then
--              self.小窗口 = "160级奖励"
--             elseif self.资源组[26]:事件判断() then
--              self.小窗口 = "170级奖励"
--             elseif self.资源组[27]:事件判断() then
--              self.小窗口 = "180级奖励"
--         end
--     end
--     if self.窗口 == "全服奖励" then
--         --self.资源组[13]:显示(self.x+10,self.y +70)
--         self.资源组[99]:显示(self.x+15,self.y+165)
--         self.资源组[99]:显示(self.x+67.5,self.y+165)
--         self.资源组[99]:显示(self.x+130.5,self.y+165)
--         self.资源组[99]:显示(self.x+255.5,self.y+165)
--         self.资源组[99]:显示(self.x+380.5,self.y+165)
--         self.资源组[99]:显示(self.x+495.5,self.y+165)


--         self.资源组[99]:显示(self.x+17.5,self.y+285)
--         self.资源组[99]:显示(self.x+87.5,self.y+285)
--         self.资源组[99]:显示(self.x+171.5,self.y+285)
--         self.资源组[99]:显示(self.x+255.5,self.y+285)
--         self.资源组[99]:显示(self.x+339.5,self.y+285)
--         self.资源组[99]:显示(self.x+423.5,self.y+285)
--         self.资源组[99]:显示(self.x+495.5,self.y+285)

--         -- if self.资源组[13]:事件判断() then
--         --     self.在线 =  self.在线 +10
--         --     self.杀怪 =  self.杀怪 +10
--         -- end
--         if self.在线>=240 then
--             self.在线 = 240
--         end
--         if self.杀怪>=210 then
--             self.杀怪 = 210
--         end
--         if self.在线 >= 40 then
--             if self.领取列表.领取1== 0 then
--                 if self.资源组[43]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取1= 1
--                     self:窗口事件(self.窗口,"在线",self.领取列表.领取1,"累计在线奖励领取第一次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[43]:更新(x,y)
--                 ztb:显示(self.x+13,self.y+195,"可领取")
--                else
--                 self.资源组[43]:更新(x,y,false)
--                 ztb:显示(self.x+13,self.y+195,"已领取")
--             end
--             self.资源组[43]:显示(self.x+15,self.y+165)
--         end
--         if self.在线 >= 80 then
--             if self.领取列表.领取2== 0 then
--                 if self.资源组[44]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取2= 2
--                     self:窗口事件(self.窗口,"在线",self.领取列表.领取2,"累计在线奖励领取第二次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[44]:更新(x,y)
--                 ztb:显示(self.x+66.5,self.y+195,"可领取")
--             else
--                 self.资源组[44]:更新(x,y,false)
--                 ztb:显示(self.x+66.5,self.y+195,"已领取")
--             end
--             self.资源组[44]:显示(self.x+67.5,self.y+165)
--         end
--         if self.在线 >= 120 then
--             if self.领取列表.领取3== 0 then
--                 if self.资源组[45]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                    self.领取列表.领取3= 3
--                     --领取次数 = self.第三次领取
--                     self:窗口事件(self.窗口,"在线",self.领取列表.领取3,"累计在线奖励领取第三次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[45]:更新(x,y)
--                 ztb:显示(self.x+128.5,self.y+195,"可领取")
--             else
--                 self.资源组[45]:更新(x,y,false)
--                 ztb:显示(self.x+128.5,self.y+195,"已领取")
--             end
--             self.资源组[45]:显示(self.x+130.5,self.y+165)
--         end
--         if self.在线 >= 160 then
--             if self.领取列表.领取4== 0 then
--                 if self.资源组[46]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取4= 4
--                     self:窗口事件(self.窗口,"在线",self.领取列表.领取4,"累计在线奖励领取第四次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[46]:更新(x,y)
--                 ztb:显示(self.x+253.5,self.y+195,"可领取")
--             else
--                 self.资源组[46]:更新(x,y,false)
--                 ztb:显示(self.x+253.5,self.y+195,"已领取")
--             end
--             self.资源组[46]:显示(self.x+255.5,self.y+165)
--         end
--         if self.在线 >= 200 then
--             if self.领取列表.领取5== 0 then
--                 if self.资源组[57]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                    	self.领取列表.领取5= 5
--                     self:窗口事件(self.窗口,"在线",self.领取列表.领取5,"累计在线奖励领取第五次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[57]:更新(x,y)
--                 ztb:显示(self.x+378.5,self.y+195,"可领取")
--             else
--                 self.资源组[57]:更新(x,y,false)
--                 ztb:显示(self.x+378.5,self.y+195,"已领取")
--             end
--             self.资源组[57]:显示(self.x+380.5,self.y+165)
--         end
--         if self.在线 >= 240 then
--             if self.领取列表.领取6== 0 then
--                 if self.资源组[58]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取6= 6
--                     self:窗口事件(self.窗口,"在线",self.领取列表.领取6,"累计在线奖励领取第六次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[58]:更新(x,y)
--                 ztb:显示(self.x+493.5,self.y+195,"可领取")
--             else
--                 self.资源组[58]:更新(x,y,false)
--                 ztb:显示(self.x+493.5,self.y+195,"已领取")
--             end
--             self.资源组[58]:显示(self.x+495.5,self.y+165)
--         end

--         if self.杀怪>= 30 then
--             if self.领取列表.领取7 == 0 then
--                 if self.资源组[47]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取7 = 7
--                    self:窗口事件(self.窗口,"杀怪",self.领取列表.领取7,"新春杀怪领取一次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[47]:更新(x,y)
--                 ztb:显示(self.x+16.5,self.y+315,"可领取")
--             else
--                 self.资源组[47]:更新(x,y,false)
--                 ztb:显示(self.x+16.5,self.y+315,"已领取")
--             end
--             self.资源组[47]:显示(self.x+17.5,self.y+285)
--         end
--         if self.杀怪 >= 60 then
--             if self.领取列表.领取8 == 0 then
--                 if self.资源组[48]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                    self.领取列表.领取8 = 8
--                     self:窗口事件(self.窗口,"杀怪",self.领取列表.领取8,"新春杀怪领取二次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[48]:更新(x,y)
--                 ztb:显示(self.x+85.5,self.y+315,"可领取")
--             else
--                 self.资源组[48]:更新(x,y,false)
--                 ztb:显示(self.x+85.5,self.y+315,"已领取")
--             end
--             self.资源组[48]:显示(self.x+87.5,self.y+285)
--         end
--         if self.杀怪 >= 90 then
--             if self.领取列表.领取9 == 0 then
--                 if self.资源组[49]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取9 = 9
--                     self:窗口事件(self.窗口,"杀怪",self.领取列表.领取9,"新春杀怪领取三次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[49]:更新(x,y)
--                 ztb:显示(self.x+169.5,self.y+315,"可领取")
--             else
--                 self.资源组[49]:更新(x,y,false)
--                 ztb:显示(self.x+169.5,self.y+315,"已领取")
--             end
--             self.资源组[49]:显示(self.x+171.5,self.y+285)
--         end
--         if self.杀怪 >= 120 then
--             if self.领取列表.领取10 == 0 then
--                 if self.资源组[50]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取10 = 10
--                     self:窗口事件(self.窗口,"杀怪",self.领取列表.领取10,"新春杀怪领取四次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[50]:更新(x,y)
--                 ztb:显示(self.x+253.5,self.y+315,"可领取")
--             else
--                 self.资源组[50]:更新(x,y,false)
--                 ztb:显示(self.x+253.5,self.y+315,"已领取")
--             end
--             self.资源组[50]:显示(self.x+255.5,self.y+285)
--         end
--         if self.杀怪 >= 150 then
--             if self.领取列表.领取11 == 0 then
--                 if self.资源组[51]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取11 = 11
--                     self:窗口事件(self.窗口,"杀怪",self.领取列表.领取11,"新春杀怪领取五次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[51]:更新(x,y)
--                 ztb:显示(self.x+337.5,self.y+315,"可领取")
--             else
--                 self.资源组[51]:更新(x,y,false)
--                 ztb:显示(self.x+337.5,self.y+315,"已领取")
--             end
--             self.资源组[51]:显示(self.x+339.5,self.y+285)
--         end
--         if self.杀怪 >= 180 then
--             if self.领取列表.领取12 == 0 then
--                 if self.资源组[52]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取12 = 12
--                     self:窗口事件(self.窗口,"杀怪",self.领取列表.领取12,"新春杀怪领取六次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[52]:更新(x,y)
--                 ztb:显示(self.x+421.5,self.y+315,"可领取")
--             else
--                 self.资源组[52]:更新(x,y,false)
--                 ztb:显示(self.x+421.5,self.y+315,"已领取")
--             end
--             self.资源组[52]:显示(self.x+423.5,self.y+285)
--         end
--         if self.杀怪 >= 210 then
--             if self.领取列表.领取13 == 0 then
--                 if self.资源组[53]:事件判断() then
--                     if tp.队伍[1].等级 >=60 then
--                     self.领取列表.领取13 = 13
--                     self:窗口事件(self.窗口,"杀怪",self.领取列表.领取13,"新春杀怪领取七次")
--                     else
--                     tp.常规提示:打开("等级不足60级，无法领取奖励")
--                     end
--                 end
--                 self.资源组[53]:更新(x,y)
--                 ztb:显示(self.x+493.5,self.y+315,"可领取")
--             else
--                 self.资源组[53]:更新(x,y,false)
--                 ztb:显示(self.x+493.5,self.y+315,"已领取")
--             end
--             self.资源组[53]:显示(self.x+495.5,self.y+285)
--         end
--         ztb:显示(self.x+10,self.y+90,"元宵积分："..self.元宵积分)
--         ztb:显示(self.x+200,self.y+90,"世界积分："..self.世界积分)
--         ztb:显示(self.x+10,self.y+120,"累计在线奖励："..self.在线.."/".."240")
--         ztb:显示(self.x+10,self.y+240,"新春杀怪奖励："..self.杀怪.."/".."210")
--         tp.读条背景_:置区域(0,0,500,16)
--         tp.读条背景_:显示(self.x+21,self.y+146)
--         tp.读条背景_:显示(self.x+21,self.y+263)
--         self.资源组[41]:置区域(0,0,min(floor(self.在线*2.083),500),self.资源组[41].高度)
--         self.资源组[41]:显示(self.x+21,self.y+146)
--         self.资源组[42]:置区域(0,0,min(floor(self.杀怪*2.38),500),self.资源组[42].高度)
--         self.资源组[42]:显示(self.x+21,self.y+263)
--         elseif self.窗口 =="活动奖励" then


--         elseif self.窗口 =="等级奖励" then
--         self.资源组[110]:显示(self.x+130,self.y+90)
--         self.资源组[16]:显示(self.x+50,self.y +90,true,nil,nil,self.小窗口 == "20级奖励",2)
--         self.资源组[17]:显示(self.x+50,self.y +120,true,nil,nil,self.小窗口 == "30级奖励",2)
--         self.资源组[18]:显示(self.x+50,self.y +150,true,nil,nil,self.小窗口 == "50级奖励",2)
--         self.资源组[19]:显示(self.x+50,self.y +180,true,nil,nil,self.小窗口 == "60级奖励",2)
--         self.资源组[20]:显示(self.x+50,self.y +210,true,nil,nil,self.小窗口 == "80级奖励",2)
--         self.资源组[21]:显示(self.x+50,self.y +240,true,nil,nil,self.小窗口 == "90级奖励",2)
--         self.资源组[22]:显示(self.x+390,self.y +90,true,nil,nil,self.小窗口 == "100级奖励",2)
--         self.资源组[23]:显示(self.x+390,self.y +120,true,nil,nil,self.小窗口 == "120级奖励",2)
--         self.资源组[24]:显示(self.x+390,self.y +150,true,nil,nil,self.小窗口 == "140级奖励",2)
--         self.资源组[25]:显示(self.x+390,self.y +180,true,nil,nil,self.小窗口 == "160级奖励",2)
--         self.资源组[26]:显示(self.x+390,self.y +210,true,nil,nil,self.小窗口 == "170级奖励",2)
--         self.资源组[27]:显示(self.x+390,self.y +240,true,nil,nil,self.小窗口 == "180级奖励",2)
--     --     if self.小窗口 == "20级奖励" then
--     --         ztb:显示(self.x+150,self.y+100,"20级等级奖励20级等级奖励20级\n20级等级奖励20级等级奖励20级\n20级等级奖励20级等级奖励20级\n20级等级奖励20级等级奖励20级\n")
--     --         if tp.队伍[1].等级>=20 then
--     --             if tp.队伍[1].领取列表.领取14 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取20级奖励")
--     --                  tp.队伍[1].领取列表.领取14 = tp.队伍[1].领取列表.领取14 +1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "30级奖励" then
--     --         if tp.队伍[1].等级>=30 then
--     --             if tp.队伍[1].领取列表.领取15 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取30级奖励")
--     --                  tp.队伍[1].领取列表.领取15  = tp.队伍[1].领取列表.领取15 +1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "50级奖励" then
--     --         if tp.队伍[1].等级>=50 then
--     --             if tp.队伍[1].领取列表.领取16 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取50级奖励")
--     --                  tp.队伍[1].领取列表.领取16 = tp.队伍[1].领取列表.领取16+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --             self.资源组[28]:显示(self.x+223,self.y+271)
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "60级奖励" then
--     --         if tp.队伍[1].等级>=60 then
--     --             if tp.队伍[1].领取列表.领取17 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取60级奖励")
--     --                  tp.队伍[1].领取列表.领取17 = tp.队伍[1].领取列表.领取17+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "80级奖励" then
--     --         if tp.队伍[1].等级>=80 then
--     --             if tp.队伍[1].领取列表.领取18 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取80级奖励")
--     --                  tp.队伍[1].领取列表.领取18 = tp.队伍[1].领取列表.领取18+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "90级奖励" then
--     --         if tp.队伍[1].等级>=90 then
--     --             if tp.队伍[1].领取列表.领取19 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取90级奖励")
--     --                  tp.队伍[1].领取列表.领取19 = tp.队伍[1].领取列表.领取19+1
--     --                 end

--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "100级奖励" then
--     --         if tp.队伍[1].等级>=100 then
--     --             if tp.队伍[1].领取列表.领取20 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取100级奖励")
--     --                  tp.队伍[1].领取列表.领取20 = tp.队伍[1].领取列表.领取20+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "120级奖励" then
--     --         if tp.队伍[1].等级>=120 then
--     --             if tp.队伍[1].领取列表.领取21 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取120级奖励")
--     --                  tp.队伍[1].领取列表.领取21 = tp.队伍[1].领取列表.领取21+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "140级奖励" then
--     --         if tp.队伍[1].等级>=140 then
--     --             if tp.队伍[1].领取列表.领取22 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取140级奖励")
--     --                  tp.队伍[1].领取列表.领取22 = tp.队伍[1].领取列表.领取22+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "160级奖励" then
--     --         if tp.队伍[1].等级>=160 then
--     --             if tp.队伍[1].领取列表.领取23 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取160级奖励")
--     --                  tp.队伍[1].领取列表.领取23 = tp.队伍[1].领取列表.领取23+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "170级奖励" then
--     --         if tp.队伍[1].等级>=170 then
--     --             if tp.队伍[1].领取列表.领取24 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取170级奖励")
--     --                  tp.队伍[1].领取列表.领取24 = tp.队伍[1].领取列表.领取24+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     elseif self.小窗口 == "180级奖励" then
--     --         if tp.队伍[1].等级>=180 then
--     --             if tp.队伍[1].领取列表.领取25 == 0 then
--     --                 if self.资源组[28]:事件判断()then
--     --                  tp.常规提示:打开("领取180级奖励")
--     --                  tp.队伍[1].领取列表.领取25 = tp.队伍[1].领取列表.领取25+1
--     --                 end
--     --                 self.资源组[28]:更新(x,y)
--     --                 ztb:显示(self.x+235,self.y+ 301,"可领取")
--     --             else
--     --             self.资源组[28]:更新(x,y,false)
--     --             ztb:显示(self.x+235,self.y+ 301,"已领取")
--     --             end
--     --         end
--     --         self.资源组[28]:显示(self.x+223,self.y+271)
--     --     end--小窗口结束
--     end--窗口结束
--     self.资源组[10]:显示(self.x+10,self.y +30,true,nil,nil,self.窗口 == "全服奖励",2)
--     self.资源组[11]:显示(self.x+100,self.y +30,true,nil,nil,self.窗口 == "活动奖励",2)
--     self.资源组[12]:显示(self.x+190,self.y +30,true,nil,nil,self.窗口 == "等级奖励",2)
-- end
-- function 场景类_领取奖励:窗口事件(窗口,统计,领取次数,注释)
--     --client:发送(1420,1,窗口,统计,领取次数,注释)
--     发送数据(52,{分类=窗口,类别=统计,奖励=领取次数})
-- end


-- function 场景类_领取奖励:检查点(x,y)
--     if self.资源组[1]:是否选中(x,y) then
--         return true
--     end
-- end

-- function 场景类_领取奖励:初始移动(x,y)
--     tp.运行时间 = tp.运行时间 + 1
--     if not tp.消息栏焦点 then
--         self.窗口时间 = tp.运行时间
--     end
--     if not self.焦点 then
--         tp.移动窗口 = false
--     end
--     if self.鼠标 and not self.焦点 then
--         self.xx = x - self.x
--         self.yy = y - self.y
--     end
-- end

-- function 场景类_领取奖励:开始移动(x,y)
--     if self.鼠标 then
--         self.x = x - self.xx
--         self.y = y - self.yy
--     end
-- end


-- return 场景类_领取奖励