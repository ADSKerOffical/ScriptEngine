local HttpSpy = cloneref(Instance.new("ScreenGui"))
HttpSpy.Name = "HttpSpy"
HttpSpy.Parent = gethui()
HttpSpy.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
HttpSpy.ResetOnSpawn = false

local Backgroud = cloneref(Instance.new("Frame"))
Backgroud.Name = "Backgroud"
Backgroud.Parent = HttpSpy
Backgroud.Active = true
Backgroud.Draggable = true
Backgroud.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
Backgroud.BorderColor3 = Color3.fromRGB(0, 255, 0)
Backgroud.BorderSizePixel = 2
Backgroud.Position = UDim2.new(0.0586419739, 0, 0.24924925, 0)
Backgroud.Size = UDim2.new(0, 406, 0, 222)

local TitleText = cloneref(Instance.new("TextLabel"))
TitleText.Name = "TitleText"
TitleText.Parent = Backgroud
TitleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TitleText.BackgroundTransparency = 1.000
TitleText.BorderSizePixel = 0
TitleText.Size = UDim2.new(0, 406, 0, 25)
TitleText.Font = Enum.Font.RobotoMono
TitleText.Text = "Http Spy by ADSKer"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextScaled = true
TitleText.TextSize = 14.000
TitleText.TextWrapped = true

local Clear = Instance.new("TextButton", Backgroud)
Clear.TextColor3 = Color3.new(1, 1, 1)
Clear.Text = "Clear"
Clear.BackgroundColor3 = Color3.new(0.2, 0, 0.2)
Clear.Size = UDim2.new(0, 20, 0, 20)
Clear.TextScaled = true
Clear.Position = UDim2.new(0, 350, 0, 5)

local Close = Instance.new("TextButton", Backgroud)
Close.TextColor3 = Color3.new(1, 1, 1)
Close.Text = "Destroy"
Close.BackgroundColor3 = Color3.new(0.4, 0, 0)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.TextScaled = true
Close.Position = UDim2.new(0, 375, 0, 5)

Close.MouseButton1Click:Connect(function()
  HttpSpy:Destroy()
end)

local MainContainer = cloneref(Instance.new("ScrollingFrame"))
MainContainer.Name = "MainContainer"
MainContainer.Parent = Backgroud
MainContainer.Active = true
MainContainer.BackgroundColor3 = Color3.fromRGB(0, 110, 0)
MainContainer.BorderSizePixel = 0
MainContainer.Position = UDim2.new(0, 0, 0.12912613, 0)
MainContainer.Size = UDim2.new(0, 406, 0, 197)
MainContainer.ScrollBarThickness = 6

Clear.MouseButton1Click:Connect(function()
  for _, button in ipairs(MainContainer:GetDescendants()) do
    if button:IsA("TextButton") then
button:Destroy()
    end
  end
end)

local UIListLayout = cloneref(Instance.new("UIListLayout"))
UIListLayout.Parent = MainContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local script = Instance.new('LocalScript', MainContainer)

local TemplateText = cloneref(Instance.new("TextButton"))
TemplateText.Name = "TemplateText"
TemplateText.Parent = HttpSpy.Backgroud.MainContainer.LocalScript
TemplateText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TemplateText.BackgroundTransparency = 0.950
TemplateText.BorderSizePixel = 0
TemplateText.Position = UDim2.new(3.75832236e-08, 0, 0, 0)
TemplateText.Size = UDim2.new(1.00000012, 0, 0, 20)
TemplateText.Font = Enum.Font.SourceSansSemibold
TemplateText.Text = ""
TemplateText.TextColor3 = Color3.fromRGB(255, 255, 255)
TemplateText.TextScaled = true
TemplateText.TextSize = 14.000
TemplateText.TextWrapped = true
TemplateText.TextXAlignment = Enum.TextXAlignment.Left

local Template = script.TemplateText

local layout = MainContainer:FindFirstChildWhichIsA("UIListLayout")
local absoluteContentSize = layout.AbsoluteContentSize
MainContainer.CanvasSize = UDim2.new(0, 0, 0, absoluteContentSize.Y)
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
local absoluteContentSize = layout.AbsoluteContentSize
MainContainer.CanvasSize = UDim2.new(0, 0, 0, absoluteContentSize.Y)
end)

local function Log(text,headers)
 if not HttpSpy or HttpSpy == nil then return end
  local Label = Template:Clone()
    if headers and type(headers) == "table" then 
      text = text .. " (HEADERS:"
       for Index, Value in next, headers do 
        text = text.. tostring(Index).. ": "..tostring(Value)
       end
     text = text .. ")"
   end
Label.Text = text 
Label.Parent = script.Parent
 Label.MouseButton1Click:Connect(function()
   setclipboard(text)
 end)
end

if not clonefunction or not hookfunction then
error("Your exploit is not supported")
 return 
end

local loadstr = clonefunction(loadstring)
local oldLoadstring = hookfunction(loadstring, function(code)
  for url in string.gmatch(code, "https?://[^%s]+") do
    Log("Discovered URL: " .. url)
  end

  local success, result = pcall(loadstr, code)
  if success then
    return result
  else
    warn("Error execution loadstring: " .. result)
    return nil
  end
end)
