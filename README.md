# Luau LSP UNC integration

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
