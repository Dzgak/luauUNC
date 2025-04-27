# Luau LSP UNC integration

A utility plugin for [luau-lsp](https://github.com/JohnnyMorganz/luau-lsp/) that provides UNC (Unified Naming Convention) support in Roblox Studio.

## About

This plugin integrates with the Luau Language Server to provide:
- UNC type definitions and documentation
- Real-time game service tracking
- Studio integration for luau-lsp

## Configuration

Default settings include:

```lua
{
    port = 3667,
    startAutomatically = false,
    include = {
        -- List of services to track
        game:GetService("Workspace"),
        game:GetService("ReplicatedStorage"),
        -- ...and more
    }
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
