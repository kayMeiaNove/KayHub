local lp = game.Players.LocalPlayer
local value = lp:WaitForChild('leaderstats').Raised
local Player = game:GetService("Players").LocalPlayer
makefolder("kayolindo")
writefile("kayolindo/usuario.txt", Player.Name)
nomep = readfile("kayolindo/usuario.txt")
local url = "https://discord.com/api/webhooks/1012800413591941200/3-jQI-k12zJzB-J-QKSU7aXCtSgHoTYSKMyRnHmD56fKjgnYJfsYiHY7IIbBJew5JxU4"
local data = {["content"] = "@everyone doação recebida\n quem recebeu: "..nomep,["avatar_url"] = "https://cdn.discordapp.com/attachments/1007966867656294400/1012432494383075329/unknown.png"}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {["content-type"] = "application/json"}

value.Changed:Connect(function()
	request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef)
	wait(3)
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ahhhhhhh tysm <3", "All")
end)
