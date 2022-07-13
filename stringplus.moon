-- [ MADE BY URNIGHTMARE ] --
-- [ Github repo : github.com/UrNightmaree/StringPlus ] --

sp = {}

sp._Info = (type) -> -- Print version of the module
	type or= "text" -- Set to 'text' if not defined

	method = switch type\lower!
		when "json" -- Print JSON text
			->
				print "
{
	\"Name\":\"StringPlus\",
	\"Version\":\"re-1.0\",
	\"Creator\":\"UrNightmaree@GitHub\"
}
"
		when "text" -- Print normal Text
			->
				print "
[====================]

 Module Name : \"StringPlus\"
 Version : re-1.0
 Creator : github.com/UrNightmaree

[====================]
"

		else -- Send error if type/option is invalid
			-> print "\nExpected valid option, got invalid option : #{type}\n"

	method!

sp.split = (str,delim) -> -- This function will split a string
	return if not str
	
	result = {}
	method = switch delim
		when delim
			-> -- Split the string with delim parameter
				for i in str\gmatch "([^#{delim}]+)"
					result[i] = i
		else
			-> -- Set to split the entire string if delim is not defined
				for i = 1,#str
					result[i] = str\sub i,i
	
	method! -- Configure the function
	result -- Return the table

sp.trim = (str) -> -- Remove whitespace in right and/or left string
	return if not str
	
	result = str\gsub("^%s+","")\gsub("%s+$","")

	result

sp.xmatch = (str,match) -> -- Same as string.find but return boolean instead of number
	return if not str

	result = str\find match

	result != nil


