-- KohlsLite v2 --
-- This is a rewrite of the Chatted function as well as some other things --

-- INFORMATION ABOUT MY SCRIPT --

-- This free, open-source script is for the Roblox game Kohls Admin House (KAH)
-- You can play KAH here: https://www.roblox.com/games/112420803/Kohls-Admin-House-NBC-Updated
-- Created by ScriptingProgrammer (Roblox) / TS2021x (Discord) / S-PScripts (GitHub)

-- Support this script today by donating Robux to me!
-- You can make your own script instead of skidding and you can take stuff from here if necessary.

-- Don't go abusing like crazy with this script. I made this free/open-source and don't want idiots doing stuff that make me make this paid/obfuscated.

-- Setup --
getgenv().klprefix2 = "."
getgenv().klversion2 = "v0.00 Alpha"

-- Chat function
local function chat(msg)
	game:GetService("Players"):Chat(msg)
end

-- Remind function
local function notify(text, num)
	if num == nil then
		num = 1
	end
	game:GetService("StarterGui"):SetCore("SendNotification",
	{
		Title = "KohlsLite",
		Text = text,
		Duration = num
	}
	)
end

-- Execution check
getgenv().executed2 = false

if getgenv().executed2 then 
        return notify("KohlsLite is already executed.")
end

-- LocalPlayer variables
local lplr = game:GetService("Players").LocalPlayer

-- Anti logs
local antilog = ("0"):rep(40)
local musicantilog = ("0"):rep(40)
local gearantilog = ("0"):rep(40)
local charantilog = ("0"):rep(40)

-- Gamepass checker
local function gamepassCheck()
	local hasPerm = false
	local hasPersons = false
	
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 66254) then
		hasPerm = true
	elseif game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 64354) then
		hasPerm = true
	else
		-- 
	end
	
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 35748) then
		hasPersons = true
	elseif game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, 37127) then
		hasPersons = true
	else
		--
	end
	
	return {hasPerm, hasPersons}
end

-- Variables for the gamepass checker
local gamepassData = gamepassCheck()
local hasPerm = gamepassData[1]
local hasPersons = gamepassData[2]

-- Connections --
local connections = {}

-- Variables for Chatted --
local admin = {klprefix2 = klprefix2, klversion2 = klversion2}
local commands = {}
local descriptions = {}

-- Variables for credits --
local creditables = {}
local creddesc = {}

-- Command adder --
-- From Shortcut v2 NEW (https://github.com/Tech-187/Lua-scripts/blob/main/Shortcut__v2_src2.lua)
function addcommand(cmdName, cmdDescription, cmdFunction)
    commands[cmdName] = cmdName
    descriptions[cmdName] = cmdDescription
    connections[#connections + 1] = 
            game.Players.LocalPlayer.Chatted:Connect(function(msg)
                msg = msg:lower()
                args = msg:split(" ")
                if args[1] == admin.klprefix2 .. cmdName then
                    cmdFunction()
                elseif args[1] == "/e" and args[2] == admin.klprefix2 .. cmdName then
                    args[2] = args[3]
                    cmdFunction()
                end
        end)
end

-- Credit adder --
function addcredit(cName, cDescription)
    creditables[cName] = cName
    creddesc[cName] = cDescription
end

-- Credits --
addcredit("ScriptingProgrammer (Roblox) / ts2021x (Discord)/ S-PScripts (GitHub)",
"created KohlsLite"
)

addcredit("Tech/t_echr/techq and other admins of Shortcut",
"creating Shortcut v1, v2 and v3 [var] - giving ideas and help for scripts"
)

addcredit("iiDK",
"creating ii's Stupid Admin - help for scripts"
)

addcredit("atprog",
"creating PR Script - being a collaborator for KohlsLite"
)

addcredit("Gojo",
"creating SimpleKAH - gear and char ids"
)

addcredit("Dizzy",
"creating Route - music ids that I stole with an audio logger haha"
)

addcredit("DarkSpecies",
"creating Radiation Hub - being a collaborator for KohlsLite"
)


addcredit("You!",
"using my script and spreading it around. Thank you!"
)

-- Credit list -- 
addcommand("credits",
	   "print out the credits for KohlsLite",
	   function()
        	print("Credits:")
        	print("\n\n\n")
        	for i, v in pairs(creditables) do
            		dupe = v.. " - ".. creddesc[v]
            		print(dupe)
        	end
	    end
)

-- Command list --
addcommand("cmds", -- not sure why in scv2 new it doesn't use the system that was created!
	   "print out the commands for KohlsLite",
	   function()
        	print("Commands:")
        	print("\n\n\n")
        	for i, v in pairs(commands) do
            		dupe = v.. " - ".. descriptions[v]
            		print(dupe)
        	end
	    end
)

-- Information --
addcommand("help", 
	   "print out information about KohlsLite",
	    function()
      		print("Information:")
      		print("\n\n\n")
      		print("You are using KohlsLite by ScriptingProgrammer/ts2021x/S-PScripts. This script has been maintained since 2023.")
      		print("For help, please contact me on Discord at ts2021x.")
      		print("The version you are using is "..admin.klversion2..".")
	    end
)

-- Commands ---
addcommand(
	"vgcrash",
	"crashes the server with vampire gear",
	function()
		if game.Lighting:FindFirstChild(lplr.Name) then
			if hasPerm or hasPersons then
				chat("respawn me")
			end
		end
		
		chat("blind others")
		chat("speed others 0")
		chat("freeze others")
		
		chat("gear me "..antilog.."94794847")
		repeat task.wait() until lplr.Backpack:WaitForChild("VampireVanquisher")
      		local vg = lplr.Backpack:FindFirstChild("VampireVanquisher")
      		vg.Parent = lplr.Character

		for i = 1, 12 do
			chat("unsize me me me")
		end
	end
)