#!/usr/bin/lua hellolua.lua
-- Lua greets the world!

--[[
	Always output to stdout
	Applies tostring to each argument
	Appends a newline
	May act unpredictably
]]
print("Hello World!")
print("\t-- ",_VERSION,"!")

--[[
	Outputs to the current open file
	More control over output formatting
	Should be used over print
]]
io.write("Hello World!\n")
io.write("\t-- ",_VERSION,"!\n")
