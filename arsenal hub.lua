local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local ESP = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/Helios-Hub/main/Scripts/HeliosESP.lua")()
local w = library:CreateWindow("arsenal") -- Creates the window
local b = w:CreateFolder("mod")
local d = w:CreateFolder("esp")
local g = w:CreateFolder("aimbot")
ESP:SetESPColor(Color3.fromRGB(255, 255, 255))

b:Button("kill all (k)",function()
game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
if k == "k" then
local Gun = game.ReplicatedStorage.Weapons:FindFirstChild(game.Players.LocalPlayer.NRPBS.EquippedTool.Value);
local Crit = math.random() > .6 and true or false;
for i,v in pairs(game.Players:GetPlayers()) do
if v and v.Character and v.Character:FindFirstChild("Head") then
local Distance = (game.Players.LocalPlayer.Character.Head.Position - v.Character.Head.Position).magnitude
for i  = 1,10 do
game.ReplicatedStorage.Events.HitPart:FireServer(v.Character.Head,
v.Character.Head.Position + Vector3.new(math.random(), math.random(), math.random()),
Gun.Name,
Crit and 2 or 1,
Distance,
Backstab,
Crit,
false,
1,
false,
Gun.FireRate.Value,
Gun.ReloadTime.Value,
Gun.Ammo.Value,
Gun.StoredAmmo.Value,
Gun.Bullets.Value,
Gun.EquipTime.Value,
Gun.RecoilControl.Value,
Gun.Auto.Value,
Gun['Speed%'].Value,
game.ReplicatedStorage.wkspc.DistributedTime.Value);
end
end
end
end
end)
end)

g:Button("aimbot free for all (e to toggle)",function()
local TeamCheck = true
local WallCheck = true
local Key = "E"
local BodyPart = "Head"
local FOV = 1000
local Inset = game:GetService("GuiService"):GetGuiInset()
local SC = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
if string.len(Key) == 1 then
    Key = string.upper(Key)
end
function NotObstructing(Destination, Ignore)
    local Origin = workspace.CurrentCamera.CFrame.Position
    local CheckRay = Ray.new(Origin, Destination - Origin)
    local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, Ignore)
    return Hit == nil
end
function ClosestHoe()
    local MaxDist, Nearest = math.huge
    for I,V in pairs(game:GetService("Players"):GetPlayers()) do
        if V ~= game:GetService("Players").LocalPlayer and V.Character and V.Character:FindFirstChild("Humanoid") then
            if WallCheck then
                if TeamCheck then
                    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
                        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                        if Vis and NotObstructing(V.Character[BodyPart].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
                            local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                            if Diff < MaxDist and Diff < FOV then
                                MaxDist = Diff
                                Nearest = V
                            end
                        end
                    end
                else
                    local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                    if Vis and NotObstructing(V.Character[BodyPart].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
                        local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                        if Diff < MaxDist and Diff < FOV then
                            MaxDist = Diff
                            Nearest = V
                        end
                    end
                end
            else
                if TeamCheck then
                    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
                        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                        if Vis then
                            local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                            if Diff < MaxDist and Diff < FOV then
                                MaxDist = Diff
                                Nearest = V
                            end
                        end
                    end
                else
                    local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                    if Vis then
                        local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                        if Diff < MaxDist and Diff < FOV then
                            MaxDist = Diff
                            Nearest = V
                        end
                    end
                end
            end
        end
    end
    return Nearest
end

game:GetService("RunService").RenderStepped:Connect(function()
    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) then
        local Hoe = ClosestHoe()
        if Hoe and Hoe.Character and Hoe.Character:FindFirstChild(BodyPart) then
            local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(Hoe.Character[BodyPart].Position)
            if Vis then
                mousemoverel(Pos.X - Mouse.X, Pos.Y - Mouse.Y)
            end
        end
    end
end)
end)
                       -- Creates the folder(U will put here your buttons,etc)
g:Button("aimbot team mode (e to toggle)",function()
local TeamCheck = true
local WallCheck = true
local Key = "E"
local BodyPart = "Head"
local FOV = 1000
local Inset = game:GetService("GuiService"):GetGuiInset()
local SC = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
if string.len(Key) == 1 then
    Key = string.upper(Key)
end
function NotObstructing(Destination, Ignore)
    local Origin = workspace.CurrentCamera.CFrame.Position
    local CheckRay = Ray.new(Origin, Destination - Origin)
    local Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, Ignore)
    return Hit == nil
end
function ClosestHoe()
    local MaxDist, Nearest = math.huge
    for I,V in pairs(game:GetService("Players"):GetPlayers()) do
        if V ~= game:GetService("Players").LocalPlayer and V.Character and V.Character:FindFirstChild("Humanoid") then
            if WallCheck then
                if TeamCheck then
                    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
                        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                        if Vis and NotObstructing(V.Character[BodyPart].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
                            local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                            if Diff < MaxDist and Diff < FOV then
                                MaxDist = Diff
                                Nearest = V
                            end
                        end
                    end
                else
                    local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                    if Vis and NotObstructing(V.Character[BodyPart].Position, {game:GetService("Players").LocalPlayer.Character, V.Character}) then
                        local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                        if Diff < MaxDist and Diff < FOV then
                            MaxDist = Diff
                            Nearest = V
                        end
                    end
                end
            else
                if TeamCheck then
                    if V.Team ~= game:GetService("Players").LocalPlayer.Team then
                        local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                        if Vis then
                            local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                            if Diff < MaxDist and Diff < FOV then
                                MaxDist = Diff
                                Nearest = V
                            end
                        end
                    end
                else
                    local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(V.Character[BodyPart].Position)
                    if Vis then
                        local Diff = math.sqrt((Pos.X - SC.X) ^ 2 + (Pos.Y + Inset.Y - SC.Y) ^ 2)
                        if Diff < MaxDist and Diff < FOV then
                            MaxDist = Diff
                            Nearest = V
                        end
                    end
                end
            end
        end
    end
    return Nearest
end

game:GetService("RunService").RenderStepped:Connect(function()
    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode[Key]) then
        local Hoe = ClosestHoe()
        if Hoe and Hoe.Character and Hoe.Character:FindFirstChild(BodyPart) then
            local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(Hoe.Character[BodyPart].Position)
            if Vis then
                mousemoverel(Pos.X - Mouse.X, Pos.Y - Mouse.Y)
            end
        end
    end
end)
end)
b:Button("gun mod",function()
local Functions = {}
for i,v in pairs(getreg()) do
   if type(v) == "function" then
       for i2,v2 in pairs(getfenv(v)) do
           if type(v2) == "function" then
               Functions[tostring(i2)] = v2
           end
       end
   end
end

function GetLocalWeapon()
   return getfenv(Functions.usethatgun).gun
end

game:GetService("RunService"):BindToRenderStep("gunmodsarecool", 1, function()
   getfenv(Functions.usethatgun).currentspread = 0 -- NoSpread

   getfenv(Functions.usethatgun).recoil = 0 -- NoRecoil

   if GetLocalWeapon() ~= "none" and GetLocalWeapon():FindFirstChild("Ammo") then -- Inf Ammo
       debug.setupvalue(Functions["updateInventory"], 3, GetLocalWeapon():FindFirstChild("Ammo").Value)
   end
   
   if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Spawned") and game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then -- RapidFire
       if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health ~= 0 and game.Players.LocalPlayer.Character:FindFirstChild("Spawned") then
           pcall(function()
               Functions.firebullet(true)
           end)
       end
   end
end)
end)

d:ColorPicker("box colour",Color3.fromRGB(255,0,0),function(color) --Default color
    print(color)
    ESP:SetESPColor(color)
end)

d:Toggle("Boxes",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    ESP:BoxESPToggle(bool)
end)

d:Toggle("Tracers",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    ESP:TracersToggle(bool)
end)



d:Toggle("team check",function(bool)
    shared.toggle = bool
    print(shared.toggle)
    ESP:TeamcheckToggle(bool)
end)
d:Toggle("names",function(bool)
   shared.toggle = bool
   print(shared.toggle)
   ESP:NameESPToggle(bool)
end)