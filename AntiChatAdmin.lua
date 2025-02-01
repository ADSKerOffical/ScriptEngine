if not getconnections then
 warn("For some reason getconnections absent. The script cannot be started")
   return 
      end
 if game.TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
for _, player in ipairs(game.Players:GetPlayers()) do
  for i, v in pairs(getconnections(player.Chatted)) do
    v:Disconnect()
  end
end
   else
      for i, v in ipairs(getconnections(game:GetService("TextChatService").SendingMessage)) do
        v:Disconnect()
     end
 end
