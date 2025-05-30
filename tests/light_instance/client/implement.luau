--[[MIT License Copyright (c) 2025 @hardlyardi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]
--[[
--FOR DESCRIPTIONS OF API & CODE FUNCTION, ETC: https://light.ardi.gg/
--FOR ISSUES, BUG REPORTS, OR FEATURE REQUESTS: https://light.ardi.gg/github
--ROBLOX OSS SERVER: https://discord.com/invite/5KjV64PA3d
--MY DISCORD (please only contact for important questions): https://discord.com/users/331399684415553538/
]]
local filesystem_hierarchy = require("@runtest/utils/filesystem_hierarchy")
local regex = require("@lune/regex")

local luau_file_eh = regex.new("\\.luau$")

local function implement(path: string): ()
	if not luau_file_eh:isMatch(path) then return end
	(require)(path)
end

local impl_client = {}

function impl_client.init_lune(): ()
	require("@test/impl_lune/task/main.api")

	local lune_hierarchy = filesystem_hierarchy.new("./tests/impl_lune/")
	for filename in filesystem_hierarchy.files(lune_hierarchy, "@root/tests/impl_lune/") do
		implement(filename)
	end
end

function impl_client.init_instance(): ()
	local server_hierarchy = filesystem_hierarchy.new("./tests/light_instance/server/impl/")
	for filename in
		filesystem_hierarchy.files(server_hierarchy, "@root/tests/light_instance/server/impl/")
	do
		implement(filename)
	end
	local src_hierarchy = filesystem_hierarchy.new("./src/impl/")
	for filename in filesystem_hierarchy.files(src_hierarchy, "@root/src/impl/") do
		implement(filename)
	end
end

return impl_client
