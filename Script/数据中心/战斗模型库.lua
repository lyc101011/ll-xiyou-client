-- @Author: baidwwy
-- @Date:   2024-03-05 15:36:13
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-28 15:43:49
-- @Author: baidwwy
-- @Date:   2023-08-31 22:54:45
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-03-07 18:11:43
--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2023-05-12 21:30:06
--======================================================================--
function 引擎.取战斗模型(pg,wq)
	if pg==nil then
	    pg = "天将"
	end
	local pgs = {}
	local pg2 = pg
	local s = ""
	if wq ~= nil then
	   	s = "_"..wq
	end
	pg = pg..s
	if ZhandouModel[pg] then
	    for i=1,10 do
	    	if ZhandouModel[pg]["pgs_"..i] then
	    	    pgs[i]=ZhandouModel[pg]["pgs_"..i]
	    	end
	    end
	end

	if pgs[10] == nil then
		local jps0 = 引擎.取所有模型(pg2)
		if jps0~=nil and jps0.待战~=nil then
			pgs[1] = jps0.攻击
			pgs[2] = jps0.攻击B
			pgs[3] = jps0.倒地
			pgs[4] = jps0.防御
			pgs[6] = jps0.待战
			pgs[7] = jps0.施法
			pgs[8] = jps0.跑去
			pgs[9] = jps0.挨打
			if pg == "超级神鸡" or pg == "进阶超级神鸡"  then
			    pgs[11] = jps0.起飞失败
			end
			if jps0.资源 ~= nil then
				pgs[10] = jps0.资源
			else
				pgs[10] = ""
			end
		end
	end
	return pgs
end
-- 1是攻击 2是第二种形态攻击 3是死亡 4是防御 6是待战 7是施法 8是跑去 9是挨打 10是资源包
	ZhandouModel={}
ZhandouModel["非天(乾)_影精灵"]={
        pgs_1 = 1168
        ,pgs_2 = 1168
        ,pgs_3 = 1170
        ,pgs_4 = 1280
        ,pgs_6 = 1160
        ,pgs_7 = 1169
        ,pgs_8 = 1171
        ,pgs_9 = 1161
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 1175
        ,pgs_12 = 1176
        ,pgs_13 = 1177
    }
    ZhandouModel["非天(坤)_影精灵"]={
        pgs_1 = 1283
        ,pgs_2 = 1283
        ,pgs_3 = 1285
        ,pgs_4 = 1299
        ,pgs_6 = 1281
        ,pgs_7 = 1284
        ,pgs_8 = 1286
        ,pgs_9 = 1282
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 1296
        ,pgs_12 = 1297
        ,pgs_13 = 1298
    }

    ZhandouModel["丝萝乔木_影精灵"]={
        pgs_1 = 3
        ,pgs_2 = 3
        ,pgs_3 = 5
        ,pgs_4 = 16
        ,pgs_6 = 1
        ,pgs_7 = 4
        ,pgs_8 = 6
        ,pgs_9 = 2
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["义战(乾)_影精灵"]={
        pgs_1 = 19
        ,pgs_2 = 19
        ,pgs_3 = 21
        ,pgs_4 = 35
        ,pgs_6 = 17
        ,pgs_7 = 20
        ,pgs_8 = 22
        ,pgs_9 = 18
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 32
        ,pgs_12 = 33
        ,pgs_13 = 34
    }
    ZhandouModel["义战(坤)_影精灵"]={
        pgs_1 = 38
        ,pgs_2 = 38
        ,pgs_3 = 40
        ,pgs_4 = 54
        ,pgs_6 = 36
        ,pgs_7 = 39
        ,pgs_8 = 41
        ,pgs_9 = 37
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 51
        ,pgs_12 = 52
        ,pgs_13 = 53
    }
    ZhandouModel["九州海沸(乾)_影精灵"]={
        pgs_1 = 57
        ,pgs_2 = 57
        ,pgs_3 = 65
        ,pgs_4 = 73
        ,pgs_6 = 55
        ,pgs_7 = 64
        ,pgs_8 = 66
        ,pgs_9 = 56
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 70
        ,pgs_12 = 71
        ,pgs_13 = 72
    }
    ZhandouModel["九州海沸(坤)_影精灵"]={
        pgs_1 = 82
        ,pgs_2 = 82
        ,pgs_3 = 84
        ,pgs_4 = 98
        ,pgs_6 = 80
        ,pgs_7 = 83
        ,pgs_8 = 85
        ,pgs_9 = 81
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 89
        ,pgs_12 = 96
        ,pgs_13 = 97
    }
    ZhandouModel["九阴勾魂_影精灵"]={
        pgs_1 = 101
        ,pgs_2 = 101
        ,pgs_3 = 103
        ,pgs_4 = 114
        ,pgs_6 = 99
        ,pgs_7 = 102
        ,pgs_8 = 104
        ,pgs_9 = 100
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["八狱末劫(乾)_影精灵"]={
        pgs_1 = 117
        ,pgs_2 = 117
        ,pgs_3 = 119
        ,pgs_4 = 133
        ,pgs_6 = 115
        ,pgs_7 = 118
        ,pgs_8 = 120
        ,pgs_9 = 116
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 130
        ,pgs_12 = 131
        ,pgs_13 = 132
    }
    ZhandouModel["八狱末劫(坤)_影精灵"]={
        pgs_1 = 136
        ,pgs_2 = 136
        ,pgs_3 = 144
        ,pgs_4 = 152
        ,pgs_6 = 134
        ,pgs_7 = 137
        ,pgs_8 = 145
        ,pgs_9 = 135
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 149
        ,pgs_12 = 150
        ,pgs_13 = 151
    }
    ZhandouModel["啖月(乾)_影精灵"]={
        pgs_1 = 257
        ,pgs_2 = 257
        ,pgs_3 = 259
        ,pgs_4 = 273
        ,pgs_6 = 153
        ,pgs_7 = 258
        ,pgs_8 = 260
        ,pgs_9 = 256
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 264
        ,pgs_12 = 265
        ,pgs_13 = 272
    }
    ZhandouModel["啖月(坤)_影精灵"]={
        pgs_1 = 276
        ,pgs_2 = 276
        ,pgs_3 = 278
        ,pgs_4 = 292
        ,pgs_6 = 274
        ,pgs_7 = 277
        ,pgs_8 = 279
        ,pgs_9 = 275
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 289
        ,pgs_12 = 290
        ,pgs_13 = 291
    }
    ZhandouModel["墨玉骷髅_影精灵"]={
        pgs_1 = 295
        ,pgs_2 = 295
        ,pgs_3 = 297
        ,pgs_4 = 308
        ,pgs_6 = 293
        ,pgs_7 = 296
        ,pgs_8 = 304
        ,pgs_9 = 294
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["影精灵_双巨斧"]={
        pgs_1 = 311
        ,pgs_2 = 311
        ,pgs_3 = 313
        ,pgs_4 = 327
        ,pgs_6 = 309
        ,pgs_7 = 312
        ,pgs_8 = 320
        ,pgs_9 = 310
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 0x00000144
        ,pgs_12 = 0x00000145
        ,pgs_13 = 0x00000146
    }
    ZhandouModel["影精灵_爪刺"]={
        pgs_1 = 336
        ,pgs_2 = 336
        ,pgs_3 = 338
        ,pgs_4 = 343
        ,pgs_6 = 328
        ,pgs_7 = 337
        ,pgs_8 = 339
        ,pgs_9 = 329
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["影精灵_魔棒"]={
        pgs_1 = 352
        ,pgs_2 = 352
        ,pgs_3 = 354
        ,pgs_4 = 359
        ,pgs_6 = 344
        ,pgs_7 = 353
        ,pgs_8 = 355
        ,pgs_9 = 345
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["影精灵"]={
        pgs_1 = 352
        ,pgs_2 = 352
        ,pgs_3 = 354
        ,pgs_4 = 359
        ,pgs_6 = 344
        ,pgs_7 = 353
        ,pgs_8 = 355
        ,pgs_9 = 345
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["忘川三途_影精灵"]={
        pgs_1 = 368
        ,pgs_2 = 368
        ,pgs_3 = 370
        ,pgs_4 = 375
        ,pgs_6 = 360
        ,pgs_7 = 369
        ,pgs_8 = 371
        ,pgs_9 = 361
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["恶来(乾)_影精灵"]={
        pgs_1 = 384
        ,pgs_2 = 384
        ,pgs_3 = 386
        ,pgs_4 = 400
        ,pgs_6 = 376
        ,pgs_7 = 385
        ,pgs_8 = 387
        ,pgs_9 = 377
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 391
        ,pgs_12 = 392
        ,pgs_13 = 393
    }
    ZhandouModel["恶来(坤)_影精灵"]={
        pgs_1 = 403
        ,pgs_2 = 403
        ,pgs_3 = 405
        ,pgs_4 = 515
        ,pgs_6 = 401
        ,pgs_7 = 404
        ,pgs_8 = 406
        ,pgs_9 = 402
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 512
        ,pgs_12 = 513
        ,pgs_13 = 514
    }
    ZhandouModel["撕天_影精灵"]={
        pgs_1 = 518
        ,pgs_2 = 518
        ,pgs_3 = 520
        ,pgs_4 = 531
        ,pgs_6 = 516
        ,pgs_7 = 519
        ,pgs_8 = 521
        ,pgs_9 = 517
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["毒牙_影精灵"]={
        pgs_1 = 534
        ,pgs_2 = 534
        ,pgs_3 = 536
        ,pgs_4 = 547
        ,pgs_6 = 532
        ,pgs_7 = 535
        ,pgs_8 = 537
        ,pgs_9 = 533
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["沧海_影精灵"]={
        pgs_1 = 550
        ,pgs_2 = 550
        ,pgs_3 = 552
        ,pgs_4 = 563
        ,pgs_6 = 548
        ,pgs_7 = 551
        ,pgs_8 = 553
        ,pgs_9 = 549
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["满天星_影精灵"]={
        pgs_1 = 566
        ,pgs_2 = 566
        ,pgs_3 = 568
        ,pgs_4 = 579
        ,pgs_6 = 564
        ,pgs_7 = 567
        ,pgs_8 = 569
        ,pgs_9 = 565
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["点金棒_影精灵"]={
        pgs_1 = 582
        ,pgs_2 = 582
        ,pgs_3 = 584
        ,pgs_4 = 595
        ,pgs_6 = 580
        ,pgs_7 = 583
        ,pgs_8 = 585
        ,pgs_9 = 581
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["烬世野火(乾)_影精灵"]={
        pgs_1 = 598
        ,pgs_2 = 598
        ,pgs_3 = 600
        ,pgs_4 = 614
        ,pgs_6 = 596
        ,pgs_7 = 599
        ,pgs_8 = 601
        ,pgs_9 = 597
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 611
        ,pgs_12 = 612
        ,pgs_13 = 613
    }
    ZhandouModel["烬世野火(坤)_影精灵"]={
        pgs_1 = 617
        ,pgs_2 = 617
        ,pgs_3 = 625
        ,pgs_4 = 633
        ,pgs_6 = 615
        ,pgs_7 = 624
        ,pgs_8 = 626
        ,pgs_9 = 616
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 630
        ,pgs_12 = 631
        ,pgs_13 = 632
    }
    ZhandouModel["盘龙_影精灵"]={
        pgs_1 = 642
        ,pgs_2 = 642
        ,pgs_3 = 644
        ,pgs_4 = 649
        ,pgs_6 = 640
        ,pgs_7 = 643
        ,pgs_8 = 645
        ,pgs_9 = 641
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["破军双斧(乾)_影精灵"]={
        pgs_1 = 658
        ,pgs_2 = 658
        ,pgs_3 = 660
        ,pgs_4 = 770
        ,pgs_6 = 656
        ,pgs_7 = 659
        ,pgs_8 = 661
        ,pgs_9 = 657
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 665
        ,pgs_12 = 768
        ,pgs_13 = 769
    }
    ZhandouModel["破军双斧(坤)_影精灵"]={
        pgs_1 = 773
        ,pgs_2 = 773
        ,pgs_3 = 775
        ,pgs_4 = 789
        ,pgs_6 = 771
        ,pgs_7 = 774
        ,pgs_8 = 776
        ,pgs_9 = 772
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 786
        ,pgs_12 = 787
        ,pgs_13 = 788
    }
    ZhandouModel["离钩_影精灵"]={
        pgs_1 = 792
        ,pgs_2 = 792
        ,pgs_3 = 800
        ,pgs_4 = 805
        ,pgs_6 = 790
        ,pgs_7 = 793
        ,pgs_8 = 801
        ,pgs_9 = 791
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["竹叶青(乾)_影精灵"]={
        pgs_1 = 808
        ,pgs_2 = 808
        ,pgs_3 = 816
        ,pgs_4 = 824
        ,pgs_6 = 806
        ,pgs_7 = 809
        ,pgs_8 = 817
        ,pgs_9 = 807
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 821
        ,pgs_12 = 822
        ,pgs_13 = 823
    }
    ZhandouModel["竹叶青(坤)_影精灵"]={
        pgs_1 = 833
        ,pgs_2 = 833
        ,pgs_3 = 835
        ,pgs_4 = 849
        ,pgs_6 = 825
        ,pgs_7 = 834
        ,pgs_8 = 836
        ,pgs_9 = 832
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 840
        ,pgs_12 = 841
        ,pgs_13 = 848
    }
    ZhandouModel["红莲_影精灵"]={
        pgs_1 = 852
        ,pgs_2 = 852
        ,pgs_3 = 854
        ,pgs_4 = 865
        ,pgs_6 = 850
        ,pgs_7 = 853
        ,pgs_8 = 855
        ,pgs_9 = 851
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["细木棒_影精灵"]={
        pgs_1 = 868
        ,pgs_2 = 868
        ,pgs_3 = 870
        ,pgs_4 = 881
        ,pgs_6 = 866
        ,pgs_7 = 869
        ,pgs_8 = 871
        ,pgs_9 = 867
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["罗喉计都(乾)_影精灵"]={
        pgs_1 = 884
        ,pgs_2 = 884
        ,pgs_3 = 886
        ,pgs_4 = 900
        ,pgs_6 = 882
        ,pgs_7 = 885
        ,pgs_8 = 887
        ,pgs_9 = 883
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 897
        ,pgs_12 = 898
        ,pgs_13 = 899
    }
    ZhandouModel["罗喉计都(坤)_影精灵"]={
        pgs_1 = 903
        ,pgs_2 = 903
        ,pgs_3 = 905
        ,pgs_4 = 919
        ,pgs_6 = 901
        ,pgs_7 = 904
        ,pgs_8 = 912
        ,pgs_9 = 902
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 916
        ,pgs_12 = 917
        ,pgs_13 = 918
    }
    ZhandouModel["胭脂_影精灵"]={
        pgs_1 = 1024
        ,pgs_2 = 1024
        ,pgs_3 = 1026
        ,pgs_4 = 1031
        ,pgs_6 = 920
        ,pgs_7 = 1025
        ,pgs_8 = 1027
        ,pgs_9 = 921
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["贵霜之牙_影精灵"]={
        pgs_1 = 1040
        ,pgs_2 = 1040
        ,pgs_3 = 1042
        ,pgs_4 = 1047
        ,pgs_6 = 1032
        ,pgs_7 = 1041
        ,pgs_8 = 1043
        ,pgs_9 = 1033
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["醍醐_影精灵"]={
        pgs_1 = 1056
        ,pgs_2 = 1056
        ,pgs_3 = 1058
        ,pgs_4 = 1063
        ,pgs_6 = 1048
        ,pgs_7 = 1057
        ,pgs_8 = 1059
        ,pgs_9 = 1049
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["铁爪_影精灵"]={
        pgs_1 = 1072
        ,pgs_2 = 1072
        ,pgs_3 = 1074
        ,pgs_4 = 1079
        ,pgs_6 = 1064
        ,pgs_7 = 1073
        ,pgs_8 = 1075
        ,pgs_9 = 1065
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["降魔玉杵_影精灵"]={
        pgs_1 = 1088
        ,pgs_2 = 1088
        ,pgs_3 = 1090
        ,pgs_4 = 1095
        ,pgs_6 = 1080
        ,pgs_7 = 1089
        ,pgs_8 = 1091
        ,pgs_9 = 1081
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["雪蚕之刺_影精灵"]={
        pgs_1 = 1104
        ,pgs_2 = 1104
        ,pgs_3 = 1106
        ,pgs_4 = 1111
        ,pgs_6 = 1096
        ,pgs_7 = 1105
        ,pgs_8 = 1107
        ,pgs_9 = 1097
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["青刚刺_影精灵"]={
        pgs_1 = 1120
        ,pgs_2 = 1120
        ,pgs_3 = 1122
        ,pgs_4 = 1127
        ,pgs_6 = 1112
        ,pgs_7 = 1121
        ,pgs_8 = 1123
        ,pgs_9 = 1113
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["青藤玉树_影精灵"]={
        pgs_1 = 1136
        ,pgs_2 = 1136
        ,pgs_3 = 1138
        ,pgs_4 = 1143
        ,pgs_6 = 1128
        ,pgs_7 = 1137
        ,pgs_8 = 1139
        ,pgs_9 = 1129
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["青龙牙_影精灵"]={
        pgs_1 = 1152
        ,pgs_2 = 1152
        ,pgs_3 = 1154
        ,pgs_4 = 1159
        ,pgs_6 = 1144
        ,pgs_7 = 1153
        ,pgs_8 = 1155
        ,pgs_9 = 1145
        ,pgs_10 = "影精灵.wdf"
    }
    ZhandouModel["顽石双斧(乾)_影精灵"]={
        pgs_1 = 1302
        ,pgs_2 = 1302
        ,pgs_3 = 1304
        ,pgs_4 = 1318
        ,pgs_6 = 1300
        ,pgs_7 = 1303
        ,pgs_8 = 1305
        ,pgs_9 = 1301
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 1315
        ,pgs_12 = 1316
        ,pgs_13 = 1317
    }
    ZhandouModel["顽石双斧(坤)_影精灵"]={
        pgs_1 = 1321
        ,pgs_2 = 1321
        ,pgs_3 = 1329
        ,pgs_4 = 1337
        ,pgs_6 = 1319
        ,pgs_7 = 1328
        ,pgs_8 = 1330
        ,pgs_9 = 1320
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 1334
        ,pgs_12 = 1335
        ,pgs_13 = 1336
    }
    ZhandouModel["飞头蛮(乾)_影精灵"]={
        pgs_1 = 1346
        ,pgs_2 = 1346
        ,pgs_3 = 1348
        ,pgs_4 = 1362
        ,pgs_6 = 1344
        ,pgs_7 = 1347
        ,pgs_8 = 1349
        ,pgs_9 = 1345
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 1353
        ,pgs_12 = 1360
        ,pgs_13 = 1361
    }
    ZhandouModel["飞头蛮(坤)_影精灵"]={
        pgs_1 = 1365
        ,pgs_2 = 1365
        ,pgs_3 = 1367
        ,pgs_4 = 1381
        ,pgs_6 = 1363
        ,pgs_7 = 1366
        ,pgs_8 = 1368
        ,pgs_9 = 1364
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 1378
        ,pgs_12 = 1379
        ,pgs_13 = 1380
    }
    ZhandouModel["鲛煞(乾)_影精灵"]={
        pgs_1 = 1384
        ,pgs_2 = 1384
        ,pgs_3 = 1392
        ,pgs_4 = 1400
        ,pgs_6 = 1382
        ,pgs_7 = 1385
        ,pgs_8 = 1393
        ,pgs_9 = 1383
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 1397
        ,pgs_12 = 1398
        ,pgs_13 = 1399
    }
    ZhandouModel["鲛煞(坤)_影精灵"]={
        pgs_1 = 1409
        ,pgs_2 = 1409
        ,pgs_3 = 1411
        ,pgs_4 = 1425
        ,pgs_6 = 1401
        ,pgs_7 = 1410
        ,pgs_8 = 1412
        ,pgs_9 = 1408
        ,pgs_10 = "影精灵.wdf"
        ,pgs_11 = 1416
        ,pgs_12 = 1417
        ,pgs_13 = 1424
    }
	ZhandouModel["竹节双剑_飞燕女"]={pgs_1 = 1107292387,pgs_2 = 1107292387,pgs_3 = 0x1a7f20d6,pgs_4 = 3431990852,pgs_6 = 2150756975,pgs_7 = 2948306353,pgs_8 = 3415383948,pgs_9 = 2723304031,pgs_10 = "common/shape.wdf"}
	ZhandouModel["黄铜圈_飞燕女"]={pgs_1 = 4146113787,pgs_2 = 4146113787,pgs_3 = 3328869375,pgs_4 = 2935267523,pgs_6 = 2104438938,pgs_7 = 3418401452,pgs_8 = 867616434,pgs_9 = 2580407403,pgs_10 = "common/shape.wdf"}
	ZhandouModel["蛇形月_飞燕女"]={pgs_1 = 1584140220,pgs_2 = 1584140220,pgs_3 = 1692063004,pgs_4 = 1463150317,pgs_6 = 4215251914,pgs_7 = 3715550978,pgs_8 = 174531720,pgs_9 = 913070441,pgs_10 = "common/shape.wdf"}
	ZhandouModel["双短剑_飞燕女"]={pgs_1 = 18896713,pgs_2 = 18896713,pgs_3 = 0x919bf5dc,pgs_4 = 3950458782,pgs_6 = 0xB1488E22,pgs_7 = 3421854459,pgs_8 = 967461082,pgs_9 = 372406582,pgs_10 = "common/shape.wdf"}
	ZhandouModel["金刺轮_飞燕女"]={pgs_1 = 3720262398,pgs_2 = 3720262398,pgs_3 = 1115289817,pgs_4 = 2525078858,pgs_6 = 827935432,pgs_7 = 1403033620,pgs_8 = 2466319363,pgs_9 = 113367602,pgs_10 = "common/shape.wdf"}
	ZhandouModel["赤焰双剑_飞燕女"]={pgs_1 = 1548996612,pgs_2 = 1548996612,pgs_3 = 0xacc10e65,pgs_4 = 3742981382,pgs_6 = 2519910999,pgs_7 = 313011222,pgs_8 = 3245654395,pgs_9 = 2878513884,pgs_10 = "common/shape.wdf"}
	ZhandouModel["祖龙对剑_飞燕女"]={pgs_1 = 985733706,pgs_2 = 985733706,pgs_3 = 0x3dc61885,pgs_4 = 1544369507,pgs_6 = 3553066663,pgs_7 = 4238979964,pgs_8 = 2190872843,pgs_9 = 2053572839,pgs_10 = "common/shape.wdf"}
	ZhandouModel["紫电青霜_飞燕女"]={pgs_1 = 1709377296,pgs_2 = 1709377296,pgs_3 = 0x46384768,pgs_4 = 2079837773,pgs_6 = 2835812814,pgs_7 = 1289475462,pgs_8 = 1892940716,pgs_9 = 1899538113,pgs_10 = "common/shape.wdf"}
	ZhandouModel["浮犀_飞燕女"]={pgs_1 = 1474639442,pgs_2 = 1474639442,pgs_3 = 0xd731d412,pgs_4 = 2084990754,pgs_6 = 2071526304,pgs_7 = 1695237386,pgs_8 = 2750824335,pgs_9 = 0969736831,pgs_10 = "common/shape.wdf"}
	ZhandouModel["金玉双环_飞燕女"]={pgs_1 = 358856899,pgs_2 = 358856899,pgs_3 = 1504523359,pgs_4 = 1837818019,pgs_6 = 2360002112,pgs_7 = 1630259287,pgs_8 = 1285329813,pgs_9 = 1980919951,pgs_10 = "common/shape.wdf"}
	ZhandouModel["别情离恨_飞燕女"]={pgs_1 = 2294614510,pgs_2 = 2294614510,pgs_3 = 1412079494,pgs_4 = 1646305352,pgs_6 = 2256502232,pgs_7 = 104447335,pgs_8 = 471741487,pgs_9 = 1039274121,pgs_10 = "common/shape.wdf"}
	ZhandouModel["连理双树_飞燕女"]={pgs_1 = 2798452597,pgs_2 = 2798452597,pgs_3 = 0x60445950,pgs_4 = 111849301,pgs_6 = 3818492150,pgs_7 = 359904366,pgs_8 = 981796200,pgs_9 = 1623427017,pgs_10 = "common/shape.wdf"}
	ZhandouModel["月光双剑_飞燕女"]={pgs_1 = 2513982445,pgs_2 = 2513982445,pgs_3 = 0xcc6e99e4,pgs_4 = 2962390676,pgs_6 = 586287519,pgs_7 = 851655841,pgs_8 = 1872246816,pgs_9 = 3097886899,pgs_10 = "common/shape.wdf"}
	ZhandouModel["乾坤_飞燕女"]={pgs_1 = 3034288425,pgs_2 = 3034288425,pgs_3 = 2723272677,pgs_4 = 1960402927,pgs_6 = 3867771865,pgs_7 = 1780449233,pgs_8 = 967310259,pgs_9 = 2120714102,pgs_10 = "common/shape.wdf"}
	ZhandouModel["金龙双剪_飞燕女"]={pgs_1 = 1411197712,pgs_2 = 1411197712,pgs_3 = 0x5ab67b17,pgs_4 = 2149768266,pgs_6 = 3896276189,pgs_7 = 1274536324,pgs_8 = 3865893351,pgs_9 = 4293096481,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九天金线_飞燕女"]={pgs_1 = 256145777,pgs_2 = 256145777,pgs_3 = 805152074,pgs_4 = 612236907,pgs_6 = 1205883736,pgs_7 = 4056107702,pgs_8 = 1146798449,pgs_9 = 876728636,pgs_10 = "common/shape.wdf"}
	ZhandouModel["无关风月_飞燕女"]={pgs_1 = 2051866479,pgs_2 = 2051866479,pgs_3 = 1785158753,pgs_4 = 1982666386,pgs_6 = 3204942337,pgs_7 = 1654668611,pgs_8 = 0930614766,pgs_9 = 3051530981,pgs_10 = "common/shape.wdf"}
	ZhandouModel["朝夕_飞燕女"]={pgs_1 = 4138802289,pgs_2 = 4138802289,pgs_3 = 0258017396,pgs_4 = 0480690756,pgs_6 = 2701132789,pgs_7 = 3192094510,pgs_8 = 3576848265,pgs_9 = 1213207317,pgs_10 = "common/shape.wdf"}
	ZhandouModel["月光双环_飞燕女"]={pgs_1 = 4194305873,pgs_2 = 4194305873,pgs_3 = 2807816879,pgs_4 = 73773078,pgs_6 = 1041791674,pgs_7 = 1651978044,pgs_8 = 2848081881,pgs_9 = 3069409432,pgs_10 = "common/shape.wdf"}
	ZhandouModel["灵蛇_飞燕女"]={pgs_1 = 2306957117,pgs_2 = 2306957117,pgs_3 = 0x36e7dda5,pgs_4 = 2656017222,pgs_6 = 3801799119,pgs_7 = 2677792087,pgs_8 = 1072683373,pgs_9 = 2798173689,pgs_10 = "common/shape.wdf"}
	ZhandouModel["如意_飞燕女"]={pgs_1 = 361357102,pgs_2 = 361357102,pgs_3 = 1779832361,pgs_4 = 1983738335,pgs_6 = 1018400713,pgs_7 = 3356485876,pgs_8 = 1369851554,pgs_9 = 4083603000,pgs_10 = "common/shape.wdf"}
	ZhandouModel["阴阳_飞燕女"]={pgs_1 = 308284096,pgs_2 = 308284096,pgs_3 = 0x5514fe8,pgs_4 = 624581176,pgs_6 = 2662103332,pgs_7 = 338180652,pgs_8 = 2211026380,pgs_9 = 162524465,pgs_10 = "common/shape.wdf"}
	ZhandouModel["折扇_逍遥生"]={pgs_1 = 2964614373,pgs_2 = 2964614373,pgs_3 = 0xfa5c9e94,pgs_4 = 293936349,pgs_6 = 1375158316,pgs_7 = 3094890393,pgs_8 = 1511168433,pgs_9 = 391725534,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青铜短剑_逍遥生"]={pgs_1 = 1198108472,pgs_2 = 1198108472,pgs_3 = 1361263285,pgs_4 = 2271925935,pgs_6 = 2946567894,pgs_7 = 3149178979,pgs_8 = 3990213912,pgs_9 = 3929526014,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青锋剑_逍遥生"]={pgs_1 = 2028105319,pgs_2 = 2028105319,pgs_3 = 3791928171,pgs_4 = 2088494889,pgs_6 = 91578554,pgs_7 = 518706841,pgs_8 = 3909235980,pgs_9 = 0x9f40beb5,pgs_10 = "common/shape.wdf"}
	ZhandouModel["铁面扇_逍遥生"]={pgs_1 = 265930064,pgs_2 = 265930064,pgs_3 = 0x1e1c8c68,pgs_4 = 851934430,pgs_6 = 3398365059,pgs_7 = 1327574185,pgs_8 = 3720853183,pgs_9 = 2140890725,pgs_10 = "common/shape.wdf"}
	ZhandouModel["神火扇_逍遥生"]={pgs_1 = 809466984,pgs_2 = 809466984,pgs_3 = 0xc4a8be71,pgs_4 = 1484450534,pgs_6 = 1946292417,pgs_7 = 2773394627,pgs_8 = 3033319609,pgs_9 = 815459690,pgs_10 = "common/shape.wdf"}
	ZhandouModel["游龙剑_逍遥生"]={pgs_1 = 2298557178,pgs_2 = 2298557178,pgs_3 = 923259950,pgs_4 = 145374235,pgs_6 = 4267993677,pgs_7 = 3641474775,pgs_8 = 345371692,pgs_9 = 551366747,pgs_10 = "common/shape.wdf"}
	ZhandouModel["玉龙_逍遥生"]={pgs_1 = 291599680,pgs_2 = 291599680,pgs_3 = 0x47b23554,pgs_4 = 1026330223,pgs_6 = 3159923026,pgs_7 = 2920506479,pgs_8 = 2112187507,pgs_9 = 3163375922,pgs_10 = "common/shape.wdf"}
	ZhandouModel["魏武青虹_逍遥生"]={pgs_1 = 2954647770,pgs_2 = 2954647770,pgs_3 = 1287899115,pgs_4 = 0x6a4deb74,pgs_6 = 2567725998,pgs_7 = 2862658372,pgs_8 = 4023660358,pgs_9 = 1267402087,pgs_10 = "common/shape.wdf"}
	ZhandouModel["逍遥江湖_逍遥生"]={pgs_1 = 3459742955,pgs_2 = 3459742955,pgs_3 = 0x6eeb6938,pgs_4 = 4224277364,pgs_6 = 1818516162,pgs_7 = 3783711264,pgs_8 = 3566337709,pgs_9 = 2650676483,pgs_10 = "common/shape.wdf"}
	ZhandouModel["浩气长舒_逍遥生"]={pgs_1 = 1787687382,pgs_2 = 1787687382,pgs_3 = 0xbdf71787,pgs_4 = 2007103844,pgs_6 = 1976544695,pgs_7 = 1456930860,pgs_8 = 2385855153,pgs_9 = 3599367465,pgs_10 = "common/shape.wdf"}
	ZhandouModel["星瀚_逍遥生"]={pgs_1 = 2809028406,pgs_2 = 2809028406,pgs_3 = 0xc28e132b,pgs_4 = 0635822686,pgs_6 = 4199298440,pgs_7 = 4100767959,pgs_8 = 3470836750,pgs_9 = 0649411872,pgs_10 = "common/shape.wdf"}
	ZhandouModel["灵犀神剑_逍遥生"]={pgs_1 = 4048939390,pgs_2 = 4048939390,pgs_3 = 2956972471,pgs_4 = 0xb7aa2441,pgs_6 = 1499210091,pgs_7 = 3108724735,pgs_8 = 3464352844,pgs_9 = 1984805790,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鱼肠_逍遥生"]={pgs_1 = 111752242,pgs_2 = 111752242,pgs_3 = 2779964916,pgs_4 = 3099677412,pgs_6 = 1315883113,pgs_7 = 4096670906,pgs_8 = 3380575361,pgs_9 = 3347297766,pgs_10 = "common/shape.wdf"}
	ZhandouModel["霜冷九州_逍遥生"]={pgs_1 = 3500923187,pgs_2 = 3500923187,pgs_3 = 3419416515,pgs_4 = 4121135422,pgs_6 = 1766329695,pgs_7 = 1208240575,pgs_8 = 2948332373,pgs_9 = 0569489195,pgs_10 = "common/shape.wdf"}
	ZhandouModel["擒龙_逍遥生"]={pgs_1 = 2313480743,pgs_2 = 2313480743,pgs_3 = 1394178168,pgs_4 = 3931344485,pgs_6 = 4049254285,pgs_7 = 1046891202,pgs_8 = 2147278343,pgs_9 = 4088283715,pgs_10 = "common/shape.wdf"}
	ZhandouModel["倚天_逍遥生"]={pgs_1 = 944530413,pgs_2 = 944530413,pgs_3 = 4288693369,pgs_4 = 0xfba36656,pgs_6 = 893536575,pgs_7 = 3580840293,pgs_8 = 1513199932,pgs_9 = 1959183902,pgs_10 = "common/shape.wdf"}
	ZhandouModel["湛卢_逍遥生"]={pgs_1 = 4122820611,pgs_2 = 4122820611,pgs_3 = 39942374,pgs_4 = 0x252feb34,pgs_6 = 3879135399,pgs_7 = 1799718291,pgs_8 = 2656683712,pgs_9 = 356672046,pgs_10 = "common/shape.wdf"}
	ZhandouModel["秋风_逍遥生"]={pgs_1 = 2946234719,pgs_2 = 2946234719,pgs_3 = 0xe73a34e,pgs_4 = 913597263,pgs_6 = 1906683947,pgs_7 = 3000647151,pgs_8 = 3901133072,pgs_9 = 1776219114,pgs_10 = "common/shape.wdf"}
	ZhandouModel["四法青云_逍遥生"]={pgs_1 = 3016226515,pgs_2 = 3016226515,pgs_3 = 52451636,pgs_4 = 1691019474,pgs_6 = 2058662475,pgs_7 = 1670645347,pgs_8 = 372928672,pgs_9 = 3475794618,pgs_10 = "common/shape.wdf"}
	ZhandouModel["太极_逍遥生"]={pgs_1 = 649896254,pgs_2 = 649896254,pgs_3 = 0x65daa4af,pgs_4 = 2206939775,pgs_6 = 4084370231,pgs_7 = 730224004,pgs_8 = 2110134716,pgs_9 = 297375576,pgs_10 = "common/shape.wdf"}
	ZhandouModel["画龙点睛_逍遥生"]={pgs_1 = 1820963257,pgs_2 = 1820963257,pgs_3 = 0xe3fd6ace,pgs_4 = 847585063,pgs_6 = 2168341927,pgs_7 = 2999351206,pgs_8 = 2759214368,pgs_9 = 3485764253,pgs_10 = "common/shape.wdf"}
	ZhandouModel["秋水人家_逍遥生"]={pgs_1 = 3722556358,pgs_2 = 3722556358,pgs_3 = 0x4b84b4bc,pgs_4 = 817486875,pgs_6 = 2119665882,pgs_7 = 79540806,pgs_8 = 1912450629,pgs_9 = 3131282288,pgs_10 = "common/shape.wdf"}
	ZhandouModel["擒龙_逍遥生"]={pgs_1 = 2313480743,pgs_2 = 2313480743,pgs_3 = 1394178168,pgs_4 = 3931344485,pgs_6 = 4049254285,pgs_7 = 1046891202,pgs_8 = 2147278343,pgs_9 = 4088283715,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青铜斧_虎头怪"]={pgs_1 = 2625820889,pgs_2 = 2625820889,pgs_3 = 0x2208a659,pgs_4 = 1319228411,pgs_6 = 860172680,pgs_7 = 36420174,pgs_8 = 3821452431,pgs_9 = 303003892,pgs_10 = "common/shape.wdf"}
	ZhandouModel["双弦钺_虎头怪"]={pgs_1 = 3106550770,pgs_2 = 3106550770,pgs_3 = 0x1ddbb1c6,pgs_4 = 813505863,pgs_6 = 4256430594,pgs_7 = 1073168906,pgs_8 = 3722911626,pgs_9 = 1532549372,pgs_10 = "common/shape.wdf"}
	ZhandouModel["八卦_虎头怪"]={pgs_1 = 0xF4E93C19,pgs_2 = 0xF4E93C19,pgs_3 = 0xDAA88DDF,pgs_4 = 0xDCA25DA6,pgs_6 = 0x9EB4376A,pgs_7 = 0x257EEB28,pgs_8 = 0x6AD54C39,pgs_9 = 0xBF887095,pgs_10 = "common/shape.wdf"}
	ZhandouModel["狼牙锤_虎头怪"]={pgs_1 = 2073386691,pgs_2 = 2073386691,pgs_3 = 336486465,pgs_4 = 381771912,pgs_6 = 4106128916,pgs_7 = 1791439790,pgs_8 = 568824381,pgs_9 = 1676981226,pgs_10 = "common/shape.wdf"}
	ZhandouModel["乌金鬼头镰_虎头怪"]={pgs_1 = 3466710001,pgs_2 = 3466710001,pgs_3 = 0x6f6e119a,pgs_4 = 3433763427,pgs_6 = 752010966,pgs_7 = 2871143747,pgs_8 = 1261420343,pgs_9 = 2046811187,pgs_10 = "common/shape.wdf"}
	ZhandouModel["震天锤_虎头怪"]={pgs_1 = 910543157,pgs_2 = 910543157,pgs_3 = 396098490,pgs_4 = 51606250,pgs_6 = 647794191,pgs_7 = 1034863730,pgs_8 = 34149923,pgs_9 = 2195214010,pgs_10 = "common/shape.wdf"}
	ZhandouModel["松木锤_虎头怪"]={pgs_1 = 3954765830,pgs_2 = 3954765830,pgs_3 = 1463806219,pgs_4 = 4224177154,pgs_6 = 78625091,pgs_7 = 2652829739,pgs_8 = 2214494438,pgs_9 = 1060924399,pgs_10 = "common/shape.wdf"}
	ZhandouModel["肃魂_虎头怪"]={pgs_1 = 3347502793,pgs_2 = 3347502793,pgs_3 = 0x4cbc0cc5,pgs_4 = 118700546,pgs_6 = 2438511946,pgs_7 = 654574910,pgs_8 = 2443863215,pgs_9 = 3044188142,pgs_10 = "common/shape.wdf"}
	ZhandouModel["无敌_虎头怪"]={pgs_1 = 3570280462,pgs_2 = 3570280462,pgs_3 = 0xe74758dc,pgs_4 = 4066794943,pgs_6 = 2962716394,pgs_7 = 2728193647,pgs_8 = 1018712733,pgs_9 = 3542032877,pgs_10 = "common/shape.wdf"}
	ZhandouModel["雷神_虎头怪"]={pgs_1 = 3666407377,pgs_2 = 3666407377,pgs_3 = 465270733,pgs_4 = 2173835439,pgs_6 = 1254874348,pgs_7 = 2506000487,pgs_8 = 3727411622,pgs_9 = 2103867801,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九瓣莲花_虎头怪"]={pgs_1 = 4211862022,pgs_2 = 4211862022,pgs_3 = 3700497436,pgs_4 = 2579634951,pgs_6 = 3976648204,pgs_7 = 2765994764,pgs_8 = 3401808842,pgs_9 = 4094340569,pgs_10 = "common/shape.wdf"}
	ZhandouModel["元神禁锢_虎头怪"]={pgs_1 = 345884366,pgs_2 = 345884366,pgs_3 = 0x77acf46a,pgs_4 = 3684415104,pgs_6 = 3779343772,pgs_7 = 1164144313,pgs_8 = 2870850177,pgs_9 = 1485270944,pgs_10 = "common/shape.wdf"}
	ZhandouModel["护法灭魔_虎头怪"]={pgs_1 = 2333757160,pgs_2 = 2333757160,pgs_3 = 0x436e551f,pgs_4 = 1240918279,pgs_6 = 4006191476,pgs_7 = 291325187,pgs_8 = 1586774719,pgs_9 = 2726510090,pgs_10 = "common/shape.wdf"}
	ZhandouModel["碧血干戚_虎头怪"]={pgs_1 = 2522616044,pgs_2 = 2522616044,pgs_3 = 0x9953b8a3,pgs_4 = 4132910073,pgs_6 = 2916654539,pgs_7 = 1375729749,pgs_8 = 3235367936,pgs_9 = 2444186613,pgs_10 = "common/shape.wdf"}
	ZhandouModel["裂天_虎头怪"]={pgs_1 = 3605525759,pgs_2 = 3605525759,pgs_3 = 0x32f0dc6c,pgs_4 = 1428790516,pgs_6 = 1927582914,pgs_7 = 0157199347,pgs_8 = 2018235479,pgs_9 = 0184731195,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鬼牙_虎头怪"]={pgs_1 = 3191385649,pgs_2 = 3191385649,pgs_3 = 964246481,pgs_4 = 439390498,pgs_6 = 2557976454,pgs_7 = 899308703,pgs_8 = 1809962467,pgs_9 = 1310176885,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鬼王蚀日_虎头怪"]={pgs_1 = 2268846765,pgs_2 = 2268846765,pgs_3 = 257733900,pgs_4 = 733650393,pgs_6 = 2155760337,pgs_7 = 3690009014,pgs_8 = 3223595996,pgs_9 = 553446556,pgs_10 = "common/shape.wdf"}
	ZhandouModel["狂澜碎岳_虎头怪"]={pgs_1 = 0843924172,pgs_2 = 0843924172,pgs_3 = 3497818294,pgs_4 = 0119723529,pgs_6 = 2748969191,pgs_7 = 1323769114,pgs_8 = 1279428078,pgs_9 = 1811551067,pgs_10 = "common/shape.wdf"}
	ZhandouModel["碎寂_虎头怪"]={pgs_1 = 3620927202,pgs_2 = 3620927202,pgs_3 = 1460939045,pgs_4 = 3684775387,pgs_6 = 3894472815,pgs_7 = 0534677085,pgs_8 = 1857702941,pgs_9 = 3336710114,pgs_10 = "common/shape.wdf"}
	ZhandouModel["混元金锤_虎头怪"]={pgs_1 = 3310158404,pgs_2 = 3310158404,pgs_3 = 3916719461,pgs_4 = 2256126103,pgs_6 = 1047119087,pgs_7 = 649007137,pgs_8 = 3287631002,pgs_9 = 3272074169,pgs_10 = "common/shape.wdf"}
	ZhandouModel["五丁开山_虎头怪"]={pgs_1 = 2062014821,pgs_2 = 2062014821,pgs_3 = 0xc9417a1a,pgs_4 = 3661893622,pgs_6 = 1889040253,pgs_7 = 1541320741,pgs_8 = 1738256578,pgs_9 = 722835269,pgs_10 = "common/shape.wdf"}
	ZhandouModel["破魄_虎头怪"]={pgs_1 = 66503730,pgs_2 = 66503730,pgs_3 = 0xec47773c,pgs_4 = 147936745,pgs_6 = 915959107,pgs_7 = 2946347461,pgs_8 = 1892595080,pgs_9 = 1320517389,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["狼牙刀_巨魔王"]={pgs_1 = 1348040770,pgs_2 = 1348040770,pgs_3 = 352421824,pgs_4 = 1800113692,pgs_6 = 1284246655,pgs_7 = 4283867446,pgs_8 = 1391628501,pgs_9 = 2232000579,pgs_10 = "common/shape.wdf"}
	ZhandouModel["金背大砍刀_巨魔王"]={pgs_1 = 2076710374,pgs_2 = 2076710374,pgs_3 = 1462666995,pgs_4 = 1595258466,pgs_6 = 3808390705,pgs_7 = 3112271650,pgs_8 = 1162958128,pgs_9 = 3317931600,pgs_10 = "common/shape.wdf"}
	ZhandouModel["双弦钺_巨魔王"]={pgs_1 = 1793132112,pgs_2 = 1793132112,pgs_3 = 0x690d9a1,pgs_4 = 3898773470,pgs_6 = 2550126650,pgs_7 = 0xb02e8a71,pgs_8 = 0x405a73c1 ,pgs_9 = 2797209389,pgs_10 = "common/shape.wdf"}
	ZhandouModel["柳叶刀_巨魔王"]={pgs_1 = 3522958092,pgs_2 = 3522958092,pgs_3 = 2519475388,pgs_4 = 3788202981,pgs_6 = 333884425,pgs_7 = 3427345453,pgs_8 = 0x6cbbe06c,pgs_9 = 4266255286,pgs_10 = "common/shape.wdf"}
	ZhandouModel["乌金鬼头镰_巨魔王"]={pgs_1 = 208276143,pgs_2 = 208276143,pgs_3 = 0x5342d0dd,pgs_4 = 1471811059,pgs_6 = 1976211634,pgs_7 = 153091850,pgs_8 = 3647700056,pgs_9 = 4019257677,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青铜斧_巨魔王"]={pgs_1 = 182516681,pgs_2 = 182516681,pgs_3 = 0xebc7d5d6,pgs_4 = 3396040890,pgs_6 = 3108223122,pgs_7 = 1776525498,pgs_8 = 3618533458,pgs_9 = 2670573290,pgs_10 = "common/shape.wdf"}
	ZhandouModel["晓风残月_巨魔王"]={pgs_1 = 684541206,pgs_2 = 684541206,pgs_3 = 575760044,pgs_4 = 2922449802,pgs_6 = 578321277,pgs_7 = 1145919811,pgs_8 = 1959824975,pgs_9 = 2531067724,pgs_10 = "common/shape.wdf"}
	ZhandouModel["元神禁锢_巨魔王"]={pgs_1 = 1611966521,pgs_2 = 1611966521,pgs_3 = 0xcde7b933,pgs_4 = 3825599050,pgs_6 = 2980430167,pgs_7 = 2239466708,pgs_8 = 1421663600,pgs_9 = 2749153529,pgs_10 = "common/shape.wdf"}
	ZhandouModel["护法灭魔_巨魔王"]={pgs_1 = 1083493637,pgs_2 = 1083493637,pgs_3 = 0x91b7053d,pgs_4 = 2551291495,pgs_6 = 4082536262,pgs_7 = 2847560160,pgs_8 = 1955001763,pgs_9 = 4262995164,pgs_10 = "common/shape.wdf"}
	ZhandouModel["碧血干戚_巨魔王"]={pgs_1 = 0325617872,pgs_2 = 0325617872,pgs_3 = 0x9c68e3fe,pgs_4 = 1634024596,pgs_6 = 2566297187,pgs_7 = 1516430527,pgs_8 = 1859893291,pgs_9 = 1309789755,pgs_10 = "common/shape.wdf"}
	ZhandouModel["裂天_巨魔王"]={pgs_1 = 3770058550,pgs_2 = 3770058550,pgs_3 = 0x1401a457,pgs_4 = 4223217027,pgs_6 = 3564628022,pgs_7 = 2046633309,pgs_8 = 2119151502,pgs_9 = 1758406529,pgs_10 = "common/shape.wdf"}
	ZhandouModel["血刃_巨魔王"]={pgs_1 = 1939335498,pgs_2 = 1939335498,pgs_3 = 877636726,pgs_4 = 916167152,pgs_6 = 867523001,pgs_7 = 3564043256,pgs_8 = 776791724,pgs_9 = 1515674466,pgs_10 = "common/shape.wdf"}
	ZhandouModel["屠龙_巨魔王"]={pgs_1 = 1484416784,pgs_2 = 1484416784,pgs_3 = 1775621951,pgs_4 = 1549828750,pgs_6 = 3154364234,pgs_7 = 993921470,pgs_8 = 2220195117,pgs_9 = 2747950696,pgs_10 = "common/shape.wdf"}
	ZhandouModel["斩妖泣血_巨魔王"]={pgs_1 = 1896056556,pgs_2 = 1896056556,pgs_3 = 399651097,pgs_4 = 335656095,pgs_6 = 4247090300,pgs_7 = 3557597697,pgs_8 = 131374191,pgs_9 = 3408927878,pgs_10 = "common/shape.wdf"}
	ZhandouModel["业火三灾_巨魔王"]={pgs_1 = 4258129878,pgs_2 = 4258129878,pgs_3 = 3927074237,pgs_4 = 0727738647,pgs_6 = 0460666887,pgs_7 = 3086041675,pgs_8 = 0213811481,pgs_9 = 2227980701,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鸣鸿_巨魔王"]={pgs_1 = 2725911621,pgs_2 = 2725911621,pgs_3 = 1064946168,pgs_4 = 0641529870,pgs_6 = 1154664012,pgs_7 = 2387777949,pgs_8 = 0310225545,pgs_9 = 2338581088,pgs_10 = "common/shape.wdf"}
	ZhandouModel["肃魂_巨魔王"]={pgs_1 = 3727576188,pgs_2 = 3727576188,pgs_3 = 0xca673c26,pgs_4 = 4127273897,pgs_6 = 1400005662,pgs_7 = 3888898365,pgs_8 = 2920150876,pgs_9 = 696981765,pgs_10 = "common/shape.wdf"}
	ZhandouModel["破魄_巨魔王"]={pgs_1 = 319488423,pgs_2 = 319488423,pgs_3 = 0x64d25284,pgs_4 = 3984718092,pgs_6 = 3043299876,pgs_7 = 2152441077,pgs_8 = 4105273607,pgs_9 = 1812185996,pgs_10 = "common/shape.wdf"}
	ZhandouModel["五丁开山_巨魔王"]={pgs_1 = 2764988110,pgs_2 = 2764988110,pgs_3 = 0xb49adb36,pgs_4 = 1647167110,pgs_6 = 3579833021,pgs_7 = 1948978116,pgs_8 = 1824676110,pgs_9 = 1166051005,pgs_10 = "common/shape.wdf"}
	ZhandouModel["无敌_巨魔王"]={pgs_1 = 1778946713,pgs_2 = 1778946713,pgs_3 = 0x9fb8ebfe,pgs_4 = 1841084145,pgs_6 = 2152432898,pgs_7 = 2969721676,pgs_8 = 1229188957,pgs_9 = 788779469,pgs_10 = "common/shape.wdf"}
	ZhandouModel["偃月青龙_巨魔王"]={pgs_1 = 4010127360,pgs_2 = 4010127360,pgs_3 = 1888302904,pgs_4 = 1208038344,pgs_6 = 1840793383,pgs_7 = 1348825008,pgs_8 = 868863512,pgs_9 = 514498611,pgs_10 = "common/shape.wdf"}
	ZhandouModel["冷月_巨魔王"]={pgs_1 = 432866760,pgs_2 = 432866760,pgs_3 = 1400294209,pgs_4 = 2104157931,pgs_6 = 1649287571,pgs_7 = 3373155289,pgs_8 = 3573839422,pgs_9 = 914206326,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["铁爪_骨精灵"]={pgs_1 = 3158218287,pgs_2 = 3158218287,pgs_3 = 4058918673,pgs_4 = 619798639,pgs_6 = 4166133046,pgs_7 = 2469680581,pgs_8 = 1948730791,pgs_9 = 2320459601,pgs_10 = "common/shape.wdf"}
	ZhandouModel["点金棒_骨精灵"]={pgs_1 = 3310814476,pgs_2 = 3310814476,pgs_3 = 3103212281,pgs_4 = 3301564224,pgs_6 = 1122132964,pgs_7 = 3107411095,pgs_8 = 155295757,pgs_9 = 1580683403,pgs_10 = "common/shape.wdf"}
	ZhandouModel["细木棒_骨精灵"]={pgs_1 = 572946160,pgs_2 = 572946160,pgs_3 = 869013113,pgs_4 = 430229213,pgs_6 = 0x8fe3bea0,pgs_7 = 87009475,pgs_8 = 3532585728,pgs_9 = 1194431645,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青龙牙_骨精灵"]={pgs_1 = 3799914888,pgs_2 = 3799914888,pgs_3 = 1849406648,pgs_4 = 623293418,pgs_6 = 4122645564,pgs_7 = 674755217,pgs_8 = 1075420620,pgs_9 = 3643822727,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青刚刺_骨精灵"]={pgs_1 = 3075032207,pgs_2 = 3075032207,pgs_3 = 4256318239,pgs_4 = 0xcd5c1687,pgs_6 = 1414239405,pgs_7 = 1414239405,pgs_8 = 2053717070,pgs_9 = 2785457115,pgs_10 = "common/shape.wdf"}
	ZhandouModel["满天星_骨精灵"]={pgs_1 = 3437083756,pgs_2 = 3437083756,pgs_3 = 2306843235,pgs_4 = 1714484126,pgs_6 = 373133398,pgs_7 = 3805394703,pgs_8 = 1606121584,pgs_9 = 1531375263,pgs_10 = "common/shape.wdf"}
	ZhandouModel["雪蚕之刺_骨精灵"]={pgs_1 = 463147476,pgs_2 = 463147476,pgs_3 = 156477563,pgs_4 = 2554614685,pgs_6 = 1016195647,pgs_7 = 1685978750,pgs_8 = 882510520,pgs_9 = 3100053953,pgs_10 = "common/shape.wdf"}
	ZhandouModel["撕天_骨精灵"]={pgs_1 = 1763722445,pgs_2 = 1763722445,pgs_3 = 933726342,pgs_4 = 974601076,pgs_6 = 311571350,pgs_7 = 482224323,pgs_8 = 1316921786,pgs_9 = 3581381656,pgs_10 = "common/shape.wdf"}
	ZhandouModel["红莲_骨精灵"]={pgs_1 = 3424827150,pgs_2 = 3424827150,pgs_3 = 934671466,pgs_4 = 1076423299,pgs_6 = 3574472708,pgs_7 = 2280284843,pgs_8 = 506056336,pgs_9 = 2313738142,pgs_10 = "common/shape.wdf"}
	ZhandouModel["墨玉骷髅_骨精灵"]={pgs_1 = 577830528,pgs_2 = 577830528,pgs_3 = 3266821735,pgs_4 = 1068099312,pgs_6 = 4070992100,pgs_7 = 977905309,pgs_8 = 2508349179,pgs_9 = 100402035,pgs_10 = "common/shape.wdf"}
	ZhandouModel["丝萝乔木_骨精灵"]={pgs_1 = 0901353063,pgs_2 = 0901353063,pgs_3 = 2063487357,pgs_4 = 0147143279,pgs_6 = 2653363272,pgs_7 = 1155369624,pgs_8 = 1510947809,pgs_9 = 3973054279,pgs_10 = "common/shape.wdf"}
	ZhandouModel["醍醐_骨精灵"]={pgs_1 = 1250633387,pgs_2 = 1250633387,pgs_3 = 2381723311,pgs_4 = 1282610978,pgs_6 = 0138367003,pgs_7 = 1160534304,pgs_8 = 3907592293,pgs_9 = 0808638054,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九阴勾魂_骨精灵"]={pgs_1 = 1703807983,pgs_2 = 1703807983,pgs_3 = 1108591457,pgs_4 = 2771732364,pgs_6 = 489022779,pgs_7 = 3267946192,pgs_8 = 3766522110,pgs_9 = 2175760076,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青藤玉树_骨精灵"]={pgs_1 = 3707129187,pgs_2 = 3707129187,pgs_3 = 260368700,pgs_4 = 1260458106,pgs_6 = 2796632770,pgs_7 = 1119703569,pgs_8 = 229416981,pgs_9 = 2366517522,pgs_10 = "common/shape.wdf"}
	ZhandouModel["贵霜之牙_骨精灵"]={pgs_1 = 13151833,pgs_2 = 13151833,pgs_3 = 3119070731,pgs_4 = 2925176370,pgs_6 = 799282094,pgs_7 = 602955150,pgs_8 = 2619296391,pgs_9 = 1165096955,pgs_10 = "common/shape.wdf"}
	ZhandouModel["忘川三途_骨精灵"]={pgs_1 = 1057196119,pgs_2 = 1057196119,pgs_3 = 3284493434,pgs_4 = 3066925446,pgs_6 = 0859112470,pgs_7 = 2663913050,pgs_8 = 1551227703,pgs_9 = 2945401960,pgs_10 = "common/shape.wdf"}
	ZhandouModel["离钩_骨精灵"]={pgs_1 = 4162960663,pgs_2 = 4162960663,pgs_3 = 0433475784,pgs_4 = 2169364374,pgs_6 = 0158171847,pgs_7 = 2484616195,pgs_8 = 1699445520,pgs_9 = 2751461351,pgs_10 = "common/shape.wdf"}
	ZhandouModel["盘龙_骨精灵"]={pgs_1 = 399188318,pgs_2 = 399188318,pgs_3 = 3336570526,pgs_4 = 2823302607,pgs_6 = 4143522053,pgs_7 = 4066814475,pgs_8 = 2053873433,pgs_9 = 4254444118,pgs_10 = "common/shape.wdf"}
	ZhandouModel["胭脂_骨精灵"]={pgs_1 = 4115672778,pgs_2 = 4115672778,pgs_3 = 2352019632,pgs_4 = 1274576130,pgs_6 = 970419487,pgs_7 = 2008951769,pgs_8 = 275870055,pgs_9 = 2737514270,pgs_10 = "common/shape.wdf"}
	ZhandouModel["沧海_骨精灵"]={pgs_1 = 3063376651,pgs_2 = 3063376651,pgs_3 = 2245942073,pgs_4 = 3879413923,pgs_6 = 3414421168,pgs_7 = 4221563191,pgs_8 = 3538250889,pgs_9 = 3779942817,pgs_10 = "common/shape.wdf"}
	ZhandouModel["降魔玉杵_骨精灵"]={pgs_1 = 3334934404,pgs_2 = 3334934404,pgs_3 = 3854049791,pgs_4 = 1672795955,pgs_6 = 2227811489,pgs_7 = 2499485952,pgs_8 = 265141570,pgs_9 = 1457344498,pgs_10 = "common/shape.wdf"}
	ZhandouModel["毒牙_骨精灵"]={pgs_1 = 991315240,pgs_2 = 991315240,pgs_3 = 1625283763,pgs_4 = 2524067340,pgs_6 = 1149167732,pgs_7 = 1113746352,pgs_8 = 590367663,pgs_9 = 288632015,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["钢结鞭_狐美人"]={pgs_1 = 2383050056,pgs_2 = 2383050056,pgs_3 = 3281460149,pgs_4 = 3516998304,pgs_6 = 246739877,pgs_7 = 3039794984,pgs_8 = 875610474,pgs_9 = 3210281280,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青藤柳叶鞭_狐美人"]={pgs_1 = 1451526591,pgs_2 = 1451526591,pgs_3 = 672510267,pgs_4 = 2873780575,pgs_6 = 2492119629,pgs_7 = 599092463,pgs_8 = 3419036208,pgs_9 = 2641306317,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青刚刺_狐美人"]={pgs_1 = 181873383,pgs_2 = 181873383,pgs_3 = 0xf1c3eb05,pgs_4 = 429992710,pgs_6 = 1822050644,pgs_7 = 366643004,pgs_8 = 2389652378,pgs_9 = 2180063945,pgs_10 = "common/shape.wdf"}
	ZhandouModel["牛皮鞭_狐美人"]={pgs_1 = 803587567,pgs_2 = 803587567,pgs_3 = 2928593272,pgs_4 = 0x1d194be4,pgs_6 = 3201126946,pgs_7 = 3347553641,pgs_8 = 435101418,pgs_9 = 0x1169732b,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青龙牙_狐美人"]={pgs_1 = 3328063850,pgs_2 = 3328063850,pgs_3 = 0x2e7bec5d,pgs_4 = 1207144244,pgs_6 = 620017539,pgs_7 = 1100137434,pgs_8 = 957732521,pgs_9 = 702824336,pgs_10 = "common/shape.wdf"}
	ZhandouModel["铁爪_狐美人"]={pgs_1 = 1341071015,pgs_2 = 1341071015,pgs_3 = 0x8554ba42,pgs_4 = 2453642175,pgs_6 = 1760107365,pgs_7 = 4127315635,pgs_8 = 2476805398,pgs_9 = 2928915082,pgs_10 = "common/shape.wdf"}
	ZhandouModel["胭脂_狐美人"]={pgs_1 = 435255964,pgs_2 = 435255964,pgs_3 = 0x3017b6e1,pgs_4 = 3864765510,pgs_6 = 505158205,pgs_7 = 1747354624,pgs_8 = 1199574166,pgs_9 = 954931940,pgs_10 = "common/shape.wdf"}
	ZhandouModel["贵霜之牙_狐美人"]={pgs_1 = 2026448705,pgs_2 = 2026448705,pgs_3 = 0xf63172d0,pgs_4 = 3203975285,pgs_6 = 1564840489,pgs_7 = 474679658,pgs_8 = 4058539230,pgs_9 = 926627376,pgs_10 = "common/shape.wdf"}
	ZhandouModel["忘川三途_狐美人"]={pgs_1 = 0236232349,pgs_2 = 0236232349,pgs_3 = 0xc4da3341,pgs_4 = 1037429893,pgs_6 = 2989801805,pgs_7 = 1339124563,pgs_8 = 3926929253,pgs_9 = 3874185526,pgs_10 = "common/shape.wdf"}
	ZhandouModel["离钩_狐美人"]={pgs_1 = 0564401744,pgs_2 = 0564401744,pgs_3 = 0xd40ee4a7,pgs_4 = 2021299893,pgs_6 = 3148444658,pgs_7 = 3954561085,pgs_8 = 4230441971,pgs_9 = 1335188315,pgs_10 = "common/shape.wdf"}
	ZhandouModel["百花_狐美人"]={pgs_1 = 1502748093,pgs_2 = 1502748093,pgs_3 = 2250675787,pgs_4 = 2755073465,pgs_6 = 1990532858,pgs_7 = 1787167953,pgs_8 = 3161043606,pgs_9 = 546759080,pgs_10 = "common/shape.wdf"}
	ZhandouModel["仙人指路_狐美人"]={pgs_1 = 1169841436,pgs_2 = 1169841436,pgs_3 = 851455711,pgs_4 = 1792787137,pgs_6 = 1034828303,pgs_7 = 4038631411,pgs_8 = 1358665134,pgs_9 = 657246130,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九阴勾魂_狐美人"]={pgs_1 = 34055457,pgs_2 = 34055457,pgs_3 = 0x9eb6b04,pgs_4 = 2594225835,pgs_6 = 1606837702,pgs_7 = 4229873282,pgs_8 = 14066732,pgs_9 = 3187095867,pgs_10 = "common/shape.wdf"}
	ZhandouModel["雪蚕之刺_狐美人"]={pgs_1 = 3375230005,pgs_2 = 3375230005,pgs_3 = 0x535e76d0,pgs_4 = 4186182464,pgs_6 = 4168563223,pgs_7 = 3779159654,pgs_8 = 1556439270,pgs_9 = 3143637419,pgs_10 = "common/shape.wdf"}
	ZhandouModel["毒牙_狐美人"]={pgs_1 = 2678046311,pgs_2 = 2678046311,pgs_3 = 0x6338b65,pgs_4 = 1046153681,pgs_6 = 3025877259,pgs_7 = 4196456021,pgs_8 = 2797725717,pgs_9 = 648763427,pgs_10 = "common/shape.wdf"}
	ZhandouModel["游龙惊鸿_狐美人"]={pgs_1 = 1677496371,pgs_2 = 1677496371,pgs_3 = 1419416100,pgs_4 = 1427572959,pgs_6 = 3911390728,pgs_7 = 4269124018,pgs_8 = 1118732647,pgs_9 = 1632285264,pgs_10 = "common/shape.wdf"}
	ZhandouModel["血之刺藤_狐美人"]={pgs_1 = 4050126740,pgs_2 = 4050126740,pgs_3 = 3429497989,pgs_4 = 2489520435,pgs_6 = 2605547995,pgs_7 = 888707380,pgs_8 = 1942318093,pgs_9 = 3544559629,pgs_10 = "common/shape.wdf"}
	ZhandouModel["牧云清歌_狐美人"]={pgs_1 = 1719727329,pgs_2 = 1719727329,pgs_3 = 0210056156,pgs_4 = 4235354976,pgs_6 = 3324406676,pgs_7 = 4002747821,pgs_8 = 2497747470,pgs_9 = 0747942707,pgs_10 = "common/shape.wdf"}
	ZhandouModel["霜陨_狐美人"]={pgs_1 = 1258580513,pgs_2 = 1258580513,pgs_3 = 1285805382,pgs_4 = 3557049784,pgs_6 = 0373506230,pgs_7 = 1376923560,pgs_8 = 4168352366,pgs_9 = 1324744500,pgs_10 = "common/shape.wdf"}
	ZhandouModel["龙筋_狐美人"]={pgs_1 = 3760276395,pgs_2 = 3760276395,pgs_3 = 53105381,pgs_4 = 3304310422,pgs_6 = 1123548549,pgs_7 = 478714521,pgs_8 = 3148732170,pgs_9 = 61804478,pgs_10 = "common/shape.wdf"}
	ZhandouModel["吹雪_狐美人"]={pgs_1 = 2782365575,pgs_2 = 2782365575,pgs_3 = 2863024953,pgs_4 = 2075646427,pgs_6 = 1793299889,pgs_7 = 3492647849,pgs_8 = 4255111126,pgs_9 = 3079814036,pgs_10 = "common/shape.wdf"}
	ZhandouModel["撕天_狐美人"]={pgs_1 = 3142217049,pgs_2 = 3142217049,pgs_3 = 0xf32ce8b9,pgs_4 = 3204327512,pgs_6 = 2232734491,pgs_7 = 2803578940,pgs_8 = 1204989569,pgs_9 = 3697845403,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["玄铁矛_神天兵"]={pgs_1 = 457024889,pgs_2 = 457024889,pgs_3 = 0x3261f,pgs_4 = 970913679,pgs_6 = 3111818852,pgs_7 = 1880364342,pgs_8 = 883798385,pgs_9 = 2466450533,pgs_10 = "common/shape.wdf"}
	ZhandouModel["八卦_神天兵"]={pgs_1 = 0x94265799,pgs_2 = 0x14046CB9,pgs_3 = 0x35A8F0B2,pgs_4 = 0xF721C3A5,pgs_5 = 0xCAEC2F8A,pgs_6 = 0x82407177,pgs_7 = 0x14046CB9,pgs_8 = 0x793550FC,pgs_9 = 0x66D1B6C4,pgs_10 = "common/shape.wdf"}
	ZhandouModel["乌金三叉戟_神天兵"]={pgs_1 = 408164304,pgs_2 = 408164304,pgs_3 = 0xdd1ca29d,pgs_4 = 2362411253,pgs_6 = 2944638184,pgs_7 = 611952719,pgs_8 = 907746138,pgs_9 = 1478073855,pgs_10 = "common/shape.wdf"}
	ZhandouModel["狼牙锤_神天兵"]={pgs_1 = 103920893,pgs_2 = 103920893,pgs_3 = 3337098745,pgs_4 = 1754275390,pgs_6 = 1598161855,pgs_7 = 4165662626,pgs_8 = 3269185703,pgs_9 = 685627288,pgs_10 = "common/shape.wdf"}
	ZhandouModel["松木锤_神天兵"]={pgs_1 = 4014115127,pgs_2 = 4014115127,pgs_3 = 433361276,pgs_4 = 2686623681,pgs_6 = 316202605,pgs_7 = 776522968,pgs_8 = 400987167,pgs_9 = 3257370843,pgs_10 = "common/shape.wdf"}
	ZhandouModel["红缨枪_神天兵"]={pgs_1 = 3072500196,pgs_2 = 3072500196,pgs_3 = 0x8c0a81b3,pgs_4 = 522874091,pgs_6 = 72270422,pgs_7 = 2966336322,pgs_8 = 117062963,pgs_9 = 3637390492,pgs_10 = "common/shape.wdf"}
	ZhandouModel["震天锤_神天兵"]={pgs_1 = 3035485426,pgs_2 = 3035485426,pgs_3 = 1437571424,pgs_4 = 3129123356,pgs_6 = 3250445538,pgs_7 = 4112972849,pgs_8 = 4145837202,pgs_9 = 0x27885331,pgs_10 = "common/shape.wdf"}
	ZhandouModel["飞龙在天_神天兵"]={pgs_1 = 2032927311,pgs_2 = 2032927311,pgs_3 = 0x80bdb343,pgs_4 = 3978455792,pgs_6 = 1874013939,pgs_7 = 3740325538,pgs_8 = 2181635146,pgs_9 = 599728780,pgs_10 = "common/shape.wdf"}
	ZhandouModel["天龙破城_神天兵"]={pgs_1 = 0171966452,pgs_2 = 0171966452,pgs_3 = 0x39cefa42,pgs_4 = 2107979991,pgs_6 = 1581914867,pgs_7 = 2942548432,pgs_8 = 1411813089,pgs_9 = 1849607449,pgs_10 = "common/shape.wdf"}
	ZhandouModel["弑皇_神天兵"]={pgs_1 = 1997962163,pgs_2 = 1997962163,pgs_3 = 0xb9b8f39e,pgs_4 = 1627526221,pgs_6 = 0244362789,pgs_7 = 0451837867,pgs_8 = 3255465889,pgs_9 = 1104681624,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鬼王蚀日_神天兵"]={pgs_1 = 963362133,pgs_2 = 963362133,pgs_3 = 152105194,pgs_4 = 3867741716,pgs_6 = 1752393650,pgs_7 = 278748353,pgs_8 = 1749943111,pgs_9 = 0xB1EC4BAE,pgs_10 = "common/shape.wdf"}
	ZhandouModel["狂澜碎岳_神天兵"]={pgs_1 = 2235903565,pgs_2 = 2235903565,pgs_3 = 2603636370,pgs_4 = 0xfc8556ff,pgs_6 = 2176071785,pgs_7 = 4182805395,pgs_8 = 0485622618,pgs_9 = 0725700904,pgs_10 = "common/shape.wdf"}
	ZhandouModel["碎寂_神天兵"]={pgs_1 = 3625830153,pgs_2 = 3625830153,pgs_3 = 3568054291,pgs_4 = 2897242392,pgs_6 = 2339108953,pgs_7 = 0520986973,pgs_8 = 3030332360,pgs_9 = 1269074276,pgs_10 = "common/shape.wdf"}
	ZhandouModel["暗夜_神天兵"]={pgs_1 = 1082922820,pgs_2 = 1082922820,pgs_3 = 0x935502d2,pgs_4 = 3895199857,pgs_6 = 1619820242,pgs_7 = 3383885620,pgs_8 = 336694600,pgs_9 = 932923894,pgs_10 = "common/shape.wdf"}
	ZhandouModel["梨花_神天兵"]={pgs_1 = 1046350880,pgs_2 = 1046350880,pgs_3 = 0x5788173c,pgs_4 = 2634626428,pgs_6 = 3303390888,pgs_7 = 1240292677,pgs_8 = 3708021512,pgs_9 = 1872876301,pgs_10 = "common/shape.wdf"}
	ZhandouModel["五虎断魂_神天兵"]={pgs_1 = 2816878895,pgs_2 = 2816878895,pgs_3 = 0x695191d6,pgs_4 = 298941115,pgs_6 = 555909501,pgs_7 = 683330927,pgs_8 = 2195670772,pgs_9 = 223295368,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鬼牙_神天兵"]={pgs_1 = 2430761776,pgs_2 = 2430761776,pgs_3 = 3359352706,pgs_4 = 2621027170,pgs_6 = 1110189315,pgs_7 = 2486917341,pgs_8 = 2741674073,pgs_9 = 2681319409,pgs_10 = "common/shape.wdf"}
	ZhandouModel["霹雳_神天兵"]={pgs_1 = 1051053489,pgs_2 = 1051053489,pgs_3 = 0x4229e403,pgs_4 = 2085918398,pgs_6 = 3349289903,pgs_7 = 3508045990,pgs_8 = 143015740,pgs_9 = 2889808459,pgs_10 = "common/shape.wdf"}
	ZhandouModel["雷神_神天兵"]={pgs_1 = 148474283,pgs_2 = 148474283,pgs_3 = 2398394513,pgs_4 = 2945190989,pgs_6 = 3920362664,pgs_7 = 3086874992,pgs_8 = 2993116090,pgs_9 = 2515289535,pgs_10 = "common/shape.wdf"}
	ZhandouModel["混元金锤_神天兵"]={pgs_1 = 1923208867,pgs_2 = 1923208867,pgs_3 = 3952062894,pgs_4 = 1295504995,pgs_6 = 577114027,pgs_7 = 1445398766,pgs_8 = 3171781597,pgs_9 = 1835217455,pgs_10 = "common/shape.wdf"}
	ZhandouModel["刑天之逆_神天兵"]={pgs_1 = 4050435392,pgs_2 = 4050435392,pgs_3 = 0x26056ca0,pgs_4 = 1688528240,pgs_6 = 2425493529,pgs_7 = 1710005881,pgs_8 = 507405361,pgs_9 = 167694840,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九瓣莲花_神天兵"]={pgs_1 = 697482824,pgs_2 = 697482824,pgs_3 = 1082828846,pgs_4 = 1141897393,pgs_6 = 3748355701,pgs_7 = 616355012,pgs_8 = 2187902545,pgs_9 = 927580732,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["折扇_龙太子"]={pgs_1 = 1892693347,pgs_2 = 1892693347,pgs_3 = 0x779cd74,pgs_4 = 1204995981,pgs_6 = 1362359639,pgs_7 = 2228831626,pgs_8 = 3633790550,pgs_9 = 80506382,pgs_10 = "common/shape.wdf"}
	ZhandouModel["铁面扇_龙太子"]={pgs_1 = 0xe1c39fa4,pgs_2 = 0xe1c39fa4,pgs_3 = 0xba525a8f,pgs_4 = 0xf1b65eef,pgs_6 = 0x425bd517,pgs_7 = 0x7b8b943,pgs_8 = 0x3373ddfa,pgs_9 = 0xcdd1b9f5,pgs_10 = "common/shape.wdf"}
	ZhandouModel["神火扇_龙太子"]={pgs_1 = 1818358093,pgs_2 = 1818358093,pgs_3 = 0x257fdf2a,pgs_4 = 1584219148,pgs_6 = 3409145103,pgs_7 = 666236837,pgs_8 = 3980290410,pgs_9 = 1171511807,pgs_10 = "common/shape.wdf"}
	ZhandouModel["玄铁矛_龙太子"]={pgs_1 = 650631390,pgs_2 = 650631390,pgs_3 = 1332270280,pgs_4 = 1220141886,pgs_6 = 407764697,pgs_7 = 477458607,pgs_8 = 4281686609,pgs_9 = 663869830,pgs_10 = "common/shape.wdf"}
	ZhandouModel["红缨枪_龙太子"]={pgs_1 = 4208641994,pgs_2 = 4208641994,pgs_3 = 3367459571,pgs_4 = 4155725796,pgs_6 = 170841557,pgs_7 = 2694226760,pgs_8 = 1612726780,pgs_9 = 1217969354,pgs_10 = "common/shape.wdf"}
	ZhandouModel["乌金三叉戟_龙太子"]={pgs_1 = 2664793060,pgs_2 = 2664793060,pgs_3 = 1779222969,pgs_4 = 1212846725,pgs_6 = 3544733296,pgs_7 = 2097787361,pgs_8 = 2856910184,pgs_9 = 2573475492,pgs_10 = "common/shape.wdf"}
	ZhandouModel["暗夜_龙太子"]={pgs_1 = 741288949,pgs_2 = 741288949,pgs_3 = 1972123841,pgs_4 = 2182082171,pgs_6 = 4066915831,pgs_7 = 1492298468,pgs_8 = 3678212997,pgs_9 = 1751076384,pgs_10 = "common/shape.wdf"}
	ZhandouModel["秋水人家_龙太子"]={pgs_1 = 3391613661,pgs_2 = 3391613661,pgs_3 = 0x55dec235,pgs_4 = 2120876772,pgs_6 = 2647082872,pgs_7 = 1201013296,pgs_8 = 1941233906,pgs_9 = 817870297,pgs_10 = "common/shape.wdf"}
	ZhandouModel["刑天之逆_龙太子"]={pgs_1 = 1200609263,pgs_2 = 1200609263,pgs_3 = 2005252098,pgs_4 = 3509150743,pgs_6 = 3445110785,pgs_7 = 951231487,pgs_8 = 220558504,pgs_9 = 4062233204,pgs_10 = "common/shape.wdf"}
	ZhandouModel["霹雳_龙太子"]={pgs_1 = 278992607,pgs_2 = 278992607,pgs_3 = 1512127783,pgs_4 = 3642679990,pgs_6 = 1313071015,pgs_7 = 3971560979,pgs_8 = 2173299537,pgs_9 = 4060439247,pgs_10 = "common/shape.wdf"}
	ZhandouModel["画龙点睛_龙太子"]={pgs_1 = 479654062,pgs_2 = 479654062,pgs_3 = 0xb9c4539,pgs_4 = 2828288868,pgs_6 = 2229841293,pgs_7 = 235465927,pgs_8 = 3332787791,pgs_9 = 1018236421,pgs_10 = "common/shape.wdf"}
	ZhandouModel["五虎断魂_龙太子"]={pgs_1 = 1272648373,pgs_2 = 1272648373,pgs_3 = 1067074679,pgs_4 = 1592032597,pgs_6 = 2132267301,pgs_7 = 4089962192,pgs_8 = 1673526656,pgs_9 = 2635610460,pgs_10 = "common/shape.wdf"}
	ZhandouModel["逍遥江湖_龙太子"]={pgs_1 = 346935725,pgs_2 = 346935725,pgs_3 = 0x8c0689d3,pgs_4 = 4293635787,pgs_6 = 4152040342,pgs_7 = 3271976691,pgs_8 = 3980106552,pgs_9 = 2687029336,pgs_10 = "common/shape.wdf"}
	ZhandouModel["玉龙_龙太子"]={pgs_1 = 2333774279,pgs_2 = 2333774279,pgs_3 = 0x85307da5,pgs_4 = 444659320,pgs_6 = 629954791,pgs_7 = 263378940,pgs_8 = 1570393999,pgs_9 = 862461187,pgs_10 = "common/shape.wdf"}
	ZhandouModel["浩气长舒_龙太子"]={pgs_1 = 0x2CA2202A,pgs_2 = 0x2CA2202A,pgs_3 = 0x8d249d24,pgs_4 = 0x322040E,pgs_6 = 0xEBBBD6A,pgs_7 = 0xAF198759,pgs_8 = 0x7B25ED36,pgs_9 = 0x8D6EBCD,pgs_10 = "common/shape.wdf"}
	ZhandouModel["星瀚_龙太子"]={pgs_1 = 0xF67E30AD,pgs_2 = 0xF67E30AD,pgs_3 = 0xe41424f5,pgs_4 = 0xA7FAAB06,pgs_6 = 0x67BC1005,pgs_7 = 0x9FE029BF,pgs_8 = 0x8B72FF9,pgs_9 = 0xBF00ABF2,pgs_10 = "common/shape.wdf"}
	ZhandouModel["梨花_龙太子"]={pgs_1 = 3747222349,pgs_2 = 3747222349,pgs_3 = 3189155092,pgs_4 = 3062365732,pgs_6 = 1598243358,pgs_7 = 2389430522,pgs_8 = 3918605409,pgs_9 = 1648372626,pgs_10 = "common/shape.wdf"}
	ZhandouModel["飞龙在天_龙太子"]={pgs_1 = 0x49187E40,pgs_2 = 0x49187E40,pgs_3 = 0xA87E49E8,pgs_4 = 0x41E835B5,pgs_6 = 0x28FCF221,pgs_7 = 0x367AC070,pgs_8 = 0x1255644D,pgs_9 = 0x4E9D13AE,pgs_10 = "common/shape.wdf"}
	ZhandouModel["天龙破城_龙太子"]={pgs_1 = 0666227171,pgs_2 = 0666227171,pgs_3 = 3545294647,pgs_4 = 1075279479,pgs_6 = 4013753607,pgs_7 = 1440842173,pgs_8 = 1146668387,pgs_9 = 1609569152,pgs_10 = "common/shape.wdf"}
	ZhandouModel["弑皇_龙太子"]={pgs_1 = 0x2F84D4CA,pgs_2 = 0x2F84D4CA,pgs_3 = 0x9792B519,pgs_4 = 0xB80DD092,pgs_6 = 0xEF721760,pgs_7 = 0x6B780672,pgs_8 = 0xA85D5556,pgs_9 = 0x28B45289,pgs_10 = "common/shape.wdf"}
	ZhandouModel["秋风_龙太子"]={pgs_1 = 775882284,pgs_2 = 775882284,pgs_3 = 0xb02f871d,pgs_4 = 4103046621,pgs_6 = 4079294468,pgs_7 = 1774952424,pgs_8 = 409973300,pgs_9 = 342475400,pgs_10 = "common/shape.wdf"}
	ZhandouModel["太极_龙太子"]={pgs_1 = 3905888692,pgs_2 = 3905888692,pgs_3 = 0xd7af7f94,pgs_4 = 518907138,pgs_6 = 121079973,pgs_7 = 662010105,pgs_8 = 1852360605,pgs_9 = 269312850,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["无极丝_玄彩娥"]={pgs_1 = 720570501,pgs_2 = 720570501,pgs_3 = 0x65040b9d,pgs_4 = 2487726993,pgs_6 = 3513269889,pgs_7 = 629550622,pgs_8 = 327433169,pgs_9 = 0x19026de7,pgs_10 = "common/shape.wdf"}
	ZhandouModel["七彩罗刹_玄彩娥"]={pgs_1 = 2097271664,pgs_2 = 2097271664,pgs_3 = 0xbccf18c6,pgs_4 = 34704861,pgs_6 = 2226391655,pgs_7 = 4023029297,pgs_8 = 2658422875,pgs_9 = 1050015636,pgs_10 = "common/shape.wdf"}
	ZhandouModel["满天星_玄彩娥"]={pgs_1 = 3100078257,pgs_2 = 3100078257,pgs_3 = 677178981,pgs_4 = 4188799764,pgs_6 = 2373806356,pgs_7 = 123928187,pgs_8 = 2280722867,pgs_9 = 591449018,pgs_10 = "common/shape.wdf"}
	ZhandouModel["五色缎带_玄彩娥"]={pgs_1 = 986673291,pgs_2 = 986673291,pgs_3 = 0xd6bcec1b,pgs_4 = 1814531001,pgs_6 = 2478192000,pgs_7 = 3703252301,pgs_8 = 3541518516,pgs_9 = 3812334075,pgs_10 = "common/shape.wdf"}
	ZhandouModel["点金棒_玄彩娥"]={pgs_1 = 321961419,pgs_2 = 321961419,pgs_3 = 1825339978,pgs_4 = 2854164977,pgs_6 = 1309940385,pgs_7 = 3400892076,pgs_8 = 3042819558,pgs_9 = 499124570,pgs_10 = "common/shape.wdf"}
	ZhandouModel["细木棒_玄彩娥"]={pgs_1 = 2705175188,pgs_2 = 2705175188,pgs_3 = 4202680960,pgs_4 = 3228448399,pgs_6 = 436522649,pgs_7 = 2039230457,pgs_8 = 1506278188,pgs_9 = 375356336,pgs_10 = "common/shape.wdf"}
	ZhandouModel["红莲_玄彩娥"]={pgs_1 = 3643377339,pgs_2 = 3643377339,pgs_3 = 476128501,pgs_4 = 3322875805,pgs_6 = 1450950143,pgs_7 = 1405056236,pgs_8 = 477554400,pgs_9 = 1296371001,pgs_10 = "common/shape.wdf"}
	ZhandouModel["盘龙_玄彩娥"]={pgs_1 = 3068635068,pgs_2 = 3068635068,pgs_3 = 959077202,pgs_4 = 3616804633,pgs_6 = 2106636810,pgs_7 = 555283478,pgs_8 = 2056912982,pgs_9 = 2481130669,pgs_10 = "common/shape.wdf"}
	ZhandouModel["沧海_玄彩娥"]={pgs_1 = 3065680078,pgs_2 = 3065680078,pgs_3 = 504261236,pgs_4 = 60075072,pgs_6 = 3170504444,pgs_7 = 3448269542,pgs_8 = 1357669355,pgs_9 = 3608953515,pgs_10 = "common/shape.wdf"}
	ZhandouModel["碧波_玄彩娥"]={pgs_1 = 970441283,pgs_2 = 970441283,pgs_3 = 0xd370f823,pgs_4 = 1436245505,pgs_6 = 3228799230,pgs_7 = 3957482085,pgs_8 = 1916346891,pgs_9 = 1521611307,pgs_10 = "common/shape.wdf"}
	ZhandouModel["此最相思_玄彩娥"]={pgs_1 = 193367860,pgs_2 = 193367860,pgs_3 = 0xb7d84088,pgs_4 = 2340791616,pgs_6 = 493173921,pgs_7 = 1169690561,pgs_8 = 2674679688,pgs_9 = 668529798,pgs_10 = "common/shape.wdf"}
	ZhandouModel["揽月摘星_玄彩娥"]={pgs_1 = 3957461210,pgs_2 = 3957461210,pgs_3 = 0x2a5b6a13,pgs_4 = 1507018653,pgs_6 = 2821704604,pgs_7 = 3505463631,pgs_8 = 2825593192,pgs_9 = 1456089502,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九霄_玄彩娥"]={pgs_1 = 1925606125,pgs_2 = 1925606125,pgs_3 = 0xb4a8dcd0,pgs_4 = 3074777996,pgs_6 = 3263307981,pgs_7 = 1083356098,pgs_8 = 2475418304,pgs_9 = 2130671600,pgs_10 = "common/shape.wdf"}
	ZhandouModel["降魔玉杵_玄彩娥"]={pgs_1 = 4099217390,pgs_2 = 4099217390,pgs_3 = 3206381160,pgs_4 = 2229271781,pgs_6 = 2242027872,pgs_7 = 775886307,pgs_8 = 3480235058,pgs_9 = 3182933271,pgs_10 = "common/shape.wdf"}
	ZhandouModel["流云_玄彩娥"]={pgs_1 = 2363368052,pgs_2 = 2363368052,pgs_3 = 0x98fd03b4,pgs_4 = 1588271293,pgs_6 = 688944433,pgs_7 = 4012911086,pgs_8 = 4199981403,pgs_9 = 459658607,pgs_10 = "common/shape.wdf"}
	ZhandouModel["彩虹_玄彩娥"]={pgs_1 = 4010760941,pgs_2 = 4010760941,pgs_3 = 0x456f97ad,pgs_4 = 444072186,pgs_6 = 1602142769,pgs_7 = 3326013825,pgs_8 = 1763662402,pgs_9 = 2222466647,pgs_10 = "common/shape.wdf"}
	ZhandouModel["墨玉骷髅_玄彩娥"]={pgs_1 = 1829371224,pgs_2 = 1829371224,pgs_3 = 2002019356,pgs_4 = 2320316366,pgs_6 = 2555196614,pgs_7 = 335647506,pgs_8 = 2671690470,pgs_9 = 85118950,pgs_10 = "common/shape.wdf"}
	ZhandouModel["丝萝乔木_玄彩娥"]={pgs_1 = 1121230155,pgs_2 = 1121230155,pgs_3 = 0322946589,pgs_4 = 4206785453,pgs_6 = 2777298091,pgs_7 = 2186653861,pgs_8 = 1884580054,pgs_9 = 0740212343,pgs_10 = "common/shape.wdf"}
	ZhandouModel["醍醐_玄彩娥"]={pgs_1 = 3632446855,pgs_2 = 3632446855,pgs_3 = 2786004275,pgs_4 = 4043816298,pgs_6 = 0583826926,pgs_7 = 2781044081,pgs_8 = 0752278480,pgs_9 = 0053905909,pgs_10 = "common/shape.wdf"}
	ZhandouModel["晃金仙绳_玄彩娥"]={pgs_1 = 2648596978,pgs_2 = 2648596978,pgs_3 = 0xbd9d313d,pgs_4 = 2708781818,pgs_6 = 1007388957,pgs_7 = 629130124,pgs_8 = 99182575,pgs_9 = 359094555,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青藤玉树_玄彩娥"]={pgs_1 = 2503627450,pgs_2 = 2503627450,pgs_3 = 3110285636,pgs_4 = 1992978765,pgs_6 = 3809375891,pgs_7 = 2547741955,pgs_8 = 4282993605,pgs_9 = 462404473,pgs_10 = "common/shape.wdf"}
	ZhandouModel["秋水落霞_玄彩娥"]={pgs_1 = 2834670277,pgs_2 = 2834670277,pgs_3 = 0x73e31106,pgs_4 = 1773897847,pgs_6 = 2096851051,pgs_7 = 2528379760,pgs_8 = 4035277094,pgs_9 = 2619283310,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["黄铜圈_舞天姬"]={pgs_1 = 1246340040,pgs_2 = 1246340040,pgs_3 = 1695349470,pgs_4 = 2991787754,pgs_6 = 1524014588,pgs_7 = 4075994022,pgs_8 = 504842185,pgs_9 = 1374023375,pgs_10 = "common/shape.wdf"}
	ZhandouModel["无极丝_舞天姬"]={pgs_1 = 614245463,pgs_2 = 614245463,pgs_3 = 0x12c0084e,pgs_4 = 694856255,pgs_6 = 2175791405,pgs_7 = 448343009,pgs_8 = 2148337924,pgs_9 = 2923284079,pgs_10 = "common/shape.wdf"}
	ZhandouModel["金刺轮_舞天姬"]={pgs_1 = 3926831021,pgs_2 = 3926831021,pgs_3 = 1774309751,pgs_4 = 2501160049,pgs_6 = 2255887722,pgs_7 = 173996820,pgs_8 = 4154265461,pgs_9 = 3161036338,pgs_10 = "common/shape.wdf"}
	ZhandouModel["五色缎带_舞天姬"]={pgs_1 = 13536912,pgs_2 = 13536912,pgs_3 = 0x6b5c6c40,pgs_4 = 4096686404,pgs_6 = 2509295261,pgs_7 = 3306367653,pgs_8 = 4257026415,pgs_9 = 213886082,pgs_10 = "common/shape.wdf"}
	ZhandouModel["蛇形月_舞天姬"]={pgs_1 = 3668441645,pgs_2 = 3668441645,pgs_3 = 1423059990,pgs_4 = 9780356,pgs_6 = 2142449311,pgs_7 = 0x98a9b5e,pgs_8 = 4149929342,pgs_9 = 712091462,pgs_10 = "common/shape.wdf"}
	ZhandouModel["七彩罗刹_舞天姬"]={pgs_1 = 1449553165,pgs_2 = 1449553165,pgs_3 = 0x17ec87e,pgs_4 = 4157162296,pgs_6 = 1859257571,pgs_7 = 2698141768,pgs_8 = 2971905394,pgs_9 = 2020209393,pgs_10 = "common/shape.wdf"}
	ZhandouModel["此最相思_舞天姬"]={pgs_1 = 1976958564,pgs_2 = 1976958564,pgs_3 = 0xcff08da4,pgs_4 = 3902626006,pgs_6 = 1239150663,pgs_7 = 1817978990,pgs_8 = 3578667390,pgs_9 = 2374794875,pgs_10 = "common/shape.wdf"}
	ZhandouModel["揽月摘星_舞天姬"]={pgs_1 = 3095847005,pgs_2 = 3095847005,pgs_3 = 0xcf089af3,pgs_4 = 2694329428,pgs_6 = 4179340991,pgs_7 = 2099180209,pgs_8 = 0795965688,pgs_9 = 1691850913,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九霄_舞天姬"]={pgs_1 = 1709199725,pgs_2 = 1709199725,pgs_3 = 0xb12efc5a,pgs_4 = 0940501812,pgs_6 = 1332030559,pgs_7 = 3784736116,pgs_8 = 1618775589,pgs_9 = 0895130345,pgs_10 = "common/shape.wdf"}
	ZhandouModel["彩虹_舞天姬"]={pgs_1 = 3921702263,pgs_2 = 3921702263,pgs_3 = 0xa18d027d,pgs_4 = 261592524,pgs_6 = 3826935762,pgs_7 = 1461988918,pgs_8 = 658865406,pgs_9 = 2510075859,pgs_10 = "common/shape.wdf"}
	ZhandouModel["金玉双环_舞天姬"]={pgs_1 = 3279495962,pgs_2 = 3279495962,pgs_3 = 1189482605,pgs_4 = 2148299765,pgs_6 = 3630009301,pgs_7 = 3263066954,pgs_8 = 3371000519,pgs_9 = 2240511279,pgs_10 = "common/shape.wdf"}
	ZhandouModel["月光双环_舞天姬"]={pgs_1 = 3165243568,pgs_2 = 3165243568,pgs_3 = 16282348,pgs_4 = 2288648467,pgs_6 = 3693039080,pgs_7 = 2693457978,pgs_8 = 3984861090,pgs_9 = 1429132352,pgs_10 = "common/shape.wdf"}
	ZhandouModel["碧波_舞天姬"]={pgs_1 = 1034789143,pgs_2 = 1034789143,pgs_3 = 0x116df6c7,pgs_4 = 2355929470,pgs_6 = 2655943207,pgs_7 = 2855246102,pgs_8 = 241555200,pgs_9 = 1141838919,pgs_10 = "common/shape.wdf"}
	ZhandouModel["流云_舞天姬"]={pgs_1 = 4195857049,pgs_2 = 4195857049,pgs_3 = 0x6903fd70,pgs_4 = 972420940,pgs_6 = 198547491,pgs_7 = 2802292186,pgs_8 = 3885561582,pgs_9 = 1837939421,pgs_10 = "common/shape.wdf"}
	ZhandouModel["如意_舞天姬"]={pgs_1 = 3267454880,pgs_2 = 3267454880,pgs_3 = 1911031086,pgs_4 = 2351280146,pgs_6 = 850292701,pgs_7 = 500162329,pgs_8 = 1166644566,pgs_9 = 197968673,pgs_10 = "common/shape.wdf"}
	ZhandouModel["晃金仙绳_舞天姬"]={pgs_1 = 480998208,pgs_2 = 480998208,pgs_3 = 0x42063dca,pgs_4 = 1983509384,pgs_6 = 2029228117,pgs_7 = 1363856210,pgs_8 = 66546999,pgs_9 = 4226984468,pgs_10 = "common/shape.wdf"}
	ZhandouModel["别情离恨_舞天姬"]={pgs_1 = 799504916,pgs_2 = 799504916,pgs_3 = 842553389,pgs_4 = 1982103646,pgs_6 = 2210222918,pgs_7 = 1858157676,pgs_8 = 1117799210,pgs_9 = 3296383020,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九天金线_舞天姬"]={pgs_1 = 1669961605,pgs_2 = 1669961605,pgs_3 = 280626373,pgs_4 = 2737030257,pgs_6 = 1711064047,pgs_7 = 2155201472,pgs_8 = 2934052938,pgs_9 = 2722500657,pgs_10 = "common/shape.wdf"}
	ZhandouModel["无关风月_舞天姬"]={pgs_1 = 3653729862,pgs_2 = 3653729862,pgs_3 = 2118476708,pgs_4 = 1290614140,pgs_6 = 2011121195,pgs_7 = 3035499198,pgs_8 = 3842984317,pgs_9 = 1519396140,pgs_10 = "common/shape.wdf"}
	ZhandouModel["朝夕_舞天姬"]={pgs_1 = 2395353653,pgs_2 = 2395353653,pgs_3 = 0708502548,pgs_4 = 3224442340,pgs_6 = 3649114993,pgs_7 = 2271525100,pgs_8 = 3918368321,pgs_9 = 3452351752,pgs_10 = "common/shape.wdf"}
	ZhandouModel["秋水落霞_舞天姬"]={pgs_1 = 1202111998,pgs_2 = 1202111998,pgs_3 = 0x5b54beea,pgs_4 = 3049902097,pgs_6 = 690602552,pgs_7 = 1342960347,pgs_8 = 3838882501,pgs_9 = 1483726919,pgs_10 = "common/shape.wdf"}
	ZhandouModel["乾坤_舞天姬"]={pgs_1 = 266685423,pgs_2 = 266685423,pgs_3 = 2851409574,pgs_4 = 3890863565,pgs_6 = 1515127869,pgs_7 = 256273093,pgs_8 = 2425863420,pgs_9 = 615875314,pgs_10 = "common/shape.wdf"}
	ZhandouModel["骨精灵"]={pgs_1 = 3043670818,pgs_2 = 3043670818,pgs_3 = 3644222844,pgs_4 = 2656336023,pgs_6 = 4229617854,pgs_7 = 3601844930,pgs_8 = 2956176231,pgs_9 = 4259873334,pgs_10 = "common/shape.wdf"}
	ZhandouModel["骨精灵_魔棒"]={pgs_1 = 2452516043,pgs_2 = 2452516043,pgs_3 = 1899323518,pgs_4 = 3477875588,pgs_6 = 1063711236,pgs_7 = 3657445131,pgs_8 = 2024668974,pgs_9 = 3508788176,pgs_10 = "common/shape.wdf"}
	ZhandouModel["骨精灵_爪刺"]={pgs_1 = 3043670818,pgs_2 = 3043670818,pgs_3 = 3644222844,pgs_4 = 2656336023,pgs_6 = 4229617854,pgs_7 = 3601844930,pgs_8 = 2956176231,pgs_9 = 4259873334,pgs_10 = "common/shape.wdf"}
	ZhandouModel["狐美人"]={pgs_1 = 143164260,pgs_2 = 143164260,pgs_3 = 247333098,pgs_4 = 3467601219,pgs_6 = 1873404188,pgs_7 = 1585787695,pgs_8 = 947996020,pgs_9 = 3212527142,pgs_10 = "common/shape.wdf"}
	ZhandouModel["狐美人_鞭"]={pgs_1 = 1138804365,pgs_2 = 1138804365,pgs_3 = 247333098,pgs_4 = 303785981,pgs_6 = 1734212905,pgs_7 = 3749438,pgs_8 = 4126393258,pgs_9 = 3502426669,pgs_10 = "common/shape.wdf"}
	ZhandouModel["狐美人_爪刺"]={pgs_1 = 143164260,pgs_2 = 143164260,pgs_3 = 247333098,pgs_4 = 3467601219,pgs_6 = 1873404188,pgs_7 = 1585787695,pgs_8 = 947996020,pgs_9 = 3212527142,pgs_10 = "common/shape.wdf"}
	ZhandouModel["飞燕女"]={pgs_1 = 1018070922,pgs_2 = 1018070922,pgs_3 = 2068177574,pgs_4 = 4111908170,pgs_6 = 1489146739,pgs_7 = 607870271,pgs_8 = 1607593791,pgs_9 = 3911067979,pgs_10 = "common/shape.wdf"}
	ZhandouModel["飞燕女_环圈"]={pgs_1 = 1018070922,pgs_2 = 1018070922,pgs_3 = 2068177574,pgs_4 = 4111908170,pgs_6 = 1489146739,pgs_7 = 607870271,pgs_8 = 1607593791,pgs_9 = 3911067979,pgs_10 = "common/shape.wdf"}
	ZhandouModel["飞燕女_双短剑"]={pgs_1 = 2103710679,pgs_2 = 2103710679,pgs_3 = 2068177574,pgs_4 = 29450010,pgs_6 = 3234089534,pgs_7 = 2076610755,pgs_8 = 2826457680,pgs_9 = 2418368925,pgs_10 = "common/shape.wdf"}
	ZhandouModel["逍遥生"]={pgs_1 = 776342191,pgs_2 = 776342191,pgs_3 = 1782439566,pgs_4 = 4097908221,pgs_6 = 947396698,pgs_7 = 3952279767,pgs_8 = 1198567883,pgs_9 = 1011046408,pgs_10 = "common/shape.wdf"}
	ZhandouModel["逍遥生_剑"]={pgs_1 = 2801151609,pgs_2 = 2801151609,pgs_3 = 1782439566,pgs_4 = 3738039458,pgs_6 = 1629704855,pgs_7 = 1539613628,pgs_8 = 1512265752,pgs_9 = 116130982,pgs_10 = "common/shape.wdf"}
	ZhandouModel["逍遥生_扇"]={pgs_1 = 776342191,pgs_2 = 776342191,pgs_3 = 1782439566,pgs_4 = 4097908221,pgs_6 = 947396698,pgs_7 = 3952279767,pgs_8 = 1198567883,pgs_9 = 1011046408,pgs_10 = "common/shape.wdf"}
	ZhandouModel["神天兵"]={pgs_1 = 3139413485,pgs_2 = 3139413485,pgs_3 = 1649555822,pgs_4 = 1857394109,pgs_6 = 1539170847,pgs_7 = 1525915374,pgs_8 = 2489545420,pgs_9 = 2207457325,pgs_10 = "common/shape.wdf"}
	ZhandouModel["神天兵_锤"]={pgs_1 = 1465303491,pgs_2 = 1465303491,pgs_3 = 1649555822,pgs_4 = 2910864082,pgs_6 = 3107944047,pgs_7 = 2714401860,pgs_8 = 2489545420,pgs_9 = 2796680623,pgs_10 = "common/shape.wdf"}
	ZhandouModel["神天兵_枪矛"]={pgs_1 = 3139413485,pgs_2 = 3139413485,pgs_3 = 1649555822,pgs_4 = 1857394109,pgs_6 = 1539170847,pgs_7 = 1525915374,pgs_8 = 2489545420,pgs_9 = 2207457325,pgs_10 = "common/shape.wdf"}
	ZhandouModel["龙太子"]={pgs_1 = 995698620,pgs_2 = 995698620,pgs_3 = 2482790664,pgs_4 = 708419920,pgs_6 = 397538195,pgs_7 = 1042710685,pgs_8 = 1284179344,pgs_9 = 1173564955,pgs_10 = "common/shape.wdf"}
	ZhandouModel["龙太子_扇"]={pgs_1 = 241140809,pgs_2 = 241140809,pgs_3 = 2482790664,pgs_4 = 3101694266,pgs_6 = 2034116134,pgs_7 = 2603954881,pgs_8 = 4232546957,pgs_9 = 3966136859,pgs_10 = "common/shape.wdf"}
	ZhandouModel["龙太子_枪矛"]={pgs_1 = 995698620,pgs_2 = 995698620,pgs_3 = 2482790664,pgs_4 = 708419920,pgs_6 = 397538195,pgs_7 = 1042710685,pgs_8 = 1284179344,pgs_9 = 1173564955,pgs_10 = "common/shape.wdf"}
	ZhandouModel["虎头怪"]={pgs_1 = 3188334211,pgs_2 = 3188334211,pgs_3 = 1740983547,pgs_4 = 3951179215,pgs_6 = 1705376638,pgs_7 = 659922551,pgs_8 = 3836622392,pgs_9 = 4274012337,pgs_10 = "common/shape.wdf"}
	ZhandouModel["虎头怪_斧钺"]={pgs_1 = 2471916192,pgs_2 = 2471916192,pgs_3 = 1740983547,pgs_4 = 1851258377,pgs_6 = 1927395527,pgs_7 = 1883982028,pgs_8 = 2089007572,pgs_9 = 92383142,pgs_10 = "common/shape.wdf"}
	ZhandouModel["虎头怪_锤"]={pgs_1 = 3188334211,pgs_2 = 3188334211,pgs_3 = 1740983547,pgs_4 = 3951179215,pgs_6 = 1705376638,pgs_7 = 659922551,pgs_8 = 3836622392,pgs_9 = 4274012337,pgs_10 = "common/shape.wdf"}
	ZhandouModel["舞天姬"]={pgs_1 = 2774401093,pgs_2 = 2774401093,pgs_3 = 3043244041,pgs_4 = 86275401,pgs_6 = 3443216643,pgs_7 = 1786109105,pgs_8 = 1241775590,pgs_9 = 4118221086,pgs_10 = "common/shape.wdf"}
	ZhandouModel["舞天姬_飘带"]={pgs_1 = 2774401093,pgs_2 = 2774401093,pgs_3 = 3043244041,pgs_4 = 86275401,pgs_6 = 3443216643,pgs_7 = 1786109105,pgs_8 = 1241775590,pgs_9 = 4118221086,pgs_10 = "common/shape.wdf"}
	ZhandouModel["舞天姬_环圈"]={pgs_1 = 4193428466,pgs_2 = 4193428466,pgs_3 = 3043244041,pgs_4 = 2814262767,pgs_6 = 4189229797,pgs_7 = 3277294463,pgs_8 = 3942685609,pgs_9 = 610824997,pgs_10 = "common/shape.wdf"}
	ZhandouModel["巨魔王"]={pgs_1 = 508905397,pgs_2 = 508905397,pgs_3 = 2951893280,pgs_4 = 1635724392,pgs_6 = 2639845870,pgs_7 = 2750701818,pgs_8 = 2273495960,pgs_9 = 4081980249,pgs_10 = "common/shape.wdf"}
	ZhandouModel["巨魔王_斧钺"]={pgs_1 = 508905397,pgs_2 = 508905397,pgs_3 = 2951893280,pgs_4 = 1635724392,pgs_6 = 2639845870,pgs_7 = 2750701818,pgs_8 = 2273495960,pgs_9 = 4081980249,pgs_10 = "common/shape.wdf"}
	ZhandouModel["巨魔王_刀"]={pgs_1 = 1518169819,pgs_2 = 1518169819,pgs_3 = 2951893280,pgs_4 = 533876880,pgs_6 = 747524185,pgs_7 = 594523269,pgs_8 = 3417945932,pgs_9 = 2896805672,pgs_10 = "common/shape.wdf"}
	ZhandouModel["玄彩娥"]={pgs_1 = 3947923690,pgs_2 = 3947923690,pgs_3 = 1501032219,pgs_4 = 728904944,pgs_6 = 2291528828,pgs_7 = 2162415082,pgs_8 = 2234123373,pgs_9 = 2657283590,pgs_10 = "common/shape.wdf"}
	ZhandouModel["玄彩娥_魔棒"]={pgs_1 = 3947923690,pgs_2 = 3947923690,pgs_3 = 1501032219,pgs_4 = 3870010961,pgs_6 = 184048410,pgs_7 = 2162415082,pgs_8 = 2234123373,pgs_9 = 2657283590,pgs_10 = "common/shape.wdf"}
	ZhandouModel["玄彩娥_飘带"]={pgs_1 = 4201959108,pgs_2 = 4201959108,pgs_3 = 1501032219,pgs_4 = 728904944,pgs_6 = 2291528828,pgs_7 = 1617545683,pgs_8 = 339045070,pgs_9 = 2545689750,pgs_10 = "common/shape.wdf"}
	ZhandouModel["桃夭夭"]={pgs_1 =0x1a03df30,pgs_2 =0x1a03df30,pgs_3 =0x7f187687,pgs_4 =0x6b4481c,pgs_6 =0x3991e969,pgs_7 =0x9b8bc36b,pgs_8 =0xcc7c66c,pgs_9 =0xdd822e38,pgs_10 = "common/shape.wdf"}
	ZhandouModel["桃夭夭_灯笼"]={pgs_1 =0x1a03df30,pgs_2 =0x1a03df30,pgs_3 =0x7f187687,pgs_4 = 0x6b4481c,pgs_6 =0x3991e969,pgs_7 =0x9b8bc36b,pgs_8 = 0xcc7c66c,pgs_9 =0xdd822e38,pgs_10 = "common/shape.wdf"}
	ZhandouModel["桃夭夭_飘带"]={pgs_1 =0x3c82f54d,pgs_2 =0x3c82f54d,pgs_3 =0xb318ecf8,pgs_4 =0x82e34b44,pgs_6 =0xfb6e2b62,pgs_7 =0xa2e3009d,pgs_8 =0x71166311,pgs_9 =0x67073877,pgs_10 = "common/shape.wdf"}
	ZhandouModel["素纸灯_桃夭夭"]={pgs_1 =0x22ad0116,pgs_2 =0x22ad0116,pgs_3 =0x4417b129,pgs_4 = 0xb87618dc,pgs_6 =0xcac98ec9,pgs_7 =0x134b6a11,pgs_8 =0xf37445d5,pgs_9 =0x6df9943b,pgs_10 = "common/shape.wdf"}
	ZhandouModel["如意宫灯_桃夭夭"]={pgs_1 =0x88721101,pgs_2 =0x88721101,pgs_3 =0x1020d86,pgs_4 = 0x308e178f,pgs_6 =0xa5d2156f,pgs_7 =0x3a445c1a,pgs_8 =0xd832a9bd,pgs_9 =0xceb48c43,pgs_10 = "common/shape.wdf"}
	ZhandouModel["玉兔盏_桃夭夭"]={pgs_1 =0xd268fbd9,pgs_2 =0xd268fbd9,pgs_3 =0xbadf1f94,pgs_4 = 0xd3018212,pgs_6 =0xb53e4e80,pgs_7 =0x2ba599e2,pgs_8 =0x20302676,pgs_9 =0xb2827463,pgs_10 = "common/shape.wdf"}
	ZhandouModel["蟠龙_桃夭夭"]={pgs_1 =0x19edc0fa,pgs_2 =0x19edc0fa,pgs_3 =0x9322fd7b,pgs_4 = 0xa0e0350a,pgs_6 =0xdd3cb89e,pgs_7 =0x9864e2c8,pgs_8 =0xfad057ca,pgs_9 =0xf6c344b6,pgs_10 = "common/shape.wdf"}
	ZhandouModel["云鹤_桃夭夭"]={pgs_1 =0xb070eee1,pgs_2 =0xb070eee1,pgs_3 =0x2c85ff8d,pgs_4 = 0x38e04897,pgs_6 =0x6d8f66ba,pgs_7 =0x9425a996,pgs_8 =0xba9c52ae,pgs_9 = 0xe75caef5,pgs_10 = "common/shape.wdf"}
	ZhandouModel["风荷_桃夭夭"]={pgs_1 =0xf6d896b6,pgs_2 =0xf6d896b6,pgs_3 =0x6c50de51,pgs_4 = 0x5ac26b24,pgs_6 =0xc9883742,pgs_7 =0x6eb959f2,pgs_8 = 0xfccc31f,pgs_9 = 0xe82f8299,pgs_10 = "common/shape.wdf"}
	ZhandouModel["金风玉露_桃夭夭"]={pgs_1 =0x77a50bdc,pgs_2 =0x77a50bdc,pgs_3 =0xdd2cad1d,pgs_4 = 0x199302fe,pgs_6 =0x75483548,pgs_7 =0x8ee4a54b,pgs_8 =0xcc9574e2,pgs_9 = 0x2459ce56,pgs_10 = "common/shape.wdf"}
	ZhandouModel["凰火燎原_桃夭夭"]={pgs_1 =0xa87a5d2b,pgs_2 =0xa87a5d2b,pgs_3 =0x52c94be6,pgs_4 = 0xca6f214e,pgs_6 =0x1129a4ab,pgs_7 =0xfe30f591,pgs_8 =0xd2b85397,pgs_9 = 0xf5c5fd57,pgs_10 = "common/shape.wdf"}
	ZhandouModel["月露清愁_桃夭夭"]={pgs_1 =0x886127e1,pgs_2 =0x886127e1,pgs_3 =0xa0824967,pgs_4 = 0xa68b7212,pgs_6 =0xde519a20,pgs_7 =0x7c971917,pgs_8 =0x2fc262c4,pgs_9 = 0xfb3ab3e6,pgs_10 = "common/shape.wdf"}
	ZhandouModel["夭桃秾李_桃夭夭"]={pgs_1 =0x2debd3d7,pgs_2 =0x2debd3d7,pgs_3 =0xcc3c4690,pgs_4 = 0x584d6344,pgs_6 =0x9d644607,pgs_7 =0xaa34ad15,pgs_8 =0xa3b3f40e,pgs_9 = 0x39e1e2a6,pgs_10 = "common/shape.wdf"}
	ZhandouModel["荒尘_桃夭夭"]={pgs_1 =0x537aec81,pgs_2 =0x537aec81,pgs_3 =0x3b023441,pgs_4 = 0x7bb26165,pgs_6 =0xb3460fef,pgs_7 =0xba3628be,pgs_8 =0xfedd5513,pgs_9 = 0x9538c0e7,pgs_10 = "common/shape.wdf"}
	ZhandouModel["五色缎带_桃夭夭"]={pgs_1 =0xa53fecf4,pgs_2 =0xa53fecf4,pgs_3 =0xa1e7d445,pgs_4 =0xf3d9b16b,pgs_6 =0xb6495c7d,pgs_7 =0xfec751b2,pgs_8 =0x7c764187,pgs_9 =0x2151b286,pgs_10 = "common/shape.wdf"}
	ZhandouModel["无极丝_桃夭夭"]={pgs_1 =0x2dc47758,pgs_2 =0x2dc47758,pgs_3 =0xb3a754ce,pgs_4 = 0x7d829f97,pgs_6 =0x9cc635f2,pgs_7 =0x60d66d11,pgs_8 =0xa19d67df,pgs_9 =0x8b8352b7,pgs_10 = "common/shape.wdf"}
	ZhandouModel["七彩罗刹_桃夭夭"]={pgs_1 =0x4eb293c1,pgs_2 =0x4eb293c1,pgs_3 =0xa930b7be,pgs_4 =  0xee1e86d1,pgs_6 =0x12ea4c25,pgs_7 =0x9f13c3d0,pgs_8 =0x4bf0188,pgs_9 =0xf9d6c3b0,pgs_10 = "common/shape.wdf"}
	ZhandouModel["彩虹_桃夭夭"]={pgs_1 =0xa4e7e620,pgs_2 =0xa4e7e620,pgs_3 =0x7116581a,pgs_4 =0xbe9b3d09,pgs_6 =0x2ad9ea91,pgs_7 =0x723c25dd,pgs_8 =0xb7e14a4f,pgs_9 =0x620fe6b1,pgs_10 = "common/shape.wdf"}
	ZhandouModel["流云_桃夭夭"]={pgs_1 =0x6f2e866f,pgs_2 =0x6f2e866f,pgs_3 =0xcd434139,pgs_4 =0x9d63ef9d,pgs_6 =0x1fe48f84,pgs_7 =0xc923ce1,pgs_8 =0xf0ea98e1,pgs_9 =0x469aca2a,pgs_10 = "common/shape.wdf"}
	ZhandouModel["碧波_桃夭夭"]={pgs_1 =0xce2b41ec,pgs_2 =0xce2b41ec,pgs_3 =0x1de079ad,pgs_4 =0x43d5e3bf,pgs_6 =0x37017692,pgs_7 =0x61bb1655,pgs_8 =0x28d8b610,pgs_9 =0x10ddce44,pgs_10 = "common/shape.wdf"}
	ZhandouModel["秋水落霞_桃夭夭"]={pgs_1 =0x169138c8,pgs_2 =0x169138c8,pgs_3 =0x87fbd841,pgs_4 =0x6329fe9e,pgs_6 =0xd292e908,pgs_7 =0x169e2035,pgs_8 =0xf8167e8d,pgs_9 =0x7ec4569e,pgs_10 = "common/shape.wdf"}
	ZhandouModel["晃金仙绳_桃夭夭"]={pgs_1 =0xc298b821,pgs_2 =0xc298b821,pgs_3 =0xfb027bb6,pgs_4 =0x3881f0f3,pgs_6 =0x7c243bcf,pgs_7 =0x1001ee49,pgs_8 =0x891407e9,pgs_9 =0x11353491,pgs_10 = "common/shape.wdf"}
	ZhandouModel["此最相思_桃夭夭"]={pgs_1 =0xedec5cbc,pgs_2 =0xedec5cbc,pgs_3 =0xa0de2fef,pgs_4 =0x4a7673fe,pgs_6 =0x348d04ba,pgs_7 =0xb08135f3,pgs_8 =0x9ddee2cd,pgs_9 =0x208786e5,pgs_10 = "common/shape.wdf"}
	ZhandouModel["揽月摘星_桃夭夭"]={pgs_1 =0x7709c75,pgs_2 =0x7709c75,pgs_3 =0x8e3ba76,pgs_4 =0x88c1356a,pgs_6 =0xb0bbe8c7,pgs_7 =0xcc0caec1,pgs_8 =0x79521faa,pgs_9 =0x474085ed,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九霄_桃夭夭"]={pgs_1 =0x7f1a6777,pgs_2 =0x7f1a6777,pgs_3 =0xebbd89fa,pgs_4 =0x8310f14c,pgs_6 =0x3cecb898,pgs_7 =0x31b08320,pgs_8 =0xa30a11d2,pgs_9 =0x7045a7d2,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["偃无师"]={pgs_1 = 0xafa4cfec,pgs_2 = 0xafa4cfec,pgs_3 = 0x85509c8,pgs_4 = 0xc90f21c,pgs_6 = 0x521d4408,pgs_7 = 0x22a9ca3c,pgs_8 = 0x4e662122,pgs_9 = 0xbf4b1d4a,pgs_10 = "common/shape.wdf"}
	ZhandouModel["偃无师_巨剑"]={pgs_1 = 0xafa4cfec,pgs_2 = 0xafa4cfec,pgs_3 = 0x85509c8,pgs_4 = 0xc90f21c,pgs_6 = 0x521d4408,pgs_7 = 0x22a9ca3c,pgs_8 = 0x4e662122,pgs_9 = 0xbf4b1d4a,pgs_10 = "common/shape.wdf"}
	ZhandouModel["偃无师_剑"]={pgs_1 = 0xad061995,pgs_2 = 0xad061995,pgs_3 = 0x82d23cd2,pgs_4 = 0xdc74d786,pgs_6 = 0x6f2aee3e,pgs_7 = 0x4a07d4e6,pgs_8 = 0x3dd83ab2,pgs_9 = 0xcb726c52,pgs_10 = "common/shape.wdf"}
	ZhandouModel["钝铁重剑_偃无师"]={pgs_1 = 0x9b705dfc,pgs_2 = 0x9b705dfc,pgs_3 = 0xe4fb8084,pgs_4 = 0x27b5e405,pgs_6 = 0x4f8b5293,pgs_7 = 0x7af690ab,pgs_8 = 0xdae58736,pgs_9 = 0x820b063,pgs_10 = "common/shape.wdf"}
	ZhandouModel["壁玉长铗_偃无师"]={pgs_1 = 0x3091b3bb,pgs_2 = 0x3091b3bb,pgs_3 = 0x4863d36b,pgs_4 = 0xca927285,pgs_6 = 0xd78128a6,pgs_7 = 0xd563a7f3,pgs_8 = 0xb4defa9d,pgs_9 = 0x4ba39302,pgs_10 = "common/shape.wdf"}
	ZhandouModel["惊涛雪_偃无师"]={pgs_1 = 0x193de511,pgs_2 = 0x193de511,pgs_3 = 0xf2ac8d4c,pgs_4 = 0x1b5540b9,pgs_6 = 0x25f948aa,pgs_7 = 0x57121661,pgs_8 = 0x24ab4742,pgs_9 = 0x6a768302,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鸦九_偃无师"]={pgs_1 = 0xa23c58fd,pgs_2 = 0xa23c58fd,pgs_3 = 0x4eab1898,pgs_4 = 0x70910530,pgs_6 = 0x6cdf9821,pgs_7 = 0xee7edf15,pgs_8 = 0x6fcb07e7,pgs_9 = 0xf38c0901,pgs_10 = "common/shape.wdf"}
	ZhandouModel["昆吾_偃无师"]={pgs_1 = 0x673c07b1,pgs_2 = 0x673c07b1,pgs_3 = 0x2d94eb0e,pgs_4 = 0xaed16a4e,pgs_6 = 0x52aed75a,pgs_7 = 0x7df86859,pgs_8 = 0x64313732,pgs_9 = 0x2fc105f4,pgs_10 = "common/shape.wdf"}
	ZhandouModel["弦歌_偃无师"]={pgs_1 = 0xaad90a0b,pgs_2 = 0xaad90a0b,pgs_3 = 0x8ded764d,pgs_4 = 0xfae608,pgs_6 = 0xad7f34f6,pgs_7 = 0xbd506694,pgs_8 = 0x1dc96138,pgs_9 = 0xc7b7a920,pgs_10 = "common/shape.wdf"}
	ZhandouModel["墨骨枯麟_偃无师"]={pgs_1 = 0x978efcfa,pgs_2 = 0x978efcfa,pgs_3 = 0xd313d551,pgs_4 = 0xa1bb932,pgs_6 = 0xd7c4635b,pgs_7 = 0x38762fac,pgs_8 = 0x886a209c,pgs_9 = 0xcda81fbe,pgs_10 = "common/shape.wdf"}
	ZhandouModel["腾蛇郁刃_偃无师"]={pgs_1 = 0x41c3161c,pgs_2 = 0x41c3161c,pgs_3 = 0x23bf6d3e,pgs_4 = 0x2e604d5c,pgs_6 = 0x7ef4f80c,pgs_7 = 0x6be248b6,pgs_8 = 0x64ce0c0e,pgs_9 = 0x64c5f528,pgs_10 = "common/shape.wdf"}
	ZhandouModel["秋水澄流_偃无师"]={pgs_1 = 0xdfa2c2e,pgs_2 = 0xdfa2c2e,pgs_3 = 0xeb19c33c,pgs_4 = 0x51fd5287,pgs_6 = 0x20e87072,pgs_7 = 0xcc7777dd,pgs_8 = 0xd497f6d1,pgs_9 = 0xc6b32cf4,pgs_10 = "common/shape.wdf"}
	ZhandouModel["百辟镇魂_偃无师"]={pgs_1 = 0xfbfad6c9,pgs_2 = 0xfbfad6c9,pgs_3 = 0x67d5aa8,pgs_4 = 0x31b99d8d,pgs_6 = 0x834bed74,pgs_7 = 0xcd37ef04,pgs_8 = 0x55b2278a,pgs_9 = 0x53ab516,pgs_10 = "common/shape.wdf"}
	ZhandouModel["长息_偃无师"]={pgs_1 = 0x50430ce5,pgs_2 = 0x50430ce5,pgs_3 = 0xbf6da3f0,pgs_4 = 0xbd247eda,pgs_6 = 0x4a0d3123,pgs_7 = 0x1ad155f4,pgs_8 = 0x8d342ba9,pgs_9 = 0x344f1cd7,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青铜短剑_偃无师"]={pgs_1 = 0xf8dd37cb,pgs_2 = 0xf8dd37cb,pgs_3 = 0xa2a6256e,pgs_4 = 0x998f0f9a,pgs_6 = 0x46db51e2,pgs_7 = 0x54507e29,pgs_8 = 0xf264f47a,pgs_9 = 0xdfaf8493,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青锋剑_偃无师"]={pgs_1 = 0xaee8bd71,pgs_2 = 0xaee8bd71,pgs_3 = 0x63e57f9d,pgs_4 = 0xd7c8f9e8,pgs_6 = 0xb02a17de,pgs_7 = 0x257f48fb,pgs_8 = 0xa803878f,pgs_9 = 0x7bd1465c,pgs_10 = "common/shape.wdf"}
	ZhandouModel["游龙剑_偃无师"]={pgs_1 = 0x8275e104,pgs_2 = 0x8275e104,pgs_3 = 0x2261634,pgs_4 = 0xfa873366,pgs_6 = 0x3357f4ce,pgs_7 = 0xa4f1c098,pgs_8 = 0x76797182,pgs_9 = 0x99b2418,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鱼肠_偃无师"]={pgs_1 = 0x1f507e66,pgs_2 = 0x1f507e66,pgs_3 = 0x7ab885f,pgs_4 = 0x796299c5,pgs_6 = 0x97f5e71,pgs_7 = 0xce9cadf3,pgs_8 = 0x19d6bb89,pgs_9 = 0xe167d72d,pgs_10 = "common/shape.wdf"}
	ZhandouModel["倚天_偃无师"]={pgs_1 = 0x9a54cf2e,pgs_2 = 0x9a54cf2e,pgs_3 = 0xe33e1d20,pgs_4 = 0x3632d870,pgs_6 = 0x7f8db9c8,pgs_7 = 0xfebbbc14,pgs_8 = 0x18cb12ea,pgs_9 = 0xba3e2ad9,pgs_10 = "common/shape.wdf"}
	ZhandouModel["湛卢_偃无师"]={pgs_1 = 0xd9a821cc,pgs_2 = 0xd9a821cc,pgs_3 = 0x7ab82ea7,pgs_4 = 0x52ade316,pgs_6 = 0xb1df0e1b,pgs_7 = 0x17daffd2,pgs_8 = 0xd501afbb,pgs_9 = 0x5d681d5c,pgs_10 = "common/shape.wdf"}
	ZhandouModel["魏武青虹_偃无师"]={pgs_1 = 0xf870cff7,pgs_2 = 0xf870cff7,pgs_3 = 0x10ad6201,pgs_4 = 0x2120194f,pgs_6 = 0xfb30dc17,pgs_7 = 0xe25c0098,pgs_8 = 0xe994cbc7,pgs_9 = 0x76de282f,pgs_10 = "common/shape.wdf"}
	ZhandouModel["灵犀神剑_偃无师"]={pgs_1 = 0x53ff28df,pgs_2 = 0x53ff28df,pgs_3 = 0x55e1ac27,pgs_4 = 0x9ca9aa0d,pgs_6 = 0xed47ed45,pgs_7 = 0xf3cdbf99,pgs_8 = 0x95ae8983,pgs_9 = 0x398d9ddc,pgs_10 = "common/shape.wdf"}
	ZhandouModel["四法青云_偃无师"]={pgs_1 = 0x7f89fcb3,pgs_2 = 0x7f89fcb3,pgs_3 = 0x919e5c,pgs_4 = 0xae8c251a,pgs_6 = 0xdf6b7526,pgs_7 = 0x2d55f615,pgs_8 = 0x4906093,pgs_9 = 0x8fc40f24,pgs_10 = "common/shape.wdf"}
	ZhandouModel["霜冷九州_偃无师"]={pgs_1 = 0xf7d26ea8,pgs_2 = 0xf7d26ea8,pgs_3 = 0x1824e3a5,pgs_4 = 0xf062ca2,pgs_6 = 0xd2656d03,pgs_7 = 0x2e368961,pgs_8 = 0x853cfdd9,pgs_9 = 0x129c0ce6,pgs_10 = "common/shape.wdf"}
	ZhandouModel["擒龙_偃无师"]={pgs_1 = 0xf540ee21,pgs_2 = 0xf540ee21,pgs_3 = 0x25309ec1,pgs_4 = 0x23069ca,pgs_6 = 0x5c2c0872,pgs_7 = 0x769ce33e,pgs_8 = 0x2c7a88d9,pgs_9 = 0xefb68790,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["鬼潇潇"]={pgs_1 = 0x1ba0d020,pgs_2 = 0x1ba0d020,pgs_3 = 0x16603d24,pgs_4 = 0xf5cb2334,pgs_6 = 0x5777c1b1,pgs_7 = 0xc6d60a6,pgs_8 = 0x391f4c8d,pgs_9 = 0x13e75e87,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鬼潇潇_伞"]={pgs_1 = 0x1ba0d020,pgs_2 = 0x1ba0d020,pgs_3 = 0x16603d24,pgs_4 = 0xf5cb2334,pgs_6 = 0x5777c1b1,pgs_7 = 0x2512d0b8,pgs_8 = 0x391f4c8d,pgs_9 =  0x13e75e87,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鬼潇潇_爪刺"]={pgs_1 =0x9308957c,pgs_2 =0x9308957c,pgs_3 =0x69e9b3fd,pgs_4 = 0x5423348e,pgs_6 =0xb93971ac,pgs_7 = 0xc6d60a6,pgs_8 = 0xffcf7efa,pgs_9 = 0x78f0f6cb,pgs_10 = "common/shape.wdf"}
	ZhandouModel["红罗伞_鬼潇潇"]={pgs_1 = 0x13dcb6f5,pgs_2 = 0x13dcb6f5,pgs_3 = 0x4da43b21,pgs_4 = 0x9ac28de5,pgs_6 = 0x72a11b43,pgs_7 = 0x27c2632f,pgs_8 = 0x860771ff,pgs_9 = 0x7a37608,pgs_10 = "common/shape.wdf"}
	ZhandouModel["油纸伞_鬼潇潇"]={pgs_1 = 0x13dcb6f5,pgs_2 = 0x13dcb6f5,pgs_3 = 0x4da43b21,pgs_4 = 0x9ac28de5,pgs_6 = 0x72a11b43,pgs_7 = 0x27c2632f,pgs_8 = 0x860771ff,pgs_9 = 0x7a37608,pgs_10 = "common/shape.wdf"}
	ZhandouModel["紫竹伞_鬼潇潇"]={pgs_1 = 0x13dcb6f5,pgs_2 = 0x13dcb6f5,pgs_3 = 0x4da43b21,pgs_4 = 0x9ac28de5,pgs_6 = 0x72a11b43,pgs_7 = 0x27c2632f,pgs_8 = 0x860771ff,pgs_9 = 0x7a37608,pgs_10 = "common/shape.wdf"}

	ZhandouModel["琳琅盖_鬼潇潇"]={pgs_1 = 0xef5199e4,pgs_2 = 0xef5199e4,pgs_3 = 0x4935ede3,pgs_4 = 0x8d4bfa3d,pgs_6 = 0x606bf0c5,pgs_7 = 0x69ad515c,pgs_8 = 0x54dd0aa9,pgs_9 = 0x995417f0,pgs_10 = "common/shape.wdf"}
	ZhandouModel["锦绣椎_鬼潇潇"]={pgs_1 = 0xef5199e4,pgs_2 = 0xef5199e4,pgs_3 = 0x4935ede3,pgs_4 = 0x8d4bfa3d,pgs_6 = 0x606bf0c5,pgs_7 = 0x69ad515c,pgs_8 = 0x54dd0aa9,pgs_9 = 0x995417f0,pgs_10 = "common/shape.wdf"}
	ZhandouModel["幽兰帐_鬼潇潇"]={pgs_1 = 0xef5199e4,pgs_2 = 0xef5199e4,pgs_3 = 0x4935ede3,pgs_4 = 0x8d4bfa3d,pgs_6 = 0x606bf0c5,pgs_7 = 0x69ad515c,pgs_8 = 0x54dd0aa9,pgs_9 = 0x995417f0,pgs_10 = "common/shape.wdf"}
	ZhandouModel["金刚伞_鬼潇潇"]={pgs_1 = 0x88ff6368,pgs_2 = 0x88ff6368,pgs_3 = 0xa8a7dd8f,pgs_4 = 0xa213a5d7,pgs_6 = 0x5b29f582,pgs_7 = 0x8920f9c7,pgs_8 = 0xe7c7ed96,pgs_9 = 0x733db9b,pgs_10 = "common/shape.wdf"}
	ZhandouModel["鬼骨_鬼潇潇"]={pgs_1 = 0xc13dfbf9,pgs_2 = 0xc13dfbf9,pgs_3 = 0xc5eb3d87,pgs_4 = 0x6a274bc3,pgs_6 = 0xc5fb9878,pgs_7 = 0x43e46273,pgs_8 = 0xc6ee2079,pgs_9 = 0x483034e,pgs_10 = "common/shape.wdf"}
	ZhandouModel["云梦_鬼潇潇"]={pgs_1 = 0x79bb36ba,pgs_2 = 0x79bb36ba,pgs_3 = 0x7cc2e7af,pgs_4 = 0x97f1f96d,pgs_6 = 0x736fdbc6,pgs_7 = 0xba8614a0,pgs_8 = 0xfedc081b,pgs_9 = 0x52bf4fe1,pgs_10 = "common/shape.wdf"}
	ZhandouModel["枕霞_鬼潇潇"]={pgs_1 = 0xd1d08451,pgs_2 = 0xd1d08451,pgs_3 = 0x431d2334,pgs_4 = 0x49c00677,pgs_6 = 0x6a18ea72,pgs_7 = 0x5520f7a3,pgs_8 = 0xa4631e15,pgs_9 = 0xbc7e59ae,pgs_10 = "common/shape.wdf"}
	ZhandouModel["月影星痕_鬼潇潇"]={pgs_1 = 0xbd7484eb,pgs_2 = 0xbd7484eb,pgs_3 = 0xb254801a,pgs_4 = 0xcedfce6e,pgs_6 = 0x1ed16b0,pgs_7 = 0xd7e7626,pgs_8 = 0x708875c0,pgs_9 = 0xfa7b67f1,pgs_10 = "common/shape.wdf"}
	ZhandouModel["雪羽穿云_鬼潇潇"]={pgs_1 = 0x603eb4e4,pgs_2 = 0x603eb4e4,pgs_3 = 0x783a196a,pgs_4 = 0xbb22fe45,pgs_6 = 0x5460d705,pgs_7 = 0x51337a6c,pgs_8 = 0x3b7ce297,pgs_9 = 0xc73db590,pgs_10 = "common/shape.wdf"}
	ZhandouModel["碧火琉璃_鬼潇潇"]={pgs_1 = 0x6023305a,pgs_2 = 0x6023305a,pgs_3 = 0xedd53776,pgs_4 = 0xc21e2453,pgs_6 = 0xcc2e3462,pgs_7 = 0x10a8c4bc,pgs_8 = 0x8df0c2f9,pgs_9 = 0x5471b14e,pgs_10 = "common/shape.wdf"}
	ZhandouModel["浮生归梦_鬼潇潇"]={pgs_1 = 0xc3c2168b,pgs_2 = 0xc3c2168b,pgs_3 = 0x50380adf,pgs_4 = 0x3a7a787c,pgs_6 = 0xa3ad8994,pgs_7 = 0xdd685d4e,pgs_8 = 0xd111529a,pgs_9 = 0x2328866c,pgs_10 = "common/shape.wdf"}
	ZhandouModel["晴雪_鬼潇潇"]={pgs_1 = 0x86240202,pgs_2 = 0x86240202,pgs_3 = 0xd45760c,pgs_4 = 0x9181349b,pgs_6 = 0xa8c2fc83,pgs_7 = 0x2e52cde4,pgs_8 = 0x43022433,pgs_9 = 0x15799adc,pgs_10 = "common/shape.wdf"}
	ZhandouModel["铁爪_鬼潇潇"]={pgs_1 = 0xd8c84714,pgs_2 = 0xd8c84714,pgs_3 = 0xc42aa234,pgs_4 = 0x2bbb7044,pgs_6 = 0xfa704666,pgs_7 = 0x4dc318c9,pgs_8 = 0xd104e67f,pgs_9 = 0x4496ca86,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青龙牙_鬼潇潇"]={pgs_1 = 0x8c811220,pgs_2 = 0x8c811220,pgs_3 = 0x6422b0d5,pgs_4 = 0xc87d6432,pgs_6 = 0xbbb66679,pgs_7 = 0xc1d12715,pgs_8 = 0x71e45393,pgs_9 = 0x98f6a979,pgs_10 = "common/shape.wdf"}
	ZhandouModel["青刚刺_鬼潇潇"]={pgs_1 = 0x4ab65936,pgs_2 = 0x4ab65936,pgs_3 = 0xffb3516c,pgs_4 = 0xefd58471,pgs_6 = 0x8cd79c98,pgs_7 = 0xd3e18bfb,pgs_8 = 0x708b7c5,pgs_9 = 0x9c6aed3b,pgs_10 = "common/shape.wdf"}
	ZhandouModel["撕天_鬼潇潇"]={pgs_1 = 0x450c888a,pgs_2 = 0x450c888a,pgs_3 = 0x60b8f5b2,pgs_4 = 0x3fb86dec,pgs_6 = 0xa5ebba28,pgs_7 = 0x78ed127d,pgs_8 = 0x23a26760,pgs_9 = 0x36ce4aca,pgs_10 = "common/shape.wdf"}
	ZhandouModel["毒牙_鬼潇潇"]={pgs_1 = 0x51b463a,pgs_2 = 0x51b463a,pgs_3 = 0x73792347,pgs_4 = 0x8292637d,pgs_6 = 0x470ba647,pgs_7 = 0xc9af27aa,pgs_8 = 0xa1709867,pgs_9 = 0xecf48fe4,pgs_10 = "common/shape.wdf"}
	ZhandouModel["胭脂_鬼潇潇"]={pgs_1 = 0x2e1083fe,pgs_2 = 0x2e1083fe,pgs_3 = 0x9ece2c4,pgs_4 = 0xef3e8d26,pgs_6 = 0x5d578929,pgs_7 = 0x1501be96,pgs_8 = 0x17dee18f,pgs_9 = 0x6d1c58d9,pgs_10 = "common/shape.wdf"}
	ZhandouModel["九阴勾魂_鬼潇潇"]={pgs_1 = 0x42399936,pgs_2 = 0x42399936,pgs_3 = 0xb8fc756f,pgs_4 =  0x3b85fa19,pgs_6 = 0x419d4670,pgs_7 = 0x89eaa81,pgs_8 = 0x17473047,pgs_9 = 0xed25a4a3,pgs_10 = "common/shape.wdf"}
	ZhandouModel["雪蚕之刺_鬼潇潇"]={pgs_1 = 0xa93e1fd5,pgs_2 = 0xa93e1fd5,pgs_3 = 0xe12d30cf,pgs_4 = 0x8f87c512,pgs_6 = 0x5f3920e8,pgs_7 = 0xdf5499b8,pgs_8 = 0x51699cee,pgs_9 = 0x318949e3,pgs_10 = "common/shape.wdf"}
	ZhandouModel["贵霜之牙_鬼潇潇"]={pgs_1 = 0xd8270ca8,pgs_2 = 0xd8270ca8,pgs_3 = 0xe7d2f1d3,pgs_4 = 0x9b7f1c84,pgs_6 = 0x40a723ef,pgs_7 = 0xf9361347,pgs_8 = 0xbc2b048e,pgs_9 = 0x29c67740,pgs_10 = "common/shape.wdf"}
	ZhandouModel["忘川三途_鬼潇潇"]={pgs_1 = 0xc688ef38,pgs_2 = 0xc688ef38,pgs_3 = 0x49f7c06e,pgs_4 = 0x1e8cce73,pgs_6 = 0xbac52da2,pgs_7 = 0x23d984c,pgs_8 = 0x2ee39875,pgs_9 = 0xa4749be3,pgs_10 = "common/shape.wdf"}
	ZhandouModel["离钩_鬼潇潇"]={pgs_1 = 0xe15bc68d,pgs_2 = 0xe15bc68d,pgs_3 = 0xcd0dec76,pgs_4 = 0x1147d15,pgs_6 = 0xb0abea3d,pgs_7 = 0x60613bc6,pgs_8 = 0x2e602dcb,pgs_9 = 0xff43b2d1,pgs_10 = "common/shape.wdf"
}
	ZhandouModel["剑侠客"]={pgs_1 = 2840575336,pgs_2 = 2840575336,pgs_3 = 0x7671ebdf,pgs_4 = 3738000150,pgs_6 = 2626634241,pgs_7 = 1486978342,pgs_8 = 512918654,pgs_9 = 0x883ee3da,pgs_10 = "shape.wdf"}
	ZhandouModel["剑侠客_刀"]={ -- 1是攻击 2是第二种形态攻击 3是死亡 4是防御 6是待战 7是施法 8是跑去 9是挨打 10是资源包
		pgs_1 = 3074477781,pgs_2 = 3074477781,pgs_3 = 991657694,pgs_4 = 2583942498,pgs_6 = 1121741199,pgs_7 = 701848281,pgs_8 = 621175708,pgs_9 = 2285822938,pgs_10 = "shape.wdf"}
	ZhandouModel["剑侠客_剑"]={pgs_1 = 2840575336,pgs_2 = 2840575336,pgs_3 = 0x7671ebdf,pgs_4 = 3738000150,pgs_6 = 2626634241,pgs_7 = 1486978342,pgs_8 = 512918654,pgs_9 = 0x883ee3da,pgs_10 = "shape.wdf"}
	ZhandouModel["英女侠"]={pgs_1 = 1131552735,pgs_2 = 1131552735,pgs_3 = 550776032,pgs_4 = 1762226248,pgs_6 = 283881972,pgs_7 = 1333230872,pgs_8 = 2022264436,pgs_9 = 1784128647,pgs_10 = "shape.wdf"}
	ZhandouModel["英女侠_鞭"]={pgs_1 = 1083652265,pgs_2 = 1083652265,pgs_3 = 550776032,pgs_4 = 1830207536,pgs_6 = 487493048,pgs_7 = 4015503046,pgs_8 = 3420727052,pgs_9 = 2264625814,pgs_10 = "shape.wdf"}
	ZhandouModel["英女侠_双短剑"]={pgs_1 = 1131552735,pgs_2 = 1131552735,pgs_3 = 550776032,pgs_4 = 1762226248,pgs_6 = 283881972,pgs_7 = 1333230872,pgs_8 = 2022264436,pgs_9 = 1784128647,pgs_10 = "shape.wdf"
}
	ZhandouModel["双短剑_英女侠"]={pgs_1 = 2749813573,pgs_2 = 2749813573,pgs_3 = 3182553286,pgs_4 = 2212413736,pgs_6 = 0x8f937d83,pgs_7 = 4220417948,pgs_8 = 3709846822,pgs_9 = 4251803233,pgs_10 = "shape.wdf"}
	ZhandouModel["竹节双剑_英女侠"]={pgs_1 = 785035487,pgs_2 = 785035487,pgs_3 = 388404819,pgs_4 = 3063317704,pgs_6 = 781929242,pgs_7 = 992739922,pgs_8 = 2099829177,pgs_9 = 2839104966,pgs_10 = "shape.wdf"}
	ZhandouModel["赤焰双剑_英女侠"]={pgs_1 = 4168647024,pgs_2 = 4168647024,pgs_3 = 3572817351,pgs_4 = 712581498,pgs_6 = 2658138658,pgs_7 = 2764921579,pgs_8 = 2741994479,pgs_9 = 4235932064,pgs_10 = "shape.wdf"}
	ZhandouModel["牛皮鞭_英女侠"]={pgs_1 = 3931398716,pgs_2 = 3931398716,pgs_3 = 1978009081,pgs_4 = 3180100501,pgs_6 = 2391704735,pgs_7 = 2419933303,pgs_8 = 2521677817,pgs_9 = 2956424440,pgs_10 = "shape.wdf"}
	ZhandouModel["青藤柳叶鞭_英女侠"]={pgs_1 = 2804585084,pgs_2 = 2804585084,pgs_3 = 60106873,pgs_4 = 1142701864,pgs_6 = 3663657779,pgs_7 = 1499832483,pgs_8 = 3691312807,pgs_9 = 3691312807,pgs_10 = "shape.wdf"}
	ZhandouModel["钢结鞭_英女侠"]={pgs_1 = 271263789,pgs_2 = 271263789,pgs_3 = 1861510591,pgs_4 = 1546457330,pgs_6 = 2479743000,pgs_7 = 95594363,pgs_8 = 2418442398,pgs_9 = 1501213311,pgs_10 = "shape.wdf"}
	ZhandouModel["灵蛇_英女侠"]={pgs_1 = 3036397933,pgs_2 = 3036397933,pgs_3 = 109615900,pgs_4 = 2747926100,pgs_6 = 2286194550,pgs_7 = 2559098069,pgs_8 = 227111990,pgs_9 = 2520581903,pgs_10 = "shape.wdf"}
	ZhandouModel["游龙惊鸿_英女侠"]={pgs_1 = 1724242915,pgs_2 = 1724242915,pgs_3 = 84894305,pgs_4 = 1910956791,pgs_6 = 4279024946,pgs_7 = 4245988549,pgs_8 = 204351801,pgs_9 = 3689683150,pgs_10 = "shape.wd3"}
	ZhandouModel["百花_英女侠旧"]={pgs_1 = 120,pgs_2 = 120,pgs_3 = 128,pgs_4 = 119,pgs_6 = 130,pgs_7 = 121,pgs_8 = 129,pgs_9 = 117,pgs_10 = "shape.wdf"}
	ZhandouModel["月光双剑_英女侠"]={pgs_1 = 2739970529,pgs_2 = 2739970529,pgs_3 = 1305035055,pgs_4 = 908717950,pgs_6 = 1760682539,pgs_7 = 433987877,pgs_8 = 2692136956,pgs_9 = 3445935850,pgs_10 = "shape.wdf"}
	ZhandouModel["祖龙对剑_英女侠"]={pgs_1 = 371522347,pgs_2 = 371522347,pgs_3 = 1072281713,pgs_4 = 3068921098,pgs_6 = 3389582086,pgs_7 = 388288592,pgs_8 = 640740376,pgs_9 = 3752665492,pgs_10 = "shape.wd3"}
	ZhandouModel["紫电青霜_英女侠"]={pgs_1 = 2940261156,pgs_2 = 2940261156,pgs_3 = 0x666e547d,pgs_4 = 1476632389,pgs_6 = 2376803038,pgs_7 = 3092849276,pgs_8 = 1335963374,pgs_9 = 3005914168,pgs_10 = "shape.wd8"}
	ZhandouModel["浮犀_英女侠"]={pgs_1 = 1239588375,pgs_2 = 1239588375,pgs_3 = 0756053968,pgs_4 = 0821109265,pgs_6 = 1472865246,pgs_7 = 2192274301,pgs_8 = 1990043008,pgs_9 = 3996927795,pgs_10 = "shape.wd9"}
	ZhandouModel["阴阳_英女侠"]={pgs_1 = 3489122494,pgs_2 = 3489122494,pgs_3 = 880749981,pgs_4 = 4142038041,pgs_6 = 2678300879,pgs_7 = 3591452298,pgs_8 = 351801901,pgs_9 = 2182164503,pgs_10 = "shape.wdf"}
	ZhandouModel["连理双树_英女侠"]={pgs_1 = 1056087193,pgs_2 = 1056087193,pgs_3 = 158990972,pgs_4 = 2230185189,pgs_6 = 3682647142,pgs_7 = 3580865845,pgs_8 = 686282707,pgs_9 = 3554518006,pgs_10 = "shape.wd3"}
	ZhandouModel["龙筋_英女侠旧"]={pgs_1 = 151,pgs_2 = 151,pgs_3 = 153,pgs_4 = 150,pgs_6 = 257,pgs_7 = 152,pgs_8 = 256,pgs_9 = 148,pgs_10 = "shape.wdf"}
	ZhandouModel["月光双剑_英女侠旧"]={pgs_1 = 293,pgs_2 = 293,pgs_3 = 295,pgs_4 = 292,pgs_6 = 297,pgs_7 = 294,pgs_8 = 296,pgs_9 = 290,pgs_10 = "shape.wdf"}
	ZhandouModel["阴阳_英女侠旧"]={pgs_1 = 293,pgs_2 = 293,pgs_3 = 295,pgs_4 = 292,pgs_6 = 297,pgs_7 = 294,pgs_8 = 296,pgs_9 = 290,pgs_10 = "shape.wdf"}
	ZhandouModel["吹雪_英女侠"]={pgs_1 = 1984457860,pgs_2 = 1984457860,pgs_3 = 2659822722,pgs_4 = 4091160803,pgs_6 = 2259108135,pgs_7 = 1616653577,pgs_8 = 0x1a1a871e,pgs_9 = 1671498156,pgs_10 = "shape.wdf"}
	ZhandouModel["百花_英女侠"]={pgs_1 = 1180240329,pgs_2 = 1180240329,pgs_3 = 2921076198,pgs_4 = 2432608663,pgs_6 = 1464871645,pgs_7 = 2411376211,pgs_8 = 0x4f96b7d3,pgs_9 = 1686679961,pgs_10 = "shape.wdf"}
	ZhandouModel["血之刺藤_英女侠"]={pgs_1 = 543888368,pgs_2 = 543888368,pgs_3 = 3535124792,pgs_4 = 1279996625,pgs_6 = 676243872,pgs_7 = 355830171,pgs_8 = 3183836178,pgs_9 = 373595036,pgs_10 = "shape.wd3"}
	ZhandouModel["牧云清歌_英女侠"]={pgs_1 = 4166360919,pgs_2 = 4166360919,pgs_3 = 2255696063,pgs_4 = 3268785498,pgs_6 = 0534627512,pgs_7 = 1644779301,pgs_8 = 0411350546,pgs_9 = 3269704350,pgs_10 = "shape.wd8"}
	ZhandouModel["霜陨_英女侠"]={pgs_1 = 3617687903,pgs_2 = 3617687903,pgs_3 = 3055706917,pgs_4 = 0667306037,pgs_6 = 4248825161,pgs_7 = 0234849785,pgs_8 = 0336164631,pgs_9 = 2174583476,pgs_10 = "shape.wd9"}
	ZhandouModel["游龙惊鸿_英女侠旧"]={pgs_1 = 17,pgs_2 = 17,pgs_3 = 19,pgs_4 = 16,pgs_6 = 368,pgs_7 = 18,pgs_8 = 361,pgs_9 = 8,pgs_10 = "shape.wdf"}
	ZhandouModel["金龙双剪_英女侠"]={pgs_1 = 2024899093,pgs_2 = 2024899093,pgs_3 = 3727381444,pgs_4 = 2340031682,pgs_6 = 1687704448,pgs_7 = 573860286,pgs_8 = 1396936106,pgs_9 = 2113820492,pgs_10 = "shape.wd3"}
	ZhandouModel["仙人指路_英女侠"]={pgs_1 = 1536229276,pgs_2 = 1536229276,pgs_3 = 3074198838,pgs_4 = 781619913,pgs_6 = 2533848487,pgs_7 = 4069179535,pgs_8 = 1975224690,pgs_9 = 1681443649,pgs_10 = "shape.wd3"}
	ZhandouModel["龙筋_英女侠"]={pgs_1 = 983659718,pgs_2 = 983659718,pgs_3 = 4209944243,pgs_4 = 1910275062,pgs_6 = 2426563525,pgs_7 = 3749832411,pgs_8 = 0xa4346f9e,pgs_9 = 1847888299,pgs_10 = "shape.wdf"}
	ZhandouModel["灵蛇_英女侠旧"]={pgs_1 = 262,pgs_2 = 262,pgs_3 = 264,pgs_4 = 261,pgs_6 = 272,pgs_7 = 263,pgs_8 = 265,pgs_9 = 407,pgs_10 = "shape.wdf"}
	ZhandouModel["吹雪_英女侠旧"]={pgs_1 = 120,pgs_2 = 120,pgs_3 = 128,pgs_4 = 119,pgs_6 = 130,pgs_7 = 121,pgs_8 = 129,pgs_9 = 117,pgs_10 = "shape.wdf"}
	ZhandouModel["青铜短剑_剑侠客"]={pgs_1 = 4256351077,pgs_2 = 4256351077,pgs_3 = 1799000911,pgs_4 = 3029718579,pgs_6 = 2340710053,pgs_7 = 874161900,pgs_8 = 1001128045,pgs_9 = 3927011624,pgs_10 = "shape.wdf"}
	ZhandouModel["游龙剑_剑侠客"]={pgs_1 = 3922251448,pgs_2 = 3922251448,pgs_3 = 2729643500,pgs_4 = 3737672137,pgs_6 = 525352739,pgs_7 = 948395215,pgs_8 = 563220674,pgs_9 = 3149578823,pgs_10 = "shape.wdf"}
	ZhandouModel["金背大砍刀_剑侠客"]={pgs_1 = 2695990707,pgs_2 = 2695990707,pgs_3 = 1837946764,pgs_4 = 1995983471,pgs_6 = 3956010201,pgs_7 = 3740065177,pgs_8 = 3607972716,pgs_9 = 1238352835,pgs_10 = "shape.wdf"}
	ZhandouModel["狼牙刀_剑侠客"]={pgs_1 = 914160701,pgs_2 = 914160701,pgs_3 = 790662160,pgs_4 = 4033879125,pgs_6 = 2718755916,pgs_7 = 310154266,pgs_8 = 2495162598,pgs_9 = 2607187114,pgs_10 = "shape.wdf"}
	ZhandouModel["青锋剑_剑侠客"]={pgs_1 = 128739684,pgs_2 = 128739684,pgs_3 = 1360269025,pgs_4 = 1259586579,pgs_6 = 3155607107,pgs_7 = 3585789919,pgs_8 = 548399706,pgs_9 = 3149578823,pgs_10 = "shape.wdf"}
	ZhandouModel["柳叶刀_剑侠客"]={pgs_1 = 2309692066,pgs_2 = 2309692066,pgs_3 = 4083786274,pgs_4 = 1649684398,pgs_6 = 3909215663,pgs_7 = 1820668649,pgs_8 = 1323639728,pgs_9 = 3231555815,pgs_10 = "shape.wdf"}
	ZhandouModel["斩妖泣血_剑侠客"]={pgs_1 = 3366877163,pgs_2 = 3366877163,pgs_3 = 2527757700,pgs_4 = 423606103,pgs_6 = 2965089172,pgs_7 = 3694647351,pgs_8 = 223797192,pgs_9 = 902186530,pgs_10 = "shape.wd3"}
	ZhandouModel["业火三灾_剑侠客"]={pgs_1 = 0210215203,pgs_2 = 0210215203,pgs_3 = 0742329354,pgs_4 = 4144128188,pgs_6 = 3922982597,pgs_7 = 3358965260,pgs_8 = 2322529890,pgs_9 = 2370381803,pgs_10 = "shape.wd8"}
	ZhandouModel["鸣鸿_剑侠客"]={pgs_1 = 1301462828,pgs_2 = 1301462828,pgs_3 = 0874331809,pgs_4 = 1002416013,pgs_6 = 0119572952,pgs_7 = 2800523884,pgs_8 = 4144463970,pgs_9 = 3391554113,pgs_10 = "shape.wd9"}
	ZhandouModel["魏武青虹_剑侠客"]={pgs_1 = 3545119585,pgs_2 = 3545119585,pgs_3 = 157523664,pgs_4 = 0xc2e78c48,pgs_6 = 1488281366,pgs_7 = 2951999449,pgs_8 = 1776089940,pgs_9 = 599864712,pgs_10 = "shape.wd3"}
	ZhandouModel["血刃_剑侠客"]={pgs_1 = 3942369185,pgs_2 = 3942369185,pgs_3 = 2744623122,pgs_4 = 3558966261,pgs_6 = 2535946630,pgs_7 = 1477301268,pgs_8 = 658806952,pgs_9 = 3254342488,pgs_10 = "shape.wdf"}
	ZhandouModel["灵犀神剑_剑侠客"]={pgs_1 = 1664613177,pgs_2 = 1664613177,pgs_3 = 739286596,pgs_4 = 0x576ab01,pgs_6 = 2240524266,pgs_7 = 2235430645,pgs_8 = 2276071821,pgs_9 = 83886513,pgs_10 = "shape.wd3"}
	ZhandouModel["冷月_剑侠客"]={pgs_1 = 1050757801,pgs_2 = 1050757801,pgs_3 = 2523626742,pgs_4 = 332965488,pgs_6 = 797204911,pgs_7 = 1739503652,pgs_8 = 3541810222,pgs_9 = 1219913712,pgs_10 = "shape.wdf"}
	ZhandouModel["倚天_剑侠客"]={pgs_1 = 1368524342,pgs_2 = 1368524342,pgs_3 = 1068916714,pgs_4 = 0x9de26e92,pgs_6 = 360062771,pgs_7 = 517811079,pgs_8 = 3380216158,pgs_9 = 195389599,pgs_10 = "shape.wdf"}
	ZhandouModel["湛卢_剑侠客"]={pgs_1 = 174574078,pgs_2 = 174574078,pgs_3 = 2462930631,pgs_4 = 0xe195d52b,pgs_6 = 357132169,pgs_7 = 1091639193,pgs_8 = 132771616,pgs_9 = 1502161679,pgs_10 = "shape.wdf"}
	ZhandouModel["四法青云_剑侠客"]={pgs_1 = 2301962273,pgs_2 = 2301962273,pgs_3 = 1642344190,pgs_4 = 4019743340,pgs_6 = 690548315,pgs_7 = 654838706,pgs_8 = 3259089844,pgs_9 = 3268379919,pgs_10 = "shape.wd3"}
	ZhandouModel["霜冷九州_剑侠客"]={pgs_1 = 3750052903,pgs_2 = 3750052903,pgs_3 = 3978185529,pgs_4 = 1126547325,pgs_6 = 3133397477,pgs_7 = 1400612648,pgs_8 = 1048600867,pgs_9 = 0587348277,pgs_10 = "shape.wd8"}
	ZhandouModel["擒龙_剑侠客"]={pgs_1 = 2066485351,pgs_2 = 2066485351,pgs_3 = 3200400983,pgs_4 = 4074782058,pgs_6 = 2739156816,pgs_7 = 2620255839,pgs_8 = 3164581880,pgs_9 = 0839277591,pgs_10 = "shape.wd9"}
	ZhandouModel["晓风残月_剑侠客"]={pgs_1 = 3614142659,pgs_2 = 3614142659,pgs_3 = 222137428,pgs_4 = 162101136,pgs_6 = 3111105254,pgs_7 = 1410594659,pgs_8 = 1285154537,pgs_9 = 1663734878,pgs_10 = "shape.wd3"}
	ZhandouModel["屠龙_剑侠客"]={pgs_1 = 892827193,pgs_2 = 892827193,pgs_3 = 2530500829,pgs_4 = 3739812188,pgs_6 = 408410478,pgs_7 = 2903940161,pgs_8 = 1040159026,pgs_9 = 319067749,pgs_10 = "shape.wdf"}
	ZhandouModel["鱼肠_剑侠客"]={pgs_1 = 4227823198,pgs_2 = 4227823198,pgs_3 = 2698488437,pgs_4 = 3798717939,pgs_6 = 3533475904,pgs_7 = 3303465815,pgs_8 = 1861666518,pgs_9 = 1012813203,pgs_10 = "shape.wdf"}
	ZhandouModel["偃月青龙_剑侠客"]={pgs_1 = 190424072,pgs_2 = 190424072,pgs_3 = 1961249071,pgs_4 = 3838801989,pgs_6 = 2829649300,pgs_7 = 3543370033,pgs_8 = 1454309726,pgs_9 = 1450613061,pgs_10 = "shape.wd3"
}
	ZhandouModel["连珠神弓_羽灵神"]={pgs_1 = 2326794251,pgs_2 = 2326794251,pgs_3 = 2712600528,pgs_4 = 3987564547,pgs_6 = 427605991,pgs_7 = 3545789610,pgs_8 = 49846298,pgs_9 = 4190609956,pgs_10 = "shape.wda"}
	ZhandouModel["腾云杖_羽灵神"]={pgs_1 = 446004749,pgs_2 = 446004749,pgs_3 = 866998113,pgs_4 = 30654504,pgs_6 = 3664608621,pgs_7 = 631837046,pgs_8 = 3821365630,pgs_9 = 172627858,pgs_10 = "shape.wda"}
	ZhandouModel["墨铁拐_羽灵神"]={pgs_1 = 581491157,pgs_2 = 581491157,pgs_3 = 95568889,pgs_4 = 4136518094,pgs_6 = 1603576455,pgs_7 = 2492027915,pgs_8 = 616237873,pgs_9 = 2456783957,pgs_10 = "shape.wda"}
	ZhandouModel["宝雕长弓_羽灵神"]={pgs_1 = 4253393401,pgs_2 = 4253393401,pgs_3 = 1615127028,pgs_4 = 3401409995,pgs_6 = 2163483216,pgs_7 = 2874238993,pgs_8 = 290712464,pgs_9 = 412551822,pgs_10 = "shape.wda"}
	ZhandouModel["硬木弓_羽灵神"]={pgs_1 = 150635600,pgs_2 = 150635600,pgs_3 = 1149486021,pgs_4 = 1352870002,pgs_6 = 3031812840,pgs_7 = 2982615098,pgs_8 = 3723589923,pgs_9 = 1534728987,pgs_10 = "shape.wda"}
	ZhandouModel["曲柳杖_羽灵神"]={pgs_1 = 177392781,pgs_2 = 177392781,pgs_3 = 126506799,pgs_4 = 2086224634,pgs_6 = 2070674478,pgs_7 = 2841942625,pgs_8 = 1310664391,pgs_9 = 945248214,pgs_10 = "shape.wda"}
	ZhandouModel["冥火薄天_羽灵神"]={pgs_1 = 2410653859,pgs_2 = 2410653859,pgs_3 = 412668278,pgs_4 = 411982136,pgs_6 = 2414080025,pgs_7 = 3270399877,pgs_8 = 1113080394,pgs_9 = 2526125934,pgs_10 = "shape.wda"}
	ZhandouModel["非攻_羽灵神"]={pgs_1 = 2832976024,pgs_2 = 2832976024,pgs_3 = 1185088706,pgs_4 = 4004334076,pgs_6 = 3652084138,pgs_7 = 384985378,pgs_8 = 2233740441,pgs_9 = 1204493716,pgs_10 = "shape.wda"}
	ZhandouModel["庄周梦蝶_羽灵神"]={pgs_1 = 101429091,pgs_2 = 101429091,pgs_3 = 1184168411,pgs_4 = 3432364546,pgs_6 = 3657330082,pgs_7 = 548056296,pgs_8 = 3683860076,pgs_9 = 1443396752,pgs_10 = "shape.wda"}
	ZhandouModel["鹿鸣_羽灵神"]={pgs_1 = 430621291,pgs_2 = 430621291,pgs_3 = 3690027526,pgs_4 = 2690907506,pgs_6 = 2067206624,pgs_7 = 3983937939,pgs_8 = 2646614429,pgs_9 = 664180130,pgs_10 = "shape.wda"}
	ZhandouModel["碧海潮生_羽灵神"]={pgs_1 = 2874500726,pgs_2 = 2874500726,pgs_3 = 2974311966,pgs_4 = 3236853267,pgs_6 = 2141705747,pgs_7 = 3946028962,pgs_8 = 4233351592,pgs_9 = 2739863852,pgs_10 = "shape.wda"}
	ZhandouModel["弦月_羽灵神"]={pgs_1 = 4100861245,pgs_2 = 4100861245,pgs_3 = 2434737195,pgs_4 = 2220097459,pgs_6 = 0862692538,pgs_7 = 2870088340,pgs_8 = 1671028156,pgs_9 = 2129606162,pgs_10 = "shape.wda"}
	ZhandouModel["玉辉_羽灵神"]={pgs_1 = 1799011000,pgs_2 = 1799011000,pgs_3 = 3831187618,pgs_4 = 2997063111,pgs_6 = 3312955607,pgs_7 = 3013082841,pgs_8 = 1939053710,pgs_9 = 1116805220,pgs_10 = "shape.wda"}
	ZhandouModel["业焰_羽灵神"]={pgs_1 = 1471856529,pgs_2 = 1471856529,pgs_3 = 1895438642,pgs_4 = 1769877803,pgs_6 = 4245874516,pgs_7 = 572738149,pgs_8 = 1774544621,pgs_9 = 565335915,pgs_10 = "shape.wda"}
	ZhandouModel["龙鸣寒水_羽灵神"]={pgs_1 = 2288999152,pgs_2 = 2288999152,pgs_3 = 3191815629,pgs_4 = 975203915,pgs_6 = 3559987378,pgs_7 = 0xDE5063CD,pgs_8 = 55816849,pgs_9 = 1433469896,pgs_10 = "shape.wda"}
	ZhandouModel["太极流光_羽灵神"]={pgs_1 = 2848033504,pgs_2 = 2848033504,pgs_3 = 2656382753,pgs_4 = 2977776427,pgs_6 = 1141425103,pgs_7 = 3968350241,pgs_8 = 2316321007,pgs_9 = 104034525,pgs_10 = "shape.wda"}
	ZhandouModel["九霄风雷_羽灵神"]={pgs_1 = 0158730771,pgs_2 = 0158730771,pgs_3 = 0132145415,pgs_4 = 0764898549,pgs_6 = 3046428836,pgs_7 = 0756094913,pgs_8 = 1838448889,pgs_9 = 0827920690,pgs_10 = "shape.wda"}
	ZhandouModel["若木_羽灵神"]={pgs_1 = 4068136814,pgs_2 = 4068136814,pgs_3 = 0418458259,pgs_4 = 3490606442,pgs_6 = 3417142708,pgs_7 = 3650939868,pgs_8 = 3613858643,pgs_9 = 3612898812,pgs_10 = "shape.wda"}
	ZhandouModel["幽篁_羽灵神"]={pgs_1 = 1385345996,pgs_2 = 1385345996,pgs_3 = 767991055,pgs_4 = 2413280637,pgs_6 = 3907295353,pgs_7 = 4034909222,pgs_8 = 590632369,pgs_9 = 1102812055,pgs_10 = "shape.wda"}
	ZhandouModel["百鬼_羽灵神"]={pgs_1 = 433769011,pgs_2 = 433769011,pgs_3 = 1388983839,pgs_4 = 2412124226,pgs_6 = 3519132595,pgs_7 = 2744030084,pgs_8 = 3242785816,pgs_9 = 4010155361,pgs_10 = "shape.wda"}
	ZhandouModel["凤翼流珠_羽灵神"]={pgs_1 = 3353149334,pgs_2 = 3353149334,pgs_3 = 1074224727,pgs_4 = 160508292,pgs_6 = 3400914167,pgs_7 = 3537311768,pgs_8 = 1351147384,pgs_9 = 279371088,pgs_10 = "shape.wda"
}
	ZhandouModel["腾云杖_巫蛮儿"]={pgs_1 = 3456418962,pgs_2 = 3456418962,pgs_3 = 1443524884,pgs_4 = 2407737199,pgs_6 = 4073450724,pgs_7 = 4073450724,pgs_8 = 2828185705,pgs_9 = 2088694658,pgs_10 = "shape.wda"}
	ZhandouModel["翡翠珠_巫蛮儿"]={pgs_1 = 3539296504,pgs_2 = 3539296504,pgs_3 = 2255315467,pgs_4 = 1802143462,pgs_6 = 1510770330,pgs_7 = 1930701898,pgs_8 = 3505690179,pgs_9 = 1435774063,pgs_10 = "shape.wda"}
	ZhandouModel["琉璃珠_巫蛮儿"]={pgs_1 = 1403236209,pgs_2 = 1403236209,pgs_3 = 1329700091,pgs_4 = 1691312599,pgs_6 = 786593580,pgs_7 = 164320860,pgs_8 = 2463504053,pgs_9 = 2573416526,pgs_10 = "shape.wda"}
	ZhandouModel["如意宝珠_巫蛮儿"]={pgs_1 = 3047110383,pgs_2 = 3047110383,pgs_3 = 2280873549,pgs_4 = 2717151389,pgs_6 = 3043609869,pgs_7 = 3638266331,pgs_8 = 2356120530,pgs_9 = 62625934,pgs_10 = "shape.wda"}
	ZhandouModel["墨铁拐_巫蛮儿"]={pgs_1 = 333733022,pgs_2 = 333733022,pgs_3 = 923276916,pgs_4 = 1683281266,pgs_6 = 3200804307,pgs_7 = 2976979233,pgs_8 = 160002331,pgs_9 = 1565301941,pgs_10 = "shape.wda"}
	ZhandouModel["曲柳杖_巫蛮儿"]={pgs_1 = 3570910020,pgs_2 = 3570910020,pgs_3 = 923276916,pgs_4 = 1683281266,pgs_6 = 3312479705,pgs_7 = 429861263,pgs_8 = 3316485994,pgs_9 = 1090261872,pgs_10 = "shape.wda"}
	ZhandouModel["裂云啸日_巫蛮儿"]={pgs_1 = 1953175087,pgs_2 = 1953175087,pgs_3 = 3696783624,pgs_4 = 2606125215,pgs_6 = 1758916755,pgs_7 = 3089221190,pgs_8 = 147933165,pgs_9 = 3171772535,pgs_10 = "shape.wda"}
	ZhandouModel["云雷万里_巫蛮儿"]={pgs_1 = 3496291125,pgs_2 = 3496291125,pgs_3 = 1465968075,pgs_4 = 1397554648,pgs_6 = 2459508456,pgs_7 = 2516514287,pgs_8 = 3589170230,pgs_9 = 3317700918,pgs_10 = "shape.wda"}
	ZhandouModel["赤明_巫蛮儿"]={pgs_1 = 0200658060,pgs_2 = 0200658060,pgs_3 = 3759594662,pgs_4 = 3318654178,pgs_6 = 4035253624,pgs_7 = 2693415826,pgs_8 = 2972224698,pgs_9 = 3906907508,pgs_10 = "shape.wda"}
	ZhandouModel["紫金葫芦_巫蛮儿"]={pgs_1 = 2831632905,pgs_2 = 2831632905,pgs_3 = 3521304774,pgs_4 = 3768453514,pgs_6 = 2981305233,pgs_7 = 2400756176,pgs_8 = 1889441810,pgs_9 = 2164075551,pgs_10 = "shape.wda"}
	ZhandouModel["离火_巫蛮儿"]={pgs_1 = 593251101,pgs_2 = 593251101,pgs_3 = 1674828781,pgs_4 = 83754672,pgs_6 = 3337153292,pgs_7 = 341330281,pgs_8 = 662302587,pgs_9 = 1380161976,pgs_10 = "shape.wda"}
	ZhandouModel["雪蟒霜寒_巫蛮儿"]={pgs_1 = 739148944,pgs_2 = 739148944,pgs_3 = 1573479582,pgs_4 = 1491739579,pgs_6 = 851932811,pgs_7 = 3605348497,pgs_8 = 1658854000,pgs_9 = 759781703,pgs_10 = "shape.wda"}
	ZhandouModel["碧海潮生_巫蛮儿"]={pgs_1 = 3910342400,pgs_2 = 3910342400,pgs_3 = 0733894543,pgs_4 = 1050839754,pgs_6 = 3505371915,pgs_7 = 1647388270,pgs_8 = 1832777753,pgs_9 = 0844025414,pgs_10 = "shape.wda"}
	ZhandouModel["弦月_巫蛮儿"]={pgs_1 = 3736877850,pgs_2 = 3736877850,pgs_3 = 3588393432,pgs_4 = 2220097459,pgs_6 = 0280199730,pgs_7 = 3405371659,pgs_8 = 2586240981,pgs_9 = 0420838884,pgs_10 = "shape.wda"}
	ZhandouModel["飞星_巫蛮儿"]={pgs_1 = 902532881,pgs_2 = 902532881,pgs_3 = 1311875894,pgs_4 = 1263683269,pgs_6 = 4006180572,pgs_7 = 941967075,pgs_8 = 1752683572,pgs_9 = 173425117,pgs_10 = "shape.wda"}
	ZhandouModel["回风舞雪_巫蛮儿"]={pgs_1 = 1226070803,pgs_2 = 1226070803,pgs_3 = 3590109632,pgs_4 = 3593543610,pgs_6 = 3882426852,pgs_7 = 136839080,pgs_8 = 1265716525,pgs_9 = 126040992,pgs_10 = "shape.wda"}
	ZhandouModel["庄周梦蝶_巫蛮儿"]={pgs_1 = 2699629829,pgs_2 = 2699629829,pgs_3 = 19941067,pgs_4 = 2214888719,pgs_6 = 2405414221,pgs_7 = 3124365588,pgs_8 = 181704645,pgs_9 = 1598617101,pgs_10 = "shape.wda"}
	ZhandouModel["玉辉_巫蛮儿"]={pgs_1 = 2197847487,pgs_2 = 2197847487,pgs_3 = 647814036,pgs_4 = 643336377,pgs_6 = 3288644239,pgs_7 = 869836664,pgs_8 = 2936127898,pgs_9 = 2134751551,pgs_10 = "shape.wda"}
	ZhandouModel["业焰_巫蛮儿"]={pgs_1 = 358788281,pgs_2 = 358788281,pgs_3 = 3187541069,pgs_4 = 1276652632,pgs_6 = 746435059,pgs_7 = 1492176534,pgs_8 = 4078550197,pgs_9 = 2864410571,pgs_10 = "shape.wda"}
	ZhandouModel["凤翼流珠_巫蛮儿"]={pgs_1 = 2005711219,pgs_2 = 2005711219,pgs_3 = 1777115444,pgs_4 = 738268467,pgs_6 = 3554514707,pgs_7 = 2166949971,pgs_8 = 2242679788,pgs_9 = 3110874208,pgs_10 = "shape.wda"}
	ZhandouModel["鹿鸣_巫蛮儿"]={pgs_1 = 2923599993,pgs_2 = 2923599993,pgs_3 = 862900418,pgs_4 = 2806977290,pgs_6 = 2678464587,pgs_7 = 893469617,pgs_8 = 3689245011,pgs_9 = 780797617,pgs_10 = "shape.wda"}
	ZhandouModel["月华_巫蛮儿"]={pgs_1 = 1792811676,pgs_2 = 1792811676,pgs_3 = 4148391824,pgs_4 = 3636515320,pgs_6 = 3355609993,pgs_7 = 4240539050,pgs_8 = 3498546662,pgs_9 = 2176161640,pgs_10 = "shape.wda"
}
	ZhandouModel["如意宝珠_杀破狼"]={pgs_1 = 2994264484,pgs_2 = 2994264484,pgs_3 = 1404894523,pgs_4 = 530980268,pgs_6 = 3593075951,pgs_7 = 4288686185,pgs_8 = 834957611,pgs_9 = 935164006,pgs_10 = "shape.wda"}
	ZhandouModel["翡翠珠_杀破狼"]={pgs_1 = 1888438119,pgs_2 = 1888438119,pgs_3 = 832082873,pgs_4 = 2462082254,pgs_6 = 3335305851,pgs_7 = 3225276990,pgs_8 = 3777022322,pgs_9 = 2618824675,pgs_10 = "shape.wda"}
	ZhandouModel["连珠神弓_杀破狼"]={pgs_1 = 3896611853,pgs_2 = 3896611853,pgs_3 = 2036432029,pgs_4 = 2102929671,pgs_6 = 3589969117,pgs_7 = 3876338026,pgs_8 = 1811002066,pgs_9 = 1930889295,pgs_10 = "shape.wda"}
	ZhandouModel["琉璃珠_杀破狼"]={pgs_1 = 1347542308,pgs_2 = 1347542308,pgs_3 = 1084648267,pgs_4 = 2598475041,pgs_6 = 220293482,pgs_7 = 309382841,pgs_8 = 3237534358,pgs_9 = 4248308764,pgs_10 = "shape.wda"}
	ZhandouModel["宝雕长弓_杀破狼"]={pgs_1 = 3187707461,pgs_2 = 3187707461,pgs_3 = 3770288341,pgs_4 = 2752043077,pgs_6 = 2434290964,pgs_7 = 3329145004,pgs_8 = 1745722591,pgs_9 = 9444076,pgs_10 = "shape.wda"}
	ZhandouModel["硬木弓_杀破狼"]={pgs_1 = 3001778802,pgs_2 = 3001778802,pgs_3 = 2629114281,pgs_4 = 370350902,pgs_6 = 3945843828,pgs_7 = 297727953,pgs_8 = 1273865503,pgs_9 = 1767508772,pgs_10 = "shape.wda"}
	ZhandouModel["裂云啸日_杀破狼"]={pgs_1 = 1323042371,pgs_2 = 1323042371,pgs_3 = 2471306192,pgs_4 = 2206427343,pgs_6 = 3359417010,pgs_7 = 3912741797,pgs_8 = 753797811,pgs_9 = 656525376,pgs_10 = "shape.wda"}
	ZhandouModel["云雷万里_杀破狼"]={pgs_1 = 0929693147,pgs_2 = 0929693147,pgs_3 = 2339783982,pgs_4 = 2673184399,pgs_6 = 1053032888,pgs_7 = 1343023772,pgs_8 = 1593490105,pgs_9 = 0305349853,pgs_10 = "shape.wda"}
	ZhandouModel["赤明_杀破狼"]={pgs_1 = 0454754499,pgs_2 = 0454754499,pgs_3 = 4014535055,pgs_4 = 1847890126,pgs_6 = 0039518222,pgs_7 = 2065247607,pgs_8 = 1441775582,pgs_9 = 0138471714,pgs_10 = "shape.wda"}
	ZhandouModel["雪蟒霜寒_羽灵神"]={pgs_1 = 2930005782,pgs_2 = 2930005782,pgs_3 = 1411447909,pgs_4 = 1157464245,pgs_6 = 1798260255,pgs_7 = 3245955639,pgs_8 = 1135006044,pgs_9 = 272976564,pgs_10 = "shape.wda"}
	ZhandouModel["太极流光_杀破狼"]={pgs_1 = 2074525537,pgs_2 = 2074525537,pgs_3 = 449187270,pgs_4 = 2759360079,pgs_6 = 3413608092,pgs_7 = 1682905191,pgs_8 = 4051367450,pgs_9 = 3252077695,pgs_10 = "shape.wda"}
	ZhandouModel["九霄风雷_杀破狼"]={pgs_1 = 3704392067,pgs_2 = 3704392067,pgs_3 = 3632605747,pgs_4 = 2197826216,pgs_6 = 2845081681,pgs_7 = 2020968771,pgs_8 = 3450511222,pgs_9 = 1885695436,pgs_10 = "shape.wda"}
	ZhandouModel["若木_杀破狼"]={pgs_1 = 2783866786,pgs_2 = 2783866786,pgs_3 = 1862994822,pgs_4 = 1445406110,pgs_6 = 1501063042,pgs_7 = 1500235485,pgs_8 = 3264257605,pgs_9 = 3963075748,pgs_10 = "shape.wda"}
	ZhandouModel["飞星_杀破狼"]={pgs_1 = 1920229574,pgs_2 = 1920229574,pgs_3 = 3670774470,pgs_4 = 1565695987,pgs_6 = 612719827,pgs_7 = 304215519,pgs_8 = 15688186,pgs_9 = 3390941259,pgs_10 = "shape.wda"}
	ZhandouModel["冥火薄天_杀破狼"]={pgs_1 = 871369705,pgs_2 = 871369705,pgs_3 = 1399674031,pgs_4 = 1805010867,pgs_6 = 1620002437,pgs_7 = 1839576620,pgs_8 = 621841422,pgs_9 = 3126248794,pgs_10 = "shape.wda"}
	ZhandouModel["幽篁_杀破狼"]={pgs_1 = 1663842501,pgs_2 = 1663842501,pgs_3 = 2110884946,pgs_4 = 4241477506,pgs_6 = 4245424904,pgs_7 = 1184291529,pgs_8 = 3595306000,pgs_9 = 3541370331,pgs_10 = "shape.wda"}
	ZhandouModel["百鬼_杀破狼"]={pgs_1 = 2607438844,pgs_2 = 2607438844,pgs_3 = 894755654,pgs_4 = 1601466888,pgs_6 = 520922337,pgs_7 = 3106122659,pgs_8 = 610584642,pgs_9 = 1809776963,pgs_10 = "shape.wda"}
	ZhandouModel["非攻_杀破狼"]={pgs_1 = 1885839562,pgs_2 = 1885839562,pgs_3 = 3957124377,pgs_4 = 3204102825,pgs_6 = 2379415806,pgs_7 = 1950788981,pgs_8 = 1127738414,pgs_9 = 2661471858,pgs_10 = "shape.wda"}
	ZhandouModel["紫金葫芦_杀破狼"]={pgs_1 = 994535269,pgs_2 = 994535269,pgs_3 = 4014927528,pgs_4 = 3310480847,pgs_6 = 2831639351,pgs_7 = 122206673,pgs_8 = 1940957103,pgs_9 = 2257546251,pgs_10 = "shape.wda"}
	ZhandouModel["回风舞雪_杀破狼"]={pgs_1 = 723925966,pgs_2 = 723925966,pgs_3 = 1798299344,pgs_4 = 1212380108,pgs_6 = 1637540313,pgs_7 = 2653292719,pgs_8 = 257191592,pgs_9 = 2659671813,pgs_10 = "shape.wda"}
	ZhandouModel["离火_杀破狼"]={pgs_1 = 1736891488,pgs_2 = 1736891488,pgs_3 = 1516097158,pgs_4 = 1419099406,pgs_6 = 619566973,pgs_7 = 332324123,pgs_8 = 942082261,pgs_9 = 4082318050,pgs_10 = "shape.wda"}
	ZhandouModel["月华_杀破狼"]={pgs_1 = 3883698348,pgs_2 = 3883698348,pgs_3 = 1535796704,pgs_4 = 81237364,pgs_6 = 786918783,pgs_7 = 1149367266,pgs_8 = 2874084219,pgs_9 = 2578429791,pgs_10 = "shape.wda"}
	ZhandouModel["龙鸣寒水_杀破狼"]={pgs_1 = 2135796424,pgs_2 = 2135796424,pgs_3 = 4117872420,pgs_4 = 4105996895,pgs_6 = 2127507146,pgs_7 = 4261464327,pgs_8 = 1514939238,pgs_9 = 748425136,pgs_10 = "shape.wda"}
	ZhandouModel["杀破狼"]={pgs_1 = 2232599242,pgs_2 = 2232599242,pgs_3 = 3215162495,pgs_4 = 3629275056,pgs_6 = 4241012400,pgs_7 = 3547444917,pgs_8 = 1721194312,pgs_9 = 3836921096,pgs_10 = "shape.wda"}
	ZhandouModel["杀破狼_宝珠"]={pgs_1 = 3067304876,pgs_2 = 3067304876,pgs_3 = 3215162495,pgs_4 = 1186759867,pgs_6 = 1266038770,pgs_7 = 2576943278,pgs_8 = 1721194312,pgs_9 = 3836921096,pgs_10 = "shape.wda"}
	ZhandouModel["杀破狼_弓弩"]={pgs_1 = 2232599242,pgs_2 = 2232599242,pgs_3 = 3215162495,pgs_4 = 3629275056,pgs_6 = 4241012400,pgs_7 = 3547444917,pgs_8 = 1721194312,pgs_9 = 3836921096,pgs_10 = "shape.wda"}
	ZhandouModel["杀破狼_弓弩1"]={pgs_1 = 3555676410,pgs_2 = 3555676410,pgs_3 = 3215162495,pgs_4 = 3629275056,pgs_6 = 0167917977,pgs_7 = 2697172445,pgs_8 = 1721194312,pgs_9 = 3836921096,pgs_10 = "shape.wda"}
	ZhandouModel["巫蛮儿"]={pgs_1 = 2404345852,pgs_2 = 2404345852,pgs_3 = 857427883,pgs_4 = 3299007490,pgs_6 = 3847342356,pgs_7 = 2219256477,pgs_8 = 3377965731,pgs_9 = 1458812347,pgs_10 = "shape.wda"}
	ZhandouModel["巫蛮儿_宝珠"]={pgs_1 = 724036542,pgs_2 = 724036542,pgs_3 = 857427883,pgs_4 = 1487210709,pgs_6 = 2600092653,pgs_7 = 4235120544,pgs_8 = 3377965731,pgs_9 = 170880794,pgs_10 = "shape.wda"}
	ZhandouModel["巫蛮儿_法杖"]={pgs_1 = 2404345852,pgs_2 = 2404345852,pgs_3 = 857427883,pgs_4 = 3299007490,pgs_6 = 3847342356,pgs_7 = 2219256477,pgs_8 = 3377965731,pgs_9 = 1458812347,pgs_10 = "shape.wda"}
	ZhandouModel["羽灵神"]={pgs_1 = 1894911422,pgs_2 = 1894911422,pgs_3 = 570130129,pgs_4 = 1552868103,pgs_6 = 1384231887,pgs_7 = 3035774294,pgs_8 = 1198313117,pgs_9 = 1516641634,pgs_10 = "shape.wda"}
	ZhandouModel["羽灵神_法杖"]={pgs_1 = 529648379,pgs_2 = 529648379,pgs_3 = 570130129,pgs_4 = 1552868103,pgs_6 = 2280958058,pgs_7 = 4138194582,pgs_8 = 1198313117,pgs_9 = 1516641634,pgs_10 = "shape.wda"}
	ZhandouModel["羽灵神_弓弩"]={pgs_1 = 1894911422,pgs_2 = 1894911422,pgs_3 = 570130129,pgs_4 = 1552868103,pgs_6 = 1384231887,pgs_7 = 3035774294,pgs_8 = 1198313117,pgs_9 = 1516641634,pgs_10 = "shape.wda"}
	ZhandouModel["羽灵神_弓弩1"]={pgs_1 = 0042392635,pgs_2 = 0042392635,pgs_3 = 0570130129,pgs_4 = 1552868103,pgs_6 = 1139367548,pgs_7 = 0xB4F23D56,pgs_8 = 1750053013,pgs_9 = 1516641634,pgs_10 = "shape.wda"}
    ZhandouModel["新二大王"]={pgs_1 = "白象精攻击",pgs_2 = "白象精攻击",pgs_3 = "白象精死亡",pgs_4 = "白象精挨打",pgs_6 = "白象精站立",pgs_7 = "白象精攻击",pgs_8 = "白象精跑",pgs_9 = "白象精挨打",pgs_10 = "tfg.rpk"}
	ZhandouModel["新猪八戒"]={pgs_1 = "猪八戒攻击",pgs_2 = "猪八戒攻击",pgs_3 = "猪八戒死亡",pgs_4 = "猪八戒挨打",pgs_6 = "猪八戒站立",pgs_7 = "猪八戒攻击",pgs_8 = "猪八戒跑",pgs_9 = "猪八戒挨打",pgs_10 = "tfg.rpk"}
	ZhandouModel["新孙悟空"]={pgs_1 = "孙悟空攻击",pgs_2 = "孙悟空攻击",pgs_3 = "孙悟空死亡",pgs_4 = "孙悟空挨打",pgs_6 = "孙悟空站立",pgs_7 = "孙悟空攻击",pgs_8 = "孙悟空跑",pgs_9 = "孙悟空挨打",pgs_10 = "tfg.rpk"}
	ZhandouModel["涂山雪"]={pgs_1 = 0x20000001,pgs_2 = 0x20000006,pgs_3 = 0x20000002,pgs_4 = 0x20000008,pgs_6 = 0x20000009  ,pgs_7 = 0x20000006,pgs_8 = 0x20000010,pgs_9 = 0x20000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶涂山雪"]={pgs_1 = 0x20000016,pgs_2 = 0x20000016,pgs_3 = 0x20000017,pgs_4 = 0x20000013,pgs_6 = 0x20000019  ,pgs_7 = 0x20000011,pgs_8 = 0x20000020,pgs_9 = 0x20000018,pgs_10 = "org4.rpk"}
	ZhandouModel["狐不归"]={pgs_1 = 0x9000006,pgs_2 = 0x9000006,pgs_3 = 0x9000007,pgs_4 = 0x9000003,pgs_6 = 0x9000004  ,pgs_7 = 0x9000009,pgs_8 = 0x9000005,pgs_9 = 0x9000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶狐不归"]={pgs_1 = 0x9000016,pgs_2 = 0x9000016,pgs_3 = 0x9000012,pgs_4 = 0x9000013,pgs_6 = 0x9000019  ,pgs_7 = 0x9000011,pgs_8 = 0x9000015,pgs_9 = 0x9000008,pgs_10 = "org4.rpk"}
	ZhandouModel["花铃"]={pgs_1 = 0x10000006,pgs_2 = 0x10000006,pgs_3 = 0x10000007,pgs_4 = 0x10000008,pgs_6 = 0x10000009  ,pgs_7 = 0x10000006,pgs_8 = 0x10000010,pgs_9 = 0x10000008,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶花铃"]={pgs_1 = 0x10000016,pgs_2 = 0x10000016,pgs_3 = 0x10000012,pgs_4 = 0x10000018,pgs_6 = 0x10000019  ,pgs_7 = 0x10000016,pgs_8 = 0x10000020,pgs_9 = 0x10000018,pgs_10 = "org4.rpk"}
	ZhandouModel["月魅"]={pgs_1 = 0x30000009,pgs_2 = 0x31000009,pgs_3 = 0x30000007,pgs_4 = 0x30000008,pgs_6 = 0x30000010 ,pgs_7 = 0x32000009,pgs_8 = 0x30000011,pgs_9 = 0x33000009,pgs_10 = "沉默.wdf"}
	ZhandouModel["进阶月魅"]={pgs_1 = 0x30000017,pgs_2 = 0x32000017,pgs_3 = 0x30000018,pgs_4 = 0x30000019,pgs_6 = 0x30000021  ,pgs_7 = 0x35000017,pgs_8 = 0x30000020,pgs_9 = 0x38000019,pgs_10 = "沉默.wdf"}
	ZhandouModel["月影仙"]={pgs_1 = 0x40000001,pgs_2 = 0x40000001,pgs_3 = 0x40000002,pgs_4 = 0x40000003,pgs_6 = 0x40000004  ,pgs_7 = 0x40000001,pgs_8 = 0x40000005,pgs_9 = 0x40000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶月影仙"]={pgs_1 = 0x40000006,pgs_2 = 0x40000006,pgs_3 = 0x40000002,pgs_4 = 0x40000008,pgs_6 = 0x40000009 ,pgs_7 = 0x40000006,pgs_8 = 0x40000010,pgs_9 = 0x40000008,pgs_10 = "org4.rpk"}
	ZhandouModel["云游火"]={pgs_1 = 0x50000001,pgs_2 = 0x50000001,pgs_3 = 0x50000002,pgs_4 = 0x50000003,pgs_6 = 0x50000004  ,pgs_7 = 0x50000001,pgs_8 = 0x50000005,pgs_9 = 0x50000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶云游火"]={pgs_1 = 0x50000006,pgs_2 = 0x50000006,pgs_3 = 0x50000002,pgs_4 = 0x50000008,pgs_6 = 0x50000009  ,pgs_7 = 0x50000006,pgs_8 = 0x50000010,pgs_9 = 0x50000008,pgs_10 = "org4.rpk"}
   	ZhandouModel["超级神狗"]={pgs_1 = 0x3000001,pgs_2 = 0x3000001,pgs_3 = 0x3000002,pgs_4 = 0x3000003,pgs_6 = 0x3000004  ,pgs_7 = 0x3000001,pgs_8 = 0x3000005,pgs_9 = 0x3000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶超级神狗"]={pgs_1 = 0x3000006,pgs_2 = 0x3000006,pgs_3 = 0x3000007,pgs_4 = 0x3000008,pgs_6 = 0x3000009  ,pgs_7 = 0x3000006,pgs_8 = 0x3000010,pgs_9 = 0x3000008,pgs_10 = "org4.rpk"}
	ZhandouModel["超级神猪"]={pgs_1 = 0x5000006,pgs_2 = 0x5000006,pgs_3 = 0x5000002,pgs_4 = 0x5000003,pgs_6 = 0x5000004  ,pgs_7 = 0x5000006,pgs_8 = 0x5000005,pgs_9 = 0x5000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶超级神猪"]={pgs_1 = 0x5000001,pgs_2 = 0x5000001,pgs_3 = 0x5000007,pgs_4 = 0x5000008,pgs_6 = 0x5000009  ,pgs_7 = 0x5000001,pgs_8 = 0x5000010,pgs_9 = 0x5000008,pgs_10 = "org4.rpk"}
	ZhandouModel["超级神鼠"]={pgs_1 = 0x4000006,pgs_2 = 0x4000006,pgs_3 = 0x4000002,pgs_4 = 0x4000003,pgs_6 = 0x4000004  ,pgs_7 = 0x4000006,pgs_8 = 0x4000005,pgs_9 = 0x4000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶超级神鼠"]={pgs_1 = 0x4000001,pgs_2 = 0x4000001,pgs_3 = 0x4000007,pgs_4 = 0x4000008,pgs_6 = 0x4000009  ,pgs_7 = 0x4000001,pgs_8 = 0x4000010,pgs_9 = 0x4000008,pgs_10 = "org4.rpk"}
	ZhandouModel["超级猪小戒"]={pgs_1 = 0x7000006,pgs_2 = 0x7000006,pgs_3 = 0x7000002,pgs_4 = 0x7000003,pgs_6 = 0x7000004  ,pgs_7 = 0x7000006,pgs_8 = 0x7000005,pgs_9 = 0x7000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶超级猪小戒"]={pgs_1 = 0x7000001,pgs_2 = 0x7000001,pgs_3 = 0x7000007,pgs_4 = 0x7000008,pgs_6 = 0x7000009  ,pgs_7 = 0x7000001,pgs_8 = 0x7000010,pgs_9 = 0x7000008,pgs_10 = "org4.rpk"}
	ZhandouModel["超级小白龙"]={pgs_1 = 0x6000006,pgs_2 = 0x6000006,pgs_3 = 0x6000002,pgs_4 = 0x6000003,pgs_6 = 0x6000004 ,pgs_7 = 0x6000006,pgs_8 = 0x6000005,pgs_9 = 0x6000003,pgs_10 = "org4.rpk"}
	ZhandouModel["进阶超级小白龙"]={pgs_1 = 0x6000001,pgs_2 = 0x6000001,pgs_3 = 0x6000007,pgs_4 = 0x6000008,pgs_6 = 0x6000010  ,pgs_7 = 0x6000001,pgs_8 = 0x6000009,pgs_9 = 0x6000008,pgs_10 = "org4.rpk"}
	--ZhandouModel["超级飞天"]={pgs_1 = 0x1000001,pgs_2 = 0x1000001,pgs_3 = 0x1000002,pgs_4 = 0x1000008,pgs_6 = 0x1000009 ,pgs_7 = 0x1000001,pgs_8 = 0x1000010,pgs_9 = 0x1000008,pgs_10 = "org4.rpk"}
	--ZhandouModel["进阶超级飞天"]={pgs_1 = 0x1000006,pgs_2 = 0x1000006,pgs_3 = 0x1000007,pgs_4 = 0x1000003,pgs_6 = 0x1000005  ,pgs_7 = 0x1000006,pgs_8 = 0x1000004,pgs_9 = 0x1000003,pgs_10 = "org4.rpk"}
	ZhandouModel["帮派妖兽"]={pgs_1 = 0xC1816D39,pgs_2 = 0xC1816D39,pgs_3 = 0xD225AEF5,pgs_4 = 0x0CC07284,pgs_6 = 0xD252E998,pgs_7 = 0x048CC7DD,pgs_8 = 0x6c396ad2,pgs_9 = 0x2E8C40EC,pgs_10 = "shape.wdf"}
	ZhandouModel["战斗坐骑1"]={pgs_1 = 45188947,pgs_2 = 45188947,pgs_3 = 437683438,pgs_4 = 2051522148,pgs_6 = 3832766912  ,pgs_7 = 37818122,pgs_8 = 81627590,pgs_9 = 2718427437,pgs_10 = "shape.wdc"}
	ZhandouModel["战斗坐骑2"]={pgs_1 = 3077903783,pgs_2 = 3077903783,pgs_3 = 1632113367,pgs_4 = 3496875568,pgs_6 = 786303190  ,pgs_7 = 2507433576,pgs_8 = 1752376507,pgs_9 = 1997094673,pgs_10 = "shape.wdc"}
	--ZhandouModel["谛听"]={pgs_1 = 134217729 ,pgs_2 = 134217729,pgs_3 = 134217730,pgs_4 = 134217731,pgs_6 = 134217732  ,pgs_7 = 134217732,pgs_8 = 134217733,pgs_9 = 134217731,pgs_10 = "org4.rpk"}
	--ZhandouModel["进阶谛听"]={pgs_1 = 134217750,pgs_2 = 134217750,pgs_3 = 134217746,pgs_4 = 134217747,pgs_6 = 134217748  ,pgs_7 = 134217745,pgs_8 = 134217749,pgs_9 = 134217747,pgs_10 = "org4.rpk"}
	ZhandouModel["小猪"]={pgs_1 = 0x2d7948ef,pgs_2 = 0x2d7948ef,pgs_3 = 0x2d7948ef,pgs_4 = 0x2d7948ef,pgs_6 = 0x2d7948ef,pgs_7 = 0x2d7948ef,pgs_8 = 0x2d7948ef,pgs_9 = 0x2d7948ef,pgs_10 = "qwq.wdf"}
	-- ZhandouModel["超级鲲鹏"]={pgs_1 = 3759185928,pgs_2 = 3759185928,pgs_3 = 3759185937,pgs_4 = 3759185923,pgs_6 = 3759185923,pgs_7 = 3759185936,pgs_8 = 3759185923,pgs_9 = 3759185924,pgs_10 = "kkjn.wdf"}
	-- ZhandouModel["进阶超级鲲鹏"]={pgs_1 = 3759185928,pgs_2 = 3759185928,pgs_3 = 3759185937,pgs_4 = 3759185923,pgs_6 = 3759185923,pgs_7 = 3759185936,pgs_8 = 3759185923,pgs_9 = 3759185924,pgs_10 = "kkjn.wdf"}
	ZhandouModel["木桩"]={pgs_1 = 0x0CC00001,pgs_2 = 0x0CC00001,pgs_3 = 0x0CC00002,pgs_4 = 0x0CC00001,pgs_6 = 0x0CC00001,pgs_7 = 0x0CC00001,pgs_8 = 0x0CC00001,pgs_9 = 0x0CC00003,pgs_10 = "沉默.wdf"}
	-- 1攻击 2第二种形态攻击 3死亡 4防御 6待战 7是施法 8跑去 9挨打 10是资源包
	ZhandouModel["超级神虎（壬寅）"]={pgs_1 = "老虎攻击",pgs_2 = "老虎攻击",pgs_3 = "老虎死亡",pgs_4 = "老虎挨打",pgs_6 = "老虎站立",pgs_7 = "老虎施法",pgs_8 = "老虎跑",pgs_9 = "老虎挨打",pgs_10 = "tfg.rpk"}
	ZhandouModel["进阶超级神虎（壬寅）"]={pgs_1 = "老虎攻击",pgs_2 = "老虎攻击",pgs_3 = "老虎死亡",pgs_4 = "老虎挨打",pgs_6 = "老虎站立",pgs_7 = "老虎施法",pgs_8 = "老虎跑",pgs_9 = "老虎挨打",pgs_10 = "tfg.rpk"}
	ZhandouModel["广目巡守"]={pgs_1 = "广目巡守攻击",pgs_2 = "广目巡守攻击",pgs_3 = "广目巡守倒地",pgs_4 = "广目巡守挨打",pgs_6 = "广目巡守待战",pgs_7 = "广目巡守攻击",pgs_8 = "广目巡守行走",pgs_9 = "广目巡守挨打",pgs_10 = "tfg.rpk"}
	ZhandouModel["进阶广目巡守"]={pgs_1 = "广目巡守攻击",pgs_2 = "广目巡守攻击",pgs_3 = "广目巡守倒地",pgs_4 = "广目巡守挨打",pgs_6 = "广目巡守待战",pgs_7 = "广目巡守攻击",pgs_8 = "广目巡守行走",pgs_9 = "广目巡守挨打",pgs_10 = "tfg.rpk"}
    ZhandouModel["雷龙"]={pgs_1 = 0xDDDD0052,pgs_2 = 0xDDDD0052,pgs_3 = 0xDDDD0053,pgs_4 = 0xDDDD0054,pgs_6 = 0xDDDD0055,pgs_7 = 0xDDDD0056,pgs_8 = 0xDDDD0057,pgs_9 = 0xDDDD0719,pgs_10 = "沉默.wdf"}
	ZhandouModel["进阶雷龙"]={pgs_1 = 0xDDDA0001,pgs_2 = 0xDDDA0002,pgs_3 = 0xDDDA0003,pgs_4 = 0xDDDA0004,pgs_6 = 0xDDDA0006,pgs_7 = 0xDDDA0007,pgs_8 = 0xDDDA0008,pgs_9 = 0xDDDA0009,pgs_10 = "沉默.wdf"}
    ZhandouModel["超级红孩儿"]={pgs_1 = 0xDDDD0189,pgs_2 = 0xDADD0189,pgs_3 = 0xDDDD0190,pgs_4 = 0xDDDD00187,pgs_6 = 0xDDDD0192,pgs_7 = 0xDDDD0188,pgs_8 = 0xDDDD0191,pgs_9 = 0xDADD0193,pgs_10 = "沉默.wdf"}
    ZhandouModel["进阶超级红孩儿"]={pgs_1 = 0xDDDD0189,pgs_2 = 0xDADD0189,pgs_3 = 0xDDDD0190,pgs_4 = 0xDDDD00193,pgs_6 = 0xDDDD0192,pgs_7 = 0xDDDD0188,pgs_8 = 0xDDDD0191,pgs_9 = 0xDADD0193,pgs_10 = "沉默.wdf"}
	ZhandouModel["超级飞廉"]={pgs_1 = 0xB0000003,pgs_2 = 0xBC000003,pgs_3 = 0xB0000005,pgs_4 = 0xB0000002,pgs_6 = 0xB0000006,pgs_7 = 0xB0000004,pgs_8 = 0xB0000001,pgs_9 = 0xBA000002,pgs_10 = "沉默.wdf"}
	ZhandouModel["进阶超级飞廉"]={pgs_1 = 0xB0000003,pgs_2 = 0xBC000003,pgs_3 = 0xB0000005,pgs_4 = 0xB0000002,pgs_6 = 0xB0000006,pgs_7 = 0xB0000004,pgs_8 = 0xB0000001,pgs_9 = 0xB0000002,pgs_10 = "沉默.wdf"}
	ZhandouModel["自在心猿"]={pgs_1 = 0xC0000006,pgs_2 = 0xC0000007,pgs_3 = 0xC0000010,pgs_4 = 0xC0000011,pgs_6 = 0xC0000004,pgs_7 = 0xC0000008,pgs_8 = 0xC0000005,pgs_9 = 0xCA000006,pgs_10 = "沉默.wdf"}
	ZhandouModel["进阶自在心猿"]={pgs_1 = 0xC1000006,pgs_2 = 0xC1000007,pgs_3 = 0xC1000003,pgs_4 = 0xC1000004,pgs_6 = 0xC1000002,pgs_7 = 0xC1000005,pgs_8 = 0xC1000008,pgs_9 = 0xC1000009,pgs_10 = "沉默.wdf"}
	ZhandouModel["超级恶魔泡泡"]={pgs_1 = 0xE0000004,pgs_2 = 0xE0000004,pgs_3 = 0xE0000009,pgs_4 = 0xE0000006,pgs_6 = 0xE0000008,pgs_7 = 0xE0000005,pgs_8 = 0xE0000007,pgs_9 = 0xE0000006,pgs_10 = "沉默.wdf"}
	ZhandouModel["进阶超级恶魔泡泡"]={pgs_1 = 0xE0000004,pgs_2 = 0xE0000004,pgs_3 = 0xE0000009,pgs_4 = 0xE0000006,pgs_6 = 0xE0000008,pgs_7 = 0xE0000005,pgs_8 = 0xE0000007,pgs_9 = 0xE0000006,pgs_10 = "沉默.wdf"}
	-- 1攻击 2第二种形态攻击 3死亡 4防御 6待战 7施法 8移动 9挨打 10资源包
	ZhandouModel["超级神柚"]={pgs_1 = 0xDDDD0019,pgs_2 = 0xDDDD9019,pgs_3 = 0xDDDD0021,pgs_4 = 0xDDDD0018,pgs_6 = 0xDDDD0022,pgs_7 = 0xDDDD0020,pgs_8 = 0xDDDD0017,pgs_9 = 0xDDDD9020,pgs_10 = "沉默.wdf"}
	ZhandouModel["进阶超级神柚"]={pgs_1 = 0xDDDD9021,pgs_2 = 0xDDDD9022,pgs_3 = 0xDDDD9023,pgs_4 = 0xDDDD9024,pgs_6 = 0xDDDD9025,pgs_7 = 0xDDDD9026,pgs_8 = 0xDDDD9027,pgs_9 = 0xDDDD9028,pgs_10 = "沉默.wdf"}
    ZhandouModel["魔化毗舍童子"]={pgs_1 = 0xDDDD0029,pgs_2 = 0xDADD0029,pgs_3 = 0xDDDD0030,pgs_4 = 0xDDDD0034,pgs_6 = 0xDDDD0032,pgs_7 = 0xDDDD0031,pgs_8 = 0xDDDD0033,pgs_9 = 0xDDDD9034,pgs_10 = "沉默.wdf"}
    ZhandouModel["进阶魔化毗舍童子"]={pgs_1 = 0xDDDD0500,pgs_2 = 0xDDDD0501,pgs_3 = 0xDDDD0503,pgs_4 = 0xDDDD0504,pgs_6 = 0xDDDD0505,pgs_7 = 0xDDDD0506,pgs_8 = 0xDDDD0507,pgs_9 = 0xDDDD0508,pgs_10 = "沉默.wdf"}
    ZhandouModel["白豹"]={pgs_1 = 0xDDDD0035,pgs_2 = 0xDDDD0035,pgs_3 = 0xDDDD0140,pgs_4 = 0xDDDD0141,pgs_6 = 0xDDDD0138,pgs_7 = 0xDDDD0036,pgs_8 = 0xDDDD0139,pgs_9 = 0xDDDD0141,pgs_10 = "沉默.wdf"}
    ZhandouModel["进阶白豹"]={pgs_1 = 0xDDDD0035,pgs_2 = 0xDDDD0035,pgs_3 = 0xDDDD0140,pgs_4 = 0xDDDD0141,pgs_6 = 0xDDDD0138,pgs_7 = 0xDDDD0036,pgs_8 = 0xDDDD0139,pgs_9 = 0xDDDD0141,pgs_10 = "沉默.wdf"}
    ZhandouModel["幻姬"]={pgs_1 = 0xDDDD0045,pgs_2 = 0xDDDD0648,pgs_3 = 0xDDDD0046,pgs_4 = 0xDDDD0047,pgs_6 = 0xDDDD0048,pgs_7 = 0xDDDD0049,pgs_8 = 0xDDDD0050,pgs_9 = 0xDDDD0649,pgs_10 = "沉默.wdf"}
    ZhandouModel["进阶幻姬"]={pgs_1 = 0xDDDD0702,pgs_2 = 0xDDDD0703,pgs_3 = 0xDDDD0704,pgs_4 = 0xDDDD0705,pgs_6 = 0xDDDD0706,pgs_7 = 0xDDDD0707,pgs_8 = 0xDDDD0708,pgs_9 = 0xDDDD0709,pgs_10 = "沉默.wdf"}
    ZhandouModel["长乐灵仙"]={pgs_1 = 0xDDDD0068,pgs_2 = 0xDBDD0068,pgs_3 = 0xDDDD0069,pgs_4 = 0xDDDD0070,pgs_6 = 0xDDDD0071,pgs_7 = 0xDDDD0072,pgs_8 = 0xDDDD0073,pgs_9 = 0xDDDD2068,pgs_10 = "沉默.wdf"}
    ZhandouModel["进阶长乐灵仙"]={pgs_1 = 0xDDDD8068,pgs_2 = 0xDDDD8069,pgs_3 = 0xDDDD8070,pgs_4 = 0xDDDD8071,pgs_6 = 0xDDDD8072,pgs_7 = 0xDDDD8073,pgs_8 = 0xDDDD8074,pgs_9 = 0xDDDD8075,pgs_10 = "沉默.wdf"}
    ZhandouModel["泡泡灵仙·剑侠客"]={pgs_1 = 0xDDDD0076,pgs_2 = 0xDDDD6076,pgs_3 = 0xDDDD0077,pgs_4 = 0xDDDD0078,pgs_6 = 0xDDDD0081,pgs_7 = 0xDDDD0079,pgs_8 = 0xDDDD0080,pgs_9 = 0xDDDD7076,pgs_10 = "沉默.wdf"}
    ZhandouModel["泡泡灵仙·骨精灵"]={pgs_1 = 0xDDDD0084,pgs_2 = 0xDDDA0084,pgs_3 = 0xDDDD0086,pgs_4 = 0xDDDD0089,pgs_6 = 0xDDDD0087,pgs_7 = 0xDDDD0085,pgs_8 = 0xDDDD0088,pgs_9 = 0xDDDDA089,pgs_10 = "沉默.wdf"}
    ZhandouModel["泡泡灵仙·飞燕女"]={pgs_1 = 0xDDDD0450,pgs_2 = 0xDDDD0451,pgs_3 = 0xDDDD0452,pgs_4 = 0xDDDD0453,pgs_6 = 0xDDDD0454,pgs_7 = 0xDDDD0455,pgs_8 = 0xDDDD0456,pgs_9 = 0xDDDD0457,pgs_10 = "沉默.wdf"}
    ZhandouModel["泡泡灵仙·羽灵神"]={pgs_1 = 0xDDDD0458,pgs_2 = 0xDDDD0459,pgs_3 = 0xDDDD0460,pgs_4 = 0xDDDD0461,pgs_6 = 0xDDDD0462,pgs_7 = 0xDDDD0463,pgs_8 = 0xDDDD0464,pgs_9 = 0xDDDD0465,pgs_10 = "沉默.wdf"}
    ZhandouModel["泡泡灵仙·巫蛮儿"]={pgs_1 = 0xDDDD0466,pgs_2 = 0xDDDD0467,pgs_3 = 0xDDDD0468,pgs_4 = 0xDDDD0469,pgs_6 = 0xDDDD0470,pgs_7 = 0xDDDD0471,pgs_8 = 0xDDDD0472,pgs_9 = 0xDDDD0473,pgs_10 = "沉默.wdf"}
    ZhandouModel["泡泡灵仙·杀破狼"]={pgs_1 = 0xDDDD0474,pgs_2 = 0xDDDD0475,pgs_3 = 0xDDDD0476,pgs_4 = 0xDDDD0477,pgs_6 = 0xDDDD0478,pgs_7 = 0xDDDD0479,pgs_8 = 0xDDDD0480,pgs_9 = 0xDDDD0481,pgs_10 = "沉默.wdf"}
    ZhandouModel["金翼"]={pgs_1 = 0xDDDD0200,pgs_2 = 0xDDDD0201,pgs_3 = 0xDDDD00203,pgs_4 = 0xDDDD0204,pgs_6 = 0xDDDD0205,pgs_7 = 0xDDDD0206,pgs_8 = 0xDDDD0207,pgs_9 = 0xDDDD0208,pgs_10 = "沉默.wdf"}
    ZhandouModel["进阶金翼"]={pgs_1 = 0xDDDD0210,pgs_2 = 0xDDDD0211,pgs_3 = 0xDDDD0212,pgs_4 = 0xDDDD0213,pgs_6 = 0xDDDD0214,pgs_7 = 0xDDDD0215,pgs_8 = 0xDDDD0216,pgs_9 = 0xDDDD0217,pgs_10 = "沉默.wdf"}
    ZhandouModel["觉醒涂山雪"]={pgs_1 = 0xDDDD0310,pgs_2 = 0xDDDD0311,pgs_3 = 0xDDDD0312,pgs_4 = 0xDDDD0313,pgs_6 = 0xDDDD0314,pgs_7 = 0xDDDD0315,pgs_8 = 0xDDDD0316,pgs_9 = 0xDDDD0317,pgs_10 = "沉默.wdf"}
    ZhandouModel["进阶觉醒涂山雪"]={pgs_1 = 0xDDDD0319,pgs_2 = 0xDDDD0320,pgs_3 = 0xDDDD0321,pgs_4 = 0xDDDD0322,pgs_6 = 0xDDDD0323,pgs_7 = 0xDDDD0324,pgs_8 = 0xDDDD0325,pgs_9 = 0xDDDD0326,pgs_10 = "沉默.wdf"}
    ZhandouModel["司雨"]={pgs_1 = 0xDDDD0639,pgs_2 = 0xDDDD0632,pgs_3 = 0xDDDD0633,pgs_4 = 0xDDDD0634,pgs_6 = 0xDDDD0635,pgs_7 = 0xDDDD0636,pgs_8 = 0xDDDD0637,pgs_9 = 0xDDDD0638,pgs_10 = "沉默.wdf"}
    ZhandouModel["进阶司雨"]={pgs_1 = 0xDDDD0640,pgs_2 = 0xDDDD0641,pgs_3 = 0xDDDD0642,pgs_4 = 0xDDDD0643,pgs_6 = 0xDDDD0644,pgs_7 = 0xDDDD0645,pgs_8 = 0xDDDD0646,pgs_9 = 0xDDDD0647,pgs_10 = "沉默.wdf"}
     -- 1是攻击 2是第二种形态攻击 3是死亡 4是防御 6是待战 7是施法 8是移动 9是挨打 10是资源包
		-- 1攻击 2第二种形态攻击 3死亡 4防御 6待战 7施法 8移动 9挨打 10资源包




-- [""]={站立=0xf207f1a0,行走=0xf207f1a0,待战=0xf207f1a0,挨打=0x2fe25a8b,防御=0x2fe25a8b,
-- 施法=0xbf358ffe,施法B=0x22413486,倒地=0x6f8c61b8,跑去=0xf207f1a0,跑回=0xf207f1a0,攻击=0x679f3915,攻击B=0x141ff4c2,攻击C=0x6c1bfd1f}

-- ["_饰品"]={站立=0xf88f0c7e,行走=0xf88f0c7e,待战=0xf88f0c7e,挨打=0xeb3135ed,防御=0xeb3135ed,
-- 施法=0x66b8ce86,施法B=0,倒地=0xb16bfe02,跑去=0xf88f0c7e,跑回=0xf88f0c7e,攻击=0xc7b373dd,攻击B=0xd0451625,攻击C=0}

-- ["斧钺"]={站立=0xbcf47b21,行走=0xb17f83f3,待战=0xbcf47b21,挨打=0x89e82fde,防御=0x1dc957cb,
-- 施法=0xb604fa09,施法B=0,倒地=0x4d4ebf7b,跑去=0xb17f83f3,跑回=0x4cd685a8,攻击=0xb604fa09,攻击B=0xb604fa09,攻击C=0}
-- ["法杖"]={站立=0x79eb272e,行走=0x79eb272e,待战=0x79eb272e,挨打=0x3aba3972,防御=0x6290ea4d,
-- 施法=0xab853e76,施法B=0,倒地=0xc5614b62,跑去=0x79eb272e,跑回=0x79eb272e,攻击=0xab853e76,攻击B=0xab853e76,攻击C=0}
-- ["弓弩"]={站立=0xab6fbed,行走=0xab6fbed,待战=0xab6fbed,挨打=0xb05a5c8f,防御=0xbe65c91e,
-- 施法=0x391750cc,施法B=0,倒地=0x8c4812a,跑去=0xab6fbed,跑回=0xab6fbed,攻击=0x391750cc,攻击B=0x391750cc,攻击C=0}
-- ["经筒"]={站立=0xebf5d6ef,行走=0xebf5d6ef,待战=0xebf5d6ef,挨打=0xc4beed34,防御=0xc4beed34,
-- 施法=0x81542dce,施法B=0,倒地=0xe454c88e,跑去=0xebf5d6ef,跑回=0xebf5d6ef,攻击=0x81542dce,攻击B=0x81542dce,攻击C=0}
-- ["宝剑"]={站立=0x9f776d40,行走=0xa5c091a0,待战=0x9f776d40,挨打=0xac3e8866,防御=0x508f338a,
-- 施法=0x67b8329c,施法B=0,倒地=0xefc7a1f2,跑去=0xa5c091a0,跑回=0x733a3064,攻击=0x7b287cfb,攻击B=0x7b287cfb,攻击C=0}
-- ["刀"]={站立=0xf4dd4073,行走=0xf1b93a69,待战=0xf4dd4073,挨打=0xc6bf8023,防御=0x5226cdeb,
-- 施法=0x740466a4,施法B=0,倒地=0x657bca06,跑去=0xf1b93a69,跑回=0x78421a88,攻击=0x740466a4,攻击B=0x740466a4,攻击C=0}
-- ["宝珠"]={站立=0x53dd8291,行走=0x53dd8291,待战=0x53dd8291,挨打=0xc18e99c1,防御=0xff533d6d,
-- 施法=0xd2eec28,倒地=0xd40eb6a,跑去=0x53dd8291,跑回=0,攻击=0xd2eec28,攻击B=0xd2eec28}









function 引擎.取宝宝(bb,类型,神兽类型)
    local bbs = {}
    if 类型=="神兽" then
    bbs[1] = 0
    bbs[2] = 1550 --攻资
    bbs[3] = 1550 --防资
    bbs[4] = 6000 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1550 --速资
    bbs[7] = 1550 --躲避
        bbs[8] = {1.25,1.25,1.25,1.25,1.25}
        bbs[9] = {"高级连击","高级必杀","高级偷袭","高级吸血","高级夜战","高级强力"}
        if 神兽类型==nil then
          bb=bb
      else
          bb=bb.."_法系"
        end
      bbs[9] =取神兽资质(bb)[8] or bbs[9]
    return bbs
    end

  if bb == "老虎" or bb == "老虎x" then
      bbs[1] = 15
    bbs[2] = 1380
    bbs[3] = 1080
    bbs[4] = 3600
    bbs[5] = 1380
    bbs[6] = 1200
    bbs[7] = 1080
    bbs[8] = {1.004,1.014,1.025,1.135,1.145}
    bbs[9] = {"连击","驱鬼","幸运","强力"}
  elseif bb == "白熊" or bb == "白熊x" then
      bbs[1] = 45
    bbs[2] = 1320
    bbs[3] = 1320
    bbs[4] = 5280
    bbs[5] = 1800
    bbs[6] = 960
    bbs[7] = 1380
    bbs[8] = {1.097,1.108,1.12,1.131,1.142}
    bbs[9] = {"迟钝","强力","防御","高级反击","高级必杀"}
  elseif bb == "虾兵" or bb == "虾兵x" then
      bbs[1] = 25
    bbs[2] = 1200
    bbs[3] = 1380
    bbs[4] = 4800
    bbs[5] = 2400
    bbs[6] = 1080
    bbs[7] = 1440
    bbs[8] = {1.014,1.024,1.035,1.045,1.055}
    bbs[9] = {"高级反击","高级必杀","驱鬼","水属性吸收"}
    elseif bb == "狼" or bb == "狼x" then
      bbs[1] = 25
    bbs[2] = 1440
    bbs[3] = 960
    bbs[4] = 3600
    bbs[5] = 1200
    bbs[6] = 1500
    bbs[7] = 1464
    bbs[8] = {0.999,1.009,1.02,1.03,1.04}
    bbs[9] = {"高级连击","驱鬼","连击","偷袭","夜战"}
  elseif bb == "噬天虎" or bb == "噬天虎x" then
      bbs[1] = 125
    bbs[2] = 1500
    bbs[3] = 1440
    bbs[4] = 4800
    bbs[5] = 2400
    bbs[6] = 1500
    bbs[7] = 1560
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级连击","驱鬼","幸运","高级强力"}
  elseif bb == "雨师" or bb == "雨师x" then
      bbs[1] = 65
    bbs[2] = 1200
    bbs[3] = 1380
    bbs[4] = 4200
    bbs[5] = 3000
    bbs[6] = 1440
    bbs[7] = 1620
    bbs[8] = {1.156,1.168,1.18,1.191,1.203}
    bbs[9] = {"水攻","高级雷属性吸收","高级水属性吸收","高级土属性吸收","高级火属性吸收"}
  elseif bb == "牛头" or bb == "牛头x" then
      bbs[1] = 35
    bbs[2] = 1320
    bbs[3] = 1320
    bbs[4] = 3600
    bbs[5] = 1800
    bbs[6] = 1440
    bbs[7] = 1200
    bbs[8] = {1.058,1.069,1.08,1.09,1.101}
    bbs[9] = {"驱鬼","高级必杀","招架","高级鬼魂术","夜战"}
  elseif bb == "骷髅怪" or bb == "骷髅怪x" then
      bbs[1] = 15
    bbs[2] = 1200
    bbs[3] = 1200
    bbs[4] = 3000
    bbs[5] = 1200
    bbs[6] = 1200
    bbs[7] = 1500
    bbs[8] = {1.009,1.019,1.03,1.040,1.05}
    bbs[9] = {"土属性吸收","弱点雷","鬼魂术","夜战"}
  elseif bb=="修罗傀儡鬼" then
      bbs[1] = 155
    bbs[2] = 1524
    bbs[3] = 1380
    bbs[4] = 5040
    bbs[5] = 2400
    bbs[6] = 1440
    bbs[7] = 1440
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}
    bbs[9] = {"高级夜战","反震","高级必杀","强力","嗜血追击"}
  elseif bb=="树怪" then
      bbs[1] = 5
    bbs[2] = 1320
    bbs[3] = 1320
    bbs[4] = 3300
    bbs[5] = 1320
    bbs[6] = 900
    bbs[7] = 960
    bbs[8] = {0.882,0.891,0.9,0.909,0.918}
    bbs[9] = {"反击","感知","驱鬼","再生","弱点火","迟钝"}
  elseif bb == "羊头怪" or bb == "羊头怪x" then
      bbs[1] = 15
    bbs[2] = 1260
    bbs[3] = 1380
    bbs[4] = 3360
    bbs[5] = 1320
    bbs[6] = 1200
    bbs[7] = 1200
    bbs[8] = {1.004,1.014,1.025,1.035,1.045}
    bbs[9] = {"连击","必杀","幸运","永恒"}
  elseif bb=="海毛虫" then
      bbs[1] = 5
    bbs[2] = 1440
    bbs[3] = 900
    bbs[4] = 2400
    bbs[5] = 1200
    bbs[6] = 1320
    bbs[7] = 1200
    bbs[8] = {0.989,0.999,1.01,1.02,1.03}
    bbs[9] = {"毒","高级反震","必杀","夜战","弱点火"}
  elseif bb == "野猪" or bb == "野猪x" then
      bbs[1] = 5
    bbs[2] = 1140
    bbs[3] = 1140
    bbs[4] = 3840
    bbs[5] = 1260
    bbs[6] = 1140
    bbs[7] = 1200
    bbs[8] = {0.999,1.009,1.02,1.03,1.04}
    bbs[9] = {"感知","高级感知","高级幸运","强力","弱点土","弱点火"}
  elseif bb == "天兵" or bb == "天兵x" then
      bbs[1] = 55
    bbs[2] = 1320
    bbs[3] = 1500
    bbs[4] = 5100
    bbs[5] = 2220
    bbs[6] = 1320
    bbs[7] = 1320
    bbs[8] = {1.127,1.138,1.15,1.161,1.173}
    bbs[9] = {"高级防御","高级感知","必杀","高级驱鬼"}
  elseif bb=="野猪精" then
      bbs[1] = 85
    bbs[2] = 1464
    bbs[3] = 1560
    bbs[4] = 4800
    bbs[5] = 2400
    bbs[6] = 1200
    bbs[7] = 1320
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"反击","感知","弱点水","高级强力"}
  elseif bb=="灵灯侍者" then
      bbs[1] = 175
    bbs[2] = 1404
    bbs[3] = 1524
    bbs[4] = 5760
    bbs[5] = 2760
    bbs[6] = 1536
    bbs[7] = 1440
    bbs[8] = {1.264,1.277,1.29,1.3,1.31}
    bbs[9] = {"无畏布施","防御","雷击","高级慧根","高级雷属性吸收"}
  elseif bb == "赌徒" or bb == "赌徒x" then
      bbs[1] = 5
    bbs[2] = 1020
    bbs[3] = 1140
    bbs[4] = 3000
    bbs[5] = 1440
    bbs[6] = 1440
    bbs[7] = 1380
    bbs[8] = {0.931,0.94,0.95,0.959,0.969}
    bbs[9] = {}
  elseif bb == "野鬼" or bb == "野鬼x" then
      bbs[1] = 35
    bbs[2] = 1320
    bbs[3] = 1320
    bbs[4] = 4200
    bbs[5] = 1200
    bbs[6] = 1140
    bbs[7] = 1260
    bbs[8] = {0.994,1.004,1.015,1.025,1.035}
    bbs[9] = {"落岩","土属性吸收","鬼魂术","夜战"}
  elseif bb=="修罗傀儡妖" then
      bbs[1] = 165
    bbs[2] = 1536
    bbs[3] = 1380
    bbs[4] = 4800
    bbs[5] = 2400
    bbs[6] = 1500
    bbs[7] = 1440
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}
    bbs[9] = {"合纵","感知","高级幸运","高级连击"}
  elseif bb=="连弩车" then
      bbs[1] = 145
    bbs[2] = 1500
    bbs[3] = 1560
    bbs[4] = 5400
    bbs[5] = 2400
    bbs[6] = 1200
    bbs[7] = 1320
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级强力","防御","连击","迟钝"}
  elseif bb == "黑熊精" or bb == "黑熊精x" then
      bbs[1] = 35
    bbs[2] = 1380
    bbs[3] = 1260
    bbs[4] = 5040
    bbs[5] = 2160
    bbs[6] = 1020
    bbs[7] = 1320
    bbs[8] = {1.024,1.034,1.045,1.055,1.065}
    bbs[9] = {"反震","必杀","刀背打","高级强力","弱点雷"}
  elseif bb=="金身罗汉" then
      bbs[1] = 165
    bbs[2] = 1380
    bbs[3] = 1500
    bbs[4] = 5400
    bbs[5] = 2400
    bbs[6] = 1560
    bbs[7] = 1440
    bbs[8] = {1.244,1.257,1.27,1.282,1.295}
    bbs[9] = {"永恒","高级反震","神佑复生","盾气","高级敏捷"}
  elseif bb=="犀牛将军人形" then
      bbs[1] = 75
    bbs[2] = 1440
    bbs[3] = 1464
    bbs[4] = 4800
    bbs[5] = 2520
    bbs[6] = 1200
    bbs[7] = 1140
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"高级强力","高级幸运","剑荡四方","再生"}
  elseif bb=="大海龟" then
      bbs[1] = 0
    bbs[2] = 960
    bbs[3] = 960
    bbs[4] = 3600
    bbs[5] = 1200
    bbs[6] = 840
    bbs[7] = 1320
    bbs[8] = {0.882,0.891,0.9,0.909,0.918}
    bbs[9] = {"反震","慧根","幸运","水属性吸收","防御"}
  elseif bb=="曼珠沙华" then
      bbs[1] = 165
    bbs[2] = 1440
    bbs[3] = 1440
    bbs[4] = 4800
    bbs[5] = 2640
    bbs[6] = 1500
    bbs[7] = 1440
    bbs[8] = {1.244,1.257,1.27,1.282,1.295}
    bbs[9] = {"高级招架","招架","反震","高级法术抵抗","高级再生"}
  elseif bb=="长眉灵猴" then
      bbs[1] = 155
    bbs[2] = 1440
    bbs[3] = 1500
    bbs[4] = 5640
    bbs[5] = 3240
    bbs[6] = 1200
    bbs[7] = 1560
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}
    bbs[9] = {"奔雷咒","高级法术暴击","冥思","高级再生"}
  elseif bb=="护卫" then
      bbs[1] = 0
    bbs[2] = 1140
    bbs[3] = 1020
    bbs[4] = 2700
    bbs[5] = 1800
    bbs[6] = 1200
    bbs[7] = 1200
    bbs[8] = {0.931,0.94,0.95,0.959,0.969}
    bbs[9] = {"反击","必杀","强力"}
  elseif bb=="巨力神猿" then
      bbs[1] = 155
    bbs[2] = 1500
    bbs[3] = 1440
    bbs[4] = 4560
    bbs[5] = 2640
    bbs[6] = 1500
    bbs[7] = 1560
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}
    bbs[9] = {"敏捷","高级盾气","高级连击","强力","高级驱鬼"}
  elseif bb=="章鱼" then
      bbs[1] = 0
    bbs[2] = 1440
    bbs[3] = 840
    bbs[4] = 2400
    bbs[5] = 1200
    bbs[6] = 1320
    bbs[7] = 1200
    bbs[8] = {0.989,0.999,1.01,1.02,1.03}
    bbs[9] = {"连击","毒","吸血","水属性吸收","弱点火"}
  elseif bb=="藤蔓妖花" then
      bbs[1] = 155
    bbs[2] = 1464
    bbs[3] = 1440
    bbs[4] = 4560
    bbs[5] = 3120
    bbs[6] = 1200
    bbs[7] = 1440
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}
    bbs[9] = {"灵能激发","落岩","高级招架","高级法术连击"}
  elseif bb=="金铙僧" then
      bbs[1] = 125
    bbs[2] = 1500
    bbs[3] = 1440
    bbs[4] = 5040
    bbs[5] = 2280
    bbs[6] = 1440
    bbs[7] = 1560
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"再生","必杀","招架","偷袭","高级雷属性吸收"}
  elseif bb == "大力金刚" or bb == "大力金刚x" then
      bbs[1] = 125
    bbs[2] = 1548
    bbs[3] = 1334
    bbs[4] = 6000
    bbs[5] = 2640
    bbs[6] = 1200
    bbs[7] = 1320
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级强力","泰山压顶","力劈华山","高级永恒"}
  elseif bb == "花妖" or bb == "花妖x" then
      bbs[1] = 15
    bbs[2] = 1020
    bbs[3] = 1440
    bbs[4] = 3780
    bbs[5] = 1440
    bbs[6] = 1140
    bbs[7] = 1140
    bbs[8] = {1.029,1.039,1.05,1.06,1.071}
    bbs[9] = {"感知","慧根","落岩","防御","水属性吸收"}
  elseif bb=="蜃气妖" then
      bbs[1] = 155
    bbs[2] = 1464
    bbs[3] = 1440
    bbs[4] = 5040
    bbs[5] = 3240
    bbs[6] = 1320
    bbs[7] = 1440
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}
    bbs[9] = {"高级法术连击","雷击","法术暴击","上古灵符"}
  elseif bb=="猫灵人形" then
      bbs[1] = 155
    bbs[2] = 1524
    bbs[3] = 1464
    bbs[4] = 4560
    bbs[5] = 2640
    bbs[6] = 1500
    bbs[7] = 1680
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}
    bbs[9] = {"必杀","高级幸运","高级偷袭","反击","敏捷"}
  elseif bb=="蚌精" then
      bbs[1] = 65
    bbs[2] = 1200
    bbs[3] = 1500
    bbs[4] = 3840
    bbs[5] = 2880
    bbs[6] = 1200
    bbs[7] = 1140
    bbs[8] = {1.176,1.188,1.2,1.212,1.224}
    bbs[9] = {"水攻","慧根","高级水属性吸收","神迹","冥思"}
  elseif bb=="机关兽" then
      bbs[1] = 145
    bbs[2] = 1440
    bbs[3] = 1500
    bbs[4] = 5280
    bbs[5] = 2880
    bbs[6] = 1440
    bbs[7] = 1440
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"魔之心","高级法术连击","土属性吸收","烈火"}
  elseif bb=="阴阳伞" then
      bbs[1] = 95
    bbs[2] = 1440
    bbs[3] = 1440
    bbs[4] = 4800
    bbs[5] = 3000
    bbs[6] = 1500
    bbs[7] = 1440
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"上古灵符","驱鬼","剑荡四方","高级飞行"}
  elseif bb=="混沌兽" then
      bbs[1] = 155
    bbs[2] = 1440
    bbs[3] = 1476
    bbs[4] = 5400
    bbs[5] = 3240
    bbs[6] = 1320
    bbs[7] = 1560
    bbs[8] = {1.244,1.257,1.27,1.282,1.295}
    bbs[9] = {"再生","高级慧根","高级永恒","高级魔之心","奔雷咒"}
  elseif bb == "古代瑞兽" or bb == "古代瑞兽x" then
      bbs[1] = 45
    bbs[2] = 1140
    bbs[3] = 1260
    bbs[4] = 3600
    bbs[5] = 2400
    bbs[6] = 1380
    bbs[7] = 1200
    bbs[8] = {1.127,1.138,1.15,1.161,1.173}
    bbs[9] = {"高级神迹","高级反震","泰山压顶","高级驱鬼"}
  elseif bb == "蛟龙" or bb == "蛟龙x" then
      bbs[1] = 65
    bbs[2] = 1440
    bbs[3] = 1440
    bbs[4] = 4560
    bbs[5] = 3000
    bbs[6] = 1200
    bbs[7] = 1320
    bbs[8] = {1.176,1.188,1.2,1.212,1.224}
    bbs[9] = {"水漫金山","感知","高级永恒","高级水属性吸收"}
  elseif bb=="葫芦宝贝" then
      bbs[1] = 135
    bbs[2] = 1440
    bbs[3] = 1500
    bbs[4] = 4800
    bbs[5] = 2760
    bbs[6] = 1320
    bbs[7] = 1800
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级冥思","上古灵符","反震","魔之心"}
  elseif bb=="踏云兽" then
      bbs[1] = 135
    bbs[2] = 1524
    bbs[3] = 1440
    bbs[4] = 5400
    bbs[5] = 1800
    bbs[6] = 1440
    bbs[7] = 1440
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级招架","高级必杀","高级强力","弱点土"}
  elseif bb == "鬼将" or bb == "鬼将x" then
      bbs[1] = 105
    bbs[2] = 1524
    bbs[3] = 1380
    bbs[4] = 5040
    bbs[5] = 1440
    bbs[6] = 1320
    bbs[7] = 1320
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"惊心一剑","高级必杀","冥思","鬼魂术"}
  elseif bb=="狸" then
      bbs[1] = 5
    bbs[2] = 1440
    bbs[3] = 900
    bbs[4] = 2880
    bbs[5] = 1200
    bbs[6] = 1380
    bbs[7] = 1320
    bbs[8] = {0.999,1.009,1.02,1.03,1.04}
    bbs[9] = {"招架","土属性吸收","幸运","敏捷"}
  elseif bb == "狐狸精" or bb == "狐狸精x" then
      bbs[1] = 15
    bbs[2] = 1320
    bbs[3] = 1260
    bbs[4] = 3000
    bbs[5] = 1440
    bbs[6] = 1320
    bbs[7] = 1200
    bbs[8] = {1.009,1.019,1.03,1.04,1.05}
    bbs[9] = {"夜战","高级感知","慧根","高级慧根","弱点雷"}
  elseif bb=="巨蛙" then
      bbs[1] = 0
    bbs[2] = 1080
    bbs[3] = 840
    bbs[4] = 2700
    bbs[5] = 1200
    bbs[6] = 1320
    bbs[7] = 1020
    bbs[8] = {0.882,0.891,0.9,0.909,0.918}
    bbs[9] = {"慧根","幸运","水攻","弱点火"}
  elseif bb == "山贼" or bb == "山贼x" then
      bbs[1] = 5
    bbs[2] = 1080
    bbs[3] = 1200
    bbs[4] = 3600
    bbs[5] = 1200
    bbs[6] = 1200
    bbs[7] = 1320
    bbs[8] = {0.994,1.004,1.01,1.025,1.035}
    bbs[9] = {"招架","偷袭","强力","高级否定信仰"}
  elseif bb=="海星" then
      bbs[1] = 0
    bbs[2] = 1080
    bbs[3] = 1140
    bbs[4] = 2400
    bbs[5] = 1440
    bbs[6] = 1200
    bbs[7] = 1020
    bbs[8] = {0.882,0.891,0.9,0.909,0.918}
    bbs[9] = {"水属性吸收","弱点火","慧根","高级反震","水攻"}
  elseif bb == "小龙女" or bb == "小龙女x" then
      bbs[1] = 25
    bbs[2] = 1140
    bbs[3] = 1380
    bbs[4] = 3840
    bbs[5] = 1800
    bbs[6] = 1440
    bbs[7] = 1080
    bbs[8] = {1.043,1.054,1.065,1.075,1.086}
    bbs[9] = {"神佑复生","高级驱鬼","慧根","水攻","高级水属性吸收"}
  elseif bb=="红萼仙子" then
      bbs[1] = 135
    bbs[2] = 1500
    bbs[3] = 1500
    bbs[4] = 5400
    bbs[5] = 3000
    bbs[6] = 960
    bbs[7] = 1800
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}
    bbs[9] = {"上古灵符","高级飞行","高级冥思","奔雷咒"}
  elseif bb=="狸" then
      bbs[1] = 5
    bbs[2] = 1440
    bbs[3] = 900
    bbs[4] = 2880
    bbs[5] = 1200
    bbs[6] = 1380
    bbs[7] = 1320
    bbs[8] = {0.999,1.009,1.02,1.03,1.04}
    bbs[9] = {"幸运","偷袭","必杀","招架"}
  elseif bb == "风伯" or bb == "风伯x" then
      bbs[1] = 55
    bbs[2] = 1380
    bbs[3] = 1392
    bbs[4] = 4200
    bbs[5] = 2220
    bbs[6] = 1500
    bbs[7] = 1440
    bbs[8] = {1.127,1.138,1.15,1.161,1.173}
    bbs[9] = {"高级敏捷","奔雷咒","高级雷属性吸收","高级飞行"}
  elseif bb=="大蝙蝠" then
      bbs[1] = 5
    bbs[2] = 1080
    bbs[3] = 1140
    bbs[4] = 2520
    bbs[5] = 1800
    bbs[6] = 1500
    bbs[7] = 1500
    bbs[8] = {1.058,1.069,1.08,1.09,1.101}
    bbs[9] = {"吸血","高级感知","高级驱鬼","飞行","高级夜战","弱点水"}
  elseif bb=="幽萤娃娃" then
      bbs[1] = 105
    bbs[2] = 1440
    bbs[3] = 1440
    bbs[4] = 4200
    bbs[5] = 2640
    bbs[6] = 1536
    bbs[7] = 1560
    bbs[8] = {1.216,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级鬼魂术","高级防御","敏捷","高级法术抵抗"}
  elseif bb == "强盗" or bb == "强盗x" then
      bbs[1] = 5
    bbs[2] = 1260
    bbs[3] = 1260
    bbs[4] = 3300
    bbs[5] = 1380
    bbs[6] = 1200
    bbs[7] = 1200
    bbs[8] = {0.989,0.999,1.01,1.02,1.03}
    bbs[9] = {"连击","烈火","强力","否定信仰"}
  elseif bb=="巴蛇" then
      bbs[1] = 145
    bbs[2] = 1524
    bbs[3] = 1440
    bbs[4] = 4800
    bbs[5] = 1560
    bbs[6] = 1560
    bbs[7] = 1560
    bbs[8] = {1.234,1.247,1.26,1.273,1.285}
    bbs[9] = {"敏捷","嗜血追击","感知","毒","再生"}
  elseif bb=="机关鸟" then
      bbs[1] = 145
    bbs[2] = 1500
    bbs[3] = 1344
    bbs[4] = 4800
    bbs[5] = 2520
    bbs[6] = 1560
    bbs[7] = 1560
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级偷袭","驱怪","高级再生","否定信仰","飞行"}
  elseif bb=="律法女娲" then
      bbs[1] = 95
    bbs[2] = 1440
    bbs[3] = 1560
    bbs[4] = 4400
    bbs[5] = 2400
    bbs[6] = 1440
    bbs[7] = 1800
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"善恶有报","敏捷","再生","高级反击"}
  elseif bb=="猫灵兽形" then
      bbs[1] = 135
    bbs[2] = 1464
    bbs[3] = 1464
    bbs[4] = 4080
    bbs[5] = 2400
    bbs[6] = 1560
    bbs[7] = 1680
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"必杀","敏捷","高级偷袭","弱点水"}
  elseif bb=="镜妖" then
      bbs[1] = 85
    bbs[2] = 1460
    bbs[3] = 1320
    bbs[4] = 3840
    bbs[5] = 2400
    bbs[6] = 1560
    bbs[7] = 1440
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"反震","高级感知","鬼魂术","雷击"}
  elseif bb=="龙龟" then
      bbs[1] = 135
    bbs[2] = 1440
    bbs[3] = 1560
    bbs[4] = 5760
    bbs[5] = 3000
    bbs[6] = 1200
    bbs[7] = 1560
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}
    bbs[9] = {"水属性吸收","反震","高级防御","法术防御","水攻"}
  elseif bb=="机关人" then
      bbs[1] = 135
    bbs[2] = 1500
    bbs[3] = 1500
    bbs[4] = 5400
    bbs[5] = 1680
    bbs[6] = 1320
    bbs[7] = 1440
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}
    bbs[9] = {"壁垒击破","弱点火","必杀","高级招架"}
  elseif bb == "吸血鬼" or bb == "吸血鬼x" then
      bbs[1] = 95
    bbs[2] = 1440
    bbs[3] = 1320
    bbs[4] = 3600
    bbs[5] = 2400
    bbs[6] = 1320
    bbs[7] = 1800
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"偷袭","吸血","鬼魂术","驱鬼","弱点水"}
  elseif bb == "地狱战神" or bb == "地狱战神x" then
      bbs[1] = 55
    bbs[2] = 1500
    bbs[3] = 1440
    bbs[4] = 4500
    bbs[5] = 1800
    bbs[6] = 1080
    bbs[7] = 1500
    bbs[8] = {1.107,1.118,1.13,1.141,1.152}
    bbs[9] = {"泰山压顶","高级连击","高级魔之心","高级反震"}
  elseif bb=="琴仙" then
      bbs[1] = 125
    bbs[2] = 1440
    bbs[3] = 1440
    bbs[4] = 4800
    bbs[5] = 3240
    bbs[6] = 1380
    bbs[7] = 1440
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"泰山压顶","感知","神佑复生","再生","敏捷"}
  elseif bb == "蛤蟆精" or bb == "蛤蟆精x" then
      bbs[1] = 15
    bbs[2] = 1380
    bbs[3] = 1140
    bbs[4] = 3300
    bbs[5] = 1200
    bbs[6] = 1320
    bbs[7] = 1320
    bbs[8] = {1.009,1.019,1.03,1.04,1.05}
    bbs[9] = {"毒","必杀"}
  elseif bb == "如意仙子" or bb == "如意仙子x" then
      bbs[1] = 75
    bbs[2] = 1200
    bbs[3] = 1416
    bbs[4] = 4378
    bbs[5] = 2700
    bbs[6] = 1400
    bbs[7] = 1380
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"奔雷咒","地狱烈火","泰山压顶","烈火","弱点水"}
  elseif bb=="锦毛貂精" then
      bbs[1] = 75
    bbs[2] = 1200
    bbs[3] = 1260
    bbs[4] = 4200
    bbs[5] = 2711
    bbs[6] = 1560
    bbs[7] = 1680
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"冥思","泰山压顶","法术连击","敏捷"}
  elseif bb == "雾中仙" or bb == "雾中仙x" then
      bbs[1] = 125
    bbs[2] = 1440
    bbs[3] = 1500
    bbs[4] = 5400
    bbs[5] = 3000
    bbs[6] = 1320
    bbs[7] = 1800
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级神佑复生","高级感知","法术连击","敏捷"}
  elseif bb == "灵鹤" or bb == "灵鹤x" then
      bbs[1] = 125
    bbs[2] = 1440
    bbs[3] = 1440
    bbs[4] = 4560
    bbs[5] = 2760
    bbs[6] = 1560
    bbs[7] = 1440
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级永恒","高级驱鬼","高级再生","高级慧根","飞行"}
  elseif bb=="百足将军" then
      bbs[1] = 85
    bbs[2] = 1440
    bbs[3] = 1320
    bbs[4] = 4560
    bbs[5] = 2640
    bbs[6] = 1560
    bbs[7] = 1320
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"毒","落岩","高级夜战","弱点水"}
  elseif bb == "牛妖" or bb == "牛妖x" then
      bbs[1] = 25
    bbs[2] = 1500
    bbs[3] = 1020
    bbs[4] = 3000
    bbs[5] = 1140
    bbs[6] = 1320
    bbs[7] = 960
    bbs[8] = {1.078,1.089,1.1,1.111,1.122}
    bbs[9] = {"高级反击","高级慧根","高级防御","烈火"}
  elseif bb == "黑山老妖" or bb == "黑山老妖x" then
      bbs[1] = 45
    bbs[2] = 1140
    bbs[3] = 1440
    bbs[4] = 6000
    bbs[5] = 2400
    bbs[6] = 960
    bbs[7] = 1320
    bbs[8] = {1.107,1.118,1.13,1.141,1.152}
    bbs[9] = {"高级偷袭","高级吸血","高级精神集中"}
  elseif bb == "雷鸟人" or bb == "雷鸟人x" then
      bbs[1] = 45
    bbs[2] = 1200
    bbs[3] = 1200
    bbs[4] = 4200
    bbs[5] = 1920
    bbs[6] = 1440
    bbs[7] = 1140
    bbs[8] = {1.127,1.138,1.15,1.161,1.173}
    bbs[9] = {"高级雷属性吸收","奔雷咒","飞行","弱点土","雷击"}
  elseif bb == "芙蓉仙子" or bb == "芙蓉仙子x" then
      bbs[1] = 75
    bbs[2] = 1440
    bbs[3] = 1440
    bbs[4] = 4560
    bbs[5] = 2400
    bbs[6] = 1380
    bbs[7] = 1440
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"高级再生","高级飞行","高级幸运","雨润丰泽"}
  elseif bb == "凤凰" or bb == "凤凰x" then
      bbs[1] = 65
    bbs[2] = 1200
    bbs[3] = 1440
    bbs[4] = 4200
    bbs[5] = 2400
    bbs[6] = 1560
    bbs[7] = 1320
    bbs[8] = {1.176,1.188,1.2,1.212,1.224}
    bbs[9] = {"地狱烈火","高级神佑复生","高级火属性吸收","飞行","薪火相传","雨润丰泽"}
  elseif bb=="千年蛇魅" then
      bbs[1] = 75
    bbs[2] = 1380
    bbs[3] = 1320
    bbs[4] = 4380
    bbs[5] = 2640
    bbs[6] = 1440
    bbs[7] = 1500
    bbs[8] = {1.195,1.207,1.22,1.232,1.244}
    bbs[9] = {"敏捷","毒","偷袭","高级吸血"}
  elseif bb == "巡游天神" or bb == "巡游天神x" then
      bbs[1] = 75
    bbs[2] = 1380
    bbs[3] = 1380
    bbs[4] = 5400
    bbs[5] = 2640
    bbs[6] = 1200
    bbs[7] = 1680
    bbs[8] = {1.195,1.207,1.22,1.232,1.244}
    bbs[9] = {"泰山压顶","地狱烈火","高级招架","高级必杀"}
  elseif bb == "兔子怪" or bb == "兔子怪x" then
      bbs[1] = 35
    bbs[2] = 1320
    bbs[3] = 1140
    bbs[4] = 4200
    bbs[5] = 2400
    bbs[6] = 1440
    bbs[7] = 1140
    bbs[8] = {1.097,1.108,1.12,1.131,1.142}
    bbs[9] = {"高级感知","高级冥思","高级驱鬼","高级幸运","高级永恒","高级敏捷","弱点土"}
  elseif bb == "黑熊" or bb == "黑熊x" then
      bbs[1] = 15
    bbs[2] = 1140
    bbs[3] = 1320
    bbs[4] = 4200
    bbs[5] = 1320
    bbs[6] = 1080
    bbs[7] = 1320
    bbs[8] = {1.004,1.014,1.025,1.135,1.045}
    bbs[9] = {"反击","必杀","强力","防御","迟钝"}
  elseif bb=="狂豹兽形" then
      bbs[1] = 135
    bbs[2] = 1500
    bbs[3] = 1440
    bbs[4] = 4560
    bbs[5] = 2160
    bbs[6] = 1320
    bbs[7] = 1560
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级强力","夜战","高级飞行","偷袭"}
  elseif bb=="灵符女娲" then
      bbs[1] = 95
    bbs[2] = 1320
    bbs[3] = 1560
    bbs[4] = 4800
    bbs[5] = 3000
    bbs[6] = 1440
    bbs[7] = 1440
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"上古灵符","高级冥思","地狱烈火","落岩","雨润丰泽"}
  elseif bb=="泡泡" then
      bbs[1] = 0
    bbs[2] = 1320
    bbs[3] = 1380
    bbs[4] = 4200
    bbs[5] = 2160
    bbs[6] = 1320
    bbs[7] = 1320
    bbs[8] = {1.078,1.089,1.1,1.111,1.122}
    bbs[9] = {"高级防御","高级幸运","连击","精神集中","再生"}
  elseif bb == "幽灵" or bb == "幽灵x" then
      bbs[1] = 95
    bbs[2] = 1476
    bbs[3] = 1440
    bbs[4] = 4200
    bbs[5] = 2640
    bbs[6] = 1320
    bbs[7] = 1680
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"高级反击","高级飞行","死亡召唤","鬼魂术"}
  elseif bb=="泪妖" then
      bbs[1] = 85
    bbs[2] = 1200
    bbs[3] = 1200
    bbs[4] = 3600
    bbs[5] = 2400
    bbs[6] = 1200
    bbs[7] = 1560
    bbs[8] = {1.176,1.188,1.2,1.212,1.224}
    bbs[9] = {"冥思","高级魔之心","法术暴击","弱点土","水攻"}
  elseif bb == "炎魔神" or bb == "炎魔神x" then
      bbs[1] = 125
    bbs[2] = 1500
    bbs[3] = 1440
    bbs[4] = 4800
    bbs[5] = 3000
    bbs[6] = 1440
    bbs[7] = 1320
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级必杀","高级火属性吸收","烈火","地狱烈火"}
  elseif bb=="鼠先锋" then
      bbs[1] = 85
    bbs[2] = 1200
    bbs[3] = 1440
    bbs[4] = 4440
    bbs[5] = 2880
    bbs[6] = 1560
    bbs[7] = 1560
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"驱鬼","冥思","泰山压顶","敏捷"}
  elseif bb == "夜罗刹" or bb == "夜罗刹x" then
      bbs[1] = 125
    bbs[2] = 1500
    bbs[3] = 1440
    bbs[4] = 5760
    bbs[5] = 2880
    bbs[6] = 1440
    bbs[7] = 1440
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"必杀","高级敏捷","高级魔之心","夜舞倾城"}
  elseif bb == "星灵仙子" or bb == "星灵仙子x" then
      bbs[1] = 75
    bbs[2] = 1200
    bbs[3] = 1416
    bbs[4] = 4380
    bbs[5] = 2700
    bbs[6] = 1440
    bbs[7] = 1380
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"雷击","奔雷咒","水漫金山","高级慧根"}
  elseif bb == "蜘蛛精" or bb == "蜘蛛精x" then
      bbs[1] = 35
    bbs[2] = 1140
    bbs[3] = 1355
    bbs[4] = 4980
    bbs[5] = 2580
    bbs[6] = 1080
    bbs[7] = 1200
    bbs[8] = {1.068,1.079,1.09,1.1,1.111}
    bbs[9] = {"吸血","高级感知","高级毒","弱点土"}
  elseif bb=="净瓶女娲" then
      bbs[1] = 105
    bbs[2] = 1464
    bbs[3] = 1440
    bbs[4] = 4800
    bbs[5] = 2880
    bbs[6] = 1560
    bbs[7] = 1560
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"上古灵符","奔雷咒","高级慧根","雨润丰泽"}
  elseif bb=="鲛人" then
      bbs[1] = 65
    bbs[2] = 1440
    bbs[3] = 1440
    bbs[4] = 4560
    bbs[5] = 1920
    bbs[6] = 1380
    bbs[7] = 1440
    bbs[8] = {1.176,1.188,1.2,1.212,1.224}
    bbs[9] = {"连击","高级水属性吸收","移花接木","敏捷"}
  elseif bb == "天将" or bb == "天将x" then
      bbs[1] = 55
    bbs[2] = 1380
    bbs[3] = 1140
    bbs[4] = 4800
    bbs[5] = 2340
    bbs[6] = 1380
    bbs[7] = 1200
    bbs[8] = {1.136,1.148,1.16,1.171,1.183}
    bbs[9] = {"高级强力","驱鬼","连击","幸运"}
  elseif bb == "龟丞相" or bb == "龟丞相x" then
      bbs[1] = 35
    bbs[2] = 1020
    bbs[3] = 1440
    bbs[4] = 5820
    bbs[5] = 1980
    bbs[6] = 900
    bbs[7] = 1140
    bbs[8] = {1.038,1.049,1.06,1.07,1.081}
    bbs[9] = {"冥思","驱鬼","防御","水漫金山","水属性吸收","水攻"}
  elseif bb=="蝎子精" then
      bbs[1] = 135
    bbs[2] = 1464
    bbs[3] = 1464
    bbs[4] = 6240
    bbs[5] = 2880
    bbs[6] = 1320
    bbs[7] = 1800
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}
    bbs[9] = {"高级反震","招架","高级再生","毒"}
  elseif bb=="犀牛将军兽形" then
      bbs[1] = 75
    bbs[2] = 1440
    bbs[3] = 1464
    bbs[4] = 4800
    bbs[5] = 2520
    bbs[6] = 1200
    bbs[7] = 1140
    bbs[8] = {1.205,1.217,1.23,1.242,1.254}
    bbs[9] = {"法术暴击","土属性吸收","法术波动","落岩"}
  elseif bb == "僵尸" or bb == "僵尸x" then
      bbs[1] = 35
    bbs[2] = 1440
    bbs[3] = 1080
    bbs[4] = 4320
    bbs[5] = 2400
    bbs[6] = 1200
    bbs[7] = 1380
    bbs[8] = {1.048,1.059,1.07,1.08,1.091}
    bbs[9] = {"土属性吸收","弱点雷","防御","鬼魂术","夜战"}
  elseif bb == "蝴蝶仙子" or bb == "蝴蝶仙子x" then
      bbs[1] = 45
    bbs[2] = 1320
    bbs[3] = 1140
    bbs[4] = 3000
    bbs[5] = 3000
    bbs[6] = 1440
    bbs[7] = 1440
    bbs[8] = {1.078,1.089,1.1,1.111,1.122}
    bbs[9] = {"神迹","高级魔之心","高级敏捷","飞行","雨润丰泽"}
  elseif bb == "马面" or bb == "马面x" then
      bbs[1] = 35
    bbs[2] = 1320
    bbs[3] = 1320
    bbs[4] = 3600
    bbs[5] = 1800
    bbs[6] = 1440
    bbs[7] = 1200
    bbs[8] = {1.048,1.059,1.07,1.08,1.091}
    bbs[9] = {"驱鬼","高级必杀","强力","高级鬼魂术","夜战"}
  elseif bb == "蟹将" or bb == "蟹将x" then
      bbs[1] = 25
    bbs[2] = 1320
    bbs[3] = 1200
    bbs[4] = 5100
    bbs[5] = 2280
    bbs[6] = 1200
    bbs[7] = 1200
    bbs[8] = {1.025,1.035,1.046,1.056,1.066}
    bbs[9] = {"高级连击","精神集中","招架","水属性吸收"}
  elseif bb=="画魂" then
      bbs[1] = 105
    bbs[2] = 1380
    bbs[3] = 1440
    bbs[4] = 4320
    bbs[5] = 2880
    bbs[6] = 1320
    bbs[7] = 1440
    bbs[8] = {1.215,1.227,1.24,1.252,1.264}
    bbs[9] = {"高级鬼魂术","地狱烈火","幸运","高级魔之心"}
  elseif bb=="碧水夜叉" then
      bbs[1] = 65
    bbs[2] = 1380
    bbs[3] = 1320
    bbs[4] = 4200
    bbs[5] = 2760
    bbs[6] = 1440
    bbs[7] = 1800
    bbs[8] = {1.186,1.198,1.21,1.222,1.234}
    bbs[9] = {"高级反震","奔雷咒","强力","壁垒击破"}
  elseif bb=="狂豹人形" or bb=="白豹人形" then
      bbs[1] = 155
    bbs[2] = 1536
    bbs[3] = 1440
    bbs[4] = 4800
    bbs[5] = 2280
    bbs[6] = 1440
    bbs[7] = 1560
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}
    bbs[9] = {"夜战","高级飞行","高级强力","偷袭","吸血"}
  -- 神兽
  elseif bb=="超级土地公公" then
    bbs[9] = {"高级神佑","高级法术连击","天降灵葫","招架","高级魔之心"}
  elseif bb=="超级六耳猕猴" then
    bbs[9] = {"须弥真言","高级法术连击","永恒","上古灵符","高级法术暴击"}
  elseif bb=="超级神鸡" then
    bbs[9] = {"高级感知","高级法术波动","地狱烈火","招架","魔之心"}
  elseif bb=="超级玉兔" then
    bbs[9] = {"高级神佑复生","高级法术波动","月光","驱怪","高级法术暴击"}
  elseif bb=="超级神猴" then
    bbs[9] = {"高级法术波动","高级法术连击","奔雷咒","法术暴击","魔之心"}
  elseif bb=="超级神龙" then
    bbs[9] = {"龙魂","高级法术波动","奔雷咒","再生","魔之心"}
  elseif bb=="超级神羊" then
    bbs[9] = {"驱鬼","高级法术波动","奔雷咒","法术暴击","高级魔之心"}
  elseif bb=="超级孔雀" then
    bbs[9] = {"幸运","高级法术暴击","高级神佑","再生","高级魔之心"}
  elseif bb=="超级灵狐" then
    bbs[9] = {"高级感知","高级法术暴击","奔雷咒","法术连击","高级魔之心"}
  elseif bb=="超级筋斗云" then
    bbs[9] = {"高级感知","高级法术连击","奔雷咒","反震","高级魔之心"}
  elseif bb=="超级神鸡(物理型)" then
    bbs[9] = {"高级神佑","高级强力","从天而降","驱怪","必杀"}
  elseif bb=="鲲鹏(物理型)" or bb=="进阶鲲鹏(物理型)" then
    bbs[9] = {"水击三千","高级必杀","高级偷袭","高级神佑复生","逍遥游"}
  elseif bb=="超级玉兔(物理型)" then
    bbs[9] = {"高级敏捷","高级感知","连击","高级夜战","偷袭"}
  elseif bb=="超级神猴(物理型)" then
    bbs[9] = {"高级神佑复生","高级吸血","大快朵颐","连击","必杀"}
  elseif bb=="超级土地公公(物理型)" then
    bbs[9] = {"高级敏捷","高级必杀","高级连击","驱怪","高级神佑复生"}
  elseif bb=="超级神羊(物理型)" then
    bbs[9] = {"高级必杀","感知","高级连击","千钧一怒","反震"}
  elseif bb=="超级六耳猕猴(物理型)" then
    bbs[9] = {"高级敏捷","高级招架","高级连击","幸运","高级偷袭"}
  elseif bb=="超级神马(物理型)" then
    bbs[9] = {"高级神佑复生","浮云神马","高级连击","幸运","神迹"}
  elseif bb=="超级神马" then
    bbs[9] = {"高级魔之心","奔雷咒","高级法术连击","法术暴击","慧根"}
  elseif bb=="超级孔雀(物理型)" then
    bbs[9] = {"高级偷袭","高级飞行","高级再生","必杀","高级连击"}
  elseif bb=="超级灵狐(物理型)" then
    bbs[9] = {"高级敏捷","惊心一剑","高级必杀","驱怪","高级偷袭"}
  elseif bb=="超级筋斗云(物理型)" then
    bbs[9] = {"高级神佑复生","高级偷袭","高级夜战","强力","高级敏捷"}
  elseif bb=="超级神龙(物理型)" then
    bbs[9] = {"高级必杀","高级驱鬼","高级夜战","幸运","强力"}
  elseif bb=="超级麒麟(物理型)" then
    bbs[9] = {"高级合纵","高级夜战","高级连击","高级幸运","偷袭"}
  elseif bb=="超级麒麟" then
    bbs[9] = {"高级魔之心","泰山压顶","高级法术连击","感知","高级驱鬼"}
  elseif bb=="超级大鹏" then
    bbs[9] = {"高级法术波动","奔雷咒","高级法术暴击","高级招架","冥思"}
  elseif bb=="超级麒麟(物理型)" then
    bbs[9] = {"高级飞行","高级偷袭","高级神佑复生","高级敏捷","必杀"}
  elseif bb=="超级赤焰兽" then
    bbs[9] = {"高级法术连击","高级神佑复生","魔之心","高级法术暴击","高级冥思"}
  elseif bb=="超级赤焰兽(物理型)" then
    bbs[9] = {"高级必杀","高级感知","高级反击","幸运","高级毒"}
  elseif bb=="超级白泽" then
    bbs[9] = {"高级法术暴击","水漫金山","高级魔之心","高级反震","上古灵符"}
  elseif bb=="超级白泽(物理型)" then
    bbs[9] = {"高级必杀","高级夜战","高级敏捷","高级幸运","感知"}
  elseif bb=="超级灵鹿" then
    bbs[9] = {"高级法术暴击","泰山压顶","高级法术连击","高级再生","上古灵符"}
  elseif bb=="超级灵鹿(物理型)" then
    bbs[9] = {"善恶有报","高级再生","高级偷袭","高级冥思","永恒"}
  elseif bb=="超级大象" then
    bbs[9] = {"高级法术连击","奔雷咒","高级魔之心","高级神迹","雷击"}
  elseif bb=="超级大象(物理型)" then
    bbs[9] = {"高级强力","高级再生","高级必杀","高级反震","驱怪"}
  elseif bb=="超级金猴" then
    bbs[9] = {"高级法术波动","奔雷咒","高级魔之心","高级精神集中","雷击"}
  elseif bb=="超级金猴(物理型)" then
    bbs[9] = {"高级偷袭","高级连击","高级幸运","高级敏捷","驱怪"}
  elseif bb=="超级大熊猫" then
    bbs[9] = {"高级法术波动","奔雷咒","高级魔之心","高级冥思","雷击"}
  elseif bb=="超级大熊猫(物理型)" then
    bbs[9] = {"高级连击","高级防御","高级感知","高级夜战","高级强力"}
  elseif bb=="超级泡泡" then
    bbs[9] = {"高级感知","奔雷咒","高级魔之心","高级慧根","雷击"}
  elseif bb=="超级泡泡(物理型)" then
    bbs[9] = {"高级必杀","高级神佑复生","高级感知","高级飞行","驱怪"}
  elseif bb=="超级神兔" then
    bbs[9] = {"高级法术连击","奔雷咒","魔之心","高级反震","感知"}
  elseif bb=="超级神兔(物理型)" then
    bbs[9] = {"高级连击","高级偷袭","高级敏捷","驱怪","幸运"}
  elseif bb=="超级神虎" then
    bbs[9] = {"高级法术暴击","奔雷咒","魔之心","高级驱鬼","法术波动"}
  elseif bb=="超级神虎(物理型)" then
    bbs[9] = {"高级感知","嗜血追击","高级夜战","连击","强力"}
  elseif bb=="超级神牛" then
    bbs[9] = {"高级法术波动","奔雷咒","高级法术连击","冥思","魔之心"}
  elseif bb=="超级神牛(物理型)" then
    bbs[9] = {"力劈华山","高级幸运","高级招架","必杀","强力"}
  elseif bb=="超级海豚" then
    bbs[9] = {"高级法术暴击","水漫金山","高级魔之心","高级感知","慧根"}
  elseif bb=="超级海豚(物理型)" then
    bbs[9] = {"剑荡四方","高级偷袭","高级幸运","高级必杀","驱怪"}
  elseif bb=="超级人参娃娃" then
    bbs[9] = {"高级法术波动","泰山压顶","魔之心","高级法术连击","高级冥思"}
  elseif bb=="超级人参娃娃(物理型)" then
    bbs[9] = {"壁垒击破","高级必杀","高级强力","高级驱鬼","幸运"}
  elseif bb=="超级青鸾" then
    bbs[9] = {"法术暴击","奔雷咒","高级魔之心","高级幸运","高级神佑复生"}
  elseif bb=="超级青鸾(物理型)" then
    bbs[9] = {"高级夜战","苍鸾怒击","高级飞行","高级反震","高级连击"}
  elseif bb=="超级腾蛇" then
    bbs[9] = {"高级法术波动","地狱烈火","魔之心","灵能激发","永恒"}
  elseif bb=="超级腾蛇(物理型)" then
    bbs[9] = {"高级连击","高级毒","高级夜战","偷袭","敏捷"}
  -- 进阶神兽
  elseif bb=="进阶超级土地公公" then
    bbs[9] = {"高级神佑","高级法术连击","天降灵葫","招架","高级魔之心"}
  elseif bb=="进阶超级六耳猕猴" then
    bbs[9] = {"须弥真言","高级法术连击","永恒","上古灵符","高级法术暴击"}
  elseif bb=="进阶超级神鸡" then
    bbs[9] = {"高级感知","高级法术波动","地狱烈火","招架","魔之心"}
  elseif bb=="进阶超级玉兔" then
    bbs[9] = {"高级神佑复生","高级法术波动","月光","驱怪","高级法术暴击"}
  elseif bb=="进阶超级神猴" then
    bbs[9] = {"高级法术波动","高级法术连击","奔雷咒","法术暴击","魔之心"}
  elseif bb=="进阶超级神龙" then
    bbs[9] = {"龙魂","高级法术波动","奔雷咒","再生","魔之心"}
  elseif bb=="进阶超级神羊" then
    bbs[9] = {"驱鬼","高级法术波动","奔雷咒","法术暴击","高级魔之心"}
  elseif bb=="进阶超级孔雀" then
    bbs[9] = {"幸运","高级法术暴击","高级神佑","再生","高级魔之心"}
  elseif bb=="进阶超级灵狐" then
    bbs[9] = {"高级感知","高级法术暴击","奔雷咒","法术连击","高级魔之心"}
  elseif bb=="进阶超级筋斗云" then
    bbs[9] = {"高级感知","高级法术连击","奔雷咒","反震","高级魔之心"}
  elseif bb=="进阶超级神鸡(物理型)" then
    bbs[9] = {"高级神佑","高级冲击","从天而降","驱怪","必杀"}
  elseif bb=="进阶超级玉兔(物理型)" then
    bbs[9] = {"高级敏捷","高级感知","连击","高级夜战","偷袭"}
  elseif bb=="进阶超级神猴(物理型)" then
    bbs[9] = {"高级神佑复生","高级吸血","大快朵颐","连击","必杀"}
  elseif bb=="进阶超级土地公公(物理型)" then
    bbs[9] = {"高级敏捷","高级必杀","高级连击","驱怪","高级神佑复生"}
  elseif bb=="进阶超级神羊(物理型)" then
    bbs[9] = {"高级必杀","感知","高级连击","千钧一怒","赶尽杀绝"}
  elseif bb=="进阶超级六耳猕猴(物理型)" then
    bbs[9] = {"高级敏捷","高级招架","高级连击","幸运","高级偷袭"}
  elseif bb=="进阶超级神马(物理型)" then
    bbs[9] = {"高级神佑复生","浮云神马","高级连击","幸运","神迹"}
  elseif bb=="进阶超级神马" then
    bbs[9] = {"高级魔之心","奔雷咒","高级法术连击","法术暴击","慧根"}
  elseif bb=="进阶超级孔雀(物理型)" then
    bbs[9] = {"高级偷袭","高级飞行","高级再生","必杀","高级连击"}
  elseif bb=="进阶超级灵狐(物理型)" then
    bbs[9] = {"高级敏捷","惊心一剑","高级必杀","驱怪","高级偷袭"}
  elseif bb=="进阶超级筋斗云(物理型)" then
    bbs[9] = {"高级神佑复生","高级偷袭","高级夜战","强力","高级敏捷"}
  elseif bb=="进阶超级神龙(物理型)" then
    bbs[9] = {"高级必杀","高级驱鬼","高级夜战","幸运","强力"}
  elseif bb=="进阶超级麒麟(物理型)" then
    bbs[9] = {"高级合纵","高级夜战","高级连击","高级幸运","偷袭"}
  elseif bb=="进阶超级麒麟" then
    bbs[9] = {"高级魔之心","泰山压顶","高级法术连击","感知","高级驱鬼"}
  elseif bb=="进阶超级大鹏" then
    bbs[9] = {"高级法术波动","奔雷咒","高级法术暴击","高级招架","冥思"}
  elseif bb=="进阶超级麒麟(物理型)" then
    bbs[9] = {"高级飞行","高级偷袭","高级神佑复生","高级敏捷","必杀"}
  elseif bb=="进阶超级赤焰兽" then
    bbs[9] = {"高级法术连击","高级神佑复生","魔之心","高级法术暴击","高级冥思"}
  elseif bb=="进阶超级赤焰兽(物理型)" then
    bbs[9] = {"高级必杀","高级感知","高级反击","幸运","高级毒"}
  elseif bb=="进阶超级白泽" then
    bbs[9] = {"高级法术暴击","水漫金山","高级魔之心","高级反震","上古灵符"}
  elseif bb=="进阶超级白泽(物理型)" then
    bbs[9] = {"高级必杀","高级夜战","高级敏捷","高级幸运","感知"}
  elseif bb=="进阶超级灵鹿" then
    bbs[9] = {"高级法术暴击","泰山压顶","高级法术连击","高级再生","上古灵符"}
  elseif bb=="进阶超级灵鹿(物理型)" then
    bbs[9] = {"善恶有报","高级再生","高级偷袭","高级冥思","永恒"}
  elseif bb=="进阶超级大象" then
    bbs[9] = {"高级法术连击","奔雷咒","高级魔之心","高级神迹","雷击"}
  elseif bb=="进阶超级大象(物理型)" then
    bbs[9] = {"高级强力","高级再生","高级必杀","高级反震","驱怪"}
  elseif bb=="进阶超级金猴" then
    bbs[9] = {"高级法术波动","奔雷咒","高级魔之心","高级精神集中","雷击"}
  elseif bb=="进阶超级金猴(物理型)" then
    bbs[9] = {"高级偷袭","高级连击","高级幸运","高级敏捷","驱怪"}
  elseif bb=="进阶超级大熊猫" then
    bbs[9] = {"高级法术波动","奔雷咒","高级魔之心","高级冥思","雷击"}
  elseif bb=="进阶超级大熊猫(物理型)" then
    bbs[9] = {"高级连击","高级防御","高级感知","高级夜战","高级强力"}
  elseif bb=="进阶超级泡泡" then
    bbs[9] = {"高级感知","奔雷咒","高级魔之心","高级慧根","雷击"}
  elseif bb=="进阶超级泡泡(物理型)" then
    bbs[9] = {"高级必杀","高级神佑复生","高级感知","高级飞行","驱怪"}
  elseif bb=="进阶超级神兔" then
    bbs[9] = {"高级法术连击","奔雷咒","魔之心","高级反震","感知"}
  elseif bb=="进阶超级神兔(物理型)" then
    bbs[9] = {"高级连击","高级偷袭","高级敏捷","驱怪","幸运"}
  elseif bb=="进阶超级神虎" then
    bbs[9] = {"高级法术暴击","奔雷咒","魔之心","高级驱鬼","法术波动"}
  elseif bb=="进阶超级神虎(物理型)" then
    bbs[9] = {"高级感知","嗜血追击","高级夜战","连击","强力"}
  elseif bb=="进阶超级神牛" then
    bbs[9] = {"高级法术波动","奔雷咒","高级法术连击","冥思","魔之心"}
  elseif bb=="进阶超级神牛(物理型)" then
    bbs[9] = {"力劈华山","高级幸运","高级招架","必杀","强力"}
  elseif bb=="进阶超级海豚" then
    bbs[9] = {"高级法术暴击","水漫金山","高级魔之心","高级感知","慧根"}
  elseif bb=="进阶超级海豚(物理型)" then
    bbs[9] = {"剑荡四方","高级偷袭","高级幸运","高级必杀","驱怪"}
  elseif bb=="进阶超级人参娃娃" then
    bbs[9] = {"高级法术波动","泰山压顶","魔之心","高级法术连击","高级冥思"}
  elseif bb=="进阶超级人参娃娃(物理型)" then
    bbs[9] = {"壁垒击破","高级必杀","高级强力","高级驱鬼","幸运"}
  elseif bb=="进阶超级青鸾" then
    bbs[9] = {"法术暴击","奔雷咒","高级魔之心","高级幸运","高级神佑复生"}
  elseif bb=="进阶超级青鸾(物理型)" then
    bbs[9] = {"高级夜战","苍鸾怒击","高级飞行","高级反震","高级连击"}
  elseif bb=="进阶超级腾蛇" then
    bbs[9] = {"高级法术波动","地狱烈火","魔之心","灵能激发","永恒"}
  elseif bb=="进阶超级腾蛇(物理型)" then
    bbs[9] = {"高级连击","高级毒","高级夜战","偷袭","敏捷"}
  elseif bb=="小毛头" then
      bbs[1] = 0
    bbs[2] = 960
    bbs[3] = 960
    bbs[4] = 3600
    bbs[5] = 1200
    bbs[6] = 840
    bbs[7] = 1320
    bbs[8] = {0.882,0.891,0.9,0.909,0.918}
    bbs[9] = {"高级连击","高级防御","高级夜战","高级偷袭"}
  elseif bb=="小丫丫" then
      bbs[1] = 0
    bbs[2] = 960
    bbs[3] = 960
    bbs[4] = 3600
    bbs[5] = 1200
    bbs[6] = 840
    bbs[7] = 1320
    bbs[8] = {0.882,0.891,0.9,0.909,0.918}
    bbs[9] = {"高级连击","高级防御","高级夜战","高级偷袭"}
  elseif bb=="毗舍童子" or bb=="暗黑毗舍童子" then
      bbs[1] = 175
    bbs[2] = 1560
    bbs[3] = 1428
    bbs[4] = 4200
    bbs[5] = 2160
    bbs[6] = 1440
    bbs[7] = 1620
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}
    bbs[9] = {"高级合纵","敏捷","高级法术抵抗","连击","神迹"}
  elseif bb=="增长巡守" then--########################################################?自己修改?##########################################
      bbs[1] = 175
    bbs[2] = 1500
    bbs[3] = 1380
    bbs[4] = 6000
    bbs[5] = 2760
    bbs[6] = 1200
    bbs[7] = 960
    bbs[8] = {1.265,1.27,1.275,1.28,1.285}
    bbs[9] = {"灵山禅语","高级招架","驱鬼","神佑复生"}
  elseif bb=="真陀护法" then
      bbs[1] = 175
    bbs[2] = 1536
    bbs[3] = 1440
    bbs[4] = 5040
    bbs[5] = 2400
    bbs[6] = 1380
    bbs[7] = 1560
    bbs[8] = {1.226,1.237,1.25,1.262,1.275}
    bbs[9] = {"高级精神集中","必杀","偷袭","吸血","驱怪","连击"}
  elseif bb=="般若天女" then
      bbs[1] = 175
    bbs[2] = 1459
    bbs[3] = 1459
    bbs[4] = 5521
    bbs[5] = 3301
    bbs[6] = 1471
    bbs[7] = 1567
    bbs[8] = {1.226,1.237,1.25,1.262,1.275}
    bbs[9] = {"高级飞行","高级幸运","敏捷","魔之心","高级慧根","上古灵符"}
  elseif bb=="持国巡守" then
      bbs[1] = 175
    bbs[2] = 1440
    bbs[3] = 1380
    bbs[4] = 6000
    bbs[5] = 3000
    bbs[6] = 1200
    bbs[7] = 960
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}
    bbs[9] = {"须弥真言","再生","奔雷咒","神佑复生"}
  --夜光修改 添加宝宝属性
  elseif bb=="谛听" or bb=="暗黑谛听" then
    bbs[1] = 175
    bbs[2] = 1464--攻资
    bbs[3] = 1440--防资
    bbs[4] = 6000--体资
    bbs[5] = 3240--法资
    bbs[6] = 1416--速资
    bbs[7] = 1320--躲闪
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}--成长组
    bbs[9] = {"高级驱鬼","泰山压顶","观照万象","落岩"}--技能组
  elseif bb=="狐不归" then
    bbs[1] = 105
    bbs[2] = 1320--攻资
    bbs[3] = 1380--防资
    bbs[4] = 4800--体资
    bbs[5] = 2400--法资
    bbs[6] = 1440--速资
    bbs[7] = 1560--躲闪
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"招架","冥思","敏捷","进击必杀","高级水属性吸收"}--技能组
  elseif bb=="花铃" then
    bbs[1] = 55
    bbs[2] = 1320--攻资
    bbs[3] = 1440--防资
    bbs[4] = 4560--体资
    bbs[5] = 3000--法资
    bbs[6] = 1440--速资
    bbs[7] = 1320--躲闪
    bbs[8] = {1.176,1.188,1.2,1.212,1.224}--成长组
    bbs[9] = {"高级防御","敏捷","高级幸运","地狱烈火","生命守护"}--技能组
  elseif bb=="涂山雪" then
    bbs[1] = 175
    bbs[2] = 1512--攻资
    bbs[3] = 1416--防资
    bbs[4] = 5040--体资
    bbs[5] = 2880--法资
    bbs[6] = 1380--速资
    bbs[7] = 1320--躲闪
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"冥思","高级防御","高级反震","高级神佑复生"}--技能组
  elseif bb=="月魅" then
    bbs[1] = 125
    bbs[2] = 1440--攻资
    bbs[3] = 1380--防资
    bbs[4] = 5760--体资
    bbs[5] = 3000--法资
    bbs[6] = 1440--速资
    bbs[7] = 1560--躲闪
    bbs[8] = {1.214,1.226,1.239,1.251,1.263}--成长组
    bbs[9] = {"法术暴击","水攻","高级招架","法术连击","偷袭"}--技能组
  elseif bb=="云游火" then
    bbs[1] = 105
    bbs[2] = 1452--攻资
    bbs[3] = 1380--防资
    bbs[4] = 4440--体资
    bbs[5] = 2280--法资
    bbs[6] = 1320--速资
    bbs[7] = 1560--躲闪
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"高级合纵","敏捷","连击","否定信仰"}--技能组
  elseif bb=="鲲鹏" then
    bbs[1] = 0
    bbs[2] = 1550--攻资
    bbs[3] = 1482--防资
    bbs[4] = 6000--体资
    bbs[5] = 2027--法资
    bbs[6] = 1343--速资
    bbs[7] = 1396--躲避
    bbs[8] = {1.235,1.2475,1.26,1.2725,1.285}--成长组
    bbs[9] = {"扶摇万里","高级魔之心","高级法术暴击","高级神佑复生","逍遥游"}--技能组

  elseif bb=="魔化毗舍童子" then
    bbs[1] = 175
    bbs[2] = 1560--攻资
    bbs[3] = 1550--防资
    bbs[4] = 6000--体资
    bbs[5] = 3000--法资
    bbs[6] = 1500--速资
    bbs[7] = 1560--躲闪
    bbs[8] = {1.235,1.2475,1.26,1.2725,1.285}--成长组
    bbs[9] = {"无赦魔诀","连击","高级合纵","敏捷","高级法术抵抗"}--技能组
  elseif bb=="雷龙" then
    bbs[1] = 175
    bbs[2] = 1500--攻资
    bbs[3] = 1500--防资
    bbs[4] = 5040--体资
    bbs[5] = 2600--法资
    bbs[6] = 1200--速资
    bbs[7] = 1200--躲闪
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"风起龙游","连击","驱鬼","高级反震","高级神迹"}--技能组
  elseif bb=="执音" then
    bbs[1] = 155
    bbs[2] = 1440--攻资
    bbs[3] = 1500--防资
    bbs[4] = 5400--体资
    bbs[5] = 3240--法资
    bbs[6] = 1320--速资
    bbs[7] = 1200--躲闪
    bbs[8] = {1.243,1.256,1.269,1.281,1.294}--成长组
    bbs[9] = {"飞行","地狱烈火","高级法术暴击","薪火相传","永恒"}--技能组
  elseif bb=="壬寅神虎" then
    bbs[1] = 65
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"虎虎生风","高级敏捷","高级反震","高级反击"}--技能组
  elseif bb=="妙华天女" then
    bbs[1] = 175
    bbs[2] = 1423--攻资
    bbs[3] = 1423--防资
    bbs[4] = 5449--体资
    bbs[5] = 3433--法资
    bbs[6] = 1471--速资
    bbs[7] = 1567--躲资
    bbs[8] = {1.285,1.2875,1.29,1.2925,1.297}--成长组
    bbs[9] = {"凝光炼彩","高级永恒","冥思","再生"}--技能组
  elseif bb=="月皇" then
    bbs[1] = 65
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"高级法术暴击","高级雷属性吸收","高级水属性吸收","高级防御"}--技能组
  elseif bb=="巨石守卫(昼)" then
    bbs[1] = 105
    bbs[2] = 1416--攻资
    bbs[3] = 1476--防资
    bbs[4] = 5400--体资
    bbs[5] = 2400--法资
    bbs[6] = 1332--速资
    bbs[7] = 1440--躲闪
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"迟钝","高级土属性吸收","魔法反击","落岩"}--技能组
  elseif bb=="日游神" then
    bbs[1] = 85
    bbs[2] = 1440--攻资
    bbs[3] = 1260--防资
    bbs[4] = 4200--体资
    bbs[5] = 2400--法资
    bbs[6] = 1380--速资
    bbs[7] = 1320--躲闪
    bbs[8] = {1.185,1.197,1.21,1.222,1.234}--成长组
    bbs[9] = {"高级感知","强力","神迹","反击","盾气"}--技能组
  elseif bb=="鬼妃" then
    bbs[1] = 65
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"高级鬼魂术","死亡召唤","高级必杀","冥思"}--技能组
  elseif bb=="无常鬼差(白)" then
    bbs[1] = 155
    bbs[2] = 1500--攻资
    bbs[3] = 1440--防资
    bbs[4] = 4800--体资
    bbs[5] = 2880--法资
    bbs[6] = 1476--速资
    bbs[7] = 1560--躲闪
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"鬼魂术","敏捷","高级飞行","高级遗志"}--技能组
  elseif bb=="无常鬼差(黑)" then
    bbs[1] = 155
    bbs[2] = 1500--攻资
    bbs[3] = 1440--防资
    bbs[4] = 4800--体资
    bbs[5] = 2880--法资
    bbs[6] = 1476--速资
    bbs[7] = 1560--躲闪
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"高级遗志","偷袭","毒","神佑复生"}--技能组
  elseif bb=="玄珠灵仙" then
    bbs[1] = 105
    bbs[2] = 1320--攻资
    bbs[3] = 1380--防资
    bbs[4] = 4320--体资
    bbs[5] = 2940--法资
    bbs[6] = 1464--速资
    bbs[7] = 1680--躲闪
    bbs[8] = {1.214,1.226,1.239,1.251,1.263}--成长组
    bbs[9] = {"高级魔法反击","永恒","神佑复生","法术暴击","烈焰斩"}--技能组
  elseif bb=="夜游神" then
    bbs[1] = 125
    bbs[2] = 1440--攻资
    bbs[3] = 1440--防资
    bbs[4] = 4560--体资
    bbs[5] = 3000--法资
    bbs[6] = 1440--速资
    bbs[7] = 1560--躲闪
    bbs[8] = {1.214,1.226,1.239,1.251,1.263}--成长组
    bbs[9] = {"驱鬼","高级魔之心","神佑复生","法术暴击","影袭"}--技能组
  elseif bb=="月灵" then
    bbs[1] = 65
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"泰山压顶","夜舞倾城","高级魔之心","高级神佑复生"}--技能组
  elseif bb=="独角鬼王" then
    bbs[1] = 65
    bbs[2] = 1380--攻资
    bbs[3] = 1440--防资
    bbs[4] = 4200--体资
    bbs[5] = 2760--法资
    bbs[6] = 1440--速资
    bbs[7] = 1320--躲闪
    bbs[8] = {1.155,1.167,1.179,1.19,1.202}--成长组
    bbs[9] = {"地狱烈火","驱鬼","法术暴击","盾气","鬼魂术"}--技能组
  elseif bb=="沙暴" then
    bbs[1] = 175
    bbs[2] = 1404--攻资
    bbs[3] = 1400--防资
    bbs[4] = 4200--体资
    bbs[5] = 2160--法资
    bbs[6] = 1380--速资
    bbs[7] = 1500--躲闪
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"风沙之盾","高级防御","招架","反击","法术抵抗"}--技能组
  elseif bb=="恶魔泡泡" or bb=="超级恶魔泡泡" or bb=="进阶超级恶魔泡泡" or bb=="进阶恶魔泡泡"  then
    bbs[1] = 0
    bbs[2] = 1500--攻资
    bbs[3] = 1500--防资
    bbs[4] = 5500--体资
    bbs[5] = 2000--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"高级偷袭","连击","高级吸血","必杀"}--技能组
  elseif bb=="自在心猿" then
    bbs[1] = 175
    bbs[2] = 1584--攻资
    bbs[3] = 1464--防资
    bbs[4] = 4800--体资
    bbs[5] = 2160--法资
    bbs[6] = 1500--速资
    bbs[7] = 1320--躲闪
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}--成长组
    bbs[9] = {"驱鬼","高级敏捷","高级否定信仰","必杀","永恒"}--技能组
  elseif bb=="觉醒涂山雪" then
    bbs[1] = 175
    bbs[2] = 1519--攻资
    bbs[3] = 1419--防资
    bbs[4] = 5049--体资
    bbs[5] = 2889--法资
    bbs[6] = 1389--速资
    bbs[7] = 1329--躲闪
    bbs[8] = {1.238,1.251,1.264,1.276,1.289}--成长组
    bbs[9] = {"冥思","防御","高级否定信仰","高级精神集中"}--技能组
  elseif bb=="有苏鸩" then
    bbs[1] = 155
    bbs[2] = 1440--攻资
    bbs[3] = 1440--防资
    bbs[4] = 5500--体资
    bbs[5] = 3240--法资
    bbs[6] = 1320--速资
    bbs[7] = 1560--躲闪
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"否定信仰","欣欣向荣","魔之心","高级毒"}--技能组
  elseif bb=="虬龙" then
    bbs[1] = 105
    bbs[2] = 1500--攻资
    bbs[3] = 1400--防资
    bbs[4] = 4800--体资
    bbs[5] = 1600--法资
    bbs[6] = 1440--速资
    bbs[7] = 1200--躲闪
    bbs[8] = {1.213,1.225,1.238,1.25,1.262}--成长组
    bbs[9] = {"嗜血追击","高级必杀","偷袭","高级反击"}--技能组
  elseif bb=="司雪" then
    bbs[1] = 175
    bbs[2] = 1404--攻资
    bbs[3] = 1400--防资
    bbs[4] = 4080--体资
    bbs[5] = 2160--法资
    bbs[6] = 1200--速资
    bbs[7] = 1320--躲闪
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"水漫金山","映雪棱镜","幸运","永恒"}--技能组
  elseif bb=="幻姬" then
    bbs[1] = 125
    bbs[2] = 1500--攻资
    bbs[3] = 1440--防资
    bbs[4] = 4800--体资
    bbs[5] = 2160--法资
    bbs[6] = 1560--速资
    bbs[7] = 1440--躲闪
    bbs[8] = {1.213,1.225,1.238,1.25,1.262}--成长组
    bbs[9] = {"高级魔之心","高级冥思","飞行","薪火相传","鬼魂术"}--技能组
  elseif bb=="嘲风" then
    bbs[1] = 65
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"高级永恒","高级冥思","反震","高级防御"}--技能组

  elseif bb=="泡泡灵仙·剑侠客" then
    bbs[1] = 0
    bbs[2] = 1600--攻资
    bbs[3] = 1600--防资
    bbs[4] = 5500--体资
    bbs[5] = 3500--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.3,1.3,1.3,1.3,1.3}--成长组
    bbs[9] = {"高级连击","偷袭","招架"}--技能组
  elseif bb=="泡泡灵仙·骨精灵" then
    bbs[1] = 0
    bbs[2] = 1600--攻资
    bbs[3] = 1600--防资
    bbs[4] = 5500--体资
    bbs[5] = 3500--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.3,1.3,1.3,1.3,1.3}--成长组
    bbs[9] = {"泰山压顶","法术波动","幸运"}--技能组
  elseif bb=="泡泡灵仙·羽灵神" then
    bbs[1] = 0
    bbs[2] = 1600--攻资
    bbs[3] = 1600--防资
    bbs[4] = 5500--体资
    bbs[5] = 3500--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.3,1.3,1.3,1.3,1.3}--成长组
    bbs[9] = {"高级必杀","强力","防御","凭风借力"}--技能组
  elseif bb=="泡泡灵仙·神天兵" then
    bbs[1] = 0
    bbs[2] = 1600--攻资
    bbs[3] = 1600--防资
    bbs[4] = 5500--体资
    bbs[5] = 3500--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.3,1.3,1.3,1.3,1.3}--成长组
    bbs[9] = {"高级偷袭","连击","强力","气贯长虹"}--技能组
  elseif bb=="泡泡灵仙·巫蛮儿" then
    bbs[1] = 0
    bbs[2] = 1600--攻资
    bbs[3] = 1600--防资
    bbs[4] = 5500--体资
    bbs[5] = 3500--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.249,1.262,1.275,1.287,1.3}--成长组
    bbs[9] = {"泰山压顶","魔之心","法术连击","柳暗花明"}--技能组
  elseif bb=="泡泡灵仙·杀破狼" then
    bbs[1] = 0
    bbs[2] = 1600--攻资
    bbs[3] = 1600--防资
    bbs[4] = 5500--体资
    bbs[5] = 3500--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.249,1.262,1.275,1.287,1.3}--成长组
    bbs[9] = {"高级幸运","再生","防御","与生俱来"}--技能组
  elseif bb=="泡泡灵仙·飞燕女" then
    bbs[1] = 0
    bbs[2] = 1600--攻资
    bbs[3] = 1600--防资
    bbs[4] = 5500--体资
    bbs[5] = 3500--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.249,1.262,1.275,1.287,1.3}--成长组
    bbs[9] = {"水漫金山","魔之心","冥思"}--技能组
  elseif bb=="泡泡灵仙·龙太子" then
    bbs[1] = 0
    bbs[2] = 1600--攻资
    bbs[3] = 1600--防资
    bbs[4] = 5500--体资
    bbs[5] = 3500--法资
    bbs[6] = 1400--速资
    bbs[7] = 1400--躲闪
    bbs[8] = {1.249,1.262,1.275,1.287,1.3}--成长组
    bbs[9] = {"水漫金山","魔之心","神佑复生","义薄云天"}--技能组
  elseif bb=="超级红孩儿" then
    bbs[1] = 0
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"超级三昧真火","魔之心","敏捷","法术连击","法术暴击"}--技能组
  elseif bb=="超级飞廉" then
    bbs[1] = 0
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"高级幸运","高级偷袭","高级敏捷"}--技能组
  elseif bb=="超级离火兽" then
    bbs[1] = 0
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"高级偷袭","高级飞行","高级毒","力劈华山"}--技能组
  elseif bb=="超级神柚" then
    bbs[1] = 0
    bbs[2] = 1500 --攻资
    bbs[3] = 1500 --防资
    bbs[4] = 5500 --体资
    bbs[5] = 3000 --法资
    bbs[6] = 1500 --速资
    bbs[7] = 1500 --躲避
    bbs[8] = {1.204,1.216,1.229,1.241,1.253}--成长组
    bbs[9] = {"超级神柚复生","高级驱鬼","高级连击","高级精神集中"}--技能组
  elseif bb=="长乐灵仙" then
    bbs[1] = 175
    bbs[2] = 1500--攻资
    bbs[3] = 1380--防资
    bbs[4] = 4080--体资
    bbs[5] = 2160--法资
    bbs[6] = 1440--速资
    bbs[7] = 1620--躲闪
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}--成长组
    bbs[9] = {"幸运","高级飞行","神佑复生","花好月圆"}--技能组
  elseif bb=="司辰侍者(未来)" then
    bbs[1] = 155
    bbs[2] = 1440--攻资
    bbs[3] = 1500--防资
    bbs[4] = 4800--体资
    bbs[5] = 3240--法资
    bbs[7] = 1680--躲资
    bbs[6] = 1560--速资
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}--成长组
    bbs[9] = {"高级永恒","再生","飞行","慧根"}--技能组
  elseif bb=="司辰侍者(过去)" then
    bbs[1] = 155
    bbs[2] = 1440--攻资
    bbs[3] = 1500--防资
    bbs[4] = 4800--体资
    bbs[5] = 3240--法资
    bbs[7] = 1680--躲资
    bbs[6] = 1560--速资
    bbs[8] = {1.234,1.247,1.26,1.272,1.285}--成长组
    bbs[9] = {"高级永恒","再生","飞行","慧根"}--技能组
  elseif bb=="司雨" then
    bbs[1] = 175
    bbs[2] = 1440--攻资
    bbs[3] = 1380--防资
    bbs[4] = 4200--体资
    bbs[5] = 2160--法资
    bbs[7] = 1440--躲资
    bbs[6] = 1200--速资
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"偷袭","必杀","高级再生","雨露之泽"}--技能组
  elseif bb=="司风" then
    bbs[1] = 175
    bbs[2] = 1440--攻资
    bbs[3] = 1380--防资
    bbs[4] = 4080--体资
    bbs[5] = 2160--法资
    bbs[7] = 1500--躲资
    bbs[6] = 1320--速资
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"清风之华","敏捷","连击","高级飞行"}--技能组
  elseif bb=="多闻巡守" then
    bbs[1] = 175
    bbs[2] = 1536--攻资
    bbs[3] = 1380--防资
    bbs[4] = 6000--体资
    bbs[5] = 2640--法资
    bbs[7] = 960--躲资
    bbs[6] = 1380--速资
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"诸天正法","高级幸运","感知","神佑复生"}--技能组
  elseif bb=="天机虫" then
    bbs[1] = 0
    bbs[2] = 1320--攻资
    bbs[3] = 1200--防资
    bbs[4] = 2700--体资
    bbs[5] = 2100--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1320--速资
    bbs[8] = {0.93,0.94,0.95,0.959,0.969}--成长组
    bbs[9] = {"高级否定信仰","偷袭","防御","夜战"}--技能组
  elseif bb=="巨石守卫(夜)" then
    bbs[1] = 105
    bbs[2] = 1416--攻资
    bbs[3] = 1476--防资
    bbs[4] = 5400--体资
    bbs[5] = 2400--法资
    bbs[7] = 1440--躲资
    bbs[6] = 1344--速资
    bbs[8] = {1.214,1.226,1.239,1.251,1.263}--成长组
    bbs[9] = {"魔之心","高级土属性吸收","泰山压顶","反震"}--技能组
  elseif bb=="广目巡守" then
    bbs[1] = 175
    bbs[2] = 1440--攻资
    bbs[3] = 1380--防资
    bbs[4] = 6240--体资
    bbs[5] = 2640--法资
    bbs[7] = 960--躲资
    bbs[6] = 1380--速资
    bbs[8] = {1.225,1.237,1.25,1.262,1.275}--成长组
    bbs[9] = {"净台妙谛","高级敏捷","防御","神佑复生"}--技能组
  elseif bb=="月光虫" then
    bbs[1] = 35
    bbs[2] = 960--攻资
    bbs[3] = 900--防资
    bbs[4] = 2700--体资
    bbs[5] = 3000--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1320--速资
    bbs[8] = {1.013,1.023,1.034,1.044,1.054}--成长组
    bbs[9] = {"茁壮","慧根","冥思","精神集中"}--技能组
  elseif bb=="月光金乌虫" then
    bbs[1] = 35
    bbs[2] = 1320--攻资
    bbs[3] = 1080--防资
    bbs[4] = 3600--体资
    bbs[5] = 3000--法资
    bbs[7] = 1020--躲资
    bbs[6] = 1080--速资
    bbs[8] = {1.013,1.023,1.034,1.044,1.054}--成长组
    bbs[9] = {"欣欣向荣","慧根","冥思","精神集中"}--技能组
  elseif bb=="月光雪蛙" then
    bbs[1] = 35
    bbs[2] = 1080--攻资
    bbs[3] = 1080--防资
    bbs[4] = 3000--体资
    bbs[5] = 1500--法资
    bbs[7] = 1020--躲资
    bbs[6] = 1200--速资
    bbs[8] = {1.127,1.138,1.15,1.161,1.172}--成长组
    bbs[9] = {"万物之灵(水)","法术波动","水属性吸收","弱点火"}--技能组
  elseif bb=="望月蛙" then
    bbs[1] = 15
    bbs[2] = 1320--攻资
    bbs[3] = 1080--防资
    bbs[4] = 3600--体资
    bbs[5] = 3000--法资
    bbs[7] = 1020--躲资
    bbs[6] = 1080--速资
    bbs[8] = {1.013,1.023,1.034,1.044,1.054}--成长组
    bbs[9] = {"茁壮","慧根","冥思","高级精神集中"}--技能组
  elseif bb=="毒云龟" then
    bbs[1] = 35
    bbs[2] = 960--攻资
    bbs[3] = 1200--防资
    bbs[4] = 3600--体资
    bbs[5] = 2700--法资
    bbs[7] = 1080--躲资
    bbs[6] = 1380--速资
    bbs[8] = {1.127,1.138,1.15,1.161,1.172}--成长组
    bbs[9] = {"高级敏捷","高级驱鬼","雷属性吸收","飞行"}--技能组
  elseif bb=="毒花龟(夜)" then
    bbs[1] = 35
    bbs[2] = 1320--攻资
    bbs[3] = 1356--防资
    bbs[4] = 4800--体资
    bbs[5] = 2580--法资
    bbs[7] = 1080--躲资
    bbs[6] = 960--速资
    bbs[8] = {0.989,0.999,1.01,1.02,1.03}--成长组
    bbs[9] = {"力大无穷(木)","鬼魂术","毒","防御"}--技能组
  elseif bb=="毒花龟(日)" then
    bbs[1] = 35
    bbs[2] = 1080--攻资
    bbs[3] = 1356--防资
    bbs[4] = 4800--体资
    bbs[5] = 2400--法资
    bbs[7] = 1080--躲资
    bbs[6] = 960--速资
    bbs[8] = {0.989,0.999,1.01,1.02,1.03}--成长组
    bbs[9] = {"健壮(木)","鬼魂术","毒","防御"}--技能组
  elseif bb=="沙狸" then
    bbs[1] = 5
    bbs[2] = 1320--攻资
    bbs[3] = 900--防资
    bbs[4] = 2880--体资
    bbs[5] = 1200--法资
    bbs[7] = 1320--躲资
    bbs[6] = 1380--速资
    bbs[8] = {0.989,0.999,1.01,1.02,1.03}--成长组
    bbs[9] = {"健壮(土)","土属性吸收","幸运","敏捷"}--技能组
  elseif bb=="沙虫" then
    bbs[1] = 25
    bbs[2] = 1320--攻资
    bbs[3] = 900--防资
    bbs[4] = 2400--体资
    bbs[5] = 1200--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1320--速资
    bbs[8] = {0.989,0.999,1.01,1.02,1.03}--成长组
    bbs[9] = {"真灵(土)","盾气","连击"}--技能组
  elseif bb=="海狸" then
    bbs[1] = 5
    bbs[2] = 1200--攻资
    bbs[3] = 1200--防资
    bbs[4] = 3600--体资
    bbs[5] = 2100--法资
    bbs[7] = 1320--躲资
    bbs[6] = 1320--速资
    bbs[8] = {0.989,0.999,1.01,1.02,1.03}--成长组
    bbs[9] = {"健壮(水)","感知","水攻","水属性吸收"}--技能组
  elseif bb=="火云龟" then
    bbs[1] = 35
    bbs[2] = 1080--攻资
    bbs[3] = 1200--防资
    bbs[4] = 3600--体资
    bbs[5] = 2700--法资
    bbs[7] = 1080--躲资
    bbs[6] = 1380--速资
    bbs[8] = {1.154,1.166,1.178,1.189,1.201}--成长组
    bbs[9] = {"力大无穷(火)","高级敏捷","高级驱鬼","雷属性吸收","飞行"}--技能组
  elseif bb=="火月蛙" then
    bbs[1] = 35
    bbs[2] = 1320--攻资
    bbs[3] = 1080--防资
    bbs[4] = 3600--体资
    bbs[5] = 3000--法资
    bbs[7] = 1020--躲资
    bbs[6] = 1080--速资
    bbs[8] = {1.154,1.166,1.178,1.189,1.201}--成长组
    bbs[9] = {"万物之灵(火)","慧根","冥思","高级精神集中","茁壮"}--技能组
  elseif bb=="火沙虫" then
    bbs[1] = 35
    bbs[2] = 1320--攻资
    bbs[3] = 900--防资
    bbs[4] = 2400--体资
    bbs[5] = 1200--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1320--速资
    bbs[8] = {1.097,1.108,1.12,1.131,1.142}--成长组
    bbs[9] = {"万物之灵(土)","真灵(火)","盾气","连击"}--技能组
  elseif bb=="炼丹童子" then
    bbs[1] = 65
    bbs[2] = 1416--攻资
    bbs[3] = 1440--防资
    bbs[4] = 4440--体资
    bbs[5] = 3000--法资
    bbs[7] = 1380--躲资
    bbs[6] = 1320--速资
    bbs[8] = {1.176,1.188,1.2,1.212,1.224}--成长组
    bbs[9] = {"高级驱鬼","慧根","神迹","神佑复生"}--技能组--"妙手灵丹",
  elseif bb=="金乌月光虫" then
    bbs[1] = 35
    bbs[2] = 1320--攻资
    bbs[3] = 1080--防资
    bbs[4] = 3600--体资
    bbs[5] = 3000--法资
    bbs[7] = 1020--躲资
    bbs[6] = 1080--速资
    bbs[8] = {1.013,1.023,1.034,1.044,1.054}--成长组
    bbs[9] = {"欣欣向荣","慧根","冥思","精神集中"}--技能组
  elseif bb=="金乌火虫" then
    bbs[1] = 35
    bbs[2] = 1500--攻资
    bbs[3] = 900--防资
    bbs[4] = 2700--体资
    bbs[5] = 1800--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1320--速资
    bbs[8] = {1.154,1.166,1.178,1.189,1.201}--成长组
    bbs[9] = {"万物之灵(金)","法术暴击","驱鬼","慧根"}--技能组
  elseif bb=="金乌虫" then
    bbs[1] = 35
    bbs[2] = 1500--攻资
    bbs[3] = 900--防资
    bbs[4] = 2700--体资
    bbs[5] = 1800--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1320--速资
    bbs[8] = {1.013,1.023,1.034,1.044,1.054}--成长组
    bbs[9] = {"真灵(火)","法术暴击","烈火","反击"}--技能组
  elseif bb=="金翼" then
    bbs[1] = 85
    bbs[2] = 1100--攻资
    bbs[3] = 1440--防资
    bbs[4] = 3600--体资
    bbs[5] = 3000--法资
    bbs[7] = 1320--躲资
    bbs[6] = 1380--速资
    bbs[8] = {1.203,1.215,1.228,1.24,1.252}--成长组
    bbs[9] = {"薪火相传","高级神佑复生","烈火","飞行"}--技能组
  elseif bb=="雪狸" then
    bbs[1] = 15
    bbs[2] = 1380--攻资
    bbs[3] = 1320--防资
    bbs[4] = 3900--体资
    bbs[5] = 1200--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1080--速资
    bbs[8] = {0.999,1.009,1.02,1.03,1.04}--成长组
    bbs[9] = {"强力","水属性吸收","法术抵抗","幸运"}--技能组
  elseif bb=="雪蛙" then
    bbs[1] = 25
    bbs[2] = 1080--攻资
    bbs[3] = 1080--防资
    bbs[4] = 3000--体资
    bbs[5] = 1500--法资
    bbs[7] = 1020--躲资
    bbs[6] = 1200--速资
    bbs[8] = {0.93,0.94,0.95,0.959,0.969}--成长组
    bbs[9] = {"真灵(水)","法术波动","弱点火","水属性吸收"}--技能组
  elseif bb=="食魂虫(夜)" then
    bbs[1] = 35
    bbs[2] = 1440--攻资
    bbs[3] = 900--防资
    bbs[4] = 2700--体资
    bbs[5] = 2400--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1320--速资
    bbs[8] = {1.013,1.023,1.034,1.044,1.054}--成长组
    bbs[9] = {"万物之灵(木)","夜战","强力","毒"}--技能组
  elseif bb=="食魂虫(日)" then
    bbs[1] = 35
    bbs[2] = 1080--攻资
    bbs[3] = 900--防资
    bbs[4] = 2700--体资
    bbs[5] = 2100--法资
    bbs[7] = 1200--躲资
    bbs[6] = 1320--速资
    bbs[8] = {1.013,1.023,1.034,1.044,1.054}--成长组
    bbs[9] = {"真灵(木)","招架","毒"}--技能组


 end
 return bbs

end


function 取神兽资质2(造型,物法)
	if 物法 ~= nil then
		造型 = 造型.."_"..物法
	end
	local bbs = {}
	if 造型 == "超级神龙" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级必杀","高级驱鬼","高级夜战","高级幸运","高级强力"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神龙_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","龙魂","高级法术波动","高级魔之心","高级再生"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级腾蛇" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级连击","高级毒","高级夜战","高级偷袭","高级敏捷"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级腾蛇_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"地狱烈火","灵能激发","高级法术波动","高级魔之心","高级永恒"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级青鸾" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"苍鸾怒击","高级夜战","高级飞行","高级连击","高级反震"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级青鸾_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级魔之心","高级幸运","高级神佑复生","高级法术暴击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级人参娃娃" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"壁垒击破","高级必杀","高级强力","高级驱鬼","高级幸运"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级人参娃娃_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"泰山压顶","高级法术波动","高级冥思","高级法术暴击","高级魔之心"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级海豚" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"剑荡四方","高级偷袭","高级必杀","高级幸运","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级海豚_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"水漫金山","高级魔之心","高级法术暴击","高级感知","高级慧根"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神牛" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"力劈华山","高级幸运","高级招架","高级必杀","高级强力"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神牛_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级法术波动","高级法术暴击","奔雷咒","高级冥思","高级魔之心"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神虎" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级感知","嗜血追击","高级夜战","高级连击","高级强力"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神虎_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级驱鬼","高级法术暴击","奔雷咒","高级魔之心","高级法术波动"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神兔" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级偷袭","高级连击","高级敏捷","高级夜战","高级幸运"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神兔_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级法术连击","高级反震","奔雷咒","高级感知","高级魔之心"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级泡泡" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级必杀","高级神佑复生","高级感知","高级飞行","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级泡泡_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级慧根","高级魔之心","奔雷咒","高级感知","高级法术波动"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级大熊猫" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级连击","高级防御","高级感知","高级强力","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级大熊猫_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级冥思","高级魔之心","奔雷咒","高级法术波动","高级法术连击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级金猴" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级偷袭","高级敏捷","高级幸运","高级连击","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级金猴_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级魔之心","高级精神集中","高级法术波动","高级法术连击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级大象"  then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级强力","高级再生","高级反震","高级必杀","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级大象_法系"  then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级神迹","高级魔之心","高级法术连击","高级法术波动"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级灵鹿" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"善恶有报","高级再生","高级冥思","高级偷袭","高级永恒"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级灵鹿_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"泰山压顶","高级法术连击","高级法术暴击","上古灵符","高级再生"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级白泽"  then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级必杀","高级敏捷","高级夜战","高级幸运","高级感知"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级白泽_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"水漫金山","高级法术暴击","高级魔之心","高级反震","上古灵符"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级赤焰兽" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级感知","高级必杀","高级反击","高级毒","高级幸运"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级赤焰兽_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"八凶法阵","地狱烈火","高级冥思","高级法术暴击","高级魔之心"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级麒麟" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级合纵","高级连击","高级幸运","高级夜战","高级偷袭"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级麒麟_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"泰山压顶","高级魔之心","高级驱鬼","高级法术连击","高级感知"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级大鹏" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级飞行","高级敏捷","高级偷袭","高级神佑复生","高级必杀"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级大鹏_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级法术暴击","高级招架","高级法术波动","高级冥思"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级灵狐" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"惊心一剑","高级敏捷","高级必杀","高级偷袭","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级灵狐_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级法术暴击","高级感知","高级魔之心","高级法术连击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级孔雀" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级偷袭","高级飞行","高级再生","高级连击","高级必杀"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级孔雀_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级魔之心","高级神佑复生","高级法术暴击","高级幸运"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神马" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级连击","高级神佑复生","浮云神马","高级幸运","高级神迹"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神马_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级法术连击","高级魔之心","高级法术暴击","高级慧根"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级六耳猕猴" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级敏捷","高级连击","高级招架","高级偷袭","高级幸运"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级六耳猕猴_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"须弥真言","上古灵符","高级法术连击","高级法术暴击","高级永恒"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神羊" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级必杀","高级连击","千钧一怒","高级感知","高级反震"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神羊_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级魔之心","高级法术波动","高级法术暴击","高级驱鬼"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级土地公公" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级必杀","高级敏捷","高级神佑复生","高级连击","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级土地公公_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级法术连击","高级神佑复生","高级魔之心","天降灵葫","高级招架"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神猴" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级吸血","高级神佑复生","大快朵颐","高级必杀","高级连击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神猴_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级法术连击","高级法术波动","奔雷咒","高级魔之心","高级法术暴击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级玉兔" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级夜战","高级敏捷","高级感知","高级偷袭","高级连击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级玉兔_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级法术波动","高级法术暴击","高级神佑复生","月光","高级驱鬼"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神鸡" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级强力","高级神佑复生","从天而降","高级必杀","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神鸡_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级法术波动","高级感知","地狱烈火","高级魔之心","高级招架"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级筋斗云" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级神佑复生","高级偷袭","高级敏捷","高级夜战","高级强力"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级筋斗云_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级法术连击","高级感知","高级魔之心","高级反震"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神蛇" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级连击","高级毒","高级夜战","高级偷袭","高级敏捷"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神蛇_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"地狱烈火","灵能激发","高级法术波动","高级魔之心","高级永恒"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神狗" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级神迹","高级神佑复生","理直气壮","高级强力","高级再生"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神狗_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"地狱烈火","高级招架","高级防御","高级魔之心","高级法术暴击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "飞天" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级连击","高级敏捷","高级飞行","高级夜战","高级神佑复生"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "飞天_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"流沙轻音","净台妙谛","高级法术暴击","高级法术波动","高级幸运"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神鼠" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级夜战","高级隐身","高级敏捷","高级偷袭","高级吸血"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神鼠_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级慧根","高级再生","高级魔之心","高级法术波动"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神猪" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级神佑复生","高级必杀","高级防御","高级幸运","高级再生"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神猪_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级魔之心","地狱烈火","高级法术暴击","高级招架","高级驱鬼"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级小白龙" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级必杀","高级反击","高级再生","高级夜战","高级感知"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级小白龙_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级法术连击","高级法术暴击","叱咤风云","高级神佑复生","高级永恒"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级猪小戒" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级必杀","高级强力","高级防御","高级偷袭","高级反击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级猪小戒_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"食指大动","高级魔之心","高级感知","高级法术连击","高级法术波动"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级红孩儿" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级神迹","高级连击","高级夜战","高级必杀","高级感知"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级红孩儿_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"超级三昧真火","桀骜自恃","圣婴大王","高级魔之心","高级敏捷"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级飞廉" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"净台妙谛","高级必杀","高级偷袭","高级敏捷","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级飞廉_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"奔雷咒","高级法术连击","高级法术暴击","高级法术波动","高级慧根"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级鲲鹏" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"北冥之渊","水击三千","高级必杀","高级偷袭","高级神佑复生","逍遥游","高级夜战","高级再生","高级防御"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级鲲鹏_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"北冥之渊","扶摇万里","高级魔之心","高级法术暴击","高级神佑复生","逍遥游","高级精神集中","高级法术波动","高级法术连击"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神柚" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"超级神柚复生","高级偷袭","高级必杀","高级连击","高级夜战"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级神柚_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"超级神柚复生","高级魔之心","水漫金山","高级法术暴击","高级法术波动"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级飞天" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"高级连击","高级敏捷","高级飞行","高级夜战","高级神佑复生"}
	    bbs[9] = {200,40,40,40,40,40}
	elseif 造型 == "超级飞天_法系" then
		bbs[1] = 1550 --攻资
		bbs[2] = 1550 --防资
		bbs[3] = 6000 --体资
		bbs[4] = 3000 --法资
		bbs[5] = 1550 --速资
		bbs[6] = 1550 --躲避
		bbs[7] = 1.25
	    bbs[8] = {"流沙轻音","净台妙谛","高级法术暴击","高级法术波动","高级幸运"}
	    bbs[9] = {200,40,40,40,40,40}

	end
	return  bbs
end