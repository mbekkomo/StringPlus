sp = {}

sp.split = (self,delim) ->
  result = {}
  
  n = 1

  switch delim
    when nil
      for i = 1,#self
        table.insert result,self\sub i,i
    else
      for i in string.gmatch(self, "([^"..delim.."]+)") do
        table.insert result,i
  
  return result

sp.xmatch = (self,pattern) ->
  return self\find(pattern) != nil

sp.isupper = (self) ->
  return self\match('%u+') != nil


sp.setup = () =>
  for i,v in pairs sp
      string[i] = v

sp\setup!

str = 'HI'

print tostring str\isupper!

sp
