




-- detectar doações 
loadstring(game:HttpGet("https://raw.githubusercontent.com/kayoUwU/Donate/main/dono_detect.lua"))()


-- script config e variaveis
local lp = game.Players.LocalPlayer
local value = lp:WaitForChild('leaderstats').Raised
local chat = false
local antafk = false
local delay = 1
local vu = game:GetService("VirtualUser")

-- valores nao salvos
naosalvo_chat = false
naosalvo_antafk = false


--krnl | salvar nick
local Player = game:GetService("Players").LocalPlayer
makefolder("kayolindo")
writefile("kayolindo/usuario.txt", Player.Name)
nomep = readfile("kayolindo/usuario.txt")


--- webhook
local url = "https://discord.com/api/webhooks/1012800413591941200/3-jQI-k12zJzB-J-QKSU7aXCtSgHoTYSKMyRnHmD56fKjgnYJfsYiHY7IIbBJew5JxU4"
local data = {["content"] = "@everyone nova doação para: "..nomep,["avatar_url"] = "https://cdn.discordapp.com/attachments/1007966867656294400/1012432494383075329/unknown.png"}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}



--------------------------- Menu Lib ----------
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

--------------------------- UI ----------
-- Build
local Window = Library.CreateLib("PLS DONATE | kayo#0002", "Ocean")

-- Tab 
local Main = Window:NewTab("Principal")
local Mensagenss = Window:NewTab("Msg")
local Outros = Window:NewTab("Outros")

-- Sections
local Principal = Main.NewSection("Principal", "Principal")
local Mensagenss = Mensagenss.NewSection("Mensagens", "Mensagens")
local Outros = Outros.NewSection("Outros", "Outros")
local Parar_Iniciar = Main.NewSection("Iniciar/Parar", "Iniciar/Parar")



--------------------------- Menu ----------

-- sections da pagina principal ---
Principal:NewToggle("enviar msg no chat", "envia as msg setadas por ordem aleatoria no chat", function(state)
    if state then
        naosalvo_chat = true
    else
        naosalvo_chat = false
    end
end)

Principal:NewToggle("anti-afk", "para ficar afk sem o roblox te dar kick", function(state)
    if state then
        naosalvo_antafk = true
    else
        naosalvo_antafk = false
    end
end)



Principal:NewDropdown("Delay", "delay em que vai enviar as mensagens no chat", {"5 minutos", "10 minutos", "15 minutos", "30 minutos", "1 hora"}, function(currentOption)
    if currentOption == "5 minutos" then
		print("delay setado para 300 segundos (5 minutos)")
		delay = 300
	end

	if currentOption == "10 minutos" then
		print("delay setado para 600 segundos (10 minutos)")
		delay = 600
	end

	if currentOption == "15 minutos" then
		print("delay setado para 900 segundos (15 minutos)")
		delay = 900
	end

	if currentOption == "30 minutos" then
		print("delay setado para 900 segundos (30 minutos)")
		delay = 1800
	end

	if currentOption == "1 hora" then
		print("delay setado para 900 segundos (1 hora)")
		delay = 3600
	end

end)



Parar_Iniciar:NewButton("iniciar", "iniciar mendigagem :3", function()
    if naosalvo_antafk == true then 
		--print("ant-afk ativado")
		antafk = true
	end

	if naosalvo_chat == true then
		--print("mensagens automaticas ativo")
		chat = true
	end

 -- DropDown
	if delay == 1 then
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "kayo#0002 - PlsDonate",
			Text = "você não colocou o delay para enviar mensagens automaticas"
		})
		naosalvo_chat = false
		naosalvo_antafk = false
	end

end)

Parar_Iniciar:NewButton("parar", "Parar o script", function()
	antafk = false
	chat = false
end)





-- sections da pagina de msg ---
Mensagenss:NewLabel("1. "..msg[1])
Mensagenss:NewLabel("2. "..msg[2])
Mensagenss:NewLabel("3. "..msg[3])
Mensagenss:NewLabel("4. "..msg[4])
Mensagenss:NewLabel("5. "..msg[5])
Mensagenss:NewLabel("6. "..msg[6])
Mensagenss:NewLabel("7. "..msg[7])
Mensagenss:NewLabel("8. "..msg[8])
Mensagenss:NewLabel("9. "..msg[9])



-- sections da pagina Outros ---
Outros:NewSlider("Speed", "Mudar Speed", 500, 21, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Outros:NewSlider("JumpPower", "Mudar a Altura do Jump", 500, 21, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)


Outros:NewButton("??? Segredo", "clica aqui", function()
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("kayo eh lindo <3", "All")
end)



--------------------------- Funções ----------

msg_aleatoria = function(x)
    local r = math.random(1,9)
    return x[r]
end


--------------------------- Script ----------

while (true) do -- loop
	wait(0.1)
	if antafk == true then
		-- print("afk")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
  		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
  		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
	end
	if chat == true then
		local randomizada = msg_aleatoria(msg)
		wait(delay)
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomizada, "All") -- envia msg
	end
end

