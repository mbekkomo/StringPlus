local sp = { }
sp.split = function(str, delim)
  if not str then
    return 
  end
  local result = { }
  local method
  local _exp_0 = delim
  if not delim == _exp_0 then
    method = function()
      for i in str:gmatch(delim) do
        table.insert(result, i)
      end
    end
  else
    method = function()
      for i = 1, #str do
        table.insert(result, str:sub(i, i))
      end
    end
  end
  method()
  return result
end
for i, v in pairs(sp.split("test uwu", " ")) do
  print(v)
end
