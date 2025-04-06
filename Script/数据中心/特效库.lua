-- @Author: baidwwy
-- @Date:   2024-08-21 11:43:35
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-12-15 13:41:11
function 引擎.特效库(tx,ttx)
	local txs = {}
	if Texiaoku[tx] then
	    txs[1]=Texiaoku[tx].txs_1
	    txs[2]=Texiaoku[tx].txs_2
	    if  ttx~=nil then
	    	local xtx=引擎.取新特效(ttx)
	    		txs[1]=xtx[1]
	    		txs[2]=xtx[2]
	    end
	else
		txs[1]= 0xFCD58523
		txs[2] = "wzife.wdf"
	end
	return txs
end

function 引擎.模型特效库(tx,wq)
	if wq ~= nil then
	   	tx =tx.. "_"..wq
	end
	local txs = {}
	if Mxtexiaoku[tx] then
	    txs[1]=Mxtexiaoku[tx].txs1
	    txs[2]=Mxtexiaoku[tx].txs2
	end
	return txs
end

	Texiaoku={}
	Texiaoku["铸兵锤"]={
        txs_1 = 188096422
        ,txs_2 = "common/magic.wdf"


    }
    Texiaoku["力辟苍穹_落"]={
        txs_1 = 3348997640.0
        ,txs_2 = "common/magic.wdf"

    }
    Texiaoku["枫影二刃"]={
        txs_1 = 3384332637.0
        ,txs_2 = "common/magic.wdf"

    }
    Texiaoku["力辟苍穹" or tx == "魔神之刃"]={
        txs_1 = 481310163
        ,txs_2 = "common/magic.wdf"


    }
    Texiaoku["炎魂"]={
        txs_1 = 2678031854.0
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku["状态_炎魂"]={
        txs_1 = 0x00000013
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku["枫影二刃1"]={
        txs_1 = 0x00000001
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku["枫影二刃2"]={
        txs_1 = 0x00000002
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku['力辟苍穹1']={
        txs_1 = 0x00000003
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku['力辟苍穹2']={
        txs_1 = 0x00000004
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku["三荒尽灭"]={
        txs_1 = 0x00000006
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku["铁血生风"]={
        txs_1 = 0x00000008
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku["一斧开天"]={
        txs_1 = 0x00000010
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku["一斧开天成功"]={
        txs_1 = 0x00000011
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku["一斧开天失败"]={
        txs_1 = 0x00000012
        ,txs_2 = "common/magic.wdf"

    }
    Texiaoku["浮空"]={
        txs_1 = 0x00000007
        ,txs_2 = "common/magic.wdf"
    }
    Texiaoku['状态_怒哮']={
        txs_1 = 0x00000005
        ,txs_2 = "common/magic.wdf"
    }
 Texiaoku["故壤归心"]={
		txs_1 = 3356723242
		,txs_2 = "magic.wdf"
		  }
	Texiaoku["施法特效"]={
		txs_1 = 0xfde9e928
		,txs_2 = "nvdi1.wdf"
	}
		Texiaoku["齐天大圣·群法"]={
		txs_1 = "齐天大圣群法"
		,txs_2 = "sftx.dll"
	}
	Texiaoku["状态_虚弱"]={
		txs_1 = 3645258252
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["法宝"]={
		txs_1 = 102263255
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["减防御"]={
		txs_1 = "AABBCC07"
		,txs_2 = "mgtx.wdf"

	}
	Texiaoku["减法防"]={
		txs_1 = "AABBCC08"
		,txs_2 = "mgtx.wdf"

	}
	Texiaoku["减双抗"]={
		txs_1 = "AABBCC09"
		,txs_2 = "mgtx.wdf"

	}
	Texiaoku["共生"]={
		txs_1 = 216725786
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_苍白纸人_敌方"]={
		txs_1 = 0x2f45b9f0
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_苍白纸人_我方"]={
		txs_1 = 0x592ebd89
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_乾坤玄火塔_敌方"]={
		txs_1 = 0x325a1f6a
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_乾坤玄火塔_我方"]={
		txs_1 = 0xc236bf21
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_干将莫邪_敌方"]={
		txs_1 = 0x47f867ff
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_干将莫邪_我方"]={
		txs_1 = 0x7838ce56
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_混元伞_敌方"]={
		txs_1 = 0x2F45B9F0
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_混元伞_我方"]={
		txs_1 = 0x592EBD89
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["缩地尺"]={
		txs_1 = 796976203
		,txs_2 = "zztx.wdf" --唯美版
	--
	}
	Texiaoku["发瘟匣"]={
		txs_1 = 0xe9ec95cd
		,txs_2 = "magic.wdf"

	}
	Texiaoku["金甲仙衣" ]={
		txs_1 = 0x7AEF08A1
		,txs_2 = "magic.wdf"

	}
	Texiaoku["无魂傀儡" ]={
		txs_1 = 0x7AEF08A1
		,txs_2 = "magic.wdf"

	}
	Texiaoku["断线木偶"]={
		txs_1 = 0x7AEF08A1
		,txs_2 = "magic.wdf"

	}
	Texiaoku["降魔斗篷"]={
		txs_1 = 0x7AEF08A1
		,txs_2 = "magic.wdf"

	}
	Texiaoku["状态_无魂傀儡"]={
		txs_1 = 0x7aef08a1
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_断线木偶"]={
		txs_1 = 0x7aef08a1
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["状态_无尘扇"]={
		txs_1 = 0x7aef08a1
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["无尘扇"]={
		txs_1 = 0xb8c9232
		,txs_2 = "magic.wdf"

	}
	Texiaoku["混元伞_我方"]={
		txs_1 = 0x1F334661
		,txs_2 = "magic.wdf"

	}
	Texiaoku["混元伞_敌方"]={
		txs_1 = 0xf2822c9d
		,txs_2 = "magic.wdf"
	}
	Texiaoku["干将莫邪_敌方"]={
		txs_1 = 0x47F867FF
		,txs_2 = "magic.wdf"
  	}
  	Texiaoku["干将莫邪_我方"]={
		txs_1 = 0x7838CE56
		,txs_2 = "magic.wdf"
  	}
  	Texiaoku["清心咒"]={
  		txs_1 = 822452251
		,txs_2 = "magic.wdf"
  	}
  	Texiaoku["苍白纸人"]={
		txs_1 = 0x899DFF11
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_缚妖索"]={
		txs_1 = 0xce13670b
		,txs_2 = "addon.wdf"
	}
	Texiaoku["状态_捆仙绳"]={
		txs_1 = 0xce13670b
		,txs_2 = "addon.wdf"
	}
	Texiaoku["状态_缚龙索"]={
		txs_1 = 0xce13670b
		,txs_2 = "addon.wdf"
	}
	Texiaoku["缚妖索"]={
		txs_1 = 0xce13670b
		,txs_2 = "addon.wdf"
	}
	Texiaoku["捆仙绳"]={
		txs_1 = 0xce13670b
		,txs_2 = "addon.wdf"
	}
	Texiaoku["缚龙索"]={
		txs_1 = 0xce13670b
		,txs_2 = "addon.wdf"
	}
	Texiaoku["番天印"]={
		txs_1 = 0x72574dc2
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_番天印"]={
		txs_1 = 0x72574dc2
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["罗汉珠"]={
		txs_1 = 0x77c3fdb9
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_罗汉珠"]={
		txs_1 = 0x92bc0997
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["分水"]={
		txs_1 = 0x6D0DA404
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_分水"]={
		txs_1 = 0x973bcf2c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_天煞"]={
		txs_1 = 0x719d767f
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["神木宝鼎"]={
		txs_1 = 0x8d7d4a28
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_神木宝鼎"]={
		txs_1 = 0x196f4a1d
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["赤焰"]={
		txs_1 = 0xA8D0CA5A
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_赤焰"]={
		txs_1 = 0xA8D0CA5A
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["鬼泣"]={
		txs_1 = 0x96E5FD5D
		,txs_2 = "magic.wdf"
	}
	Texiaoku["惊魂铃"]={
		txs_1 = 0x96E5FD5D
		,txs_2 = "magic.wdf"
	}
	Texiaoku["失心钹" ]={
		txs_1 = 0xB5DC4541
		,txs_2 = "magic.wdf"
	}
	Texiaoku["乾坤玄火塔" ]={
		txs_1 = 0xE4A2B66E
		,txs_2 = "magic.wdf"
	}
	Texiaoku["七宝玲珑灯" ]={
		txs_1 = 0x44302d8b
		,txs_2 = "magic.wdf"
	}
	Texiaoku["无字经"]={
		txs_1 = 0x32D3023F
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_无字经"]={
		txs_1 = 0x32D3023F
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["摄魂" ]={
		txs_1 = 3761188461--0xe02f2e6d
		,txs_2 =  "waddon.wdf"--"magic.wdf"
	}
	Texiaoku["状态_摄魂" ]={
		txs_1 = 3761188461--0xe02f2e6d
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["救命毫毛" ]={ --复活后施法救命毫毛
		txs_1 = 0x526579a3
		,txs_2 = "magic.wdf"
	}
	Texiaoku["照妖镜" ]={
		txs_1 = 0x80db228a
		,txs_2 = "magic.wdf"
	-------四级法宝
	}
	Texiaoku["九梵清莲"]={
		txs_1 = 0xce4013a9
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_九梵清莲"]={
		txs_1 = 0x9da386b
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["苍灵雪羽"]={
		txs_1 = 0x287f7362
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_苍灵雪羽"]={
		txs_1 = 0x73df2340
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["烽火狼烟"]={
		txs_1 = 0xdf5022f0
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_烽火狼烟"]={ --
   	    txs_1 =0x547C4B68
		,txs_2 = "common/magic.wdf"

	}
	Texiaoku["舞雪冰蝶"]={
		txs_1 = 0x732894c
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_舞雪冰蝶"]={
		txs_1 = 0x619b686c
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["紫火如意"]={
		txs_1 = 0x2bafa21d
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["金蟾"]={
		txs_1 = 0x2f02120b
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_金蟾"]={
		txs_1 = 3272437193
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["璞玉灵钵"]={
		txs_1 = 0x66e9f081
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_璞玉灵钵"]={
		txs_1 = 0x715e9bd4
		,txs_2 = "common/magic.wdf"

	}
	--==============================超级否定信仰《四季》=====================================================================================================================

	Texiaoku["超级赐福·元吉"]={
		txs_1 = 0xFB300001
		,txs_2 ="cjwf.dll"
	}
	Texiaoku["超级赐福·双喜"]={
		txs_1 = 0xFB300002
		,txs_2 ="cjwf.dll"
	}
	Texiaoku["超级赐福·三和"]={
		txs_1 = 0xFB300003
		,txs_2 ="cjwf.dll"
	}
	Texiaoku["超级赐福·四季"]={
		txs_1 = 0xFB300004
		,txs_2 ="cjwf.dll"
	}
	Texiaoku["超级赐福·五福"]={
		txs_1 = 0xFB300005
		,txs_2 ="cjwf.dll"
	}

	Texiaoku["超级赐福·六祥"]={
		txs_1 = 0xFB300005
		,txs_2 ="cjwf.dll"
	}
	Texiaoku["超级赐福·七瑞"]={
		txs_1 = 0xFB300005
		,txs_2 ="cjwf.dll"
	}
	Texiaoku["超级赐福·八荒"]={
		txs_1 = 0xFB300005
		,txs_2 ="cjwf.dll"
	}
	Texiaoku["超级赐福·九州"]={
		txs_1 = 0xFB300005
		,txs_2 ="cjwf.dll"
	}
	Texiaoku["超级赐福·十全"]={
		txs_1 = 0xFB300005
		,txs_2 ="cjwf.dll"
	}
	--==============================子女====================================================
	Texiaoku["还魂咒"]={
		txs_1 = 2391977602
		,txs_2 = "magic.wdf"
	}
	Texiaoku["仙人指路"]={
		txs_1 = 388205471
		,txs_2 = "magic.wdf"
	}
	Texiaoku["峰回路转"]={
		txs_1 = 0xF3B31E4E
		,txs_2 = "magic.wdf"
	}
	Texiaoku["四面埋伏"]={
		txs_1 = 0x32A07D29
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_四面埋伏"]={
		txs_1 = 0x1E1AF8D9
		,txs_2 = "waddon.wdf"
	--==============================召唤兽====================================================
	}
	Texiaoku["落岩"]={
		txs_1 = 180555238
		,txs_2 = "magic.wdf"
	}
	Texiaoku["水攻"]={
		txs_1 = 4180877467
		,txs_2 = "magic.wdf"
	}
	Texiaoku["惊心一剑"]={
		txs_1 = 1000651155
		,txs_2 = "addon.wdf"
	}
	Texiaoku["泰山压顶"]={
		txs_1 = 2864434176 --山
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["泰山压顶2"]={
		txs_1 = 0xDF4C3BE3 --光
		,txs_2 = "magic.wdf"
	}
	Texiaoku["八凶法阵"]={
		txs_1 = 0x139426b5
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_八凶法阵（红）" ]={
		txs_1 = 1027581335
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_八凶法阵（黄）"]={
		txs_1 = 3828092768
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_八凶法阵（蓝）"]={
		txs_1 = 2242204664
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_八凶法阵（白）"]={
		txs_1 = 0xd48b920
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_无畏布施"]={
		txs_1 = 0x2F3E4271
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["叱咤风云"]={ --叱诧风云 唯美版的 3947008580 或 2478916108
		txs_1 = 0x60EB2F76
		,txs_2 = "magic.wd1"
	}
	Texiaoku["流沙轻音"]={
		txs_1 = 2701401453 --这个最像 2986629642 3720603693
		,txs_2 = "shape.wdb"
    }
    Texiaoku["灵能激发"]={
        txs_1 = 1374463277
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_灵能激发"]={ --唯美的有
		txs_1 =0xEC3149BB
		,txs_2 ="waddon.wdf"
	}
	Texiaoku["食指大动_香蕉"]={
		txs_1 = 317939146
		,txs_2 = "magic.wdf"
	}
	Texiaoku["食指大动_菠萝"]={
		txs_1 = 352414521
		,txs_2 = "magic.wdf"
	}
	Texiaoku["食指大动_西瓜"]={
		txs_1 = 3175360443
		,txs_2 = "magic.wdf"
	}
	Texiaoku["替换地狱烈火"]={
		txs_1 = 3738314047
		,txs_2 = "magic.wdf"
	}
	Texiaoku["地狱烈火1"]={
		txs_1 = 0x257635ee
		,txs_2 = "magic.wdf"
	}
	Texiaoku["地狱烈火2"]={
		txs_1 = 0xBE325D99
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雷击"]={
		txs_1 = 238079300
		,txs_2 = "magic.wdf"
	}
	Texiaoku["烈火"]={
		txs_1 = 3507654973
		,txs_2 = "magic.wdf"
	}
	Texiaoku["超级三昧真火"]={
		txs_1 = 0x00000069
		,txs_2 = "沉默.wdf"
	}
	Texiaoku["水漫金山"]={
		txs_1 = 0xc9c4951d
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["水漫金山0"]={
		txs_1 = 0x90e8589f
		,txs_2 = "magic.wdf"
	}
	Texiaoku["水漫金山1"]={
		txs_1 = 2431146143
		,txs_2 = "magic.wdf"
	}
	Texiaoku["水漫金山2"]={
		txs_1 = 0x97311BAD
		,txs_2 = "magic.wdf"
	}
	Texiaoku["力劈华山"]={
		txs_1 = 4281577710
		,txs_2 = "magic.wdf"
	}
	Texiaoku["月光"]={
		txs_1 = 685510219
		,txs_2 = "common/ski.wdf"
	}
	Texiaoku["扶摇万里"]={
		txs_1 = 3858450819
		,txs_2 = "magic.wdf"
	}
	Texiaoku["鲲鹏出场"]={
		txs_1 = 286261268
		,txs_2 = "kkjn.wdf"
	}
	Texiaoku["水击三千"]={
		txs_1 = 3577357803
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["奔雷咒1"]={ --左光效
		txs_1 = 0xF1F26922
		,txs_2 = "magic.wdf"
	}
	Texiaoku["奔雷咒2"]={ --右光效
		txs_1 = 0x2A997658
		,txs_2 = "magic.wdf"
	}
	Texiaoku["奔雷咒3"]={ --正宗
		txs_1 = 0xF84C4025
		,txs_2 = "nvdi1.wdf"
	}
	--=======================超级技能2.29
	Texiaoku["状态_弱点火" ]={
		txs_1 = 1027581335
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_弱点土"]={
		txs_1 = 3828092768
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_弱点水"]={
		txs_1 = 2242204664
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_弱点雷"]={
		txs_1 = 0xd48b920
		,txs_2 = "waddon.wdf"
	}
	-----------------------------
	Texiaoku["超级壁垒击破"]={
		txs_1 = 0x99DDC32A
		,txs_2 = "magic.wdf"
	}
	Texiaoku["超级神迹复活"]={ --左光效
		txs_1 = 0xF1F26922
		,txs_2 = "magic.wdf"
	}
	Texiaoku["超级永恒"]={ --超级技能2.6 加
		txs_1 = 0x5A07D50A
		,txs_2 = "magic.wdf"
	}
    Texiaoku["状态_超级永恒"]={
		txs_1 = 0x71E4E462
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_超级强力"]={ --超级技能2.18 加
		txs_1 = 0x83FD8292
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_超级盾气_敌方"]={ --超级技能2.18 加
		txs_1 = 0x28c53e46
		,txs_2 = "waddon.wdf"
	}
    Texiaoku["状态_超级盾气_我方"]={ --超级技能2.18 加
		txs_1 = 0x866ef702
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_超级进击必杀"]={ --超级技能2.22 加
		txs_1 = 0xAFFB5781
		,txs_2 = "waddon.wdf"
	}
	--=======================
	Texiaoku["壁垒击破"]={
		txs_1 = 0x99DDC32A
		,txs_2 = "magic.wdf"
	}
	Texiaoku["善恶有报"]={
		txs_1 = 0x8d8a818d
		,txs_2 = "addon.wdf"
	}
	Texiaoku["特色善恶有报"]={
		txs_1 = 0x8d8a818d
		,txs_2 = "addon.wdf"
	}
	Texiaoku["上古灵符"]={
		txs_1 = 48901659
		,txs_2 = "magic.wdf"
	}
	Texiaoku["夜舞倾城"]={
		txs_1 = 0xF18C76DD
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_法术防御" ]={
		txs_1 = 0xDEDEE983
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["死亡召唤" ]={
		txs_1 = 0x19182964
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_死亡召唤" ]={ --0x2C6223D4
		txs_1 = 0x19182964
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["善恶有报" ]={
		txs_1 = 0x8D8A818D
		,txs_2 = "magic.wdf"
	}
	Texiaoku["特色善恶有报" ]={
		txs_1 = 0x8D8A818D
		,txs_2 = "magic.wdf"
	}
	Texiaoku["剑荡四方" ]={
		txs_1 = "0x729ADE62"--0xE3D6B98D
		,txs_2 =""
	}
	Texiaoku["打雷加电" ]={
		txs_1 = 0x51EEBFF3
		,txs_2 ="magic.wdf"
	}
	Texiaoku["津津有味" ]={
		txs_1 = 0x411c5d82
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["上古灵符_冰冻" ]={
		txs_1 = 0x2ea2e1b
		,txs_2 ="magic.wdf"
	}
	Texiaoku["上古灵符_流沙" ]={
		txs_1 = 0xfc1c8ee7
		,txs_2 ="magic.wdf"
	}
	Texiaoku["上古灵符_心火" ]={
		txs_1 = 0x9779b893
		,txs_2 ="magic.wdf"
	}
	Texiaoku["上古灵符_怒雷" ]={
		txs_1 = 0xef3e3fe4
		,txs_2 ="magic.wdf"
	}
	Texiaoku["状态_龙魂"]={ --唯美的有
		txs_1 =1076770981
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["天降灵葫_大" ]={
		txs_1 =0xf99822ce
		,txs_2 ="magic.wdf"
	}
	Texiaoku["天降灵葫_中" ]={
		txs_1 =0x75331968
		,txs_2 ="magic.wdf"
	}
	Texiaoku["天降灵葫_小" ]={
		txs_1 =0xdcd7a875
		,txs_2 ="magic.wdf"
	}
	Texiaoku["状态_盾气_敌方"]={
		txs_1 = 0x28c53e46
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_高级盾气_敌方"]={
		txs_1 = 0x28c53e46
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_盾气_我方"]={
		txs_1 = 0x866ef702
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_高级盾气_我方"]={
		txs_1 = 0x866ef702
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_遗志"]={
		txs_1 = 1893926450
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_高级遗志"]={
		txs_1 = 1893926450
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_超级遗志"]={ --超级技能2.22
		txs_1 = 1893926450
		,txs_2 = "waddon.wdf"
	}
	--==============================特技====================================================

	Texiaoku["金刚怒目"]={
		txs_1 = 732930589
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["慈航普度"]={
		txs_1 = 3775417657
		,txs_2 = "magic.wdf"
	}
	Texiaoku["凝神诀"]={
		txs_1 = 2128818470
		,txs_2 = "magic.wdf"
	}
	Texiaoku["回魂咒"]={
		txs_1 = 2391977602
		,txs_2 = "magic.wdf"
	}
	Texiaoku["冰清诀"]={
		txs_1 = 388205471
		,txs_2 = "magic.wdf"
	}
	Texiaoku["晶清诀"]={
		txs_1 = 388205471
		,txs_2 = "magic.wdf"
	}
	Texiaoku["同生共死"]={
		txs_1 = 388205471
		,txs_2 = "magic.wdf"
	}
	Texiaoku["逆境"]={
		txs_1 = 388205471
		,txs_2 = "magic.wdf"
	}
	Texiaoku["连破"]={
		txs_1 = 0x66150076
		,txs_2 = "magic.wdf"
	}
	Texiaoku["玉清诀"]={
		txs_1 = 0x66150076
		,txs_2 = "magic.wdf"
	}
	Texiaoku["水清诀"]={
		txs_1 = 0x66150076
		,txs_2 = "magic.wdf"
	}
	Texiaoku["四海升平"]={
		txs_1 = 3497509792
		,txs_2 = "magic.wdf"
	}
	Texiaoku["命归术"]={
		txs_1 = 821212684
		,txs_2 = "magic.wdf"
	}
	Texiaoku["破血狂攻"]={
		txs_1 = 387269810
		,txs_2 = "addon.wdf"
	}
	Texiaoku["弱点击破"]={
		txs_1 = 387269810
		,txs_2 = "addon.wdf"
	}
	Texiaoku["气归术"]={
		txs_1 = 3497509792
		,txs_2 = "magic.wdf"
	}
	Texiaoku["心疗术"]={
		txs_1 = 4227373440
		,txs_2 = "magic.wdf"
	}
	Texiaoku["命疗术"]={
		txs_1 = 4088602190
		,txs_2 = "magic.wdf"
	}
	Texiaoku["碎甲术"]={
		txs_1 = 0xd0eec915
		,txs_2 = "magic.wdf"
	}
	Texiaoku["破甲术"]={
		txs_1 = 3505309973
		,txs_2 = "magic.wdf"
	}
	Texiaoku["凝气诀"]={
		txs_1 = 843116756
		,txs_2 = "magic.wdf"
	}
	Texiaoku["气疗术"]={
		txs_1 = 4088602190
		,txs_2 = "magic.wdf"
	}
	Texiaoku["起死回生"]={
		txs_1 = 2391977602
		,txs_2 = "magic.wdf"
	}
	Texiaoku["破碎无双"]={
		txs_1 = 0x21FAE73F
		,txs_2 = "magic.wdf"
	}
	Texiaoku["放下屠刀" ]={
		txs_1 = 0x81b4599f
		,txs_2 = "magic.wdf"
	}
	Texiaoku["河东狮吼"]={
		txs_1 = 0x81B4599F
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_太极护法" ]={
		txs_1 = 1549538628
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["太极护法" ]={
		txs_1 = 1556617600
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["罗汉金钟" ]={
		txs_1 = 1556617600
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_罗汉金钟"]={
		txs_1 = 1549538628
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["流云诀"]={
		txs_1 = 0xfe27ebcf
		,txs_2 = "magic.wdf"
	}
	Texiaoku["御风"]={
		txs_1 = 0xfe27ebcf
		,txs_2 = "magic.wdf"
	}
	Texiaoku["啸风诀"]={
		txs_1 = 0xfe27ebcf
		,txs_2 = "magic.wdf"
	}
	Texiaoku["野兽之力"]={
		txs_1 = 540773493
		,txs_2 = "magic.wdf"
	}
	Texiaoku["怒吼"]={
		txs_1 = 540773493
		,txs_2 = "magic.wdf"
	}
	Texiaoku[ "魔兽之印"]={
		txs_1 = 540773493
		,txs_2 = "magic.wdf"
	}
	Texiaoku["光辉之甲"]={
		txs_1 = 956135146
		,txs_2 = "magic.wdf"
	}
	Texiaoku["护佑"]={
		txs_1 = 956135146
		,txs_2 = "magic.wdf"
	}
	Texiaoku["圣灵之甲"]={
		txs_1 = 956135146
		,txs_2 = "magic.wdf"
	}
	Texiaoku["笑里藏刀"]={
		txs_1 = 1575320484
		,txs_2 = "magic.wdf"
	}
	Texiaoku["绝幻魔音"]={
		txs_1 = 0x14E3155E
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_天衣无缝"]={
		txs_1 = 0xFAF4A2D4
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["天衣无缝"]={
		txs_1 = 0xC183DB1E
		,txs_2 = "magic.wdf"
	}
	Texiaoku["凝滞术"]={
		txs_1 = 0xD1E593CE
		,txs_2 = "magic.wdf"
	}
	Texiaoku["移行换影"]={
		txs_1 = 2504473876
		,txs_2 = "magic.wdf"
   	}
   	Texiaoku["停陷术"]={
		txs_1 = 0x47C69103
		,txs_2 = "magic.wdf"
	}
	Texiaoku["诅咒之伤"]={
		txs_1 = 0x3D14B496
		,txs_2 = "magic.wdf"
	}
	Texiaoku["吸血特技"]={
		txs_1 = 0x7E9811A9
		,txs_2 = "magic.wdf"
	}
	Texiaoku["修罗咒"]={
		txs_1 = 0x95065313
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_修罗咒"]={
		txs_1 = 785149356
		,txs_2 = "waddon.wdf"
		--新增
	}
	Texiaoku["心如明镜"]={
		txs_1 = 2806422927
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_心如明镜"]={
		txs_1 = 192450138
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["菩提心佑"]={
		txs_1 = 3635943122
		,txs_2 = "magic.wdf"
	}
	Texiaoku["身似菩提"]={
		txs_1 = 4062507146
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_身似菩提"]={
		txs_1 = 2464314882
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["死亡之音"]={
		txs_1 = 4203231214
		,txs_2 = "magic.wdf"





		--新增
	--==============================召唤兽特性====================================================
	}
	Texiaoku["状态_碎甲刃"]={
		txs_1 = 0x5525C5FB
		,txs_2 ="waddon.wdf"
	--==============================召唤兽内丹====================================================
	}
	Texiaoku["腾挪劲"]={
		txs_1 = 0xac3d253b
		,txs_2 = "magic.wdf"
	--==============================通用====================================================
	}
	Texiaoku["逃跑"]={
		txs_1 = 0xF5189E48
		,txs_2 = "addon.wdf"
	}
	Texiaoku["状态_护盾_我方"]={
		txs_1 = "护盾我方"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["铜头铁臂_我方"]={
		txs_1 = "护盾我方"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["状态_护盾_敌方"]={
		txs_1 = "护盾敌方"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["铜头铁臂_敌方"]={
		txs_1 = "护盾敌方"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["自爆"]={
		txs_1 = 0xA5199709
		,txs_2 = "magic.wdf"
	}
	Texiaoku["捕捉开始"]={
		txs_1 = 3195920150
		,txs_2 = "addon.wdf"
	}
	Texiaoku["加血"]={
		txs_1 = 2010253357
		,txs_2 = "addon.wdf"
	}
	Texiaoku["加愤怒"]={
		txs_1 = 2156718962
		,txs_2 = "addon.wdf"
	}
	Texiaoku["防御"]={
		txs_1 = 908223343
		,txs_2 = "addon.wdf"
	}
	Texiaoku["牛刀小试"]={
		txs_1 = 1000651155
		,txs_2 = "addon.wdf"
	}
	Texiaoku["飞镖"]={
		txs_1 = 0x494DC152
		,txs_2 = "addon.wdf"
	}
	Texiaoku["弓弩攻击"]={
		txs_1 = 3804004647
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["加蓝"]={
		txs_1 = 1049700101
		,txs_2 = "addon.wdf"
	}
	Texiaoku["状态_冰封"]={
		txs_1 = 324036383
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["保护"]={
		txs_1 = 4027829983
		,txs_2 = "addon.wdf"
	}
	Texiaoku["状态_毒"]={
		txs_1 = 3687768876
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["被击中"]={
		txs_1 = 490729788
		,txs_2 = "addon.wdf"
	}
	Texiaoku["反震"]={
		txs_1 = 3690777786
		,txs_2 = "addon.wdf"
	}
	Texiaoku["暴击"]={
		txs_1 = 3973111811
		,txs_2 = "magic.wdf"
	}
	Texiaoku["捕捉成功"]={
		txs_1 = 2601915514
		,txs_2 = "addon.wdf"
	}
	Texiaoku["打狗棒"]={
		txs_1 = 0x1EE9406C
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_护法紫丝"]={
		txs_1 = 0x042B06AC
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["升级"]={
		txs_1 = 2604332261
		,txs_2 = "addon.wdf"
	}
	Texiaoku["战斗暴击" ]={
		txs_1 = 0xECD0E003
		,txs_2 = "addon.wdf"
	}
	Texiaoku["法术暴击" ]={
		txs_1 = 0xdad8ac20
		,txs_2 = "magic.wdf"
	}
	Texiaoku["战斗头标" ]={
		txs_1 = 0x97C79EDB
		,txs_2 = "addon.wdf"
	}
	Texiaoku["特赦令牌" ]={
		txs_1 = 0x7A55F632
		,txs_2 ="magic.wdf"
	}
	Texiaoku["闪亮登场"]={
		txs_1 = 0x6DFE584A
		,txs_2 = "wzife.wd2"
	}
	Texiaoku["挑战失败"]={
		txs_1 = 0x36F99CC8
		,txs_2 = "wzife.wd2"
	}
	Texiaoku["无特效"]={
		txs_1 = 0xFCD58523
		,txs_2 = "wzife.wdf"
	}
	Texiaoku["弓弩1"]={
		txs_1 = 0x2843A984--0x775176bb
		,txs_2 = "addon.wdf"
	}
	Texiaoku["弓弩2"]={
		txs_1 = 0xe84bf869
		,txs_2 = "addon.wdf"
	}
	Texiaoku["弓弩3"]={
		txs_1 = 0x2843a984
		,txs_2 = "addon.wdf"
	}
	Texiaoku["阵型_不动如山"]={
		txs_1 = 4106238113
		,txs_2 = "wzife.wd2"
	--==============================门派====================================================



	--==============================门派====================================================
	--新法术特效
	--大唐官府=========================================
	}
	Texiaoku["新_横扫千军" ]={
		txs_1 = 0x19c102d1
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_后发制人" ]={
		txs_1 = 0x22dfd2ea
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_破釜沉舟" ]={ --全屏
		txs_1 = 0x439692de
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["其疾如风"]={
		txs_1 = 3293033444
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["其徐如林"]={
		txs_1 = 2206060349
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["侵掠如火"]={
		txs_1 = 2215845942
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["岿然如山"]={
		txs_1 = 3814947031
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["千里神行"]={
		txs_1 = 3356723242
		,txs_2 = "magic.wdf"
	}
	Texiaoku["筋斗云"]={
		txs_1 = 3356723242
		,txs_2 = "magic.wdf"
	}
	Texiaoku["杀气诀"]={
		txs_1 = 0xC29A0737
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_杀气诀"]={
		txs_1 = 0xAFFB5781
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["后发制人"]={
		txs_1 = 968268166
		,txs_2 = "magic.wdf"
	}
	Texiaoku["横扫千军"]={
		txs_1 = 2896471370
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·横扫千军·噬魂"]={
		txs_1 = 2896471370
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·横扫千军·刻骨"]={
		txs_1 = 2896471370
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·横扫千军·钻心"]={
		txs_1 = 2896471370
		,txs_2 = "magic.wdf"
	}
	Texiaoku["披挂上阵"]={
		txs_1 = 2896471370
		,txs_2 = "magic.wdf"
	}
	Texiaoku["惊天动地" ]={
		txs_1 = 1704285798--3348997639
		,txs_2 = "common/magic.wdf"
    }
    Texiaoku["披坚执锐" ]={
		txs_1 = 318839712--3348997639
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["破釜沉舟" ]={
		txs_1 = 0x78d6fd06
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_后发制人"]={
		txs_1 = 0x2a2a0663
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_剑意"]={
		txs_1 = 0x85B3D6F1
		,txs_2 = "waddon.wdf" --状态一般都是这个文件
	}
	Texiaoku["状态_侵蚀·横扫千军·刻骨"]={
		txs_1 = 0xd9463a0c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·横扫千军·钻心"]={
		txs_1 = 0xd9463a0c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·横扫千军·噬魂"]={
		txs_1 = 0xd9463a0c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_横扫千军"]={
		txs_1 = 0xd9463a0c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_破釜沉舟"]={
		txs_1 = 0xd9463a0c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_惊天动地"]={
		txs_1 = 0xd9463a0c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_落土止息"]={
		txs_1 = 0xd9463a0c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["安神诀"]={
		txs_1 = 0x3fca8c5a
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_安神诀"]={
		txs_1 = 0xE61DB8B4
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["反间之计"]={
		txs_1 = 0xe1e5ea57
		,txs_2 = "magic.wdf"
	}
	Texiaoku["斩龙诀"]={
		txs_1 = 0x81B4599F
		,txs_2 = "magic.wdf"
	}
	Texiaoku["长驱直入"]={
		txs_1 = 3630365671
		,txs_2 = "magic.wdf"
	}
	Texiaoku["翩鸿一击"]={
		txs_1 = 3630365671
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_风魂"]={ --可能是风魂
		txs_1 = 2621918900
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["突进"]={
		txs_1 = 0xbed8962a
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_突进"]={
		txs_1 = 0x85b3d6f1
		,txs_2 = "waddon.wdf"
	--化生寺==========================================
	}
	Texiaoku["新_唧唧歪歪" ]={
		txs_1 = 0xf71deaf7
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_金刚护法" ]={
		txs_1 = 0xab0d8604
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_推气过宫" ]={ -- 全屏
		txs_1 = 0x7eec276b
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_我佛慈悲" ]={
		txs_1 = 0x6fc329c6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_活血" ]={
		txs_1 = 0xef9691f3
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_救死扶伤" ]={
		txs_1 = 0xf2c7bc8e
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_舍生取义" ]={
		txs_1 = 0x8cba06e2
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_金刚护体" ]={
		txs_1 = 0x9e4e9755
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["韦陀护法"]={
		txs_1 = 2493890284
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_韦陀护法"]={
		txs_1 = 1659752907
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["妙手回春"]={
		txs_1 = 51617616
		,txs_2 = "magic.wdf"

    }
    Texiaoku["功德无量"]={
		txs_1 = 776377754
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_功德无量"]={
		txs_1 = 1110430343--648926576
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["达摩护体"]={
		txs_1 = 2565901429
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_达摩护体"]={
		txs_1 = 2565901429
		,txs_2 = "magic.wdf"
	}
	Texiaoku["推气过宫"]={
		txs_1 = 3899242890
		,txs_2 = "magic.wdf"
	}
	Texiaoku["救死扶伤"]={
		txs_1 = 3899242890
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_金刚护体"]={
		txs_1 = 916220457
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["佛门普渡"]={
		txs_1 = 428453890
		,txs_2 = "magic.wdf"
	}
	Texiaoku["活血"]={
		txs_1 = 51617616
		,txs_2 = "magic.wdf"
	}
	Texiaoku["推拿"]={
		txs_1 = 51617616
		,txs_2 = "magic.wdf"
	}
	Texiaoku["金刚护体"]={
		txs_1 = 952243307
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_一苇渡江"]={
		txs_1 = 382287583
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["一苇渡江"]={
		txs_1 = 4082420920
		,txs_2 = "magic.wdf"
	}
	Texiaoku["解毒"]={
		txs_1 = 3727996990
		,txs_2 = "magic.wdf"
	}
	Texiaoku["唧唧歪歪"]={
		txs_1 = 3240896099
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·唧唧歪歪·噬魂"]={
		txs_1 = 3240896099
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·唧唧歪歪·钻心"]={
		txs_1 = 3240896099
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·唧唧歪歪·刻骨"]={
		txs_1 = 3240896099
		,txs_2 = "magic.wdf"
	}
	Texiaoku["我佛慈悲"]={
		txs_1 = 540772211
		,txs_2 = "magic.wdf"
	}
	Texiaoku["诸天看护"]={
		txs_1 = 0x49EB8017
		,txs_2 = "magic.wd1"
    }
    Texiaoku["状态_诸天看护"]={
		txs_1 = 0x33084AA4
		,txs_2 = "1gf.wdf"
	}
	Texiaoku["金刚护法"]={
		txs_1 = 0x04DB6C0A
		,txs_2 = "magic.wdf"
	}
             Texiaoku["侵蚀·嗔怒金刚·刻骨"]={
		txs_1 = 0x04DB6C0A
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·嗔怒金刚·钻心"]={
		txs_1 = 0x04DB6C0A
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·嗔怒金刚·噬魂"]={
		txs_1 = 0x04DB6C0A
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·绝烬残光·刻骨"]={
		txs_1 = 0x15AE9E20
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["侵蚀·绝烬残光·钻心"]={
		txs_1 = 0x15AE9E20
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["侵蚀·绝烬残光·噬魂"]={
		txs_1 = 0x15AE9E20
		,txs_2 = "common/magic.wdf"
	}
	-- Texiaoku["大快朵颐"]={
	-- 	txs_1 = 0x04DB6C0A
	-- 	,txs_2 = "magic.wdf"
	-- }
	Texiaoku["状态_金刚护法"]={
		txs_1 = 0x16B27FFC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_侵蚀·嗔怒金刚·刻骨"]={
		txs_1 = 0x16B27FFC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_侵蚀·嗔怒金刚·钻心"]={
		txs_1 = 0x16B27FFC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_侵蚀·嗔怒金刚·噬魂"]={
		txs_1 = 0x16B27FFC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_佛法无边"]={
		txs_1 = 0xEA4D704A
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["佛法无边"]={
		txs_1 = 0xC8011EF1
		,txs_2 = "magic.wdf"
	}
	Texiaoku["舍生取义"]={
		txs_1 = 0xF0CE9045
		,txs_2 = "magic.wdf"
	}
	Texiaoku["妙悟"]={
		txs_1 = 0xF0CE9045
		,txs_2 = "magic.wdf"
	}
	Texiaoku["醍醐灌顶"]={
		txs_1 = 2479870127
		,txs_2 = "magic.wdf"
	}
	Texiaoku["谆谆教诲"]={
		txs_1 = 852689471
		,txs_2 = "magic.wdf"
	}
	Texiaoku["紫气东来"]={
		txs_1 = 0xA742E8AB
		,txs_2 = "magic.wdf"
	}
	Texiaoku["渡劫金身"]={
		txs_1 = 448678604
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_渡劫金身"]={
		txs_1 = 0x92BC0997
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["达摩护体"]={
		txs_1 = 2565901429
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_达摩护体"]={
		txs_1 = 2565901429
		,txs_2 = "magic.wdf"
	}
	--女儿村=====================================================

	Texiaoku["新_楚楚可怜" ]={
		txs_1 = 0x28faeff7
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_满天花雨" ]={
		txs_1 = 0x253c9538
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_莲步轻舞" ]={
		txs_1 = 0x73d87e89
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_如花解语" ]={
		txs_1 = 0xb493ef60
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_似玉生香" ]={
		txs_1 = 0xba10e451
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_娉婷袅娜" ]={ --旧版没有
		txs_1 = 0xaf8e7ddb
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_一笑倾城" ]={
		txs_1 = 0x935fa878
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_花护"]={
		txs_1 = 0x7DCEE534
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_显圣"]={
		txs_1 = 0x7DCEE534
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_得意"]={
		txs_1 = 0x7DCEE534
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["红袖添香"]={
		txs_1 = 3858048292
		,txs_2 = "magic.wdf"
	}
	Texiaoku["葬玉焚花"]={
		txs_1 = 2449616946
		,txs_2 = "magic.wd1"
	}
	Texiaoku["侵蚀·葬玉焚花·刻骨"]={
		txs_1 = 2449616946
		,txs_2 = "magic.wd1"
	}
	Texiaoku["侵蚀·葬玉焚花·噬魂"]={
		txs_1 = 2449616946
		,txs_2 = "magic.wd1"
	}
	Texiaoku["侵蚀·葬玉焚花·钻心"]={
		txs_1 = 2449616946
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_红袖添香"]={
		txs_1 = 3037907947
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["飞花摘叶"]={
		txs_1 = 0x78BF64A4
		,txs_2 = "magic.wdf"
	}
	Texiaoku["百毒不侵"]={
		txs_1 = 0xD69CAE82
		,txs_2 = "magic.wdf"
	}
	Texiaoku["一笑倾城"]={
		txs_1 = 0xcb3b68b8
		,txs_2 = "magic.wdf"
	}
	Texiaoku["情天恨海"]={
		txs_1 = 0xC1825B80
		,txs_2 = "magic.wdf"
	}
	Texiaoku["娉婷袅娜"]={
		txs_1 = 1124767398
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_娉婷袅娜"]={
		txs_1 = 1980464087
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_百毒不侵"]={
		txs_1 = 0x860E67C9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_一笑倾城"]={
		txs_1 = 0x1350671f
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_淬芒"]={
		txs_1 = 1624944035
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["满天花雨"]={
		txs_1 = 0x253c9538
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["似玉生香"]={
		txs_1 = 1187493750
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·似玉生香·噬魂"]={
		txs_1 = 1187493750
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·似玉生香·钻心"]={
		txs_1 = 1187493750
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·似玉生香·刻骨"]={
		txs_1 = 1187493750
		,txs_2 = "magic.wdf"
	}
	Texiaoku["碎玉弄影"]={
		txs_1 = 1187493750
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_侵蚀·似玉生香·噬魂"]={
		txs_1 = 0x59D77EF9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·似玉生香·刻骨"]={
		txs_1 = 0x59D77EF9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·似玉生香·钻心"]={
		txs_1 = 0x59D77EF9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_似玉生香"]={
		txs_1 = 0x59D77EF9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_碎玉弄影" ]={
		txs_1 = 0x59D77EF9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["楚楚可怜"]={
		txs_1 = 405595707
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_楚楚可怜"]={
		txs_1 = 1923968442
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["移形换影"]={
		txs_1 = 1963789198
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_如花解语"]={
		txs_1 = 505084121
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_莲步轻舞"]={
		txs_1 = 3387695093
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["如花解语"]={
		txs_1 = 2319038367
		,txs_2 = "magic.wdf"
	}
	Texiaoku["莲步轻舞"]={
		txs_1 = 2556614190
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雨落寒沙_敌方"]={
		txs_1 = 0x303AA671
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雨落寒沙_我方"]={
		txs_1 = 0x665F869A
		,txs_2 = "magic.wdf"
	}
	Texiaoku["鸿渐于陆_敌方"]={
		txs_1 = 2822397861
		,txs_2 = "magic.wd1"
	}
	Texiaoku["鸿渐于陆_我方"]={ --要做反方向
		txs_1 = 2822397861
		,txs_2 = "magic.wd1"
	}
	Texiaoku["月下霓裳"]={
		txs_1 = 3808354120
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_月下霓裳"]={
		txs_1 = 0x400392AD
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_自矜"]={
		txs_1 = 0x4F116543
		,txs_2 = "waddon.wdf"
	--方寸山======================================================
	}
	Texiaoku["新_落魄符" ]={
		txs_1 = 0xb008ac11
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_碎甲术" ]={
		txs_1 = 0x116c932
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_失心符" ]={
		txs_1 = 0x89b2d33a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_五雷咒" ]={
		txs_1 = 0x5bcbb64f
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·五雷咒·钻心" ]={
		txs_1 = 0x5bcbb64f
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·五雷咒·噬魂" ]={
		txs_1 = 0x5bcbb64f
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·五雷咒·刻骨" ]={
		txs_1 = 0x5bcbb64f
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_催眠符" ]={
		txs_1 = 0xb8e57120
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_失忆符" ]={
		txs_1 = 0xb073119d
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_失魂符" ]={
		txs_1 = 0x2406da40
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·失魂符·刻骨" ]={
		txs_1 = 0x2406da40
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·失魂符·钻心" ]={
		txs_1 = 0x2406da40
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·失魂符·噬魂" ]={
		txs_1 = 0x2406da40
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_定身符" ]={
		txs_1 = 0x8485b3e2
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_落雷符" ]={
		txs_1 = 0xc1731a60
		,txs_2 ="common/magic.wdf"

	}
	Texiaoku["新_分身术"]={
		txs_1 = 0x4b9aca92
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["分身术"]={
		txs_1 = 0x4b9aca92
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["失忆符"]={
		txs_1 = 3567923082
		,txs_2 = "magic.wdf"
	}
	Texiaoku["催眠符"]={
		txs_1 = 2663408206
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_失忆符"]={
		txs_1 = 0xEB3D0AC1
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["落魄符"]={
		txs_1 = 1337287235
		,txs_2 = "magic.wdf"
	}
	Texiaoku["离魂符"]={
		txs_1 = 421114130
		,txs_2 = "magic.wdf"
	}
	Texiaoku["飞符炼魂"]={
		txs_1 = 0xC1731A60
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_不灭"]={
		txs_1 = 0xEC3149BB
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["钟馗论道"]={
		txs_1 = 636570206
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_钟馗论道"]={
		txs_1 = 0xDCCB25E2
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["顺势而为"]={
		txs_1 = 0x3b86b284
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_顺势而为"]={
		txs_1 = 0xA38D10BD
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_摧心"]={
		txs_1 = 0xBFC4004F
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_追魂符"]={
		txs_1 = 3655438388
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["追魂符"]={
		txs_1 = 3556918902
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_离魂符"]={
		txs_1 = 152755655
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_定身符"]={
		txs_1 = 2461182746
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_失心符"]={
		txs_1 = 3635978625
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_炼魂"]={ --方寸山
		txs_1 = 2272115910
		,txs_2 = "magic.wdf"
	}
	Texiaoku["定身符"]={
		txs_1 = 3729668740
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_催眠符"]={
		txs_1 = 3398426285
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["失心符"]={
		txs_1 = 152755655
		,txs_2 = "magic.wdf"
	}
	Texiaoku["乙木仙遁"]={
		txs_1 = 1829610500
		,txs_2 = "magic.wdf"
	}
	Texiaoku["落雷符"]={
		txs_1 = 3245546080--0x5BCBB64F
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["五雷咒"]={
		txs_1 = 947658475
		,txs_2 = "magic.wdf"
	}
	Texiaoku["归元咒" ]={
		txs_1 = 0x517656E2
		,txs_2 = "magic.wdf"
  	}
  	Texiaoku["乾天罡气"]={
		txs_1 = 0x144AF3F8
		,txs_2 = "magic.wdf"
	}
	Texiaoku["失魂符"]={
		txs_1 = 0x7BCD8BC0
		,txs_2 = "magic.wdf"
	}
	Texiaoku["碎甲符"]={
		txs_1 = 0xC27C1229
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_碎甲符"]={
		txs_1 = 753013566
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_失魂符"]={
		txs_1 = 0x8B43833D
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·失魂符·刻骨"]={
		txs_1 = 0x8B43833D
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·失魂符·钻心"]={
		txs_1 = 0x8B43833D
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·失魂符·噬魂"]={
		txs_1 = 0x8B43833D
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_失心符"]={
		txs_1 = 0x8B43833D
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["否极泰来"]={
		txs_1 = 2651211088
		,txs_2 = "magic.wdf"
	}
	Texiaoku["电光火石"]={
		txs_1 = 0x6044e21a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["三星灭魔"]={
		txs_1 = 0x4850F165
		,txs_2 = "magic.wdf"
	}
	Texiaoku["凝神术"]={
		txs_1 = 0x5175d5ff
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_凝神术"]={
		txs_1 = 0xc2472120
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_落魄符"]={
		txs_1 = 2461182746
		,txs_2 = "waddon.wdf"

	}
	Texiaoku["渡劫_落魄符"]={
		txs_1 = 0xac38f5bf
		,txs_2 = "magic.wdf"
	}
	Texiaoku["渡劫_催眠符"]={
		txs_1 = 0xea764d45
		,txs_2 = "magic.wdf"
	--天宫======================================================
	}
	Texiaoku["新_天雷斩"]={
		txs_1 = 0xf17168c5
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_五雷轰顶" ]={
		txs_1 = 0x6044e21a
		,txs_2 ="common/magic.wdf"
	}
		Texiaoku["侵蚀·五雷轰顶·刻骨" ]={
		txs_1 = 0x6044e21a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·五雷轰顶·噬魂" ]={
		txs_1 = 0x6044e21a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·五雷轰顶·钻心" ]={
		txs_1 = 0x6044e21a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_雷霆万钧"]={
		txs_1 = 0x911e3921
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·雷霆万钧·噬魂"]={
		txs_1 = 0x911e3921
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·雷霆万钧·钻心"]={
		txs_1 = 0x911e3921
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·雷霆万钧·刻骨"]={
		txs_1 = 0x911e3921
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_雷霆汹涌"]={
		txs_1 = 0x911e3921
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_镇妖" ]={
		txs_1 = 0x14965928
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_错乱" ]={
		txs_1 = 0x8d302ce0
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_百万神兵" ]={
		txs_1 = 0x65955666
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["百万神兵"]={
		txs_1 = 2340755185
		,txs_2 = "magic.wdf"
	}
	Texiaoku["五雷轰顶"]={
		txs_1 = 4292234442
		,txs_2 = "magic.wdf"
	}
	Texiaoku["天神护体"]={
		txs_1 = 3231493430
		,txs_2 = "magic.wdf"

	}
	Texiaoku["掌心雷"]={
		txs_1 = 1740847269
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_掌心雷"]={
		txs_1 = 1740847269
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["雷霆万钧"]={
		txs_1 = 664467571
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雷霆汹涌"]={
		txs_1 = 664467571
		,txs_2 = "magic.wdf"
	}
	Texiaoku["风雷韵动"]={
		txs_1 = 2858312535
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_百万神兵"]={
		txs_1 = 3297426043
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_趁虚"]={
		txs_1 = 3394181829
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["错乱"]={
		txs_1 = 0xd35fc051
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_错乱"]={
		txs_1 = 0x2f78c46e
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["天雷斩"]={
		txs_1 = 3054771897
		,txs_2 = "addon.wdf"
	}
	Texiaoku["风雷斩·飞霆"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["风雷斩"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["风雷斩·霹雳"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["侵蚀·风雷斩·霹雳·刻骨"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["侵蚀·风雷斩·霹雳·噬魂"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["侵蚀·风雷斩·霹雳·钻心"]={
		txs_1 = 443919324
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["天雷灌注"]={
		txs_1 = 0x79C39027
		,txs_2 = "zztx.wdf"
    }
    Texiaoku["状态_天雷灌注"]={
		txs_1 = 0x79C39027
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["镇妖"]={
		txs_1 = 0xf70412c7
		,txs_2 = "magic.wdf"
  	}
  	Texiaoku["状态_镇妖"]={
		txs_1 = 0x98753F94
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["腾云驾雾"]={
		txs_1 = 871130409
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_天神护体"]={
		txs_1 = 1724676649
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["电刑"]={
		txs_1 = 0x51EEBFF3
		,txs_2 = "magic.wdf"
	}
	Texiaoku["宁心"]={
		txs_1 = 0xa72fdb18
		,txs_2 = "magic.wdf"
	}
	Texiaoku["鸣雷诀"]={
		txs_1 = 3686610267
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_鸣雷诀"]={
		txs_1 = 0x67C338A5
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["天诛地灭"]={
		txs_1 = 0xE4A2B66E
		,txs_2 = "magic.wdf"
	}
	Texiaoku["知己知彼"]={
		txs_1 = 0x1be628f9
		,txs_2 = "magic.wdf"
	}
	Texiaoku["金刚镯"]={
		txs_1 = 0x4B7E9179
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_金刚镯"]={
		txs_1 = 0x4B7E9179
		,txs_2 = "magic.wdf"
	}
	Texiaoku["画地为牢"]={
		txs_1 = 0x0E24875A
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_画地为牢"]={
		txs_1 = 0xDC6AE6D7
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["霹雳弦惊"]={
		txs_1 = 120282774
		,txs_2 = "zztx.wdf" --唯美
	}
	Texiaoku["状态_霹雳弦惊"]={
		txs_1 = 120282774
		,txs_2 = "zztx.wdf" --唯美
	}
	Texiaoku["状态_轰鸣"]={
		txs_1 = 0xFAF4A2D4
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_电芒"]={
		txs_1 = 0x6ECA8405
		,txs_2 = "waddon.wdf"
	--普陀山=======================================================
	}
	Texiaoku["新_普渡众生" ]={
		txs_1 = 0x3d0c6ff1
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_巨岩破" ]={
		txs_1 = 0xc4fabe4c
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·巨岩破·刻骨" ]={
		txs_1 = 0xc4fabe4c
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·巨岩破·噬魂" ]={
		txs_1 = 0xc4fabe4c
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·巨岩破·钻心" ]={
		txs_1 = 0xc4fabe4c
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·五行攻击·刻骨"]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·五行攻击·钻心"]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·五行攻击·噬魂"]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["新_靛沧海" ]={
		txs_1 = 0x64a39819
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·靛沧海·刻骨" ]={
		txs_1 = 0x64a39819
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·靛沧海·噬魂" ]={
		txs_1 = 0x64a39819
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·靛沧海·钻心" ]={
		txs_1 = 0x64a39819
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_地裂火" ]={
		txs_1 = 0xdc603fbe
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·地裂火·刻骨" ]={
		txs_1 = 0xdc603fbe
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·地裂火·噬魂" ]={
		txs_1 = 0xdc603fbe
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·地裂火·钻心" ]={
		txs_1 = 0xdc603fbe
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_苍茫树" ]={
		txs_1 = 0x2dee722a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·苍茫树·刻骨" ]={
		txs_1 = 0x2dee722a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·苍茫树·噬魂" ]={
		txs_1 = 0x2dee722a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·苍茫树·钻心" ]={
		txs_1 = 0x2dee722a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_日光华" ]={
		txs_1 = 0x46038131
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·日光华·刻骨" ]={
		txs_1 = 0x46038131
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·日光华·噬魂" ]={
		txs_1 = 0x46038131
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·日光华·钻心" ]={
		txs_1 = 0x46038131
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_紧箍咒" ]={
		txs_1 = 0x1ea5facc
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_灵动九天" ]={
		txs_1 = 0x9ccb0f3
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_自在心法" ]={ --旧版没有
		txs_1 = 0xd6bf55ad
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["巨岩破"]={
		txs_1 = 0xBBE9480B
		,txs_2 = "magic.wdf"
	}
	Texiaoku["苍茫树"]={
		txs_1 = 2630577796
		,txs_2 = "magic.wdf"
	}
	Texiaoku["坐莲"]={
		txs_1 = 1915810093
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_紧箍咒"]={
		txs_1 = 4024909497
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_清净"]={
		txs_1 = 2326697460
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["普渡众生"]={
		txs_1 = 804734328
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_颠倒五行"]={
		txs_1 = 0x4ddf5690
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["日光华"]={
		txs_1 = 1170905363
		,txs_2 = "magic.wdf"
	}
	Texiaoku["地裂火"]={
		txs_1 = 417414121
		,txs_2 = "magic.wdf"
	}
	Texiaoku["紧箍咒"]={
		txs_1 = 1417725769
		,txs_2 = "magic.wdf"
	}
	Texiaoku["杨柳甘露"]={
		txs_1 = 939734977
		,txs_2 = "magic.wdf"
	}
	Texiaoku["靛沧海"]={
		txs_1 = 1818198902
		,txs_2 = "magic.wdf"
	}
	Texiaoku["颠倒五行"]={
		txs_1 = 923673984
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_普渡众生" ]={
		txs_1 = 0xD8857128
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["灵动九天" ]={
		txs_1 = 0x3fca8c5a
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_灵动九天" ]={
		txs_1 = 0x95FF4460
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["清静菩提"]={
		txs_1 = 1458710428
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["清静菩提1"]={
		txs_1 = 1772528793
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["清静菩提2"]={
		txs_1 = 1326525003
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["自在心法"]={
		txs_1 = 0x77592664
		,txs_2 = "magic.wdf"
	}
	Texiaoku["五行错位"]={
		txs_1 = 0x5A07D50A
		,txs_2 = "magic.wdf"
	}
	Texiaoku["波澜不惊"]={
		txs_1 = 0x842506A0
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_波澜不惊"]={
		txs_1 = 0x042B06AC
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["莲心剑意"]={
		txs_1 = 0x88f19652
		,txs_2 = "magic.wd1"
	}
	Texiaoku["剑意莲心"]={
		txs_1 = 0x88f19652
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_莲心剑意"]={
		txs_1 = 756967567
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_剑意莲心"]={
		txs_1 = "2D1E688F"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["状态_五行珠1"]={
		txs_1 = 1595299390
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠2"]={
		txs_1 = 4187782846
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠3"]={
		txs_1 = 158224804
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠4"]={
		txs_1 = 1742019430
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠5"]={
		txs_1 = 2760108334
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_五行珠6"]={
		txs_1 = 3164645496
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["莲花心音"]={
		txs_1 = 0xfe0b5253
		,txs_2 = "magic.wd1"
	}
	Texiaoku["五行制化"]={
		txs_1 = 923673984
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_五行制化"]={
		txs_1 = 0x4ddf5690
		,txs_2 = "waddon.wdf"
	--龙宫======================================================
	}
	Texiaoku["新_龙卷雨击" ]={-- 全屏
		txs_1 = 2711530289
		,txs_2 ="magic.wdf"
	}
	Texiaoku["新_龙腾" ]={
		txs_1 = 0x3887b377
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_龙吟" ]={ -- 全屏
		txs_1 = 0x48639cf5
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_二龙戏珠" ]={
		txs_1 = 0x36262006
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["龙卷雨击"]={
		txs_1 = 2711530289
		,txs_2 = "magic.wdf"
	}
	Texiaoku["龙卷雨击1"]={
		txs_1 = 3911640280
		,txs_2 = "magic.wdf"
	}
	Texiaoku["龙卷雨击2"]={
		txs_1 = 3592299801
		,txs_2 = "magic.wdf"
	}
	Texiaoku["龙卷雨击3"]={
		txs_1 = 3514247917
		,txs_2 = "magic.wdf"
	}
	Texiaoku["龙卷雨击4"]={
		txs_1 = 3592299801
		,txs_2 = "magic.wdf"
	}
	Texiaoku["龙卷雨击5"]={
		txs_1 = 1459200517
		,txs_2 = "magic.wdf"
   	}
   	Texiaoku["龙吟2"]={--
	 	txs_1 = 0x5EC2D5BB
	 	,txs_2 = "magic.wdf"
	}
	Texiaoku["龙吟4"]={--
	 	txs_1 = 0x63605C8D
	 	,txs_2 = "magic.wdf"
	}
	Texiaoku["龙吟6"]={--
	 	txs_1 = 1223639089
	 	,txs_2 = "magic.wdf"
	}
	Texiaoku["龙吟7"]={--
	 	txs_1 = 1808454617
	 	,txs_2 = "magic.wdf"
	}
	Texiaoku["龙腾"]={
		txs_1 = 1936174863
		,txs_2 = "magic.wdf"
	}
	Texiaoku["潜龙在渊"]={
		txs_1 = 0x0A267208
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["亢龙归海"]={
		txs_1 = 0xBC74AD7F
		,txs_2 = "magic.wd1"
    }
    Texiaoku["亢龙归海2"]={
		txs_1 = 0x2BE88265
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_亢龙归海"]={
		txs_1 = 0x56E05B32
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_天命剑法"]={
		txs_1 = 0x56E05B32
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["水遁"]={
		txs_1 = 1280017893
		,txs_2 = "magic.wdf"
	}
	Texiaoku["二龙戏珠"]={
		txs_1 = 2793449505
		,txs_2 = "magic.wdf"
	}
	Texiaoku["神龙摆尾"]={
		txs_1 = 2759396577
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_神龙摆尾"]={
		txs_1 = 0xF184BD59
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["龙吟"]={
		txs_1 = 1667259533
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_乘风破浪"]={
		txs_1 = 3366209335
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_逆鳞"]={
		txs_1 = 4066099146
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["解封"]={
		txs_1 = 1833750106
		,txs_2 = "magic.wdf"
	}
	Texiaoku["乘风破浪"]={
		txs_1 = 1172493695
		,txs_2 = "magic.wdf"
	}
	Texiaoku["清心"]={
		txs_1 = 822452251
		,txs_2 = "magic.wdf"
	}
	Texiaoku["逆鳞"]={
		txs_1 = 81488906
		,txs_2 = "magic.wdf"
	}
	Texiaoku["龙战于野"]={
		txs_1 = 4102286099
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_龙战于野"]={
		txs_1 = 1288547531
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_裂魂"]={
		txs_1 = 0x13B05A29
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["状态_侵蚀"]={
		txs_1 = 0x7E967A29
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_天龙" ]={
		txs_1 =0xcb81bced
		,txs_2 ="waddon.wdf"
	}
	Texiaoku["亢龙归海"]={
		txs_1 = 0x2ED86FD0
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["雷浪穿云"]={
		txs_1 = 1640234856
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_雷浪穿云"]={
		txs_1 = 82552545
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["龙啸九天"]={
		txs_1 = 0x20D80D98
		,txs_2 = "magic.wdf"
	--五庄观=====================================================
	}
	Texiaoku["新_日月乾坤" ]={
		txs_1 = 0x2c2da419
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·日月乾坤·刻骨" ]={
		txs_1 = 0x2c2da419
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·日月乾坤·噬魂" ]={
		txs_1 = 0x2c2da419
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·日月乾坤·钻心" ]={
		txs_1 = 0x2c2da419
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_炼气化神" ]={
		txs_1 = 0x1cfe70fa
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_生命之泉" ]={
		txs_1 = 0x7c7d67a6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_烟雨剑法" ]={
		txs_1 = 0xa3fd9577
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·烟雨剑法·刻骨" ]={
		txs_1 = 0xa3fd9577
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·烟雨剑法·噬魂" ]={
		txs_1 = 0xa3fd9577
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·烟雨剑法·钻心" ]={
		txs_1 = 0xa3fd9577
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_飘渺式" ]={
		txs_1 = 0x66bebcba
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["烟雨剑法"]={
		txs_1 = 3496024499
		,txs_2 = "magic.wdf"
	}
	Texiaoku["飘渺式"]={
		txs_1 = 3496024499
		,txs_2 = "magic.wdf"
	}
	Texiaoku["敲金击玉"]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·敲金击玉·刻骨" ]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·敲金击玉·噬魂" ]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·敲金击玉·钻心" ]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["金击式"]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["落土止息"]={
		txs_1 = 2751336734
		,txs_2 = "magic.wdf"
	}
	Texiaoku["心随意动"]={
		txs_1 = 741188633
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_心随意动"]={
		txs_1 = 0x549F4D24
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["炼气化神"]={
		txs_1 = 910697598
		,txs_2 = "magic.wdf"
	}
	Texiaoku["日月乾坤"]={
		txs_1 = 2802651747
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_蓝灯"]={
		txs_1 = 1906144895
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_炼气化神"]={
		txs_1 = 1906144895
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_生命之泉"]={
		txs_1 = 4176381242
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_红灯"]={
		txs_1 = 4176381242
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_骤雨1"]={
		txs_1 = "AABBCC01"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["状态_骤雨2"]={
		txs_1 = "AABBCC02"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["状态_骤雨3"]={
		txs_1 = "AABBCC03"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["状态_日月乾坤"]={
		txs_1 = 826002553
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·日月乾坤·钻心"]={
		txs_1 = 826002553
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·日月乾坤·噬魂"]={
		txs_1 = 826002553
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·日月乾坤·刻骨"]={
		txs_1 = 826002553
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["三花聚顶"]={
		txs_1 = 2002768611
		,txs_2 = "magic.wdf"
	}
	Texiaoku["生命之泉"]={
		txs_1 = 3537672915
		,txs_2 = "magic.wdf"
	}
	Texiaoku["斗转星移"]={
		txs_1 = 1056770863
		,txs_2 = "magic.wdf"
	}
	Texiaoku["驱魔"]={
		txs_1 = 0x726AC447
		,txs_2 = "magic.wdf"
	}
	Texiaoku["驱尸"]={
		txs_1 = 0x726AC447
		,txs_2 = "magic.wdf"
	}
	Texiaoku[ "状态_驱魔"]={
		txs_1 = 0xE89A19DF
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["同伤式"]={
		txs_1 = 4060043784
		,txs_2 = "magic.wdf"
	}
	Texiaoku["天地同寿"]={
		txs_1 = 569725183
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_天地同寿"]={
		txs_1 = 3067025739
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["乾坤妙法"]={
		txs_1 = 0x184AA512
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_乾坤妙法"]={
		txs_1 = 0x7F842CEF
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["太极生化"]={
		txs_1 = 0X14E3155E
		,txs_2 = "magic.wdf"
	}
	Texiaoku["清风望月"]={
		txs_1 = 3819755622
		,txs_2 = "magic.wd1"
	}
	Texiaoku["天命剑法"]={
		txs_1 = 0x3426ACE0
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_人参果1" ]={ -- 1层
		txs_1 = "3470E85A"
		,txs_2 ="mgtx.wdf"
	}
	Texiaoku["状态_人参果2" ]={ -- 2层
		txs_1 = "3470E85B"
		,txs_2 ="mgtx.wdf"
	}
	Texiaoku["状态_人参果3" ]={ -- 3层-6层
		txs_1 = "3470E85D"
		,txs_2 ="mgtx.wdf"
	--狮驼岭=========================================================
	}
	Texiaoku["新_象形" ]={
		txs_1 = 0x73da1ccf
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_狮搏" ]={
		txs_1 = 0x96766a8
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_鹰击" ]={
		txs_1 = 2194212682
		,txs_2 ="magic.wdf"
	}
	Texiaoku["侵蚀·鹰击·刻骨" ]={
		txs_1 = 2194212682
		,txs_2 ="magic.wdf"
	}
	Texiaoku["侵蚀·鹰击·钻心" ]={
		txs_1 = 2194212682
		,txs_2 ="magic.wdf"
	}
	Texiaoku["侵蚀·鹰击·噬魂" ]={
		txs_1 = 2194212682
		,txs_2 ="magic.wdf"
	}
	Texiaoku["新_变身" ]={
		txs_1 = 0xb361fa6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_连环击" ]={
		txs_1 = 0x6ad55205
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["威慑"]={
		txs_1 = 2222331931
		,txs_2 = "magic.wdf"
	}
	Texiaoku["困兽之斗"]={
		txs_1 = 1436323535
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_威慑"]={
		txs_1 = 553438868
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_象形"]={
		txs_1 = 0x3646A4D9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_冰冻"]={
		txs_1 = 0x3646A4D9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_象形（休息）"]={
		txs_1 = 1457543986
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_定心术"]={
		txs_1 = 1724676649
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["定心术"]={
		txs_1 = 0x2D07CCEC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["变身"]={
		txs_1 = 0x29d819df
		,txs_2 = "magic.wdf"
	}
	Texiaoku["狂怒"]={
		txs_1 = 0x29d819df
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_变身"]={
		txs_1 = 0x29d819df
		,txs_2 = "magic.wdf"
	}
	Texiaoku["鹰击"]={
		txs_1 = 2758000725
		,txs_2 = "magic.wdf"
	}
	Texiaoku["渡劫_鹰击"]={
		txs_1 = 0x91109049
		,txs_2 = "magic.wdf"
	}
	Texiaoku["狮搏"]={
		txs_1 = 0x688ea54b
		,txs_2 = "magic.wdf"
	}
	Texiaoku["天魔解体"]={
		txs_1 = 0xD20E78BF
		,txs_2 = "magic.wdf"
	}
	Texiaoku["极度疯狂"]={
		txs_1 = 1904694434
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_极度疯狂"]={
		txs_1 = 0xBBEA83F4
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_象形"]={
		txs_1 = 0x3646A4D9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["连环击"]={
		txs_1 = 1441516140
		,txs_2 = "addon.wdf"
	}
	Texiaoku["状态_连环击"]={
		txs_1 = 0x58628406
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["振翅千里"]={
		txs_1 = 2661053669
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["象形"]={
		txs_1 = 3188881443
		,txs_2 = "magic.wdf"
	}
	Texiaoku["BOSS绝杀"]={
		txs_1 = 3188881443
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_鹰击" ]={
		txs_1 = 0x58628406
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["疯狂鹰击"]={
		txs_1 = 2197949870
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_天魔解体"]={
		txs_1 = 0x718754A2
		,txs_2 = "magic.wdf"
	}--
	Texiaoku["状态_魔息术"]={
	-- 	txs_1 = 358377736
	-- 	,txs_2 = "waddon.wdf"
	}
	Texiaoku["魔息术"]={
		txs_1 = 1538345049
		,txs_2 = "magic.wdf"
	}--
	Texiaoku["状态_魔息术"]={
	-- 	txs_1 = 0xA8D0CA5A
	-- 	,txs_2 = "waddon.wdf"
	}
	Texiaoku["背水"]={
		txs_1 = 0x0B361FA6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["魔兽啸天"]={
		txs_1 = 0x42F0386F
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_爪印"]={
		txs_1 = 0xa5d7b0f7
		,txs_2 = "waddon.wdf"
     }
	--魔王寨=================================================== 1303803520

	Texiaoku["新_飞砂走石"]={
		 txs_1 = 0x4DB67680
		,txs_2 = "nvdi1.wdf"
	}
	Texiaoku["新_三昧真火"]={
		 txs_1 = 0x774b7cef
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["秘传三昧真火"]={
		 txs_1 = 0x774b7cef
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["秘传飞砂走石"]={
		 txs_1 = 0x47fe2cc6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["魔焰滔天"]={
		 txs_1 = 0x774b7cef
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_牛劲" ]={
		 txs_1 = 0x9f9f85ef
		,txs_2 ="common/magic.wdf"
	}
	-- Texiaoku["新_风云变色" ]={
	-- 	txs_1 = 0x47fe2cc6
	-- 	,txs_2 ="nvdi1.wdf"
	-- }
	Texiaoku["飞砂走石2"]={
		 txs_1 = 0x49CBD108
		,txs_2 = "magic.wdf"
	}
	Texiaoku["飞砂走石1"]={
		 txs_1 = 0x2ABF191D
		,txs_2 = "magic.wdf"
	}
	Texiaoku["牛屎遁"]={
		 txs_1 = 2938873934
		,txs_2 = "magic.wdf"
	}
	Texiaoku["烈火真言"]={
		 txs_1 = 709640088
		,txs_2 = "magic.wdf"
	}
	Texiaoku["魔王回首"]={
		 txs_1 = 0x16B27FFC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_魔王回首"]={
		 txs_1 = 0xBBEA83F4
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["三昧真火"]={
		 txs_1 = 0xFCDCCCEC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["牛劲"]={
		 txs_1 = 0x26F090BE
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_牛劲"]={
		 txs_1 = 0xa168e26f
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["威仪九霄"]={
		 txs_1 = 0x752464D7
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_威仪九霄"]={
		 txs_1 = 0x32D3023F
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_雷法·倒海"]={    ---24F5813C
		 txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_雷法·翻天"]={    ---24F5813C
		 txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_雷法·轰天"]={    ---24F5813C
		 txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_雷法·坤伏"]={    ---24F5813C
		 txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_雷法·震煞"]={    ---24F5813C
		 txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雷法·震煞"]={    ---24F5813C
		 txs_1 = 0x178C114C
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雷法·坤伏"]={    ---24F5813C
		txs_1 = 0x20D80D98
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雷法·崩裂"]={    ---24F5813C
		txs_1 = 0x22A3D764
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雷法·轰天"]={    ---24F5813C
		txs_1 = 0x2A997658
		,txs_2 = "magic.wdf"
	}
	Texiaoku["雷法·倒海"]={    ---24F5813C
		txs_1 = 0x3D74BE12
		,txs_2 = "magic.wdf"
	}
	Texiaoku["五雷正法"]={    ---24F5813C
		txs_1 = 0x885ACBE1
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·五雷正法·刻骨"]={    ---24F5813C
		txs_1 = 0x885ACBE1
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·五雷正法·噬魂"]={    ---24F5813C
		txs_1 = 0x885ACBE1
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·五雷正法·钻心"]={    ---24F5813C
		txs_1 = 0x885ACBE1
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_雷法·崩裂"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
		Texiaoku["雷法·翻天"]={    ---24F5813C
		txs_1 = 0xAF2BA84E
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_符咒"]={    ---24F5813C
		txs_1 = 0x9E064550
		,txs_2 = "magic.wdf"
	}
	Texiaoku["天眼神通"]={
		txs_1 = 0x3EFD0B2F
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_天眼神通"]={
		txs_1 = 0x2D07CCEC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["耳目一新"]={
		txs_1 = 0x552562B8
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_耳目一新"]={
		txs_1 = 0x6BCAD3D9
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_天眼"]={
		txs_1 = 0x2D07CCEC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_怒眼"]={
		txs_1 = 0x2D07CCEC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_智眼"]={
		txs_1 = 0x2D07CCEC
		,txs_2 = "magic.wdf"
	}
	Texiaoku["风火燎原"]={
		txs_1 = 0x2691C760
		,txs_2 ="magic.wdf"
	}
	Texiaoku["状态_风火燎原"]={
		txs_1 = 0x7E967A29
		,txs_2 = "magic.wdf"
	}
	Texiaoku["火甲术" ]={
		txs_1 = 0x4B621DF7
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_火甲术" ]={
		txs_1 = 0x82D17DF8
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["魔火焚世"]={
		txs_1 = 4141959174
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["状态_蚀天" ]={
		txs_1 = 2941176306
		,txs_2 ="waddon.wdf"

	}
	Texiaoku["摇头摆尾"]={
		txs_1 = 0x8b036de8
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_摇头摆尾"]={
		txs_1 = 0x59322dba
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["无敌牛妖"]={
		txs_1 = 0x2AEB8662
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["琴音三叠1"]={
		txs_1 = 0xAB6FAC02
		,txs_2 = "wzife.wd5"
	}
	Texiaoku["琴音三叠2"]={
		txs_1 = 0xAB6FAC03
		,txs_2 = "wzife.wd5"
	}
	Texiaoku["琴音三叠3"]={
		txs_1 = 0xAB6FAC04
		,txs_2 = "wzife.wd5"
	}
	Texiaoku["状态_无敌牛妖"]={
		txs_1 = 0xA168E26F
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["无敌牛虱"]={
		txs_1 = 0x2AEB8662
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_无敌牛虱"]={
		txs_1 = 0xA168E26F
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["踏山裂石" ]={
		txs_1 = 0xA68B3211
		,txs_2 = "magic.wdf"
	}
	Texiaoku["烈焰真诀"]={
		txs_1 = 0x434750de
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_烈焰真诀"]={
		txs_1 = 0x411c5d82
		,txs_2 = "waddon.wdf"
	--阴曹地府==================================================
	}
	Texiaoku["新_阎罗令" ]={
		txs_1 = 0x280ac7b
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_判官令" ]={
		txs_1 = 0x2711a4a3
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_尸腐毒" ]={
		txs_1 = 0x3c172efa
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_黄泉之息" ]={ --旧版没有
		txs_1 = 0x1adabfa6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_锢魂术" ]={
		txs_1 = 0xfb076de
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·幽夜无明·刻骨" ]={
		txs_1 = 0xfb076de
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·幽夜无明·噬魂" ]={
		txs_1 = 0xfb076de
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·幽夜无明·钻心" ]={
		txs_1 = 0xfb076de
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_魂飞魄散" ]={ --旧版没有
		txs_1 = 0xaff3afbd
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["尸腐毒"]={
		txs_1 = 0x849e48fb
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_尸腐毒"]={
		txs_1 = 2208088730
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["杳无音讯"]={
		txs_1 = 2709550029
		,txs_2 = "magic.wdf"
	}
	Texiaoku["百鬼噬魂"]={
		txs_1 = 3077923808
		,txs_2 =  "zztx.wdf"
	}
	Texiaoku["无赦咒令"]={
		txs_1 = 3077923808
		,txs_2 =  "zztx.wdf"
	}
	Texiaoku["血影蚀心"]={
		txs_1 = 3077923808
		,txs_2 =  "zztx.wdf"
	}
	Texiaoku["生杀予夺"]={
		txs_1 = 517566176--3077923808
		,txs_2 =  "zztx.wdf"
	}
	Texiaoku["森罗迷瘴"]={
		txs_1 = 3077923808
		,txs_2 =  "zztx.wdf"
	}
	Texiaoku["状态_森罗迷瘴"]={
		txs_1 = 2676050255
		,txs_2 =  "waddon.wdf"
	}
	Texiaoku["阎罗令"]={
		txs_1 = 2662404697
		,txs_2 = "magic.wdf"
	}
	Texiaoku["阎罗拘魂"]={
		txs_1 = 2662404697
		,txs_2 = "magic.wdf"
	}
	Texiaoku["判官令"]={
		txs_1 = 605841034
		,txs_2 = "magic.wdf"
	}
	Texiaoku["幽冥鬼眼"]={
		txs_1 = 0x21435203
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_幽冥鬼眼"]={
		txs_1 = 0x21435203
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["还阳术"]={
		txs_1 = 2391977602
		,txs_2 = "magic.wdf"
	}
	Texiaoku["锢魂术"]={
		txs_1 = 3761188461
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_锢魂术"]={
		txs_1 = 2523841483
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·幽夜无明·刻骨"]={
		txs_1 = 2523841483
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·幽夜无明·噬魂"]={
		txs_1 = 2523841483
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_侵蚀·幽夜无明·钻心"]={
		txs_1 = 2523841483
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["寡欲令"]={
		txs_1 = 0xFDE4BF24
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_寡欲令"]={
		txs_1 = 0xE89A19DF
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["无间地狱"]={
		txs_1 = 2289147609
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["无间地狱2"]={
		txs_1 = 1934115845
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["修罗隐身"]={
		txs_1 = 0xBA7D5CD7
		,txs_2 = "magic.wdf"
	}
	Texiaoku["魂飞魄散"]={
		txs_1 = 0xDF5559A5
		,txs_2 = "magic.wdf"
	}
	Texiaoku["黄泉之息"]={
		txs_1 = 0x2611e02e
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_黄泉之息"]={
		txs_1 = 0x61CB13B5
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["冤魂不散"]={
		txs_1 = 0xFA8837EE
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_汲魂"]={
		txs_1 = 0xDF5559A5
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["魍魉追魂"]={
		txs_1 = 4190367348
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_魍魉追魂"]={
		txs_1 = 2682204630
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["六道无量"]={
		txs_1 = 2533814586
		,txs_2 = "magic.wd1"
	}
	Texiaoku["噬毒"]={
		txs_1 = 489814232
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_噬毒"]={
		txs_1 = 4233569361
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["百爪狂杀" ]={
		txs_1 = 4024420829
		,txs_2 = "magic.wd1"
	}
	Texiaoku["遁地术"]={
		txs_1 = 3356723242
		,txs_2 = "magic.wdf"
	}
	--盘丝洞====================================================
	Texiaoku["侵蚀·魔化万灵·钻心"]={
		txs_1 = 0xb1a504b7
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_侵蚀·魔化万灵·钻心"]={
		txs_1 = 4233569361
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["侵蚀·幻魇谜雾·噬魂"]={
		txs_1 = 0xb1a504b7
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_侵蚀·幻魇谜雾·噬魂"]={
		txs_1 = 4233569361
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["侵蚀·幻魇谜雾·刻骨"]={
		txs_1 = 0xb1a504b7
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_侵蚀·幻魇谜雾·刻骨"]={
		txs_1 = 4233569361
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["新_勾魂" ]={
		txs_1 = 0x1c57da8a
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_摄魄" ]={
		txs_1 = 0xb1a504b7
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_魔音摄魂" ]={
		txs_1 = 0x85e6ae55
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_含情脉脉" ]={
		txs_1 = 0xceaf0e44
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_天罗地网" ]={
		txs_1 = 0x60af6327
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_姐妹同心" ]={ --旧版没有
		txs_1 = 0x42ed98b8
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["姐妹同心" ]={ --旧版没有
		txs_1 = 0x29faebad
		,txs_2 ="magic.wdf"
	}
	Texiaoku["夺命蛛丝"]={
		txs_1 = 0x7CD9C342
		,txs_2 = "magic.wdf"
	}
	Texiaoku["瘴气"]={
		txs_1 = 0xba6fc6c2
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_瘴气"]={
		txs_1 = 219992550--0xd1cd1e6
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["天罗地网"]={
		txs_1 = 513152598
		,txs_2 = "magic.wdf"
   	}
   	Texiaoku["状态_天罗地网"]={
		txs_1 = 0x8F3E73D5
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["天蚕丝"]={
		txs_1 = 341882911
		,txs_2 = "magic.wdf"
	}
	Texiaoku["盘丝阵"]={
		txs_1 = 1774142217
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_盘丝阵"]={
		txs_1 = 0x369C6A29
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["复苏"]={
		txs_1 = 3698682735
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_复苏"]={
		txs_1 = 0x7DCEE534
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["含情脉脉"]={
		txs_1 = 1399041837
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_含情脉脉"]={
		txs_1 = 2164502482
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["魔音摄魂"]={
		txs_1 = 669153049
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_魔音摄魂"]={
		txs_1 = 3299511832
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["幻镜术"]={
		txs_1 = 2875043410
		,txs_2 = "magic.wdf"
    }
    Texiaoku["状态_幻镜术"]={
		txs_1 = 0xF184BD59
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["摄魄"]={
		txs_1 = 1204195587
		,txs_2 = "magic.wdf"
	}
	Texiaoku["勾魂"]={
		txs_1 = 2969420210
		,txs_2 = "magic.wdf"
	}
	Texiaoku["千蛛噬魂"]={
		txs_1 = 2094646082
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·千蛛噬魂·噬魂"]={
		txs_1 = 2094646082
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·千蛛噬魂·钻心"]={
		txs_1 = 2094646082
		,txs_2 = "magic.wdf"
	}
	Texiaoku["侵蚀·千蛛噬魂·刻骨"]={
		txs_1 = 2094646082
		,txs_2 = "magic.wdf"
	}
	Texiaoku["蛛丝缠绕"]={ --3626921467
		txs_1 = 2108708139
		,txs_2 = "magic.wdf"
	}
	Texiaoku["绝命毒牙"]={ --612511035 牵魂蛛丝
		txs_1 = 825061183
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["牵魂蛛丝"]={ --612511035
		txs_1 = 612511035
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["状态_迷瘴"]={
		txs_1 = 0xDA03A73D
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["落花成泥"]={
		txs_1 = 2161233849
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_落花成泥"]={
		txs_1 = 0xbec7680a
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["偷龙转凤"]={
		txs_1 = 0xf5958d19
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_偷龙转凤"]={
		txs_1 = 0xc0e3d64c
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["媚眼如丝"]={
		txs_1 = 2565398678 --媚眼如丝
		,txs_2 = "waddon.wdf"
	--神木林=================================================
	}
	Texiaoku["新_落叶萧萧" ]={ --全屏 --宝莲秘法
		--txs_1 = 918544408
		txs_1 = 0x18967984
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_尘土刃" ]={
		txs_1 = 0x63badfec
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_荆棘舞" ]={
		txs_1 = 0x34826440
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_冰川怒" ]={
		txs_1 = 0x4c7470bf
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_雾杀" ]={
		txs_1 = 0x33f18d1
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_炎护" ]={
		txs_1 = 0xadf90980
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_炎护"]={
		txs_1 = 0xd2578505
		,txs_2 ="waddon.wdf"
	}
	----------------------
	Texiaoku["状态_玄灵珠·回春"]={
		txs_1 = 2336654137
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["状态_玄灵珠·破军"]={
		txs_1 = 2336654137
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["状态_玄灵珠·空灵"]={
		txs_1 = 2336654137
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["状态_玄灵珠·噬魂"]={
		txs_1 = 2336654137
		,txs_2 = "common/sml.wdf"
	}
	----------------------
	Texiaoku["新_血雨" ]={
		txs_1 = 0xbacd6f79
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_血雨"]={
		txs_1 = 0x21c17ca5
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_风灵"]={
		txs_1 = 0x1fdf16a3
		,txs_2 ="waddon.wdf"
	}
	Texiaoku["状态_木精"]={
		txs_1 = 0xAABBBB01
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["侵蚀·魔化万灵·刻骨"]={
		txs_1 = 0x33f18d1
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·魔化万灵·噬魂"]={
		txs_1 = 0x33f18d1
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·魔化万灵·钻心"]={
		txs_1 = 0x33f18d1
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_雾杀"]={
		txs_1 = 1506044316
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["炎护"]={
		txs_1 = 1863894572
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["尘土刃"]={
		txs_1 = 2645145495
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["状态_炎护"]={
		txs_1 = 2336654137
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["落叶萧萧"]={
		txs_1 = 0xbd677226
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["落叶萧萧1" ]={
		txs_1 = 0xf66070df
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["落叶萧萧2"]={
		txs_1 = 0x94931579
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["蛊木迷瘴"]={
		txs_1 = "BD677226"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["蛊木迷瘴1" ]={
		txs_1 = "F66070DF"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["蛊木迷瘴2"]={
		txs_1 = "94931579"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["枯木逢春1"]={
		txs_1 = 813118432
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["枯木逢春2"]={
		txs_1 = 1411082208
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["血雨"]={
		txs_1 = 0xbacd6f79
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["冰川怒"]={
		txs_1 = 1425547471
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["叶隐"]={
		txs_1 = 1859374553
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["蜜润"]={
		txs_1 = 960380106
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_蜜润"]={
		txs_1 = 0xA14EFC5E
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["荆棘舞"]={
		txs_1 = 636234317
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["古藤秘咒"]={
		txs_1 = 636234317
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["星月之惠"]={
		txs_1 = 3298164407
		,txs_2 = "common/sml.wdf"
	}
	Texiaoku["雾杀"]={
		txs_1 = 1264783402
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["花语歌谣"]={
		txs_1 = 0xDF168AD1
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_花语歌谣"]={
		txs_1 = 0xA14EFC5E
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_冰川怒"]={ --和象形一样
		txs_1 = 0x3646A4D9
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["蝼蚁蚀天"]={
		txs_1 = 0xCEEA8F28
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["凋零之歌"]={
		txs_1 = 1524141639
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_凋零之歌"]={
		txs_1 = 1427298908
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_雾痕"]={
		txs_1 = 0x34999043
		,txs_2 = "waddon.wdf"
	--凌波城=====================================================
	}
	Texiaoku["新_裂石" ]={
		txs_1 = 0x3c5c1616
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_断岳势" ]={
		txs_1 = 0x958fac37
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_天崩地裂" ]={
		txs_1 = 0xeef5baf6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·天崩地裂·刻骨" ]={
		txs_1 = 0xeef5baf6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·天崩地裂·钻心" ]={
		txs_1 = 0xeef5baf6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["侵蚀·天崩地裂·噬魂" ]={
		txs_1 = 0xeef5baf6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_浪涌" ]={
		txs_1 = 0xd53a25eb
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_惊涛怒" ]={ --技能有加速 --先施法后物理攻击
		txs_1 = 0x697e01e6
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_翻江搅海" ]={ --旧版没有 --全屏
		txs_1 = 0x584b98c0
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_腾雷" ]={ --旧版没有
		txs_1 = 0x8a506a89
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_不动如山" ]={ -- 技能有加速
		txs_1 = 0xc514b5e7
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["天神怒斩"]={
		txs_1 = 1596797611
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_战意1" ]={ -- 1层
		txs_1 = 0xc4fe8e3f
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_战意2" ]={ -- 2层
		txs_1 = 0x3d3c8d10
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_战意3" ]={ -- 3层-6层
		txs_1 = 0xd1c3b611
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_超级战意1" ]={ -- 1层
		txs_1 = "AABBCB01"
		,txs_2 ="mgtx.wdf"

	}
	Texiaoku["状态_超级战意2" ]={ -- 2层
		txs_1 = "AABBCB02"
		,txs_2 ="mgtx.wdf"
	}
	Texiaoku["状态_超级战意3" ]={ -- 3层-6层
		txs_1 = "AABBCB03"
		,txs_2 ="mgtx.wdf"
	}
	Texiaoku["碎星诀"]={
		txs_1 = 4170642460
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["裂石"]={
		txs_1 = 1306620404
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["断岳势"]={
		txs_1 = 1306620404
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["状态_不动如山"]={
		txs_1 = 281904888
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["浪涌"]={
		txs_1 = 1065487884
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["天崩地裂"]={
		txs_1 = 1306620404
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["状态_碎星诀"]={
		txs_1 = 814399755
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["纵地金光"]={
		txs_1 = 3546433571
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["不动如山"]={
		txs_1 = 4106497964
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["翻江搅海"]={
		txs_1 = 3385103645
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["惊涛怒"]={
		txs_1 = 3197608773
		,txs_2 = "common/lbc.wdf"
	}
	Texiaoku["无双战魂"]={
		txs_1 = 2272115910
		,txs_2 = "magic.wdf"
	}
	Texiaoku["指地成钢"]={
		txs_1 = 0x4C7470BF
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_镇魂诀"]={
		txs_1 = 0xCDE5D209
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["镇魂诀"]={
		txs_1 = 0xA1399E74
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["无穷妙道"]={
		txs_1 = 1833750106
		,txs_2 = "magic.wdf"
	}
	Texiaoku["腾雷"]={
		txs_1 = 0xB334F67B
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_腾雷"]={
		txs_1 = 0x8E04515D
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_怒涛"]={
		txs_1 = 0x20360a02
		,txs_2 = "common/magic.wdf"
    	}
    	Texiaoku["真君显灵"]={
		txs_1 = 3795964039
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_真君显灵"]={
		txs_1 = 0x2ED4AF64
		,txs_2 = "common/magic.wdf"
    --花果山====================================================
    }
    Texiaoku["召唤"]={
		txs_1 = "AABB0001" --流云的
		,txs_2 = "mgtx.wdf"
	}
	 Texiaoku["八戒上身"]={
		txs_1 = "AABB0001" --流云的
		,txs_2 = "mgtx.wdf"
	}
	 Texiaoku["现形符"]={
		txs_1 = "AABB0001" --流云的
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["九幽除名"]={
		txs_1 = 0xDA03A73D
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_九幽除名"]={
		txs_1 = 0xDA03A73D
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["如意神通"]={
		txs_1 = 0x12332112
		,txs_2 = "qwq.wdf"
	}
	Texiaoku["杀威铁棒"]={
		txs_1 = "杀威铁棒"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["泼天乱棒"]={
		txs_1 = "杀威铁棒"
		,txs_2 = "mgtx.wdf"
	}
	Texiaoku["棒打雄风"]={
		txs_1 = 2458999444
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["神针撼海"]={
		txs_1 = 1133941470
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["当头一棒"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["侵蚀·当头一棒·刻骨"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["侵蚀·当头一棒·钻心"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["侵蚀·当头一棒·噬魂"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["棒掀北斗"]={
		txs_1 = 0x7FDD0DE0
		,txs_2 ="nvdi1.wdf"
	}
	Texiaoku["侵蚀·棒掀北斗·刻骨"]={
		txs_1 = 0x7FDD0DE0
		,txs_2 =  "nvdi1.wdf"
	}
	Texiaoku["侵蚀·棒掀北斗·钻心"]={
		txs_1 = 0x7FDD0DE0
		,txs_2 = "nvdi1.wdf"
	}
	Texiaoku["侵蚀·棒掀北斗·噬魂"]={
		txs_1 = 0x7FDD0DE0
		,txs_2 = "nvdi1.wdf"
	}
	Texiaoku["兴风作浪"]={
		txs_1 = 0x3200B6CC
		,txs_2 = "nvdi1.wdf"
	}
	Texiaoku["灵彻太虚"]={
		txs_1 = 0x090643F5--0xEEF5BAF6
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_灵彻太虚" ]={ --0x2C6223D4
		txs_1 = 0x287884CC
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["棍打诸神"]={
		txs_1 = 0x86F61208--0xEEF5BAF6
		,txs_2 = "magic.wd1"
	}
	Texiaoku["意马心猿"]={
		txs_1 = 0xEFDFC9DD--0xEEF5BAF6
		,txs_2 = "magic.wd1"
	}
	Texiaoku["日光耀"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["靛沧啸"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["巨岩击"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["苍茫刺"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["地裂焚"]={
		txs_1 = 3348997639--0xEEF5BAF6
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["移星换斗"]={
		txs_1 = 0x1EDD5D74
		,txs_2 = "magic.wd1"
	}
	Texiaoku["云暗天昏"]={
		txs_1 = 0x2067A573
		,txs_2 = "magic.wd1"
	}
	Texiaoku["无所遁形"]={
		txs_1 = 0x89677EC6
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_无所遁形"]={
		txs_1 = 0x3C0204DF
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["齐天神通"]={
		txs_1 = 2213550572
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["状态_齐天神通"]={
		txs_1 = 2151148071
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["呼子唤孙"]={
		txs_1 = 0x109B780F
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_呼子唤孙"]={
		txs_1 = 0x0D332E62
		,txs_2 = "magic.wd1"
	}
	Texiaoku["气慑天军"]={
		txs_1 = 648926576
		,txs_2 = "magic.wd1"
	}
	Texiaoku["状态_气慑天军"]={
		txs_1 = 2106427728
		,txs_2 = "waddon.wdf"
    }
    Texiaoku["天地洞明"]={
		txs_1 = 3900082912
		,txs_2 = "zztx.wdf"
    }
	--无底洞====================================================
	Texiaoku["状态_侵蚀·绝烬残光·刻骨"]={
		txs_1 =0xf570fde0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_侵蚀·绝烬残光·钻心"]={
		txs_1 =0xf570fde0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_侵蚀·绝烬残光·噬魂"]={
		txs_1 =0xf570fde0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["新_地涌金莲" ]={
		txs_1 = 0xe1dcdb9
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_惊魂掌" ]={
		txs_1 = 0x158ef991
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_煞气决" ]={ --旧版没有
		txs_1 = 0x8cd6756e
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_夺魄令" ]={
		txs_1 = 0xbe97e00
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_摧心术" ]={
		txs_1 = 0xe12cb30c
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["新_夺命咒" ]={
		txs_1 = 0x11f0c5b
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["地涌金莲"]={
		txs_1 = 3231850111
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["状态_夺魄令"]={
		txs_1 = 566328485
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["惊魂掌"]={
		txs_1 = 3285527731
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["追魂刺"]={
		txs_1 = 0x9F07F1C3
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["移魂化骨"]={
		txs_1 = 0x13b05a29
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_明光宝烛"]={
		txs_1 = 540412418
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["绝处逢生"]={
		txs_1 = 0xC0A21E7F
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_绝处逢生"]={
		txs_1 = 0x8BF43EF8
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["燃血术"]={
		txs_1 = 611380778
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["化羽为血"]={
		txs_1 = 611380778
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_燃血术"]={
		txs_1 = 795859080
		,txs_2 = "zztx.wdf"
	}
	Texiaoku["状态_摧心术"]={
		txs_1 = 2126428619
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["状态_惊魂掌"]={
		txs_1 = 2156799976
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["摧心术"]={
		txs_1 = 2702496872
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["夺命咒"]={
		txs_1 = 2699497351
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["明光宝烛"]={
		txs_1 = 1479134995
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["状态_移魂化骨"]={
		txs_1 = 0x2d3f560c
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["夺魄令"]={
		txs_1 = 2668097987
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["煞气诀"]={
		txs_1 = 1015505701
		,txs_2 = "common/wdd.wdf"
	}
	Texiaoku["状态_煞气诀"]={
		txs_1 = 2126428619
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["净土灵华"]={
		txs_1 = 3029064273
		,txs_2 = "magic.wdf"
	}
	Texiaoku["金身舍利"]={
		txs_1 = 0x74A85C95
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_金身舍利"]={
		txs_1 = 0xECEC37F7
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["万木凋枯"]={
		txs_1 = 0x15AE9E20
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["同舟共济"]={
		txs_1 = 0x5DC6FFDD
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_同舟共济"]={
		txs_1 = 0x5826238A
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_妖风四起"]={
		txs_1 = 634706522
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["妖风四起"]={
		txs_1 = 4105505791
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["由己渡人"]={
		txs_1 = 0xCEAF0E44
		,txs_2 = "common/magic.wdf"
	--==============================怪物====================================================
	}
	Texiaoku["蚩尤技能"]={
		txs_1 = 0xf08c56e8
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["刀光剑影"]={
		txs_1 = 0xf28e2dc
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["刀光剑影2"]={
		txs_1 = 0xdfc4a4f2
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["武神之怒"]={
		txs_1 = 0x3dd71df3
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["毁灭之光"]={
		txs_1 = 0xc13cb3dd
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_毁灭之光"]={
		txs_1 = 0x583cbc0b
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["重生"]={
		txs_1 = 0xc0a21e7f
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["血沸"]={ --后土 秒10
		txs_1 = 0x3a63d8a8
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["怒击"]={ --天昊 单 物理
		txs_1 = 0x3f820e0c
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["寒冰监牢"]={ --共工 --法术单
		txs_1 = 0xce33e201
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["归墟"]={ --玄冥 法术单
		txs_1 = 0x998f6e31
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["电芒"]={ --搻兹 法术单
		txs_1 = 0x3c5c1616
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["猛击"]={ --强良 单体2次
		txs_1 = 0x885acbe1
		,txs_2 = "addon.wdf"
	}
	Texiaoku["怒火"]={ --祝融 秒3
		txs_1 = 0xf6a543cc
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["秘传封印"]={ --蓐收 秒3
		txs_1 = 0x2aeb8662
		,txs_2 = "common/magic.wdf"
	}
	Texiaoku["状态_秘传封印"]={ --蓐收 单封
		txs_1 = 0x583cbc0b
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["尸腐无常" ]={
		txs_1 = 0x849e48fb
		,txs_2 = "magic.wdf"
	}
	Texiaoku["状态_尸腐无常" ]={
		txs_1 = 0xd2578505
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["冰封千里" ]={
		txs_1 =0x2ea2e1b
		,txs_2 ="magic.wdf"
	}
	Texiaoku["烈火焚原" ]={
		txs_1 =0x5829cf13
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_烈火焚原" ]={
		txs_1 =0xeb3d0ac1
		,txs_2 ="waddon.wdf"
	--==================================================灵宝
	}
	Texiaoku["定神仙琴" ]={
		txs_1 =0x13011BA0
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_定神仙琴" ]={
		txs_1 =0x2D3F560C
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["断穹巨剑_敌方" ]={
		txs_1 =0x559C8ECF
		,txs_2 ="magic.wd1"
	}
	Texiaoku["断穹巨剑_我方" ]={
		txs_1 =0x559C8ECF
		,txs_2 ="magic.wd1"
	}
	Texiaoku["静心禅珠" ]={
		txs_1 =0xc93a4fe0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["宁心道符" ]={
		txs_1 =0xedf566e0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_宁心道符" ]={
		txs_1 =0x195303e0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["相思寒针" ]={
		txs_1 =0xab04e6ab
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_相思寒针" ]={
		txs_1 =0x1e054ce0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["风舞心经_敌方" ]={
		txs_1 =0x8200f2e0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["风舞心经_我方" ]={
		txs_1 =0x5dd8c0e0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["锢魂命谱" ]={
		txs_1 =0xbf04fae0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["青狮獠牙" ]={
		txs_1 =0xe4ca53e0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_青狮獠牙" ]={
		txs_1 =0xFC572451
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["冥火炼炉" ]={
		txs_1 =0x69cf86e0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_冥火炼炉" ]={
		txs_1 =0x59C4699C
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["缚仙蛛丝" ]={
		txs_1 =0x6140e704
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_缚仙蛛丝" ]={
		txs_1 =0xE70C0E89
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["煞魂冥灯" ]={
		txs_1 =0xf570fde0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_煞魂冥灯" ]={
		txs_1 =0xDA03A73D
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_九霄龙锥" ]={
		txs_1 =0x7FE3C5D8
		,txs_2 ="magic.wd1"
	}
	Texiaoku["状态_惊兽云尺" ]={
		txs_1 =0x7FE3C5D8
		,txs_2 ="magic.wd1"
	}
	Texiaoku["化怨清莲" ]={
		txs_1 =0x8eecabe0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_化怨清莲" ]={
		txs_1 =0xa268fde0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["真阳令旗" ]={
		txs_1 =0xB8E57120
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["状态_真阳令旗" ]={
		txs_1 =0xA46BDEEC
		,txs_2 ="common/magic.wdf"
	}
	Texiaoku["天雷音鼓" ]={
		txs_1 =0xe3ac32e0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["寒霜盾戟" ]={
		txs_1 =0xcd3741e0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["乾坤金卷" ]={
	-- 	txs_1 =0xc93a4fe0
	-- 	,txs_2 ="zztx.wdf"
	}

	Texiaoku["赤炎战笛" ]={
		txs_1 =0x285F760A
		,txs_2 ="magic.wd1"
	}
	Texiaoku["状态_赤炎战笛" ]={
		txs_1 =0x7CD6EADC
		,txs_2 ="magic.wd1"
	}
	Texiaoku["状态_锢魂命谱" ]={
		txs_1 = 2523841483
		,txs_2 = "waddon.wdf"
	}
	Texiaoku["护体灵盾" ]={
		txs_1 =0x4cd30be0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["惊兽云尺" ]={
		txs_1 =0xc27b9ee0
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_战神宝典" ]={
		txs_1 =0xE8AF879D
		,txs_2 ="magic.wd1"
	}
	Texiaoku["战神宝典" ]={
		txs_1 =0x121133e0
		,txs_2 ="zztx.wdf"
	--==================================================boss技能
	}
	Texiaoku["龙鸣虎啸" ]={
		txs_1 =3296853270
		,txs_2 ="zztx.wdf"
	}
	Texiaoku["状态_龙鸣虎啸" ]={
		txs_1 =4160951696
		,txs_2 ="waddon.wdf"
	--==================================================动画特效
	}
	Texiaoku["下雨"]={
		txs_1 =1908682073
		,txs_2 ="mapani.wdf"
	}
	Texiaoku["打雷" ]={
		txs_1 =1800426471
		,txs_2 ="mapani.wdf"
	}
	--==================================================战斗动作特效
	--==================================================战斗动作特效
	Mxtexiaoku={}
	Mxtexiaoku["春三十娘攻击"]={
		txs1 = 0x266a9fc8
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["春三十娘攻击2"]={
		txs1 = 0x191350e7
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["春三十娘施法"]={
		txs1 = 0xc8ff1d3f
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["有个和尚攻击"]={
		txs1 = 0x674b7703
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["有个和尚攻击2"]={
		txs1 = 0x2244e213
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["有个和尚施法"]={
		txs1 = 0xcd37f3ed
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["郑镖头攻击"]={
		txs1 = 0xa207f463
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["郑镖头攻击2"]={
		txs1 = 0x713ca601
		,txs2 = "shape.wdf"
	}
	Mxtexiaoku["郑镖头施法"]={
		txs1 = 0x169f911c
		,txs2 = "shape.wdf"
	----------------------------------------------------------------shape.wdb
	}
	Mxtexiaoku["进阶古代瑞兽攻击"]={
		txs1 = 0xeca68574
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶古代瑞兽攻击2"]={
		txs1 = 0xf7543fd0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶古代瑞兽施法"]={
		txs1 = 0xf4de90d7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雷鸟人攻击"]={
		txs1 = 0x7869dd13
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雷鸟人攻击2"]={
		txs1 = 0x840082df
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雷鸟人施法"]={
		txs1 = 0x66fb57c3
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蝴蝶仙子攻击"]={
		txs1 = 0x7d9e57fc
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蝴蝶仙子攻击2"]={
		txs1 = 0x130a0f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蝴蝶仙子施法"]={
		txs1 = 0xbb5dde0e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶天兵攻击"]={
		txs1 = 0x7528dfd0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶天兵攻击2"]={
		txs1 = 0x763fefe7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶天兵施法"]={
		txs1 = 0x1fbd9899
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鲛人攻击"]={
		txs1 = 0x4697234
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鲛人攻击2"]={
		txs1 = 0xd4ce6708
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鲛人施法"]={
		txs1 = 0x22a67114
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蛟龙攻击"]={
		txs1 = 0x30c6f4c7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蛟龙攻击2"]={
		txs1 = 0x4d803032
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶蛟龙施法"]={
		txs1 = 0x15900f1c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶凤凰攻击"]={
		txs1 = 0x84406f3c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶凤凰攻击2"]={
		txs1 = 0xa0c0a40e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶凤凰施法"]={
		txs1 = 0x4f4a5c60
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶芙蓉仙子攻击"]={
		txs1 = 0x4ff04acc
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶芙蓉仙子攻击2"]={
		txs1 = 0x85b7d239
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶芙蓉仙子施法"]={
		txs1 = 0x42052a70
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军兽形攻击"]={
		txs1 = 0x9870f7a2
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军兽形攻击2"]={
		txs1 = 0xb8dc68ba
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军兽形施法"]={
		txs1 = 0x93324eff
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军人形攻击"]={
		txs1 = 0x88a585b9
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军人形攻击2"]={
		txs1 = 0x6c9eca36
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶犀牛将军人形施法"]={
		txs1 = 0x6f29fdf0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶如意仙子攻击"]={
		txs1 = 0x65f5a965
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶如意仙子攻击2"]={
		txs1 = 0x2bf4cce0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶如意仙子施法"]={
		txs1 = 0xb6eed6fa
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶灵符女娲攻击"]={
		txs1 = 0xfcee38c1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶灵符女娲攻击2"]={
		txs1 = 0x33c79a93
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶灵符女娲施法"]={
		txs1 = 0xe3fd7084
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶净瓶女娲攻击"]={
		txs1 = 0x41c451d9
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶净瓶女娲攻击2"]={
		txs1 = 0x6facb0b1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶净瓶女娲施法"]={
		txs1 = 0xdd92cfed
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶律法女娲攻击"]={
		txs1 = 0xffaae034
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶律法女娲攻击2"]={
		txs1 = 0xbbe99333
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶律法女娲施法"]={
		txs1 = 0x3d2a8762
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶吸血鬼攻击"]={
		txs1 = 0x2285828c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶吸血鬼攻击2"]={
		txs1 = 0xbfc6c6e2
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶吸血鬼施法"]={
		txs1 = 0xe5305297
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽灵攻击"]={
		txs1 = 0xce0b75af
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽灵攻击2"]={
		txs1 = 0x40e93aa4
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽灵施法"]={
		txs1 = 0x704e7698
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽萤娃娃攻击"]={
		txs1 = 0xe9581101
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽萤娃娃攻击2"]={
		txs1 = 0xa71dfba1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶幽萤娃娃施法"]={
		txs1 = 0x2314c566
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鬼将攻击"]={
		txs1 = 0xa7228fd9
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鬼将攻击2"]={
		txs1 = 0x9b8d3851
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶鬼将施法"]={
		txs1 = 0x1a1bc07f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶画魂攻击"]={
		txs1 = 0x9fdbfc64
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶画魂攻击2"]={
		txs1 = 0xa017274e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶画魂施法"]={
		txs1 = 0xc0f17b1b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶炎魔神攻击"]={
		txs1 = 0xe941964f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶炎魔神攻击2"]={
		txs1 = 0x3ed806b0
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶炎魔神施法"]={
		txs1 = 0xeae5e3f4
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶大力金刚攻击"]={
		txs1 = 0x1c562fe4
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶大力金刚攻击2"]={
		txs1 = 0xab649391
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶大力金刚施法"]={
		txs1 = 0x4676514f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶夜罗刹攻击"]={
		txs1 = 0xa36d6a7c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶夜罗刹攻击2"]={
		txs1 = 0xd16718c6
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶夜罗刹施法"]={
		txs1 = 0x35edc3dd
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶噬天虎攻击"]={
		txs1 = 0x476fafa7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶噬天虎攻击2"]={
		txs1 = 0x201657b3
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶噬天虎施法"]={
		txs1 = 0x5e882e5a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雾中仙攻击"]={
		txs1 = 0xa2467825
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雾中仙攻击2"]={
		txs1 = 0x8ad0efcb
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶雾中仙施法"]={
		txs1 = 0x70f5ed80
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶龙龟攻击"]={
		txs1 = 0x731b65cd
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶龙龟攻击2"]={
		txs1 = 0xcc34c56c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶龙龟施法"]={
		txs1 = 0x2320b6f5
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶踏云兽攻击"]={
		txs1 = 0x46702722
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶踏云兽攻击2"]={
		txs1 = 0x1b2151d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶踏云兽施法"]={
		txs1 = 0x4614738e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡鬼攻击"]={
		txs1 = 0x78ddaf3a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡鬼攻击2"]={
		txs1 = 0xb85132af
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡鬼施法"]={
		txs1 = 0xd87018be
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡妖攻击"]={
		txs1 = 0x59a2d761
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡妖攻击2"]={
		txs1 = 0x9488874f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶修罗傀儡妖施法"]={
		txs1 = 0xa419dba6
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["毗舍童子攻击"]={
		txs1 = 0x9871d7cd
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["毗舍童子攻击2"]={
		txs1 = 0x725f1df7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["毗舍童子施法"]={
		txs1 = 0x13af98e4
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶毗舍童子攻击"]={
		txs1 = 0xf75396e5
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶毗舍童子攻击2"]={
		txs1 = 0x1763975b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶毗舍童子施法"]={
		txs1 = 0xed474523
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["持国巡守攻击"]={
		txs1 = 0xea995304
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["持国巡守攻击2"]={
		txs1 = 0xf2662308
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["持国巡守施法"]={
		txs1 = 0xa1041d6d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶持国巡守攻击"]={
		txs1 = 0xfa30944c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶持国巡守攻击2"]={
		txs1 = 0xddc3e82d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶持国巡守施法"]={
		txs1 = 0xb2045a0a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["真陀护法攻击"]={
		txs1 = 0xec025a5e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["真陀护法攻击2"]={
		txs1 = 0xf9f0399d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["真陀护法施法"]={
		txs1 = 0xc453a2f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶真陀护法攻击"]={
		txs1 = 0x1ecf6d90
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶真陀护法攻击2"]={
		txs1 = 0x9816f95d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶真陀护法施法"]={
		txs1 = 0xde773ac7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级六耳猕猴攻击"]={
		txs1 = 0x21d839a3
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级六耳猕猴攻击2"]={
		txs1 = 0x296bd86b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级六耳猕猴施法"]={
		txs1 = 0xe762a017
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["超级六耳猕猴攻击"]={
		txs1 = 0x46d6a07d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级六耳猕猴攻击2"]={
		txs1 = 0x449eef7c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级六耳猕猴施法"]={
		txs1 = 0x89e544a0
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神羊攻击"]={
		txs1 = 0x63d5219a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["超级神羊攻击2"]={
		txs1 = 0x5fb77edf
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["超级神羊施法"]={
		txs1 = 0x35dd725b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级神羊攻击"]={
		txs1 = 0x5c40c9ce
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级神羊攻击2"]={
		txs1 = 0x2451d0c2
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶超级神羊施法"]={
		txs1 = 0x7e5de223
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["超级玉兔攻击"]={
		txs1 = 0x1ed288f4
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级玉兔攻击2"]={
		txs1 = 0x54ab99c8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级玉兔施法"]={
		txs1 = 0x5f8d0a1f
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级玉兔攻击"]={
		txs1 = 0x1ed288f4
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级玉兔攻击2"]={
		txs1 =0x54ab99c8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级玉兔施法"]={
		txs1 = 0x5f8d0a1f
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级土地公公攻击"]={
		txs1 = 0x6be5f454
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级土地公公攻击2"]={
		txs1 = 0xf48458bd
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级土地公公施法"]={
		txs1 = 0x87a7971d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级土地公公攻击"]={
		txs1 = 0xbd793588
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级土地公公攻击2"]={
		txs1 =0x36476e57
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级土地公公施法"]={
		txs1 = 0x87a7971d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神鸡攻击"]={
		txs1 = 0xb93a607a
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神鸡攻击2"]={
		txs1 = 0xa73d8bc6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神鸡施法"]={
		txs1 = 0x7077369a
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神鸡施法2"]={
		txs1 = 0x4058c44b
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神鸡攻击"]={
		txs1 = 0xb0373051
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神鸡攻击2"]={
		txs1 =0xe1cc9b33
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神鸡施法"]={
		txs1 = 0xa8818f22
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神鸡施法2"]={
		txs1 = 0x9d6c0b63
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神猴攻击"]={
		txs1 = 0xfc84dfce
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神猴攻击2"]={
		txs1 = 0xdb0bf35a
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["超级神猴施法"]={
		txs1 = 0x2832090c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神猴攻击"]={
		txs1 = 0x876e0cb3
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神猴攻击2"]={
		txs1 =0x70c03a66
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶超级神猴施法"]={
		txs1 = 0x225228b2
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["龙马攻击"]={
		txs1 = 0x6641afe4
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["龙马攻击2"]={
		txs1 =0x7cae7545
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["龙马施法"]={
		txs1 = 0xdb361ae8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李靖攻击"]={
		txs1 = 0x9f8df0b8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李天王攻击"]={
		txs1 = 0x9f8df0b8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李靖攻击2"]={
		txs1 =0x79763ad1
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李天王攻击2"]={
		txs1 =0x79763ad1
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李靖施法"]={
		txs1 = 0x960983b8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["李天王施法"]={
		txs1 = 0x960983b8
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音姐姐攻击"]={
		txs1 = 0xffededb5
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音菩萨攻击"]={
		txs1 = 0xffededb5
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音姐姐攻击2"]={
		txs1 =0xc0baa3a6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音菩萨攻击2"]={
		txs1 =0xc0baa3a6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音姐姐施法"]={
		txs1 = 0x94596b0c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["观音菩萨施法"]={
		txs1 = 0x94596b0c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["空度禅师攻击"]={
		txs1 = 0xca02d49e
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["空度禅师攻击2"]={
		txs1 =0xacb80e59
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["空度禅师施法"]={
		txs1 =0xb2458366
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏王攻击"]={
		txs1 = 0x7a8c772c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏菩萨攻击"]={
		txs1 = 0x7a8c772c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏王攻击2"]={
		txs1 =0x451d6b7d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏菩萨攻击2"]={
		txs1 =0x451d6b7d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏王施法"]={
		txs1 =0xddba60f9
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["地藏菩萨施法"]={
		txs1 =0xddba60f9
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元子攻击"]={
		txs1 = 0xa927eb1
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元大仙攻击"]={
		txs1 = 0xa927eb1
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元子攻击2"]={
		txs1 =0xde4223a6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元大仙攻击2"]={
		txs1 =0xde4223a6
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元子施法"]={
		txs1 =0x8c59ab3b
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["镇元大仙施法"]={
		txs1 =0x8c59ab3b
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["大大王攻击"]={
		txs1 = 0xc2855f45
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["青狮精攻击"]={
		txs1 = 0xc2855f45
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["大大王攻击2"]={
		txs1 =0x23094a8c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["青狮精攻击2"]={
		txs1 =0x23094a8c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["大大王施法"]={
		txs1 =0x2af1f828
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["青狮精施法"]={
		txs1 =0x2af1f828
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提祖师攻击"]={
		txs1 = 0x1ea7de85
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提祖师攻击2"]={
		txs1 =0xcd093578
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提祖师施法"]={
		txs1 =0xb8d766b2
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提老祖攻击"]={
		txs1 = 0x1ea7de85
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提老祖攻击2"]={
		txs1 =0xcd093578
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["菩提老祖施法"]={
		txs1 =0xb8d766b2
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["牛魔王攻击" ]={
		txs1 = 0x9c029a9
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["牛魔王攻击2" ]={
		txs1 =0xb1f577ab
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["牛魔王施法" ]={
		txs1 =0x72c110e5
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["东海龙王攻击"]={
		txs1 = 0x6c5cbb68
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["东海龙王攻击2"]={
		txs1 =0xe75daeaa
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["东海龙王施法"]={
		txs1 =0x9ca707d3
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["男人_东海龙王攻击"]={
		txs1 = 0x6c5cbb68
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["男人_东海龙王攻击2"]={
		txs1 =0xe75daeaa
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["男人_东海龙王施法"]={
		txs1 =0x9ca707d3
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["孙婆婆攻击" ]={
		txs1 = 0xf201592
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["孙婆婆攻击2" ]={
		txs1 =0x6f515e25
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["孙婆婆施法" ]={
		txs1 =0x73b1558f
		,txs2 = "shape.wd7"
	}
	Mxtexiaoku["进阶小毛头攻击"]={
		txs1 = 0xd7562254
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小毛头攻击2"]={
		txs1 = 0x934fab88
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小毛头施法"]={
		txs1 = 0x88c50de5
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小丫丫攻击"]={
		txs1 = 0xe135cc7c
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小丫丫攻击2"]={
		txs1 = 0xe6b82194
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小丫丫施法"]={
		txs1 = 0x6f77d45
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小魔头攻击"]={
		txs1 = 0x7d766a65
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小魔头攻击2"]={
		txs1 = 0x5e1e29cb
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小魔头施法"]={
		txs1 = 0xc1810c1d
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小精灵攻击"]={
		txs1 = 0xa87f72d7
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小精灵攻击2"]={
		txs1 = 0x9d79f43f
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小精灵施法"]={
		txs1 = 0xf623febc
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙灵攻击"]={
		txs1 = 0x438fea2a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙灵攻击2"]={
		txs1 = 0xfedf20ac
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙灵施法"]={
		txs1 = 0x5dbb1568
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙女攻击"]={
		txs1 = 0x9ac5f9db
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙女攻击2"]={
		txs1 = 0x7e6fed4b
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶小仙女施法"]={
		txs1 = 0x955e84dd
		,txs2 = "shape.wdb"
	----------------------------------------------------------------shape.wdc
	}
	Mxtexiaoku["进阶黑山老妖攻击"]={
		txs1 = 0x123e5270
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶黑山老妖攻击2"]={
		txs1 = 0x460b1eb7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶黑山老妖施法"]={
		txs1 = 0x7eedb37d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶白熊攻击"]={
		txs1 = 0xf90e825a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶白熊攻击2"]={
		txs1 = 0x5ec0e760
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶白熊施法"]={
		txs1 = 0xa8ee7f08
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶风伯攻击"]={
		txs1 = 0xea7e19ad
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶风伯攻击2"]={
		txs1 = 0x13e62d29
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶风伯施法"]={
		txs1 = 0xfe6fd88
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶天将攻击"]={
		txs1 = 0xbe65728f--0x2de97337
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶天将攻击2"]={
		txs1 = 0xb2854590
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶天将施法"]={
		txs1 = 0x9b29e8fc
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶碧水夜叉攻击"]={
		txs1 = 0xd161263b
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶碧水夜叉攻击2"]={
		txs1 = 0x20739b2f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶碧水夜叉施法"]={
		txs1 = 0x283b0731
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蚌精攻击"]={
		txs1 = 0x5da14093
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蚌精攻击2"]={
		txs1 = 0x87a988a6
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蚌精施法"]={
		txs1 = 0x1a5bcf97
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶地狱战神攻击"]={
		txs1 = 0xa91a54b2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶地狱战神攻击2"]={
		txs1 = 0x5e3d1399
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶地狱战神施法"]={
		txs1 = 0x37697f1f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶雨师攻击"]={
		txs1 = 0x95c26e4f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶雨师攻击2"]={
		txs1 = 0x64354fe0
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶雨师施法"]={
		txs1 = 0xa45d4b32
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶星灵仙子攻击"]={
		txs1 = 0x9a88f10f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶星灵仙子攻击2"]={
		txs1 = 0x2f83b341
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶星灵仙子施法"]={
		txs1 = 0xee51c201
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巡游天神攻击"]={
		txs1 = 0xf1aebdcd
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巡游天神攻击2"]={
		txs1 = 0x95c4bd51
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巡游天神施法"]={
		txs1 = 0xade34bbc
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶锦毛貂精攻击"]={
		txs1 = 0x460b1eb7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶锦毛貂精攻击2"]={
		txs1 = 0xbd210400
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶锦毛貂精施法"]={
		txs1 = 0xb390a1fd
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶千年蛇魅攻击"]={
		txs1 = 0xed9f3561
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶千年蛇魅攻击2"]={
		txs1 = 0x4b65b5d9
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶千年蛇魅施法"]={
		txs1 = 0xc2746881
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶野猪精攻击"]={
		txs1 = 0xdac8410
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶野猪精攻击2"]={
		txs1 = 0xb0890cb
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶野猪精施法"]={
		txs1 = 0x9676f109
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶百足将军攻击"]={
		txs1 = 0xf06aefeb
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶百足将军攻击2"]={
		txs1 = 0x9f8c999c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶百足将军施法"]={
		txs1 = 0xde2347
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶鼠先锋攻击"]={
		txs1 = 0xa1239e33
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶鼠先锋攻击2"]={
		txs1 = 0xb3ea50aa
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶鼠先锋施法"]={
		txs1 = 0x149316b4
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["泪妖攻击"]={
		txs1 = 0xe8923a84
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["泪妖攻击2"]={
		txs1 = 0xf6807d96
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["泪妖施法"]={
		txs1 = 0x774f7a03
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶泪妖攻击"]={
		txs1 = 0x7fdc1d43
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶泪妖攻击2"]={
		txs1 = 0x62649885
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶泪妖施法"]={
		txs1 = 0x6a570a79
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["镜妖攻击"]={
		txs1 = 0x48f1fe02
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["镜妖攻击2"]={
		txs1 = 0xba30964e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["镜妖施法"]={
		txs1 = 0x6bb76cce
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶镜妖攻击"]={
		txs1 = 0xc02f26a5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶镜妖攻击2"]={
		txs1 = 0x526fae9c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶镜妖施法"]={
		txs1 = 0xc645150e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶阴阳伞攻击"]={
		txs1 = 0x9ae21560
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶阴阳伞攻击2"]={
		txs1 = 0x79d1ee6
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶阴阳伞施法"]={
		txs1 = 0xc883c02f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵鹤攻击"]={
		txs1 = 0xe80ab0db
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵鹤攻击2"]={
		txs1 = 0xe212e9c3
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵鹤施法"]={
		txs1 = 0x788dbf99
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶琴仙攻击"]={
		txs1 = 0x27091438
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["琴仙攻击2"]={
		txs1 = 0x54fc3258
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["琴仙施法"]={
		txs1 = 0xe261700c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶琴仙攻击"]={
		txs1 = 0x27091438
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶琴仙攻击2"]={
		txs1 = 0xa68fd1f7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶琴仙施法"]={
		txs1 = 0x62a2596c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["金铙僧攻击"]={
		txs1 = 0xe46674a2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["金铙僧攻击2"]={
		txs1 = 0xd7ed2bc6
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["金铙僧施法"]={
		txs1 = 0x46384746
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金铙僧攻击"]={
		txs1 = 0x18014e24
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金铙僧攻击2"]={
		txs1 = 0xbe826521
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金铙僧施法"]={
		txs1 = 0x41e3bff9
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶葫芦宝贝攻击"]={
		txs1 = 0xd0d575ac
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶葫芦宝贝攻击2"]={
		txs1 = 0x5b5cbde0
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶葫芦宝贝施法"]={
		txs1 = 0x74252756
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶红萼仙子攻击"]={
		txs1 = 0xb7fd0cc5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶红萼仙子攻击2"]={
		txs1 = 0x4f211b8e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶红萼仙子施法"]={
		txs1 = 0x6e719ab2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蝎子精攻击"]={
		txs1 = 0x76fdb3c1
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蝎子精攻击2"]={
		txs1 = 0x99de926c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶蝎子精施法"]={
		txs1 = 0xde8feb67
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关兽攻击"]={
		txs1 = 0x46735ef7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关兽攻击2"]={
		txs1 = 0x2b134d98
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关兽施法"]={
		txs1 = 0x3be331a5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关人人形攻击"]={
		txs1 = 0xc4c0e792
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关人人形攻击2"]={
		txs1 = 0x2374b0f8
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关人人形施法"]={
		txs1 = 0xd2c4def2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关鸟攻击"]={
		txs1 = 0x6346e4d2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关鸟攻击2"]={
		txs1 = 0x3b8ecb7d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶机关鸟施法"]={
		txs1 = 0xb8e00d09
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶连弩车攻击"]={
		txs1 = 0x8c3f954d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶连弩车攻击2"]={
		txs1 = 0x1decdcb0
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶连弩车施法"]={
		txs1 = 0xb0848bfb
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巴蛇攻击"]={
		txs1 = 0xf90e825a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巴蛇攻击2"]={
		txs1 = 0x9b5b839b
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巴蛇施法"]={
		txs1 = 0xf7901ba1
		,txs2 = "shape.wdc"

	}
	Mxtexiaoku["进阶长眉灵猴攻击"]={
		txs1 = 0x8866e34a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶长眉灵猴攻击2"]={
		txs1 = 0xf58576fb
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶长眉灵猴施法"]={
		txs1 = 0x3d697d14
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巨力神猿攻击"]={
		txs1 = 0xb4cbfd3f
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巨力神猿攻击2"]={
		txs1 = 0x61c6fa0
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶巨力神猿施法"]={
		txs1 = 0xe11d3d6
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶藤蔓妖花攻击"]={
		txs1 = 0xa3a0e64a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶藤蔓妖花攻击2"]={
		txs1 = 0x75fc6569
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶藤蔓妖花施法"]={
		txs1 = 0xd2dda7a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金身罗汉攻击"]={
		txs1 = 0xbe8a540e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金身罗汉攻击2"]={
		txs1 = 0xa74e47d4
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶金身罗汉施法"]={
		txs1 = 0xc9c5c1a7
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶曼珠沙华攻击"]={
		txs1 = 0xb7ff1e5a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶曼珠沙华攻击2"]={
		txs1 = 0x63503fe9
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶曼珠沙华施法"]={
		txs1 = 0xea292149
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["增长巡守攻击"]={
		txs1 = 0x4aa9d4dd
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["增长巡守攻击2"]={
		txs1 = 0x57980622
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["增长巡守施法"]={
		txs1 = 0x4aaeb519
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶增长巡守攻击"]={
		txs1 = 0x4aa9d4dd
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶增长巡守攻击2"]={
		txs1 = 0xbc3eaa3a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶增长巡守施法"]={
		txs1 = 0xef92f600
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["灵灯侍者攻击"]={
		txs1 = 0xaa40dc28
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["灵灯侍者攻击2"]={
		txs1 = 0x7966374d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵灯侍者攻击"]={
		txs1 = 0x20c26b09
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵灯侍者攻击2"]={
		txs1 = 0x65f3d51e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶灵灯侍者施法"]={
		txs1 = 0xf3ca9b9d
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["般若天女攻击"]={
		txs1 = 0x813c3438
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["般若天女攻击2"]={
		txs1 = 0x63a1780c
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["般若天女施法"]={
		txs1 = 0x1feb2910
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶般若天女攻击"]={
		txs1 = 0xe59c493a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶般若天女攻击2"]={
		txs1 = 0x5e9c020a
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["进阶般若天女施法"]={
		txs1 = 0x4a5c90be
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝珠攻击"]={
		txs1 = 0xcc90d6d3
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝珠攻击2"]={
		txs1 = 0xe9e021f1
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝珠施法"]={
		txs1 = 0xe9e021f1
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔刀攻击"]={
		txs1 = 0xe4144a99
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔刀攻击2"]={
		txs1 = 0xe4144a99
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔刀施法"]={
		txs1 = 0xe4144a99
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝剑攻击"]={
		txs1 = 0xc71ec94e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝剑攻击2"]={
		txs1 = 0xc71ec94e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔宝剑施法"]={
		txs1 = 0xc71ec94e
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔经筒攻击"]={
		txs1 = 0xad765f97
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔经筒攻击2"]={
		txs1 = 0xad765f97
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔经筒施法"]={
		txs1 = 0xad765f97
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔弓弩攻击"]={
		txs1 = 0xb109bcf2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔弓弩攻击2"]={
		txs1 = 0xb109bcf2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔弓弩施法"]={
		txs1 = 0xb109bcf2
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔法杖攻击"]={
		txs1 = 0xf3ffc8ed
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔法杖攻击2"]={
		txs1 = 0xf3ffc8ed
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔法杖施法"]={
		txs1 = 0xf3ffc8ed
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔斧钺攻击"]={
		txs1 = 0x2de97337
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔斧钺攻击2"]={
		txs1 = 0x2de97337
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔斧钺施法"]={
		txs1 = 0x2de97337
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔攻击"]={
		txs1 = 0xef5821e5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔攻击2"]={
		txs1 = 0xef5821e5
		,txs2 = "shape.wdc"
	}
	Mxtexiaoku["自在天魔施法"]={
		txs1 = 0x35aa81a7
		,txs2 = "shape.wdc"
	-------------------------------
	}
	Mxtexiaoku["小毛头攻击"]={
		txs1 = 0x8aa62a0f
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小丫丫施法"]={
		txs1 = 0xd5abc8d4
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小精灵攻击"]={
		txs1 = 0x130a9b37
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小精灵施法"]={
		txs1 = 0x5dfc166f
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙灵攻击"]={
		txs1 = 0x100d17e2
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙灵攻击2"]={
		txs1 = 0x9290e494
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙灵施法"]={
		txs1 = 0x3fcec9f6
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙女攻击"]={
		txs1 = 0x1449c3a8
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙女攻击2"]={
		txs1 = 0xcf38fd3d
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["小仙女施法"]={
		txs1 = 0x7d39a425
		,txs2 = "shape.wd2"
	}
	Mxtexiaoku["进阶猫灵兽形攻击"]={
		txs1 = 0xad5a8508
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵兽形攻击2"]={
		txs1 = 0x1a0e8ceb
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵兽形施法"]={
		txs1 = 0xc1f5fe1e
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵人形攻击"]={
		txs1 = 0xad5a8508
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵人形攻击2"]={
		txs1 = 0x1a0e8ceb
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶猫灵人形施法"]={
		txs1 = 0xda3a2696
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["狂豹兽形攻击"]={
		txs1 = 0x4775e8d
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["狂豹兽形攻击2"]={
		txs1 = 0x6c23b003
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["狂豹兽形施法"]={
		txs1 = 0xc3b82b9a
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶狂豹兽形攻击"]={
		txs1 = 0xf709454a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹兽形攻击2"]={
		txs1 = 0xf8b6ff97
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹兽形施法"]={
		txs1 = 0xc0021bb9
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹人形攻击"]={
		txs1 = 0x79878052
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹人形攻击2"]={
		txs1 = 0x2C3F4457
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶狂豹人形施法"]={
		txs1 = 0x4cc37fe1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["混沌兽攻击"]={
		txs1 = 0x1850de8c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["混沌兽攻击2"]={
		txs1 = 0xe404a24c
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["混沌兽施法"]={
		txs1 = 0xb6bac528
		,txs2 = "shape.wd8"
	}
	Mxtexiaoku["进阶混沌兽攻击"]={
		txs1 = 0xdf86b03
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶混沌兽攻击2"]={
		txs1 = 0x3ea4065a
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["进阶混沌兽施法"]={
		txs1 = 0xa6eda0a1
		,txs2 = "shape.wdb"
	}
	Mxtexiaoku["飞燕女攻击_双短剑1"]={
		txs1 = 0x8e38ad6a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击2_双短剑1"]={
		txs1 = 0x8e38ad6a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女施法_双短剑1"]={
		txs1 = 0x6a60178d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击_环圈1"]={
		txs1 = 0xbad926db
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击2_环圈1"]={
		txs1 = 0xbad926db
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女施法_环圈1"]={
		txs1 = 0x36bdc402
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击_双短剑2"]={
		txs1 = 0x7d959e28
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击2_双短剑2"]={
		txs1 = 0x7d959e28
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女施法_双短剑2"]={
		txs1 = 0x87f8c21a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击_环圈2"]={
		txs1 =0x2142b0d7
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女攻击2_环圈2"]={
		txs1 =0x2142b0d7
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["飞燕女施法_环圈2"]={
		txs1 = 0xc6758d02
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击_剑1"]={
		txs1 = 0x6e78c93b
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击2_剑1"]={
		txs1 = 0x6e78c93b
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生施法_剑1"]={
		txs1 = 0x5f809c80
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击_扇1"]={
		txs1 = 0x99594e46
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击2_扇1"]={
		txs1 = 0x99594e46
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生施法_扇1"]={
		txs1 = 0xe472b0be
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击_剑2"]={
		txs1 = 0x3936cbe8
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击2_剑2"]={
		txs1 = 0x3936cbe8
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生施法_剑2"]={
		txs1 = 0x6620a3a2
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击_扇2"]={
		txs1 =0x797993b0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生攻击2_扇2"]={
		txs1 =0x797993b0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["逍遥生施法_扇2"]={
		txs1 = 0x193e046
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击_爪刺1"]={
		txs1 = 0xf471d81d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击2_爪刺1"]={
		txs1 = 0xf471d81d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人施法_爪刺1"]={
		txs1 = 0xbe5cad45
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击_鞭1"]={
		txs1 = 0x91c32d86
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击2_鞭1"]={
		txs1 = 0x91c32d86
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人施法_鞭1"]={
		txs1 = 0xf3b0aa07
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击_爪刺2"]={
		txs1 = 0x846f1074
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击2_爪刺2"]={
		txs1 = 0x846f1074
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人施法_爪刺2"]={
		txs1 = 0x1d156715
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击_鞭2"]={
		txs1 =0x2f78067e
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人攻击2_鞭2"]={
		txs1 =0x2f78067e
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["狐美人施法_鞭2"]={
		txs1 = 0xa241eab1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击_爪刺1"]={
		txs1 = 0xd36bc394
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击2_爪刺1"]={
		txs1 = 0xd36bc394
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵施法_爪刺1"]={
		txs1 = 0x287fb10
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击_魔棒1"]={
		txs1 = 0x1332ce5d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击2_魔棒1"]={
		txs1 = 0x1332ce5d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵施法_魔棒1"]={
		txs1 = 0x56994640
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击_爪刺2"]={
		txs1 = 0xd04d9728
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击2_爪刺2"]={
		txs1 = 0xd04d9728
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵施法_爪刺2"]={
		txs1 = 0x3563d35f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击_魔棒2"]={
		txs1 =0x4fdffa0c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵攻击2_魔棒2"]={
		txs1 =0x4fdffa0c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["骨精灵施法_魔棒2"]={
		txs1 = 0xb402d438
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击_斧钺1"]={
		txs1 = 0x60e4c3fa
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击2_斧钺1"]={
		txs1 = 0x60e4c3fa
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王施法_斧钺1"]={
		txs1 = 0x67174e05
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击_刀1"]={
		txs1 = 0x1700a6c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击2_刀1"]={
		txs1 = 0x1700a6c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王施法_刀1"]={
		txs1 = 0xd350be85
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击_斧钺2"]={
		txs1 = 0xe3ae17c1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击2_斧钺2"]={
		txs1 = 0xe3ae17c1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王施法_斧钺2"]={
		txs1 = 0xe5a28f36
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击_刀2"]={
		txs1 =0x826228c1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王攻击2_刀2"]={
		txs1 =0x826228c1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["巨魔王施法_刀2"]={
		txs1 = 0x2a172a4b
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击_斧钺1"]={
		txs1 = 0x46ab3059
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击2_斧钺1"]={
		txs1 = 0x46ab3059
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪施法_斧钺1"]={
		txs1 = 0xe8e12086
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击_锤1"]={
		txs1 = 0xde8167d1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击2_锤1"]={
		txs1 = 0xde8167d1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪施法_锤1"]={
		txs1 = 0x5a51ca67
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击_斧钺2"]={
		txs1 = 0x9e683b76
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击2_斧钺2"]={
		txs1 = 0x9e683b76
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪施法_斧钺2"]={
		txs1 = 0x7a01cd70
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击_锤2"]={
		txs1 =0x92cb1dc9
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪攻击2_锤2"]={
		txs1 =0x92cb1dc9
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["虎头怪施法_锤2"]={
		txs1 = 0x55d81513
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击_飘带1"]={
		txs1 = 0xf10824d6
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击2_飘带1"]={
		txs1 = 0xf10824d6
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬施法_飘带1"]={
		txs1 = 0xa2e7afcf
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击_环圈1"]={
		txs1 = 0x5b45294c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击2_环圈1"]={
		txs1 = 0x5b45294c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬施法_环圈1"]={
		txs1 = 0xb1e11fb1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击_飘带2"]={
		txs1 = 0x35264f52
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击2_飘带2"]={
		txs1 = 0x35264f52
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬施法_飘带2"]={
		txs1 = 0xd56def19
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击_环圈2"]={
		txs1 =0xe0fbfac1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬攻击2_环圈2"]={
		txs1 =0xe0fbfac1
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["舞天姬施法_环圈2"]={
		txs1 = 0x3ae4c1c0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击_飘带1"]={
		txs1 = 0xeac576e0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击2_飘带1"]={
		txs1 = 0xeac576e0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥施法_飘带1"]={
		txs1 = 0x976f350f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击_魔棒1"]={
		txs1 = 0xdec05693
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击2_魔棒1"]={
		txs1 = 0xdec05693
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥施法_魔棒1"]={
		txs1 = 0x9f35ea32
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击_飘带2"]={
		txs1 =  0x3cd82541
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击2_飘带2"]={
		txs1 = 0x3cd82541
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥施法_飘带2"]={
		txs1 = 0x60d01153
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击_魔棒2"]={
		txs1 =0x440a2bc5
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥攻击2_魔棒2"]={
		txs1 =0x440a2bc5
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["玄彩娥施法_魔棒2"]={
		txs1 = 0x4ff6b583
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击_枪矛1"]={
		txs1 = 0xe2770734
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击2_枪矛1"]={
		txs1 = 0xe2770734
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵施法_枪矛1"]={
		txs1 = 0xafbcb42d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击_锤1"]={
		txs1 = 0x4e65cd50
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击2_锤1"]={
		txs1 = 0x4e65cd50
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵施法_锤1"]={
		txs1 = 0x3c1ec801
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击_枪矛2"]={
		txs1 = 0x36284398
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击2_枪矛2"]={
		txs1 = 0x36284398
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵施法_枪矛2"]={
		txs1 = 0x32170257
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击_锤2"]={
		txs1 =0xc7b92924
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵攻击2_锤2"]={
		txs1 =0xc7b92924
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["神天兵施法_锤2"]={
		txs1 = 0x1c55c59f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击_枪矛1"]={
		txs1 = 0x6c1e5a4a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击2_枪矛1"]={
		txs1 = 0x6c1e5a4a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子施法_枪矛1"]={
		txs1 = 0xdd3b0296
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击_扇1"]={
		txs1 = 0xfe2c7349
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击2_扇1"]={
		txs1 = 0xfe2c7349
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子施法_扇1"]={
		txs1 = 0x42c2f6be
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击_枪矛2"]={
		txs1 = 0x7ade766c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击2_枪矛2"]={
		txs1 = 0x7ade766c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子施法_枪矛2"]={
		txs1 = 0x401df67b
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击_扇2"]={
		txs1 =0x6ddc0f67
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子攻击2_扇2"]={
		txs1 =0x6ddc0f67
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["龙太子施法_扇2"]={
		txs1 = 0x3aac439a
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击_伞1"]={
		txs1 = 0x78b26a25
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击2_伞1"]={
		txs1 = 0x78b26a25
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇施法_伞1"]={
		txs1 = 0x67b53394
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击_爪刺1"]={
		txs1 = 0xb0aada79
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击2_爪刺1"]={
		txs1 = 0xb0aada79
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇施法_爪刺1"]={
		txs1 = 0x223b9d9d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击_伞2"]={
		txs1 = 0xb2fd1e56
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击2_伞2"]={
		txs1 = 0xb2fd1e56
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇施法_伞2"]={
		txs1 = 0xf46e4bb3
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击_爪刺2"]={
		txs1 = 0x44c94422
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇攻击2_爪刺2"]={
		txs1 = 0x44c94422
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["鬼潇潇施法_爪刺2"]={
		txs1 = 0x3dab59bd
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击_巨剑1"]={
		txs1 = 0x55b9bb79
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击2_巨剑1"]={
		txs1 = 0x55b9bb79
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师施法_巨剑1"]={
		txs1 = 0x8cbb28a0
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击_剑1"]={
		txs1 = 0x650fe30c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击2_剑1"]={
		txs1 = 0x650fe30c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师施法_剑1"]={
		txs1 = 0x3bb4c654
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击_巨剑2"]={
		txs1 = 0xef1d0947
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击2_巨剑2"]={
		txs1 = 0xef1d0947
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师施法_巨剑2"]={
		txs1 = 0xc56b969c
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击_剑2"]={
		txs1 = 0xd84c88cc
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师攻击2_剑2"]={
		txs1 = 0xd84c88cc
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["偃无师施法_剑2"]={
		txs1 = 0xa2217adf
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击_灯笼1"]={
		txs1 = 0xf109b42d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击2_灯笼1"]={
		txs1 = 0xf109b42d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭施法_灯笼1"]={
		txs1 = 0xb1aa60dd
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击_飘带1"]={
		txs1 = 0x707d130d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击2_飘带1"]={
		txs1 = 0x707d130d
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭施法_飘带1"]={
		txs1 = 0x6db596dc
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击_灯笼2"]={
		txs1 = 0xc7f8ca2f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击2_灯笼2"]={
		txs1 = 0xc7f8ca2f
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭施法_灯笼2"]={
		txs1 = 0x244480ee
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击_飘带2"]={
		txs1 =0xbfb57680
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭攻击2_飘带2"]={
		txs1 =0xbfb57680
		,txs2 = "common/shape.wdf"
	}
	Mxtexiaoku["桃夭夭施法_飘带2"]={
		txs1 = 0x175b63c0
		,txs2 = "common/shape.wdf"
	}
    --==================================================技能展示
function 引擎.取技能展示(jn)
	local jns = {}
	if Jinengzhanshi[jn] then
		jns[1]=Jinengzhanshi[jn].jns1
		jns[6]=Jinengzhanshi[jn].jns6
		jns[7]=Jinengzhanshi[jn].jns7
		jns[10]=Jinengzhanshi[jn].jns10
	end
	if jns[1] then
		return jns
	else
		return 引擎.取技能(jn)
	end
end
    Jinengzhanshi={}
	Jinengzhanshi["等待"]={
		jns1 = ""
		,jns6 = "wzife.wdf"
		,jns7 = 0xBAF390E1
		,jns10 = {0,0}
	}
	Jinengzhanshi["召唤"]={
		jns1 = ""
		,jns6 = "wzife.wdf"
		,jns7 = 1847278312
		,jns10 = {3,4}
	}
	Jinengzhanshi["逃跑"]={
		jns1 = ""
		,jns6 = "wzife.wdf"
		,jns7 = 3722287580
		,jns10 = {3,4}
	}
	Jinengzhanshi["攻击"]={
		jns1 = ""
		,jns6 = "wzife.wdf"
		,jns7 = 0xF8B388A7
		,jns10 = {4,3}
	}
	Jinengzhanshi["保护"]={
		jns1 = ""
		,jns6 = "wzife.wdf"
		,jns7 = 0x56EAC75B
		,jns10 = {2,1}
	}
	Jinengzhanshi["防御"]={
		jns1 = ""
		,jns6 = "wzife.wdf"
		,jns7 = 0x40A13532
		,jns10 = {3,3}
    --法宝
	}
	Jinengzhanshi["金钱镖"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x3D9C84A5
	}
	Jinengzhanshi["惊魂铃"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xEAA6AD2E

	}
	Jinengzhanshi["清心咒"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xCC7D6870
	}
	Jinengzhanshi["捆仙绳"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x2320b82f
	}
	Jinengzhanshi["缚龙索"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x2320b82f
	}
	Jinengzhanshi["现形符"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x86AF33D1
	}
	Jinengzhanshi["发瘟匣"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x5F0D2E50
	}
	Jinengzhanshi["断线木偶"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xA9A08E99
	}
	Jinengzhanshi["五彩娃娃"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x5C86CDBC
	}
	Jinengzhanshi["番天印"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xb33784e0
	}
	Jinengzhanshi["罗汉珠"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x14846B1B
	}
	Jinengzhanshi["分水"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xD330F6C9
	}
	Jinengzhanshi["赤焰"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x743685D8
	}
	Jinengzhanshi["摄魂"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xBDD4BF97
	}
	Jinengzhanshi["鬼泣"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xF600EEBC
	}
	Jinengzhanshi["照妖镜"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xA4E6ECB0
	}
	Jinengzhanshi["缩地尺"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x58C421DC
	}
	Jinengzhanshi["影蛊"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x63E46E78
	}
	Jinengzhanshi["混元伞"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x7729A9E5
	}
	Jinengzhanshi["落宝金钱"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x1E296612
	}
	Jinengzhanshi["无魂傀儡"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x05896BCC
	}
	Jinengzhanshi["苍白纸人"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xB91E0707
	}
	Jinengzhanshi["乾坤玄火塔"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xF5601CC2
	}
	Jinengzhanshi["无尘扇"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xA1224711
	}
	Jinengzhanshi["七宝玲珑灯"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x6099C4D3
	}
	Jinengzhanshi["无字经"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x7E0AC2BC
	}
	Jinengzhanshi["干将莫邪"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x6B5B81EF
	}
	Jinengzhanshi["失心钹"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xA2FE6F68
	}
	Jinengzhanshi["神木宝鼎"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "common/item.wdf"
		,jns7 = 0x93A0FC49
	}
	Jinengzhanshi["天煞"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "common/item.wdf"
		,jns7 = 0x690B67CD
	}
	Jinengzhanshi["金蟾"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "common/item.wdf"
		,jns7 = 0xA4727B32
	}
	Jinengzhanshi["苍灵雪羽"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "common/item.wdf"
		,jns7 = 0xED26751B
	}
	Jinengzhanshi["烽火狼烟"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "common/item.wdf"
		,jns7 = 0xA996541F
	}
	Jinengzhanshi["舞雪冰蝶"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "common/item.wdf"
		,jns7 = 0xFBCFDC2F
	}
	Jinengzhanshi["紫火如意"]={
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "common/item.wdf"
		,jns7 = 0xC75A72E3
    --道具
    }
    Jinengzhanshi["飞刀"]={ -- 10暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xA4C811C5
	}
	Jinengzhanshi["飞蝗石"]={ -- 20暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x4C07009E
	}
	Jinengzhanshi["铁蒺黎"]={ -- 30暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x2851A8EC
	}
	Jinengzhanshi["无影神针"]={ -- 50暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x961527F8
	}
	Jinengzhanshi["孔雀翎"]={ -- 50暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xB2657A38
	}
	Jinengzhanshi["含沙射影"]={ -- 60暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xBE43C96E
	}
	Jinengzhanshi["回龙镊魂镖"]={ -- 70暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xCD324F8E
	}
	Jinengzhanshi["寸阴若梦"]={ -- 80暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xFB2A8F4C
	}
	Jinengzhanshi["魔睛子"]={ -- 90暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0x82A15466
	}
	Jinengzhanshi["顺逆神针"]={ -- 100暗器
		jns1 = ""
		,jns10 = {0,0}
		,jns6 = "item.wdf"
		,jns7 = 0xA1716F61
	-- 二级药品
	}
	Jinengzhanshi["熊胆"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 1374442124
	}
	Jinengzhanshi["麝香"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 117711803
	}
	Jinengzhanshi["丁香水"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 870043705
	}
	Jinengzhanshi["天不老"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xA1292738
	}
	Jinengzhanshi["紫石英"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x388CCEE9
	}
	Jinengzhanshi["鹿茸"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x92DCE8F4
	}
	Jinengzhanshi["血色茶花"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x50B560E1
	}
	Jinengzhanshi["六道轮回"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x7A231B4A
	}
	Jinengzhanshi["熊胆"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x51EC528C
	}
	Jinengzhanshi["凤凰尾"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x5BC584A7
	}
	Jinengzhanshi["硫磺草"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x338422D9
	}
	Jinengzhanshi["龙之心屑"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xBF847936
	}
	Jinengzhanshi["火凤之睛"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xD0B9CCDF
	}
	Jinengzhanshi["丁香水"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x33DBD039
	}
	Jinengzhanshi["月星子"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x18450CD6
	}
	Jinengzhanshi["仙狐涎"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xB5F99FA9
	}
	Jinengzhanshi["地狱灵芝"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x2F7C81CE
	}
	Jinengzhanshi["血珊瑚"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x0789B660
	}
	Jinengzhanshi["餐风饮露"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xEB07E77A
	}
	Jinengzhanshi["白露为霜"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xC94308D2
	}
	Jinengzhanshi["天龙水"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x3256793E
	}
	Jinengzhanshi["孔雀红"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xF4A285EE
		--三级药药品
	}
	Jinengzhanshi["金创药"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 3360268674
	}
	Jinengzhanshi["金香玉"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 875333087
	}
	Jinengzhanshi["小还丹"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 1261161767
	}
	Jinengzhanshi["千年保心丹"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 3968259402
	}
	Jinengzhanshi["风水混元丹"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 1613137255
	}
	Jinengzhanshi["定神香"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 2570329553
	}
	Jinengzhanshi["蛇蝎美人"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 2982020731
	}
	Jinengzhanshi["十香返生丸"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xC4D733DA
	}
	Jinengzhanshi["九转回魂丹"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 68961914
	}
	Jinengzhanshi["佛光舍利子"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 68961914
	}
	Jinengzhanshi["五龙丹"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 260113467
	}
	Jinengzhanshi["红雪散"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x8ABE812C
    --酒
    }
    Jinengzhanshi["女儿红"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x2ECB8558
	}
	Jinengzhanshi["珍露酒"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x71F4446B
	}
	Jinengzhanshi["梅花酒"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x717E19FF
	}
	Jinengzhanshi["蛇胆酒"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x6607309D
	}
	Jinengzhanshi["虎骨酒"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xCD6FDF37
	}
	Jinengzhanshi["百味酒"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0x1FA7B36A
	}
	Jinengzhanshi["醉生梦死"]={
		jns1 = ""
		,jns10 = {-4,0}
		,jns6 = "item.wdf"
		,jns7 = 0xED576385
	}

	--高级三药药品
	-- Jinengzhanshi["黑玉云苓膏"]={
	-- 	jns1 = ""
	-- 	,jns10 = {-4,0}
	-- 	,jns6 = "common/item.wdf"
	-- 	,jns7 = 0xf26ec524
	-- Jinengzhanshi["金石返魂丹"]={
	-- 	jns1 = ""
	-- 	,jns10 = {-4,0}
	-- 	,jns6 = "common/item.wdf"
	-- 	,jns7 = 0xe1f55a52
	-- Jinengzhanshi["百炼金乌丸"]={
	-- 	jns1 = ""
	-- 	,jns10 = {-4,0}
	-- 	,jns6 = "common/item.wdf"
	-- 	,jns7 = 0xe83da360
	-- Jinengzhanshi["生骨续命膏"]={
	-- 	jns1 = ""
	-- 	,jns10 = {-4,0}
	-- 	,jns6 = "common/item.wdf"
	-- 	,jns7 = 0xcadbd5d8

	-- Jinengzhanshi["回春龙沙散"]={
	-- 	jns1 = ""
	-- 	,jns10 = {-4,0}
	-- 	,jns6 = "common/item.wdf"
	-- 	,jns7 = 0xf6d57eba

	-- Jinengzhanshi["紫心玉露丸"]={
	-- 	jns1 = ""
	-- 	,jns10 = {-4,0}
	-- 	,jns6 = "common/item.wdf"
	-- 	,jns7 = 0xfec469af

function 引擎.取队标(mc)
	local n = {}
	if mc == "无" then
		n[1] = 0x2231EBB4
		n[2]="addon.wdf"
	elseif mc == "桃心" then
		n[1] = 29258956
		n[2]="ceshi.wdf"
	elseif mc == "风车" then
		n[1] = 3853854354
		n[2]="ceshi.wdf"
	elseif mc == "彩虹" then
		n[1] = 308366690
		n[2]="ceshi.wdf"
	elseif mc == "扇子" then
		n[1] = 455473705
		n[2]="ceshi.wdf"
	elseif mc == "小猪" then
		n[1] = 513497159
		n[2]="ceshi.wdf"
	elseif mc == "音符" then
		n[1] = 634519924
		n[2]="ceshi.wdf"
	elseif mc == "火苗" then
		n[1] = 1355352998
		n[2]="ceshi.wdf"
	elseif mc == "草莓" then
		n[1] = 1697795884
		n[2]="ceshi.wdf"
	elseif mc == "兔子" then
		n[1] = 1960707544
		n[2]="ceshi.wdf"
	elseif mc == "蝴蝶" then
		n[1] = 2675140616
		n[2]="ceshi.wdf"
	elseif mc == "海星" then
		n[1] = 3781957335
		n[2]="ceshi.wdf"
	elseif mc == "葫芦" then
		n[1] = 3683903297
		n[2]="ceshi.wdf"
	elseif mc == "螃蟹" then
		n[1] = 3831908474
		n[2]="ceshi.wdf"
	elseif mc == "狮王" then
		n[1] = 3940903556
		n[2]="ceshi.wdf"
	elseif mc == "绿叶" then
		n[1] = 1534585598
		n[2]="ceshi.wdf"
	elseif mc == "红伞" then
		n[1] = 543383923
		n[2]="ceshi.wdf"
	elseif mc == "猫头" then
		n[1] = 3204493129
		n[2]="ceshi.wdf"
	end
	return n
end

function 引擎.取光环(tx)
	local n={}
 	-- if tx == "九霄云图" then
 	-- 	n[1]="九霄云图"
 	-- 	n[2]="九霄云图"
 	-- 	n[3]="九霄云图"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "月半潮墨黑" then
 	-- 	n[1]="月半潮墨黑"
 	-- 	n[2]="月半潮墨黑"
 	-- 	n[3]="月半潮墨黑"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "琪花瑶草" then
 	-- 	n[1]="琪花瑶草"
 	-- 	n[2]="琪花瑶草"
 	-- 	n[3]="琪花瑶草"
 	--   	n[4]="r3d.dll"
 	-- elseif tx == "财源滚滚" then
 	-- 	n[1]="财源滚滚"
 	-- 	n[2]="财源滚滚"
 	-- 	n[3]="财源滚滚"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "寒霜冰凌" then
 	-- 	n[1]="寒霜冰凌"
 	-- 	n[2]="寒霜冰凌"
 	-- 	n[3]="寒霜冰凌"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "金枝春绽" then
 	-- 	n[1]="金枝春绽"
 	-- 	n[2]="金枝春绽"
 	-- 	n[3]="金枝春绽"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "九尾庞庞" then
 	-- 	n[1]="九尾庞庞"
 	-- 	n[2]="九尾庞庞"
 	-- 	n[3]="九尾庞庞"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "浪淘沙墨黑" then
 	-- 	n[1]="浪淘沙墨黑"
 	-- 	n[2]="浪淘沙墨黑"
 	-- 	n[3]="浪淘沙墨黑"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "浪淘沙月白" then
 	-- 	n[1]="浪淘沙月白"
 	-- 	n[2]="浪淘沙月白"
 	-- 	n[3]="浪淘沙月白"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "凌霄天宫" then
 	-- 	n[1]="凌霄天宫"
 	-- 	n[2]="凌霄天宫"
 	-- 	n[3]="凌霄天宫"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "凌霄天宫墨黑" then
 	-- 	n[1]="凌霄天宫墨黑"
 	-- 	n[2]="凌霄天宫墨黑"
 	-- 	n[3]="凌霄天宫墨黑"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "凌霄天宫月白" then
 	-- 	n[1]="凌霄天宫月白"
 	-- 	n[2]="凌霄天宫月白"
 	-- 	n[3]="凌霄天宫月白"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "流云蝶影" then
 	-- 	n[1]="流云蝶影"
 	-- 	n[2]="流云蝶影"
 	-- 	n[3]="流云蝶影"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "琪草瑶花" then
 	-- 	n[1]="琪草瑶花"
 	-- 	n[2]="琪草瑶花"
 	-- 	n[3]="琪草瑶花"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "沙骨王座" then
 	-- 	n[1]="沙骨王座"
 	-- 	n[2]="沙骨王座"
 	-- 	n[3]="沙骨王座"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "午夜魔蝠" then
 	-- 	n[1]="午夜魔蝠"
 	-- 	n[2]="午夜魔蝠"
 	-- 	n[3]="午夜魔蝠"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "星驰剑阵" then
 	-- 	n[1]="星驰剑阵"
 	-- 	n[2]="星驰剑阵"
 	-- 	n[3]="星驰剑阵"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "星驰剑阵染" then
 	-- 	n[1]="星驰剑阵染"
 	-- 	n[2]="星驰剑阵染"
 	-- 	n[3]="星驰剑阵染"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "月半潮" then
 	-- 	n[1]="月半潮"
 	-- 	n[2]="月半潮"
 	-- 	n[3]="月半潮"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "月半潮月白" then
 	-- 	n[1]="月半潮月白"
 	-- 	n[2]="月半潮月白"
 	-- 	n[3]="月半潮月白"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "云龙梦" then
 	-- 	n[1]="云龙梦"
 	-- 	n[2]="云龙梦"
 	-- 	n[3]="云龙梦"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "云龙梦墨黑" then
 	-- 	n[1]="云龙梦墨黑"
 	-- 	n[2]="云龙梦墨黑"
 	-- 	n[3]="云龙梦墨黑"
 	-- 	n[4]="r3d.dll"
 	-- elseif tx == "云龙梦月白" then
 	-- 	n[1]="云龙梦月白"
 	-- 	n[2]="云龙梦月白"
 	-- 	n[3]="云龙梦月白"
 	-- 	n[4]="r3d.dll"
 	if tx == "九霄云图" then
 		n[1]="九霄云图"
 		n[2]="九霄云图"
 		n[3]="九霄云图"
 		n[4]="r3d.dll"
 	elseif tx == "月半潮墨黑" then
 		n[1]="月半潮墨黑"
 		n[2]="月半潮墨黑"
 		n[3]="月半潮墨黑"
 		n[4]="r3d.dll"
 	elseif tx == "琪花瑶草" then
 		n[1]="琪花瑶草"
 		n[2]="琪花瑶草"
 		n[3]="琪花瑶草"
 	  	n[4]="r3d.dll"
 	elseif tx == "财源滚滚" then
 		n[1]="财源滚滚"
 		n[2]="财源滚滚"
 		n[3]="财源滚滚"
 		n[4]="r3d.dll"
 	elseif tx == "寒霜冰凌" then
 		n[1]="寒霜冰凌"
 		n[2]="寒霜冰凌"
 		n[3]="寒霜冰凌"
 		n[4]="r3d.dll"
 	elseif tx == "金枝春绽" then
 		n[1]="金枝春绽"
 		n[2]="金枝春绽"
 		n[3]="金枝春绽"
 		n[4]="r3d.dll"
 	elseif tx == "九尾庞庞" then
 		n[1]="九尾庞庞"
 		n[2]="九尾庞庞"
 		n[3]="九尾庞庞"
 		n[4]="r3d.dll"
 	elseif tx == "浪淘沙墨黑" then
 		n[1]="浪淘沙墨黑"
 		n[2]="浪淘沙墨黑"
 		n[3]="浪淘沙墨黑"
 		n[4]="r3d.dll"
 	elseif tx == "浪淘沙月白" then
 		n[1]="浪淘沙月白"
 		n[2]="浪淘沙月白"
 		n[3]="浪淘沙月白"
 		n[4]="r3d.dll"
 	elseif tx == "凌霄天宫" then
 		n[1]="凌霄天宫"
 		n[2]="凌霄天宫"
 		n[3]="凌霄天宫"
 		n[4]="r3d.dll"
 	elseif tx == "凌霄天宫墨黑" then
 		n[1]="凌霄天宫墨黑"
 		n[2]="凌霄天宫墨黑"
 		n[3]="凌霄天宫墨黑"
 		n[4]="r3d.dll"
 	elseif tx == "凌霄天宫月白" then
 		n[1]="凌霄天宫月白"
 		n[2]="凌霄天宫月白"
 		n[3]="凌霄天宫月白"
 		n[4]="r3d.dll"
 	elseif tx == "流云蝶影" then
 		n[1]="流云蝶影"
 		n[2]="流云蝶影"
 		n[3]="流云蝶影"
 		n[4]="r3d.dll"
 	elseif tx == "琪草瑶花" then
 		n[1]="琪草瑶花"
 		n[2]="琪草瑶花"
 		n[3]="琪草瑶花"
 		n[4]="r3d.dll"
 	elseif tx == "沙骨王座" then
 		n[1]="沙骨王座"
 		n[2]="沙骨王座"
 		n[3]="沙骨王座"
 		n[4]="r3d.dll"
 	elseif tx == "午夜魔蝠" then
 		n[1]="午夜魔蝠"
 		n[2]="午夜魔蝠"
 		n[3]="午夜魔蝠"
 		n[4]="r3d.dll"
 	elseif tx == "星驰剑阵" then
 		n[1]="星驰剑阵"
 		n[2]="星驰剑阵"
 		n[3]="星驰剑阵"
 		n[4]="r3d.dll"
 	elseif tx == "星驰剑阵染" then
 		n[1]="星驰剑阵染"
 		n[2]="星驰剑阵染"
 		n[3]="星驰剑阵染"
 		n[4]="r3d.dll"
 	elseif tx == "月半潮" then
 		n[1]="月半潮"
 		n[2]="月半潮"
 		n[3]="月半潮"
 		n[4]="r3d.dll"
 	elseif tx == "月半潮月白" then
 		n[1]="月半潮月白"
 		n[2]="月半潮月白"
 		n[3]="月半潮月白"
 		n[4]="r3d.dll"
 	elseif tx == "云龙梦" then
 		n[1]="云龙梦"
 		n[2]="云龙梦"
 		n[3]="云龙梦"
 		n[4]="r3d.dll"
 	elseif tx == "云龙梦墨黑" then
 		n[1]="云龙梦墨黑"
 		n[2]="云龙梦墨黑"
 		n[3]="云龙梦墨黑"
 		n[4]="r3d.dll"
 	elseif tx == "云龙梦月白" then
 		n[1]="云龙梦月白"
 		n[2]="云龙梦月白"
 		n[3]="云龙梦月白"
 		n[4]="r3d.dll"
	end
	return n
end

function 引擎.取足迹(zj)
	local zjs = {}
	if zj == "浮游水母" then--
	zjs[1] = 0x5841D4FC
	zjs[2] = "common/addon.wdf"
	elseif zj == "闪光足迹" then --
	zjs[1] = 0x38079F9D
	zjs[2] = "common/addon.wdf"
	elseif zj == "青草足迹" then --
	zjs[1] = 0x173C29B5
	zjs[2] = "common/addon.wdf"
	elseif zj == "糖果足迹" then --
	zjs[1] = 0x2FF794F8
	zjs[2] = "common/addon.wdf"
	elseif zj == "爱心足迹" then --
	zjs[1] = 0x7D75476A
	zjs[2] = "common/addon.wdf"
	elseif zj == "玉剑足迹" then --
	zjs[1] = 0xBA3A3239
	zjs[2] = "common/addon.wdf"
	elseif zj == "晶翅足迹" then --
	zjs[1] = 0xE6B33F90
	zjs[2] = "common/addon.wdf"
	elseif zj == "蝴蝶足迹" then --
	zjs[1] = 0xA872E424
	zjs[2] = "common/addon.wdf"
	elseif zj == "爱的泡泡" then --
	zjs[1] = 0xE4E5EEAF
	zjs[2] = "common/addon.wdf"
	elseif zj == "爱的风暴" then--
	zjs[1] = 0x4CEE16D1
	zjs[2] = "common/addon.wdf"
	elseif zj == "璀璨烟花" then --
	zjs[1] = 0x2EA044B9
	zjs[2] = "common/addon.wdf"
	elseif zj == "心享气球" then--
	zjs[1] = 0x37BE87E8
	zjs[2] = "common/addon.wdf"

	end
	return zjs
end

function 取称谓名称(zj)
	local zjs = {}
	if zj == "武神坛明星赛八强" then
		zjs[1] = 0x697e221c
		zjs[2] = "common/wzife.wdf"
	elseif zj == "武神坛明星赛季军" then
		zjs[1] = 0x69e88e4d
		zjs[2] = "common/wzife.wdf"
	elseif zj == "武神坛明星赛亚军" then
		zjs[1] = 0x550b771d
		zjs[2] = "common/wzife.wdf"
	elseif zj == "武神坛明星赛冠军" then
		zjs[1] = 0xeb07cccd
		zjs[2] = "common/wzife.wdf"
	elseif zj == "武神坛甲组八强" then
		zjs[1] = 0x7419201d
		zjs[2] = "common/wzife.wdf"
	elseif zj == "武神坛甲组季军" then
		zjs[1] = 0x6336f8b3
		zjs[2] = "common/wzife.wdf"
	elseif zj == "武神坛甲组亚军" then
		zjs[1] = 0xe7706ee2
		zjs[2] = "common/wzife.wdf"
	elseif zj == "武神坛甲组冠军" then
		zjs[1] = 0xc4a082c0
		zjs[2] = "common/wzife.wdf"
	elseif zj == "威震天下" then
		zjs[1] = 0x10000000
		zjs[2] = "sjm.wdf"


	end
	return zjs
end

function 取称谓特效(mc)
	local zjs = {}
	if zj == "树精灵" then
		zjs[1] = 0x78432af2
		zjs[3] = "common/wzife.wdf"
	elseif zj == "花瓣" then
		zjs[1] = 0x57ab05c8
		zjs[3] = "common/wzife.wdf"
	elseif zj == "彩色泡泡" then
		zjs[1] = 0x5e14c2bc
		zjs[3] = "common/wzife.wdf"
	elseif zj == "翅膀" then
		zjs[1] = 0x4cde32f
		zjs[2] = 0x6429c0ba
		zjs[3] = "common/wzife.wdf"
	elseif zj == "水环" then
		zjs[1] = 0xf811516a
		zjs[2] = 0xed9777e8
		zjs[3] = "common/wzife.wdf"
	elseif zj == "电环" then
		zjs[1] = 0x3a44c877
		zjs[2] = 0xf2e89215
		zjs[3] = "common/wzife.wdf"
	end
	return zjs
end

function 取冒泡框(zj)
	local zjs = {}
	if zj == "灿烂葵花" then
		zjs[1] = 0xcd2c5fb5
		zjs[2] = 0x7ee380be
		zjs[3] = 0xb37a9e8a
		zjs[4] = 0x8af1df70
		zjs[5] = 0x2d4ec852
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "冰清玉洁" then
		zjs[1] = 0x77ea18da
		zjs[2] = 0xa1dfcd65
		zjs[3] = 0x37baa64f
		zjs[4] = 0x1e2e1e43
		zjs[5] = 0x706b9381
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 23
	elseif zj == "甜蜜葡萄" then
		zjs[1] = 0xaef4e92b
		zjs[2] = 0x204429bb
		zjs[3] = 0xe4b7807c
		zjs[4] = 0x93f56713
		zjs[5] = 0xf2565916
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "觅缘" then
		zjs[1] = 0xbd1bdf99
		zjs[2] = 0xdadfb05c
		zjs[3] = 0x30c73574
		zjs[4] = 0x3b06a859
		zjs[5] = 0x737ab5c6
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "喜结连理" then
		zjs[1] = 0x526cee7c
		zjs[2] = 0xab953826
		zjs[3] = 0x80c10829
		zjs[4] = 0xb9e8cc57
		zjs[5] = 0x9b531254
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "甜甜蜜蜜" then
		zjs[1] = 0x12d3a91c
		zjs[2] = 0x975df49
		zjs[3] = 0xf167f527
		zjs[4] = 0xffa201f4
		zjs[5] = 0x5943a136
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 5
	elseif zj == "泡泡相约" then
		zjs[1] = 0x18fff411
		zjs[2] = 0x800f661c
		zjs[3] = 0x4082673
		zjs[4] = 0x3158ca6d
		zjs[5] = 0x84482aa2
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 5
	elseif zj == "秋意浓" then
		zjs[1] = 0xbb5b6b49
		zjs[2] = 0x5bb86395
		zjs[3] = 0x2313ad48
		zjs[4] = 0x53bfab4a
		zjs[5] = 0x110cc05d
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "踏雪寻梅" then
		zjs[1] = 0x58ca78a7
		zjs[2] = 0xd45d0539
		zjs[3] = 0x47de212d
		zjs[4] = 0x55f56aa
		zjs[5] = 0xbe86d59b
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 5
	elseif zj == "竹下饮" then
		zjs[1] = 0x2f61f868
		zjs[2] = 0xca459fb8
		zjs[3] = 0xcd7909be
		zjs[4] = 0x78271e77
		zjs[5] = 0x8e7c0a5e
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 5
	elseif zj == "午夜惊魂" then
		zjs[1] = 0x6e017041
		zjs[2] = 0xa13b2579
		zjs[3] = 0x3196a572
		zjs[4] = 0xd22e1433
		zjs[5] = 0x96c0c430
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 10
	elseif zj == "暖暖线球" then
		zjs[1] = 0xfc114b6e
		zjs[2] = 0xe8bbe0d8
		zjs[3] = 0x871d415c
		zjs[4] = 0xc4c7ff87
		zjs[5] = 0x5ac719c1
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 12
	elseif zj == "云中传音" then
		zjs[1] = 0x51737b69
		zjs[2] = 0x75b35290
		zjs[3] = 0x2f7a851c
		zjs[4] = 0xf22180ca
		zjs[5] = 0x2b58bd46
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 10
	elseif zj == "夏日西瓜" then
		zjs[1] = 0xe147b711
		zjs[2] = 0xf54f7779
		zjs[3] = 0xbf3f4ac1
		zjs[4] = 0x4858709b
		zjs[5] = 0x423c7d69
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 20
	elseif zj == "鸿雁传情" then
		zjs[1] = 0x4a938f03
		zjs[2] = 0x1812b9af
		zjs[3] = 0x4fcf3d4
		zjs[4] = 0x3dcefea6
		zjs[5] = 0x4b1c743
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 20
	elseif zj == "中国结" then
		zjs[1] = 0x8fce5371
		zjs[2] = 0xab968e41
		zjs[3] = 0x9fe52d7e
		zjs[4] = 0xeb8ef380
		zjs[5] = 0x69922009
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "冰雪天地" then
		zjs[1] = 0x82fb7c04
		zjs[2] = 0x692f87b3
		zjs[3] = 0x4decdaf3
		zjs[4] = 0x6949b8ff
		zjs[5] = 0x5997460a
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 25
	elseif zj == "星月童话" then
		zjs[1] = 0x71ea22fb
		zjs[2] = 0x692fa263
		zjs[3] = 0xc650cd70
		zjs[4] = 0xc090f28d
		zjs[5] = 0x19b3703e
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 5
	elseif zj == "绯色蔷薇" then
		zjs[1] = 0x798faf7b
		zjs[2] = 0xadd32f00
		zjs[3] = 0xf2716114
		zjs[4] = 0x90e807a7
		zjs[5] = 0xf1ce4544
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "荷塘虹影" then
		zjs[1] = 0xd4cfb56
		zjs[2] = 0x752e6ee3
		zjs[3] = 0xd983a4fe
		zjs[4] = 0xbeb3ad3b
		zjs[5] = 0xbc59cfd5
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "四叶草" then
		zjs[1] = 0x6de7b5d8
		zjs[2] = 0x439d494e
		zjs[3] = 0x3356cc31
		zjs[4] = 0x951250b2
		zjs[5] = 0xd9c07d45
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "海洋乐园" then
		zjs[1] = 0xc75621ac
		zjs[2] = 0x124e001b
		zjs[3] = 0x3f1a5a83
		zjs[4] = 0xf95a15
		zjs[5] = 0x96c4ca08
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 25
	elseif zj == "木纹回忆" then
		zjs[1] = 0x1c3ab104
		zjs[2] = 0xcbcaf06b
		zjs[3] = 0x71409476
		zjs[4] = 0xc268eee8
		zjs[5] = 0x7c4d7435
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "悦动之心" then
		zjs[1] = 0x76817e92
		zjs[2] = 0xabb29ea6
		zjs[3] = 0xa9779f8d
		zjs[4] = 0x3449d74a
		zjs[5] = 0x9eff260e
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "飞翔之翼" then
		zjs[1] = 0x8b8be1b0
		zjs[2] = 0x52bc2f26
		zjs[3] = 0x5c7ce3bc
		zjs[4] = 0x13892b93
		zjs[5] = 0x15de1910
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "花之浪漫" then
		zjs[1] = 0x263f5811
		zjs[2] = 0xcb54b12f
		zjs[3] = 0x39edc327
		zjs[4] = 0xf4730c1a
		zjs[5] = 0x38d8ad3d
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "龙虎斗" then
		zjs[1] = 0x457437e4
		zjs[2] = 0xd7ea9dc8
		zjs[3] = 0x93aa515a
		zjs[4] = 0xc7360f6
		zjs[5] = 0x58388303
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "龙虎斗" then
		zjs[1] = 0x201e0ad6
		zjs[2] = 0x21f08540
		zjs[3] = 0x1965935a
		zjs[4] = 0x15189c63
		zjs[5] = 0x8e406176
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "吉祥如意" then
		zjs[1] = 0x11897893 -- 上
		zjs[2] = 0xaaeaa916 -- 下
		zjs[3] = 0xffb0b729 -- 中
		zjs[4] = 0x4ced68bf -- 小模型
		zjs[5] = 0x91a91d56 -- 大模型
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 0
	elseif zj == "糖果" then
		zjs[1] = 0x66deb664
		zjs[2] = 0xf3d8c38
		zjs[3] = 0x1965935a
		zjs[4] = 0x89caa377
		zjs[5] = 0xaa95f67a
		zjs[6] = "common/wzife.wdf"
		zjs[7] = 7
	end
	return zjs
end

function 取传音特效(zj)
	local zjs = {}
	if zj == "鸿雁传书纸鸢" then
		zjs[1] = 0x32a77feb --上
		zjs[2] = 0xd9ad155 --下
		zjs[3] = 0xa5da7673 --中
		zjs[4] = 0xdb87c0e3 --效果预览
		zjs[5] = 0x91d58304 --按钮
		zjs[8] = "common/wzife.wdf"
	elseif zj == "财源滚滚纸鸢" then
		zjs[1] = 0xe3bd3af3
		zjs[2] = 0x5532559a
		zjs[3] = 0xf4f71376
		zjs[4] = 0xdb87c0e3
		zjs[5] = 0x22693ad8
		zjs[8] = "common/wzife.wdf"
	elseif zj == "喜从天降纸鸢" then
		zjs[1] = 0x8789add0
		zjs[2] = 0xa2c9a949
		zjs[3] = 0x8d402754
		zjs[4] = 0xd5f775d1
		zjs[5] = 0xd150ce5b
		zjs[8] = "common/wzife.wdf"
	elseif zj == "忽而今夏纸鸢" then
		zjs[1] = 0xfe7b1779
		zjs[2] = 0x891ca42c
		zjs[3] = 0x3413093d
		zjs[4] = 0x84ffacce
		zjs[5] = 0x18c7192e
		zjs[8] = "common/wzife.wdf"
	elseif zj == "万丈红尘纸鸢" then
		zjs[1] = 0xf96704c6
		zjs[2] = 0x21aaeda9
		zjs[3] = 0xdcdd4bdb
		zjs[4] = 0x94c67c3c
		zjs[5] = 0x1226795b
		zjs[8] = "common/wzife.wdf"
	elseif zj == "金粉世界纸鸢" then
		zjs[1] = 0x13df95a6
		zjs[2] = 0xded02ef2
		zjs[3] = 0xf20c1f8a
		zjs[4] = 0x43dcfd42
		zjs[5] = 0x1226795b
		zjs[8] = "common/wzife.wdf"
	elseif zj == "雪花纷飞纸鸢" then
		zjs[1] = 0x15fd4546
		zjs[2] = 0x2396ddc3
		zjs[3] = 0xc6cef932
		zjs[4] = 0x2410fe72
		zjs[5] = 0x6fc7301a
		zjs[8] = "common/wzife.wdf"
	elseif zj == "浪漫玫瑰纸鸢" then
		zjs[1] = 0xf5e2ebdf
		zjs[2] = 0x5186e094
		zjs[3] = 0xd224bde0
		zjs[4] = 0x5d1420d0
		zjs[5] = 0x1b2e5a6d
		zjs[8] = "common/wzife.wdf"
	end
end

function 引擎.取阵法效果(tx)
	local n={}
	if tx == "普通" then
    	n[1]=0X0EFB9CC5
   		n[2]="wzife.wdf"
	elseif  tx == "天覆阵" then
	    n[1]=0XE7195F87
		n[2]="wzife.wdf"
	elseif  tx == "风扬阵" then
	    n[1]=0x604C17C8
		n[2]="wzife.wdf"
	elseif  tx == "地载阵" then
		n[1]=0x0B9D8699
		n[2]="wzife.wdf"
	elseif  tx == "虎翼阵" then
   		n[1]=0x0711D67B
		n[2]="wzife.wdf"
	elseif  tx == "雷绝阵" then
		n[1]=0xFBD5C34F
		n[2]="wzife.wdf"
	elseif  tx == "龙飞阵" then
	   n[1]=0XE693FE63
	   n[2]="wzife.wdf"
	elseif  tx == "鸟翔阵" then
	   n[1]=0XACD2EFAA
	   n[2]="wzife.wdf"
	elseif  tx == "蛇蟠阵" then
	   n[1]=0XEE6FB5B5
	   n[2]="wzife.wdf"
	elseif  tx == "鹰啸阵" then
	    n[1]=0XFAD3E4FF
	    n[2]="wzife.wdf"
	elseif  tx == "云垂阵" then
	    n[1]=0xE26843B8
	    n[2]="wzife.wdf"
	end
	return n
end

function 取界面小图标(zj)
	local zjs = {}
	if zj == "摄妖香" then
		zjs[1] = 0x3ab6780f
		zjs[2] = 0xde5dbdfd
		zjs[3] = "wzife.wd1"
	elseif zj == "丹药紫" then
		zjs[1] = 0x24c33db7
		zjs[2] = 0x61000754
		zjs[3] = "wzife.wd1"
	elseif zj == "丹药绿" then
		zjs[1] = 0x54f0ed9b
		zjs[2] = 0x81ba998e
		zjs[3] = "wzife.wd1"
	elseif zj == "丹药蓝" then
		zjs[1] = 0x8beb614e
		zjs[2] = 0x2ea936e3
		zjs[3] = "wzife.wd1"
	elseif zj == "丹药黄" then
		zjs[1] = 0xefaeb7bb
		zjs[2] =0x994a022e
		zjs[3] = "wzife.wd1"
	elseif zj == "翅膀" then
		zjs[1] = 0x41d36e7e
		zjs[2] =0x41a7c6c1
		zjs[3] = "wzife.wd1"
	elseif zj == "心" then
		zjs[1] = 0xed258967
		zjs[2] =0x3d580ca6
		zjs[3] = "wzife.wd1"
	elseif zj == "宝箱" then
		zjs[1] = 0x4a95b4d0
		zjs[2] =0x5f31923c
		zjs[3] = "wzife.wd1"
	elseif zj == "火" then
		zjs[1] = 0x3e1ca604
		zjs[2] =0x1e0ee479
		zjs[3] = "wzife.wd1"
	elseif zj == "太极" then
		zjs[1] = 0xf73aa23d
		zjs[2] =0x2989d09
		zjs[3] = "wzife.wd1"
	elseif zj == "树叶" then
		zjs[1] = 0x8ad8ab32
		zjs[2] =0xc6f35885
		zjs[3] = "wzife.wd1"
	elseif zj == "问号" then
		zjs[1] = 0x2ecec5fa
		zjs[2] =0xcee1e88c
		zjs[3] = "wzife.wd1"
	elseif zj == "毛笔" then
		zjs[1] = 0x4bd8ba48
		zjs[2] =0xa8bf2975
		zjs[3] = "wzife.wd1"
	elseif zj == "钻石" then
		zjs[1] = 0xf335d150
		zjs[2] =0xd66565ea
		zjs[3] = "wzife.wd1"
	elseif zj == "剪刀手" then
		zjs[1] = 0xf1ac5f88
		zjs[2] =0xcff1459e
		zjs[3] = "wzife.wd1"
	elseif zj == "蜘蛛" then
		zjs[1] = 0xf61c3184
		zjs[2] =0xacb9752b
		zjs[3] = "wzife.wd1"
	elseif zj == "心碎" then
		zjs[1] = 0x3d4d2758
		zjs[2] =0x229c127c
		zjs[3] = "wzife.wd1"
	elseif zj == "莲座" then
		zjs[1] = 0x28e5311b
		zjs[2] =0x80ade1b4
		zjs[3] = "wzife.wd1"
	elseif zj == "虚弱" then
		zjs[1] = 0xeb11694b
		zjs[2] =0x1ae89684
		zjs[3] = "wzife.wd1"
	elseif zj == "拳头" then
		zjs[1] = 0x67aaefcd
		zjs[2] =0xc0a9b3f8
		zjs[3] = "wzife.wd1"
	elseif zj == "骷髅头" then
		zjs[1] = 0xe929d40f
		zjs[2] =0x26d5d07e
		zjs[3] = "wzife.wd1"
	elseif zj == "白菜" then
		zjs[1] =0xc789f28f
		zjs[2] =0x122f0f47
		zjs[3] = "wzife.wd1"
	elseif zj == "鸽子" then
		zjs[1] =0x8eac70f1
		zjs[2] =0xc7c409c5
		zjs[3] = "wzife.wd1"
	elseif zj == "流火" then
		zjs[1] =0xcc5c6e2f
		zjs[2] =0x90e374a
		zjs[3] = "wzife.wd1"
	elseif zj == "婴儿" then
		zjs[1] =0xd1c773a0
		zjs[2] =0xb2af45b3
		zjs[3] = "wzife.wd1"
	elseif zj == "蓝火头" then
		zjs[1] =0x8eb86f68
		zjs[2] =0x66324c99
		zjs[3] = "wzife.wd1"
	elseif zj == "彩虹" then
		zjs[1] =0x9908e263
		zjs[2] =0x5dcd56ce
		zjs[3] = "wzife.wd1"
	elseif zj == "嘴唇" then
		zjs[1] =0xa87da61c
		zjs[2] =0x1d902490
		zjs[3] = "wzife.wd1"
	elseif zj == "蝴蝶" then
		zjs[1] =0x986e4394
		zjs[2] =0xe71d2f5f
		zjs[3] = "wzife.wd1"
	elseif zj == "奔跑" then
		zjs[1] =0x9911bc29
		zjs[2] =0xa92286c0
		zjs[3] = "wzife.wd1"
	elseif zj == "乌龟" then
		zjs[1] =0xc011687b
		zjs[2] =0x9f474c0f
		zjs[3] = "wzife.wd1"
	elseif zj == "狮子" then
		zjs[1] =0xe977a845
		zjs[2] =0x312a2187
		zjs[3] = "wzife.wd1"
	elseif zj == "竹笋" then
		zjs[1] =0x79fa3f6d
		zjs[2] =0x57c5a649
		zjs[3] = "wzife.wd1"
	elseif zj == "弓箭" then
		zjs[1] =0x781da811
		zjs[2] =0xbae626f8
		zjs[3] = "wzife.wd1"
	elseif zj == "龙卷风" then
		zjs[1] =0xe514f02b
		zjs[2] =0xe6e67711
		zjs[3] = "wzife.wd1"
	elseif zj == "爪印" then
		zjs[1] =0x605779aa
		zjs[2] =0xee15d655
		zjs[3] = "wzife.wd1"
	elseif zj == "肌肉" then
		zjs[1] =0xe5da2599
		zjs[2] =0x16be59e3
		zjs[3] = "wzife.wd1"
	elseif zj == "宝箱2" then
		zjs[1] =0x4f7c3447
		zjs[2] =0x59e2a565
		zjs[3] = "wzife.wd1"
	elseif zj == "蛇" then
		zjs[1] =0xd1d86d54
		zjs[2] =0xbc37a095
		zjs[3] = "wzife.wd1"
	elseif zj == "爪尖" then
		zjs[1] =0xe29c7276
		zjs[2] =0xe08b50cc
		zjs[3] = "wzife.wd1"
	elseif zj == "海浪" then
		zjs[1] =0xa4acc8e8
		zjs[2] =0x99a2a32e
		zjs[3] = "wzife.wd1"
	elseif zj == "太阳" then
		zjs[1] =0x77c62ee0
		zjs[2] =0xbffe1444
		zjs[3] = "wzife.wd1"
	elseif zj == "金丹" then
		zjs[1] =0x74e1cf0d
		zjs[2] =0xe8581220
		zjs[3] = "wzife.wd1"
	elseif zj == "旗子" then
		zjs[1] =0x70cd1776
		zjs[2] =0xf318fdef
		zjs[3] = "wzife.wd1"
	elseif zj == "玉净瓶" then
		zjs[1] =0x7416e5b6
		zjs[2] =0x7b1a158d
		zjs[3] = "wzife.wd1"
	elseif zj == "云朵" then
		zjs[1] =0xa54d5872
		zjs[2] =0x45e15411
		zjs[3] = "wzife.wd1"
	elseif zj == "扇子" then
		zjs[1] =0x14b50878
		zjs[2] =0x8b88a88
		zjs[3] = "wzife.wd1"
	elseif zj == "眼睛" then
		zjs[1] =0x274346e
		zjs[2] =0x1a2d012
		zjs[3] = "wzife.wd1"
	elseif zj == "木鱼" then
		zjs[1] =0x1139d6aa
		zjs[2] =0xb97a817d
		zjs[3] = "wzife.wd1"
	elseif zj == "闪电" then
		zjs[1] =0xc4620dc
		zjs[2] =0xf5a8b88c
		zjs[3] = "wzife.wd1"
	elseif zj == "花骨朵" then
		zjs[1] =0x853f35d5
		zjs[2] =0xd40dbfa6
		zjs[3] = "wzife.wd1"
	elseif zj == "变身卡" then
		zjs[1] =0x462db5f2
		zjs[2] =0x27cabf0b
		zjs[3] = "ceshi.wdf"
	end
	return zjs
end

function 取界面小图标外框(zj)
	local zjs = {}
	if zj == "绿色" then
		zjs[1] = 0x8eaa4f08
		zjs[2] =0x13153890
		zjs[3] = "wzife.wd1"
	elseif zj == "橙色" then
		zjs[1] =0x47fab5d2
		zjs[2] =0x73b9ccf0
		zjs[3] = "wzife.wd1"
	elseif zj == "黑色" then
		zjs[1] =0x950db829
		zjs[2] =0x88bc4e93
		zjs[3] = "wzife.wd1"
	end
	return zjs
end
function 引擎.取新特效(tx)
	local n={}
	if tx == "虎威一震白" then
    	n[1]="虎威一震白攻击"
   		n[2]="sftx.dll"
	elseif  tx == "虎威一震黑" then
	    n[1]="虎威一震黑攻击"
		n[2]="sftx.dll"
	elseif  tx == "虎威一震金" then
	    n[1]="虎威一震攻击"
		n[2]="sftx.dll"
	elseif  tx == "虎啸生风黑" then
		n[1]="虎啸生风黑施法"
		n[2]="sftx.dll"
	elseif  tx == "虎啸生风金" then
   		n[1]="虎啸生风金施法"
		n[2]="sftx.dll"
	elseif  tx == "耀炎麒麟白" then
		n[1]="烈火麒麟白施法"
		n[2]="sftx.dll"
	elseif  tx == "耀炎麒麟黑" then
	   n[1]="烈火麒麟黑施法"
	   n[2]="sftx.dll"
	elseif  tx == "耀炎麒麟金" then
	   n[1]="麒麟烈焰金施法"
	   n[2]="sftx.dll"
	elseif  tx == "万物生长白" then
	   n[1]="万物生长白施法"
	   n[2]="sftx.dll"
	elseif  tx == "万物生长黑" then
	    n[1]="万物生长黑施法"
	    n[2]="sftx.dll"
	elseif  tx == "万物生长绿" then
	    n[1]="万物生长绿施法"
	    n[2]="sftx.dll"

	elseif  tx == "曜焰麒麟白" then
	    n[1]="曜焰麒麟白攻击"
	    n[2]="sftx.dll"
	elseif  tx == "曜焰麒麟黑" then
	    n[1]="曜焰麒麟黑攻击"
	    n[2]="sftx.dll"
	elseif  tx == "比翼飞粉" then
	    n[1]="比翼飞粉施法"
	    n[2]="sftx.dll"
	elseif  tx == "比翼飞蓝" then
	    n[1]="比翼飞蓝施法"
	    n[2]="sftx.dll"
	elseif  tx == "扶摇九霄" then
	    n[1]="扶摇九霄施法"
	    n[2]="sftx.dll"

	elseif  tx == "四海归源" then
	    n[1]="四海归渊攻击"
	    n[2]="sftx.dll"

	elseif  tx == "牛气冲天" then
	    n[1]="牛气冲天金施法"
	    n[2]="sftx.dll"
	elseif  tx == "齐天大圣（攻）" then
	    n[1]="齐天大圣攻击"
	    n[2]="sftx.dll"
	elseif  tx == "齐天大圣（法）" then
	    n[1]="齐天大圣施法"
	    n[2]="sftx.dll"

	elseif  tx == "齐天大圣·群法" then
	    n[1]="齐天大圣群法"
	    n[2]="sftx.dll"







	end
	return n
end


	-- elseif tx == "食指大动_香蕉" then
	-- 	txs[1] = 0x12f35dca
	-- 	txs[2] = "magic.wdf"
	-- elseif tx == "食指大动_菠萝" then
	-- 	txs[1] = 0x15016b39
	-- 	txs[2] = "magic.wdf"
	-- elseif tx == "食指大动_西瓜" then
	-- 	txs[1] = 0xbd4427bb
	-- 	txs[2] = "magic.wdf"
	-- elseif tx == "新_瘴气"  then --旧版没有 --全屏
	-- 	txs[1] = 0x9b69747b
	-- 	txs[2] ="common/magic.wdf"