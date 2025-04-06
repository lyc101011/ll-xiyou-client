-- @Author: baidwwy
-- @Date:   2024-03-05 15:36:13
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-11-10 20:32:13
-- @Author: baidwwy
-- @Date:   2023-08-31 22:54:45
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-03-07 18:11:43
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-05-12 21:30:06
--======================================================================--
function 引擎.取头像(jp)
	local jps = {}
	if jp == "虎头怪" then
		-- jps[1] = 4
		jps[2] = 1845064969
		jps[3] = 2571786186
		jps[4] = 1584078605
		jps[5] = 3359055550
		jps[6] = 865988562
		jps[7] = "wzife.wdf"
		jps[8] = 682815547
		jps[9] = "wzife.wd3"
		elseif jp == "影精灵" then
		jps[2] = 0x00000913 	--小头像
		jps[3] = 0x00000917 	---道具头像99*13
		jps[4] = 0x00000908 	--对话头像大
		jps[5] = 0x00000917  	--65*65
		jps[6] = 0X00000908		--可无	 --小小
		jps[7] = "cwmx.wdf"
		jps[8] = 0x00000909
		jps[9] = "wzife.wd3"
	elseif jp == "影精灵1" then
		jps[2] = 0x00000914	--小头像
		jps[3] = 0x00000918 	---道具头像99*13
		jps[4] = 0x00000908 	--对话头像大
		jps[5] = 0x00000918   	--65*65
		jps[6] = 0X00000908		--可无
		jps[8] = 0x00000910  	 --小小
		jps[7] = "cwmx.wdf"
		jps[9] = "wzife.wd3"
	elseif jp == "影精灵2" then
		jps[2] = 0x00000915 	--小头像
		jps[3] = 0x00000919 	---道具头像99*13
		jps[4] = 0x00000908 	--对话头像大
		jps[5] = 0x00000919  	--65*65
		jps[6] = 0x00000908		--可无
		jps[8] = 0x00000911  	 --小小
		jps[7] = "cwmx.wdf"
		jps[9] = "wzife.wd3"
	elseif jp == "影精灵3" then
		jps[2] = 0x00000916 	--小头像
		jps[3] = 0x00000920 	---道具头像99*13
		jps[4] = 0x00000908 	--对话头像大
		jps[5] = 0x00000920   	--65*65
		jps[6] = 0x00000908		--可无
		jps[8] = 0x00000912  	 --小小
		jps[7] = "cwmx.wdf"
		jps[9] = "wzife.wd3"
	elseif jp == "舞天姬" then
		-- jps[1] = 9 --1610184778
		jps[2] = 4183923439
		jps[3] = 837105923
		jps[4] = 3547289847
		jps[5] = 2410388328
		jps[6] = 783365583
		jps[7] = "wzife.wdf"
		jps[8] = 729585859
		jps[9] = "wzife.wd3"
	elseif jp == "龙太子" then
		-- jps[1] = 7
		jps[2] = 2968964991
		jps[3] = 3724855951
		jps[4] = 269238848
		jps[5] = 1570362097
		jps[6] = 2585947038
		jps[7] = "wzife.wdf"
		jps[8] = 268541173
		jps[9] = "wzife.wd3"
	elseif jp == "神天兵" then
		-- jps[1] = 3805405383
		jps[2] = 3633356312
		jps[3] = 2078571550
		jps[4] = 419903813
		jps[5] = 3805405383
		jps[6] = 2041810656
		jps[7] = "wzife.wdf"
		jps[8] = 1709491641
		jps[9] = "wzife.wd3"
	elseif jp == "逍遥生" then
		-- jps[1] = 16
		jps[2] = 3988784113
		jps[3] = 2557559806
		jps[4] = 4177070114
		jps[5] = 3996010872
		jps[6] = 92987728

		jps[7] = "wzife.wdf"
		jps[8] = 2295255222
		jps[9] = "wzife.wd3"
	elseif jp == "偃无师" then
		-- jps[1] = 21
		jps[2] = 10559816
		jps[3] = 10559817
		jps[4] = 10559815
		jps[5] = 10559824
		jps[6] = 10559814
		jps[7] = "common/wzife.wdf"--"wzife.wd5"
		jps[8] = 1674272704
		jps[9] = "common/wzife.wdf"
	elseif jp == "玄彩娥" then
		-- jps[1] = 17
		jps[2] = 1823274963
		jps[3] = 1560323955
		jps[4] = 2423018618
		jps[5] = 947503475
		jps[6] = 838654255
		jps[7] = "wzife.wdf"
		jps[8] = 1897575802 --1897575802
		jps[9] = "wzife.wd3"
	elseif jp == "杀破狼" then
		-- jps[1] = 23
		jps[2] = 2873683137
		jps[3] = 2518794069
		jps[4] = 3753428933
		jps[5] = 1033988096
		jps[6] = 1978306148
		jps[7] = "wzife.wdf"
		jps[8] = 2493964791
		jps[9] = "wzife.wd3"
	elseif jp == "鬼潇潇" then
		-- jps[1] = 19
		jps[2] = 10559800
		jps[3] = 10559809
		jps[4] = 10559801
		jps[5] = 10559826
		jps[6] = 10559808
		jps[7] = "common/wzife.wdf"--"wzife.wd5"
		jps[8] = 2577690333
		jps[9] = "common/wzife.wdf"
	elseif jp == "桃夭夭" then
		-- jps[1] = 20
		jps[2] = 10559810
		jps[3] = 10559813
		jps[4] = 10559811
		jps[5] = 10559825
		jps[6] = 10559812
		jps[7] = "common/wzife.wdf"--"wzife.wd5"
		jps[8] = 240545518
		jps[9] = "common/wzife.wdf"
	elseif jp == "巫蛮儿" then
		-- jps[1] = 22
		jps[2] = 1969001626
		jps[3] = 4127390861
		jps[4] = 1288146214
		jps[5] = 2569948308
		jps[6] = 2921462013
		jps[7] = "wzife.wdf"
		jps[8] = 350754450
		jps[9] = "wzife.wd3"
	elseif jp == "英女侠" then
		-- jps[1] = 18
		jps[2] = 4082176052
		jps[3] = 1714055813
		jps[4] = 112453972
		jps[5] = 1619905405
		jps[6] = 3703514110
		jps[7] = "wzife.wdf"
		jps[8] = 2816469774
		jps[9] = "wzife.wd3"
	elseif jp == "狐美人" then
		-- jps[1] = 3
		jps[2] = 193125810
		jps[3] = 1337913854
		jps[4] = 3274417234
		jps[5] = 764631086
		jps[6] = 507487855
		jps[7] = "wzife.wdf"
		jps[8] = 2398918162 --3745008152
		jps[9] = "wzife.wd3"
	elseif jp == "剑侠客" then
		-- jps[1] = 5
		jps[2] = 3615876352
		jps[3] = 3402595886
		jps[4] = 1410056737
		jps[5] = 366914688
		jps[6] = 485626985
		jps[7] = "wzife.wdf"
		jps[8] = 2029853147
		jps[9] = "wzife.wd3"
	elseif jp == "羽灵神" then
		-- jps[1] = 24
		jps[2] = 4194685178
		jps[3] = 983360139
		jps[4] = 1939929797
		jps[5] = 311711491
		jps[6] = 415704253
		jps[7] = "wzife.wdf"
		jps[8] = 2376797415 --492527331
		jps[9] = "wzife.wd3"
	elseif jp == "飞燕女" then
		-- jps[1] = 1
		jps[2] = 343987807
		jps[3] = 2821539099
		jps[4] = 1784035300
		jps[5] = 819471807
		jps[6] = 3149034421
		jps[7] = "wzife.wdf"
		jps[8] = 1797451587
		jps[9] = "wzife.wd3"
	elseif jp == "巨魔王" then
		-- jps[1] = 6
		jps[2] = 1285321634
		jps[3] = 2476120802
		jps[4] = 3683691832
		jps[5] = 4077790929
		jps[6] = 3295538630
		jps[7] = "wzife.wdf"
		jps[8] = 868047251 --3026821695  "wzife.wdf"
		jps[9] = "wzife.wd3"
	elseif jp == "骨精灵" then
		-- jps[1] = 2
		jps[2] = 1580183394
		jps[3] = 2126719765
		jps[4] = 3992137269
		jps[5] = 1433642861
		jps[6] = 2072196139
		jps[7] = "wzife.wdf"
		jps[8] = 4126416397
		jps[9] = "wzife.wd3"

	--########################################################?自己修改?##########################################
	--########################################################?自己修改?##########################################
	elseif jp == "新二大王" then
		jps[4] = "0x2478FFCE"
		jps[7] = ""
	elseif jp == "新孙悟空" then
		jps[4] = 0x3FA3472C
		jps[7] = "wzife.wdf"
	elseif jp == "新猪八戒" then --jp == "猪八戒" or
		jps[4] = 0x93557CA2
		jps[7] = "wzife.wdf"
	-- elseif jp == "巫奎虎_助战" then
	-- 	jps[1] = 16777298
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "二郎神_助战" then
	-- 	jps[1] = 16777237
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "地涌夫人_助战" then
	-- 	jps[1] = 16777232
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "晶晶姑娘_助战" then
	-- 	jps[1] = 16777249
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "九灵元圣_助战" then
	-- 	jps[1] = 16777283
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "程咬金_助战" then
	-- 	jps[1] = 16777220
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "青狮精_助战" then
	-- 	jps[1] = 16777252
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "地藏菩萨_助战" then
	-- 	jps[1] = 16777223
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "观音菩萨_助战" then
	-- 	jps[1] = 16777240
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "李天王_助战" then
	-- 	jps[1] = 16777264
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "东海龙王_助战" then
	-- 	jps[1] = 16777267
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "牛魔王_助战" then
	-- 	jps[1] = 16777268
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "菩提老祖_助战" then
	-- 	jps[1] = 16777271
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "沙和尚_助战" then
	-- 	jps[1] = 16777286
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "孙婆婆_助战" then
	-- 	jps[1] = 16777289
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "齐天大圣_助战" then
	-- 	jps[1] = 16777280
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "阎罗王_助战" then
	-- 	jps[1] = 16777301
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "镇元子_助战" then
	-- 	jps[1] = 16777304
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "成周妖皇_助战" then
	-- 	jps[1] = 16777217
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "猪八戒_助战" then
	-- 	jps[1] = 16777313
	-- 	jps[7] = "org.rpk"
	-- elseif jp == "九头虫_助战" then
	-- 	jps[1] = 16777255
	-- 	jps[7] = "org.rpk"
	elseif jp == "虎头怪新全身" then
		jps[2] = 0x1000034
		jps[3] = 0x1000052
		jps[4] ="org3.rpk"
	elseif jp == "舞天姬新全身" then
		jps[2] = 0x1000026
		jps[3] = 0x1000051
		jps[4] ="org3.rpk"
	elseif jp == "龙太子新全身" then
		jps[2] = 0x1000031
		jps[3] = 0x1000050
		jps[4] ="org3.rpk"
	elseif jp == "神天兵新全身" then
		jps[2] = 0x1000029
		jps[3] = 0x1000053
		jps[4] ="org3.rpk"
	elseif jp == "逍遥生新全身" then
		jps[2] = 0x1000025
		jps[3] = 0x1000054
		jps[4] ="org3.rpk"
	elseif jp == "偃无师新全身" then
		jps[2] = 0x1000023
		jps[3] = 0x1000049
		jps[4] ="org3.rpk"
	elseif jp == "玄彩娥新全身" then
		jps[2] = 0x1000024
		jps[3] = 0x1000048
		jps[4] ="org3.rpk"
	elseif jp == "杀破狼新全身" then
		jps[2] = 0x1000030
		jps[3] = 0x1000047
		jps[4] ="org3.rpk"
	elseif jp == "鬼潇潇新全身" then
		jps[2] = 0x1000036
		jps[3] = 0x1000046
		jps[4] ="org3.rpk"
	elseif jp == "桃夭夭新全身" then
		jps[2] = 0x1000028
		jps[3] = 0x1000045
		jps[4] ="org3.rpk"
	elseif jp == "巫蛮儿新全身" then
		jps[2] = 0x1000027
		jps[3] = 0x1000044
		jps[4] ="org3.rpk"
	elseif jp == "英女侠新全身" then
		jps[2] = 0x1000022
		jps[3] = 0x1000043
		jps[4] ="org3.rpk"
	elseif jp == "狐美人新全身" then
		jps[2] = 0x1000035
		jps[3] = 0x1000042
		jps[4] ="org3.rpk"
	elseif jp == "剑侠客新全身" then
		jps[2] = 0x1000033
		jps[3] = 0x1000076
		jps[4] ="org3.rpk"
	elseif jp == "羽灵神新全身" then
		jps[2] = 0x1000021
		jps[3] = 0x1000057
		jps[4] ="org3.rpk"
	elseif jp == "飞燕女新全身" then
		jps[2] = 0x1000038
		jps[3] = 0x1000041
		jps[4] ="org3.rpk"
	elseif jp == "巨魔王新全身" then
		jps[2] = 0x1000032
		jps[3] = 0x1000058
		jps[4] ="org3.rpk"
	elseif jp == "骨精灵新全身" then
		jps[2] = 0x1000037
		jps[3] = 0x1000040
		jps[4] ="org3.rpk"
	elseif jp == "梦幻精灵" then
		jps[2] = 0x4f8bd202
		jps[7] ="wzife.wdf"
	elseif jp == "梦幻精灵小" then
		jps[2] = 899185117
		jps[7] ="common/wzife.wdf"
	elseif jp == "系统" then
		jps[2] = 0x28a47088
		jps[7] ="common/wzife.wdf"
	elseif jp == "狐不归" or jp == "进阶狐不归"then
		jps[1] = 0x1000136
		jps[2] = 0x1000137
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "花铃"or jp == "进阶花铃" then
		jps[1] = 0x1000134
		jps[2] = 0x1000135
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "月影仙"or jp == "进阶月影仙" then
		jps[1] = 0x1000143
		jps[2] = 0x1000144
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "云游火"or jp == "进阶云游火" then
		jps[1] = 0x1000138
		jps[2] = 0x1000139
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "超级神鼠"or jp == "进阶超级神鼠" then
		jps[1] = 0x1000127
		jps[2] = 0x1000126
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "超级神狗" or jp == "进阶超级神狗"then
		jps[1] = 0x1000122
		jps[2] = 0x1000145
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "超级神猪"or jp == "进阶超级神猪" then
		jps[1] = 0x1000120
		jps[2] = 0x1000121
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "超级猪小戒" or jp == "进阶超级猪小戒" then
		jps[1] = 0x1000128
		jps[2] = 0x1000129
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "超级飞天" or jp == "进阶超级飞天" then
		jps[1] = 0x1000140
		jps[2] = 0x1000123
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "谛听" then
		jps[1] = 0x1000146
		jps[2] = 0x1000146
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	elseif jp == "进阶谛听" then
		jps[1] = 0x1000131
		jps[2] = 0x1000130
		jps[7] = "org3.rpk"
		jps[8] = "org3.rpk"
	-- elseif jp == "超级鲲鹏" or jp == "进阶超级鲲鹏" then
	-- 	jps[1] = 0x1000354
	-- 	jps[2] = 0x1000351
	-- 	jps[7] = "org.rpk"
	-- 	jps[8] = "org.rpk"
	elseif jp == "超级神虎（壬寅）" or jp == "进阶超级神虎（壬寅）" then
		jps[1] = "ABAB0003"
		jps[2] = "ABAB0003"
		jps[7] = "tfg.rpk"
		jps[8] = "tfg.rpk"
	elseif jp == "广目巡守" or jp == "进阶广目巡守" then
		jps[1] = "广目巡守小头像"
		jps[2] = "广目巡守小头像"
		jps[7] = "tfg.rpk"
		jps[8] = "tfg.rpk"
	elseif jp == "沙暴" or jp == "进阶沙暴" then
		jps[1] = "沙暴头像中"
		jps[2] = "沙暴头像中"
		jps[7] = "xiaoshen.npk"
		jps[8] = "xiaoshen.npk"
	elseif jp == "超级红孩儿" or jp == "进阶超级红孩儿" then
		jps[1] = 0xDDDD0040
		jps[2] = 0xDDDD0039
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "超级神柚" or jp == "进阶超级神柚" then
		jps[1] = 0xDDDD0038
		jps[2] = 0xDDDD0037
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "超级飞廉" or jp == "进阶超级飞廉" then
		jps[1] = 0xDDDD0042
		jps[2] = 0xDDDD0042
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "自在心猿" or jp == "进阶自在心猿" then
		jps[1] = 0xDDDD0044
		jps[2] = 0xDDDD0043
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "超级恶魔泡泡" or jp == "进阶超级恶魔泡泡" then
		jps[1] = 0xE0000003    --小
		jps[2] = 0xE0000002   --大
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
    elseif jp == "幻姬"  then
		jps[1] = 0xDDDD0051
		jps[2] = 0xDDDD0043
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
    elseif jp == "进阶幻姬"  then
		jps[1] = 0xDDDD0700
		jps[2] = 0xDDDD0701
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	 elseif jp == "雷龙"  then
		jps[1] = 0xDDDD0058
		jps[2] = 0xDDDD0059
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
    elseif jp == "进阶雷龙"  then
		jps[1] = 0xDDDA0010
		jps[2] = 0xDDDA0010
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "长乐灵仙"  then
		jps[1] = 0xDDDD0074
		jps[2] = 0xDDDD0074
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "进阶长乐灵仙"  then
		jps[1] = 0xDDD90074
		jps[2] = 0xDDD90074
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "白豹"  or jp == "进阶白豹" then
		jps[1] = 0xDDDD0075
		jps[2] = 0xDDDD0075
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "魔化毗舍童子"  then
		jps[1] = 0xA0002001
		jps[2] = 0xA0002001
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
		elseif jp == "进阶魔化毗舍童子"  then
		jps[1] = 0xDDDD9180
		jps[2] = 0xDDDD9181
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
    elseif jp == "泡泡灵仙·剑侠客"   then
		jps[1] = 0xDDDD0082
		jps[2] = 0xDDDD0082
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "泡泡灵仙·骨精灵"  then
		jps[1] = 0xDDDD0083
		jps[2] = 0xDDDD0083
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "泡泡灵仙·羽灵神"   then
		jps[1] = 0xDDDD0331
		jps[2] = 0xDDDD0331
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "泡泡灵仙·巫蛮儿"  then
		jps[1] = 0xDDDD0332
		jps[2] = 0xDDDD0332
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "泡泡灵仙·飞燕女"  then
		jps[1] = 0xDDDD0333
		jps[2] = 0xDDDD0333
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "泡泡灵仙·杀破狼"  then
		jps[1] = 0xDDDD0334
		jps[2] = 0xDDDD0334
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "金翼"  then
		jps[1] = 0xDDDD0209
		jps[2] = 0xDDDD0209
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "进阶金翼"  then
		jps[1] = 0xDDDD0220
		jps[2] = 0xDDDD0220
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "觉醒涂山雪"  then
		-- jps[1] = 0xDDDD0318
		-- jps[2] = 0xDDDD0318
		-- jps[7] = "沉默.wdf"
		-- jps[8] = "沉默.wdf"
		jps[1] = 0xDDDD0327
		jps[2] = 0xDDDD0327
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "进阶觉醒涂山雪" then
		jps[1] = 0xDDDD0327
		jps[2] = 0xDDDD0327
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "月魅"  then
		jps[1] = 0x40000009
		jps[2] = 0x40000009
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "进阶月魅"  then
		jps[1] = 0x40000010
		jps[2] = 0x40000010
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "司雨"  then
		jps[1] = 0xDDDD8076
		jps[2] = 0xDDDD8077
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	elseif jp == "进阶司雨"  then
		jps[1] = 0xDDDD0689
		jps[2] = 0xDDDD0690
		jps[7] = "沉默.wdf"
		jps[8] = "沉默.wdf"
	end
	--########################################################?自己修改?##########################################
	if jps[7] ==nil and jps[4] ==nil then
	  	local jps0 = 引擎.取所有模型(jp)
		if jps0~= nil then
			if jps0.大图标~=nil and jps0.大图标 ~= "" then
				jps[1] = jps0.小图标
			end
			if jps0.小图标~=nil and jps0.小图标 ~= "" then
				jps[2] = jps0.大图标
			end
			if jps0.对话头像~=nil and jps0.对话头像 ~= "" then
				jps[4] = jps0.对话头像
			end
			jps[7] = ""
			jps[8] = ""
			jps[10] = ""
		end
	end
	if jps[1] ==nil then
		jps[1] = 0xB56ECBA9
		jps[7] = ""
	end
	if jps[2] ==nil then
	 	jps[2] = 0x338A1A07
	 	jps[8] = ""
	end
	if jps[4] ==nil then
	 	jps[4] = 0xF14B1666
	 	jps[10] = ""
	end
	return jps
end
--火星人 善财童子 哮天犬 泪妖 镜妖 进饶僧 灵猫兽  狂豹兽 灵灯 般若天女 155  165
--超级神羊  超级六耳 超级土地 超级神猴 超级神鸡 超级玉兔
function 引擎.取宝宝40头像(jp)
	local jps = {}
	if jp == "泡泡" then
		jps = "0"
	elseif jp == "树怪" then
		jps = "1"
	elseif jp == "大海龟" then
		jps = "2"
	elseif jp == "巨蛙" then
		jps = "3"
	elseif jp == "章鱼" then
		jps = "4"
	elseif jp == "海星" then
		jps = "5"
	elseif jp == "护卫" then
		jps = "6"
	elseif jp == "野猪" then
		jps = "7"
	elseif jp == "大蝙蝠" then
		jps = "8"
	elseif jp == "海毛虫" then
		jps = "9"
	elseif jp == "狸" then
		jps = "10"
	elseif jp == "强盗" then
		jps = "11"
	elseif jp == "山贼" then
		jps = "12"
	elseif jp == "赌徒" then
		jps = "13"
	elseif jp == "羊头怪" then
		jps = "14"
	elseif jp == "花妖" then
		jps = "15"
	elseif jp == "骷髅怪" then
		jps = "16"
	elseif jp == "蛤蟆精" then
		jps = "17"
	elseif jp == "老虎" then
		jps = "18"
	elseif jp == "黑熊" then
		jps = "19"
	elseif jp == "狐狸精" then
		jps = "20"
	elseif jp == "小龙女" then
		jps = "21"
	elseif jp == "狼" then
		jps = "22"
	elseif jp == "野鬼" then
		jps = "23"
	elseif jp == "虾兵" then
		jps = "24"
	elseif jp == "蟹将" then
		jps = "25"
	elseif jp == "牛妖" then
		jps = "26"
	elseif jp == "兔子怪" then
		jps = "27"
	elseif jp == "黑熊精" then
		jps = "28"
	elseif jp == "牛头" then
		jps = "29"
	elseif jp == "马面" then
		jps = "30"
	elseif jp == "僵尸" then
		jps = "31"
	elseif jp == "龟丞相" then
		jps = "32"
	elseif jp == "蜘蛛精" then
		jps = "33"
	-- elseif jp == "蝴蝶仙子" then
	-- 	jps = "34"
	elseif jp == "雷鸟人" then
		jps = "35"
	elseif jp == "白熊" then
		jps = "36"
	elseif jp == "古代瑞兽" then
		jps = "37"
	elseif jp == "黑山老妖" then
		jps = "38"
	elseif jp == "天将" then
		jps = "39"
	elseif jp == "天兵" then
		jps = "40"
	elseif jp == "风伯" then
		jps = "41"
	elseif jp == "地狱战神" then
		jps = "42"
	elseif jp == "花灵" or jp == "进阶花灵" then
		jps = "43"
	elseif jp == "蛟龙" then
		jps = "44"
	elseif jp == "凤凰" then
		jps = "45"
	elseif jp == "蚌精" then
		jps = "46"
	elseif jp == "鲛人" then
		jps = "47"
	elseif jp == "碧水夜叉" then
		jps = "48"
	elseif jp == "雨师" then
		jps = "49"
	elseif jp == "独角鬼王" then
		jps = "50"
	elseif jp == "月影仙" or jp == "进阶月影仙" then
		jps = "51"
	elseif jp == "芙蓉仙子" then
		jps = "52"
	elseif jp == "如意仙子" then
		jps = "53"
	elseif jp == "星灵仙子" then
		jps = "54"
	elseif jp == "巡游天神" then
		jps = "55"
	elseif jp == "犀牛将军人形" then
		jps = "56"
	elseif jp == "犀牛将军兽形" then
		jps = "57"
	elseif jp == "锦毛貂精" then
		jps = "58"
	elseif jp == "千年蛇魅" then
		jps = "59"
	elseif jp == "野猪精" then
		jps = "60"
	elseif jp == "百足将军" then
		jps = "61"
	elseif jp == "鼠先锋" then
		jps = "62"
	elseif jp == "泪妖" then
		jps = "63"
	elseif jp == "镜妖" then
		jps = "64"
	elseif jp == "日游神" then
		jps = "65"
	elseif jp == "吸血鬼" then
		jps = "66"
	elseif jp == "幽灵" then
		jps = "67"
	elseif jp == "灵符女娲" then
		jps = "68"
	elseif jp == "律法女娲" then
		jps = "69"
	elseif jp == "阴阳伞" then
		jps = "70"
	elseif jp == "云游火" or jp == "进阶云游火" then
		jps = "71"
	elseif jp == "玄珠灵仙" then
		jps = "72"
	elseif jp == "巨石守卫(昼)" then
		jps = "73"
	elseif jp == "狐不归"  or  jp == "进阶狐不归" then
		jps = "74"
	elseif jp == "鬼将" then
		jps = "75"
	elseif jp == "净瓶女娲" then
		jps = "76"
	elseif jp == "幽萤娃娃" then
		jps = "77"
	elseif jp == "画魂" then
		jps = "78"
	elseif jp == "巨石守卫(夜)" then
		jps = "79"
	elseif jp == "雾中仙" then
		jps = "80"
	elseif jp == "灵鹤" then
		jps = "81"
	elseif jp == "炎魔神" then
		jps = "82"
	elseif jp == "噬天虎" then
		jps = "83"
	elseif jp == "金铙僧" then
		jps = "84"
	-- elseif jp == "月魅"  or jp == "进阶月魅" then
	-- 	jps = "85"
	elseif jp == "夜游神" then
		jps = "86"
	elseif jp == "大力金刚" then
		jps = "87"
	-- elseif jp == "夜罗刹" then
	-- 	jps = "88"
	elseif jp == "琴仙" or jp == "进阶琴仙" then
		jps = "89"
	elseif jp == "踏云兽" then
		jps = "90"
	elseif jp == "红萼仙子" then
		jps = "91"
	elseif jp == "葫芦宝贝" then
		jps = "92"
	elseif jp == "猫灵兽形" then
		jps = "93"
	elseif jp == "狂豹兽形" then
		jps = "94"
	elseif jp == "蝎子精" then
		jps = "95"
	elseif jp == "龙龟" then
		jps = "96"
	elseif jp == "机关人" then
		jps = "97"
	elseif jp == "机关兽" then
		jps = "98"
	elseif jp == "机关鸟" then
		jps = "99"
	elseif jp == "连弩车" then
		jps = "100"
	elseif jp == "巴蛇" then
		jps = "101"
	elseif jp == "猫灵人形" then
		jps = "102"
	elseif jp == "狂豹人形" then
		jps = "103"
	elseif jp == "长眉灵猴" then
		jps = "104"
	elseif jp == "巨力神猿" then
		jps = "105"
	elseif jp == "修罗傀儡鬼" then
		jps = "106"
	elseif jp == "藤蔓妖花" then
		jps = "107"
	elseif jp == "无常鬼差(白)" then
		jps = "108"
	elseif jp == "无常鬼差(夜)" then
		jps = "109"
	elseif jp == "混沌兽" then
		jps = "110"
	elseif jp == "蜃气妖" then
		jps = "111"
	elseif jp == "修罗傀儡妖" then
		jps = "112"
	elseif jp == "金身罗汉" then
		jps = "113"
	elseif jp == "曼珠沙华" then
		jps = "114"
	-- elseif jp == "毗舍童子" then
	-- 	jps = "115"
	elseif jp == "真陀护法" then
		jps = "116"
	elseif jp == "灵灯侍者" then
		jps = "117"
	-- elseif jp == "涂山雪" or jp == "进阶涂山雪" then
	-- 	jps = "118"
	elseif jp == "持国巡守" then
		jps = "119"
	elseif jp == "增长巡守" then
		jps = "120"
	elseif jp == "般若天女" then
		jps = "121"
	elseif jp == "广目巡守" or  jp == "贪狼" then
		jps = "122"
	-- elseif jp == "妙华天女" then
	-- 	jps = "123"
	-- elseif jp == "谛听" or  jp == "进阶谛听" then
	-- 	jps = "124"
	-- elseif jp == "超级泡泡" then
	-- 	jps = "125"
	elseif jp == "超级神虎" then
		jps = "126"
	elseif jp == "超级大熊猫" then
		jps = "127"
	elseif jp == "超级金猴" then
		jps = "128"
	elseif jp == "超级人参娃娃" then
		jps = "129"
	elseif jp == "超级大象" then
		jps = "130"
	elseif jp == "超级筋斗云" then
		jps = "131"
	elseif jp == "超级灵狐" then
		jps = "132"
	elseif jp == "超级孔雀" then
		jps = "133"
	elseif jp == "超级神龙" then
		jps = "134"
	elseif jp == "超级神马" then
		jps = "135"
	elseif jp == "超级麒麟" then
		jps = "136"
	elseif jp == "超级神蛇" or jp == "超级腾蛇" then
		jps = "137"
	elseif jp == "超级青鸾" then
		jps = "138"
	elseif jp == "超级灵鹿" then
		jps = "139"
	elseif jp == "超级白泽" then
		jps = "140"
	elseif jp == "超级赤焰兽" then
		jps = "141"
	elseif jp == "超级大鹏" then
		jps = "142"
	elseif jp == "超级神牛" then
		jps = "143"
	elseif jp == "超级海豚" then
		jps = "144"
	elseif jp == "超级神兔" then
		jps = "145"
	elseif jp == "超级神羊" then
		jps = "146"
	elseif jp == "超级六耳猕猴" then
		jps = "147"
	elseif jp == "超级土地公公" then
		jps = "148"
	elseif jp == "超级神猴" then
		jps = "149"
	elseif jp == "超级神鸡" then
		jps = "150"
	elseif jp == "超级玉兔" then
		jps = "151"
	elseif jp == "超级神狗"  or jp == "神狗" then
		jps = "152"
	elseif jp == "超级小白龙" or jp == "小白龙" then
		jps = "153"
	elseif jp == "超级神猪" or jp == "神猪" then
		jps = "154"
	-- elseif jp == "超级飞天" or jp == "飞天" then
	-- 	jps = "155"
	elseif jp == "超级神鼠"or jp == "神鼠" then
		jps = "156"
	elseif jp == "超级猪小戒" or jp == "猪小戒" then
		jps = "157"
	-- elseif jp == "剑侠客泡泡" then
	-- 	jps = "158"
	-- elseif jp == "飞燕女泡泡" then
	-- 	jps = "159"
	-- elseif jp == "骨精灵泡泡" then
	-- 	jps = "160"
	-- elseif jp == "羽灵神泡泡" then
	 -- 	jps = "161"
	-- elseif jp == "谛听" then
	-- 	jps[1] = 0x1000146
	-- 	jps[2] = 0x1000146
	-- 	jps[7] = "org3.rpk"
	-- 	jps[8] = "org3.rpk"
	-- elseif jp == "进阶谛听" then
	-- 	jps[1] = 0x1000131
	-- 	jps[2] = 0x1000130
	-- 	jps[7] = "org3.rpk"
	-- 	jps[8] = "org3.rpk"
	-- elseif jp == "超级鲲鹏" or jp == "进阶超级鲲鹏" then
	-- 	jps[1] = 0x1000354
	-- 	jps[2] = 0x1000351
	-- 	jps[7] = "org.rpk"
	-- 	jps[8] = "org.rpk"
	elseif jp == "超级神虎（壬寅）" or jp == "进阶超级神虎（壬寅）" then
		jps[1] = "ABAB0003"
		jps[2] = "ABAB0003"
		jps[7] = "tfg.rpk"
		jps[8] = "tfg.rpk"
	elseif jp == "广目巡守" or jp == "进阶广目巡守" then
		jps[1] = "广目巡守小头像"
		jps[2] = "广目巡守小头像"
		jps[7] = "tfg.rpk"
		jps[8] = "tfg.rpk"
	-- elseif jp == "妙华天女" or jp == "进阶妙华天女" then
	-- 	jps[1] = "妙华天女头像小"
	-- 	jps[2] = "妙华天女头像小"
	-- 	jps[7] = "tfg.rpk"
	-- 	jps[8] = "tfg.rpk"
	elseif jp == "沙暴" or jp == "进阶沙暴" then
		jps[1] = "沙暴头像中"
		jps[2] = "沙暴头像中"
		jps[7] = "xiaoshen.npk"
		jps[8] = "xiaoshen.npk"

	else
         jps = "0"
	end
	return jps
end