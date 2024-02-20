local redtweeninfo = TweenInfo.new(3)
local redinfo = {Color = Color3.new(1, 0.33333333333, 0.1)}
----------
for i,v in pairs(workspace.CurrentRooms:GetDescendants()) do
			if v:IsA("Light") then
					game.TweenService:Create(v,redtweeninfo,redinfo):Play()
					if v.Parent.Name == "LightFixture" then
						    game.TweenService:Create(v.Parent,redtweeninfo,redinfo):Play()
					end
		  end
end
 
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(Cf)
	camara.CFrame = camara.CFrame * Cf
end)
camShake:Start()
camShake:Shake(CameraShaker.Presets.Earthquake)
camShake:Shake(CameraShaker.Presets.Earthquake)
 
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/FranciscoNeto5123/nothing-important-here/main/unotgiga%3Fy%3F"))()
 
 
-- Create entity
local entityTable = Spawner.createEntity({
    CustomName = "Ripper", -- Custom name of your entity
    Model = "rbxassetid://12234498940", -- Can be GitHub file or rbxassetid
    Speed = 170, -- Percentage, 100 = default Rush speed
    DelayTime = 10.7, -- Time before starting cycles (seconds)
    HeightOffset = 6,
    CanKill = true,
    KillRange = 80,
    BackwardsMovement = false,
    BreakLights = false,
    FlickerLights = {
        false, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {11.7, 22, 1, 0.1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to who you call Ripper....", "when he screams means you have to hide...", "and you didnt hidded..", "hide when the rooms are red!"}, -- Custom death message
})
 
 
-----[[  Debug -=- Advanced  ]]-----
entityTable.Debug.OnEntitySpawned = function()
    print("Entity has spawned:", entityTable)
end
 
entityTable.Debug.OnEntityDespawned = function()
    print("Entity has despawned:", entityTable)
end
 
entityTable.Debug.OnEntityStartMoving = function()
    print("Entity has started moving:", entityTable)
end
 
entityTable.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:", entityTable)
end
 
entityTable.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entityTable, "has entered room:", room)
end
 
entityTable.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:", entityTable)
end
 
entityTable.Debug.OnDeath = function()
    warn("Player has died.")
end
------------------------------------
 
 
-- Run the created entity
Spawner.runEntity(entityTable)
