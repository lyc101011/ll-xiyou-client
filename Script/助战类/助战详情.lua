-- @Author: baidwwy
-- @Date:   2024-07-11 20:41:12
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-19 00:34:16
--======================================================================--
local 助战详情 = class()
local insert = table.insert
local remove = table.remove
local floor = math.floor
local tp,sadsad,zts,jyzt
local qtxs = 引擎.取头像
local format = string.format
local bw = require("gge包围盒")(0,0,150,44)
-- local box = 引擎.画矩形
local mousea = 引擎.鼠标按住
local mouseb = 引擎.鼠标弹起
function 助战详情:初始化(根)
	self.ID = 170
	self.x = 112
	self.y = 169+64-99
	self.xx = 0
	self.yy = 0
	self.注释 = "队伍1栏"
	self.可视 = false
	self.鼠标 = false
	self.焦点 = false
	self.可移动 = true
	self.选中人物 = 0
	self.窗口时间 = 0
	tp = 根
	sadsad = tp.字体表.普通字体
	zts = tp.字体表.猫猫字体1
	jyzt = tp.字体表.普通字体__
	jyzt:置行间距(2.7)
end
local 临时潜力=0
local 总潜力=0
local 临时加点 = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
local 临时属性 = {气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,法伤=0,法防=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0}

function 助战详情:打开(内容)
	if self.可视 then
		self.选中人物 = 0
		self.可视 = false
	else
		insert(tp.窗口_,self)
		self.bb基础属性=内容.bb基础属性
		self.助战编号=内容.助战编号
		self.助战id=内容.助战id

		self:刷新属性(内容.角色)
		local s = qtxs(内容.角色.模型)
		self.角色头像 = tp.资源:载入(s[7],"网易WDF动画",s[2])
		self.bb加入=0
		if not self.资源组 then
			self:加载资源()
		end
		self:加载宝宝按钮资源()
		self:刷新装备(内容.装备)
		self:刷新灵饰(内容.灵饰)
		tp.运行时间 = tp.运行时间 + 1
		self.窗口时间 = tp.运行时间
		self.可视 = true
	end
end
function 助战详情:刷新属性(内容)
	临时潜力=内容.潜力
	总潜力=内容.潜力
	self.角色=内容
	self.角色.助战编号=self.助战编号
	self.角色.助战id=self.助战id
	if tp.窗口.助战技能学习.可视 then
		tp.窗口.助战技能学习:刷新技能(self.角色.师门技能)
	end
end

function 助战详情:重置()
	if not self.可视 then
		return false
	end
end
local sdr1={"魔法","伤害","防御","速度","法伤","法防"}
local sdr2={"体质","魔力","力量","耐力","敏捷","潜力"}
local jd3= {"体质","魔力","力量","耐力","敏捷"}
local zuoce= {"气血","魔法","命中","伤害","防御","速度","法伤","法防"}
function 助战详情:显示(dt,x,y)
	self.焦点 = false
	self.资源组[2]:更新(x,y)
	if self.资源组[2]:事件判断() then
		self:打开()
		return false
	end
	self.资源组[1]:显示(self.x,self.y)
	tp.窗口标题背景1_:显示(self.x-85+self.资源组[1].宽度/2,self.y)
	引擎.场景.字体表.标题字体2:显示(self.x+self.资源组[1].宽度/2+7,self.y+3,"小号配置："..self.助战id)
	self.资源组[2]:显示(self.x-19+self.资源组[1].宽度,self.y+2)
	self.左上:显示(self.x+11,self.y+28)
	self.rwtx:显示(self.x+27-3,self.y+28+15-3)
	self.角色头像:显示(self.x+26,self.y+28+15)
	self.hen1:显示(self.x+45,self.y+179)
	sadsad:置颜色(0xFF771111)
	for i=1,6 do
		self.hen2:显示(self.x+45,self.y+179+i*27)
		sadsad:显示(self.x+11,self.y+179+3+i*27,sdr1[i])
		self.hen3:显示(self.x+185,self.y+179+i*27)
		sadsad:显示(self.x+11+142,self.y+179+3+i*27,sdr2[i])
		if sdr2[i]~="潜力" then
			sadsad:显示(self.x+11+41+142,self.y+179+3+i*27,self.角色[sdr2[i]])
		else
			sadsad:显示(self.x+11+41+142,self.y+179+3+i*27,临时潜力)
		end
	end
	for i=2,6 do
		sadsad:显示(self.x+11+41,self.y+179+3+i*27,self.角色[sdr1[i]])
	end
	sadsad:显示(self.x+11,self.y+179+3,"气血")
	sadsad:显示(self.x+11+41,self.y+179+3,format("%d/%d/%d",self.角色.气血,self.角色.气血上限,self.角色.最大气血))
	sadsad:显示(self.x+11+41,self.y+179+3+1*27,format("%d/%d",self.角色.魔法,self.角色.最大魔法))
	sadsad:显示(self.x+26+58,self.y+28+15+5,self.角色.名称)
	sadsad:显示(self.x+11,self.y+179+3+222,"经验")
	tp.经验背景_:显示(self.x+52,self.y+382-32+54)
	self.经验背景:置区域(0,0,math.min(math.floor(self.角色.当前经验 / self.角色.最大经验 * 173),173),12)
	self.经验背景:显示(tp.经验背景_.x+2,tp.经验背景_.y+2)
	local ts = format("%s/%s",self.角色.当前经验,self.角色.最大经验)
	jyzt:置描边颜色(-16240640)
	jyzt:置颜色(4294967295)
	jyzt:显示(self.x + ((272-15 - jyzt:取宽度(ts))/2)+8,self.y + 384-35+56,ts)
	jyzt:置描边颜色(-16777216)


	sadsad:置颜色(0xff666666)
	if self.角色.奇经八脉 and self.角色.奇经八脉["当前流派"] then
		sadsad:显示(self.x+26+58,self.y+28+15+5+24,self.角色.等级.."级  "..self.角色.门派.."  "..self.角色.奇经八脉["当前流派"])
	else
		sadsad:显示(self.x+26+58,self.y+28+15+5+24,self.角色.等级.."级   "..self.角色.门派)
	end

	-------------------------------------------
	self.zbdt:显示(self.x+301,self.y+28)
	for i=1,6 do
		self.人物装备[i]:置坐标(self.x+self.装备坐标.x[i]-8,self.y+self.装备坐标.y[i]-10,nil,nil,4,-1)
		self.人物装备[i]:显示(dt,x,y,self.鼠标,nil,3)
		if self.人物装备[i].物品 ~= nil and self.人物装备[i].焦点 then
			tp.提示:道具行囊(x,y,self.人物装备[i].物品)
		end
		if self.人物装备[i].焦点 then
			self.焦点 = true
		end
	end
	for i=1,4 do
		self.人物灵饰[i]:置坐标(self.x + self.灵饰坐标.x[i]-8,self.y + self.灵饰坐标.y[i]-10,nil,nil,4,-1)
		self.人物灵饰[i]:显示(dt,x,y,self.鼠标,nil,3)
		if self.人物灵饰[i].物品 ~= nil and self.人物灵饰[i].焦点 then
			tp.提示:道具行囊(x,y,self.人物灵饰[i].物品,true)
		end
	end

	self.bbdt:显示(self.x+301+140,self.y+28)
	-- if self.bbdt:是否选中(x,y)  then
	-- 	self.焦点=true
	-- end
	local jx = self.x+453
	zts:置颜色(0xFF771111)
	for i=1,7 do
		if  self.bb基础属性[i] then
			local jy = self.y+28+36+(i-1)*51
			self.bbtx:显示(jx,jy)
			self.bb基础属性[i].头像:显示(jx+7,jy+7)
			zts:显示(jx+7+48,jy+5,self.bb基础属性[i].名称)
			zts:显示(jx+7+48,jy+7+19,self.bb基础属性[i].等级.."级")
			bw:置坐标(jx,jy)
			if self.鼠标 and bw:检查点(x,y) then
				self.bbxz:显示(jx-7,jy-4)
				if 引擎.鼠标弹起(1) and self.鼠标  then
					tp.禁止关闭 = true
					发送数据(2005,{助战编号=self.助战编号,认证码=self.bb基础属性[i].认证码})
				end
			end
			self.参战按钮[i]:更新(x,y)
			self.参战按钮[i]:显示(jx+7+84,jy+7+14)
			if self.参战按钮[i]:事件判断() then
				发送数据(2006,{助战编号=self.助战编号,认证码=self.bb基础属性[i].认证码})
			end
		end
	end
	for i=1,5 do
		self.加点按钮[i]:更新(x,y,临时潜力 > 0,1) --属性显示
		self.减点按钮[i]:更新(x,y,临时加点[jd3[i]] > 0,1)
		self.加点按钮[i]:显示(self.x+245,self.y+179+i*27)
		self.减点按钮[i]:显示(self.x+245+27,self.y+179+i*27)
		if self.加点按钮[i]:事件判断() then
			临时潜力=临时潜力-1
			临时加点[jd3[i]]=临时加点[jd3[i]]+1
			self:刷新临时信息()
		end
		if self.减点按钮[i]:事件判断() then
			临时潜力=临时潜力+1
			临时加点[jd3[i]]=临时加点[jd3[i]]-1
			self:刷新临时信息()
		end
	end
	sadsad:置颜色(-65536)
	if 临时属性.气血 and  临时属性.气血>0 then
		sadsad:显示(self.x+15+43+105+26,self.y+129-18+3+42+1*27," +" ..(临时属性.气血 or ""))
	end
	-- sadsad:显示(self.x+15+43,self.y+129-18+3+2*23,format("%d/%d",self.角色.魔法,self.角色.最大魔法))
	if 临时属性.魔法 and  临时属性.魔法>0 then
		sadsad:显示(self.x+11+118,self.y+129-18+3+42+2*27," +" ..(临时属性.魔法 or ""))
	end
	for i=4,#zuoce do
		if 临时属性[zuoce[i]]  and  临时属性[zuoce[i]]>0 then
			sadsad:显示(self.x+11+100,self.y+129-18+3+42+(i-1)*27," +" ..临时属性[zuoce[i]]) --"命中","伤害","防御","速度","法伤","法防"
		end
	end
	if 临时加点.体质 and  临时加点.体质>0 then
		sadsad:显示(self.x+217,self.y+179+3+1*27," +" ..(临时加点.体质 or ""))
	end
	if 临时加点.魔力 and  临时加点.魔力>0 then
		sadsad:显示(self.x+217,self.y+179+3+2*27," +" ..(临时加点.魔力 or ""))
	end
	if 临时加点.力量 and  临时加点.力量>0 then
		sadsad:显示(self.x+217,self.y+179+3+3*27," +" ..(临时加点.力量 or ""))
	end
	if 临时加点.耐力 and  临时加点.耐力>0 then
		sadsad:显示(self.x+217,self.y+179+3+4*27," +" ..(临时加点.耐力 or ""))
	end
	if 临时加点.敏捷 and  临时加点.敏捷>0 then
		sadsad:显示(self.x+217,self.y+179+3+5*27," +" ..(临时加点.敏捷 or ""))
	end
--	self.师门技能按钮:更新(x,y)
--	self.修炼技能按钮:更新(x,y)
--	self.查看经脉按钮:更新(x,y)
	self.升级按钮:更新(x,y,self.角色.当前经验>=self.角色.最大经验,1)
	self.更多属性按钮:更新(x,y)
	self.道具操作按钮:更新(x,y)
	self.确认加点按钮:更新(x,y,总潜力>临时潜力,1)
--	self.查看经脉按钮:显示(self.x+27-3,self.y+28+15-3+59)
--	self.师门技能按钮:显示(self.x+27-3+100,self.y+28+15-3+59)
--	self.修炼技能按钮:显示(self.x+27-3,self.y+28+15-3+59+34)
	self.确认加点按钮:显示(self.x+11+204,self.y+370)
	self.更多属性按钮:显示(self.x+11,self.y+370)

	self.道具操作按钮:显示(self.x+11+204+109,self.y+370)
	self.道具操作按钮:置颜色(0xFF771111)-------------------------------


	self.升级按钮:显示(self.x+245,self.y+384-37+54)
	if self.查看经脉按钮:事件判断() then
		-- tp.窗口.经脉流派:打开(self.角色,self.助战编号)
		tp.常规提示:打开("#R/请切换队长处理")
	elseif self.道具操作按钮:事件判断() then
		if 引擎.场景.窗口.助战道具栏.可视 then
			引擎.场景.窗口.助战道具栏:打开()
		else
			发送数据(2012,{助战编号=self.助战编号})
		end
	elseif self.师门技能按钮:事件判断() then
		引擎.场景.窗口.助战技能学习:打开(self.角色)
	-- elseif self.修炼技能按钮:事件判断() then
	-- 	引擎.场景.窗口.助战修炼学习:打开(self.角色)
	elseif self.更多属性按钮:事件判断() then
		tp.窗口.更多属性:打开(self.角色)
	elseif self.确认加点按钮:事件判断() then
		if 总潜力~=0 and 总潜力>临时潜力 then
			发送数据(2008,{加点=临时加点,助战编号=self.助战编号})
			临时加点 = {体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
			临时属性 = {气血=0,魔法=0,命中=0,伤害=0,防御=0,速度=0,躲避=0,灵力=0,法伤=0,法防=0,体质=0,魔力=0,力量=0,耐力=0,敏捷=0}
		end
	elseif self.升级按钮:事件判断() then
		if self.角色.等级==39 or self.角色.等级==59 or self.角色.等级==69 or self.角色.等级==89 or self.角色.等级==109 or self.角色.等级==129 then
			local 事件 = function()
				发送数据(2007,{助战编号=self.助战编号})
			end
			tp.窗口.文本栏:载入("确定将等级提升至#R "..(self.角色.等级+1).."#W 级吗？",nil,true,事件)
		else
			发送数据(2007,{助战编号=self.助战编号})
		end
	end

end


function 助战详情:检查点(x,y)
	if self.可视 and self.资源组[1]:是否选中(x,y)  then
		return true
	else
		return false
	end
end

function 助战详情:初始移动(x,y)
	tp.运行时间 = tp.运行时间 + 1
	if not tp.消息栏焦点 then
		self.窗口时间 = tp.运行时间
	end
	if not self.焦点 then
		tp.移动窗口 = true
	end
	if self.可视 and self.鼠标 and  not self.焦点 then
		self.xx = x - self.x
		self.yy = y - self.y
	end
end

function 助战详情:开始移动(x,y)
	if self.可视 and self.鼠标 then
		self.x = x - self.xx
		self.y = y - self.yy
	end
end


function 助战详情:刷新临时信息(是否,体质,魔力)
	local 五维属性 = self:临时取属性(self.角色.种族,{临时加点.体质,临时加点.魔力,临时加点.力量,临时加点.耐力,临时加点.敏捷})
	临时属性 = {气血=五维属性["气血"],魔法=五维属性["法力"],命中=五维属性["命中"],伤害=五维属性["伤害"],防御=五维属性["防御"],速度=五维属性["速度"],躲避=五维属性["躲避"],灵力=五维属性["灵力"],法伤=五维属性["灵力"],法防=五维属性["灵力"],体质=五维属性.体质,魔力=五维属性.魔力,力量=五维属性.力量,耐力=五维属性.耐力,敏捷=五维属性.敏捷}
end
function 助战详情:临时取属性(种族,五维,技能)
	local 属性={}
	local 力量 = 五维[3]
	local 体质 = 五维[1]
	local 魔力 = 五维[2]
	local 耐力 = 五维[4]
	local 敏捷 = 五维[5]
	技能 = 技能 or {0,0,0,0}
	if 种族 == "人" or 种族 == 1 then
		属性 = {
			命中 = floor(力量 * 2.01),
			伤害 = floor(力量 * 0.67),
			防御 = floor(耐力 * 1.5),
			速度 = floor((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
			灵力 = floor((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
			躲避 = floor(敏捷),
			气血 = floor((体质 * 5)),
			法力 = floor((魔力 * 3)),
		}
	elseif 种族 == "魔" or 种族 == 2 then
		属性 = {
			命中 = floor(力量 * 2.31),
			伤害 = floor(力量 * 0.77),
			防御 = floor(耐力 * 1.4),
			速度 = floor((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
			灵力 = floor((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
			躲避 = floor(敏捷),
			气血 = floor((体质 * 6)),
			法力 = floor((魔力 * 2.5)),
		}
	elseif 种族 == "仙" or 种族 == 3 then
		属性 = {
			命中 = floor(力量 * 1.71),
			伤害 = floor(力量 * 0.57),
			防御 = floor(耐力 * 1.6),
			速度 = floor((体质 * 0.1) + (耐力 * 0.1) + (力量 * 0.1) + (敏捷 * 0.7)),
			灵力 = floor((体质 * 0.3) + (魔力 * 0.7) + (耐力 * 0.2) + (力量 * 0.4)),
			躲避 = floor(敏捷),
			气血 = floor((体质 * 4.5)),
			法力 = floor((魔力 * 3.5)),
		}
	end
	return 属性
end

function 助战详情:加载资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.资源组 = {
		[1] = 自适应.创建(42,1,612,432,3,9),
		[2] = 按钮.创建(自适应.创建(45,4,16,16,4,3),0,0,4,true,true),
	}
	self.hen1=自适应.创建(46,1,247,22,1,3)
	self.hen2=自适应.创建(46,1,98,22,1,3)
	self.hen3=自适应.创建(46,1,67,22,1,3)
	self.rwtx=tp.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/rwtx.png","图片")
	self.bbtx=tp.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/3.png","图片")
	self.bbxz=tp.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/bbxz.png","图片")
	self.左上=tp.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/96.png","图片")
	self.bbdt=tp.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/bbdt.png","图片")
	self.zbdt=tp.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/zb.png","图片")
	self.参战按钮={}
	for i=1,11 do
		self.参战按钮[i]=按钮.创建(自适应.创建(44,4,49,23,1,3),0,0,4,true,true,"参战",nil,0xFF771111)
		--self.参战按钮[i]:置偏移(11,0)
		self.参战按钮[i]:绑定窗口_(self.ID)
	end
	self.加点按钮={}
	self.减点按钮={}
	for i=1,5 do
		self.加点按钮[i]= 按钮.创建(资源:载入('lg.rpk',"网易WDF动画",0x00010118,9393),0,0,3,true,true)
		self.减点按钮[i]= 按钮.创建(资源:载入('lg.rpk',"网易WDF动画",0x00010119,9393),0,0,3,true,true)
		self.加点按钮[i]:绑定窗口_(self.ID)
		self.减点按钮[i]:绑定窗口_(self.ID)
	end
	self.经验背景=资源:载入('org.rpk',"网易WDF动画",0x1000375)
	self.道具操作按钮=按钮.创建(自适应.创建(44,4,80,23,1,3),0,0,4,true,true,"道具操作",nil,0xFF771111)
	self.确认加点按钮=按钮.创建(自适应.创建(44,4,80,23,1,3),0,0,4,true,true,"确认加点",nil,0xFF771111)
	self.查看经脉按钮=按钮.创建(自适应.创建(44,4,80,23,1,3),0,0,4,true,true,"查看经脉",nil,0xFF771111)
	self.师门技能按钮=按钮.创建(自适应.创建(44,4,80,23,1,3),0,0,4,true,true,"师门技能",nil,0xFF771111)
--	self.修炼技能按钮=按钮.创建(自适应.创建(44,4,80,23,1,3),0,0,4,true,true,"修炼技能",nil,0xFF771111)
	self.更多属性按钮=按钮.创建(自适应.创建(44,4,80,23,1,3),0,0,4,true,true,"更多属性",nil,0xFF771111)
	self.师门技能按钮:置偏移(5,0)
--	self.修炼技能按钮:置偏移(5,0)
	self.查看经脉按钮:置偏移(5,0)
	self.更多属性按钮:置偏移(5,0)
	self.确认加点按钮:置偏移(5,0)
	self.道具操作按钮:置偏移(5,0)
	self.道具操作按钮:绑定窗口_(self.ID)
	self.确认加点按钮:绑定窗口_(self.ID)
	self.更多属性按钮:绑定窗口_(self.ID)
	self.查看经脉按钮:绑定窗口_(self.ID)
	self.师门技能按钮:绑定窗口_(self.ID)
--	self.修炼技能按钮:绑定窗口_(self.ID)
	self.升级按钮=按钮.创建(自适应.创建(43,4,49,23,1,3),0,0,4,true,true,"升级")
	self.升级按钮:置偏移(3,0)
	self.升级按钮:绑定窗口_(self.ID)
	--3607870878  更多信息
	local 格子 = tp._物品格子
	local 底图 =tp.资源:载入("wdf/audio/jmk/无底洞/zhuzhan/16.png","图片")--资源:载入('wzife.wdf',"网易WDF动画",0xA393A808)
	self.人物装备= {}
	for i=1,6 do
		self.人物装备[i] = 格子(0,0,i,"道具行囊_人物装备",底图)
	end
	self.人物灵饰 = {}
	for i=1,4 do
		self.人物灵饰[i] = 格子(0,0,i,"道具行囊_灵饰1",底图)
	end
	self.人物装备[1]:置根(tp)
	self.装备坐标 = {x={319,319+60,319,319+60,319,319+60},y={191,191,191+60,191+60,191+60*2,191+60*2}}
	self.灵饰坐标 = {x={319,319+62,319,319+62},y={71,71,71+60,71+60}}


end
function 助战详情:刷新宝宝参战信息(xxwdw)
	self.bb基础属性=xxwdw
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.参战按钮={}
	for i=1,#self.bb基础属性 do
		local tsd=qtxs(self.bb基础属性[i].模型)
		self.bb基础属性[i].头像=tp.资源:载入(tsd[7],"网易WDF动画",tsd[1])
		if self.bb基础属性[i].参战信息 then
			self.参战按钮[i]=按钮.创建(自适应.创建(44,4,49,23,1,3),0,0,4,true,true,"休息",nil,红色)
		else
			self.参战按钮[i]=按钮.创建(自适应.创建(44,4,49,23,1,3),0,0,4,true,true,"参战",nil,0xFF771111)
		end
		self.参战按钮[i]:置偏移(3,0)
		self.参战按钮[i]:绑定窗口_(self.ID)
	end
end
function 助战详情:加载宝宝按钮资源()
	local 资源 = tp.资源
	local 按钮 = tp._按钮
	local 自适应 = tp._自适应
	self.参战按钮={}
	for i=1,#self.bb基础属性 do
		local tsd=qtxs(self.bb基础属性[i].模型)
		self.bb基础属性[i].头像=tp.资源:载入(tsd[7],"网易WDF动画",tsd[1])
		if self.bb基础属性[i].参战信息 then
			self.参战按钮[i]=按钮.创建(自适应.创建(44,4,49,23,1,3),0,0,4,true,true,"休息",nil,红色)
		else
			self.参战按钮[i]=按钮.创建(自适应.创建(44,4,49,23,1,3),0,0,4,true,true,"参战",nil,0xFF771111)
		end
		self.参战按钮[i]:置偏移(3,0)
		self.参战按钮[i]:绑定窗口_(self.ID)
	end


end
function 助战详情:刷新装备(内容)
	self.装备=内容
	for i=1,6 do
		self.人物装备[i]:置物品(self.装备[i])
	end
end
function 助战详情:刷新灵饰(内容)
	self.灵饰=内容
	for i=1,4 do
		if self.灵饰  then
			self.人物灵饰[i]:置物品(self.灵饰[i])
		end
	end
end
return 助战详情