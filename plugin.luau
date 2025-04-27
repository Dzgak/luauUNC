--!strict
local HttpService = game:GetService("HttpService")

type Settings = {
    port: number,
    startAutomatically: boolean,
    include: { Instance },
    debug: boolean?,
}

local Settings = nil :: Settings?

local function LoadSettings()
    Settings = {
        port = 8080,
        startAutomatically = false,
        debug = false,
        include = {
            game:GetService("Workspace"),
            game:GetService("Players"),
            game:GetService("Lighting"),
            game:GetService("ReplicatedFirst"),
            game:GetService("ReplicatedStorage"),
            game:GetService("ServerScriptService"),
            game:GetService("ServerStorage"),
            game:GetService("StarterGui"),
            game:GetService("StarterPack"),
            game:GetService("StarterPlayer"),
            game:GetService("SoundService"),
            game:GetService("Chat"),
            game:GetService("LocalizationService"),
            game:GetService("TestService"),
        },
    }
end

LoadSettings()

local connected = false
local connections = {}

local function _debugPrint(...)
    if Settings and Settings.debug then
        print(...)
    end
end

local function cleanup()
    for i, connection in pairs(connections) do
        if typeof(connection) == "RBXScriptConnection" then
            connection:Disconnect()
        end
        connections[i] = nil
    end
    connected = false
end

type EncodedInstance = {
    Name: string,
    ClassName: string,
    Children: { EncodedInstance },
}

local function encodeInstance(instance: Instance, childFilter: ((Instance) -> boolean)?): EncodedInstance
    local encoded = {}
    encoded.Name = instance.Name
    encoded.ClassName = instance.ClassName
    encoded.Children = {}

    for _, child in instance:GetChildren() do
        if childFilter and not childFilter(child) then
            continue
        end
        table.insert(encoded.Children, encodeInstance(child))
    end
    return encoded
end

local function sendFullDMInfo(isSilent)
    assert(Settings ~= nil, "attempted to sendFullDMInfo when settings are invalid")
    local tree = encodeInstance(game, function(child)
        return not not table.find(Settings.include, child)
    end)

    local success, result = pcall(function()
        return request({
            Url = string.format("http://localhost:%d/full", Settings.port),
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = HttpService:JSONEncode({
                version = "1.0.0",
                type = "full",
                tree = tree
            })
        })
    end)

    if not success then
        if not isSilent then
            warn(`[Luau Language Server] Connection failed: {result}`)
        end
        cleanup()
    elseif not result.Success then
        warn(`[Luau Language Server] Request failed: {result.StatusCode}: {result.StatusMessage}`)
        cleanup()
    else
        connected = true
        if not isSilent then
            print(`[Luau Language Server] Connected successfully`)
        end
    end
end

local function connectServer(isSilent: boolean?)
    if connected then
        if not isSilent then
            print("[Luau Language Server] Disconnecting")
        end
        cleanup()
    else
        if not isSilent then
            print("[Luau Language Server] Connecting")
        end
        sendFullDMInfo(isSilent)
    end
end

if Settings and Settings.startAutomatically then
    connectServer(true)
end