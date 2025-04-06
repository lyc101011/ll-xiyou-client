-- @Author: 作者QQ381990860
-- @Date:   2022-06-30 23:37:08
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-12 13:11:14

local 神兵异兽榜 = class(窗口逻辑)
local 状态总汇={"装备榜单","灵饰榜单","异兽榜单"}
local 额外新加={"装备比试","灵饰比试","炼妖比试"}
local 选类总汇={
               装备榜单={"武器排行","项链排行","衣服排行","头盔排行","腰带排行","鞋子排行"},
               灵饰榜单={"手镯排行","佩饰排行","戒指排行","耳饰排行"},
               异兽榜单={"宝宝排行"},
               }

function 神兵异兽榜:初始化(根)
    self.ID = "神兵异兽榜"
    self.x = 82+(全局游戏宽度-800)/2
    self.y = 20
    self.xx = 0
    self.yy = 0
    self.注释 = "神兵异兽榜"
    tp = 根
    self.可视 = false
    self.鼠标 = false
    self.焦点 = false
    self.可移动 = true
end

function 神兵异兽榜:打开(数据)
    if self.可视 then
       self.可视 = false
       self.资源组=nil
       self.数据=nil
       self.物品=nil
       self.宝宝=nil
    else
       self:数据重载()
       self:刷新(数据)
       table.insert(tp.窗口_,self)
       tp.运行时间 = tp.运行时间 + 1
       self.窗口时间 = tp.运行时间
       self.可视 = true
    end
end

function 神兵异兽榜:刷新(数据)
   self.数据=数据
   self.选类=数据.类型
   for k,v in pairs(选类总汇) do
       for n,i in pairs(v) do
           if i==self.选类 then
              self.状态=k
              break
           end
       end
   end
   self:更新按钮()
   self.加入=0
   self.物品={}
   self.宝宝={}
   for n=1,table.maxn(self.数据) do
       if self.选类=="宝宝排行" then
          self.宝宝[n]={}
          local 临时资源= 引擎.取头像(self.数据[n].宝宝.模型)
          self.宝宝[n].头像=tp.资源:载入(临时资源[7],"网易WDF动画",临时资源[1])
       else
          self.物品[n]=tp._物品格子(0,0,n)
          self.物品[n]:置物品(self.数据[n].物品)
       end
   end
end

function 神兵异兽榜:数据重载()
    local 按钮 = tp._按钮
    local 自适应 = tp._自适应
    local 资源= tp.资源
    self.资源组 = {
                  [1] = tp.资源:载入('wzife.wdf',"网易WDF动画",0xFBF970A7),
                  -- [2] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x75B260A7),---梦幻风云榜
                  [2] = tp.资源:载入('common/wzife.wdf',"网易WDF动画",0x7D3828A2),---异兽奇兵榜
                  [3] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x972CA1E4),
                  [4] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0x20F3E242),0,0,4),--问号按钮
                  [5] = 按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",0xCAABDBB8),0,0,4),
                  [6] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x8269DBB8),--玩家
                  [7] = tp.资源:载入('wzife.wdf',"网易WDF动画",0x107F0617),--分数
                  -- [91] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"装备榜单"),
                  -- [92] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"灵饰榜单"),
                  -- [93] = 按钮.创建(自适应.创建(12,4,72,22,1,3),0,0,4,true,true,"异兽榜单"),
                  [91] =资源:载入('pic/小标题.png',"图片"),
                  [92] =资源:载入('pic/小标题.png',"图片"),
                  [93] =资源:载入('pic/小标题.png',"图片"),

                  -- [1001]=tp.资源:载入('wzife.wdf',"网易WDF动画",0x7C8FFFDF),----银皇冠
                  [94] = 资源:载入('wzife.wdf',"网易WDF动画",0x363AAF1B),
                  [101] = require("gge文字类")(程序目录.."wdf/font/hkyt.ttf",15,false,false,true),
                  [102] = tp.资源:载入('common/wzife.wdf',"网易WDF动画",0x7D4260AE),---异兽奇兵动态图标
                  [103] = tp.资源:载入('common/wzife.wdf',"网易WDF动画",0xBD8C9CCB),---异兽奇兵静态图标
                  -- [104] = tp.资源:载入('common/wzife.wdf',"网易WDF动画",0xDCBCEA4C),---城楼图标
                  [104] = tp.资源:载入('common/wzife.wdf',"网易WDF动画",0x2F7B50D9),---霸气榜
                  [105] = tp.资源:载入('common/wzife.wdf',"网易WDF动画",0x98EA209E),---第1
                  [106] = tp.资源:载入('common/wzife.wdf',"网易WDF动画",0xAD1D064F),---第2
                  [107] = tp.资源:载入('common/wzife.wdf',"网易WDF动画",0xF31B90F1),---第3
                  }
    for n=1,8 do
        self.资源组[20+n]=按钮.创建(自适应.创建(17,4,125,22,1,3),0,0,4,true,true,"华山论剑")
        self.资源组[20+n]:绑定窗口_("神兵异兽榜")
        self.资源组[20+n]:置偏移(25,2)
    end

end

function 神兵异兽榜:更新按钮()
    self.总汇=table.maxn(选类总汇[self.状态])
    for n=1,self.总汇 do
        self.资源组[20+n]:置文字(选类总汇[self.状态][n])
    end
end



function 神兵异兽榜:显示(dt,x,y)
    self.焦点 = false
    self.焦点1 = false
    self.资源组[1]:显示(self.x,self.y)
    self.资源组[2]:显示(self.x + 231,self.y + 23)
    self.资源组[3]:显示(self.x + 232,self.y + 120)
    self.资源组[4]:显示(self.x + 200,self.y + 420)---问号
    -- self.资源组[5]:显示(self.x + 550,self.y + 157)
    -- self.资源组[102]:显示(self.x + 200,self.y + 400)
    -- self.资源组[103]:显示(self.x + 160,self.y + 385)
    self.资源组[104]:显示(self.x + 113,self.y + 370)
    self.资源组[105]:显示(self.x + 530,self.y + 150)
    self.资源组[106]:显示(self.x + 530+5,self.y + 152+60)
    self.资源组[107]:显示(self.x + 530+13,self.y + 152+120)
    for n=1,3 do
        -- self.资源组[90+n]:更新(x,y,self.状态~=self.资源组[90+n]:取文字())
        self.资源组[90+n]:显示(self.x+48+n*165-100,self.y +81)
        self.资源组[101]:置颜色(0xFF222222):显示(self.x+48+40+n*165-100,self.y +90,状态总汇[n])
        if self.资源组[90+n]:是否选中(x,y) and 引擎.鼠标弹起(左键) then
           发送数据(673,{序号1=1002,类型=选类总汇[状态总汇[n]][1]})
        end
    end

    for n=1,self.总汇 do
        self.资源组[20+n]:更新(x,y,self.选类~=self.资源组[20+n]:取文字())
        self.资源组[20+n]:显示(self.x + 103,self.y +125+n*35-35,true,1,nil,self.选类==self.资源组[20+n]:取文字(),2)
        if self.资源组[20+n]:事件判断() then
           发送数据(673,{序号1=1002,类型=self.资源组[20+n]:取文字()})
        end
    end

    if self.资源组[104]:是否选中(x,y) and not tp.战斗中 and 引擎.鼠标弹起(左键) then
        if tp.窗口.排行榜.可视==false then
            发送数据(39)
        else
            tp.窗口.排行榜:打开()
        end
    end
    if self.资源组[104]:是否选中(x,y) then
        tp.提示:自定义(x-90,y-35,"属性榜单")
    end
    if self.资源组[4]:是否选中(x,y) then----问号
        tp.提示:自定义(x+10,y+10,"榜单每小时更新；\n装备需穿戴；\n宝宝需参战；\n否则视为放弃参与榜单。")
    end



    self.资源组[6]:显示(self.x+355,self.y+125)
    self.资源组[7]:显示(self.x +470,self.y + 125)
    if 引擎.取鼠标滚轮()>0 then
       self.加入=self.加入-1
       if self.加入<=0 then
          self.加入=0
       end
    elseif 引擎.取鼠标滚轮()<0 then
       self.加入=self.加入+1
       if self.加入>=table.maxn(self.数据)-5 then
          self.加入=table.maxn(self.数据)-5
          if self.加入<0 then
             self.加入=0
          end
       end
    end
    for n=1,5 do
        if n<5 then
           引擎.画线(self.x+237,self.y+142+n*58,self.x+583,self.y+142+n*58,0xFFC19B84)
        else
           引擎.画线(self.x+262,self.y+142+n*58,self.x+583,self.y+142+n*58,0xFFC19B84)
        end
        if self.选类=="宝宝排行" then
           if self.宝宝[n+self.加入] then
              self.资源组[94]:显示(self.x+266,self.y+150+n*58-58)

              self.宝宝[n+self.加入].头像:显示(self.x+269,self.y+154+n*58-58)
              if self.宝宝[n+self.加入].头像:是否选中(x,y) then
                 self.焦点1=true
                 tp.提示:自定义(x+10,y+10,"右键查看")
                 if 引擎.鼠标弹起(1) then
                    tp.窗口.召唤兽查看栏:打开(self.数据[n+self.加入].宝宝)
                 end
              end
              self.资源组[101]:置颜色(0xFF000000):显示(self.x+355,self.y+160+n*58-58,self.数据[n+self.加入].名称)
              self.资源组[101]:置颜色(0xFF000000):显示(self.x+355-2,self.y+160+n*58-58+15,"("..self.数据[n+self.加入].id..")")
              self.资源组[101]:置颜色(0xFF000000):显示(self.x+475,self.y+160+n*58-58,self.数据[n+self.加入].分数)
           end
        elseif self.物品[n+self.加入] then
           tp.物品格子背景_:显示(self.x+265,self.y+145+n*58-58)
           self.物品[n+self.加入]:置坐标(self.x+267,self.y+145+n*58-58)
           self.物品[n+self.加入]:显示(dt,x,y,self.鼠标)
           self.资源组[101]:置颜色(0xFF000000):显示(self.x+355,self.y+160+n*58-58,self.数据[n+self.加入].名称)
           self.资源组[101]:置颜色(0xFF000000):显示(self.x+355-2,self.y+160+n*58-58+15,"("..self.数据[n+self.加入].id..")")
           self.资源组[101]:置颜色(0xFF000000):显示(self.x+475,self.y+160+n*58-58,self.数据[n+self.加入].分数)
           if self.物品[n+self.加入].焦点 and self.物品[n+self.加入].物品 then
              tp.提示:道具行囊(x,y,self.物品[n+self.加入].物品)
           end
        end
    end
end


function 神兵异兽榜:检查点(x,y)
    if self.可视 and self.资源组[1]:是否选中(x,y)  then
        return true
    else
        return false
    end
end

function 神兵异兽榜:初始移动(x,y)
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

function 神兵异兽榜:开始移动(x,y)
    if self.鼠标 then
        self.x = x - self.xx
        self.y = y - self.yy
    end
end

function 神兵异兽榜:更新(dt)end

return 神兵异兽榜