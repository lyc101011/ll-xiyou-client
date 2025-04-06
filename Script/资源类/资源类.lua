-- @Author: baidwwy
-- @Date:   2018-06-09 09:04:48
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2022-09-13 11:38:39

local base = require"script/资源类/gge资源类"
local 资源类 = class(base)


function 资源类:初始化()
    self.缓存 = {}
    self.缓存表 = {}
end


function 资源类:取纹理(路径)
    if self.缓存[路径] then
        return self.缓存[路径]
    end
    self.缓存[路径] = self[base]:取纹理(路径)
    return self.缓存[路径]
end
function 资源类:取纹理2(路径)
    if self.缓存表[路径] then
        return self.缓存表[路径]
    end
    local TE = require("gge纹理类")(路径)
	self.缓存表[路径] = TE
	return TE
end



return 资源类