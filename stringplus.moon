sp = {}

sp.split = (delim) =>
  result = {}

  switch delim
    when nil
      for i = 1,#self
        table.insert result,self\sub i,i
    else
      for i in string.gmatch(self, "([^"..delim.."]+)") do
        table.insert result,i
  
  return result

sp.xmatch = (pattern) =>
  s,e = self\find pattern
  return self\sub(s,e)

sp.isupper = =>
  return self\match '^%u+$'

sp.islower = =>
  return self\match '^%l+$'

sp.iswhitespace = =>
  return self\match '^%s+$'

sp.isspecial = =>
  return self\match '^%W+%S+$'






sp.setup = ->
  for i,v in pairs sp
      string[i] = v

return sp
