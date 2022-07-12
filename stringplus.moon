-- [ MADE BY URNIGHTMARE ] --
-- [ Github repo : github.com/UrNightmaree/StringPlus ] --
-- [ Discord : UrNigthmaree#2322 ] --

sp = {}

sp._Info = (type) ->
	type or= "text"

	method = switch type
		when "json"
			->
				print "
{
	\"Name\":\"StringPlus\",
	\"Version\":\"re-1.0\",
	\"Creator\":\"UrNightmaree@GitHub\"
}
"
		when "text"
			->
				print "
[====================]

 Module Name : \"StringPlus\"
 Version : re-1.0
 Creator : github.com/UrNightmaree

[====================]
"

		else
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

sp.trim = (str) ->
	return if not str

	result = nil

