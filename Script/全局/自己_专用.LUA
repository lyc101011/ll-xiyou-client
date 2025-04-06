-- @Author: baidwwy
-- @Date:   2024-08-04 20:56:39
-- @Last Modified by:   baidwwy
-- @Last Modified time: 2024-10-29 06:17:52
--
local ffi = require("ffi")
ffi.cdef[[
	void* 	CreateFileA(const char*,int,int,void*,int,int,void*);
	bool  	DeviceIoControl(void*,int,void*,int,void*,int,void*,void*);
	bool 	CloseHandle(void*);
	//
	int      OpenClipboard(void*);
	void*    GetClipboardData(unsigned);
	int      CloseClipboard();
	void*    GlobalLock(void*);
	int      GlobalUnlock(void*);
	size_t   GlobalSize(void*);
	//
	int 	GetPrivateProfileStringA(const char*, const char*, const char*, const char*, unsigned, const char*);
	bool 	WritePrivateProfileStringA(const char*, const char*, const char*, const char*);

	int 	OpenClipboard(void*);
	void* 	GetClipboardData(unsigned);
	int 	CloseClipboard();
	void* 	GlobalLock(void*);
	int 	GlobalUnlock(void*);
	size_t 	GlobalSize(void*);

	int 	EmptyClipboard();
	void* 	GlobalAlloc(unsigned, unsigned);
	void* 	GlobalFree(void*);
	void* 	lstrcpy(void*,const char*);
	void* 	SetClipboardData(unsigned,void*);
	 //设置窗口样式
	void    SetWindowLongA(int ,int ,int );
	void    GetWindowLongA(int ,int );
	void    SetLayeredWindowAttributes(int ,int ,int ,int );
	//
	typedef struct {
		unsigned long i[2]; /* number of _bits_ handled mod 2^64 */
		unsigned long buf[4]; /* scratch buffer */
		unsigned char in[64]; /* input buffer */
		unsigned char digest[16]; /* actual digest after MD5Final call */
	} MD5_CTX;
	void MD5Init(MD5_CTX *);
	void MD5Update(MD5_CTX *, const char *, unsigned int);
	void MD5Final(MD5_CTX *);
	//
	int 	MessageBoxA(void *, const char*, const char*, int);
	void 	Sleep(int);
	int 	_access(const char*, int);
]]
local advapi32 = ffi.load("advapi32.dll")
local fun = {}

local lfs = require"lfs"
function 取文件夹的所有文件 (path)
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local f = path..'/'..file
			local attr = lfs.attributes (f)
			assert (type(attr) == "table")
			if attr.mode == "directory" then
			end
		end
	end
end

require"lfs"
function Lua遍历文档(rootpath, pathes)
	pathes = pathes or {}

	ret, files, iter = pcall(lfs.dir, rootpath)
	if ret == false then
		return pathes
	end
	for entry in files, iter do
		local next = false
		if entry ~= '.' and entry ~= '..' then
			local path = rootpath .. '/' .. entry
			local attr = lfs.attributes(path)
			if attr == nil then
				next = true
			end

			if next == false then
				if attr.mode == 'directory' then
					Lua遍历文档(path, pathes)
				else
					table.insert(pathes, path)
				end
			end
		end
		next = false
	end
	return pathes
end
pathes = {}

for i=1,#pathes do
	print(i .. " " .. pathes[i])
end

pathes = {}
function Lua遍历文档2(path)--方法2
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local f = path .. "/" .. file
			local attr = lfs.attributes(f)
			table.insert(pathes, f)
			print (#pathes,f)
		 end
	 end
end
function 取特殊字符(zf)
	local fhz = false
	local tszf = {[[~]],[[!]],[[@]],[[#]],[[&]],[[*]],[[-]],[[+]],[[\]],[[/]],[[ ]],[[{]],[[}]],[[GM]],[[gm]],[[游戏管理员]]}
	for i=1,#tszf do
		if string.find(zf,tszf[i]) ~= nil then
			fhz = true
		end
	end
	return fhz
end
function 取当前目录()
	local ffi = require("ffi")
	local path = ffi.new("char[256]")
	ffi.C.GetCurrentDirectoryA(256,path)
	return ffi.string(path)
end

function 置当前目录(路径)
	local ffi = require("ffi")
	ffi.C.SetCurrentDirectoryA(路径)
end

function 创建目录(dirname)
	print(lfs.currentdir(dirname))
		lfs.mkdir(dirname)
end

function 判断是否数组(是否数组)
	if type(是否数组) == "table" then
		return true
	end
	return false
end

function 删除目录(dirname)--成功返回true，失败返回nil加上错误信息
   return lfs.rmdir(dirname)
end

function 删除txt文件(dirname)--成功返回true，失败返回nil加上错误信息
	-- 删除存在的文件
	local rm_file = os.remove(dirname);
	print("remove exist file ret:")
	print(rm_file)
	print("\n")
end


function 取当前目录(dirname)--全部目录
	return lfs.currentdir(dirname)
end

function 取文档名称( strurl, strchar, bafter)
	local ts = string.reverse(strurl)
	local param1, param2 = string.find(ts, strchar)  -- 这里以"/"为例
	local m = string.len(strurl) - param2 + 1
	local result
	if (bafter == true) then
		result = string.sub(strurl, m+1, string.len(strurl))
	else
		result = string.sub(strurl, 1, m-1)
	end

	return result
end

function 获取文件名(str)--"aaa.bbb.bbb.txt"
	local idx = str:match(".+()%.%w+$")
	if(idx) then
		return str:sub(1, idx-1)
	else
		return str
	end
end

function 获取扩展名(str)--"aaa.bbb.bbb.txt"
	return str:match(".+%.(%w+)$")
end

function 调试输出(内容)
 return print(内容)
end

function 到文本(内容)
 return tonumber(内容)
end

function 到整数(内容)
 return math.ceil(内容)
end

function 取随机数(开始,结束)
 return math.random(开始,结束) --产生1到100之间的随机数［整数型 欲取随机数的最小值］，［整数型 欲取随机数的最大值］
end

function 取长度不足补位(szFullString)
	local 数据E=string.len(szFullString)
	if 数据E==1 then
		return "00"..szFullString
	elseif 数据E==2 then
		return "0"..szFullString
	else
		return szFullString
	end
end

function 取文本长度(szFullString, szSeparator)--tonumber(文本取长度("文本"))
	return string.len(szFullString)
end

function 判断目录或文件是否存在(path)--判断目录或文件是否存在
	local file = io.open(path, "rb")
	if file then
		file:close()
	end
	return file ~= nil
end

function 读入文件(fileName)
	local f = assert(io.open(fileName,'r'))
	local content = f:read('*all')
	f:close()
	if content=="" then content="无文本" end
	return content
end

function 获得文件长度(filename)
	local fh = assert(io.open(filename, "rb"))
	local len = assert(fh:seek("end"))
	fh:close()
	return len
end

function 判断文件是否存在(path)
	local file = io.open(path, "rb")
	if file then
		file:close()
	end
	return file ~= nil
end

function lua读取文本(文件路径全部)--lua读取文本("server.ini")--lua读取文本("6666666.txt")
 local file1=io.input(文件路径全部)  --当前目录"1.txt"要存在，不然出错
 local str=io.read("*a")
 return str
end

function lua写到文本(文件路径全部,文件内容)--lua写到文本("6666666.txt",file1)
 local file2=io.output(文件路径全部) --当前目录"2.txt"不需要存在
 io.write(文件内容)
 io.flush()
 io.close()
end

function 置DLL目录(d)
	package.cpath = package.cpath ..string.format(';%s/?.dll', d)
end

function 读配置(文件,节点,名称)--读配置("./config.ini","mhxy","宽度")
	local buf = ffi.new("const unsigned char[?]",1024)
	ffi.C.GetPrivateProfileStringA(节点,名称,"空",buf,1024,文件)
	return ffi.string(buf)
end

function 写配置(文件,节点,名称,值)--写配置("./config.ini","mhxy","宽度",全局游戏宽度)
	return ffi.C.WritePrivateProfileStringA(节点,名称,tostring(值),文件)
end

function 分割文本2(str,delimiter)
	local dLen = string.len(delimiter)
	local newDeli = ''
	for i=1,dLen,1 do
		newDeli = newDeli .. "["..string.sub(delimiter,i,i).."]"
	end
	local locaStart,locaEnd = string.find(str,newDeli)
	local arr = {}
	local n = 1
	while locaStart ~= nil
	do
		if locaStart>0 then
			arr[n] = string.sub(str,1,locaStart-1)
			n = n + 1
		end
		str = string.sub(str,locaEnd+1,string.len(str))
		locaStart,locaEnd = string.find(str,newDeli)
	end
	if str ~= nil then
		arr[n] = str
	end
	return arr
end

function 分割文本(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
		if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end

function 分割字符(str,tv)
	local t = tv or {}
	local i = 1
	local ascii = 0
	while true do
		ascii = string.byte(str, i)
		if ascii then
			if ascii < 127 then
				table.insert(t,string.sub(str, i, i))
				i = i+1
			else
				table.insert(t,string.sub(str, i, i+1))
				i = i+2
			end
		else
			break
		end
	end
	return t
end

function encodeBase64(source_str)--64加
	local b64chars ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local s64 = ''
	local str = source_str

	while #str > 0 do
		local bytes_num = 0
		local buf = 0

		for byte_cnt=1,3 do
			buf = (buf * 256)
			if #str > 0 then
				buf = buf + string.byte(str, 1, 1)
				str = string.sub(str, 2)
				bytes_num = bytes_num + 1
			end
		end

		for group_cnt=1,(bytes_num+1) do
			local b64char = math.fmod(math.floor(buf/262144), 64) + 1
			s64 = s64 .. string.sub(b64chars, b64char, b64char)
			buf = buf * 64
		end

		for fill_cnt=1,(3-bytes_num) do
			s64 = s64 .. '='
		end
	end

	return s64
end

function decodeBase64(str64)--64减
	local b64chars ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local temp={}
	for i=1,64 do
		temp[string.sub(b64chars,i,i)] = i
	end
	temp['=']=0
	local str=""
	for i=1,#str64,4 do
		if i>#str64 then
			break
		end
		local data = 0
		local str_count=0
		for j=0,3 do
			local str1=string.sub(str64,i+j,i+j)
			if not temp[str1] then
				return
			end
			if temp[str1] < 1 then
				data = data * 64
			else
				data = data * 64 + temp[str1]-1
				str_count = str_count + 1
			end
		end
		for j=16,0,-8 do
			if str_count > 0 then
				str=str..string.char(math.floor(data/math.pow(2,j)))
				data=math.mod(data,math.pow(2,j))
				str_count = str_count - 1
			end
		end
	end

	local last = tonumber(string.byte(str, string.len(str), string.len(str)))
	if last == 0 then
		str = string.sub(str, 1, string.len(str) - 1)
	end
	return str
end
function encodeBase641(source_str)
  local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  local s64 = ''
  local str = source_str
  while #str > 0 do
	local bytes_num = 0
	local buf = 0
	for byte_cnt=1,3 do
		buf = (buf * 256)
		if #str > 0 then
			buf = buf + string.byte(str, 1, 1)
			str = string.sub(str, 2)
			bytes_num = bytes_num + 1
		end
	end
	for group_cnt=1,(bytes_num+1) do
		local b64char = math.fmod(math.floor(buf/262144),64) + 1
		s64 = s64 .. string.sub(b64chars, b64char, b64char)
		buf = buf * 64
	end
	for fill_cnt=1,(3-bytes_num) do
		s64 = s64 .. '='
	end
  end
  return s64
end

function decodeBase641(str64)
	local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local temp={}
	for i=1,64 do
		temp[string.sub(b64chars,i,i)] = i
	end
	temp['=']=0
	local str=""
	for i=1,#str64,4 do
		if i>#str64 then
			break
		end
		local data = 0
		local str_count=0
		for j=0,3 do
			local str1=string.sub(str64,i+j,i+j)
			if not temp[str1] then
				return
			end
			if temp[str1] < 1 then
				data = data * 64
			else
				data = data * 64 + temp[str1]-1
				str_count = str_count + 1
			end
		end
		for j=16,0,-8 do
			if str_count > 0 then
				str=str..string.char(math.floor(data/math.pow(2,j)))
				data=math.mod(data,math.pow(2,j))
				str_count = str_count - 1
			end
		end
	end
	local last = tonumber(string.byte(str, string.len(str), string.len(str)))
	if last == 0 then
		str = string.sub(str, 1, string.len(str) - 1)
	end
	return str
end

function 取硬盘序列号()
	local h = ffi.gc(ffi.C.CreateFileA("\\\\.\\PhysicalDrive0",bit.bor(2147483648,1073741824),bit.bor(1,2),nil,3,0,nil),ffi.C.CloseHandle)
	if h ~= ffi.cast('void*',-1) then
		local scip = ffi.new('unsigned char[32]')
		scip[10] = 236
		local data = ffi.new('char[528]')
		local size = ffi.new('int[1]')
		if ffi.C.DeviceIoControl(h,508040,scip,32,data,528,size,nil) then
			return ffi.string(data+36,20)
		end
	end
	return ''
end

function 取剪贴板()
	local ok1    = ffi.C.OpenClipboard(nil)
	local handle = ffi.C.GetClipboardData(1)
	local size   = ffi.C.GlobalSize( handle )
	local mem    = ffi.C.GlobalLock( handle )
	local text   = ffi.string( mem, size -1)
	local ok     = ffi.C.GlobalUnlock( handle )
	local ok3    = ffi.C.CloseClipboard()
	return text
end

function 置剪贴板(txt)
	local ok1 = ffi.C.OpenClipboard(nil)
	local ok2 = ffi.C.EmptyClipboard()
	local handle = ffi.C.GlobalAlloc(66, #txt+1)
	local mem = ffi.C.GlobalLock(handle)
	ffi.C.lstrcpy(mem, txt)
	local ok3 = ffi.C.GlobalUnlock(handle)
	ffi.C.SetClipboardData(1, mem)
	local ok4 = ffi.C.CloseClipboard()
	ffi.C.GlobalFree(handle)
end

function 取jijo(txt)
	return 取MD5(txt)
end

function 取MD5(txt)
	local pctx = ffi.new("MD5_CTX[1]")
	advapi32.MD5Init(pctx)
	advapi32.MD5Update(pctx, tostring(txt), string.len(txt))
	advapi32.MD5Final(pctx)
	local md5str = ffi.string(pctx[0].digest,16)
	return string.format("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",string.byte(md5str, 1, -1))
end

function 信息框(msg,title,type)
	ffi.C.MessageBoxA(nil, msg, title or '信息', mtype or 0)
end

function 延迟(int)
	ffi.C.Sleep(int)
end

function 文件是否存在(file)
	return ffi.C._access(file,0)==0
end

function 置窗口样式(h,a,b)
   ffi.C.SetWindowLongA(h,a,b)
end


function 半透明窗口()
	local rtn = ffi.C.GetWindowLongA(引擎.取窗口句柄(),-20)
	rtn = rtn or 0x00080000
	ffi.C.SetWindowLongA(引擎.取窗口句柄(),-20,rtn)
	ffi.C.SetLayeredWindowAttributes(引擎.取窗口句柄(),0,200 ,0x00000002)
end

function 不规则的窗体()
	local rtn = ffi.C.GetWindowLongA(引擎.取窗口句柄(),-20)
	rtn = rtn or 0x00080000
	ffi.C.SetWindowLongA(引擎.取窗口句柄(),-20,rtn)
	ffi.C.SetLayeredWindowAttributes(引擎.取窗口句柄(),0xFF0000FF,0 ,0x00000001)
end

function 读取jpg图片(路径)
	local files
	local file = io.open(路径,"rb")
	print(file)
	if file then
		local bytes = file:read(3)
		local isJpeg = false
		if bytes then
			 local fileHeadIden = ""
			for _, b in ipairs{string.byte(bytes, 1, -1)} do
				local val = string.format("%02X", b)
				fileHeadIden = fileHeadIden..val
			end
			if string.upper(fileHeadIden) == "FFD8FF" then
				isJpeg = true
			end
			file:seek("set")
		end
		if isJpeg then
			files = file:read("*a")
			file:close()
			if string.len(files) > 150000 then
				files = nil
				tp.常规提示:打开("上传的收款码不能大于150kb")
			end
		else
			file:close()
			tp.常规提示:打开("文件格式错误")
		end
	else
		tp.常规提示:打开("没有找到文件请查看文件是否正确")
	end
	return files
end

table.tostring = function (t)
	local mark={}
	local assign={}
	local function ser_table(tbl,parent)
		mark[tbl]=parent
		local tmp={}
		for k,v in pairs(tbl) do
			local key= type(k)=="number" and "["..k.."]" or "[".. string.format("%q", k) .."]"
			if type(v)=="table" then
				local dotkey= parent.. key
				if mark[v] then
					table.insert(assign,dotkey.."='"..mark[v] .."'")
				else
					table.insert(tmp, key.."="..ser_table(v,dotkey))
				end
			elseif type(v) == "string" then
				table.insert(tmp, key.."=".. string.format('%q', v))
			elseif type(v) == "number" or type(v) == "boolean" then
				table.insert(tmp, key.."=".. tostring(v))
			end
		end
		return "{"..table.concat(tmp,",").."}"
	end
	return "do local ret="..ser_table(t,"ret")..table.concat(assign," ").." return ret end"
end

--表复制
table.copy = function (ori_tab)
	if (type(ori_tab) ~= "table") then
		error("非table,不能复制.")
	end
	local new_tab = {};
	for i,v in pairs(ori_tab) do
		local vtyp = type(v);
		if (vtyp == "table") then
			new_tab[i] = table.copy(v);
		elseif (vtyp == "thread") then
			error("复制失败,非法类型1")
		elseif (vtyp == "userdata") then
			error("复制失败,非法类型2")
		else
			new_tab[i] = v;
		end
	end
	return new_tab;
end
-- function DeepCopy(object)
-- 	local SearchTable = {}
-- 	local function Func(object)
-- 		if type(object) ~= "table" then
-- 			return object
-- 		end
-- 		local NewTable = {}
-- 		SearchTable[object] = NewTable
-- 		for k, v in pairs(object) do
-- 			NewTable[Func(k)] = Func(v)
-- 		end
-- 		return setmetatable(NewTable, getmetatable(object))
-- 	end
-- 	return Func(object)
-- end
function DeepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end
--表打印
table.print = function (root)
	local print = print
	local tconcat = table.concat
	local tinsert = table.insert
	local srep = string.rep
	local type = type
	local pairs = pairs
	local tostring = tostring
	local next = next
	local cache = {  [root] = "." }
	local function _dump(t,space,name)
		local temp = {}
		for k,v in pairs(t) do
			local key = tostring(k)
			if cache[v] then
				tinsert(temp,"." .. key .. " {" .. cache[v].."}")
			elseif type(v) == "table" then
				local new_key = name .. "." .. key
				cache[v] = new_key
				tinsert(temp,"." .. key .. _dump(v,space .. (next(t,k) and "|" or " " ).. srep(" ",#key),new_key))
			else
				tinsert(temp,"." .. key .. " [" .. tostring(v).."]")
			end
		end
		return tconcat(temp,"\n"..space)
	end
	print(_dump(root, "",""))
	print('----------------自己_专用.lua---------------------')
end

function print_stack(...)
    print(...)
    local traceback = debug.traceback("",2)
    print(traceback)
    print("-----------------自己_专用.lua2--------------------")
end

--分割文本(文本,分割符)
string.split = function (s, p)
	if s then
		local rt= {}
		string.gsub(s, '[^'..p..']+', function(w) table.insert(rt, w) end )
		return rt
	end
	return {}
end
--只适合小数四舍五入(数值,小数位)
math.round = function (num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end
--适合小数和整数
math.round1 = function (num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function io.writefile(path,content,mode) --保存文件
	mode = mode or "w+b"
	local file = io.open(path, mode)
	if file then
		if file:write(content) == nil then return false end
		io.close(file)
		return true
	else
		return false
	end
end

function 等比例缩放公式(yw,yh,qw,qh)
	local width,height
	width=yw/qw
	height=yh/qh
	return width,height
end

