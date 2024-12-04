-- Combine Server-Side and Client-Side Logic in One Script
local function setupServer()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Create Remote Events
    local RemoteEvents = {
        GiveBazooka = Instance.new("RemoteEvent"),
        ExplodePlayer = Instance.new("RemoteEvent"),
        SpawnPart = Instance.new("RemoteEvent"),
        RainbowCharacter = Instance.new("RemoteEvent"),
        TeleportPlayer = Instance.new("RemoteEvent")
    }

    for name, event in pairs(RemoteEvents) do
        event.Name = name
        event.Parent = ReplicatedStorage
    end

    -- Server Event Logic
    RemoteEvents.GiveBazooka.OnServerEvent:Connect(function(player)
        local tool = Instance.new("Tool")
        tool.Name = "Rocket Launcher"
        tool.RequiresHandle = true
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 1, 1)
        handle.BrickColor = BrickColor.new("Bright red")
        handle.Parent = tool
        tool.Parent = player.Backpack
    end)

    -- Other server event logic goes here...
end

local function setupClient()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Fetch Remote Events
    local RemoteEvents = {
        GiveBazooka = ReplicatedStorage:WaitForChild("GiveBazooka"),
        ExplodePlayer = ReplicatedStorage:WaitForChild("ExplodePlayer"),
        -- Other events...
    }

    -- Create GUI for Client-Side
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local MinimizeButton = Instance.new("TextButton")

    -- GUI Logic and Exploit Logic goes here...
end

setupServer()
setupClient()
