-- @Author: baidwwy
-- @Date:   2023-08-31 22:54:45
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-04-09 21:51:12

--======================================================================--
function 引擎.取模型(ch,wq,qw,锦衣)

	local chs = {}
	local symx = ch
	if wq ~= nil then
		wq = "_"..wq
	else
		wq = ""
	end
	local s=""
	if ch == "巫蛮儿" or ch == "杀破狼" or ch == "羽灵神" or ch == "偃无师"  or ch == "桃夭夭"  or ch == "鬼潇潇"  or ch == "逍遥生" or ch == "舞天姬"   then
	   	s = wq
	end
    if ch == nil then
        ch = '默认'
    else
        ch = ch..s
        if 锦衣~=nil then
            ch=锦衣.."_"..ch
        end
    end

	if PutongModel[ch] then
	    for i=1,3 do
	    	if PutongModel[ch]["chs_"..i] then
	    	    chs[i]=PutongModel[ch]["chs_"..i]
	    	end
	    end
	end
	if chs[3]==nil then
		local jps0 = 引擎.取所有模型(symx)
		if jps0~=nil and jps0.站立~=nil then
		    chs[1] =  jps0.站立
			chs[2] =  jps0.行走
			chs[3] =  ""
		end
	end






	return chs
end
--1.普通站立  2.普通走路  3.WDF文件
--======================================================================--
PutongModel={}
PutongModel["默认"]={
    chs_1 = 0x0CC00001
    ,chs_2 = 0x0CC00001
    ,chs_3 = "aaa.wdf"
    }
PutongModel["影精灵_棒"]={
   chs_1 = 0x00000939
    ,chs_2 =0x00000940
    ,chs_3 = "cwmx.wdf"
    }
PutongModel["影精灵坐下"]={
  chs_1 = 0x00000933
   ,chs_2 = 0x00000933
   ,chs_3 = "cwmx.wdf"
   }
PutongModel["影精灵悲伤"]={
  chs_1 = 0x00000934
   ,chs_2 = 0x00000934
   ,chs_3 = "cwmx.wdf"
   }
PutongModel["影精灵发怒"]={
  chs_1 = 0x00000935
   ,chs_2 = 0x00000935
   ,chs_3 = "cwmx.wdf"
   }
PutongModel["影精灵舞蹈"]={
  chs_1 = 0x00000936
   ,chs_2 = 0x00000936
   ,chs_3 = "cwmx.wdf"
   }
PutongModel["影精灵行礼"]={
  chs_1 = 0x00000937
   ,chs_2 = 0x00000937
   ,chs_3 = "cwmx.wdf"
   }
PutongModel["影精灵休息"]={
  chs_1 = 0x00000933
   ,chs_2 = 0x00000933
   ,chs_3 = "cwmx.wdf"
   }
PutongModel["影精灵招手"]={
  chs_1 = 0x00000938
   ,chs_2 = 0x00000938
   ,chs_3 = "cwmx.wdf"
}
PutongModel["影精灵倒地"]={
  chs_1 = 0x00000924
   ,chs_2 = 0x00000924
   ,chs_3 = "cwmx.wdf"
}
PutongModel["雨师妾"]={
    chs_1 = 0x00001001
    ,chs_2 = 0x00001000
    ,chs_3 = "影精灵.wdf"
    }
PutongModel["刑天"]={
    chs_1 = 0x00001003
    ,chs_2 = 0x00001002
    ,chs_3 = "影精灵.wdf"
    }
PutongModel["风祖飞廉"]={
    chs_1 = 0x00001005
    ,chs_2 = 0x00001004
    ,chs_3 = "影精灵.wdf"
    }
PutongModel["食铁兽"]={
    chs_1 = 0x00001011
    ,chs_2 = 0x00001010
    ,chs_3 = "影精灵.wdf"
    }

PutongModel["影精灵"]={
    chs_1 = 321
    ,chs_2 = 322
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 323
    }
PutongModel["非天(乾)_影精灵"]={
    chs_1 = 1172
    ,chs_2 = 1173
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1174
    }
PutongModel["非天(坤)_影精灵"]={
    chs_1 = 1287
    ,chs_2 = 1288
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1289
    }
PutongModel["丝萝乔木_影精灵"]={
    chs_1 = 7
    ,chs_2 = 8
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 9
    }
PutongModel["义战(乾)_影精灵"]={
    chs_1 = 23
    ,chs_2 = 24
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 25
    }
PutongModel["义战(坤)_影精灵"]={
    chs_1 = 48
    ,chs_2 = 49
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 50
    }
PutongModel["九州海沸(乾)_影精灵"]={
    chs_1 = 67
    ,chs_2 = 68
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 69
    }
PutongModel["九州海沸(坤)_影精灵"]={
    chs_1 = 86
    ,chs_2 = 87
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 88
    }
PutongModel["九阴勾魂_影精灵"]={
    chs_1 = 105
    ,chs_2 = 112
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 113
    }
PutongModel["八狱末劫(乾)_影精灵"]={
    chs_1 = 121
    ,chs_2 = 128
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 129
    }
PutongModel["八狱末劫(坤)_影精灵"]={
    chs_1 = 146
    ,chs_2 = 147
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 148
    }
PutongModel["啖月(乾)_影精灵"]={
    chs_1 = 261
    ,chs_2 = 262
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 263
    }
PutongModel["啖月(坤)_影精灵"]={
    chs_1 = 280
    ,chs_2 = 281
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 288
    }
PutongModel["墨玉骷髅_影精灵"]={
    chs_1 = 305
    ,chs_2 = 306
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 307
    }
PutongModel["影精灵_双巨斧"]={
    chs_1 = 321
    ,chs_2 = 322
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 323
    }
PutongModel["影精灵_爪刺"]={
    chs_1 = 340
    ,chs_2 = 341
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 342
    }
PutongModel["影精灵_魔棒"]={
    chs_1 = 356
    ,chs_2 = 357
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 358
    }
PutongModel["忘川三途_影精灵"]={
    chs_1 = 372
    ,chs_2 = 373
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 374
    }
PutongModel["恶来(乾)_影精灵"]={
    chs_1 = 388
    ,chs_2 = 389
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 390
    }
PutongModel["恶来(坤)_影精灵"]={
    chs_1 = 407
    ,chs_2 = 408
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 409
    }
PutongModel["撕天_影精灵"]={
    chs_1 = 528
    ,chs_2 = 529
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 530
    }
PutongModel["毒牙_影精灵"]={
    chs_1 = 544
    ,chs_2 = 545
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 546
    }
PutongModel["沧海_影精灵"]={
    chs_1 = 560
    ,chs_2 = 561
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 562
    }
PutongModel["满天星_影精灵"]={
    chs_1 = 576
    ,chs_2 = 577
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 578
    }
PutongModel["点金棒_影精灵"]={
    chs_1 = 592
    ,chs_2 = 593
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 594
    }
PutongModel["烬世野火(乾)_影精灵"]={
    chs_1 = 608
    ,chs_2 = 609
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 610
    }
PutongModel["烬世野火(坤)_影精灵"]={
    chs_1 = 627
    ,chs_2 = 628
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 629
    }
PutongModel["盘龙_影精灵"]={
    chs_1 = 646
    ,chs_2 = 647
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 648
    }
PutongModel["破军双斧(乾)_影精灵"]={
    chs_1 = 662
    ,chs_2 = 663
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 664
    }
PutongModel["破军双斧(坤)_影精灵"]={
    chs_1 = 777
    ,chs_2 = 784
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 785
    }
PutongModel["离钩_影精灵"]={
    chs_1 = 802
    ,chs_2 = 803
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 804
    }
PutongModel["竹叶青(乾)_影精灵"]={
    chs_1 = 818
    ,chs_2 = 819
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 820
    }
PutongModel["竹叶青(坤)_影精灵"]={
    chs_1 = 837
    ,chs_2 = 838
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 839
    }
PutongModel["红莲_影精灵"]={
    chs_1 = 856
    ,chs_2 = 857
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 864
    }
PutongModel["细木棒_影精灵"]={
    chs_1 = 872
    ,chs_2 = 873
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 880
    }
PutongModel["罗喉计都(乾)_影精灵"]={
    chs_1 = 888
    ,chs_2 = 889
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 896
    }
PutongModel["罗喉计都(坤)_影精灵"]={
    chs_1 = 913
    ,chs_2 = 914
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 915
    }
PutongModel["胭脂_影精灵"]={
    chs_1 = 1028
    ,chs_2 = 1029
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1030
    }
PutongModel["贵霜之牙_影精灵"]={
    chs_1 = 1044
    ,chs_2 = 1045
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1046
    }
PutongModel["醍醐_影精灵"]={
    chs_1 = 1060
    ,chs_2 = 1061
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1062
    }
PutongModel["铁爪_影精灵"]={
    chs_1 = 1076
    ,chs_2 = 1077
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1078
    }
PutongModel["降魔玉杵_影精灵"]={
    chs_1 = 1092
    ,chs_2 = 1093
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1094
    }
PutongModel["雪蚕之刺_影精灵"]={
    chs_1 = 1108
    ,chs_2 = 1109
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1110
    }
PutongModel["青刚刺_影精灵"]={
    chs_1 = 1124
    ,chs_2 = 1125
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1126
    }
PutongModel["青藤玉树_影精灵"]={
    chs_1 = 1140
    ,chs_2 = 1141
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1142
    }
PutongModel["青龙牙_影精灵"]={
    chs_1 = 1156
    ,chs_2 = 1157
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1158
    }
PutongModel["顽石双斧(乾)_影精灵"]={
    chs_1 = 1312
    ,chs_2 = 1313
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1314
    }
PutongModel["顽石双斧(坤)_影精灵"]={
    chs_1 = 1331
    ,chs_2 = 1332
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1333
    }
PutongModel["飞头蛮(乾)_影精灵"]={
    chs_1 = 1350
    ,chs_2 = 1351
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1352
    }
PutongModel["飞头蛮(坤)_影精灵"]={
    chs_1 = 1369
    ,chs_2 = 1376
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1377
    }
PutongModel["鲛煞(乾)_影精灵"]={
    chs_1 = 1394
    ,chs_2 = 1395
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1396
    }
PutongModel["鲛煞(坤)_影精灵"]={
    chs_1 = 1413
    ,chs_2 = 1414
    ,chs_3 = "影精灵.wdf"
    ,chs_99 = 1415
}
PutongModel["新蟠桃"]={
	chs_1 = 0x00000067
	,chs_2 = 0x00000067
	,chs_3 =  "nvdi1.wdf"
	}
PutongModel["铜矿_普通"]={
	chs_1 = 0x10000207
	,chs_3 = "自用图标.wdf"
	}
PutongModel["银矿_普通"]={
	chs_1 = 0x10000208
	,chs_3 = "自用图标.wdf"
	}
PutongModel["金矿_普通"]={
	chs_1 = 0x10000209
	,chs_3 = "自用图标.wdf"
	}
PutongModel["翡翠矿_普通"]={
	chs_1 = 0x10000210
	,chs_3 = "自用图标.wdf"
	}
PutongModel["紫金矿_普通"]={
	chs_1 = 0x10000211
	,chs_3 = "自用图标.wdf"
	}
PutongModel["竹节双剑_飞燕女"]={
	chs_1 = 2478979274
	,chs_2 = 683536595
	,chs_3 = "common/shape.wdf"
	}
PutongModel["无极丝_玄彩娥"]={
	chs_1 = 1086469645
	,chs_2 = 2643257844
	,chs_3 = "common/shape.wdf"
	}
PutongModel["羽灵神_法杖"]={
	chs_1 = 2581796502
	,chs_2 = 3940257408
	,chs_3 = "shape.wda"
	}
PutongModel["狼牙锤_虎头怪"]={
	chs_1 = 900073506
	,chs_2 = 556692511
	,chs_3 = "common/shape.wdf"
	}
PutongModel["腾云杖_巫蛮儿"]={
	chs_1 = 3237314719
	,chs_2 = 1747492117
	,chs_3 = "shape.wda"
	}
PutongModel["逍遥生"]={
	chs_1 = 1492865095
	,chs_2 = 304945535
	,chs_3 = "common/shape.wdf"
	}
PutongModel["逍遥生_剑"]={
	chs_1 = 1492865095
	,chs_2 = 304945535
	,chs_3 = "common/shape.wdf"
	}
PutongModel["逍遥生_扇"]={
	chs_1 = 0x22ced97b
	,chs_2 = 304945535
	,chs_3 = "common/shape.wdf"
	}
PutongModel["柳叶刀_剑侠客"]={
	chs_1 = 1229743190
	,chs_2 = 194354478
	,chs_3 = "shape.wdf"
	}
PutongModel["游龙剑_剑侠客"]={
	chs_1 = 4239696014
	,chs_2 = 1495300408
	,chs_3 = "shape.wdf"
	}
PutongModel["青铜短剑_逍遥生"]={
	chs_1 = 614590386
	,chs_2 = 2214774214
	,chs_3 = "common/shape.wdf"
	}
PutongModel["飞燕女"]={
	chs_1 = 2708080383
	,chs_2 = 1337608376
	,chs_3 = "common/shape.wdf"
	}
PutongModel["七彩罗刹_玄彩娥"]={
	chs_1 = 2992307123
	,chs_2 = 3171287220
	,chs_3 = "common/shape.wdf"
	}
PutongModel["神火扇_龙太子"]={
	chs_1 = 3998986408
	,chs_2 = 207256533
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青铜斧_虎头怪"]={
	chs_1 = 1495520707
	,chs_2 = 1952969514
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青龙牙_骨精灵"]={
	chs_1 = 819272546
	,chs_2 = 4143052600
	,chs_3 = "common/shape.wdf"
	}
PutongModel["如意宝珠_杀破狼"]={
	chs_1 = 3027466503
	,chs_2 = 3046998488
	,chs_3 = "shape.wda"
	}
PutongModel["翡翠珠_巫蛮儿"]={
	chs_1 = 1191800816
	,chs_2 = 1331598936
	,chs_3 = "shape.wda"
	}
PutongModel["点金棒_骨精灵"]={
	chs_1 = 2615197180
	,chs_2 = 3429205695
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鸣鸿_巨魔王"]={
	chs_1 = 2272535883
	,chs_2 = 4183963940
	,chs_3 = "common/shape.wdf"
	}
PutongModel["牛皮鞭_英女侠"]={
	chs_1 = 2721039077
	,chs_2 = 4092691055
	,chs_3 = "shape.wdf"
	}
PutongModel["钢结鞭_狐美人"]={
	chs_1 = 1358766658
	,chs_2 = 219014606
	,chs_3 = "common/shape.wdf"
	}
PutongModel["折扇_逍遥生"]={
	chs_1 = 0x5a34b119
	,chs_2 = 4052148846
	,chs_3 = "common/shape.wdf"
	}
PutongModel["裂天_虎头怪"]={
	chs_1 = 161677133
	,chs_2 = 2342305231
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青刚刺_狐美人"]={
	chs_1 = 943875548
	,chs_2 = 2075432907
	,chs_3 = "common/shape.wdf"
	}
PutongModel["金背大砍刀_剑侠客"]={
	chs_1 = 3102182178
	,chs_2 = 1238352835
	,chs_3 = "shape.wdf"
	}
PutongModel["腾云杖_羽灵神"]={
	chs_1 = 1584570480
	,chs_2 = 1046023851
	,chs_3 = "shape.wda"
	}
PutongModel["龙太子"]={
	chs_1 = 2944637360
	,chs_2 = 4098637790
	,chs_3 = "common/shape.wdf"
	}
PutongModel["弑皇_龙太子"]={
	chs_1 = 2305995091
	,chs_2 = 1956552460
	,chs_3 = "common/shape.wdf"

	}
PutongModel["双弦钺_巨魔王"]={
	chs_1 = 4111880178
	,chs_2 = 2679811341
	,chs_3 = "common/shape.wdf"
	}
PutongModel["狼牙锤_神天兵"]={
	chs_1 = 952314130
	,chs_2 = 1577638509
	,chs_3 = "common/shape.wdf"
	}
PutongModel["红缨枪_神天兵"]={
	chs_1 = 3564813918
	,chs_2 = 2236546380
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青锋剑_逍遥生"]={
	chs_1 = 540655754
	,chs_2 = 526326278
	,chs_3 = "common/shape.wdf"
	}
PutongModel["如意宝珠_巫蛮儿"]={
	chs_1 = 2417421936
	,chs_2 = 2197534441
	,chs_3 = "shape.wda"
	}
PutongModel["翡翠珠_杀破狼"]={
	chs_1 = 1314894172
	,chs_2 = 433513441
	,chs_3 = "shape.wda"
	}
PutongModel["狐美人"]={
	chs_1 = 3753105193
	,chs_2 = 3988533543
	,chs_3 = "common/shape.wdf"
	}
PutongModel["满天星_骨精灵"]={
	chs_1 = 412146092
	,chs_2 = 59782698
	,chs_3 = "common/shape.wdf"
	}
PutongModel["骨精灵"]={
	chs_1 = 812821174
	,chs_2 = 493656179
	,chs_3 = "common/shape.wdf"
	}
PutongModel["琉璃珠_巫蛮儿"]={
	chs_1 = 4171731900
	,chs_2 = 143410001
	,chs_3 = "shape.wda"
	}
PutongModel["硬木弓_杀破狼"]={
	chs_1 = 2500153518
	,chs_2 = 34690017
	,chs_3 = "shape.wda"
	}
PutongModel["宝雕长弓_杀破狼"]={
	chs_1 = 3168212514
	,chs_2 = 1524411866
	,chs_3 = "shape.wda"
	}
PutongModel["玄铁矛_龙太子"]={
	chs_1 = 2397764102
	,chs_2 = 2300479837
	,chs_3 = "common/shape.wdf"
	}
PutongModel["巨魔王"]={
	chs_1 = 2213567130
	,chs_2 = 1051618199
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青藤柳叶鞭_狐美人"]={
	chs_1 = 2017171936
	,chs_2 = 1015863531
	,chs_3 = "common/shape.wdf"
	}
PutongModel["宝雕长弓_羽灵神"]={
	chs_1 = 487656505
	,chs_2 = 162322797
	,chs_3 = "shape.wda"
	}
PutongModel["连珠神弓_羽灵神"]={
	chs_1 = 3702678012
	,chs_2 = 2163189324
	,chs_3 = "shape.wda"
	}
PutongModel["硬木弓_羽灵神"]={
	chs_1 = 3985633058
	,chs_2 = 2192045984
	,chs_3 = "shape.wda"
	}
PutongModel["震天锤_神天兵"]={
	chs_1 = 3106536422
	,chs_2 = 4262815425
	,chs_3 = "common/shape.wdf"
	}
PutongModel["墨铁拐_巫蛮儿"]={
	chs_1 = 2710601924
	,chs_2 = 495554266
	,chs_3 = "shape.wda"
	}
PutongModel["曲柳杖_巫蛮儿"]={
	chs_1 = 438684246
	,chs_2 = 2418364461
	,chs_3 = "shape.wda"
	}
PutongModel["狼牙刀_巨魔王"]={
	chs_1 = 1185865684
	,chs_2 = 2820957694
	,chs_3 = "common/shape.wdf"
	}
PutongModel["赤明_杀破狼_宝珠"]={
	chs_1 = 3482219011
	,chs_2 = 3906907508
	,chs_3 = "shape.wda"
	}
PutongModel["细木棒_骨精灵"]={
	chs_1 = 1202797055
	,chs_2 = 4178020883
	,chs_3 = "common/shape.wdf"
	}
PutongModel["柳叶刀_巨魔王"]={
	chs_1 = 4115620300
	,chs_2 = 3330022961
	,chs_3 = "common/shape.wdf"
	}
PutongModel["蛇形月_舞天姬"]={
	chs_1 = 1644759402
	,chs_2 = 1759014159
	,chs_3 = "common/shape.wdf"
	}
PutongModel["蛇形月_飞燕女"]={
	chs_1 = 3586173418
	,chs_2 = 732948875
	,chs_3 = "common/shape.wdf"
	}
PutongModel["金刺轮_舞天姬"]={
	chs_1 = 2807451206
	,chs_2 = 138314297
	,chs_3 = "common/shape.wdf"
	}
PutongModel["墨铁拐_羽灵神"]={
	chs_1 = 2848235637
	,chs_2 = 2266600687
	,chs_3 = "shape.wda"
	}
PutongModel["黄铜圈_舞天姬"]={
	chs_1 = 194575710
	,chs_2 = 2421095781
	,chs_3 = "common/shape.wdf"
	}
PutongModel["杀破狼_宝珠"]={
	chs_1 = 2930414626
	,chs_2 = 4291811931
	,chs_3 = "shape.wda"
	}
PutongModel["玄彩娥"]={
	chs_1 = 1362263605
	,chs_2 = 3715462681
	,chs_3 = "common/shape.wdf"
	}
PutongModel["黄铜圈_飞燕女"]={
	chs_1 = 737601414
	,chs_2 = 1669143734
	,chs_3 = "common/shape.wdf"
	}
PutongModel["双短剑_英女侠"]={
	chs_1 = 2246741733
	,chs_2 = 2201236800
	,chs_3 = "shape.wdf"
	}
PutongModel["青藤柳叶鞭_英女侠"]={
	chs_1 = 3009625218
	,chs_2 = 2830037944
	,chs_3 = "shape.wdf"
	}
PutongModel["钢结鞭_英女侠"]={
	chs_1 = 1003144235
	,chs_2 = 1524918418
	,chs_3 = "shape.wdf"
	}
PutongModel["羽灵神_弓弩"]={
	chs_1 = 2581796502
	,chs_2 = 1858805344
	,chs_3 = "shape.wda"
	}
PutongModel["羽灵神_弓弩1"]={
	chs_1 = 0262638661
	,chs_2 = 3940257408
	,chs_3 = "shape.wda"
	}
PutongModel["震天锤_虎头怪"]={
	chs_1 = 676548466
	,chs_2 = 1816923096
	,chs_3 = "common/shape.wdf"
	}
PutongModel["剑侠客"]={
	chs_1 = 1228435406
	,chs_2 = 1425276052
	,chs_3 = "shape.wdf"
	}
PutongModel["金刺轮_飞燕女"]={
	chs_1 = 860305472
	,chs_2 = 4154736570
	,chs_3 = "common/shape.wdf"
	}
PutongModel["狼牙刀_剑侠客"]={
	chs_1 = 213847515
	,chs_2 = 3147078622
	,chs_3 = "shape.wdf"
	}
PutongModel["青龙牙_狐美人"]={
	chs_1 = 3750219087
	,chs_2 = 346973613
	,chs_3 = "common/shape.wdf"
	}
PutongModel["赤焰双剑_英女侠"]={
	chs_1 = 1427570181
	,chs_2 = 3478724046
	,chs_3 = "shape.wdf"

	}
PutongModel["满天星_玄彩娥"]={
	chs_1 = 1121013667
	,chs_2 = 291147333
	,chs_3 = "common/shape.wdf"
	}
PutongModel["点金棒_玄彩娥"]={
	chs_1 = 1581306371
	,chs_2 = 1230293004
	,chs_3 = "common/shape.wdf"

	}
PutongModel["金背大砍刀_巨魔王"]={
	chs_1 = 2395375353
	,chs_2 = 3599969440
	,chs_3 = "common/shape.wdf"
	}
PutongModel["巫蛮儿_宝珠"]={
	chs_1 = 202554088
	,chs_2 = 255156094
	,chs_3 = "shape.wda"
	}
PutongModel["杀破狼"]={
	chs_1 = 652210495
	,chs_2 = 1032044905
	,chs_3 = "shape.wda"
	}
PutongModel["神火扇_逍遥生"]={
	chs_1 = 0x32eadd
	,chs_2 = 2463492889
	,chs_3 = "common/shape.wdf"
	}
PutongModel["铁面扇_龙太子"]={
	chs_1 = 0x9f33cb04
	,chs_2 = 0x322cf1fd
	,chs_3 = "common/shape.wdf"

	}
PutongModel["英女侠"]={
	chs_1 = 2898894124
	,chs_2 = 3708489082
	,chs_3 = "shape.wdf"
	}
PutongModel["折扇_龙太子"]={
	chs_1 = 506375536
	,chs_2 = 4142026495
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青刚刺_骨精灵"]={
	chs_1 = 4186507615
	,chs_2 = 2094848573
	,chs_3 = "common/shape.wdf"
	}
PutongModel["松木锤_神天兵"]={
	chs_1 = 385167718
	,chs_2 = 887944587
	,chs_3 = "common/shape.wdf"
	}
PutongModel["巫蛮儿_法杖"]={
	chs_1 = 202554088
	,chs_2 = 4185651500
	,chs_3 = "shape.wda"

	}
PutongModel["铁爪_骨精灵"]={
	chs_1 = 980144775
	,chs_2 = 630615359
	,chs_3 = "common/shape.wdf"
	}
PutongModel["铁爪_狐美人"]={
	chs_1 = 3977087148
	,chs_2 = 1562072464
	,chs_3 = "common/shape.wdf"
	}
PutongModel["七彩罗刹_舞天姬"]={
	chs_1 = 903786802
	,chs_2 = 2633357816
	,chs_3 = "common/shape.wdf"
	}
PutongModel["无极丝_舞天姬"]={
	chs_1 = 4219745722
	,chs_2 = 3471825039
	,chs_3 = "common/shape.wdf"
	}
PutongModel["五色缎带_玄彩娥"]={
	chs_1 = 4201646940
	,chs_2 = 2449560215
	,chs_3 = "common/shape.wdf"

	}
PutongModel["五色缎带_舞天姬"]={
	chs_1 = 3852826693
	,chs_2 = 1284868321
	,chs_3 = "common/shape.wdf"
	}
PutongModel["羽灵神"]={
	chs_1 = 2581796502
	,chs_2 = 1858805344
	,chs_3 = "shape.wda"
	}
PutongModel["琉璃珠_杀破狼"]={
	chs_1 = 2754911857
	,chs_2 = 2888668416
	,chs_3 = "shape.wda"
	}
PutongModel["竹节双剑_英女侠"]={
	chs_1 = 1476049499
	,chs_2 = 2441717360
	,chs_3 = "shape.wdf"

	}
PutongModel["双短剑_飞燕女"]={
	chs_1 = 932337963
	,chs_2 = 1862513649
	,chs_3 = "common/shape.wdf"
	}
PutongModel["连珠神弓_杀破狼"]={
	chs_1 = 824051161
	,chs_2 = 3255758268
	,chs_3 = "shape.wda"
	}
PutongModel["青铜短剑_剑侠客"]={
	chs_1 = 3428752505
	,chs_2 = 696309892
	,chs_3 = "shape.wdf"
	}
PutongModel["乌金三叉戟_龙太子"]={
	chs_1 = 1709314112
	,chs_2 = 50056701
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青锋剑_剑侠客"]={
	chs_1 = 2459468380
	,chs_2 = 702488915
	,chs_3 = "shape.wdf"
	}
PutongModel["双弦钺_虎头怪"]={
	chs_1 = 1464696308
	,chs_2 = 1468494251
	,chs_3 = "common/shape.wdf"

	}
PutongModel["玄铁矛_神天兵"]={
	chs_1 = 491583081
	,chs_2 = 2008609870
	,chs_3 = "common/shape.wdf"
	}
PutongModel["乌金三叉戟_神天兵"]={
	chs_1 = 733304931
	,chs_2 = 235606285
	,chs_3 = "common/shape.wdf"
	}
PutongModel["乌金鬼头镰_巨魔王"]={
	chs_1 = 1147867834
	,chs_2 = 3049186137
	,chs_3 = "common/shape.wdf"
	}
PutongModel["红缨枪_龙太子"]={
	chs_1 = 2274614746
	,chs_2 = 1825813896
	,chs_3 = "common/shape.wdf"
	}
PutongModel["浮犀_飞燕女"]={
	chs_1 = 3366765078
	,chs_2 = 3831481111
	,chs_3 = "common/shape.wdf"
	}
PutongModel["牛皮鞭_狐美人"]={
	chs_1 = 476936950
	,chs_2 = 387504165
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青铜斧_巨魔王"]={
	chs_1 = 550609107
	,chs_2 = 1015351627
	,chs_3 = "common/shape.wdf"
	}
PutongModel["细木棒_玄彩娥"]={
	chs_1 = 534278293
	,chs_2 = 4175187443
	,chs_3 = "common/shape.wdf"
	}
PutongModel["松木锤_虎头怪"]={
	chs_1 = 1728983487
	,chs_2 = 2655200756
	,chs_3 = "common/shape.wdf"
	}
PutongModel["曲柳杖_羽灵神"]={
	chs_1 = 1868152845
	,chs_2 = 460325915
	,chs_3 = "shape.wda"


	}
PutongModel["神天兵"]={
	chs_1 = 2115558165
	,chs_2 = 1433167185
	,chs_3 = "common/shape.wdf"
	}
PutongModel["舞天姬"]={
	chs_1 = 1050893021
	,chs_2 = 3778545729
	,chs_3 = "common/shape.wdf"
	}
PutongModel["舞天姬_飘带"]={
	chs_1 = 1050893021
	,chs_2 = 3778545729
	,chs_3 = "common/shape.wdf"
	}
PutongModel["舞天姬_环圈"]={
	chs_1 = 0x326c8c14
	,chs_2 = 0x122cc513
	,chs_3 = "common/shape.wdf"
	}
PutongModel["铁面扇_逍遥生"]={
	chs_1 = 0xd33792db
	,chs_2 = 2358358928
	,chs_3 = "common/shape.wdf"
	}
PutongModel["赤焰双剑_飞燕女"]={
	chs_1 = 4061318075
	,chs_2 = 2660522564
	,chs_3 = "common/shape.wdf"
	}
PutongModel["游龙剑_逍遥生"]={
	chs_1 = 1313817198
	,chs_2 = 3892924667
	,chs_3 = "common/shape.wdf"
	}
PutongModel["巫蛮儿"]={
	chs_1 = 1602126433
	,chs_2 = 4185651500
	,chs_3 = "shape.wda"
	}
PutongModel["骷髅怪"]={
	chs_1 = 2014136988
	,chs_2 = 365789642
	,chs_3 = "shape.wdf"
	}
PutongModel["乌金鬼头镰_虎头怪"]={
	chs_1 = 3940375773
	,chs_2 = 3876300955
	,chs_3 = "common/shape.wdf"
	}
PutongModel["狐狸精"]={
	chs_1 = 4061102935
	,chs_2 = 275265957
	,chs_3 = "shape.wdf"
	}
PutongModel["杀破狼_宝珠"]={
	chs_1 = 2930414626
	,chs_2 = 4291811931
	,chs_3 = "shape.wda"
	}
PutongModel["杀破狼_弓弩"]={
	chs_1 = 0652210495
	,chs_2 = 1032044905
	,chs_3 = "shape.wda"
	}
PutongModel["杀破狼_弓弩1"]={
	chs_1 = 0652210495
	,chs_2 = 4291811931
	,chs_3 = "shape.wda"
	}
PutongModel["虎头怪"]={
	chs_1 = 571142035
	,chs_2 = 803245291
	,chs_3 = "common/shape.wdf"

	-- v1.3新增
	}
PutongModel["暗夜_龙太子"]={
	chs_1 = 0906768777
	,chs_2 = 0402972999
	,chs_3 = "common/shape.wdf"
	}
PutongModel["暗夜_神天兵"]={
	chs_1 = 0xfbf07390
	,chs_2 = 0x981089c2
	,chs_3 = "common/shape.wdf"
	}
PutongModel["梨花_龙太子"]={
	chs_1 = 3562006868
	,chs_2 = 0563824081
	,chs_3 = "common/shape.wdf"
	}
PutongModel["梨花_神天兵"]={
	chs_1 = 3155530506
	,chs_2 = 4149381636
	,chs_3 = "common/shape.wdf"
	}
PutongModel["霹雳_龙太子"]={
	chs_1 = 0663241555
	,chs_2 = 0882577208
	,chs_3 = "common/shape.wdf"
	}
PutongModel["霹雳_神天兵"]={
	chs_1 = 3690872798
	,chs_2 = 3942970730
	,chs_3 = "common/shape.wdf"
	}
PutongModel["刑天之逆_龙太子"]={
	chs_1 = 0x31CA69F0
	,chs_2 = 0x898AF13F
	,chs_3 = "common/shape.wdf"
	}
PutongModel["五虎断魂_龙太子"]={
	chs_1 = 0x929158FC
	,chs_2 = 0xc2e1216a
	,chs_3 = "common/shape.wdf"
	}
PutongModel["飞龙在天_龙太子"]={
	chs_1 = 0x15E284F9
	,chs_2 = 0x0A73B2E0
	,chs_3 = "common/shape.wdf"
	}
PutongModel["天龙破城_龙太子"]={
	chs_1 = 1524391868
	,chs_2 = 3805099760
	,chs_3 = "common/shape.wdf"
	}
PutongModel["刑天之逆_神天兵"]={
	chs_1 = 0xDBFE3FDE
	,chs_2 = 0xEB04F56A
	,chs_3 = "common/shape.wdf"
	}
PutongModel["五虎断魂_神天兵"]={
	chs_1 = 0xEF75190E
	,chs_2 = 0x7A0C3835
	,chs_3 = "common/shape.wdf"
	}
PutongModel["飞龙在天_神天兵"]={
	chs_1 = 0x37F26C44
	,chs_2 = 0xD751042A
	,chs_3 = "common/shape.wdf"
	}
PutongModel["天龙破城_神天兵"]={
	chs_1 = 3154146622
	,chs_2 = 2015118453
	,chs_3 = "common/shape.wdf"
	}
PutongModel["弑皇_神天兵"]={
	chs_1 = 1837680668
	,chs_2 = 0689112756
	,chs_3 = "common/shape.wdf"
	}
PutongModel["破魄_虎头怪"]={
	chs_1 = 0x53F914DE
	,chs_2 = 0x8102D783
	,chs_3 = "common/shape.wdf"
	}
PutongModel["破魄_巨魔王"]={
	chs_1 = 0x02CECBCB
	,chs_2 = 0xB8554947
	,chs_3 = "common/shape.wdf"
	}
PutongModel["肃魂_虎头怪"]={
	chs_1 = 0xE8866C8F
	,chs_2 = 0x16B86A5E
	,chs_3 = "common/shape.wdf"
	}
PutongModel["肃魂_巨魔王"]={
	chs_1 = 0x726F7762
	,chs_2 = 0x199CF19E
	,chs_3 = "common/shape.wdf"
	}
PutongModel["无敌_虎头怪"]={
	chs_1 = 0xD88565BC
	,chs_2 = 0x375756CE
	,chs_3 = "common/shape.wdf"
	}
PutongModel["无敌_巨魔王"]={
	chs_1 = 0x6AE68E94
	,chs_2 = 0x29FE3B3E
	,chs_3 = "common/shape.wdf"
	}
PutongModel["五丁开山_巨魔王"]={
	chs_1 = 0xDDE32A30
	,chs_2 = 0x7D02D5DB
	,chs_3 = "common/shape.wdf"
	}
PutongModel["元神禁锢_巨魔王"]={
	chs_1 = 0x6693BB73
	,chs_2 = 0x4E32D0BC
	,chs_3 = "common/shape.wdf"
	}
PutongModel["护法灭魔_巨魔王"]={
	chs_1 = 0x75E45C94
	,chs_2 = 0xDA6126C5
	,chs_3 = "common/shape.wdf"
	}
PutongModel["碧血干戚_巨魔王"]={
	chs_1 = 1651186704
	,chs_2 = 1048057784
	,chs_3 = "common/shape.wdf"
	}
PutongModel["裂天_巨魔王"]={
	chs_1 = 3160261512
	,chs_2 = 0098835428
	,chs_3 = "common/shape.wdf"
	}
PutongModel["五丁开山_虎头怪"]={
	chs_1 = 0x2261BF73
	,chs_2 = 0xB02E0452
	,chs_3 = "common/shape.wdf"
	}
PutongModel["元神禁锢_虎头怪"]={
	chs_1 = 0xFC8BAA37
	,chs_2 = 0xC133DEC4
	,chs_3 = "common/shape.wdf"
	}
PutongModel["护法灭魔_虎头怪"]={
	chs_1 = 0x0F200DE2
	,chs_2 = 0xEE971A2F
	,chs_3 = "common/shape.wdf"
	}
PutongModel["碧血干戚_虎头怪"]={
	chs_1 = 2740822575
	,chs_2 = 1846382457
	,chs_3 = "common/shape.wdf"
	}
PutongModel["裂天_虎头怪"]={
	chs_1 = 0161677133
	,chs_2 = 2342305231
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鱼肠_剑侠客"]={
	chs_1 = 3889393968
	,chs_2 = 0792072082
	,chs_3 = "shape.wdf"
	}
PutongModel["鱼肠_逍遥生"]={
	chs_1 = 0x39BAEA10
	,chs_2 = 0xE9D644EA
	,chs_3 = "common/shape.wdf"
	}
PutongModel["倚天_剑侠客"]={
	chs_1 = 2329390480
	,chs_2 = 0026468517
	,chs_3 = "shape.wdf"
	}
PutongModel["倚天_逍遥生"]={
	chs_1 = 0745286869
	,chs_2 = 1361011629
	,chs_3 = "common/shape.wdf"
	}
PutongModel["湛卢_剑侠客"]={
	chs_1 = 1840181339
	,chs_2 = 0603337468
	,chs_3 = "shape.wdf"
	}
PutongModel["湛卢_逍遥生"]={
	chs_1 = 0x439811D3
	,chs_2 = 0x6DE2CCCB
	,chs_3 = "common/shape.wdf"
	}
PutongModel["画龙点睛_逍遥生"]={
	chs_1 = 0x2ef87fd7
	,chs_2 = 0xBDC4259D
	,chs_3 = "common/shape.wdf"
	}
PutongModel["秋水人家_逍遥生"]={
	chs_1 = 0x9d8ff3c2
	,chs_2 = 0xEEFDA661
	,chs_3 = "common/shape.wdf"
	}
PutongModel["逍遥江湖_逍遥生"]={
	chs_1 = 0xd940f97e
	,chs_2 = 0x0FF23BFF
	,chs_3 = "common/shape.wdf"
	}
PutongModel["浩气长舒_逍遥生"]={
	chs_1 = 0x9297dd11
	,chs_2 = 0378375394
	,chs_3 = "common/shape.wdf"
	}
PutongModel["星瀚_逍遥生"]={
	chs_1 = 0xe481f72b
	,chs_2 = 3682713078
	,chs_3 = "common/shape.wdf"
	}
PutongModel["魏武青虹_剑侠客"]={
	chs_1 = 0x241DF4E3
	,chs_2 = 0x3DDB7FF0
	,chs_3 = "shape.wd3"
	}
PutongModel["灵犀神剑_剑侠客"]={
	chs_1 = 0x31034D66
	,chs_2 = 0xDFC62A73
	,chs_3 = "shape.wd3"
	}
PutongModel["四法青云_剑侠客"]={
	chs_1 = 0xDF749306
	,chs_2 = 0x1BEC0D8A
	,chs_3 = "shape.wd3"
	}
PutongModel["霜冷九州_剑侠客"]={
	chs_1 = 0007350584
	,chs_2 = 2444149863
	,chs_3 = "shape.wd8"
	}
PutongModel["魏武青虹_逍遥生"]={
	chs_1 = 0x2562AA24
	,chs_2 = 0x2C0190DC
	,chs_3 = "common/shape.wdf"
	}
PutongModel["灵犀神剑_逍遥生"]={
	chs_1 = 0xB532E559
	,chs_2 = 0x55AA2A03
	,chs_3 = "common/shape.wdf"
	}
PutongModel["四法青云_逍遥生"]={
	chs_1 = 0x345FD6AC
	,chs_2 = 0x5763E3AE
	,chs_3 = "common/shape.wdf"
	}
PutongModel["霜冷九州_逍遥生"]={
	chs_1 = 3023520771
	,chs_2 = 3722552317
	,chs_3 = "common/shape.wdf"
	}
PutongModel["擒龙_剑侠客"]={
	chs_1 = 3544836379
	,chs_2 = 1980184881
	,chs_3 = "shape.wd9"
	}
PutongModel["擒龙_逍遥生"]={
	chs_1 = 1376642035
	,chs_2 = 1247967770
	,chs_3 = "common/shape.wdf"
	}
PutongModel["太极_逍遥生"]={
	chs_1 = 0xc5d0ffa5
	,chs_2 = 3793189291
	,chs_3 = "common/shape.wdf"
	}
PutongModel["太极_龙太子"]={
	chs_1 = 0x58D20E79
	,chs_2 = 0xA963CEE9
	,chs_3 = "common/shape.wdf"
	}
PutongModel["玉龙_逍遥生"]={
	chs_1 = 0x836bd211 --
	,chs_2 = 4197667404
	,chs_3 = "common/shape.wdf"
	}
PutongModel["玉龙_龙太子"]={
	chs_1 = 0x44BEAA26
	,chs_2 = 0xE819C83D
	,chs_3 = "common/shape.wdf"
	}
PutongModel["秋风_逍遥生"]={
	chs_1 = 0xc9d1e4d9
	,chs_2 = 4268258437
	,chs_3 = "common/shape.wdf"
	}
PutongModel["秋风_龙太子"]={
	chs_1 = 0x387B481F
	,chs_2 = 0xFB69C03A
	,chs_3 = "common/shape.wdf"
	}
PutongModel["画龙点睛_龙太子"]={
	chs_1 = 0x741AAD01
	,chs_2 = 0x7691CE27
	,chs_3 = "common/shape.wdf"
	}
PutongModel["秋水人家_龙太子"]={
	chs_1 = 0xB68FBD09
	,chs_2 = 0x9A1E802B
	,chs_3 = "common/shape.wdf"
	}
PutongModel["逍遥江湖_龙太子"]={
	chs_1 = 0xD1FABFBB
	,chs_2 = 0x46AB4BEC
	,chs_3 = "common/shape.wdf"
	}
PutongModel["浩气长舒_龙太子"]={
	chs_1 = 0xD5E7FC6E
	,chs_2 = 0x804E4F85
	,chs_3 = "common/shape.wdf"
	}
PutongModel["星瀚_龙太子"]={
	chs_1 = 0xBD8FF16C
	,chs_2 = 0xC7E0CEC1
	,chs_3 = "common/shape.wdf"
	}
PutongModel["冷月_巨魔王"]={
	chs_1 = 1674010879
	,chs_2 = 1438363487
	,chs_3 = "common/shape.wdf"
	}
PutongModel["冷月_剑侠客"]={
	chs_1 = 0xDA08D26D
	,chs_2 = 0x6C6F4579
	,chs_3 = "shape.wdf"
	}
PutongModel["屠龙_巨魔王"]={
	chs_1 = 2271660461
	,chs_2 = 0895095420
	,chs_3 = "common/shape.wdf"
	}
PutongModel["屠龙_剑侠客"]={
	chs_1 = 3479012312
	,chs_2 = 2635216567
	,chs_3 = "shape.wdf"
	}
PutongModel["血刃_巨魔王"]={
	chs_1 = 3645677695
	,chs_2 = 1888150636
	,chs_3 = "common/shape.wdf"
	}
PutongModel["血刃_剑侠客"]={
	chs_1 = 0x85D0D994
	,chs_2 = 0x50DA4A82
	,chs_3 = "shape.wdf"
	}
PutongModel["偃月青龙_剑侠客"]={
	chs_1 = 0xC68B564D
	,chs_2 = 0x922E909A
	,chs_3 = "shape.wd3"
	}
PutongModel["斩妖泣血_剑侠客"]={
	chs_1 = 0x0EFA39F2
	,chs_2 = 0x16FE7AF5
	,chs_3 = "shape.wd3"
	}
PutongModel["晓风残月_剑侠客"]={
	chs_1 = 0xE6AD88AE
	,chs_2 = 0x6ED6B121
	,chs_3 = "shape.wd3"
	}
PutongModel["业火三灾_剑侠客"]={
	chs_1 = 4059506148
	,chs_2 = 1966900337
	,chs_3 = "shape.wd8"
	}
PutongModel["鸣鸿_剑侠客"]={
	chs_1 = 1616701029
	,chs_2 = 1774867550
	,chs_3 = "shape.wd9"
	}
PutongModel["偃月青龙_巨魔王"]={
	chs_1 = 0xF6A68E4C
	,chs_2 = 0xB20BA1E9
	,chs_3 = "common/shape.wdf"
	}
PutongModel["斩妖泣血_巨魔王"]={
	chs_1 = 0x15B2D6D4
	,chs_2 = 0x14997A50
	,chs_3 = "common/shape.wdf"
	}
PutongModel["晓风残月_巨魔王"]={
	chs_1 = 0x4B2232FE
	,chs_2 = 0x2D70D93E
	,chs_3 = "common/shape.wdf"
	}
PutongModel["业火三灾_巨魔王"]={
	chs_1 = 4160821910
	,chs_2 = 2586259872
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鸣鸿_巨魔王"]={
	chs_1 = 2272535883
	,chs_2 = 4183963940
	,chs_3 = "common/shape.wdf"
	}
PutongModel["沧海_骨精灵"]={
	chs_1 = 3768392022
	,chs_2 = 3372471073
	,chs_3 = "common/shape.wdf"
	}
PutongModel["沧海_玄彩娥"]={
	chs_1 = 0xC1ACB479
	,chs_2 = 0x6A9147F7
	,chs_3 = "common/shape.wdf"
	}
PutongModel["红莲_骨精灵"]={
	chs_1 = 2232215638
	,chs_2 = 1432534548
	,chs_3 = "common/shape.wdf"
	}
PutongModel["红莲_玄彩娥"]={
	chs_1 = 0x0ADFB109
	,chs_2 = 0xCA7E32B9
	,chs_3 = "common/shape.wdf"
	}
PutongModel["盘龙_骨精灵"]={
	chs_1 = 3403515550
	,chs_2 = 00912832719
	,chs_3 = "common/shape.wdf"
	}
PutongModel["盘龙_玄彩娥"]={
	chs_1 = 0x69036521
	,chs_2 = 0x02E73DE2
	,chs_3 = "common/shape.wdf"
	}
PutongModel["降魔玉杵_骨精灵"]={
	chs_1 = 0x51F29AF8
	,chs_2 = 0x77E6448E
	,chs_3 = "common/shape.wdf"
	}
PutongModel["墨玉骷髅_骨精灵"]={
	chs_1 = 0x41184BFA
	,chs_2 = 0x1C9639D1
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青藤玉树_骨精灵"]={
	chs_1 = 0x162DD3BA
	,chs_2 = 0xC603E808
	,chs_3 = "common/shape.wdf"
	}
PutongModel["丝萝乔木_骨精灵"]={
	chs_1 = 1422256901
	,chs_2 = 3988348379
	,chs_3 = "common/shape.wdf"
	}
PutongModel["醍醐_骨精灵"]={
	chs_1 = 0609424635
	,chs_2 = 4017665874
	,chs_3 = "common/shape.wdf"
	}
PutongModel["降魔玉杵_玄彩娥"]={
	chs_1 = 0xB3AB79E6
	,chs_2 = 0x87E2D3A6
	,chs_3 = "common/shape.wdf"
	}
PutongModel["墨玉骷髅_玄彩娥"]={
	chs_1 = 0x89AFF2A0
	,chs_2 = 0x791841F4
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青藤玉树_玄彩娥"]={
	chs_1 = 0x98440F9D
	,chs_2 = 0xA6807253
	,chs_3 = "common/shape.wdf"
	}
PutongModel["丝萝乔木_玄彩娥"]={
	chs_1 = 2492839980
	,chs_2 = 0908131256
	,chs_3 = "common/shape.wdf"
	}
PutongModel["醍醐_玄彩娥"]={
	chs_1 = 2560304889
	,chs_2 = 3032370082
	,chs_3 = "common/shape.wdf"
	}
PutongModel["八卦_神天兵"]={
	chs_1 = 0885266650
	,chs_2 = 1350386258
	,chs_3 = "common/shape.wdf"
	}
PutongModel["八卦_虎头怪"]={
	chs_1 = 0xA438A403
	,chs_2 = 0xAC1BAB97
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼牙_神天兵"]={
	chs_1 = 0050371172
	,chs_2 = 1900721739
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼牙_虎头怪"]={
	chs_1 = 0x56DA382F
	,chs_2 = 0x959DF477
	,chs_3 = "common/shape.wdf"
	}
PutongModel["雷神_神天兵"]={
	chs_1 = 1937688127
	,chs_2 = 3648341818
	,chs_3 = "common/shape.wdf"
	}
PutongModel["雷神_虎头怪"]={
	chs_1 = 0x8CF27534
	,chs_2 = 0xDA17EC9A
	,chs_3 = "common/shape.wdf"
	}
PutongModel["混元金锤_虎头怪"]={
	chs_1 = 0x8E7866EB
	,chs_2 = 0x9101F598
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九瓣莲花_虎头怪"]={
	chs_1 = 0xA7B9EF31
	,chs_2 = 0xF5C7E01A
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼王蚀日_虎头怪"]={
	chs_1 = 0xA14E222D
	,chs_2 = 0x757CC5CE
	,chs_3 = "common/shape.wdf"
	}
PutongModel["狂澜碎岳_虎头怪"]={
	chs_1 = 0981496208
	,chs_2 = 1685513235
	,chs_3 = "common/shape.wdf"
	}
PutongModel["碎寂_虎头怪"]={
	chs_1 = 0512165103
	,chs_2 = 2912368983
	,chs_3 = "common/shape.wdf"
	}
PutongModel["混元金锤_神天兵"]={
	chs_1 = 4173823692
	,chs_2 = 0903872944
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九瓣莲花_神天兵"]={
	chs_1 = 1960543447
	,chs_2 = 1550557054
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼王蚀日_神天兵"]={
	chs_1 = 1056981959
	,chs_2 = 0461194116
	,chs_3 = "common/shape.wdf"
	}
PutongModel["狂澜碎岳_神天兵"]={
	chs_1 = 4056574244
	,chs_2 = 2900798348
	,chs_3 = "common/shape.wdf"
	}
PutongModel["碎寂_神天兵"]={
	chs_1 = 0577319844
	,chs_2 = 2305127073
	,chs_3 = "common/shape.wdf"
	}
PutongModel["撕天_狐美人"]={
	chs_1 = 2959598354
	,chs_2 = 3959909274
	,chs_3 = "common/shape.wdf"
	}
PutongModel["撕天_骨精灵"]={
	chs_1 = 0x3DF34F1E
	,chs_2 = 0xE5D43556
	,chs_3 = "common/shape.wdf"
	}
PutongModel["毒牙_狐美人"]={
	chs_1 = 3492190917
	,chs_2 = 0057548694
	,chs_3 = "common/shape.wdf"
	}
PutongModel["毒牙_骨精灵"]={
	chs_1 = 0xD6EF0627
	,chs_2 = 0x831F74AE
	,chs_3 = "common/shape.wdf"
	}
PutongModel["胭脂_狐美人"]={
	chs_1 = 3087805369
	,chs_2 = 0210949852
	,chs_3 = "common/shape.wdf"
	}
PutongModel["胭脂_骨精灵"]={
	chs_1 = 0x7D916F78
	,chs_2 = 0xF65B1CC4
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九阴勾魂_骨精灵"]={
	chs_1 = 0x63413CA4
	,chs_2 = 0x9C82F08B
	,chs_3 = "common/shape.wdf"
	}
PutongModel["雪蚕之刺_骨精灵"]={
	chs_1 = 0xF1E4D97A
	,chs_2 = 0x5D773943
	,chs_3 = "common/shape.wdf"
	}
PutongModel["贵霜之牙_骨精灵"]={
	chs_1 = 0xAE948CBB
	,chs_2 = 0x7E47B81B
	,chs_3 = "common/shape.wdf"
	}
PutongModel["忘川三途_骨精灵"]={
	chs_1 = 2856473183
	,chs_2 = 2645115155
	,chs_3 = "common/shape.wdf"
	}
PutongModel["离钩_骨精灵"]={
	chs_1 = 0xa484df3d
	,chs_2 = 2314275840
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九阴勾魂_狐美人"]={
	chs_1 = 0xC2DC1244
	,chs_2 = 0xB0ED001E
	,chs_3 = "common/shape.wdf"
	}
PutongModel["雪蚕之刺_狐美人"]={
	chs_1 = 0xC4B56A00
	,chs_2 = 0x0381802B
	,chs_3 = "common/shape.wdf"
	}
PutongModel["贵霜之牙_狐美人"]={
	chs_1 = 0x762F7556
	,chs_2 = 0xCDD20A7E
	,chs_3 = "common/shape.wdf"
	}
PutongModel["忘川三途_狐美人"]={
	chs_1 = 1211891114
	,chs_2 = 0425062404
	,chs_3 = "common/shape.wdf"
	}
PutongModel["离钩_狐美人"]={
	chs_1 = 1495713199
	,chs_2 = 1510775202
	,chs_3 = "common/shape.wdf"
	}
PutongModel["彩虹_舞天姬"]={
	chs_1 = 0573669624
	,chs_2 = 0x55516619
	,chs_3 = "common/shape.wdf"
	}
PutongModel["彩虹_玄彩娥"]={
	chs_1 = 0x223180F8
	,chs_2 = 0x583E1B17
	,chs_3 = "common/shape.wdf"
	}
PutongModel["流云_舞天姬"]={
	chs_1 = 1071235145
	,chs_2 = 0xef3a3a78
	,chs_3 = "common/shape.wdf"
	}
PutongModel["流云_玄彩娥"]={
	chs_1 = 0x3FD9C049
	,chs_2 = 0x8EC49F3A
	,chs_3 = "common/shape.wdf"
	}
PutongModel["碧波_舞天姬"]={
	chs_1 = 2358752644
	,chs_2 = 0xf56c2c31
	,chs_3 = "common/shape.wdf"
	}
PutongModel["碧波_玄彩娥"]={
	chs_1 = 0x8C97B584
	,chs_2 = 0xB61DA735
	,chs_3 = "common/shape.wdf"
	}
PutongModel["秋水落霞_舞天姬"]={
	chs_1 = 0xBC559AEB
	,chs_2 = 0xBC89D4EB
	,chs_3 = "common/shape.wdf"
	}
PutongModel["晃金仙绳_舞天姬"]={
	chs_1 = 0x14918F2D
	,chs_2 = 0x7AEB22FC
	,chs_3 = "common/shape.wdf"
	}
PutongModel["此最相思_舞天姬"]={
	chs_1 = 0xB04EF3E7
	,chs_2 = 0xE47097A9
	,chs_3 = "common/shape.wdf"
	}
PutongModel["揽月摘星_舞天姬"]={
	chs_1 = 2425294287
	,chs_2 = 0718029991
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九霄_舞天姬"]={
	chs_1 = 1944035871
	,chs_2 = 0335082726
	,chs_3 = "common/shape.wdf"
	}
PutongModel["别情离恨_舞天姬"]={
	chs_1 = 0xF420B6F9
	,chs_2 = 0x0958E12B
	,chs_3 = "common/shape.wdf"
	}
PutongModel["金玉双环_舞天姬"]={
	chs_1 = 0x93CDA250
	,chs_2 = 0xA50B0DB0
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九天金线_舞天姬"]={
	chs_1 = 0xF5E7C6EF
	,chs_2 = 0x0218E725
	,chs_3 = "common/shape.wdf"
	}
PutongModel["无关风月_舞天姬"]={
	chs_1 = 1007231129
	,chs_2 = 1829725423
	,chs_3 = "common/shape.wdf"
	}
PutongModel["朝夕_舞天姬"]={
	chs_1 = 2753598378
	,chs_2 = 0871520866
	,chs_3 = "common/shape.wdf"
	}
PutongModel["秋水落霞_玄彩娥"]={
	chs_1 = 0x8BF9992F
	,chs_2 = 0x17D413B7
	,chs_3 = "common/shape.wdf"
	}
PutongModel["晃金仙绳_玄彩娥"]={
	chs_1 = 0xEBA114CC
	,chs_2 = 0x8FDCA745
	,chs_3 = "common/shape.wdf"
	}
PutongModel["此最相思_玄彩娥"]={
	chs_1 = 0xBEF9E038
	,chs_2 = 0xFCF69018
	,chs_3 = "common/shape.wdf"
	}
PutongModel["揽月摘星_玄彩娥"]={
	chs_1 = 4239911535
	,chs_2 = 1327298920
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九霄_玄彩娥"]={
	chs_1 = 1385035033
	,chs_2 = 2513919345
	,chs_3 = "common/shape.wdf"
	}
PutongModel["龙筋_英女侠"]={
	chs_1 = 0120114237
	,chs_2 = 4185441630
	,chs_3 = "shape.wdf"
	}
PutongModel["龙筋_狐美人"]={
	chs_1 = 0xD76152B7
	,chs_2 = 0xB241D7A6
	,chs_3 = "common/shape.wdf"
	}
PutongModel["百花_英女侠"]={
	chs_1 = 3000747610
	,chs_2 = 0571279871
	,chs_3 = "shape.wdf"
	}
PutongModel["百花_狐美人"]={
	chs_1 = 0x888C7C46
	,chs_2 = 0xE7CBB64B
	,chs_3 = "common/shape.wdf"
	}
PutongModel["吹雪_英女侠"]={
	chs_1 = 1309495973
	,chs_2 = 0159974487
	,chs_3 = "shape.wdf"
	}
PutongModel["吹雪_狐美人"]={
	chs_1 = 0xBC2F95EF
	,chs_2 = 0x16AC35C8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["游龙惊鸿_狐美人"]={
	chs_1 = 0xB11264BE
	,chs_2 = 0x7C2A8EF7
	,chs_3 = "common/shape.wdf"
	}
PutongModel["仙人指路_狐美人"]={
	chs_1 = 0x87BE19F7
	,chs_2 = 0x10C7E94F
	,chs_3 = "common/shape.wdf"
	}
PutongModel["血之刺藤_狐美人"]={
	chs_1 = 0x430429EE
	,chs_2 = 0xAB7969FB
	,chs_3 = "common/shape.wdf"
	}
PutongModel["牧云清歌_狐美人"]={
	chs_1 = 0846824610
	,chs_2 = 3304484241
	,chs_3 = "common/shape.wdf"
	}
PutongModel["霜陨_狐美人"]={
	chs_1 = 0xe7d16091
	,chs_2 = 0x4384e238
	,chs_3 = "common/shape.wdf"
	}
PutongModel["如意_舞天姬"]={
	chs_1 = 2798387657
	,chs_2 = 0709983425
	,chs_3 = "common/shape.wdf"
	}
PutongModel["如意_飞燕女"]={
	chs_1 = 0x108FFF69
	,chs_2 = 0xEEB4814C
	,chs_3 = "common/shape.wdf"
	}
PutongModel["乾坤_舞天姬"]={
	chs_1 = 4117773016
	,chs_2 = 0888040957
	,chs_3 = "common/shape.wdf"
	}
PutongModel["乾坤_飞燕女"]={
	chs_1 = 0x516AC342
	,chs_2 = 0x6011B8EA
	,chs_3 = "common/shape.wdf"
	}
PutongModel["月光双环_舞天姬"]={
	chs_1 = 2969095231
	,chs_2 = 3586695559
	,chs_3 = "common/shape.wdf"
	}
PutongModel["月光双环_飞燕女"]={
	chs_1 = 0xD2011BDE
	,chs_2 = 0x118B2316
	,chs_3 = "common/shape.wdf"
	}
PutongModel["阴阳_飞燕女"]={
	chs_1 = 0006565675
	,chs_2 = 0527831083
	,chs_3 = "common/shape.wdf"
	}
PutongModel["阴阳_英女侠"]={
	chs_1 = 0xB8D3407A
	,chs_2 = 0xa776d93a
	,chs_3 = "shape.wdf"
	}
PutongModel["月光双剑_飞燕女"]={
	chs_1 = 1968668223
	,chs_2 = 1806180317
	,chs_3 = "common/shape.wdf"
	}
PutongModel["月光双剑_英女侠"]={
	chs_1 = 0x0E469C32
	,chs_2 = 0x4b68d6fe
	,chs_3 = "shape.wdf"
	}
PutongModel["灵蛇_飞燕女"]={
	chs_1 = 0585049597
	,chs_2 = 0883345409
	,chs_3 = "common/shape.wdf"
	}
PutongModel["灵蛇_英女侠"]={
	chs_1 = 0x36D0EAA0
	,chs_2 = 0xc4ed7657
	,chs_3 = "shape.wdf"
	}
PutongModel["游龙惊鸿_英女侠"]={
	chs_1 = 0x3E7DDDB1
	,chs_2 = 0x339E1DD5
	,chs_3 = "shape.wd3"
	}
PutongModel["仙人指路_英女侠"]={
	chs_1 = 0x36FA7E8F
	,chs_2 = 0x33825F90
	,chs_3 = "shape.wd3"
	}
PutongModel["血之刺藤_英女侠"]={
	chs_1 = 0xCEF9D441
	,chs_2 = 0xCB134023
	,chs_3 = "shape.wd3"
	}
PutongModel["牧云清歌_英女侠"]={
	chs_1 = 2729481727
	,chs_2 = 1717626599
	,chs_3 = "shape.wd8"
	}
PutongModel["霜陨_英女侠"]={
	chs_1 = 1215671834
	,chs_2 = 1056698647
	,chs_3 = "shape.wd9"
	}
PutongModel["金龙双剪_飞燕女"]={
	chs_1 = 0x88E2548C
	,chs_2 = 0xC70FF23A
	,chs_3 = "common/shape.wdf"
	}
PutongModel["连理双树_飞燕女"]={
	chs_1 = 0xBFBE4DC9
	,chs_2 = 0x4894EB42
	,chs_3 = "common/shape.wdf"
	}
PutongModel["祖龙对剑_飞燕女"]={
	chs_1 = 0x088A1188
	,chs_2 = 0x0D3ED468
	,chs_3 = "common/shape.wdf"
	}
PutongModel["紫电青霜_飞燕女"]={
	chs_1 = 0x4efa7c73
	,chs_2 = 3343319550
	,chs_3 = "common/shape.wdf"
	}
PutongModel["浮犀_飞燕女"]={
	chs_1 = 3366765078
	,chs_2 = 3831481111
	,chs_3 = "common/shape.wdf"
	}
PutongModel["别情离恨_飞燕女"]={
	chs_1 = 0x72013AF5
	,chs_2 = 0xF2FB1AFA
	,chs_3 = "common/shape.wdf"
	}
PutongModel["金玉双环_飞燕女"]={
	chs_1 = 0xA1661BC0
	,chs_2 = 0xB6C5947A
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九天金线_飞燕女"]={
	chs_1 = 0x454E8758
	,chs_2 = 0x2D8326FB
	,chs_3 = "common/shape.wdf"
	}
PutongModel["无关风月_飞燕女"]={
	chs_1 = 0888561149
	,chs_2 = 3212121801
	,chs_3 = "common/shape.wdf"
	}
PutongModel["朝夕_飞燕女"]={
	chs_1 = 0961373825
	,chs_2 = 1399381898
	,chs_3 = "common/shape.wdf"
	}
PutongModel["金龙双剪_英女侠"]={
	chs_1 = 0xB2D36625
	,chs_2 = 0x373FA8FC
	,chs_3 = "shape.wd3"
	}
PutongModel["连理双树_英女侠"]={
	chs_1 = 0x2F82163D
	,chs_2 = 0xA051D73F
	,chs_3 = "shape.wd3"
	}
PutongModel["祖龙对剑_英女侠"]={
	chs_1 = 0x466B6959
	,chs_2 = 0xEE3BCF6B
	,chs_3 = "shape.wd3"
	}
PutongModel["紫电青霜_英女侠"]={
	chs_1 = 4174514804
	,chs_2 = 0254271220
	,chs_3 = "shape.wd8"
	}
PutongModel["浮犀_英女侠"]={
	chs_1 = 1454482476
	,chs_2 = 3425270325
	,chs_3 = "shape.wd9"
	}
PutongModel["离火_巫蛮儿"]={
	chs_1 = 3491744635
	,chs_2 = 3429826897
	,chs_3 = "shape.wda"
	}
PutongModel["离火_杀破狼"]={
	chs_1 = 2641155879
	,chs_2 = 1590716186
	,chs_3 = "shape.wda"
	}
PutongModel["飞星_巫蛮儿"]={
	chs_1 = 3062034163
	,chs_2 = 3170325397
	,chs_3 = "shape.wda"
	}
PutongModel["飞星_杀破狼"]={
	chs_1 = 2717746866
	,chs_2 = 1504946577
	,chs_3 = "shape.wda"
	}
PutongModel["月华_巫蛮儿"]={
	chs_1 = 4115068184
	,chs_2 = 2364973462
	,chs_3 = "shape.wda"
	}
PutongModel["月华_杀破狼"]={
	chs_1 = 2389596849
	,chs_2 = 2983597511
	,chs_3 = "shape.wda"
	}
PutongModel["回风舞雪_杀破狼"]={
	chs_1 = 3286763223
	,chs_2 = 1088084197
	,chs_3 = "shape.wda"
	}
PutongModel["紫金葫芦_杀破狼"]={
	chs_1 = 3085783481
	,chs_2 = 2243295981
	,chs_3 = "shape.wda"
	}
PutongModel["裂云啸日_杀破狼"]={
	chs_1 = 3958823224
	,chs_2 = 1544529746
	,chs_3 = "shape.wda"
	}
PutongModel["云雷万里_杀破狼"]={
	chs_1 = 2031537277
	,chs_2 = 1403541362
	,chs_3 = "shape.wda"
	}
PutongModel["赤明_杀破狼"]={
	chs_1 = 3883902194
	,chs_2 = 0xD74EF908
	,chs_3 = "shape.wda"
	}
PutongModel["回风舞雪_巫蛮儿"]={
	chs_1 = 3587358129
	,chs_2 = 3378197526
	,chs_3 = "shape.wda"
	}
PutongModel["紫金葫芦_巫蛮儿"]={
	chs_1 = 0668840870
	,chs_2 = 3082640737
	,chs_3 = "shape.wda"
	}
PutongModel["裂云啸日_巫蛮儿"]={
	chs_1 = 0033586962
	,chs_2 = 3500204883
	,chs_3 = "shape.wda"
	}
PutongModel["云雷万里_巫蛮儿"]={
	chs_1 = 0086034382
	,chs_2 = 2492569356
	,chs_3 = "shape.wda"
	}
PutongModel["赤明_巫蛮儿"]={
	chs_1 = 3482219011
	,chs_2 = 0125440945
	,chs_3 = "shape.wda"
	}
PutongModel["非攻_杀破狼"]={
	chs_1 = 2360647601
	,chs_2 = 3580642624
	,chs_3 = "shape.wda"
	}
PutongModel["非攻_羽灵神"]={
	chs_1 = 4118502147
	,chs_2 = 1301985929
	,chs_3 = "shape.wda"
	}
PutongModel["幽篁_杀破狼"]={
	chs_1 = 1961778763
	,chs_2 = 2093379552
	,chs_3 = "shape.wda"
	}
PutongModel["幽篁_羽灵神"]={
	chs_1 = 0044473302
	,chs_2 = 0943743279
	,chs_3 = "shape.wda"
	}
PutongModel["百鬼_杀破狼"]={
	chs_1 = 3918682738
	,chs_2 = 3616556566
	,chs_3 = "shape.wda"
	}
PutongModel["百鬼_羽灵神"]={
	chs_1 = 4227459057
	,chs_2 = 0226502213
	,chs_3 = "shape.wda"
	}
PutongModel["冥火薄天_羽灵神"]={
	chs_1 = 1329583138
	,chs_2 = 2921186180
	,chs_3 = "shape.wda"
	}
PutongModel["龙鸣寒水_羽灵神"]={
	chs_1 = 2146481723
	,chs_2 = 1237674101
	,chs_3 = "shape.wda"
	}
PutongModel["太极流光_羽灵神"]={
	chs_1 = 0635066655
	,chs_2 = 0454346244
	,chs_3 = "shape.wda"
	}
PutongModel["九霄风雷_羽灵神"]={
	chs_1 = 1118851042
	,chs_2 = 3857072095
	,chs_3 = "shape.wda"
	}
PutongModel["若木_羽灵神"]={
	chs_1 = 2140866752
	,chs_2 = 0300870526
	,chs_3 = "shape.wda"
	}
PutongModel["冥火薄天_杀破狼"]={
	chs_1 = 4237566348
	,chs_2 = 3313167169
	,chs_3 = "shape.wda"
	}
PutongModel["龙鸣寒水_杀破狼"]={
	chs_1 = 1522717413
	,chs_2 = 0xECB3ED94
	,chs_3 = "shape.wda"
	}
PutongModel["太极流光_杀破狼"]={
	chs_1 = 3966436183
	,chs_2 = 3741875286
	,chs_3 = "shape.wda"
	}
PutongModel["九霄风雷_杀破狼"]={
	chs_1 = 0929770205
	,chs_2 = 3222657771
	,chs_3 = "shape.wda"
	}
PutongModel["若木_杀破狼"]={
	chs_1 = 1083623074
	,chs_2 = 3047863049
	,chs_3 = "shape.wda"
	}
PutongModel["业焰_羽灵神"]={
	chs_1 = 0834237487
	,chs_2 = 3629386269
	,chs_3 = "shape.wda"
	}
PutongModel["业焰_巫蛮儿"]={
	chs_1 = 0830839494
	,chs_2 = 1738625165
	,chs_3 = "shape.wda"
	}
PutongModel["玉辉_羽灵神"]={
	chs_1 = 0713952553
	,chs_2 = 3757988895
	,chs_3 = "shape.wda"
	}
PutongModel["玉辉_巫蛮儿"]={
	chs_1 = 0378020939
	,chs_2 = 3913240810
	,chs_3 = "shape.wda"
	}
PutongModel["鹿鸣_羽灵神"]={
	chs_1 = 1396998121
	,chs_2 = 2061375933
	,chs_3 = "shape.wda"
	}
PutongModel["鹿鸣_巫蛮儿"]={
	chs_1 = 1036718398
	,chs_2 = 1545197282
	,chs_3 = "shape.wda"
	}
PutongModel["庄周梦蝶_羽灵神"]={
	chs_1 = 4147727634
	,chs_2 = 3250095538
	,chs_3 = "shape.wda"
	}
PutongModel["凤翼流珠_羽灵神"]={
	chs_1 = 3818690168
	,chs_2 = 3332193101
	,chs_3 = "shape.wda"
	}
PutongModel["雪蟒霜寒_羽灵神"]={
	chs_1 = 1208982538
	,chs_2 = 3271417203
	,chs_3 = "shape.wda"
	}
PutongModel["碧海潮生_羽灵神"]={
	chs_1 = 3786902490
	,chs_2 = 0069282931
	,chs_3 = "shape.wda"
	}
PutongModel["弦月_羽灵神"]={
	chs_1 = 4218574639
	,chs_2 = 3403641761
	,chs_3 = "shape.wda"
	}
PutongModel["庄周梦蝶_巫蛮儿"]={
	chs_1 = 0383346255
	,chs_2 = 0788977205
	,chs_3 = "shape.wda"
	}
PutongModel["凤翼流珠_巫蛮儿"]={
	chs_1 = 2738200746
	,chs_2 = 3013213807
	,chs_3 = "shape.wda"
	}
PutongModel["雪蟒霜寒_巫蛮儿"]={
	chs_1 = 2446794254
	,chs_2 = 2344781059
	,chs_3 = "shape.wda"
	}
PutongModel["碧海潮生_巫蛮儿"]={
	chs_1 = 3147201779
	,chs_2 = 3842138961
	,chs_3 = "shape.wda"
	}
PutongModel["弦月_巫蛮儿"]={
	chs_1 = 2558772509
	,chs_2 = 0994443450
	,chs_3 = "shape.wda"
	-- 完善
	}
PutongModel["桃夭夭"]={
	chs_1 =0x2f099d59
	,chs_2 =0x1b5f4786
	,chs_3 = "common/shape.wdf"
	}
PutongModel["桃夭夭_灯笼"]={
	chs_1 =0x2f099d59
	,chs_2 =0x1b5f4786
	,chs_3 = "common/shape.wdf"
	}
PutongModel["桃夭夭_飘带"]={
	chs_1 =0xf514e58f
	,chs_2 =0x24e813dd
	,chs_3 = "common/shape.wdf"
	}
PutongModel["素纸灯_桃夭夭"]={
	chs_1 =0xfca44d34
	,chs_2 =0x6b6a3e9b
	,chs_3 = "common/shape.wdf"
	}
PutongModel["如意宫灯_桃夭夭"]={
	chs_1 =0xace0ad55
	,chs_2 =0x7d52b7b2
	,chs_3 = "common/shape.wdf"
	}
PutongModel["玉兔盏_桃夭夭"]={
	chs_1 =0x711c00c
	,chs_2 =0xae8716c
	,chs_3 = "common/shape.wdf"
	}
PutongModel["蟠龙_桃夭夭"]={
	chs_1 =0xf6feaca1
	,chs_2 =0xd6a7506c
	,chs_3 = "common/shape.wdf"
	}
PutongModel["云鹤_桃夭夭"]={
	chs_1 =0x8ec884a6
	,chs_2 =0x1ace0dea
	,chs_3 = "common/shape.wdf"
	}
PutongModel["风荷_桃夭夭"]={
	chs_1 =0x2924735e
	,chs_2 =0x12ac5a00
	,chs_3 = "common/shape.wdf"
	}
PutongModel["金风玉露_桃夭夭"]={
	chs_1 =0xe7bd767a
	,chs_2 =0x7101fac1
	,chs_3 = "common/shape.wdf"
	}
PutongModel["凰火燎原_桃夭夭"]={
	chs_1 =0x16729bb3
	,chs_2 =0x65a74f45
	,chs_3 = "common/shape.wdf"
	}
PutongModel["月露清愁_桃夭夭"]={
	chs_1 =0x223c1b62
	,chs_2 =0xcbf4ce31
	,chs_3 = "common/shape.wdf"
	}
PutongModel["夭桃秾李_桃夭夭"]={
	chs_1 =0x1a53c4e7
	,chs_2 =0x27c1e665
	,chs_3 = "common/shape.wdf"
	}
PutongModel["荒尘_桃夭夭"]={
	chs_1 =0x3848e76
	,chs_2 =0x8b49d1c6
	,chs_3 = "common/shape.wdf"
	}
PutongModel["五色缎带_桃夭夭"]={
	chs_1 =0x6afc59f7
	,chs_2 =0x32736853
	,chs_3 = "common/shape.wdf"
	}
PutongModel["无极丝_桃夭夭"]={
	chs_1 =0xacfd4797
	,chs_2 =0xee59d055
	,chs_3 = "common/shape.wdf"
	}
PutongModel["七彩罗刹_桃夭夭"]={
	chs_1 =0xec2ce1b
	,chs_2 =0x109ac390
	,chs_3 = "common/shape.wdf"
	}
PutongModel["彩虹_桃夭夭"]={
	chs_1 =0x5fcce5d5
	,chs_2 =0xd0d7b4c6
	,chs_3 = "common/shape.wdf"
	}
PutongModel["流云_桃夭夭"]={
	chs_1 =0x51a9f58b
	,chs_2 =0x4f0d82c7
	,chs_3 = "common/shape.wdf"
	}
PutongModel["碧波_桃夭夭"]={
	chs_1 =0x800185fa
	,chs_2 =0xc0a2f354
	,chs_3 = "common/shape.wdf"
	}
PutongModel["秋水落霞_桃夭夭"]={
	chs_1 =0xce670726
	,chs_2 =0xd3dac606
	,chs_3 = "common/shape.wdf"
	}
PutongModel["晃金仙绳_桃夭夭"]={
	chs_1 =0xf4c0c1f6
	,chs_2 =0xa7546f17
	,chs_3 = "common/shape.wdf"
	}
PutongModel["此最相思_桃夭夭"]={
	chs_1 =0x8700d110
	,chs_2 =0xbb8f8820
	,chs_3 = "common/shape.wdf"
	}
PutongModel["揽月摘星_桃夭夭"]={
	chs_1 =0x79fe3e9d
	,chs_2 =0xfba71a70
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九霄_桃夭夭"]={
	chs_1 =0xd196466d
	,chs_2 =0x48d96197
	,chs_3 = "common/shape.wdf"
	}
PutongModel["偃无师"]={
	chs_1 = 0x89f0f085
	,chs_2 = 0x2fd449d8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["偃无师_巨剑"]={
	chs_1 = 0x89f0f085
	,chs_2 = 0x2fd449d8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["偃无师_剑"]={
	chs_1 = 0x89f0f085
	,chs_2 = 0x12fab5cf
	,chs_3 = "common/shape.wdf"
	}
PutongModel["钝铁重剑_偃无师"]={
	chs_1 = 0x59996f41
	,chs_2 = 0x28b6eb2f
	,chs_3 = "common/shape.wdf"
	}
PutongModel["壁玉长铗_偃无师"]={
	chs_1 = 0x26416de1
	,chs_2 = 0x7e269ae
	,chs_3 = "common/shape.wdf"
	}
PutongModel["惊涛雪_偃无师"]={
	chs_1 = 0xe9b2e7c5
	,chs_2 = 0xf1db01b3
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鸦九_偃无师"]={
	chs_1 = 0x929263f1
	,chs_2 = 0xa1346952
	,chs_3 = "common/shape.wdf"
	}
PutongModel["昆吾_偃无师"]={
	chs_1 = 0x2c9ade2
	,chs_2 = 0x182ae6bd
	,chs_3 = "common/shape.wdf"
	}
PutongModel["弦歌_偃无师"]={
	chs_1 = 0x2f3eb992
	,chs_2 = 0x4b302241
	,chs_3 = "common/shape.wdf"
	}
PutongModel["墨骨枯麟_偃无师"]={
	chs_1 = 0xc0446928
	,chs_2 = 0x1364a86d
	,chs_3 = "common/shape.wdf"
	}
PutongModel["腾蛇郁刃_偃无师"]={
	chs_1 = 0x88b7a489
	,chs_2 = 0x812da7b7
	,chs_3 = "common/shape.wdf"
	}
PutongModel["秋水澄流_偃无师"]={
	chs_1 = 0x776f5f7d
	,chs_2 = 0x29d584ca
	,chs_3 = "common/shape.wdf"
	}
PutongModel["百辟镇魂_偃无师"]={
	chs_1 = 0x8a56e79b
	,chs_2 = 0xeffea077
	,chs_3 = "common/shape.wdf"
	}
PutongModel["长息_偃无师"]={
	chs_1 = 0x7d5fe85c
	,chs_2 = 0xb5aec18c
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青铜短剑_偃无师"]={
	chs_1 = 0xa3a53ee1
	,chs_2 = 0x5fcb90c5
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青锋剑_偃无师"]={
	chs_1 = 0x184828c5
	,chs_2 = 0x85f1e16f
	,chs_3 = "common/shape.wdf"
	}
PutongModel["游龙剑_偃无师"]={
	chs_1 = 0x421aa16f
	,chs_2 = 0x6552d73
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鱼肠_偃无师"]={
	chs_1 = 0x6fbab8b7
	,chs_2 = 0xc4278104
	,chs_3 = "common/shape.wdf"
	}
PutongModel["倚天_偃无师"]={
	chs_1 = 0xffbac97
	,chs_2 = 0x283e8c79
	,chs_3 = "common/shape.wdf"
	}
PutongModel["湛卢_偃无师"]={
	chs_1 = 0x536861b9
	,chs_2 = 0x7e265c51
	,chs_3 = "common/shape.wdf"
	}
PutongModel["魏武青虹_偃无师"]={
	chs_1 = 0xfdd3ecbb
	,chs_2 = 0x2e4c5ba9
	,chs_3 = "common/shape.wdf"
	}
PutongModel["灵犀神剑_偃无师"]={
	chs_1 = 0xfdd5c98e
	,chs_2 = 0x30e9fb89
	,chs_3 = "common/shape.wdf"
	}
PutongModel["四法青云_偃无师"]={
	chs_1 = 0x8ac69053
	,chs_2 = 0xef01b789
	,chs_3 = "common/shape.wdf"
	}
PutongModel["霜冷九州_偃无师"]={
	chs_1 = 0x48224b34
	,chs_2 = 0x6b9319a9
	,chs_3 = "common/shape.wdf"
	}
PutongModel["擒龙_偃无师"]={
	chs_1 = 0x66d72341
	,chs_2 = 0x9d706607
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼潇潇"]={
	chs_1 = 0xb917a58d
	,chs_2 = 0x4ed95a04
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼潇潇_伞"]={
	chs_1 = 0xb917a58d
	,chs_2 = 0x4ed95a04
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼潇潇_爪刺"]={
	chs_1 = 0xf5aad68f
	,chs_2 = 0xd509567a
	,chs_3 = "common/shape.wdf"
	}
PutongModel["红罗伞_鬼潇潇"]={ ----
	chs_1 = 0x76426098
	,chs_2 = 0x561bc662
	,chs_3 = "common/shape.wdf"
	}
PutongModel["油纸伞_鬼潇潇"]={ ----
	chs_1 = 0x76426098
	,chs_2 = 0x561bc662
	,chs_3 = "common/shape.wdf"
	}
PutongModel["紫竹伞_鬼潇潇"]={ ----
	chs_1 = 0x76426098
	,chs_2 = 0x561bc662
	,chs_3 = "common/shape.wdf"
	}
PutongModel["琳琅盖_鬼潇潇"]={--
	chs_1 = 0x8d8277fb
	,chs_2 = 0x75b80826
	,chs_3 = "common/shape.wdf"
	}
PutongModel["锦绣椎_鬼潇潇"]={--
	chs_1 = 0x8d8277fb
	,chs_2 = 0x75b80826
	,chs_3 = "common/shape.wdf"
	}
PutongModel["幽兰帐_鬼潇潇"]={--
	chs_1 = 0x8d8277fb
	,chs_2 = 0x75b80826
	,chs_3 = "common/shape.wdf"
	}
PutongModel["金刚伞_鬼潇潇"]={
	chs_1 = 0x8b2f6408
	,chs_2 = 0x9bcaecbc
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼骨_鬼潇潇"]={
	chs_1 = 0x87cc13bd
	,chs_2 = 0x26274c0
	,chs_3 = "common/shape.wdf"
	}
PutongModel["云梦_鬼潇潇"]={
	chs_1 = 0x1186392b
	,chs_2 = 0xd5985d18
	,chs_3 = "common/shape.wdf"
	}
PutongModel["枕霞_鬼潇潇"]={
	chs_1 = 0x12b17018
	,chs_2 = 0x279052c9
	,chs_3 = "common/shape.wdf"
	}
PutongModel["碧火琉璃_鬼潇潇"]={
	chs_1 = 0xd016b928
	,chs_2 = 0x3c4cb4fe
	,chs_3 = "common/shape.wdf"
	}
PutongModel["雪羽穿云_鬼潇潇"]={
	chs_1 = 0x15667d89
	,chs_2 = 0x868b19fb
	,chs_3 = "common/shape.wdf"
	}
PutongModel["月影星痕_鬼潇潇"]={
	chs_1 = 0x59f606ce
	,chs_2 = 0x9bfb157c
	,chs_3 = "common/shape.wdf"
	}
PutongModel["浮生归梦_鬼潇潇"]={
	chs_1 = 0x4129400e
	,chs_2 = 0x4015fc31
	,chs_3 = "common/shape.wdf"
	}
PutongModel["晴雪_鬼潇潇"]={
	chs_1 = 0xcffe51e1
	,chs_2 = 0x888851b6
	,chs_3 = "common/shape.wdf"
	}
PutongModel["铁爪_鬼潇潇"]={
	chs_1 = 0x2f5a4d48
	,chs_2 = 0xcb494ef8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青龙牙_鬼潇潇"]={
	chs_1 = 0xc4598e51
	,chs_2 = 0x9091bfcb
	,chs_3 = "common/shape.wdf"
	}
PutongModel["青刚刺_鬼潇潇"]={
	chs_1 = 0x64ea234b
	,chs_2 = 0x59be69a2
	,chs_3 = "common/shape.wdf"
	}
PutongModel["撕天_鬼潇潇"]={
	chs_1 = 0xddd2427e
	,chs_2 = 0x9f8667cd
	,chs_3 = "common/shape.wdf"
	}
PutongModel["毒牙_鬼潇潇"]={
	chs_1 = 0xefa1b021
	,chs_2 = 0x32ea26bb
	,chs_3 = "common/shape.wdf"
	}
PutongModel["胭脂_鬼潇潇"]={
	chs_1 = 0x71917206
	,chs_2 =  0xe178f1f8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["九阴勾魂_鬼潇潇"]={
	chs_1 = 0xddb52de7
	,chs_2 = 0xd3ba6091
	,chs_3 = "common/shape.wdf"
	}
PutongModel["雪蚕之刺_鬼潇潇"]={
	chs_1 = 0x95535295
	,chs_2 = 0x6294455a
	,chs_3 = "common/shape.wdf"
	}
PutongModel["贵霜之牙_鬼潇潇"]={
	chs_1 = 0x67455b85
	,chs_2 = 0x8bc6755f
	,chs_3 = "common/shape.wdf"
	}
PutongModel["忘川三途_鬼潇潇"]={
	chs_1 = 0xa227eae0
	,chs_2 = 0x517613b8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["离钩_鬼潇潇"]={
	chs_1 = 0x27bfa1cb
	,chs_2 = 0x540c068e
	,chs_3 = "common/shape.wdf"
	}
PutongModel["木桩"]={
	chs_1 = 0x0CC00001
	,chs_2 = 0x0CC00001
	,chs_3 = "aaa.wdf"
	}
PutongModel["僵尸倒地"]={
	chs_1 = 0x5723F6F9
	,chs_2 = 0x5723F6F9
	,chs_3 = "shape.wdf"
	}
PutongModel["赌徒倒地"]={
	chs_1 = 0x93371DC2
	,chs_2 = 0x93371DC2
	,chs_3 = "shape.wdf"
	}
PutongModel["逍遥生坐下"]={
	chs_1 = 2165332228
	,chs_2 = 2165332228
	,chs_3 = "common/shape.wdf"
	}
PutongModel["英女侠坐下"]={
	chs_1 = 0x8AE7E3A4
	,chs_2 = 0x8AE7E3A4
	,chs_3 = "shape.wdf"
	}
PutongModel["玄彩娥坐下"]={
	chs_1 = 0xF6820612
	,chs_2 = 0xF6820612
	,chs_3 = "common/shape.wdf"
	}
PutongModel["舞天姬坐下"]={
	chs_1 = 3933281088
	,chs_2 = 3933281088
	,chs_3 = "common/shape.wdf"
	}
PutongModel["神天兵坐下"]={
	chs_1 = 0xA4D3F138
	,chs_2 = 0xA4D3F138
	,chs_3 = "common/shape.wdf"
	}
PutongModel["龙太子坐下"]={
	chs_1 = 0x1D76393F
	,chs_2 = 0x1D76393F
	,chs_3 = "common/shape.wdf"
	}
PutongModel["巨魔王坐下"]={
	chs_1 = 0x8349ECD1
	,chs_2 = 0x8349ECD1
	,chs_3 = "common/shape.wdf"
	}
PutongModel["剑侠客坐下"]={
	chs_1 = 0xCA7EED95
	,chs_2 = 0xCA7EED95
	,chs_3 = "shape.wdf"
	}
PutongModel["虎头怪坐下"]={
	chs_1 = 0x0431506B
	,chs_2 = 0x0431506B
	,chs_3 = "common/shape.wdf"
	}
PutongModel["狐美人坐下"]={
	chs_1 = 0x9C1633C8
	,chs_2 = 0x9C1633C8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["骨精灵坐下"]={
	chs_1 = 0x72AFA4E9
	,chs_2 = 0x72AFA4E9
	,chs_3 = "common/shape.wdf"
	}
PutongModel["飞燕女坐下"]={
	chs_1 = 0x45988F73
	,chs_2 = 0x45988F73
	,chs_3 = "common/shape.wdf"
	}
PutongModel["巫蛮儿坐下"]={
	chs_1 = 0803847012
	,chs_2 = 0803847012
	,chs_3 = "shape.wda"
	}
PutongModel["杀破狼坐下"]={
	chs_1 = 448666846
	,chs_2 = 448666846
	,chs_3 = "shape.wda"
	}
PutongModel["羽灵神坐下"]={
	chs_1 = 0775868075
	,chs_2 = 0775868075
	,chs_3 = "shape.wda"
	}
PutongModel["偃无师坐下"]={
	chs_1 = 0x4eb0e2d8
	,chs_2 = 0x4eb0e2d8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["桃夭夭坐下"]={
	chs_1 = 0x5be51474
	,chs_2 = 0x5be51474
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼潇潇坐下"]={
	chs_1 = 0xf5aad68f
	,chs_2 = 0xf5aad68f
	,chs_3 = "common/shape.wdf"
	}
PutongModel["逍遥生倒地"]={
	chs_1 = 1782439566
	,chs_2 = 1782439566
	,chs_3 = "common/shape.wdf"
	}
PutongModel["英女侠倒地"]={
	chs_1 = 550776032
	,chs_2 = 550776032
	,chs_3 = "shape.wdf"
	}
PutongModel["玄彩娥倒地"]={
	chs_1 = 1501032219
	,chs_2 = 1501032219
	,chs_3 = "common/shape.wdf"
	}
PutongModel["舞天姬倒地"]={
	chs_1 = 3043244041
	,chs_2 = 3043244041
	,chs_3 = "common/shape.wdf"
	}
PutongModel["神天兵倒地"]={
	chs_1 = 1649555822
	,chs_2 = 1649555822
	,chs_3 = "common/shape.wdf"
	}
PutongModel["龙太子倒地"]={
	chs_1 = 2482790664
	,chs_2 = 2482790664
	,chs_3 = "common/shape.wdf"
	}
PutongModel["巨魔王倒地"]={
	chs_1 = 2951893280
	,chs_2 = 2951893280
	,chs_3 = "common/shape.wdf"
	}
PutongModel["剑侠客倒地"]={
	chs_1 = 0x7671ebdf
	,chs_2 = 0x7671ebdf
	,chs_3 = "shape.wdf"
	}
PutongModel["虎头怪倒地"]={
	chs_1 = 1740983547
	,chs_2 = 1740983547
	,chs_3 = "common/shape.wdf"
	}
PutongModel["狐美人倒地"]={
	chs_1 = 247333098
	,chs_2 = 247333098
	,chs_3 = "common/shape.wdf"
	}
PutongModel["骨精灵倒地"]={
	chs_1 = 3644222844
	,chs_2 = 3644222844
	,chs_3 = "common/shape.wdf"
	}
PutongModel["飞燕女倒地"]={
	chs_1 = 2068177574
	,chs_2 = 2068177574
	,chs_3 = "common/shape.wdf"
	}
PutongModel["巫蛮儿倒地"]={
	chs_1 = 857427883
	,chs_2 = 857427883
	,chs_3 = "shape.wda"
	}
PutongModel["杀破狼倒地"]={
	chs_1 = 3215162495
	,chs_2 = 3215162495
	,chs_3 = "shape.wda"
	}
PutongModel["羽灵神倒地"]={
	chs_1 = 570130129
	,chs_2 = 570130129
	,chs_3 = "shape.wda"
	}
PutongModel["偃无师倒地"]={
	chs_1 = 0x85509c8
	,chs_2 = 0x85509c8
	,chs_3 = "common/shape.wdf"
	}
PutongModel["桃夭夭倒地"]={
	chs_1 = 0x7f187687
	,chs_2 = 0x7f187687
	,chs_3 = "common/shape.wdf"
	}
PutongModel["鬼潇潇倒地"]={
	chs_1 = 0x16603d24
	,chs_2 = 0x16603d24
	,chs_3 = "common/shape.wdf"
	}
PutongModel["龙龟"]={
	chs_1 = 0x6CEAFF1E
	,chs_2 = 0x04D2CF27
	,chs_3 = "shape.wd2"
	}
PutongModel["狐不归"]={
	chs_1 = 0x9000004
	,chs_2 = 0x9000005
	,chs_3 = "org4.rpk"
	}
PutongModel["进阶狐不归"]={
	chs_1 = 0x9000019
	,chs_2 = 0x9000015
	,chs_3 = "org4.rpk"
	}
PutongModel["花铃"]={
	chs_1 = 0x10000009
	,chs_2 = 0x10000010
	,chs_3 = "org4.rpk"
	}
PutongModel["进阶花铃"]={
	chs_1 = 0x10000019
	,chs_2 = 0x10000020
	,chs_3 = "org4.rpk"
	}
PutongModel["月魅"]={
	chs_1 = 0x30000010
	,chs_2 = 0x30000011
	,chs_3 = "沉默.rpk"
	}
PutongModel["进阶月魅"]={
	chs_1 = 0x30000021
	,chs_2 = 0x30000020
	,chs_3 = "沉默.rpk"
	}
PutongModel["月影仙"]={
	chs_1 = 0x40000004
	,chs_2 = 0x40000005
	,chs_3 = "org4.rpk"
	}
PutongModel["进阶月影仙"]={
	chs_1 = 0x40000009
	,chs_2 = 0x40000010
	,chs_3 = "org4.rpk"
	}
PutongModel["云游火"]={
	chs_1 = 0x50000004
	,chs_2 = 0x50000005
	,chs_3 = "org4.rpk"
	}
PutongModel["进阶云游火"]={
	chs_1 = 0x50000009
	,chs_2 = 0x50000010
	,chs_3 = "org4.rpk"
	}
PutongModel["超级神猪"]={
	chs_1 =  83886089
	,chs_2 =  83886096
	,chs_3 =  "org4.rpk"
	}
PutongModel["进阶超级神猪"]={
	chs_1 =  0x5000009
	,chs_2 =  0x5000010
	,chs_3 =  "org4.rpk"
	}
PutongModel["超级猪小戒"]={
	chs_1 =  117440521
	,chs_2 =  117440528
	,chs_3 =  "org4.rpk"
	}
PutongModel["进阶超级猪小戒"]={
	chs_1 =  0x7000009
	,chs_2 =  0x7000010
	,chs_3 =  "org4.rpk"
	}
PutongModel["超级小白龙"]={
	chs_1 =  100663312
	,chs_2 =  100663305
	,chs_3 =  "org4.rpk"
	}
PutongModel["进阶超级小白龙"]={
	chs_1 =  0x6000010
	,chs_2 =  0x6000009
	,chs_3 =  "org4.rpk"
	}
PutongModel["超级神鼠"]={
	chs_1 =  67108868
	,chs_2 =  67108869
	,chs_3 =  "org4.rpk"
	}
PutongModel["进阶超级神鼠"]={
	chs_1 =  0x4000009
	,chs_2 =  0x4000010
	,chs_3 =  "org4.rpk"
	}
PutongModel["超级神狗"]={
	chs_1 =  50331652
	,chs_2 =  50331653
	,chs_3 =  "org4.rpk"
	}
PutongModel["进阶超级神狗"]={
	chs_1 =  0x3000009
	,chs_2 =  0x3000010
	,chs_3 =  "org4.rpk"
	}
PutongModel["超级飞天"]={
	chs_1 =  0x1000009
	,chs_2 =  0x1000010
	,chs_3 =  "org4.rpk"
	}
PutongModel["进阶超级飞天"]={
	chs_1 =  0x1000005
	,chs_2 =  0x1000004
	,chs_3 =  "org4.rpk"
	}
PutongModel["灵木宝树"]={
	chs_1 = 0xF972D8EF
	,chs_2 = nil
	,chs_3 = "common/shape.wdf"
	}
PutongModel["宝箱"]={
	chs_1 = 0xEFFD57F2
	,chs_2 = nil
	,chs_3 = "shape.wdf"
	}
PutongModel["大银宝箱"]={
	chs_1 = 223856486
	,chs_2 = nil
	,chs_3 = "item.wd2"
	}
PutongModel["木宝箱"]={
	chs_1 = 0xB825D41C
	,chs_2 = nil
	,chs_3 = "shape.wdc"
	}
PutongModel["金宝箱"]={
	chs_1 = 0x7F5B7CB4
	,chs_2 = nil
	,chs_3 = "shape.wdc"
	}
PutongModel["阵眼"]={
	chs_1 = 698919830
	,chs_2 = nil
	,chs_3 = "shape.wdc"
	}
PutongModel["祈愿宝箱"]={
	chs_1 =  0x1e29a66f
	,chs_2 =  0x1e29a66f
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["中秋梦幻"]={
	chs_1 =  0xe2736848
	,chs_2 =  0xe2736848
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["路障红正"]={
	chs_1 =  0x859d3610
	,chs_2 =  0x859d3610
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["路障红反"]={
	chs_1 =  0x714cb3d2
	,chs_2 =  0x714cb3d2
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["路障蓝正"]={
	chs_1 =  0xa539b7cd
	,chs_2 =  0xa539b7cd
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["路障蓝反"]={
	chs_1 =  0x1b28fe8
	,chs_2 =  0x1b28fe8
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["路障红正小"]={
	chs_1 =  0x40ae5ddd
	,chs_2 =  0x40ae5ddd
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["路障红反小"]={
	chs_1 =  0x34cf73ab
	,chs_2 =  0x34cf73ab
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["路障蓝正小"]={
	chs_1 =  0x769c31fa
	,chs_2 =  0x769c31fa
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["路障蓝反小"]={
	chs_1 =  0x4fba55bf
	,chs_2 =  0x4fba55bf
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["尸骨"]={
	chs_1 =  0x92f29862
	,chs_2 =  0x92f29862
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["酒坛"]={
	chs_1 =  0x7baf0ee9
	,chs_2 =  0x7baf0ee9
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["布书"]={
	chs_1 =  0xab46d4c1
	,chs_2 =  0xab46d4c1
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["祭台火盆黑"]={
	chs_1 =  0x1823c626
	,chs_2 =  0x1823c626
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["祭台火盆红"]={
	chs_1 =  0x84dbc2e1
	,chs_2 =  0x84dbc2e1
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["祭台火盆蓝"]={
	chs_1 =  0x70e9a5ad
	,chs_2 =  0x70e9a5ad
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["龙柱"]={
	chs_1 =  0x6f6aa35c
	,chs_2 =  0x6f6aa35c
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["菩萨"]={
	chs_1 =  0xeb22f96e
	,chs_2 =  0xeb22f96e
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["菩萨1"]={
	chs_1 =  0x5bcf3551
	,chs_2 =  0x5bcf3551
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["菩萨2"]={
	chs_1 =  0x8777954e
	,chs_2 =  0x8777954e
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["僧人"]={
	chs_1 =  0x905fd8c9
	,chs_2 =  0x905fd8c9
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["僧人1"]={
	chs_1 =  0x962a7ca6
	,chs_2 =  0x962a7ca6
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["僧人2"]={
	chs_1 =  0xd53eb58e
	,chs_2 =  0xd53eb58e
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["士兵"]={
	chs_1 =  0xc9ed9138
	,chs_2 =  0xc9ed9138
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["士兵1"]={
	chs_1 =  0xd11a664
	,chs_2 =  0xd11a664
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["烽火台"]={
	chs_1 =  0x6b772c36
	,chs_2 =  0x6b772c36
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["角楼"]={
	chs_1 =  0x7b5195bb
	,chs_2 =  0x7b5195bb
	,chs_3 =  "common/shape.wdf"
	}
PutongModel["竹简"]={
	chs_1 =  0x7b4e8f
	,chs_2 =  0x7b4e8f
	,chs_3 =  "shape.wdc"
	}
PutongModel["礼包褐"]={
	chs_1 =  0x7746fa4b
	,chs_2 =  0x7746fa4b
	,chs_3 =  "shape.wdc"
	}
PutongModel["礼包紫"]={
	chs_1 =  0xb2c207b4
	,chs_2 =  0xb2c207b4
	,chs_3 =  "shape.wdc"
	}
PutongModel["符咒"]={
	chs_1 =  0xe000bcf4
	,chs_2 =  0xe000bcf4
	,chs_3 =  "shape.wdc"
	}
PutongModel["符咒1"]={
	chs_1 =  0xe000bcf4
	,chs_2 =  0xe000bcf4
	,chs_3 =  "shape.wdc"
	}
PutongModel["符咒2"]={
	chs_1 =  0x77f93926
	,chs_2 =  0x77f93926
	,chs_3 =  "shape.wdc"
	}
PutongModel["符咒3"]={
	chs_1 =  0xe693c77f
	,chs_2 =  0xe693c77f
	,chs_3 =  "shape.wdc"
	}
PutongModel["符咒4"]={
	chs_1 =  0x8f507a06
	,chs_2 =  0x8f507a06
	,chs_3 =  "shape.wdc"
	}
PutongModel["符咒5"]={
	chs_1 =  0xc9aa7151
	,chs_2 =  0xc9aa7151
	,chs_3 =  "shape.wdc"
	}
PutongModel["符咒6"]={
	chs_1 =  0x11e8b141
	,chs_2 =  0x11e8b141
	,chs_3 =  "shape.wdc"
	}
PutongModel["符咒7"]={
	chs_1 =  0x4b3c7866
	,chs_2 =  0x4b3c7866
	,chs_3 =  "shape.wdc"
	}
PutongModel["红旗"]={
	chs_1 = 1308427449
	,chs_2 = 1308427449
	,chs_3 = "shape.wdf"
	}
PutongModel["蓝旗"]={
	chs_1 = 2301248419
	,chs_2 = 2301248419
	,chs_3 = "shape.wdf"
	}
PutongModel["旗桩"]={
	chs_1 = 3782691594
	,chs_2 = 3782691594
	,chs_3 = "shape.wdf"
	}
PutongModel["宝箱"]={
	chs_1 = 0xEFFD57F2
	,chs_2 = nil
	,chs_3 = "shape.wdf"
	}
PutongModel["雪宝箱"]={
	chs_1 =  0x45541e0a
	,chs_2 =  0x45541e0a
	,chs_3 =  "shape.wdc"
	}
PutongModel["破旧宝箱"]={
	chs_1 =  0xc4c5611f
	,chs_2 =  0xc4c5611f
	,chs_3 =  "shape.wdc"
	}
PutongModel["赤金宝箱"]={
	chs_1 =  0xc0d4d240
	,chs_2 =  0xc0d4d240
	,chs_3 =  "shape.wd4"
	}
PutongModel["战车机关"]={
	chs_1 =  0x45541e0a
	,chs_2 =  0x45541e0a
	,chs_3 =  "shape.wdc"
	}
PutongModel["未知BOOS无恶1"]={
	chs_1 =  0xF207F1A0
	,chs_2 =  0xF207F1A0
	,chs_3 =  "shape.wdc"
	}
PutongModel["未知BOOS无恶2"]={
	chs_1 =  0xBF358FFE
	,chs_2 =  0xBF358FFE
	,chs_3 =  "shape.wdc"
	}
PutongModel["未知BOOS无恶3"]={
	chs_1 =  0x22413486
	,chs_2 =  0x22413486
	,chs_3 =  "shape.wdc"
	}
PutongModel["未知BOOS无恶4"]={
	chs_1 =  0x2FE25A8B
	,chs_2 =  0x2FE25A8B
	,chs_3 =  "shape.wdc"
	}
PutongModel["未知BOOS无恶5"]={
	chs_1 =  0x679F3915
	,chs_2 =  0x679F3915
	,chs_3 =  "shape.wdc"
	}
PutongModel["未知BOOS无恶6"]={
	chs_1 =  0x6C1BFD1F
	,chs_2 =  0x6C1BFD1F
	,chs_3 =  "shape.wdc"
	}
PutongModel["未知BOOS无恶7"]={
	chs_1 =  0x6F8C61B8
	,chs_2 =  0x6F8C61B8
	,chs_3 =  "shape.wdc"
	}
PutongModel["竹筏"]={
	chs_1 =  2325825167
	,chs_2 =  2325825167
	,chs_3 =  "shape.wda"
	}
PutongModel["龙舟"]={
	chs_1 =  2177303452
	,chs_2 =  2177303452
	,chs_3 =  "shape.wd7"
	}
PutongModel["蚩尤小"]={
	chs_1 =  1796855426
	,chs_2 =  2677184683
	,chs_3 =  "shape.wdc"
	}
PutongModel["小蚩尤"]={
	chs_1 =  0x20000221
	,chs_2 =  0x20000224
	,chs_3 =  "自用图标.wdf"
	}
-- --PutongModel["谛听"]={
-- 	chs_1 =  0x8000009
-- 	,chs_2 =  0x8000010
-- 	,chs_3 =  "org4.rpk"
-- 	}
-- --PutongModel["进阶谛听"]={
-- 	chs_1 =  0x8000019
-- 	,chs_2 =  0x8000020
-- 	,chs_3 =  "org4.rpk"
-- 	}
-- PutongModel["超级鲲鹏"]={
-- 	chs_1 =  0xE010A003
-- 	,chs_2 =  0xE010A003
-- 	,chs_3 =  "kkjn.wdf"
-- 	}
-- PutongModel["进阶超级鲲鹏"]={
-- 	chs_1 =  0xE010A003
-- 	,chs_2 =  0xE010A003
-- 	,chs_3 =  "kkjn.wdf"
-- 	}
PutongModel["印记五"]={
	chs_1 = 2012821798
	,chs_2 = 2012821798
	,chs_3 = "shape.wdc"
	}
PutongModel["元宝模型"]={
	chs_1 = 0xC880FF79
	,chs_2 = 0xC880FF79
	,chs_3 = "shape.wd2"
	}
PutongModel["小气泡"]={
	chs_1 = 0x15988DBD
	,chs_2 = 0x15988DBD
	,chs_3 = "shape.wd3"
	}
PutongModel["中气泡"]={
	chs_1 = 0xE3255D9E
	,chs_2 = 0xE3255D9E
	,chs_3 = "shape.wd3"
	}
PutongModel["大气泡"]={
	chs_1 = 0xDC77F739
	,chs_2 = 0xDC77F739
	,chs_3 = "shape.wd3"
	}
PutongModel["新二大王"]={
	chs_1 = "白象精站立"
	,chs_2 = "白象精跑"
	,chs_3 = "tfg.rpk"
	}
PutongModel["新猪八戒"]={
	chs_1 = "猪八戒站立"
	,chs_2 = "猪八戒跑"
	,chs_3 = "tfg.rpk"
	}
PutongModel["新孙悟空"]={
	chs_1 = "孙悟空站立"
	,chs_2 = "孙悟空跑"
	,chs_3 = "tfg.rpk"
	}
PutongModel["广目巡守"]={
	chs_1 = "广目巡守待战"
	,chs_2 = "广目巡守行走"
	,chs_3 = "tfg.rpk"
	}
PutongModel["进阶广目巡守"]={
	chs_1 = "广目巡守待战"
	,chs_2 = "广目巡守行走"
	,chs_3 = "tfg.rpk"
	}
-- PutongModel["龙鲤"]={
-- 	chs_1 = "龙鲤站立"
-- 	,chs_2 = "龙鲤跑"
-- 	,chs_3 = "tfg.rpk"
-- 	}
-- PutongModel["进阶龙鲤"]={
-- 	chs_1 = "龙鲤站立"
-- 	,chs_2 = "龙鲤跑"
-- 	,chs_3 = "tfg.rpk"
-- 	}
PutongModel["妙华天女"]={
	chs_1 = "妙华天女待战"
	,chs_2 = "妙华天女跑"
	,chs_3 = "tfg.rpk"
	}
PutongModel["妙华天女"]={
	chs_1 = "进阶妙华天女待战"
	,chs_2 = "进阶妙华天女跑"
	,chs_3 = "tfg.rpk"
	}
PutongModel["沙暴"]={
	chs_1 = 0xDDDD0146
	,chs_2 = 0xDDDD0146
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶沙暴"]={
	chs_1 = "沙暴站立"
	,chs_2 = "沙暴行走"
	,chs_3 = "xiaoshen.npk"
	}

PutongModel["超级红孩儿"]={
	chs_1 = 0xDDDD0192
	,chs_2 = 0xDDDD0192
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶超级红孩儿"]={
	chs_1 = 0xDDDD0192
	,chs_2 = 0xDDDD0192
	,chs_3 = "沉默.wdf"
	}
PutongModel["超级飞廉"]={
	chs_1 = 0xB0000006
	,chs_2 = 0xB0000001
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶超级飞廉"]={
	chs_1 = 0xB0000006
	,chs_2 = 0xB0000001
	,chs_3 = "沉默.wdf"
	}
PutongModel["超级神柚"]={
	chs_1 = 0xDDDD0022
	,chs_2 = 0xDDDD0022
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶超级神柚"]={
	chs_1 = 0xDDDD0022
	,chs_2 = 0xDDDD0022
	,chs_3 = "沉默.wdf"
	}
PutongModel["自在心猿"]={
	chs_1 = 0xC0000004
	,chs_2 = 0xC0000005
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶自在心猿"]={
	chs_1 = 0xC1000002
	,chs_2 = 0xC1000008
	,chs_3 = "沉默.wdf"
	}
PutongModel["超级恶魔泡泡"]={
	chs_1 = 0xE0000008
	,chs_2 = 0xE0000007
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶超级恶魔泡泡"]={
	chs_1 = 0xE0000008
	,chs_2 = 0xE0000007
	,chs_3 = "沉默.wdf"
	}
PutongModel["幻姬"]={
	chs_1 = 0xDDDD0048   --站立
	,chs_2 = 0xDDDD0050   --行走
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶幻姬"]={
	chs_1 = 0xDDDD0048
	,chs_2 = 0xDDDD0050
	,chs_3 = "沉默.wdf"
	}
PutongModel["白豹"]={
	chs_1 = 0xDDDD0138
	,chs_2 = 0xDDDD0139
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶白豹"]={
	chs_1 = 0xDDDD0138
	,chs_2 = 0xDDDD0139
	,chs_3 = "沉默.wdf"
	}
PutongModel["魔化童子"]={
	chs_1 = 0xDDDD0032
	,chs_2 = 0xDDDD0033
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶魔化童子"]={
	chs_1 = 0xDDDD0505
	,chs_2 = 0xDDDD0507
	,chs_3 = "沉默.wdf"
	}
PutongModel["雷龙"]={
	chs_1 = 0xDDDD0055
	,chs_2 = 0xDDDD0057
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶雷龙"]={
	chs_1 = 0xDDDA0006
	,chs_2 = 0xDDDA0008
	,chs_3 = "沉默.wdf"
	}
PutongModel["长乐灵仙"]={
	chs_1 = 0xDDDD0071
	,chs_2 = 0xDDDD0073
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶长乐灵仙"]={
	chs_1 = 0xDDDD8072
	,chs_2 = 0xDDDD8074
	,chs_3 = "沉默.wdf"
	}
PutongModel["泡泡灵仙·剑侠客"]={
	chs_1 = 0xDDDD0081
	,chs_2 = 0xDDDD0080
	,chs_3 = "沉默.wdf"
	}
PutongModel["泡泡灵仙·骨精灵"]={
	chs_1 = 0xDDDD0087
	,chs_2 = 0xDDDD0088
	,chs_3 = "沉默.wdf"
	}
PutongModel["泡泡灵仙·飞燕女"]={
	chs_1 = 0xDDDD0454
	,chs_2 = 0xDDDD0456
	,chs_3 = "沉默.wdf"
	}
PutongModel["泡泡灵仙·羽灵神"]={
	chs_1 = 0xDDDD0462
	,chs_2 = 0xDDDD0464
	,chs_3 = "沉默.wdf"
	}
PutongModel["泡泡灵仙·巫蛮儿"]={
	chs_1 = 0xDDDD0470
	,chs_2 = 0xDDDD0472
	,chs_3 = "沉默.wdf"
	}
PutongModel["泡泡灵仙·杀破狼"]={
	chs_1 = 0xDDDD0478
	,chs_2 = 0xDDDD0480
	,chs_3 = "沉默.wdf"
	}
PutongModel["金翼"]={
	chs_1 = 0xDDDD0205
	,chs_2 = 0xDDDD0207
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶金翼"]={
	chs_1 = 0xDDDD0205
	,chs_2 = 0xDDDD0207
	,chs_3 = "沉默.wdf"
	}
PutongModel["觉醒涂山雪"]={
	chs_1 = 0xDDDD0314
	,chs_2 = 0xDDDD0316
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶觉醒涂山雪"]={
	chs_1 = 0xDDDD0323
	,chs_2 = 0xDDDD0325
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶觉醒涂山雪"]={
	chs_1 = 0xDDDD0323
	,chs_2 = 0xDDDD0325
	,chs_3 = "沉默.wdf"
	}
PutongModel["司雨"]={
	chs_1 = 0xDDDD0635
	,chs_2 = 0xDDDD0637
	,chs_3 = "沉默.wdf"
	}
PutongModel["进阶司雨"]={
	chs_1 = 0xDDDD0644
	,chs_2 = 0xDDDD0646
	,chs_3 = "沉默.wdf"
	}


一体锦衣={"白帝江套装飞燕女","白帝江套装神天兵","白帝江套装桃夭夭","白帝江套装巫蛮儿","白帝江套装舞天姬","白帝江套装玄彩娥","白帝江套装英女侠","白斗战胜佛白帝江剑侠客","白青花瓷白帝江龙太子","白青花瓷白帝江神天兵","白青花瓷白帝江逍遥生","白青花瓷白帝江偃无师","白青花瓷白泽剑侠客","白青花瓷黑帝江虎头怪","白青花瓷黑帝江巨魔王","白青花瓷黑帝江杀破狼","白泽青花瓷龙太子","白泽套装飞燕女","白泽套装巫蛮儿","白泽套装偃无师","白泽套装英女侠","黑白泽青花瓷套装神天兵","黑白泽套装骨精灵","黑白泽套装鬼潇潇","黑白泽套装狐美人","黑白泽套装虎头怪","黑白泽套装巨魔王","黑白泽套装龙太子","黑白泽套装杀破狼","黑白泽套装神天兵","黑白泽套装桃夭夭","黑白泽套装舞天姬","黑白泽套装玄彩娥","黑帝江套装骨精灵","黑帝江套装鬼潇潇","黑帝江套装狐美人"}
for i=1,#一体锦衣 do
	if 一体锦衣[i]== "白青花瓷黑帝江杀破狼" then
       PutongModel[一体锦衣[i]]={chs_1 = "白青花瓷黑帝江杀破狼站立",chs_2 = "白青花瓷黑帝杀破狼奔跑",chs_3 = "xiaoshen.npk"}
    else
        PutongModel[一体锦衣[i]]={chs_1 = 一体锦衣[i].."站立",chs_2 = 一体锦衣[i].."奔跑",chs_3 = "xiaoshen.npk"}
	end
end
二体锦衣={"福气冲天吾皇飞燕女","福气冲天吾皇骨精灵","福气冲天吾皇狐美人","福气冲天吾皇虎头怪","福气冲天吾皇剑侠客","福气冲天吾皇巨魔王"
	,"福气冲天吾皇龙太子","福气冲天吾皇神天兵","福气冲天吾皇舞天姬","福气冲天吾皇逍遥生","福气冲天吾皇玄彩娥","福气冲天吾皇英女侠"

	,"九尾冰狐飞燕女","九尾冰狐骨精灵","九尾冰狐狐美人","九尾冰狐虎头怪","九尾冰狐剑侠客","九尾冰狐巨魔王"
	,"九尾冰狐龙太子","九尾冰狐神天兵","九尾冰狐舞天姬","九尾冰狐逍遥生","九尾冰狐玄彩娥","九尾冰狐英女侠"

	,"神行小驴飞燕女","神行小驴骨精灵","神行小驴狐美人","神行小驴虎头怪","神行小驴剑侠客","神行小驴巨魔王"
	,"神行小驴龙太子","神行小驴神天兵","神行小驴舞天姬","神行小驴逍遥生","神行小驴玄彩娥","神行小驴英女侠"

	,"新水嘟嘟飞燕女","新水嘟嘟骨精灵","新水嘟嘟狐美人","新水嘟嘟虎头怪","新水嘟嘟剑侠客","新水嘟嘟巨魔王"
	,"新水嘟嘟龙太子","新水嘟嘟神天兵","新水嘟嘟舞天姬","新水嘟嘟逍遥生","新水嘟嘟玄彩娥","新水嘟嘟英女侠"

	,"天使猪猪飞燕女","天使猪猪骨精灵","天使猪猪狐美人","天使猪猪虎头怪","天使猪猪剑侠客","天使猪猪巨魔王"
	,"天使猪猪龙太子","天使猪猪神天兵","天使猪猪舞天姬","天使猪猪逍遥生","天使猪猪玄彩娥","天使猪猪英女侠"

}
for i=1,#二体锦衣 do
	PutongModel[二体锦衣[i]]={chs_1 = 二体锦衣[i].."1",chs_2 = 二体锦衣[i].."2",chs_3 = "xiaoshen.npk"}
end

