----------------------------------
-- Made by UrNightmare (195390) --
----------------------------------

strplus = {}

strplus.debugmode = false
local debugm = strplus.debugmode

-- Debug Function
function strplus.__version()
  local version = '1.1'
  
  return print('Current version of String+ is '..version)
end


-- Main Function

function strplus.readfile(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

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
  return str:lower() == str
end

function strplus.isupper(str,ignorews)
  if str == nil then return end
  if ignorews == nil then ignorews = false end
  
  if not ignorews and string.match(str,'%s') then return end
  return str:upper() == str
end

function strplus.isnum(str)
  if str == nil then return end
  if string.match(str,'%.') then return false end
  
  return str:gsub('%D','') == str
end

function strplus.isfloat(str)
  if str == nil then return end
  if not string.match(str,'%.') then
    return false end
  
  return str:gsub('%D','') == str
end
function strplus.isalpha(str)
  if str == nil then return end
  
  return string.gsub(str,'%A','') == str
end

function strplus.isspecchar(str,ignorews)
  if str == nil then return end
  if ignorews == nil then ignorews = false end
  
  if not ignorews and string.match(str,'%s') then return false end
  return string.match(str,'%W')
end

function strplus.isalphanum(str,ignorews)
  if str == nil then return end
  if ignorews == nil then ignorews = false end
  
  if not ignorews and string.match(str,'%s') then return false end
  return string.match(str,'^%w$')
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
  if tonumber(str) < 32 then return end
  
  local res,_ = pcall(function() return string.char(tonumber(str)) end)
  
  return res
end

function strplus.tobool(str)
  if str == nil then return end
  local booltable = {
    ["true"] = true,
    ["false"] = false
  }
  
  return booltable[str:lower()]
end

function strplus.hidestring(str,hidechar)
  if str == nil then return end
  if hidechar == nil then hidechar = 'x' end
  
  return {
    ['str'] = str,
    ['hidestr'] = string.rep(hidechar,#str)
  }
end

function strplus.constructstring(strtable,sepchar)
  if strtable == nil or strtable[2] == nil then return end
  if sepchar == nil then sepchar = '' end
  
  local result = ''
  
  for i,v in pairs(strtable) do
    if v == nil then return end
    
    result = result..sepchar..v
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

function strplus.sleep(n)
  if n == nil then n = 1 end
  
  local s = os.time() + n
  repeat until os.time() > s
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