-- @Author: baidwwy
-- @Date:   2024-02-21 16:09:59
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-04-08 00:51:47
-----------
-- @脚本作者: 熙熙哥
-- @邮箱:  2481510317@qq.com
-- @创建时间:   2020-12-24 02:11:25
-- @最后修改来自: 熙熙哥
-- @Last Modified time: 2023-10-26 22:08:24
local 商城类 = class()
local 鼠标弹起 = 引擎.鼠标弹起
local 鼠标按住 = 引擎.鼠标按住
local 取金钱颜色 = 引擎.取金钱颜色
local insert = table.insert
local remove = table.remove
local 向下取整 = math.floor
local 向上取整 = math.ceil
local 返回最小数 = math.min
local 返回最大数 = math.max
local ani = 引擎.取战斗模型--取战斗模型
local tp
local 临时资源包
-- local qzdjy = 引擎.取锦衣模型--取锦衣模型
-- local tx = 引擎.取头像--取头像
-- local qmxs = 引擎.取模型--取模型
-- local zqj = 引擎.坐骑库--取坐骑库

local x类 = {"银子商城","宝宝","特殊商城","锦衣","祥瑞","足迹","光环","特效","祥瑞套装","法宝","灵宝","仙玉商城","人物类","宠物类","孩子类","宝石类","符石类","杂物类","会员"}
function 商城类:初始化(根)
	tp=根
	self.ID = 74
	self.x = 50
	self.y = 50
	self.xx = 0
	self.yy = 0
	self.注释 = "商城类"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	-- self.右键关闭=1
	self.可移动 = true
	self.本类开关 = false
	self.加入 = 0
	self.选中编号4=0
	self.选中编号3 = 0
	self.选中编号2 = 0
	self.选中编号 = 0
	self.银两数额 = 0
	self.分类="银子商城"
	self.子类="锦衣"
	self.控件类 = require("ggeui/加载类")()
	local 总控件 = self.控件类:创建控件('给予总控件')
	总控件:置可视(true,true)
	self.输入框 = 总控件:创建输入("数量输入",0,0,110,14)
	self.输入框:置可视(false,false)
	self.输入框:置限制字数(8)
	self.输入框:置数字模式()
	self.输入框:屏蔽快捷键(true)
	self.输入框:置光标颜色(0xFFffffff)
	self.输入框:置文字颜色(0xFFffffff)
	self.文字=require("gge文字类").创建(nil,14,false,false,true)
	self.查看状态=0
	local 资源 = 根.资源
	local 按钮 = 根._按钮
	local 自适应 = 根._自适应
	self.背景=资源:载入('xixige_newmall.gep',"内置png",0x10001000)
	self.道具背景框=资源:载入('xixige_newmall.gep',"内置png",0x10001001)
	self.宝宝背景框=资源:载入('xixige_newmall.gep',"内置png",0x10001002)

	self.银子商城1=资源:载入('xixige_newmall.gep',"内置png",0x10001003)
	self.银子商城2=资源:载入('xixige_newmall.gep',"内置png",0x10001004)
	self.银子商城3=资源:载入('xixige_newmall.gep',"内置png",0x10001005)

	self.仙玉商城1=资源:载入('xixige_newmall.gep',"内置png",0x10001006)
	self.仙玉商城2=资源:载入('xixige_newmall.gep',"内置png",0x10001007)
	self.仙玉商城3=资源:载入('xixige_newmall.gep',"内置png",0x10001008)

	self.特殊商城1=资源:载入('xixige_newmall.gep',"内置png",0x32112001)
	self.特殊商城2=资源:载入('xixige_newmall.gep',"内置png",0x32112002)
	self.特殊商城3=资源:载入('xixige_newmall.gep',"内置png",0x32112003)

	self.宝宝商城1=资源:载入('xixige_newmall.gep',"内置png",0x10001012)
	self.宝宝商城2=资源:载入('xixige_newmall.gep',"内置png",0x10001013)
	self.宝宝商城3=资源:载入('xixige_newmall.gep',"内置png",0x10001014)

	self.锦衣商城1=资源:载入('xixige_newmall.gep',"内置png",0x10001015)
	self.锦衣商城2=资源:载入('xixige_newmall.gep',"内置png",0x10001016)
	self.锦衣商城3=资源:载入('xixige_newmall.gep',"内置png",0x10001017)

	self.法宝商城1=资源:载入('xixige_newmall.gep',"内置png",0x10001018)
	self.法宝商城2=资源:载入('xixige_newmall.gep',"内置png",0x10001019)
	self.法宝商城3=资源:载入('xixige_newmall.gep',"内置png",0x10001020)

	self.购买按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001021)
	self.购买按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001022)
	self.购买按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001023)
	self.购买按钮4=资源:载入('xixige_newmall.gep',"内置png",0x10001024)

	self.上一页按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001025)
	self.上一页按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001026)
	self.上一页按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001027)
	self.上一页按钮4=资源:载入('xixige_newmall.gep',"内置png",0x10001028)

	self.下一页按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001029)
	self.下一页按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001030)
	self.下一页按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001031)
	self.下一页按钮4=资源:载入('xixige_newmall.gep',"内置png",0x10001032)

	self.其他商城3=资源:载入('xixige_newmall.gep',"内置png",0x32112403)
	--------------------------------------------------------------------------------------------------------
	self.银子商城按钮 = 按钮(自适应.创建(17,4,72,22,1,3),0,0,4,true,true,"银子商城")
	self.人物类按钮 = 按钮(自适应.创建(17,4,72,22,1,3),0,0,4,true,true," 人物类")
	self.宠物类按钮 = 按钮(自适应.创建(17,4,72,22,1,3),0,0,4,true,true," 宠物类")
	self.孩子类按钮 = 按钮(自适应.创建(17,4,72,22,1,3),0,0,4,true,true," 孩子类")
	self.宝石类按钮 = 按钮(自适应.创建(17,4,72,22,1,3),0,0,4,true,true," 宝石类")
	self.符石类按钮 = 按钮(自适应.创建(17,4,72,22,1,3),0,0,4,true,true," 符石类")
	self.杂物类按钮 = 按钮(自适应.创建(17,4,72,22,1,3),0,0,4,true,true," 杂物类")

	self.祥瑞套装按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001050)
	self.祥瑞套装按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001051)
	self.祥瑞套装按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001052)

	self.特效按钮 = 按钮(自适应.创建(17,4,43,22,1,3),0,0,4,true,true,"特效")
	self.灵宝按钮 = 按钮(自适应.创建(17,4,43,22,1,3),0,0,4,true,true,"灵宝")
	self.法宝按钮 = 按钮(自适应.创建(17,4,43,22,1,3),0,0,4,true,true,"法宝")

	self.会员按钮 = 按钮(自适应.创建(17,4,43,22,1,3),0,0,4,true,true,"会员")

	self.坐骑按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001053)
	self.坐骑按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001054)
	self.坐骑按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001055)

	-- self.祥瑞套装按钮=按钮.创建(资源:载入('wzife.wdf',"网易WDF动画",1221744906),0,0,4,true,true,"  祥瑞")
	----------------------------------------------------------------------------------------------------------
	self.锦衣按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001047)
	self.锦衣按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001048)
	self.锦衣按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001049)

	self.光环按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001056)
	self.光环按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001057)
	self.光环按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001058)

	self.足迹按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001059)
	self.足迹按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001060)
	self.足迹按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001061)

	self.关闭按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001070)
	self.关闭按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001071)
	self.关闭按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001072)

	self.银两图标=资源:载入('xixige_newmall.gep',"内置png",0x10001069)
	-- self.展示图标=资源:载入('wzife.wdf',"网易WDF动画",0x548156A0)
	self.选中显示 = 资源:载入('xixige_newmall.gep',"内置png",0x10001065)
	self.选中显示2 = 资源:载入('pic/2.png',"图片")--资源:载入('xixige_newmall.gep',"内置png",0x10001034)
	self.宝宝选中显示 = 资源:载入('xixige_newmall.gep',"内置png",0x10001066)

	-- self.比武积分1=资源:载入('xixige_newmall.gep',"内置png",0x32112101)
	-- self.比武积分2=资源:载入('xixige_newmall.gep',"内置png",0x32112102)
	-- self.比武积分3=资源:载入('xixige_newmall.gep',"内置png",0x32112103)

	-- self.妖魔积分1=资源:载入('xixige_newmall.gep',"内置png",0x32112301)
	-- self.妖魔积分2=资源:载入('xixige_newmall.gep',"内置png",0x32112302)
	-- self.妖魔积分3=资源:载入('xixige_newmall.gep',"内置png",0x32112303)

	-- self.副本积分1=资源:载入('xixige_newmall.gep',"内置png",0x32112201)
	-- self.副本积分2=资源:载入('xixige_newmall.gep',"内置png",0x32112202)
	-- self.副本积分3=资源:载入('xixige_newmall.gep',"内置png",0x32112203)

	-- self.其他商城1=资源:载入('xixige_newmall.gep',"内置png",0x32112401)
	-- self.其他商城2=资源:载入('xixige_newmall.gep',"内置png",0x32112402)



            -- self.抽奖按钮=按钮.创建(自适应.创建(12,4,72,21,1,3),0,0,4,true,true,"仙玉抽奖")


	-- self.翅膀按钮1=资源:载入('xixige_newmall.gep',"内置png",0x10001062)
	-- self.翅膀按钮2=资源:载入('xixige_newmall.gep',"内置png",0x10001063)
	-- self.翅膀按钮3=资源:载入('xixige_newmall.gep',"内置png",0x10001064)

	-- self.滑动图标=资源:载入('xixige_newmall.gep',"内置png",0x10001067)
	self.仙玉图标=资源:载入('xixige_newmall.gep',"内置png",0x10001068)
	self.按钮坐标={银子商城=53,仙玉商城=53+35*1,特殊商城=53+35*2,锦衣商城=53+35*3,法宝商城=53+35*4,宝宝商城=53+35*5}
end

function 商城类:加载数据(数据)
	self.数据 = 数据
	self.数据.仙玉 = 数据.仙玉
	-- table.print(self.数据)
	-------------------------------------------
	local 沉默=0
	self.临时祥瑞套装={}
	for i=1,#self.数据["祥瑞套装"] do
		if self.数据["祥瑞套装"][i].角色限制==tp.队伍[1].造型 then
			沉默=沉默+1
		   self.临时祥瑞套装[沉默]=self.数据["祥瑞套装"][i]
		end
	end
	self.数据["祥瑞套装"]=self.临时祥瑞套装
	------------------------------------------------

end

function 商城类:刷新仙玉(数据)
	self.数据.仙玉 = 数据+0
end
function 商城类:打开()
	if self.选中编号 ~=0 then
	   return false
	end
	if self.可视 then
		self.可视 = false
		self.选中ID=0
		self.选中编号2 = 0
		self.选中编号3 = 0
		self.选中编号4 = 0
		self.选中编号 = 0
		-- self.资源组 = nil
		self.物品数据={银子商城={},宝宝={},特殊商城={},锦衣={},祥瑞={},足迹={},光环={},特效={},祥瑞套装={},法宝={},灵宝={},仙玉商城={},会员={},人物类={},宠物类={},孩子类={},宝石类={},符石类={},杂物类={}}
		self.人物数据={祥瑞={},祥瑞套装={},特效={}}
		self.输入框:置可视(false,false)
	else
		if self.数据==nil then
			--这里发送给服务端，获取商品数据
			return
		end
		insert(tp.窗口_,self)
		self.分类="银子商城"
		self.选中编号4=0
		self.选中编号3 = 0
		self.选中编号2 = 0
		self.选中编号 = 0
		self.子类="锦衣"
		self.选中总类="银子商城"

		self.本类开关 = true

		-- self.数据 = 数据
		-- self.银子 = tp.金钱
		-- self.数据.仙玉 = 数据
		self.组号 = 18
		self.物品数据={银子商城={},宝宝={},特殊商城={},锦衣={},祥瑞={},足迹={},光环={},特效={},祥瑞套装={},法宝={},灵宝={},仙玉商城={},会员={},人物类={},宠物类={},孩子类={},宝石类={},符石类={},杂物类={}}
		self.人物数据={祥瑞={},祥瑞套装={},特效={}}
		self.商品编号 = 0

		for n = 1,#x类 do
			if x类[n]=="银子商城" or x类[n]=="特殊商城" or x类[n]=="灵宝"  or x类[n]=="会员"  or x类[n]=="法宝"  or x类[n]=="仙玉商城" or x类[n]=="人物类" or x类[n]=="宠物类" or x类[n]=="孩子类" or x类[n]=="宝石类" or x类[n]=="符石类" or x类[n]=="杂物类" then
				for i=1,#self.数据[x类[n]] do
					self.物品数据[x类[n]][i] = tp._物品格子.创建(0,0,i,"给予_物品")
					self.物品数据[x类[n]][i]:置物品(self.数据[x类[n]][i])
					self.物品数据[x类[n]].数量的=#self.数据[x类[n]]
					self.物品数据[x类[n]][i].编号 = n
					self.物品数据[x类[n]][i].价格=self.数据[x类[n]][i].价格

					if self.数据[x类[n]][i].参数 ~= nil then
						self.物品数据[x类[n]][i].物品.附带技能 = self.数据[x类[n]][i].参数
						self.物品数据[x类[n]][i].物品.特效 = self.数据[x类[n]][i].参数
					end
				end
			elseif x类[n]=="宝宝" then
				for i=1,#self.数据[x类[n]] do
					local xn = ani(self.数据[x类[n]][i].模型)-----名称改为模型了
					self.物品数据[x类[n]][i] = tp.资源:载入(xn[10],"网易WDF动画",xn[6])
					-- xn = ani(self.数据[x类[n]][i].模型.."_身体")
					-- if xn[6] ~= nil  then
					-- 	self.物品数据[x类[n]][i].身体 = tp.资源:载入(xn[10],"网易WDF动画",xn[6])
					-- end
					self.物品数据[x类[n]][i].编号 = n
					self.物品数据[x类[n]].数量的=#self.数据[x类[n]]
					self.物品数据[x类[n]][i].价格=self.数据[x类[n]][i].价格
					self.物品数据[x类[n]][i].名称=self.数据[x类[n]][i].名称

				end
			elseif x类[n]=="锦衣" then
				 for i=1,#self.数据[x类[n]] do
					local xn = 引擎.取普通锦衣模型(self.数据[x类[n]][i].名称,tp.队伍[1].模型)
					self.物品数据[x类[n]][i] = tp.资源:载入(xn[3],"网易WDF动画",xn[1])
					self.物品数据[x类[n]].数量的=#self.数据[x类[n]]
					self.物品数据[x类[n]][i].编号 = n
					self.物品数据[x类[n]][i].价格=self.数据[x类[n]][i].价格
				 end
			elseif x类[n]=="特效" then---------实际是特效
				 for i=1,#self.数据[x类[n]] do
				 	local xn = 引擎.取新特效(self.数据[x类[n]][i].名称)
				 	local wp = 引擎.取物品(self.数据[x类[n]][i].名称)
				 	self.物品数据[x类[n]][i] = tp.资源:载入(xn[2],"网易WDF动画",xn[1])
				 	self.物品数据[x类[n]].数量的=#self.数据[x类[n]]
				 	self.物品数据[x类[n]][i].编号 = n
				 	self.物品数据[x类[n]][i].价格=self.数据[x类[n]][i].价格
				 	self.物品数据[x类[n]][i].名称=self.数据[x类[n]][i].名称
				 	self.物品数据[x类[n]][i].说明=wp[1]
				 	self.物品数据[x类[n]][i].大动画=tp.资源:载入(wp[11],"网易WDF动画",wp[13])
				 end


			elseif x类[n]=="足迹" then
				for i=1,#self.数据[x类[n]] do
					local xn = 引擎.取足迹(self.数据[x类[n]][i].名称)
					self.物品数据[x类[n]][i] = tp.资源:载入(xn[4],"网易WDF动画",xn[1])
					self.物品数据[x类[n]].数量的=#self.数据[x类[n]]
					self.物品数据[x类[n]][i].编号 = n
					self.物品数据[x类[n]][i].价格=self.数据[x类[n]][i].价格
				end
			elseif x类[n]=="光环" then
				for i=1,#self.数据[x类[n]] do
					local xn = 引擎.取光环(self.数据[x类[n]][i].名称)
					self.物品数据[x类[n]][i] = tp.资源:载入(xn[4],"网易WDF动画",xn[1])
					self.物品数据[x类[n]].数量的=#self.数据[x类[n]]
					self.物品数据[x类[n]][i].编号 = n
					self.物品数据[x类[n]][i].价格=self.数据[x类[n]][i].价格
				end

			end
		end

		self.显示足印 = nil
		self.显示足迹 = nil
		self.坐骑显示 = nil
		self.显示锦衣 = nil
		self.数量 = 1
		self.价格 = 0
		self.总额 = 0
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
		self.选中编号2 = 0
		self.选中编号3 = 0
		self.选中编号4 = 0
		self.x=取界面坐标(self.背景.宽度)
		self.输入框:置可视(true,true)
		self.输入框:置文本("")
		if self.分类 == "银子商城" or self.分类 == "特殊商城" or self.分类 == "法宝"  or self.分类=="仙玉商城" or self.分类=="会员" or self.分类=="人物类" or self.分类=="宠物类" or self.分类=="孩子类" or self.分类=="宝石类" or self.分类=="符石类" or self.分类=="杂物类" then
			self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/15)
		elseif self.分类 == "宝宝" then
			self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/8)
		elseif self.分类 == "锦衣" or self.分类 == "光环" or self.分类 == "足迹" or self.分类 == "特效" then
			self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/8)
		end

	end
end
-- self.按钮坐标={银子商城=53,仙玉商城=53+35*1,特殊商城=53+35*2,锦衣商城=53+35*3,法宝商城=53+35*4}
function 商城类:显示(dt,x,y) --294
	self.焦点=false
	self.背景:显示(self.x,self.y)
	self.关闭按钮1:显示(self.x+765,self.y+13)
	self.银子商城1:显示(self.x+1,self.y+self.按钮坐标.银子商城)
	self.特殊商城1:显示(self.x+1,self.y+self.按钮坐标.特殊商城)
	self.宝宝商城1:显示(self.x+1,self.y+self.按钮坐标.宝宝商城)
	self.锦衣商城1:显示(self.x+1,self.y+self.按钮坐标.锦衣商城)--self.y+123)
	self.法宝商城1:显示(self.x+1,self.y+self.按钮坐标.法宝商城)--self.y+158)
	self.仙玉商城1:显示(self.x+1,self.y+self.按钮坐标.仙玉商城)--self.y+158+35)

	--self.抽奖按钮:更新(x,y)
	--self.抽奖按钮:显示(self.x+488+30,self.y+15)
	--if self.抽奖按钮:事件判断() then
	--发送数据(192)
	--end
	self.购买按钮1:显示(self.x+488,self.y+499)
	self.上一页按钮1:显示(self.x+641,self.y+499)
	self.下一页按钮1:显示(self.x+713,self.y+499)
	self.输入框:置坐标(self.x+366,self.y+502)
	self.控件类:更新(dt,x,y)
	self.控件类:显示(x,y)
	local 文字=tp.字体表.普通字体
	文字:置颜色(白色)----总额
	文字:显示(self.x+198,self.y+502,self.总额)
	-- self.文字:显示(self.x+165+(66-self.文字:取宽度(self.仙玉))/2,self.y+22,self.仙玉)
	self.文字:置颜色(绿色)
	self.文字:显示(self.x+165+(66-self.文字:取宽度(self.数据.仙玉))/2,self.y+20,self.数据.仙玉)


	-- self.文字:置颜色(取金钱颜色(tp.金钱))
	self.文字:置颜色(白色)-----金钱颜色
	self.文字:显示(self.x+285+(66-self.文字:取宽度(tp.金钱))/2,self.y+20,tp.金钱)
	self.文字:置颜色(0xffd7d6f8)


	if tp.窗口.对话栏.可视==false then
		if self.鼠标 then
			if self.银子商城1:是否选中(x,y) then
				self.银子商城2:显示(self.x+1,self.y+self.按钮坐标.银子商城)
			elseif self.特殊商城1:是否选中(x,y) then
				self.特殊商城2:显示(self.x+1,self.y+self.按钮坐标.特殊商城)
			elseif self.宝宝商城1:是否选中(x,y) then
				self.宝宝商城2:显示(self.x+1,self.y+self.按钮坐标.宝宝商城)
			elseif self.锦衣商城1:是否选中(x,y) then
				self.锦衣商城2:显示(self.x+1,self.y+self.按钮坐标.锦衣商城)
			elseif self.法宝商城1:是否选中(x,y) then
				self.法宝商城2:显示(self.x+1,self.y+self.按钮坐标.法宝商城)
			elseif self.仙玉商城1:是否选中(x,y) then
				self.仙玉商城2:显示(self.x+1,self.y+self.按钮坐标.仙玉商城)
			elseif self.购买按钮1:是否选中(x,y) then
				self.购买按钮2:显示(self.x+488,self.y+499)
			elseif self.上一页按钮1:是否选中(x,y) then
				self.上一页按钮2:显示(self.x+641,self.y+499)
			elseif self.下一页按钮1:是否选中(x,y) then
				self.下一页按钮2:显示(self.x+713,self.y+499)
			elseif self.关闭按钮1:是否选中(x,y) then
				self.关闭按钮2:显示(self.x+765,self.y+13)
			end
		end
		if self.银子商城2:是否选中(x,y) and 鼠标弹起(左键) then
			self.选中总类="银子商城"
			self.分类="银子商城"
			self:初始系统(dt,x,y,2)
			self.加入=0
		elseif self.仙玉商城2:是否选中(x,y) and 鼠标弹起(左键) then
			self.选中总类="仙玉商城"
			self.分类="仙玉商城"
			self:初始系统(dt,x,y,2)
			self.加入=0
		elseif self.特殊商城2:是否选中(x,y) and 鼠标弹起(左键) then
			self.选中总类="特殊商城"
			self.分类="特殊商城"
			self.子类="比武积分"
			self:初始系统(dt,x,y,2)
			self.加入=0
		elseif self.宝宝商城2:是否选中(x,y) and 鼠标弹起(左键) then
			self.选中总类="bb"
			self.分类="宝宝"
			self:初始系统(dt,x,y,2)
			self.加入=0
		elseif self.锦衣商城2:是否选中(x,y) and 鼠标弹起(左键) then
			self.选中总类="锦衣祥瑞"
			self.分类="锦衣"
			self.子类="锦衣"
			self:初始系统(dt,x,y,2)
			self.加入=0
		elseif self.法宝商城2:是否选中(x,y) and 鼠标弹起(左键) then
			self.选中总类="法宝商城"
			self.分类="法宝"
			self.子类="法宝"
			self:初始系统(dt,x,y,2)
			self.加入=0
		elseif self.购买按钮2:是否选中(x,y) and 鼠标按住(左键) then
			self.购买按钮3:显示(self.x+488,self.y+499)
		elseif self.上一页按钮2:是否选中(x,y) and 鼠标按住(左键) then
			self.上一页按钮3:显示(self.x+641,self.y+499)
		elseif self.下一页按钮2:是否选中(x,y) and 鼠标按住(左键) then
			self.下一页按钮3:显示(self.x+713,self.y+499)
		elseif self.关闭按钮2:是否选中(x,y) and 鼠标按住(左键) then
			self.关闭按钮3:显示(self.x+765,self.y+13)
		end
	end

	if (self.关闭按钮2:是否选中(x,y) and 鼠标弹起(左键)) then -- or (self.分类~="宝宝" and 鼠标弹起(右键))
		-- tp.窗口.商城宝宝查看.可视=false
		self:打开()
		self.本类开关 = false
		self.输入框:置可视(false,false)
		return false
	end

	---------------------购买按钮事件开始↓----------------------
		if self.购买按钮2:是否选中(x,y) and 鼠标弹起(左键) then
		if self.商品编号 == 0 then
			tp.常规提示:打开("#y/请先选择一件商品")
		else
			if self.商品编号~=0 then
				if not 判定数字合法(self.输入框:取文本()) then return  引擎.场景.常规提示:打开("请输入正确的数量") end
					self.发送信息 = {
						编号 = self.商品编号,--self.物品数据[self.分类][self.商品编号].编号,
						位置 = self.商品编号,
						数量 = self.输入框:取文本(),
						组号 = self.组号,
						分类 = self.分类
					}
					发送数据(30,self.发送信息)
				-- if self.分类 == "祥瑞" then
				--     self.银子=self.银子-self.物品数据[self.分类][self.商品编号].价格*self.数量
				-- else
				--     self.银子=self.银子-self.物品数据[self.分类][self.商品编号].价格*self.数量
				-- end
			end
		end
	end
	---------------------购买按钮事件结束↑----------------------

-- if self.锦衣按钮2:是否选中(x,y) and 鼠标弹起(左键) then
-- 		self.子类="锦衣"
-- 		self.分类="锦衣"
-- 		self:初始系统(dt,x,y,2)
-- 		self.加入=0
-- 	elseif self.光环按钮2:是否选中(x,y) and 鼠标弹起(左键) then
-- 		for i=1,#self.数据["光环"] do
-- 			if self.物品数据["光环"][i]==nil then
-- 			    local xn = 引擎.取光环(self.数据["光环"][i].名称)
-- 				self.物品数据["光环"][i] = tp.资源:载入(xn[4],"网易WDF动画",xn[1])
-- 				self.物品数据["光环"].数量的=#self.数据["光环"]
-- 				self.物品数据["光环"][i].编号 = n
-- 				self.物品数据["光环"][i].价格=self.数据["光环"][i].价格
-- 			end
-- 		end
-- 		self.子类="光环"
-- 		self.分类="光环"
-- 		self:初始系统(dt,x,y,2)
-- 		self.加入=0
-- 	elseif self.足迹按钮2:是否选中(x,y) and 鼠标弹起(左键) then




	if self.选中总类=="银子商城" then
			self.银子商城3:显示(self.x+1,self.y+self.按钮坐标.银子商城)
			self.银子商城按钮:显示(self.x+143,self.y+60)
			self.人物类按钮:显示(self.x+220,self.y+60)
			self.宠物类按钮:显示(self.x+220+77,self.y+60)
			self.孩子类按钮:显示(self.x+220+77*2,self.y+60)
			self.宝石类按钮:显示(self.x+220+77*3,self.y+60)
			self.符石类按钮:显示(self.x+220+77*4,self.y+60)
			self.杂物类按钮:显示(self.x+220+77*5,self.y+60)


	elseif self.选中总类=="特殊商城" then
		self.特殊商城3:显示(self.x+1,self.y+self.按钮坐标.特殊商城)
		self.其他商城3:显示(self.x+143,self.y+60)
	elseif self.选中总类=="bb" then
		self.宝宝商城3:显示(self.x+1,self.y+self.按钮坐标.宝宝商城)
	elseif self.选中总类=="锦衣祥瑞" then
		self.锦衣商城3:显示(self.x+1,self.y+self.按钮坐标.锦衣商城)
		if self.分类=="锦衣" then
			self.锦衣按钮3:显示(self.x+143,self.y+60)
		else
			self.锦衣按钮1:显示(self.x+143,self.y+60)
			if self.锦衣按钮1:是否选中(x,y) and 鼠标弹起(左键) then
			  self.锦衣按钮2:显示(self.x+143,self.y+60)
			end
		end

		if self.分类=="光环" then
			self.光环按钮3:显示(self.x+188,self.y+60)
		else
			self.光环按钮1:显示(self.x+188,self.y+60)
			if self.光环按钮1:是否选中(x,y) and 鼠标弹起(左键) then
			  self.光环按钮2:显示(self.x+188,self.y+60)
			end
		end

		if self.分类=="足迹" then
			self.足迹按钮3:显示(self.x+233,self.y+60)
		else
			self.足迹按钮1:显示(self.x+233,self.y+60)
			if self.足迹按钮1:是否选中(x,y) and 鼠标弹起(左键) then
			  self.足迹按钮2:显示(self.x+233,self.y+60)
			end
		end
		if self.分类=="祥瑞套装" then
			self.祥瑞套装按钮3:显示(self.x+278,self.y+60)
		else
			self.祥瑞套装按钮1:显示(self.x+278,self.y+60)
			if self.祥瑞套装按钮1:是否选中(x,y) and 鼠标弹起(左键) then
			  self.祥瑞套装按钮2:显示(self.x+278,self.y+60)
			end
		end


		self.特效按钮:显示(self.x+278+45,self.y+60-1)




	elseif self.选中总类=="法宝商城" then
		self.法宝商城3:显示(self.x+1,self.y+self.按钮坐标.法宝商城)
		self.法宝按钮:显示(self.x+143,self.y+60)
		self.灵宝按钮:显示(self.x+194,self.y+60)

	elseif self.选中总类=="仙玉商城" then
		self.仙玉商城3:显示(self.x+1,self.y+self.按钮坐标.仙玉商城)
	end


	if self.分类=="银子商城" or self.分类=="特殊商城" or self.分类=="灵宝"  or self.分类=="法宝" or self.分类=="仙玉商城" or self.分类=="会员" or self.分类=="人物类" or self.分类=="宠物类" or self.分类=="孩子类" or self.分类=="宝石类" or self.分类=="符石类" or self.分类=="杂物类"  then
		self:物品类(dt,x,y)
	elseif self.分类=="宝宝" then
		self:召唤兽类(dt,x,y)
	elseif self.分类=="锦衣" or self.分类=="足迹" or self.分类=="光环" or self.分类=="祥瑞" or self.分类=="祥瑞套装" or self.分类=="特效" or self.分类=="特效" then
		self:锦衣类(dt,x,y)
	end

end


function 商城类:初始系统(dt,x,y,l)
	if l~=nil and l==2 then
		self.商品编号=0
		self.数量 = 1
		self.价格 = 0
		self.总额 = 0
		self.选中编号=0
		self.选中编号2=0
		self.选中编号3 = 0
		self.选中编号4 = 0
		bbsa=0
	else
		self.商品编号=0
		self.数量 = 1
		self.价格 = 0
		self.总额 = 0
		self.选中编号=0
		self.选中编号2=0
		self.选中编号3 = 0
		self.选中编号4 = 0
	end
	-- print(self.分类)
	if self.分类 == "银子商城" or self.分类 == "特殊商城" or self.分类 == "法宝" or self.分类 == "灵宝"  or self.分类 == "仙玉商城" or self.分类=="会员" or self.分类=="人物类" or self.分类=="宠物类" or self.分类=="孩子类" or self.分类=="宝石类" or self.分类=="符石类" or self.分类=="杂物类" then
		self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/15)
	elseif self.分类 == "宝宝" then
		 self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/8)
	elseif self.分类 == "锦衣" or self.分类 == "光环" or self.分类 == "足迹" or self.分类=="祥瑞" or self.分类=="祥瑞套装" or self.分类=="特效"  then
		self.翻页数据 = math.floor(self.物品数据[self.分类].数量的/8)
	end
end

function 商城类:锦衣类(dt,x,y)
	self.文字:置颜色(0xffd7d6f8)
	self.输入框:置可视(true,true)
	self.文字:显示(self.x+740,self.y+65,"当前:"..(self.加入+1).."/"..(self.翻页数据+1))
	if self.锦衣按钮2:是否选中(x,y) and 鼠标弹起(左键) then
		self.子类="锦衣"
		self.分类="锦衣"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.光环按钮2:是否选中(x,y) and 鼠标弹起(左键) then
		for i=1,#self.数据["光环"] do
			if self.物品数据["光环"][i]==nil then
			    local xn = 引擎.取光环(self.数据["光环"][i].名称)
				self.物品数据["光环"][i] = tp.资源:载入(xn[4],"网易WDF动画",xn[1])
				self.物品数据["光环"].数量的=#self.数据["光环"]
				self.物品数据["光环"][i].编号 = n
				self.物品数据["光环"][i].价格=self.数据["光环"][i].价格
			end
		end
		self.子类="光环"
		self.分类="光环"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.足迹按钮2:是否选中(x,y) and 鼠标弹起(左键) then
		for i=1,#self.数据["足迹"] do
			if self.物品数据["足迹"][i]==nil then
				local xn = 引擎.取足迹(self.数据["足迹"][i].名称)
				self.物品数据["足迹"][i] = tp.资源:载入(xn[4],"网易WDF动画",xn[1])
				self.物品数据["足迹"].数量的=#self.数据["足迹"]
				self.物品数据["足迹"][i].编号 = n
				self.物品数据["足迹"][i].价格=self.数据["足迹"][i].价格
			end
		end
		self.子类="足迹"
		self.分类="足迹"
		self:初始系统(dt,x,y,2)
		self.加入=0

	elseif self.祥瑞套装按钮2:是否选中(x,y) and 鼠标弹起(左键)  then
		if tp.队伍[1].造型 == "影精灵" then
			tp.常规提示:打开("#R影精灵#W暂无祥瑞！请更换其他角色查询")

			-- for i=1,#self.数据[x类[n]] do
			-- 		local xn = 引擎.取普通锦衣模型(self.数据[x类[n]][i].名称,tp.队伍[1].模型)
			-- 		self.物品数据[x类[n]][i] = tp.资源:载入(xn[3],"网易WDF动画",xn[1])
			-- 		self.物品数据[x类[n]].数量的=#self.数据[x类[n]]
			-- 		self.物品数据[x类[n]][i].编号 = n
			-- 		self.物品数据[x类[n]][i].价格=self.数据[x类[n]][i].价格
			-- end
			-- 		self.子类="锦衣"
			-- 		self.分类="锦衣"
			-- 		self:初始系统(dt,x,y,2)
			-- 		self.加入=0
		else
			for i=1,#self.数据["祥瑞套装"] do
				if self.物品数据["祥瑞套装"][i]==nil  then
					local xn = 引擎.取模型(self.数据["祥瑞套装"][i].名称)
					self.物品数据["祥瑞套装"][i] = tp.资源:载入(xn[3],"网易WDF动画",xn[1])
					self.物品数据["祥瑞套装"].数量的=#self.数据["祥瑞套装"]
					self.物品数据["祥瑞套装"][i].编号 = n
					self.物品数据["祥瑞套装"][i].价格=self.数据["祥瑞套装"][i].价格
				end
			end
					self.子类="祥瑞套装"
					self.分类="祥瑞套装"
					self:初始系统(dt,x,y,2)
					self.加入=0
		end
	elseif self.特效按钮:是否选中(x,y) and 鼠标弹起(左键)  then
		self.子类="特效"
		self.分类="特效"
		self:初始系统(dt,x,y,2)
		self.加入=0

	--------------------------------------------------------
	end
	if self.上一页按钮2:是否选中(x,y) and 鼠标弹起(左键) or 引擎.取鼠标滚轮() ==1 then
		self:初始系统(dt,x,y,0)
		if self.加入 >0 then
			self.加入 = self.加入 - 1
		end
	elseif self.下一页按钮2:是否选中(x,y) and 鼠标弹起(左键) or 引擎.取鼠标滚轮() ==-1 then
		self:初始系统(dt,x,y,0)
		if self.加入 <self.翻页数据 then
			self.加入 = self.加入 + 1
		end
	end
	self.焦点 = false
	self.选中编号 = 0
	local x横,x竖 = 1,1
	for n = 1, 8 do
		if self.物品数据[self.分类][n+self.加入*8]~=nil then
			if self.物品数据[self.分类][n+self.加入*8]:是否选中(x,y) then
				self.焦点=true
				self.选中编号 = n+self.加入*8
			--	tp.提示:自定义(x-42,y+27,"#G/右键#Y查看属性 \n#G/再次右键#Y切换 ")
				if 引擎.鼠标弹起(左键) then
					self.选中编号2=n
					self.选中编号3 = n+self.加入*8
					self.选中编号4 = n+self.加入*8
				end
			end
			self.宝宝背景框:显示(self.x+139+(x横-1)*165,self.y+109+(x竖-1)*176)
			tp.影子:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)
			if self.分类=="锦衣" then
				self.物品数据[self.分类][n+self.加入*8]:更新(dt)
				 self.物品数据[self.分类][n+self.加入*8]:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)
			elseif self.分类=="光环" then
				self.物品数据[self.分类][n+self.加入*8]:更新(dt)
				self.物品数据[self.分类][n+self.加入*8]:显示(self.x+214+(x横-1)*165,self.y+208+(x竖-1)*176)

			elseif self.分类=="足迹" then
				self.物品数据[self.分类][n+self.加入*8]:更新(dt)
				self.物品数据[self.分类][n+self.加入*8]:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)


			elseif self.分类=="祥瑞" then
				self.物品数据[self.分类][n+self.加入*8]:更新(dt)
				self.物品数据[self.分类][n+self.加入*8]:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)
			elseif self.分类=="祥瑞套装" then
				self.物品数据[self.分类][n+self.加入*8]:更新(dt)
				self.物品数据[self.分类][n+self.加入*8]:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)
			elseif self.分类=="特效" then
				self.物品数据[self.分类][n+self.加入*8]:更新(dt)
				 self.物品数据[self.分类][n+self.加入*8]:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)
				 								tp.影子:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)

				 if self.物品数据[self.分类][n+self.加入*8]:是否选中(x,y) then
				 	   tp.提示:商城提示(x-40,y-60,self.物品数据[self.分类][n+self.加入*8].名称,self.物品数据[self.分类][n+self.加入*8].说明,self.物品数据[self.分类][n+self.加入*8].大动画)
				 end

			end
			self.银两图标:显示(self.x+276+(x横-1)*165,self.y+111+(x竖-1)*176)
			if self.银两图标:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"此图标代表物品用银两进行结算")
			end
			-- local 名称宽度=self.文字:取宽度(self.数据[self.分类][n+self.加入*8].名称.." "..self.物品数据[self.分类][n+self.加入*8].价格)
			-- self.文字:显示(self.x+139+(x横-1)*165+(155-名称宽度)/2,self.y+248+(x竖-1)*176,self.数据[self.分类][n+self.加入*8].名称.." "..self.物品数据[self.分类][n+self.加入*8].价格)
			local 名称宽度=self.文字:取宽度(self.数据[self.分类][n+self.加入*8].名称)
			self.文字:显示(self.x+139+(x横-1)*165+(155-名称宽度)/2,self.y+248+(x竖-1)*176,self.数据[self.分类][n+self.加入*8].名称)
			if self.选中编号 ~= 0 and self.选中编号 == n+self.加入*8 then
				self.选中显示:显示(self.x+133+(x横-1)*165,self.y+103+(x竖-1)*176)
			end
			if self.选中编号2 ~= 0 and self.选中编号2 == n then
				self.宝宝选中显示:显示(self.x+133+(x横-1)*10+(x横-1)*155,self.y+103+(x竖-1)*21+(x竖-1)*155)
			end
		end
		if x横 == 4  then
			x横 = 1
			x竖=x竖+1
		else
			x横 = x横+1
		end
	end
	if self.选中编号 ~= 0 then
	-- self.物品数据[self.分类][self.选中编号]:显示事件()
		if 引擎.鼠标弹起(左键) and self.选中编号3~=0 then
			self.价格 = self.物品数据[self.分类][self.选中编号3].价格--self.数据[self.子类][self.选中编号3].价格
			if self.商品编号 == self.选中编号 then
				self.数量 = 1--self.数量 + 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
				return 0
			else
				self.数量 = 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
			end
			self.商品编号 = self.选中编号
		elseif 引擎.鼠标弹起(右键) and self.商品编号 == self.选中编号 and self.数量 > 1 then
			self.数量 = self.数量 - 1
			self.总额 = self.数量 * self.价格
			self.输入框:置文本(self.数量)
		end
	end
end







function 商城类:召唤兽类(dt,x,y)
	self.文字:置颜色(0xffd7d6f8)
	self.输入框:置可视(true,true)
	self.文字:显示(self.x+740,self.y+65,"当前:"..(self.加入+1).."/"..(self.翻页数据+1))
	self.文字:显示(self.x+330,self.y+460,"*右键对象查看技能，再次右键物理(法术)切换")
	if self.上一页按钮2:是否选中(x,y) and 鼠标弹起(左键) or 引擎.取鼠标滚轮() ==1 then
		self:初始系统(dt,x,y,0)
		if self.加入 >0 then
			self.加入 = self.加入 - 1
		end
	elseif self.下一页按钮2:是否选中(x,y) and 鼠标弹起(左键) or 引擎.取鼠标滚轮() ==-1 then
		self:初始系统(dt,x,y,0)
		if self.加入 <self.翻页数据 then
			self.加入 = self.加入 + 1
		end
	end
	self.焦点 = false
	self.选中编号 = 0
	local x横,x竖 = 1,1
	for n = 1, 8 do
		if self.物品数据[self.分类][n+self.加入*8]~=nil then
			if self.物品数据[self.分类][n+self.加入*8]:是否选中(x,y) then
				self.选中编号 = n+self.加入*8
				tp.提示:自定义(x-42,y+27,"#G/右键#Y查看属性 \n#G/再次右键#Y切换 ")
				if 引擎.鼠标弹起(左键) then
					self.选中编号2=n
					self.选中编号3 = n+self.加入*8
					self.选中编号4 = n+self.加入*8
				end
			end
			self.宝宝背景框:显示(self.x+139+(x横-1)*165,self.y+109+(x竖-1)*176)
			self.物品数据[self.分类][n+self.加入*8]:更新(dt)
			tp.影子:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)
			self.物品数据[self.分类][n+self.加入*8]:显示(self.x+214+(x横-1)*165,self.y+228+(x竖-1)*176)
			self.仙玉图标:显示(self.x+140+(x横-1)*165,self.y+111+(x竖-1)*176)
			if self.仙玉图标:是否选中(x,y) then
				tp.提示:自定义(x-42,y+27,"此图标代表物品用仙玉进行结算")
			end
			-- local 名称宽度=self.文字:取宽度(self.数据[self.分类][n+self.加入*8].名称.." "..self.物品数据[self.分类][n+self.加入*8].价格)
			-- self.文字:显示(self.x+139+(x横-1)*165+(155-名称宽度)/2,self.y+248+(x竖-1)*176,self.数据[self.分类][n+self.加入*8].名称.." "..self.物品数据[self.分类][n+self.加入*8].价格)
			local 名称宽度=self.文字:取宽度(self.数据[self.分类][n+self.加入*8].名称)
			self.文字:显示(self.x+139+(x横-1)*165+(155-名称宽度)/2,self.y+248+(x竖-1)*176,self.数据[self.分类][n+self.加入*8].名称)
			if self.选中编号 ~= 0 and self.选中编号 == n+self.加入*8 then
				self.选中显示:显示(self.x+133+(x横-1)*165,self.y+103+(x竖-1)*176)
			end
			if 鼠标弹起(右键) and self.物品数据[self.分类][n+self.加入*8]:是否选中(x,y) then
				self.查看状态=self.查看状态+1
				if self.查看状态==1 then
					-- self.宝宝模型 = self.数据[self.分类][n+self.加入*8].名称
					tp.窗口.商城宝宝查看:打开(self.数据[self.分类][n+self.加入*8],"物理")
				elseif self.查看状态==2 then
					-- self.宝宝模型 = self.数据[self.分类][n+self.加入*8].名称
					tp.窗口.商城宝宝查看:打开(self.数据[self.分类][n+self.加入*8],"法系")
				end
				if self.查看状态>=2 then
					self.查看状态=0
				end
			end

			if self.选中编号2 ~= 0 and self.选中编号2 == n then
				self.宝宝选中显示:显示(self.x+133+(x横-1)*10+(x横-1)*155,self.y+103+(x竖-1)*21+(x竖-1)*155)
			end
		end
		if x横 == 4  then
			x横 = 1
			x竖=x竖+1
		else
			x横 = x横+1
		end
	end
	if self.选中编号 ~= 0 then
		-- self.物品数据[self.分类][self.选中编号]:显示事件()
		if 引擎.鼠标弹起(左键) and self.选中编号3~=0 then
			self.价格 = self.物品数据[self.分类][self.选中编号3].价格--self.数据[self.分类][self.选中编号3].价格
			if self.商品编号 == self.选中编号 then
				self.数量 = 1--self.数量 + 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
				return 0
			else
				self.数量 = 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
			end
			self.商品编号 = self.选中编号
		elseif 引擎.鼠标弹起(右键) and self.商品编号 == self.选中编号 and self.数量 > 1 then
			self.数量 = self.数量 - 1
			self.总额 = self.数量 * self.价格
			self.输入框:置文本(self.数量)
		end
	end
end




function 商城类:物品类(dt,x,y)
	self.文字:置颜色(0xffd7d6f8)
	self.输入框:置可视(true,true)
	self.文字:显示(self.x+740,self.y+65,"当前:"..(self.加入+1).."/"..(self.翻页数据+1))
	if self.上一页按钮2:是否选中(x,y) and 鼠标弹起(左键) or 引擎.取鼠标滚轮() ==1 then
		self:初始系统(dt,x,y,0)
		if self.加入 >0 then
			self.加入 = self.加入 - 1
		end
	elseif self.下一页按钮2:是否选中(x,y) and 鼠标弹起(左键) or 引擎.取鼠标滚轮() ==-1 then
		self:初始系统(dt,x,y,0)
		if self.加入 <self.翻页数据 then
			self.加入 = self.加入 + 1
		end
	end


	if self.灵宝按钮:是否选中(x,y) and 鼠标弹起(左键)  and self.选中总类=="法宝商城" then
		self.分类="灵宝"
		self.子类="灵宝"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.法宝按钮:是否选中(x,y) and 鼠标弹起(左键) and self.选中总类=="法宝商城" then
		self.子类="法宝"
		self.分类="法宝"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.银子商城按钮:是否选中(x,y) and 鼠标弹起(左键) and self.选中总类=="银子商城" then
		self.子类="银子商城"
		self.分类="银子商城"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.人物类按钮:是否选中(x,y) and 鼠标弹起(左键) and self.选中总类=="银子商城" then
		self.子类="人物类"
		self.分类="人物类"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.宠物类按钮:是否选中(x,y) and 鼠标弹起(左键) and self.选中总类=="银子商城" then
		self.子类="宠物类"
		self.分类="宠物类"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.孩子类按钮:是否选中(x,y) and 鼠标弹起(左键) and self.选中总类=="银子商城" then
		self.子类="孩子类"
		self.分类="孩子类"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.宝石类按钮:是否选中(x,y) and 鼠标弹起(左键) and self.选中总类=="银子商城" then
		self.子类="宝石类"
		self.分类="宝石类"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.符石类按钮:是否选中(x,y) and 鼠标弹起(左键) and self.选中总类=="银子商城" then
		self.子类="符石类"
		self.分类="符石类"
		self:初始系统(dt,x,y,2)
		self.加入=0
	elseif self.杂物类按钮:是否选中(x,y) and 鼠标弹起(左键) and self.选中总类=="银子商城" then
		self.子类="杂物类"
		self.分类="杂物类"
		self:初始系统(dt,x,y,2)
		self.加入=0

	end



	self.焦点 = false
	self.选中编号 = 0
	local x横,x竖 = 1,1
	for n = 1, 15 do
		if self.物品数据[self.分类][n+self.加入*15]~=nil then
			if self.物品数据[self.分类][n+self.加入*15].焦点 then
				self.选中编号 = n+self.加入*15
				if 引擎.鼠标弹起(左键) then
					self.选中编号2=n
					self.选中编号3 = n+self.加入*15
				end
			end
			self.道具背景框:显示(self.x+144+(x横-1)*10+(x横-1)*120,self.y+99+(x竖-1)*10+(x竖-1)*120)
			self.物品数据[self.分类][n+self.加入*15]:置坐标(self.x+129+x横*51+(x横-1)*79, self.y+79+x竖*51+(x竖-1)*79)
			self.物品数据[self.分类][n+self.加入*15]:显示(dt,x,y,self.鼠标,nil,nil,nil,100)
			self.文字:置颜色(白色)--------法宝里的价格
			if self.分类=="法宝" or self.分类=="特殊商城"  or self.分类=="灵宝" then
			   self.银两图标:显示(self.x+247+(x横-1)*130,self.y+100+(x竖-1)*130)
				if self.银两图标:是否选中(x,y) then
				 tp.提示:自定义(x-42,y+27,"此图标代表物品用银两进行结算")
				end
			elseif self.分类=="银子商城" or self.分类=="人物类" or self.分类=="宠物类" or self.分类=="孩子类" or self.分类=="宝石类" or self.分类=="符石类" or self.分类=="杂物类" then
				   self.银两图标:显示(self.x+247+(x横-1)*130,self.y+100+(x竖-1)*130)
				   if self.银两图标:是否选中(x,y) then
					 tp.提示:自定义(x-42,y+27,"此图标代表物品用银两进行结算")
				   end
			elseif self.分类 == "仙玉商城" then
				self.文字:置颜色(0xFF005522)
				self.仙玉图标:显示(self.x+247+(x横-1)*130,self.y+100+(x竖-1)*130)
				   if self.仙玉图标:是否选中(x,y) then
					 tp.提示:自定义(x-42,y+27,"此图标代表物品用仙玉进行结算")
				   end
			end
			local 价格宽度=self.文字:取宽度(self.物品数据[self.分类][n+self.加入*15].物品.价格)
			self.文字:显示(self.x+174+(x横-1)*130+(60-价格宽度)/2,self.y+98+(x竖-1)*130,self.物品数据[self.分类][n+self.加入*15].物品.价格)
			local 名称宽度=self.文字:取宽度(self.物品数据[self.分类][n+self.加入*15].物品.名称)
			self.文字:置颜色(黑色)
			self.文字:显示(self.x+145+(x横-1)*130+(116-名称宽度)/2,self.y+200+(x竖-1)*130,self.物品数据[self.分类][n+self.加入*15].物品.名称)
			if self.选中编号2 ~= 0 and self.选中编号2 == n then
				self.选中显示2:显示(self.x+125+x横*51+(x横-1)*79, self.y+78.5+x竖*51+(x竖-1)*79)
			end
		end
		if x横 == 5  then
			x横 = 1
			x竖=x竖+1
		else
			x横 = x横+1
		end
	end
	if self.选中编号 ~= 0 then
		tp.提示:道具行囊(x,y,self.物品数据[self.分类][self.选中编号].物品)
		if 引擎.鼠标弹起(左键) then
			self.价格 = self.数据[self.分类][self.选中编号].价格
			if self.商品编号 == self.选中编号 then
				self.数量 = self.数量 + 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
				return 0
			else
				self.数量 = 1
				self.总额 = self.数量 * self.价格
				self.输入框:置文本(self.数量)
			end
			self.商品编号 = self.选中编号
		elseif 引擎.鼠标弹起(右键) and self.商品编号 == self.选中编号 and self.数量 > 1 then
			self.数量 = self.数量 - 1
			self.总额 = self.数量 * self.价格
			self.输入框:置文本(self.数量)
		end
	end
	if self.输入框._已碰撞 then
		self.焦点 = true
	end
end





function 商城类:初始移动(x,y)
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

function 商城类:开始移动(x,y)
  if self.鼠标 then
	self.x = x - self.xx
	self.y = y - self.yy
  end
end

function 商城类:检查点(x,y)
	if self.可视 and self.背景 ~= nil and self.背景:是否选中(x,y) then
		return true
	else
		return false
	end
end

return 商城类

