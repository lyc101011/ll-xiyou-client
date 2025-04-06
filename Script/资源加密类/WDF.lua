--======================================================================--
-- @作者: GGE研究群: 342119466
-- @创建时间:   2018-03-03 02:34:19
-- @Last Modified time: 2024-04-08 23:31:06
--所有素材反编译由GGE开发者 313738139 baidwwy GGELUA作者亲自写.
--======================================================================--

     local ffi = require("ffi")

----flag添加自己定义的头文字 替换掉这个key，就能完成加密了
local Key2={0x54,0x45,0x53,0x54,0x6D,0x6D}
local function _解密列表(Data, Size)
    local Data = ffi.cast("char*", Data)
    local Key_Step = 1
    for i = 0, Size - 1, 1 do
        Data[i] = bit.bxor(Data[i], Key[Key_Step])
        Key_Step = Key_Step + 1
        if Key_Step == 34 then
            Key_Step = Key_Step + 1
        end
        if Key_Step == 258 then
            Key_Step = 1
        end
    end
end

function _WDF解密(Data, Size)
    local Data = ffi.cast("char*", Data)
    local Key_Step = 1
    for i = 0, Size - 1, 1 do
        Data[i] = bit.bxor(Data[i], Key2[Key_Step])
        Key_Step=Key_Step+1
        if Key_Step == #Key2 +1 then
           Key_Step = 1
        end
    end
end


ffi.cdef([[
    typedef struct {
        char Flag[4]; // 包裹的标签
        uint32_t Number; // 包裹中的文件数量
        uint32_t Offset; // 包裹中的文件列表偏移位置
    }WDF_HEADER;

    typedef struct {
        uint32_t Hash; // 文件的名字散列
        uint32_t Offset; // 文件的偏移
        uint32_t Size; // 文件的大小
        uint32_t Spaces; // 文件的空间
    }WDF_FILELIST;
]])

local wdf = class()
local _Max = 0
local _Ptr = nil
local 记录={}

function wdf:初始化(路径)
    self.路径 = 路径
    self.File = require("文件类")(路径)
    self.List = {}
    local head = self.File:读入数据(ffi.new("WDF_HEADER"))
    local flag = ffi.string(head.Flag, 4)
    self.flag = ffi.string(head.Flag, 4)
    self.File:移动读写位置(head.Offset, self.File.SEEK_SET)
    self.Clist = self.File:读入数据(ffi.new("WDF_FILELIST[?]", head.Number))
    ---工具重新定义自己的 头flag，然后再此做添加或者修改
    if self.flag ==  "MHWD" then
       _WDF解密(self.Clist, ffi.sizeof(self.Clist))
    end
    local MaxSize = 0
    for i = 0, head.Number - 1, 1 do
        self.List[self.Clist[i].Hash] = self.Clist[i]
        if MaxSize < self.Clist[i].Size then
            MaxSize = self.Clist[i].Size
        end
    end
    if _Max < MaxSize then
        _Max = MaxSize
        _Ptr = ffi.new("char[?]", MaxSize)
    end
end
function wdf:读数据(Hash)
 if 记录[Hash]==nil then
     记录[Hash]=self:读数据1(Hash)
  end
 return self:读数据1(Hash)--记录[Hash]
 end



function wdf:读数据(Hash)
  --_Ptr=nil

    if type(Hash) == "string" then
        Hash = tonumber(Hash)
    end
    --if 记录[Hash]~=nil then
    -- return 记录[Hash].a,记录[Hash].b
      --end
    if self.List[Hash] then
        self.File:移动读写位置(self.List[Hash].Offset,self.File.SEEK_SET)
        self.File:读入数据(_Ptr,self.List[Hash].Size)

        return _Ptr,self.List[Hash].Size
    else
    end
end

function wdf:取文件(Hash)
    return self:读数据(Hash)
end

function wdf:取纹理(Hash)
    return require("gge纹理类")(self:读数据(Hash))
end

function wdf:取精灵(Hash)
    return require("gge精灵类")(self:取纹理(Hash))
end

function wdf:读偏移(Hash)
    if self.List[Hash] then
        return self.List[Hash].Offset, self.List[Hash].Size
    end
end

function wdf:取偏移(Hash)
    if type(Hash) == "string" then
        Hash = tonumber(Hash)
    end
    if self.List[Hash] then
        return self.List[Hash].Offset
    end
end

function wdf:取长度(Hash)
    if type(Hash) == "string" then
        Hash = tonumber(Hash)
    end
    if self.List[Hash] then
        return self.List[Hash].Size
    end
end

function wdf:置注释(path)
    local ini = __gge.readfile(path)
    if ini then
        slot3, slot4, slot5 = ini:gmatch("([^\r\n]+)")
        if ini.gmatch("([^\r\n]+)") then
            local param, value = line:match("^(.-)%s*=%s*(.+)$")
            if param and value then
                if not self.List[value] then
                    self.List[value] = self.List[tonumber(param, 16)]
                    if not self.List[value] then
                    end
                else
                end
            end
        end
    else
        error("ini不存在！", level)
    end
    return self
end

return wdf
