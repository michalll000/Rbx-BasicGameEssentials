-- /// Starter Config /// Made by CodeDel ///

--game:GetService("StarterGui"):SetCore("TopbarEnabled", false) -- Turn off topbar

spawn(function() -- no need to wait for it
	local s, e = pcall(function()
		game:GetService('ContentProvider'):PreloadAsync(game:GetService('ReplicatedStorage'))
	end)
end)

local s, e = pcall(function() -- load all UI's while loading
	game:GetService('ContentProvider'):PreloadAsync(game:GetService('PlayerGui'))
end)

if not game:GetService("RunService"):IsStudio() or script.Parent:WaitForChild('Intro'):WaitForChild('LaunchInStudio').Value == true then
	game:GetService('Players').LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("IntroGUI").Event:Fire()
end

-- // coreCalls - SetCore //

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'PointsNotificationsActive', false)

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'BadgesNotificationsActive', true)

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'ChatBarDisabled', false)

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'AvatarContextMenuEnabled', true)

local coreCall do
	local MAX_RETRIES = 100

	local StarterGui = game:GetService('StarterGui')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(StarterGui[method], StarterGui, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetCore', 'ResetButtonCallback', false)


-- // coreCalls - GuiService //

local coreCall do
	local MAX_RETRIES = 100

	local GuiService = game:GetService('GuiService')
	local RunService = game:GetService('RunService')

	function coreCall(method, ...)
		local result = {}
		for retries = 1, MAX_RETRIES do
			result = {pcall(GuiService[method], GuiService, ...)}
			if result[1] then
				break
			end
			RunService.Stepped:Wait()
		end
		return unpack(result)
	end
end

coreCall('SetInspectMenuEnabled', true)

--print(game:GetService("GuiService"):GetGuiInset())

script:Destroy()
