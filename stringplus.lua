----------------------------------
-- Made by UrNightmare (195390) --
----------------------------------

strplus = {}

strplus.debugmode = false
local debugm = strplus.debugmode

-- Debug Function
function strplus.version()
  local version = '1.1'
  
  print('Current version of String+ is '..version)
end



-- Main Function
function strplus.split(str, sep)
   if sep == nil then
      sep = "%s"
   end
   local restable = {}
   for i in string.gmatch(str, "([^"..sep.."]+)") do
      table.insert(restable, i)
   end
   return restable
end

function strplus.islower(str,ignorews)
  if str == nil then return end
  if ignorews == nil then ignorews = false end
 
  if not ignorews and string.match(str,'%s') then return end
  if str:lower() == str then return true else return false end
end

function strplus.isupper(str,ignorews)
  if str == nil then return end
  if ignorews == nil then ignorews = false end
  
  if not ignorews and string.match(str,'%s') then return end
  if str:upper() == str then return true else return false end
end

function strplus.isnum(str)
  if str == nil then return end
  if string.match(str,'%.') then return false end
  
  local res,_ = pcall(function()
    return ''..tonumber(str)
  end)
  
  return res
end

function strplus.isfloat(str)
  if str == nil then return end
  if not string.match(str,'%.') then
    return false end
  
  local res,_ = pcall(function()
    return ''..tonumber(str)
  end)
  
  return res
end
function strplus.isalpha(str)
  if str == nil then return end
  
  if string.gsub(str,'%A','') == str then return true else return false end
end

function strplus.isspecchar(str,ignorews)
  if str == nil then return end
  if ignorews == nil then ignorews = false end
  
  if not ignorews and string.match(str,'%s') then return false end
  if string.match(str,'%W') then return true else return false end
end

function strplus.isalphanum(str,ignorews)
  if str == nil then return end
  if ignorews == nil then ignorews = false end
  
  if not ignorews and string.match(str,'%s') then return false end
  if string.match(str,'^%w$') then return true else return false end
end

function strplus.separate(str)
  if str == nil then return end
  
  local restable = {}
  local num = 0
  
  for i = 1,#str do
    num = num + 1
    restable[i] = string.sub(str,num,num)
  end
  
  return restable
end

function strplus.isansi(str)
  if str == nil then return end
  
  local res,_ = pcall(function()
    return string.char(tonumber(str))
  end)
  
  return res
end

function strplus.color(rgb,str)
  if rgb == nil then return end
  if str == nil then return end
  if not strplus.num(rgb) then return end
  if #rgb ~= 9 then return end
  
  
  return '\169'..rgb..str
end

function strplus.tobool(str)
  if str == nil then return end
  local booltable = {
    ["true"] = true,
    ["false"] = false
  }
  
  if booltable[str] == nil then return nil end
  return booltable[str]
end

function strplus.hidestring(str,hidechar)
  if str == nil then return end
  if hidechar == nil then hidechar = 'x' end
  
  return {
    ['str'] = str,
    ['hidestr'] = string.rep(hidechar,#str)
  }
end

function strplus.constructstring(strtable)
  if strtable == nil or strtable[1] == nil then return end
  
  local result = ''
  
  for i,v in pairs(strtable) do
    if v == nil then return end
    
    result = result..v
  end
  
  return result
end

function strplus.stringbyte(str)
  if str == nil then return end
  
  local restable = {}
  local num = 0
  
  for i = 1,#str do
    num = num + 1
    restable[i] = string.byte(str,num)
  end
  
  return restable
end


--Shortcut
strplus.up = strplus.isupper
strplus.low = strplus.islower
strplus.num = strplus.isnum
strplus.alph = strplus.isalpha
strplus.sep = strplus.separate
strplus.ansi = strplus.isansi
strplus.float = strplus.isfloat
strplus.schar = strplus.isspecchar
strplus.alphnum = strplus.isalphanum
strplus.hstr = strplus.hidestring
strplus.const = strplus.constructstring

return strplus