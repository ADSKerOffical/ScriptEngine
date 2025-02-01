local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()

local window = DrRayLibrary:Load("Script Engine", "Default")

local tab = DrRayLibrary.newTab("", "ImageIdHere")

tab.newButton("Link spy", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/ScriptEngine/refs/heads/main/LinkSpy.lua"))()
end)

tab.newButton("Http Spy fix", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/ScriptEngine/refs/heads/main/HttpSpyFix.lua"))()
end)

tab.newButton("Anti chat admin", "Run this after running the script with this control", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/ScriptEngine/refs/heads/main/AntiChatAdmin.lua"))()
end)

tab.newButton("Tool gun", "Useful for exploit scripters", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Tool/refs/heads/main/Tool%20Gun"))()
end)
