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
local roblox_storage = require("./utils/roblox_storage")

local function implement(module: any): ()
	if not module:IsA("ModuleScript") then return end
	if module == script then return end
	--print(module.Name);
	(require)(module)
end

local impl_roblox = {}

function impl_roblox.init(): ()
	-- initialize roblox instance storage
	roblox_storage.init()

	-- needs to implement task early because it's a runtime specific header which is used as a dependency for other
	-- implementations.
	implement(script.Parent.task["main.api"])
	implement(script.Parent.context["main.api"])
	for _, module: ModuleScript in script.Parent.Parent.impl:GetDescendants() do
		implement(module)
	end
	for _, module: ModuleScript in script.Parent:GetDescendants() do
		implement(module)
	end
end

return impl_roblox
