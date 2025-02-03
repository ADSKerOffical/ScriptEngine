local htpget = nil
 if isfunctionhooked(game.HttpGet) == true then
 print("Hooked!")
 htpget = clonefunction(game.HttpGet)
end
