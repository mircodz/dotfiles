function srequire(module)
	local hasm, m = pcall(require, module)
	if hasm then
		return m
	else
		return {
			setup = function(_) return nil end, 
			stud = true
		}
	end
end

return { srequire = srequire }
