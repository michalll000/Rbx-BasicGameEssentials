--[[ THIS SCRIPT NEEDS:
Intro -- this script
- LaunchInStudio - BoolValue (set Value to true to test this in studio)
- IntroGUI - ScreenGUI (Enabled = true, ResetOnSpawn = false)
-- Event - BindableEvent
-- Frame - Frame (Active = false, BackgroundColor3 = Color3.fromRGB(35, 37, 39), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0, -36), Size = UDim2.new(1, 0, 1, 36))
--- Sound - Sound (if you want to play sound after loading, SoundId = <ur sound id>)
---- SOp - LocalScript (if you want to start from different TimePosition, Disabled = true)
SOp script:
-- I know that's not the best way to do this but I had problems with events ;p
while wait() do
	repeat wait() until script.Parent.IsPaused
	script.Parent.TimePosition = 5 --replace it to ur preferences
	script.Parent:Play()
	--print('sr') --if u want
end
--- Loading - TextLabel (AnchorPoint = Vector2.new(.5, .5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(.5, 0, .5, 0), Size = UDim2.new(.9, 0, 0, 25), Font = Enum.Font.GothamSemibold, LineHeight = 1, Text = 'Loading...' [or what you want], TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextStrokeTransparency = 1)

https://www.roblox.com/library/5165390815/Improved-PlayerModule - READ DESC
]]

local RS = game:GetService("RunService")
local plr = game:GetService("Players").LocalPlayer
local loadingGui = script.IntroGUI:Clone()
local TweenService = game:GetService("TweenService")
local PlayerGui = plr:WaitForChild("PlayerGui")
local sg = game:GetService("StarterGui")
local ContentProvider = game:GetService("ContentProvider")
local UIS = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local PlayerScripts = plr:WaitForChild("PlayerScripts")

local PlayerControls = require(PlayerScripts:WaitForChild('PlayerModule')):GetControls() -- Improved PlayerModule
local TouchGui

if not RS:IsStudio() or script.LaunchInStudio.Value then
	
	local mobile, rsu
	
	local fadeOutInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	local fadeInInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	
	local fadeInTween = TweenService:Create(loadingGui.Frame, fadeInInfo, {BackgroundTransparency = 0})
	local fadeOutTween = TweenService:Create(loadingGui.Frame, fadeOutInfo, {BackgroundTransparency = 1})
	
	UIS.MouseIconEnabled = false
	sg:SetCore("TopbarEnabled", false)
	PlayerGui:WaitForChild("Chat").Enabled = false -- fixing bug
	loadingGui.Parent = PlayerGui
	local gg
	local l = true
	
		-- PC/PHONE
		if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled and not GuiService:IsTenFootInterface() then
			mobile = true
			TouchGui = PlayerGui:WaitForChild("TouchGui")
		end
		
		if TouchGui and mobile then
			PlayerControls:Disable() -- Improved PlayerModule
			TouchGui.Enabled = false
		end
	
	loadingGui.Event.Event:Connect(function() gg = true end)
	
	function go()
		script.Parent:RemoveDefaultLoadingScreen() -- ReplicatedFirst
		PlayerScripts:WaitForChild('RbxCharacterSounds').Disabled = true -- No player's sounds during loading (to faster loading you can paste this script in studio and disable it and this line will still guarantee no player's sounds)
		if l then
			l = false
			--print("go")
			repeat wait() until gg
			--print("gg")
			if TouchGui and mobile then
				for _,v in pairs(TouchGui:GetDescendants()) do -- fixing bug
					if v.Name == 'JumpButton' then
						v.Visible = false
					end
				end
			end
			wait(3)
			TweenService:Create(loadingGui.Frame.Loading, fadeOutInfo, {TextTransparency = 1}):Play()
			wait()
			fadeOutTween:Play()
      -- First play of sound - if you want a sound remove -- and [[]]
			--[[
      local s = loadingGui.Frame.Sound
			s.Name = 'MenuSound'
			s.Parent = PlayerGui
			s.TimePosition = 5 -- change it if u want different starter position of sound
			s:Play()
			s.SOp.Disabled = false -- enable a sound script (if you don't wanna start from different position than 0 remove this line and just don't create 'SOp' script included above
      ]]
			if TouchGui and mobile then
				PlayerControls:EnableActiveControlModule() -- Improved PlayerModule
				TouchGui.Enabled = true
				for _,v in pairs(TouchGui:GetDescendants()) do -- fixing bug
					if v.Name == 'JumpButton' then
						v.Visible = true
					end
				end
			end
			UIS.MouseIconEnabled = true
			PlayerGui:WaitForChild("Chat").Enabled = true -- fixing bug
			sg:SetCore("TopbarEnabled", true)
			sg:SetCore("ResetButtonCallback", true) -- MAKE SURE THIS OPTION IS FALSE IN STARTER SCRIPT (no need to do this like there because this option is avaitable for sure)
			PlayerScripts:WaitForChild('RbxCharacterSounds').Disabled = false -- if you're using sound and you're connecting this to e.g. menu gui you can remove this line and paste is somewhere later
			wait(1)
			loadingGui:Destroy() -- Wait 1 second to make sure animation is done
		end
	end
	ContentProvider:PreloadAsync({loadingGui}, go) -- Preload UI
end
