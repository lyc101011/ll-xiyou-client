-- @Author: baidwwy
-- @Date:   2024-09-08 18:20:46
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2025-01-04 11:56:04
-- @Author: baidwwy
-- @Date:   2024-09-08 18:20:46
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-09-08 19:53:56
local 资源类_加载 = class()
local aaaa = require("gge纹理类")
local aaab = require("script/资源类/gge精灵类")
local aaac = require("Fmod类")
local bbbb = require("Script/资源类/动画类")
local bbbc = require("gge图像类1")
-- local 动画类锦衣=require("script/资源类/动画类锦衣")
local yq = 引擎
local ffi = require("ffi")

function 资源类_加载:初始化()
	self.wdf = {}
	self.zipjiam = {}
	self.zipjiam["影精灵.dll"] = 1
	self.zipjiam["aaa.wdf"] = 1
	self.zipjiam["jntb.wdf"] = 1
	self.zipjiam["mgtx.wdf"] = 1
	self.zipjiam["nice.wdf"] = 1
	self.zipjiam["Resource.ft"] = 1
	self.zipjiam["qwq.wdf"] = 1
	self.zipjiam["zztx.wdf"] = 1
	self.zipjiam["r3d.dll"] = 1
	self.zipjiam["tfg.rpk"] = 1 --lajiku
	self.zipjiam["ceshi.wdf"] = 1
	self.zipjiam["nx3d5.dll"] = 1
	self.zipjiam["nx3d6.dll"] = 1
	self.zipjiam["nx3d7.dll"] = 1
	self.zipjiam["xiaoshen.npk"] = 1
--	self.zipjiam["gagajinyi.dll"] = 1
	self.zipjiam["qytx.dll"] = 1
	self.zipjiam["bjy.wdf"] = 1
	self.zipjiam["wzcf.npk"] = 1
	self.zipjiam["sftx.dll"] = 1
	self.zipjiam["cjwf.dll"] = 1
	self.zipjiam["jntb.wdf"] = 1
end

function 资源类_加载:打开()
	引擎.添加资源('wdf/wzcf.npk',"afchdabjiibcaf")
	引擎.添加资源('rpk/pic',"4hnVlvj51P1i1xfHW")
	引擎.添加资源('rpk/ceshi',"4hnVlvj51P1i1xfHW")
	引擎.添加资源('rpk/aaa.rpk',"GPGsp1wIa4Yn")
	引擎.添加资源('rpk/jntb.rpk',"sdasdw1efretrej")
	引擎.添加资源('rpk/mgtx.wdf',"hZjXci11378dqrKUbY96Up5sQqG")
	引擎.添加资源('rpk/nice.rpk',"1")
	引擎.添加资源('rpk/Resource.rpk',"GPG1s1wIa4Yn")
	引擎.添加资源('rpk/qwq.rpk',"Su3b1鐮1磋1iKFRUseZ4vhtpz")
	引擎.添加资源('rpk/zztx.rpk',"GPGspp1Wz5wIa4Yn")
	引擎.添加资源('rpk/npcs.dll',"xSHeNfh111ERp11鍟婄殑Lk")
	引擎.添加资源('rpk/r3d.dll',"Su3b鐮磋1iK1FRUseZ4vhtpz$bGFu4MnVGz")
	引擎.添加资源('rpk/lajiku.rpk',"Su3b鐮磋1iKFRUseZ4vhtpz")
	引擎.添加资源('rpk/nx3d5.dll',"Su3b鐮磋1iKFRUseZ4vhtpz")
	引擎.添加资源('rpk/nx3d6.dll',"Su3b鐮磋1iKFRUseZ4vhtpz")
	引擎.添加资源('rpk/xiaoshen.npk',"qq1551337333qq")
--	引擎.添加资源('rpk/gagajinyi.dll',"qq1551337333qq")
	引擎.添加资源('rpk/qytx.dll',"qinyinsandietx123")
	引擎.添加资源('rpk/sftx.dll',"qinyinsandietx123")
	引擎.添加资源('rpk/cjwf.dll',"qinyinsandietx123")
	引擎.添加资源('rpk/bjy.rpk',"dgesewqQSF*&^!~~#!@sdgeSFDHR第三个我开了个晚爱上他歌曲娃娃钛合金")
	引擎.添加资源("rpk/影精灵.dll", "")
	self.files = {

		"common/uigy.wdf",--要清除
		"common/uisj.wdf",--要清除
		"lg.rpk", --要加密
		"org.rpk",
		"org3.rpk",
		"org4.rpk",
		"addon.wdf",
		"item.wdf",
		"item.wd1",
		"music.wdf",
		"common/item.wdf",
		"smap.wdf",
		"shape.wdf",
		"shape.wd2",
		"shape.wd3",
		"shape.wd4",
		"shape.wd5",
		"shape.wd6",
		"shape.wd7",
		"shape.wd8",
		"shape.wd9",
		"shape.wda",
		"shape.wdb",
		"shape.wdc",
		"wzife.wd1",
		"wzife.wd2",
		"wzife.wd3",
		"common/wzife.wdf",
		"wzife.wd5",
		"wzife.wdf",
		"waddon.wdf",
		"zdtb.wdf",
		"magic.wdf",
		"magic.wd1",
		"xsc1.wdf",
		"common/item.wdf",
		"common/lbc.wdf",
		"common/sml.wdf",
		"common/wdd.wdf",
		"common/magic.wdf",
		"common/add.wdf",
		"common/ski.wdf",
		"common/addon.wdf",
		"common/item.wdf",
		"common/shape.wdf",
		"mapani.wdf",
		"sound.wdf",
		"misc.wdf",
		"sound.wd1",
		"沉默.wdf",
		"nvdi1.wdf",
		"sjm.wdf",
		"XWD.wdf",
		"登陆资源.wdf",
		"自用图标.wdf",
		"xixige_newmall.gep",
		"audio/1922.mp3",
		"kkjn.wdf",
		"新物品图标.wdf",
		"vip.wdf",
		"cwmx.wdf",
		"jmtb.wdf",
		"影精灵.wdf",
		"xinjn.wdf",
		"火影1.wdf",
	}

	local __wdf = require("script/资源类/WDF")
	local format = string.format
	local a = wdf配置

	for n=1,#self.files do

		self.wdf[self.files[n]] = __wdf(format("%s/%s",a,self.files[n]),self.files[n])
	end

end

function 资源类_加载:取偏移(file,id)
	return self.wdf[file]:读偏移(id)
end

function 资源类_加载:读数据(file,id)
	return self.wdf[file]:读数据(id)
end

function 资源类_加载:载入(文件,类型,文件号,音量,附加,fs,fs1,juese)
	if (文件==nil or 文件=="") and 文件号 ~= nil then
		local t = type(文件号)
		if t == "string" then--and 文件 ~= "1.wpk" then
		    文件号= tonumber(文件号)
		end
		return self:载入未知WDF(nil,类型,string.format("%#x",tostring(文件号)),音量,附加,fs,fs1)
	end
	if 类型 == "网易WDF动画" then

		if self.zipjiam[文件] then

			if type(文件号) == "number" then
				文件号 = string.upper(string.format("%08x",tonumber(文件号)))
			end

			local 临时 =引擎.资源取文件(tostring(文件号)..'.was')
           			local a=ffi.cast("void*",临时)
			local b=引擎.资源取大小(tostring(文件号)..'.was')
		            local ddd =bbbb(文件,tostring(文件号),juese,a,b,缓存)
		            引擎.资源释放(临时)
			return ddd
		else
			if 文件==nil and 文件号==nil then
				if 引擎.场景 ~=nil then
	    		else

		    	end
		    	文件 = "wzife.wdf"
		    	文件号= 0xFCD58523
			elseif 文件~=nil and self.wdf[文件]==nil then
				if 引擎.场景 ~=nil then
		    	else

		    	end
		    	文件 = "wzife.wdf"
		    	文件号= 0xFCD58523
			elseif 文件~=nil and self.wdf[文件]~=nil and self.wdf[文件]:读数据(文件号)==nil then
				if 引擎.场景 ~=nil then
				else

				end
				文件 = "wzife.wdf"
			    	文件号= 0xFCD58523
			end
			return bbbb(文件,文件号,juese,self.wdf[文件 or "wzife.wdf"]:读数据(文件号 or 0xFCD58523))
		end

	elseif 类型 == "内置png" then
		return aaab(aaaa(self.wdf[文件]:读数据(文件号)))
	elseif 类型 == "图片" then

		local a,b=引擎.资源取文件(文件),引擎.资源取大小(文件)
		local c=aaaa(a,b)
		引擎.资源释放(a)
		return aaab(c)
	elseif 类型 == "音乐" then
		return aaac(文件,2,nil,nil,0 or 0)

	elseif 类型 == "加密音乐" then
		local a,b=引擎.资源取文件(文件),引擎.资源取大小(文件)
		local 数据 = ffi.new('uint8_t[?]',b)
		ffi.copy(数据,ffi.cast("uint8_t*",a),b)
		return aaac(数据,b)
	end
end

function 资源类_加载:载入未知WDF(file1,类型,id,音量,附加,fs,fs1,fjsj) -- String 例如 0x00FF 非法, 改为 0xFF 正确   资源:载入未知WDF(nil,"网易WDF动画","0xBECEA063")
	if id and tonumber(id) > 0 and file1 == nil then
		if 全局资源地址[id+0] ~= nil then
			if not self.wdf[全局资源地址[id+0]] then
				self:打开(全局资源地址[id+0])
			end
			return self:载入(全局资源地址[id+0],类型,到整数(id),音量,附加,fs,fs1,fjsj)
		end
		return self:载入(全局资源地址[id+0],类型,到整数(id),音量,附加,fs,fs1,fjsj)
	end
	return self:载入("wzife.wdf",类型,0xFCD58523)
end

return 资源类_加载
