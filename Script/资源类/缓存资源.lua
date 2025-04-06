local 资源缓存 = class()

function 资源缓存:初始化()
	self.缓存 = {}
end

function 资源缓存:加入缓存(id,数据)
	self.缓存[id] = 数据
end

function 资源缓存:取缓存(id)
	if self.缓存[id] == nil then
		return false
	end
	return self.缓存[id]
end

function 资源缓存:清空缓存()
	self.缓存 = {}
end

return 资源缓存