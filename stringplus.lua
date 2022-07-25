local sp = { }
sp.split = function(self, delim)
  local result = { }
  local _exp_0 = delim
  if nil == _exp_0 then
    for i = 1, #self do
      table.insert(result, self:gsub(i, v))
    end
  else
    for i in string.gmatch(self, "([^" .. delim .. "]+)") do
      table.insert(result, i)
    end
  end
  return result
end
sp.xmatch = function(self, pattern)
  return self:find(pattern) ~= nil
end
sp.setup = function(self)
  for i, v in pairs(sp) do
    string[i] = v
  end
end
sp:setup()
local str = 'Foo Bar'
for i, v in pairs(str:split()) do
  print(v)
end
