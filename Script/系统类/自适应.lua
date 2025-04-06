-- @Author: baidwwy
-- @Date:   2023-10-25 18:58:55
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-07-11 20:49:41
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-05-14 20:50:57
--======================================================================--
local 自适应 = class()
-- 载入UI自适应区域
local 适应组 = {}
--适应组[1]
local floor = math.floor
local __jls = require("gge精灵类")

function 自适应:加载(根)--37
	local 资源 = 根.资源
	适应组[0] = {[0]=资源:载入('aaa.wdf',"网易WDF动画",0x1000370).精灵}--{[0]=资源:载入('org.rpk',"网易WDF动画",0x1000370).精灵} -- UI的背景底图 c6476d82

	适应组[42] = {[0]=资源:载入('wdf/audio/jmk/无底洞/zhuzhan/jinhuang.png',"图片")}--黄色
	适应组[43] = {按钮=资源:载入('lg.rpk',"网易WDF动画",0x00010115)} --我弄的红色按钮1
	适应组[44] = {按钮=资源:载入('lg.rpk',"网易WDF动画",0x00010116)} --我弄的黄色按钮1
	适应组[45] = {按钮=资源:载入('lg.rpk',"网易WDF动画",0x00010117)} -- 黄色关闭按钮1
	适应组[46] = {[0]=资源:载入('wdf/audio/jmk/无底洞/zhuzhan/23.png',"图片")}-- 人物属性界面字体白色背景1


	适应组[111] = {[0]=资源:载入('ceshi.wdf',"网易WDF动画",0XFA000000).精灵}--liaot
	-- 适应组[0] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xc6476d82).精灵} -- UI的背景底图 c6476d82--原始
	--适应组[37] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0XEC7E6D12).精灵} -- UI的背景底图2
	适应组[1] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x12989E68).精灵} -- UI的后置标题背景
	适应组[72] = {[0]=资源:载入('wzife.wd1',"网易WDF动画",0x003C5980).精灵} -- UI的后置标题背景
	适应组[28]= {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x802EB60A).精灵}
	适应组[2] = {[0]=资源:载入('org.rpk',"网易WDF动画",0x1000364).精灵} -- UI的按钮背景
	适应组[3] = {[0]=资源:载入('aaa.wdf',"网易WDF动画",0xA0000001).精灵} -- 人物属性界面字体白色背景
	适应组[40] ={[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xB74E6CA1).精灵} -- 人物界面属性白色背景 老
	适应组[7] = {[0]=资源:载入('aaa.wdf',"网易WDF动画",0xA0000002).精灵} -- 金钱输入背景
	适应组[4] = {[0]=资源:载入('org.rpk',"网易WDF动画",0x1000363).精灵} -- UI的提示方块背景
	--适应组[2] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x1DD0565F).精灵} -- UI的按钮背景--原始
	-- 适应组[3] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xB74E6CA1).精灵} -- 梦幻的输入背景--原始
	-- 适应组[4] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x4BC7BD91).精灵} -- UI的提示方块背景--原始
	适应组[9] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xF5B6E157).精灵} -- 梦幻的风格喊话背景
	适应组[5] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x550F8EF4).精灵} -- 梦幻的文字信息栏背景
	适应组[6] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xB5FDF1AC).精灵} -- 梦幻的文字信息栏背景
	适应组[8] = {[0]=资源:载入('pic/xuanxiang.png',"图片")} -- 小型选项栏
	--适应组[6] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xB5FDF1AC).精灵} -- 梦幻的文字信息栏背景
	--适应组[7] = {[0]=资源:载入('org.rpk',"网易WDF动画",0x1000374).精灵} -- 经验背景
	--适应组[7] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x314C04D8).精灵} -- 经验背景
	适应组[70] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",1345707887).精灵} --传音
	适应组[71] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x80E0B578).精灵} -- 梦幻的文字信息栏背景 -- 白黑边 内半黑
	适应组[75] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xEC7D3B63).精灵} -- 梦幻的文字信息栏背景 -- 白黑边 内半黑
	--适应组[34] = {[0]=资源:载入('wzife.wdf',"网易WDF动画",0xE2C626FA).精灵} -- UI的按钮背景 加分割条
	适应组[34] = {[0]=资源:载入('org.rpk',"网易WDF动画",0x1000378).精灵} -- UI的按钮背景 加分滑块条 召唤兽选择框
	适应组[35] = {[0]=资源:载入('wzife.wd1',"网易WDF动画",0x4E5F661E).精灵} -- 梦幻的滑块分割条小   [17] = 自适应.创建(31,1,14,210,2,0),  self.资源组[17]:置颜色(-16777216)
	适应组[36] = {[0]=资源:载入('wzife.wd1',"网易WDF动画",0xEA6D0A4D).精灵} -- 梦幻的滑块分割条大 hen
	适应组[37] = {[0]=资源:载入('org.rpk',"网易WDF动画",0x1000396).精灵} -- UI的背景底图2 加分滑块条
	适应组[38] = {[0]=资源:载入('org.rpk',"网易WDF动画",0x1000384).精灵} -- UI的背景底图2 加分滑块条
	-- 按钮组
	适应组[10] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xCD9700B7)}
	适应组[11] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000385)} -- 滑块
	适应组[114] ={[0]=资源:载入('qwq.wdf',"网易WDF动画",2502361088).精灵} -- 老滑块
	适应组[12] = {按钮=资源:载入('aaa.wdf',"网易WDF动画",0x10000376)} --我弄的红色按钮
	适应组[112] = {按钮=资源:载入('ceshi.wdf',"网易WDF动画",0xFA000001)}
	适应组[17] = {按钮=资源:载入('aaa.wdf',"网易WDF动画",0xBAAAA09)} --我弄的蓝色按钮
	适应组[120] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0x0267FB16)}--原始按钮
	适应组[13] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0x8438F1FD)} -- 蓝色精致按钮

	适应组[15] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0xFD3D61F2)} -- 老上翻
	适应组[16] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0x09217E13)} --  老下翻

	--分区--########################################################?自己修改?##########################################
	适应组[31] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0xD330CE3F)}--大分区
	适应组[32] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0xBD57A592)}--小分区
	适应组[33] = {按钮=资源:载入('addon.wdf',"网易WDF动画",0x74786102)}--摆摊 中6D33D98E 大74786102 小BD80E0DB
	-- * 不可组合按钮组
	--适应组[18] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0xF11233BB)} -- 关闭按钮--原始
	-- 适应组[18] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000369)} -- 关闭按钮
	适应组[18] = {按钮=资源:载入('aaa.wdf',"网易WDF动画",0x01343E13)} -- 关闭按钮
	适应组[19] = {按钮=资源:载入('wzife.wd1',"网易WDF动画",0x5DE92E5D)} -- 单独的方块小按钮
	适应组[20] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0x335CECBC)} -- 上翻
	适应组[21] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xB7F2FF5E)} -- 下翻
	适应组[22] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0xB05126E8)} -- 道具左翻
	适应组[23] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0x26066130)} -- 道具右翻
	适应组[24] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0xBAF6A95D)} -- 灯笼
	适应组[25] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000357)} -- 加点加
	适应组[26] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000358)} -- 加点减
	适应组[27] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000359)} -- 分页按钮
	适应组[29] = {按钮=资源:载入('aaa.wdf',"网易WDF动画",20200980)} -- 方形的打钩按钮
	适应组[30] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000383)} -- 圆形的打钩按钮
	适应组[1030] = {按钮=资源:载入('155653.wdf',"网易WDF动画",0xB5D15C45)} -- 圆形的打钩按钮
	-- 适应组[22] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0xB05126E8)} -- 道具左翻
	-- 适应组[23] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0x26066130)} -- 道具右翻
	-- 适应组[25] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0xC47885C6)} -- 加点加
	-- 适应组[26] = {按钮=资源:载入('wzife.wdf',"网易WDF动画",0x5E0D32BF)} -- 加点减
	--适应组[27] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xF6B14F50)} -- 分页按钮
	-- 适应组[29] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xC9BF8D1E)} -- 方形的打钩按钮
	-- 适应组[30] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xB5D15C45)} -- 圆形的打钩按钮

	--自己后期添加
	适应组[76] = {[0]=资源:载入('org.rpk',"网易WDF动画",0x1000371).精灵} -- 新界面 九宫格
	适应组[77] = {[0]=资源:载入('org.rpk',"网易WDF动画",16777522).精灵} -- 新界面 横条
	适应组[78] = {[0]=资源:载入('org.rpk',"网易WDF动画",0x1000362).精灵} -- 灰白九宫格
	适应组[79] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x9b515ba).精灵} -- 紫色九宫格
	适应组[80] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x461dc6ad).精灵} -- 紫色横条
	适应组[88] = {[0]=资源:载入('wzife.wdf',"网易WDF动画",0xd8a21808).精灵} -- 梦幻秀
	适应组[89] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xe732e6ed).精灵} -- 淡蓝四边圆
	适应组[90] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0x146054d7).精灵} -- 草绿四边圆 0xec7d3b63
	适应组[91] = {[0]=资源:载入('common/wzife.wdf',"网易WDF动画",0xd0bf4f47).精灵} -- 任务追踪自适应0xd2ab41c6
	适应组[92] = {[0]=资源:载入('pic/zdbj.png',"图片")} --战斗状态背景
	--按钮类
	适应组[81] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xe9cd2f72)} -- 按钮白色
	适应组[82] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xadc3b197)} -- 按钮灰白（方）
	适应组[83] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0x8438f1fd)} -- 蓝黑（随园） --仓库按钮类
	适应组[84] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0x2ab667b2)} -- 正常（随圆）
	适应组[85] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xcd9700b7)} -- 石斑圆（随圆）
	适应组[86] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xa84c008)} -- 灰色小（随圆）
	适应组[87] = {按钮=资源:载入('common/wzife.wdf',"网易WDF动画",0xd12ac106)} -- 白色上（椭圆）
	适应组[100] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000271)} -- 新界面 关闭按钮
	适应组[101] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000387)} -- 单选下
	适应组[102] = {按钮=资源:载入('org.rpk',"网易WDF动画",0x1000386)} -- 单选上
	-- 适应组[103] = {[0]=资源:载入('pic',"网易WDF动画","huise")}
	适应组[103] = {[0]=资源:载入('pic/huise.png',"图片")} --战斗状态背景--{[0]=资源:载入('org.rpk',"网易WDF动画",0x1000361).精灵} -- 小型选项
	适应组[104] = {[0]=资源:载入('aaa.wdf',"网易WDF动画",0XF11233BD).精灵} --长白条输入框自适应
	适应组[41] ={[0]=资源:载入('pic/stzsy.png',"图片")}
	适应组[73] = {按钮=pwddd("2245")}

	-- 老按钮短 = 2043682318
	-- 老按钮中 = 2262199194
	-- 老按钮长 = 3529552980
	for n=10,27 do
		if 适应组[n] ~= nil then
			适应组[n][0] = 适应组[n].按钮.精灵.纹理
			for i=1,3 do
			    适应组[n].按钮.当前帧 = 适应组[n].按钮.当前帧 + 1
			    适应组[n].按钮:更新纹理()
			    适应组[n][i] = 适应组[n].按钮.精灵.纹理
			end
			适应组[n].按钮 = nil
			for i=1,4 do
				适应组[n][i-1] = __jls(适应组[n][i-1])
			end
		end
	end

	for n=43,45 do
		if 适应组[n] ~= nil then
			适应组[n][0] = 适应组[n].按钮.精灵.纹理
			for i=1,3 do
			    适应组[n].按钮.当前帧 = 适应组[n].按钮.当前帧 + 1
			    适应组[n].按钮:更新纹理()
			    适应组[n][i] = 适应组[n].按钮.精灵.纹理
			end
			适应组[n].按钮 = nil
			for i=1,4 do
				适应组[n][i-1] = __jls(适应组[n][i-1])
			end
		end
	end

	if 适应组[112] ~= nil then
			适应组[112][0] = 适应组[112].按钮.精灵.纹理
			for i=1,3 do
			    适应组[112].按钮.当前帧 = 适应组[112].按钮.当前帧 + 1
			    适应组[112].按钮:更新纹理()
			    适应组[112][i] = 适应组[112].按钮.精灵.纹理
			end
			适应组[112].按钮 = nil
			for i=1,4 do
				适应组[112][i-1] = __jls(适应组[112][i-1])
			end
		end
	if 适应组[120] ~= nil then --老按钮  弄这个按钮的时候闪退了一下
		适应组[120][0] = 适应组[120].按钮.精灵.纹理
		for i=1,3 do
		    适应组[120].按钮.当前帧 = 适应组[120].按钮.当前帧 + 1
		    适应组[120].按钮:更新纹理()
		    适应组[120][i] = 适应组[120].按钮.精灵.纹理
		end
		适应组[120].按钮 = nil
		for i=1,4 do
			适应组[120][i-1] = __jls(适应组[120][i-1])
		end
	end
	for n=1030,1030 do
		if 适应组[n] ~= nil then
			适应组[n][0] = 适应组[n].按钮.精灵.纹理
			for i=1,5 do
			    适应组[n].按钮.当前帧 = 适应组[n].按钮.当前帧 + 1
			    适应组[n].按钮:更新纹理()
			    适应组[n][i] = 适应组[n].按钮.精灵.纹理
			end
			适应组[n].按钮 = nil
			for i=1,5 do
				适应组[n][i-1] = __jls(适应组[n][i-1])
				if i-1 ~= 2 then
					适应组[n][i-1]._obj:SetTextureRect(0,0,26,适应组[n][i-1].高度-2)
				end
			end

		end
	end
	for n=29,30 do
		if 适应组[n] ~= nil then
			适应组[n][0] = 适应组[n].按钮.精灵.纹理
			for i=1,5 do
			    适应组[n].按钮.当前帧 = 适应组[n].按钮.当前帧 + 1
			    适应组[n].按钮:更新纹理()
			    适应组[n][i] = 适应组[n].按钮.精灵.纹理
			end
			适应组[n].按钮 = nil
			for i=1,5 do
				适应组[n][i-1] = __jls(适应组[n][i-1])
				if i-1 ~= 2 then
					适应组[n][i-1]._obj:SetTextureRect(0,0,26,适应组[n][i-1].高度-2)
				end
			end
		end
	end
	for n=31,32 do--########################################################?自己修改?##########################################

		if 适应组[n] ~= nil then
			适应组[n][0] = 适应组[n].按钮.精灵.纹理
			for i=1,3 do
			    适应组[n].按钮.当前帧 = 适应组[n].按钮.当前帧 + 1
			    适应组[n].按钮:更新纹理()
			    适应组[n][i] = 适应组[n].按钮.精灵.纹理
			end
			适应组[n].按钮 = nil
			for i=1,4 do
				适应组[n][i-1] = __jls(适应组[n][i-1])
			end
		end
	end
	if 适应组[33] ~= nil then
		适应组[33][0] = 适应组[33].按钮.精灵.纹理
		for i=1,3 do
		    适应组[33].按钮.当前帧 = 适应组[33].按钮.当前帧 + 1
		    适应组[33].按钮:更新纹理()
		    适应组[33][i] = 适应组[33].按钮.精灵.纹理
		end
		适应组[33].按钮 = nil
		for i=1,4 do
			适应组[33][i-1] = __jls(适应组[33][i-1])
		end
	end
	for n=81,87 do
		if 适应组[n] ~= nil then
			适应组[n][0] = 适应组[n].按钮.精灵.纹理
			for i=1,3 do
			    适应组[n].按钮.当前帧 = 适应组[n].按钮.当前帧 + 1
			    适应组[n].按钮:更新纹理()
			    适应组[n][i] = 适应组[n].按钮.精灵.纹理
			end
			适应组[n].按钮 = nil
			for i=1,4 do
				适应组[n][i-1] = __jls(适应组[n][i-1])
			end
		end
	end
	for n=100,102 do
		if 适应组[n] ~= nil then
			适应组[n][0] = 适应组[n].按钮.精灵.纹理
			for i=1,3 do
			    适应组[n].按钮.当前帧 = 适应组[n].按钮.当前帧 + 1
			    适应组[n].按钮:更新纹理()
			    适应组[n][i] = 适应组[n].按钮.精灵.纹理
			end
			适应组[n].按钮 = nil
			for i=1,4 do
				适应组[n][i-1] = __jls(适应组[n][i-1])
			end
		end
	end
	local 按钮组啊={73}
		for n=1,#按钮组啊 do
		if 适应组[按钮组啊[n]] ~= nil then
			适应组[按钮组啊[n]][0] = 适应组[按钮组啊[n]].按钮.精灵.纹理
			for i=1,3 do
			    适应组[按钮组啊[n]].按钮.当前帧 = 适应组[按钮组啊[n]].按钮.当前帧 + 1
			    适应组[按钮组啊[n]].按钮:更新纹理()
			    适应组[按钮组啊[n]][i] = 适应组[按钮组啊[n]].按钮.精灵.纹理
			end
			适应组[按钮组啊[n]].按钮 = nil
			for i=1,4 do
				适应组[按钮组啊[n]][i-1] = __jls(适应组[按钮组啊[n]][i-1])
			end
		end
	end
	-- 开始处理图像
	local 九格组 = {0,42,111,76,2,9,4,5,6,8,70,71,75,34,37,38,78,79,88,89,90,91,92}
	local 横排组 = {10,12,43,44,46,120,3,40,7,17,1,77,13,28,72,31,32,33,36,80,81,82,83,84,85,86,87,103,73,104}
	-- 10,12,120,3,7
	local 竖排组 = {11,114,35,41}
	for i=1,#九格组 do
		-- 开始复制区域
		local 大小 = 70
		-- local 适应宽 = 650
		-- local 适应高 = 475
		local 适应宽 = 适应组[九格组[i]][0].宽度
		local 适应高 = 适应组[九格组[i]][0].高度
		if 九格组[i] == 6 or 九格组[i] == 9 or 九格组[i] == 71 then
			大小 = 12
		elseif 九格组[i] == 88 then
			--适应宽 = 270
		 	--适应高 = 190
		 	大小 = 150
		elseif 九格组[i] == 91 then
		 	大小 = 45
		 	--适应高 = 80
		end
		local 间宽 = 适应组[九格组[i]][0].宽度 - 大小
		local 间高 = 适应组[九格组[i]][0].高度 - 大小
		local 纹理 = 适应组[九格组[i]][0].纹理

		适应组[九格组[i]].左上 = {}
		适应组[九格组[i]].右上 = {}
		适应组[九格组[i]].左下 = {}
		适应组[九格组[i]].右下 = {}
		适应组[九格组[i]].左上[0] = 纹理:复制区域(0,0,适应宽,适应高)
		适应组[九格组[i]].左下[0] = 纹理:复制区域(0,间高,适应宽,大小)
		适应组[九格组[i]].右上[0] = 纹理:复制区域(间宽,0,大小,适应高)
		适应组[九格组[i]].右下[0] = 纹理:复制区域(间宽,间高,大小,大小)
		适应组[九格组[i]].大小 = 大小
		适应组[九格组[i]][0] = nil
	end
	for i=1,#横排组 do
		local 间宽 = 适应组[横排组[i]][0].宽度 - 10
		local 间高 = 适应组[横排组[i]][0].高度
		local 纹理 = 适应组[横排组[i]][0].纹理
		适应组[横排组[i]].左边 = {}
		适应组[横排组[i]].中心 = {}
		适应组[横排组[i]].右边 = {}
		适应组[横排组[i]].左边[0] = 纹理:复制区域(0,0,600,间高)
		适应组[横排组[i]].右边[0] = 纹理:复制区域(间宽,0,10,间高)
		for n=1,#适应组[横排组[i]] do
			纹理 = 适应组[横排组[i]][0+n].纹理
			适应组[横排组[i]].左边[0+n] = 纹理:复制区域(0,0,600,间高)
			适应组[横排组[i]].右边[0+n] = 纹理:复制区域(间宽,0,10,间高)
			适应组[横排组[i]][0+n] = nil
		end
		适应组[横排组[i]][0] = nil
	end
	for i=1,#竖排组 do
		local 间宽 = 适应组[竖排组[i]][0].宽度
		local 间高 = 适应组[竖排组[i]][0].高度 - 37
		local 纹理 = 适应组[竖排组[i]][0].纹理
		适应组[竖排组[i]].上边 = {}
		适应组[竖排组[i]].中心 = {}
		适应组[竖排组[i]].下边 = {}
		适应组[竖排组[i]].上边[0] = 纹理:复制区域(0,0,间宽,360)
		适应组[竖排组[i]].下边[0] = 纹理:复制区域(0,间高,间宽,37)
		for n=1,#适应组[竖排组[i]] do
			纹理 = 适应组[竖排组[i]][0+n].纹理
			适应组[竖排组[i]].上边[0+n] = 纹理:复制区域(0,0,间宽,360)
			适应组[竖排组[i]].下边[0+n] = 纹理:复制区域(0,间高,间宽,37)
			适应组[竖排组[i]][0+n] = nil
		end
		适应组[竖排组[i]][0] = nil
	end
	--collectgarbage("collect");
end



function 自适应:初始化(纹理号,数量,宽度,高度,适应方式,适应数量,jx,jy) -- 组,文件数量,宽度,高度（横适应，竖适应，九宫格）
	if 纹理号 == nil then
		return
	end
	if 纹理号 == 11 and 宽度 > 8 then
		宽度 = 8
	elseif 纹理号 == 3 and 高度 > 18 then
		高度 = 18
	end
	self.x,self.y = 0,0
	self.纹理号 = 纹理号 self.当前帧 = 0 self.宽度 = 宽度 self.高度 = 高度 self.数量 = 数量
	local 精灵 = 适应组[纹理号]
	self.大小 = 精灵.大小
	if 适应方式 == 1 then
		self.适应组 = {}
		for i=1,数量-1 do
			self.适应组[数量] = {}
		end
		self.适应组[0] = {}
		self.适应组[0][1] = __jls(精灵.左边[0],nil,nil,nil,nil,1)
		self.适应组[0][1]._obj:SetTextureRect(0,0,self.宽度-10,self.高度)
		self.适应组[0][2] = __jls(精灵.右边[0],nil,nil,nil,nil,1)
		self.适应组[0][2]._obj:SetHotSpot(-self.宽度+10,0)
		self.适应组[76] = {}
		self.适应组[76][1] = __jls(精灵.左边[0],nil,nil,nil,nil,1)
		self.适应组[76][1]._obj:SetTextureRect(0,0,self.宽度-10,self.高度)
		self.适应组[76][2] = __jls(精灵.右边[0],nil,nil,nil,nil,1)
		self.适应组[76][2]._obj:SetHotSpot(-self.宽度+10,0)
		if 数量 > 1 then
			for i=1,数量-1 do
				self.适应组[0+i] = {}
				self.适应组[0+i][1] = __jls(精灵.左边[0+i],nil,nil,nil,nil,1)
				self.适应组[0+i][1]._obj:SetTextureRect(0,0,self.宽度-10,self.高度)
				self.适应组[0+i][2] = __jls(精灵.右边[0+i],nil,nil,nil,nil,1)
				self.适应组[0+i][2]._obj:SetHotSpot(-self.宽度+10,0)
			end
		end
	elseif 适应方式 == 3  then
		self.适应组 = {}
		self.适应组[1] = __jls(精灵.左上[0],nil,nil,nil,nil,1)
		self.适应组[1]._obj:SetTextureRect(0,0,宽度-self.大小,高度-self.大小)
		self.适应组[77] = __jls(精灵.左上[0],nil,nil,nil,nil,1)
		self.适应组[77]._obj:SetTextureRect(0,0,宽度-self.大小,高度-self.大小)
		self.适应组[2] = __jls(精灵.左下[0],nil,nil,nil,nil,1)
		self.适应组[2]._obj:SetTextureRect(0,0,宽度-self.大小,self.大小)
		self.适应组[2]._obj:SetHotSpot(0,-高度+self.大小)
		self.适应组[3] = __jls(精灵.右上[0],nil,nil,nil,nil,1)
		self.适应组[3]._obj:SetTextureRect(0,0,self.大小,高度-self.大小)
		self.适应组[3]._obj:SetHotSpot(-宽度+self.大小,0)
		self.适应组[4] = __jls(精灵.右下[0],nil,nil,nil,nil,1)
		self.适应组[4]._obj:SetHotSpot(-宽度+self.大小,-高度+self.大小)


 	elseif 适应方式 == 8  then
		self.适应组 = {}
		self.适应组[1] = __jls(精灵.左上[0],nil,nil,nil,nil,1)
		self.适应组[1]._obj:SetTextureRect(0,0,宽度-self.大小,高度-self.大小)
		self.适应组[77] = __jls(精灵.左上[0],nil,nil,nil,nil,1)
		self.适应组[77]._obj:SetTextureRect(0,0,宽度-self.大小,高度-self.大小)
		self.适应组[2] = __jls(精灵.左下[0],nil,nil,nil,nil,1)
		self.适应组[2]._obj:SetTextureRect(0,0,宽度-self.大小,self.大小)
		self.适应组[2]._obj:SetHotSpot(0,-高度+self.大小)
		self.适应组[3] = __jls(精灵.右上[0],nil,nil,nil,nil,1)
		self.适应组[3]._obj:SetTextureRect(0,0,self.大小,高度-self.大小)
		self.适应组[3]._obj:SetHotSpot(-宽度+self.大小,0)
		self.适应组[4] = __jls(精灵.右下[0],nil,nil,nil,nil,1)
		self.适应组[4]._obj:SetHotSpot(-宽度+self.大小,-高度+self.大小)



	elseif 适应方式 == 2 then
		self.适应组 = {}
		for i=1,数量-1 do
			self.适应组[数量] = {}
		end
		self.适应组[0] = {}
		self.适应组[0][1] = __jls(精灵.上边[0],nil,nil,nil,nil,1)
		self.适应组[0][1]._obj:SetTextureRect(0,0,self.宽度,self.高度-37)
		self.适应组[0][2] = __jls(精灵.下边[0],nil,nil,nil,nil,1)
		self.适应组[0][2]._obj:SetHotSpot(0,-self.高度+37)
		self.适应组[76] = {}
		self.适应组[76][1] = __jls(精灵.上边[0],nil,nil,nil,nil,1)
		self.适应组[76][1]._obj:SetTextureRect(0,0,self.宽度,self.高度-37)
		self.适应组[76][2] = __jls(精灵.下边[0],nil,nil,nil,nil,1)
		self.适应组[76][2]._obj:SetHotSpot(0,-self.高度+37)
		if 数量 > 1 then
			for i=1,数量-1 do
				self.适应组[0+i] = {}
				self.适应组[0+i][1] = __jls(精灵.上边[0+i],nil,nil,nil,nil,1)
				self.适应组[0+i][1]._obj:SetTextureRect(0,0,self.宽度,self.高度-37)
				self.适应组[0+i][2] = __jls(精灵.下边[0+i],nil,nil,nil,nil,1)
				self.适应组[0+i][2]._obj:SetHotSpot(0,-self.高度+37)
			end
		end
	end
	self.适应方式 = 适应方式
end

function 自适应:置宽高(宽度,高度) -- 组,文件数量,宽度,高度（横适应，竖适应，九宫格）
	if self.纹理号 == 11 and 宽度 > 8 then
		宽度 = 8
	elseif self.纹理号 == 3 and 高度 > 18 then
		高度 = 18
	end
	self.宽度 = 宽度 self.高度 = 高度
	if self.适应方式 == 3 then
		self.适应组[1]._obj:SetTextureRect(0,0,宽度-self.大小,高度-self.大小)
		self.适应组[77]._obj:SetTextureRect(0,0,宽度-self.大小,高度-self.大小)
		self.适应组[2]._obj:SetTextureRect(0,0,宽度-self.大小,self.大小)
		self.适应组[2]._obj:SetHotSpot(0,-高度+self.大小)
		self.适应组[3]._obj:SetTextureRect(0,0,self.大小,高度-self.大小)
		self.适应组[3]._obj:SetHotSpot(-宽度+self.大小,0)
		self.适应组[4]._obj:SetHotSpot(-宽度+self.大小,-高度+self.大小)
	elseif self.适应方式 == 1 then
		self.适应组[0][1]._obj:SetTextureRect(0,0,宽度-10,高度)
		self.适应组[0][2]._obj:SetHotSpot(-宽度+10,0)
		self.适应组[76][1]._obj:SetTextureRect(0,0,宽度-10,高度)
		self.适应组[76][2]._obj:SetHotSpot(-宽度+10,0)
		for i=1,self.数量-1 do
			self.适应组[0+i][1]._obj:SetTextureRect(0,0,宽度-10,高度)
			self.适应组[0+i][2]._obj:SetHotSpot(-宽度+10,0)
		end
	elseif self.适应方式 == 2 then
		self.适应组[0][1]._obj:SetTextureRect(0,0,宽度,高度-37)
		self.适应组[0][2]._obj:SetHotSpot(0,-高度+37)
		self.适应组[76][1]._obj:SetTextureRect(0,0,宽度,高度-37)
		self.适应组[76][2]._obj:SetHotSpot(0,-高度+37)
		for i=1,self.数量-1 do
			self.适应组[0+i][1]._obj:SetTextureRect(0,0,宽度,高度-37)
			self.适应组[0+i][2]._obj:SetHotSpot(0,-高度+37)
		end
	end
end

function 自适应:置宽高1(宽度,高度)
	if self.纹理号 == 11 and 宽度 > 8 then
		宽度 = 8
	elseif self.纹理号 == 3 and 高度 > 18 then
		高度 = 18
	end
	self.适应组[0][1]._obj:SetTextureRect(0,0,宽度-10,高度)
	self.适应组[0][2]._obj:SetHotSpot(-宽度+10,0)
	self.适应组[76][1]._obj:SetTextureRect(0,0,宽度-10,高度)
	self.适应组[76][2]._obj:SetHotSpot(-宽度+10,0)
	for i=1,self.数量-1 do
		self.适应组[0+i][1]._obj:SetTextureRect(0,0,宽度-10,高度)
		self.适应组[0+i][2]._obj:SetHotSpot(-宽度+10,0)
	end
end

function 自适应:置宽高3(宽度,高度)
	if self.纹理号 == 11 and 宽度 > 8 then
		宽度 = 8
	elseif self.纹理号 == 3 and 高度 > 18 then
		高度 = 18
	end
	self.适应组[1]._obj:SetTextureRect(0,0,宽度-self.大小,高度-self.大小)
	self.适应组[77]._obj:SetTextureRect(0,0,宽度-self.大小,高度-self.大小)
	self.适应组[2]._obj:SetTextureRect(0,0,宽度-self.大小,self.大小)
	self.适应组[2]._obj:SetHotSpot(0,-高度+self.大小)
	self.适应组[3]._obj:SetTextureRect(0,0,self.大小,高度-self.大小)
	self.适应组[3]._obj:SetHotSpot(-宽度+self.大小,0)
	self.适应组[4]._obj:SetHotSpot(-宽度+self.大小,-高度+self.大小)
end

function 自适应:置区域(x,y,w,h)
	self.宽度,self.高度 = w,h
	if self.适应方式 == 3 then
		self.适应组[1]._obj:SetTextureRect(x,y,w,h)
		self.适应组[77]._obj:SetTextureRect(x,y,w,h)
		self.适应组[2]._obj:SetTextureRect(x,y,w,h)
		self.适应组[3]._obj:SetTextureRect(x,y,w,h)
		self.适应组[4]._obj:SetTextureRect(x,y,w,h)
	elseif self.适应方式 == 1 or self.适应方式 == 2 then
		self.适应组[self.当前帧][1]._obj:SetTextureRect(x,y,w,h)
		self.适应组[self.当前帧][2]._obj:SetTextureRect(x,y,w,h)
	elseif self.适应方式 == 4 then
		for i=0,4 do

			适应组[self.纹理号][i]._obj:SetTextureRect(x,y,w,h)
		end
	end
end

function 自适应:是否选中(x,y)
	return x>=self.x and x<=self.x+self.宽度 and y>=self.y and y<=self.y+self.高度
end

function 自适应:更新纹理()
end

function 自适应:置颜色(v,i)
	if self.适应方式 == 3 then
		self.适应组[1]._obj:SetColor(v,i or -1)
		self.适应组[77]._obj:SetColor(v,i or -1)
		self.适应组[2]._obj:SetColor(v,i or -1)
		self.适应组[3]._obj:SetColor(v,i or -1)
		self.适应组[4]._obj:SetColor(v,i or -1)
	elseif self.适应方式 == 1 or self.适应方式 == 2 then
		self.适应组[self.当前帧][1]._obj:SetColor(v,i or -1)
		self.适应组[self.当前帧][2]._obj:SetColor(v,i or -1)
	elseif self.适应方式 == 4 then
		适应组[self.纹理号][self.当前帧]._obj:SetColor(v,i or -1)
	end
end

function 自适应:显示(x,y)
	-- if self.纹理号 == 12 then
	-- 	y=y+2
	if self.纹理号 == 3 then
		y=y+2
	end
	if self.适应方式 == 3 then
		for i=1,4 do
			self.适应组[i]._obj:SetPosition(x,y)
			self.适应组[i]._obj:Render()
		end
	elseif self.适应方式 == 1 or self.适应方式 == 2 then
		for i=1,2 do
			self.适应组[self.当前帧][i]._obj:SetPosition(x,y)
			self.适应组[self.当前帧][i]._obj:Render()
		end
	elseif self.适应方式 == 4 then
		适应组[self.纹理号][self.当前帧]._obj:SetPosition(x,y)
		适应组[self.纹理号][self.当前帧]._obj:Render()

  	elseif self.适应方式 == 8 then
		适应组[self.纹理号][self.当前帧]._obj:SetPosition(x,y)
		适应组[self.纹理号][self.当前帧]._obj:Render()

	end
	self.x,self.y=x,y
end

return 自适应