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

function strplus.islower(str,ignorews)
   if str == nil then return end
   ignorews = ignorews or false
   
   if not ignorews and string.match(str,'%s') then return end
   return str:lower() == str
end

function strplus.isupper(str,ignorews)
   if str == nil then return end
   ignorews = ignorews or false
   
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
function strplus.isalpha(str,ignorews)
   if str == nil then return end
   ignorews = ignorews or false
   
   if not ignorews and str:match('%s') then return false end 
   return string.gsub(str,'%A','') == str
end

function strplus.isspecialchar(str,ignorews)
   if str == nil then return end
   ignorews = ignorews or false
   
   if not ignorews and string.match(str,'%s') then return false end
   return string.match(str,'%W')
end

function strplus.isalphanum(str,ignorews)
   if str == nil then return end
   ignorews = ignorews or false
   
   if not ignorews and string.match(str,'%s') then return false end
   return string.match(str,'^%w$')
end

function strplus.separate(str)
   if str == nil then return end
   
   local restable = {}
   local num = 0
   
   for i = 1,#str do
      num = num + 1
      restable[i] = str:sub(num,num)
   end
   
   return restable
end

function strplus.isascii(str)
   if str == nil then return end
   
   return str >= 32 and str <= 255
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
   hidechar = hidechar or 'x'
   
   return str:gsub('.',hidechar)
end

function strplus.concatestr(strtable,sepchar)
   if strtable == nil or strtable[2] == nil then return end
   sepchar = sepchar or ''
   
   local result = ''
   
   for i,v in pairs(strtable) do
      if v == nil then return end
      
      result = result..sepchar..v
   end
   
   return result:sub(1,1)
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

function strplus.findstr(str,findstr)
   if not str then return end
   findstr = findstr or '.'

   local s,e = str:find(findstr)

   
end



--Shortcut
strplus.up = strplus.isupper
strplus.low = strplus.islower
strplus.num = strplus.isnum
strplus.alph = strplus.isalpha
strplus.sep = strplus.separate
strplus.ansi = strplus.isansi
strplus.float = strplus.isfloat
strplus.specchar = strplus.isspecialchar
strplus.alphnum = strplus.isalphanum
strplus.hidestr = strplus.hidestring
strplus.concate = strplus.concatestr

return strplus
