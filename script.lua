-- Recovered Luau source by ZeroVector
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sempiller/LithiumLib/refs/heads/main/Library.lua"))()
local lib2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/addons/SaveManager.lua"))()
local createScreenGui, tbl, lithiumExclusive, v, v2, color, flag, flag2, flag3, radius, RunService

do
    local TweenService = game:GetService("TweenService")
    local RunService2 = game:GetService("RunService")

    local tbl2 = {
        FontColor = Color3.fromHex("ffffff"),
        MainColor = Color3.fromHex("000000"),
        AccentColor = Color3.fromHex("A020F0"),
        OutlineColor = Color3.fromHex("282828"),
    }

    createScreenGui = function(arg)
        local title = arg.Title
        local text = title or "Notification"
        local text2 = arg.Text
        local text3 = text2 or ""
        local duration = arg.Duration
        local n = duration or 5
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "CustomNotification"
        screenGui.DisplayOrder = 999999
        screenGui.ResetOnSpawn = false
        screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 350, 0, 70)
        frame.Position = UDim2.new(1, 10, 1, 10)
        frame.BackgroundColor3 = tbl2.MainColor
        frame.BorderSizePixel = 0
        frame.Parent = screenGui
        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, 4)
        uiCorner.Parent = frame
        local frame2 = Instance.new("Frame")
        frame2.Size = UDim2.new(1, 2, 1, 2)
        frame2.Position = UDim2.new(0, -1, 0, -1)
        frame2.BackgroundColor3 = tbl2.OutlineColor
        frame2.BorderSizePixel = 0
        frame2.ZIndex = frame.ZIndex - 1
        frame2.Parent = frame
        local uiCorner2 = Instance.new("UICorner")
        uiCorner2.CornerRadius = UDim.new(0, 4)
        uiCorner2.Parent = frame2
        local frame3 = Instance.new("Frame")
        frame3.Size = UDim2.new(0, 3, 1, 0)
        frame3.Position = UDim2.new(0, 0, 0, 0)
        frame3.BackgroundColor3 = tbl2.AccentColor
        frame3.BorderSizePixel = 0
        frame3.Parent = frame
        local uiCorner3 = Instance.new("UICorner")
        uiCorner3.CornerRadius = UDim.new(0, 4)
        uiCorner3.Parent = frame3
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, -50, 0, 20)
        textLabel.Position = UDim2.new(0, 15, 0, 5)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = text
        textLabel.TextColor3 = tbl2.FontColor
        textLabel.TextSize = 14
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = frame
        local textLabel2 = Instance.new("TextLabel")
        textLabel2.Size = UDim2.new(1, -50, 0, 25)
        textLabel2.Position = UDim2.new(0, 15, 0, 27)
        textLabel2.BackgroundTransparency = 1
        textLabel2.Text = text3
        textLabel2.TextColor3 = Color3.fromHex("cccccc")
        textLabel2.TextSize = 12
        textLabel2.Font = Enum.Font.Gotham
        textLabel2.TextXAlignment = Enum.TextXAlignment.Left
        textLabel2.TextYAlignment = Enum.TextYAlignment.Top
        textLabel2.TextWrapped = true
        textLabel2.Parent = frame
        local textButton = Instance.new("TextButton")
        textButton.Size = UDim2.new(0, 60, 0, 22)
        textButton.Position = UDim2.new(1, -70, 1, -30)
        textButton.BackgroundColor3 = tbl2.AccentColor
        textButton.BorderSizePixel = 0
        textButton.Text = "OK"
        textButton.TextColor3 = tbl2.FontColor
        textButton.TextSize = 11
        textButton.Font = Enum.Font.GothamSemibold
        textButton.Parent = frame
        local uiCorner4 = Instance.new("UICorner")
        uiCorner4.CornerRadius = UDim.new(0, 3)
        uiCorner4.Parent = textButton
        local frame4 = Instance.new("Frame")
        frame4.Size = UDim2.new(1, 0, 0, 2)
        frame4.Position = UDim2.new(0, 0, 1, -2)
        frame4.BackgroundColor3 = tbl2.OutlineColor
        frame4.BorderSizePixel = 0
        frame4.Parent = frame
        local frame5 = Instance.new("Frame")
        frame5.Size = UDim2.new(1, 0, 1, 0)
        frame5.Position = UDim2.new(0, 0, 0, 0)
        frame5.BackgroundColor3 = tbl2.AccentColor
        frame5.BorderSizePixel = 0
        frame5.Parent = frame4
        local uiCorner5 = Instance.new("UICorner")
        uiCorner5.CornerRadius = UDim.new(0, 1)
        uiCorner5.Parent = frame5
        local now = tick()
        local flag4 = false
        local tween = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -360, 1, -90)})
        local tween2 = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 10, 1, 10)})

        local function fn()
            if flag4 then
                return
            end
            flag4 = true
            tween2:Play()

            tween2.Completed:Connect(function()
                screenGui:Destroy()
            end)
        end

        textButton.MouseButton1Click:Connect(fn)
        local connection = nil

        connection = RunService2.Heartbeat:Connect(function()
            if not flag4 then
                local n2 = tick() - now
                local n3 = math.min(n2 / n, 1)
                frame5.Size = UDim2.new(1 - n3, 0, 1, 0)

                if n3 >= 1 then
                    connection:Disconnect()
                    fn()
                end

                return
            end

            connection:Disconnect()
        end)

        tween:Play()
        return screenGui
    end

    local v3 = gethui
    local hui = v3 and gethui() or game:GetService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "KamiHubPartnerAdvert"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.Parent = hui
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    local frame2 = Instance.new("Frame")
    frame2.Size = UDim2.new(0, 400, 0, 300)
    frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame2.AnchorPoint = Vector2.new(0.5, 0.5)
    frame2.BackgroundTransparency = 1
    frame2.Parent = frame
    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    uiListLayout.Padding = UDim.new(0, 15)
    uiListLayout.Parent = frame2
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 90, 0, 90)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = "rbxassetid://134381128166701"
    imageLabel.ImageTransparency = 1
    imageLabel.LayoutOrder = 1
    imageLabel.Parent = frame2
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local tbl3 = {frame, imageLabel}

    local function fn(backgroundTransparency)
        for i, v4 in ipairs(tbl3) do
            local tbl4 = {}

            if v4:IsA("Frame") then
                tbl4.BackgroundTransparency = backgroundTransparency
            elseif v4:IsA("TextLabel") then
                tbl4.TextTransparency = backgroundTransparency
            elseif v4:IsA("ImageLabel") then
                tbl4.ImageTransparency = backgroundTransparency
            end

            TweenService:Create(v4, tweenInfo, tbl4):Play()
        end

        task.wait(1)
    end

    fn(0)
    task.wait(5)
    fn(1)
    wait()
    screenGui:Destroy()

    createScreenGui({
        Title = "Automated Message",
        Text = "This script does not support Xeno/Xeno Based Executors",
        Duration = 2,
    })

    wait(2)

    createScreenGui({
        Title = "Automated Message",
        Text = "We recommend you to use +90 sUNC executors",
        Duration = 2,
    })

    for k, v4 in pairs({
        FontColor = "ffffff",
        MainColor = "000000",
        BackgroundColor = "000000",
        AccentColor = "A020F0",
        OutlineColor = "282828",
    }) do
        lib[k] = Color3.fromHex(v4)
    end

    if lib.GetDarkerColor then
        lib.AccentColorDark = lib:GetDarkerColor(lib.AccentColor)
    else
        lib.AccentColorDark = Color3.fromHex("4b0082")
    end

    local v4 = lib:CreateWindow({
        Title = "KamiHub - Arsenal",
        Center = true,
        AutoShow = true,
        TabPadding = 8,
        MenuFadeTime = 0.2,
        Size = UDim2.fromOffset(550, 700),
    })

    tbl = {
        Combat = v4:AddTab("Combat"),
        Blatant = v4:AddTab("Blatant"),
        Visuals = v4:AddTab("Visuals"),
        Misc = v4:AddTab("Misc"),
        Settings = v4:AddTab("Settings"),
        Info = v4:AddTab("Info"),
    }

    spawn(function()
        while wait() do
            local color2 = Color3.fromHex("A020F0")
            espColor = color2
        end
    end)

    local playerGui = game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local screenGui2 = Instance.new("ScreenGui")
    screenGui2.Parent = playerGui

    local function fn2(text, position, size, borderSizePixel)
        local frame3 = Instance.new("Frame")
        frame3.Size = size
        frame3.Position = position
        frame3.BackgroundTransparency = 1
        frame3.Parent = screenGui2
        frame3.BorderSizePixel = borderSizePixel
        frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
        local textLabel = Instance.new("TextLabel")
        textLabel.Parent = frame3
        textLabel.Text = text
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Position = UDim2.new(0, 0, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextColor3 = Color3.fromHex("A020F0")
        textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        textLabel.TextStrokeTransparency = 0
        return frame3, textLabel
    end

    lithiumExclusive, v = fn2("KamiHub Exclusive", UDim2.new(1, -210, 1, -100), UDim2.new(0, 200, 0, 50), 2)
    lithiumExclusive, v2 = fn2(" KamiHub Arsenal Edition", UDim2.new(1, -310, 1, -60), UDim2.new(0, 300, 0, 30), 2)
    color = Color3.fromHex("A020F0")
    local Players = game:GetService("Players")
    game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    game:GetService("ReplicatedStorage")
    local localPlayer = Players.LocalPlayer
    local mouse = localPlayer:GetMouse()
    local connection = nil
    flag = false
    flag2 = false
    flag3 = false

    local function fn3()
        for k, child in pairs(game:GetChildren()) do
            if child.ClassName == "Players" then
                return child.Name
            end
        end
    end

    local function fn4(arg, arg2, arg3)
        local position = Workspace.CurrentCamera.CFrame.Position
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        raycastParams.FilterDescendantsInstances = {arg3}
        local hit = Workspace:Raycast(position, arg2 - position, raycastParams)
        if not hit then
            return true
        end
        local model = hit.Instance:FindFirstAncestorOfClass("Model")
        local flag4 = Players:GetPlayerFromCharacter(model) == arg
        return flag4
    end

    local v5 = nil

    local function fn5(arg)
        local v6, v7 = Workspace.CurrentCamera:WorldToViewportPoint(arg)
        local vector2 = Vector2.new(Workspace.CurrentCamera.ViewportSize.X / 2, Workspace.CurrentCamera.ViewportSize.Y / 2)
        return (Vector2.new(v6.X, v6.Y) - vector2).Magnitude, v7
    end

    local function fn6()
        local localPlayer2 = Players.LocalPlayer
        if not localPlayer2 or not localPlayer2.Character or not localPlayer2.Character:FindFirstChild("Head") then
            return nil
        end
        local currentCamera = Workspace.CurrentCamera
        local v6 = nil
        local huge = math.huge

        if v5 and v5.Character and v5.Character:FindFirstChild("Head") then
            local position = v5.Character.Head.Position
            local v7, v8 = fn5(position)
            local flag4 = true

            if flag3 then
                flag4 = fn4(v5, position, localPlayer2.Character)
            end

            if v8 and v7 <= 75 and flag4 then
                v6 = v5
                huge = v7
            end
        end

        for k, player in pairs(Players:GetPlayers()) do
            if player ~= localPlayer2 and player.Team ~= localPlayer2.Team and player.Character and player.Character:FindFirstChild("Head") then
                local position = player.Character.Head.Position
                local v7, v8 = fn5(position)

                if v8 and v7 <= 50 then
                    local flag4 = true

                    if flag3 then
                        flag4 = fn4(player, position, localPlayer2.Character)
                    end

                    if flag4 and v7 < huge then
                        huge = v7
                        v6 = player
                    end
                end
            end
        end

        v5 = v6
        return v6
    end

    local Players2 = game:GetService("Players")
    local RunService3 = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local localPlayer2 = Players2.LocalPlayer
    local currentCamera = workspace.CurrentCamera
    localPlayer2:GetMouse()
    local flag4 = false
    local flag5 = true
    local flag6 = false
    local flag7 = false
    radius = 50
    local n = 100
    local str = "HeadHB"
    local color2 = Color3.fromRGB(160, 32, 240)
    local flag8 = false
    local flag9 = false
    local tbl4 = {"HeadHB", "TorsoHB"}
    local v6 = nil
    local tbl5 = {}
    local n2 = 0
    local flag10 = true

    local function fn7()
        if n >= 100 then
            return true
        end

        if n <= 0 then
            return false
        end

        if os.clock() - n2 > 0.08 then
            n2 = os.clock()
            local flag11 = math.random(1, 100) <= n
            flag10 = flag11
        end

        return flag10
    end

    local function fn8(arg)
        if not arg then
            return
        end

        pcall(function()
            arg.LocalTransparencyModifier = 1
            arg.Transparency = 1

            for i, descendant in ipairs(arg:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.LocalTransparencyModifier = 1
                    descendant.Transparency = 1
                elseif not descendant:IsA("Decal") and not descendant:IsA("Texture") then
                    if descendant:IsA("BillboardGui") or descendant:IsA("SurfaceGui") then
                        descendant.Enabled = false
                    end
                else
                    descendant.Transparency = 1
                end
            end
        end)
    end

    local function fn9(arg)
        if not arg then
            return
        end

        pcall(function()
            arg.LocalTransparencyModifier = 0

            for i, descendant in ipairs(arg:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.LocalTransparencyModifier = 0
                elseif descendant:IsA("BillboardGui") or descendant:IsA("SurfaceGui") then
                    descendant.Enabled = true
                end
            end
        end)
    end

    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude

    local function fn10(arg)
        if not localPlayer2.Character then
            return true
        end
        raycastParams.FilterDescendantsInstances = {localPlayer2.Character, currentCamera}
        local position = currentCamera.CFrame.Position
        local hit = workspace:Raycast(position, arg.Position - position, raycastParams)
        if not hit then
            return true
        end
        return hit.Instance:IsDescendantOf(arg.Parent)
    end

    local function fn11(arg)
        if arg == localPlayer2 then
            return false
        end

        if flag5 and localPlayer2.Team and arg.Team and localPlayer2.Team == arg.Team then
            return false
        end
        return true
    end

    local tbl6 = {
        HeadHB = {"HeadHB", "Head"},
        TorsoHB = {"Torso", "UpperTorso", "LowerTorso", "HumanoidRootPart"},
    }

    local function fn12(arg, arg2)
        for i, v7 in ipairs(arg2) do
            local v8 = arg:FindFirstChild(v7)
            if v8 and v8:IsA("BasePart") then
                return v8
            end
        end

        return nil
    end

    local function createPart(parent, name)
        local v7 = parent:FindFirstChild(name)
        if v7 and v7:IsA("BasePart") then
            return v7
        end
        local v8 = tbl6[name]
        local tbl7 = v8 or {}
        local v9 = fn12(parent, tbl7)
        if not v9 then
            return nil
        end
        local part = Instance.new("Part")
        part.Name = name
        part.Size = v9.Size
        part.Transparency = 1
        part.CanCollide = false
        part.Massless = true
        part.CFrame = v9.CFrame

        pcall(function()
            part.CanQuery = true
        end)

        pcall(function()
            part.CanTouch = false
        end)

        part.Parent = parent
        local weldConstraint = Instance.new("WeldConstraint")
        weldConstraint.Part0 = v9
        weldConstraint.Part1 = part
        weldConstraint.Parent = part
        return part
    end

    local function fn13(arg)
        local v7 = str
        local v8 = v7

        if v7 == "Random" then
            v8 = tbl4[math.random(1, #tbl4)]
        end

        local v9 = createPart(arg, v8)
        local headHB = v9 or createPart(arg, "HeadHB")
        return headHB
    end

    local function fn14(arg, arg2)
        for i, v7 in ipairs({"HumanoidRootPart", "HeadHB"}) do
            local v8 = arg:FindFirstChild(v7)
            if v8 and v8 ~= arg2 then
                return v8
            end
        end

        return nil
    end

    local function fn15(arg, arg2)
        local v7 = fn14(arg2.Parent, arg2)
        local tbl7 = {part = arg2, hitName = str, anchor = v7}
        local v8 = v7 and v7.CFrame:ToObjectSpace(arg2.CFrame) or nil
        tbl7.offset = v8
        tbl7.size = arg2.Size
        tbl7.cframe = arg2.CFrame
        tbl7.trans = arg2.Transparency
        tbl7.canCollide = arg2.CanCollide
        tbl7.anchored = arg2.Anchored
        tbl7.massless = arg2.Massless
        tbl7.welds = {}

        for i, v9 in ipairs(arg2:GetJoints()) do
            if v9:IsA("Motor6D") or v9:IsA("Weld") or v9:IsA("WeldConstraint") then
                table.insert(tbl7.welds, {joint = v9, parent = v9.Parent})
                v9.Parent = nil
            end
        end

        arg2.Massless = true
        arg2.CanCollide = false
        arg2.Anchored = true

        pcall(function()
            arg2.CanQuery = true
        end)

        tbl5[arg] = tbl7
    end

    local function fn16(arg)
        local v7 = tbl5[arg]
        if not v7 then
            return
        end
        local part = v7.part

        pcall(function()
            if part and part.Parent then
                fn9(part)
                part.Anchored = v7.anchored
                part.CanCollide = v7.canCollide
                part.Massless = v7.massless

                if v7.anchor and v7.anchor.Parent and v7.offset then
                    part.CFrame = v7.anchor.CFrame * v7.offset
                else
                    part.CFrame = v7.cframe
                end

                local trans = v7.trans
                part.Size = v7.size
                part.Transparency = trans

                for i, weld in ipairs(v7.welds) do
                    if weld.joint and weld.joint.Parent == nil then
                        weld.joint.Parent = weld.parent
                    end
                end
            end
        end)

        tbl5[arg] = nil
    end

    local function fn17()
        for k in pairs(tbl5) do
            fn16(k)
        end

        tbl5 = {}
    end

    local function fn18()
        local v7, v8, n3, v9, v10, v11, v12, v13, v14, character, humanoidRootPart, humanoid, headHB, v15, v16, v17, magnitude, n4
        n4 = 1

        while true do
            if n4 == 1 then
                v7 = nil
                v8 = radius
                n3 = currentCamera.ViewportSize / 2
                v9, v10, v11 = ipairs(Players2:GetPlayers())
                v12 = v11
                n4 = 2
            elseif n4 == 2 then
                v13, v14 = v9(v10, v12)

                if v13 == nil then
                    n4 = 16
                else
                    n4 = 3
                end
            elseif n4 == 3 then
                v12 = v13

                if fn11(v14) then
                    n4 = 4
                else
                    n4 = 2
                end
            elseif n4 == 4 then
                character = v14.Character
                humanoidRootPart = character

                if character then
                    n4 = 5
                else
                    n4 = 6
                end
            elseif n4 == 5 then
                humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                n4 = 6
            elseif n4 == 6 then
                humanoid = character

                if character then
                    n4 = 7
                else
                    n4 = 8
                end
            elseif n4 == 7 then
                humanoid = character:FindFirstChildOfClass("Humanoid")
                n4 = 8
            elseif n4 == 8 then
                if humanoidRootPart and humanoid and humanoid.Health > 0 then
                    n4 = 9
                else
                    n4 = 2
                end
            elseif n4 == 9 then
                if flag6 then
                    n4 = 10
                else
                    n4 = 13
                end
            elseif n4 == 10 then
                headHB = character:FindFirstChild("HeadHB")
                v15 = headHB

                if headHB then
                    n4 = 12
                else
                    n4 = 11
                end
            elseif n4 == 11 then
                v15 = humanoidRootPart
                n4 = 12
            elseif n4 == 12 then
                if fn10(v15) then
                    n4 = 13
                else
                    n4 = 2
                end
            elseif n4 == 13 then
                v16, v17 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)

                if v17 then
                    n4 = 14
                else
                    n4 = 2
                end
            elseif n4 == 14 then
                magnitude = (Vector2.new(v16.X, v16.Y) - n3).Magnitude

                if magnitude < v8 then
                    n4 = 15
                else
                    n4 = 2
                end
            elseif n4 == 15 then
                v8 = magnitude
                v7 = v14
                n4 = 2
            elseif n4 == 16 then
                return v7
            end
        end
    end

    RunService3.RenderStepped:Connect(function()
        if not flag4 then
            if next(tbl5) then
                fn17()
            end

            v6 = nil
            return
        end

        local v7 = fn18()
        v6 = v7

        for k in pairs(tbl5) do
            if k ~= v7 then
                fn16(k)
            end
        end

        if not v7 or not v7.Character then
            return
        end
        local character = v7.Character
        local v8 = tbl5[v7]
        local v9 = v8

        if v8 and v8.hitName ~= str then
            fn16(v7)
            v9 = nil
        end

        if not v9 then
            local v10 = fn13(character)
            if not v10 then
                return
            end
            fn15(v7, v10)
            v9 = tbl5[v7]
        end

        if not v9 then
            return
        end
        local part = v9.part

        if part and part.Parent then
            local position = currentCamera.CFrame.Position
            local lookVector = currentCamera.CFrame.LookVector

            if fn7() then
                local anchor = v9.anchor
                local magnitude = anchor and v9.anchor.Parent and (v9.anchor.Position - position).Magnitude or 30
                part.CFrame = CFrame.new(position + lookVector * magnitude)
                part.Size = Vector3.new(5, 5, 5)
            else
                if v9.anchor and v9.anchor.Parent and v9.offset then
                    part.CFrame = v9.anchor.CFrame * v9.offset
                end

                part.Size = v9.size
            end

            fn8(part)
            return
        end

        tbl5[v7] = nil
    end)

    localPlayer2.CharacterAdded:Connect(fn17)

    Players2.PlayerRemoving:Connect(function(player)
        fn16(player)
    end)

    local highlight = Instance.new("Highlight")
    highlight.FillColor = color2
    highlight.OutlineColor = color2
    highlight.FillTransparency = 0.4
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = false
    local v7 = gethui
    local hui2 = v7 and gethui() or game:GetService("CoreGui")
    highlight.Parent = hui2
    local line = Drawing.new("Line")
    line.Visible = false
    line.Color = color2
    line.Thickness = 2
    line.Transparency = 1

    RunService3.RenderStepped:Connect(function()
        if flag8 and flag4 and v6 and v6.Character then
            local humanoidRootPart = v6.Character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart then
                local v8, v9 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)

                if v9 then
                    line.Visible = true
                    line.Color = color2
                    line.Thickness = 2
                    line.From = currentCamera.ViewportSize / 2
                    line.To = Vector2.new(v8.X, v8.Y)
                else
                    line.Visible = false
                end
            else
                line.Visible = false
            end
        else
            line.Visible = false
        end

        if flag9 and flag4 and v6 and v6.Character then
            highlight.Adornee = v6.Character
            highlight.FillColor = color2
            highlight.OutlineColor = color2
            highlight.Enabled = true
        else
            highlight.Enabled = false
            highlight.Adornee = nil
        end
    end)

    local function fn19(arg)
        pcall(arg)
    end

    local tbl7 = {"anticheat", "arsenal_ac", "acs", "detect", "raycheck"}

    local tbl8 = {
        "RayCheck",
        "CheckRay",
        "DetectFly",
        "CheckSpeed",
        "KickPlayer",
        "ValidateShot",
    }

    fn19(function()
        local v8, v9, v10 = ipairs(localPlayer2.PlayerGui:GetDescendants())
        local v11 = v10
        local v12 = v8
        local v13 = v9

        while true do
            local v14, v15 = v12(v13, v11)
            if v14 == nil then
                break
            end
            local str2 = v15.Name:lower()

            for i, v16 in ipairs(tbl7) do
                if str2:find(v16) and (v15:IsA("LocalScript") or v15:IsA("ModuleScript")) then
                    fn19(function()
                        v15.Disabled = true
                    end)
                end
            end

            v11 = v14
        end
    end)

    fn19(function()
        local v8, v9, v10 = pairs(getgc(true))
        local v11 = v10
        local v12 = v8
        local v13 = v9

        while true do
            local v14, v15 = v12(v13, v11)
            if v14 == nil then
                break
            end
            v11 = v14

            if type(v15) == "table" then
                local v16, v17, v18 = ipairs(tbl8)
                local v19 = v12
                local v20 = v13
                local v21 = v18
                local v22 = v14
                local v23 = v19
                local v24 = v20

                while true do
                    local v25, v26 = v16(v17, v21)
                    if v25 == nil then
                        break
                    end
                    v21 = v25

                    if rawget(v15, v26) ~= nil then
                        for k, v27 in pairs(v15) do
                            if type(v27) == "function" then
                                rawset(v15, k, function()
                                    return true
                                end)
                            end
                        end

                        v22 = v14
                        v23 = v19
                        v24 = v20
                        break
                    end
                end

                v11 = v22
                v12 = v23
                v13 = v24
            end
        end
    end)

    fn19(function()
        for i, descendant in ipairs(ReplicatedStorage:GetDescendants()) do
            if descendant:IsA("RemoteFunction") then
                local str2 = descendant.Name:lower()

                if str2:find("check") or str2:find("ac") or str2:find("anti") then
                    pcall(function()
                        descendant.OnClientInvoke = function()
                            return true
                        end
                    end)
                end
            end
        end
    end)

    local tbl9 = {
        "RightUpperLeg",
        "LeftUpperLeg",
        "HeadHB",
        "HumanoidRootPart",
    }

    local tbl10 = {}

    local function fn20(arg)
        arg.LocalTransparencyModifier = 1
        arg.Transparency = 1

        for i, descendant in ipairs(arg:GetDescendants()) do
            if not descendant:IsA("Decal") and not descendant:IsA("Texture") then
                if descendant:IsA("BillboardGui") or descendant:IsA("SurfaceGui") then
                    descendant.Enabled = false
                end
            else
                descendant.Transparency = 1
            end
        end
    end

    local function fn21(arg, arg2)
        local v8 = tbl10[arg]
        local v9 = v8

        if not v8 then
            local tbl11 = {}
            v9 = tbl11
            tbl10[arg] = tbl11
        end

        local n3 = math.clamp(radius * 0.13, 5, 60)
        local vector = Vector3.new(n3, n3, n3)

        for i, v10 in ipairs(tbl9) do
            local v11 = arg2:FindFirstChild(v10)

            if v11 and v11:IsA("BasePart") then
                if not v9[v11] then
                    v9[v11] = {
                        size = v11.Size,
                        trans = v11.Transparency,
                        cc = v11.CanCollide,
                    }
                end

                v11.CanCollide = false
                v11.Size = vector
                fn20(v11)
            end
        end
    end

    local function fn22(player)
        local v8 = tbl10[player]
        if not v8 then
            return
        end

        for k, v9 in pairs(v8) do
            pcall(function()
                if k and k.Parent then
                    k.Size = v9.size
                    k.CanCollide = v9.cc
                    k.Transparency = v9.trans
                    k.LocalTransparencyModifier = 0
                end
            end)
        end

        tbl10[player] = nil
    end

    local function fn23()
        for k in pairs(tbl10) do
            fn22(k)
        end

        tbl10 = {}
    end

    local function fn24(arg)
        local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then
            return false
        end
        local v8, v9 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)
        if not v9 then
            return false
        end
        local flag11 = (Vector2.new(v8.X, v8.Y) - currentCamera.ViewportSize / 2).Magnitude <= radius
        return flag11
    end

    RunService3.RenderStepped:Connect(function()
        local v8, v9, v10, v11, v12, v13, flag11, character, humanoidRootPart, humanoid, headHB, v14, v15, v16, v17, v18, v19, v20, v21, v22
        local v23, v24, v25, v26, v27, v28, v29, n3
        n3 = 1

        while true do
            if n3 == 1 then
                if flag4 and str == "TorsoHB" then
                    n3 = 5
                else
                    n3 = 2
                end
            elseif n3 == 2 then
                if next(tbl10) then
                    n3 = 3
                else
                    n3 = 4
                end
            elseif n3 == 3 then
                fn23()
                n3 = 4
            elseif n3 == 4 then
                return
            elseif n3 == 5 then
                v8, v9, v10 = ipairs(Players2:GetPlayers())
                v11 = v10
                n3 = 6
            elseif n3 == 6 then
                v12, v13 = v8(v9, v11)

                if v12 == nil then
                    n3 = 20
                else
                    n3 = 7
                end
            elseif n3 == 7 then
                v11 = v12
                flag11 = false

                if fn11(v13) then
                    n3 = 8
                else
                    n3 = 18
                end
            elseif n3 == 8 then
                character = v13.Character
                humanoidRootPart = character

                if character then
                    n3 = 9
                else
                    n3 = 10
                end
            elseif n3 == 9 then
                humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                n3 = 10
            elseif n3 == 10 then
                humanoid = character

                if character then
                    n3 = 11
                else
                    n3 = 12
                end
            elseif n3 == 11 then
                humanoid = character:FindFirstChildOfClass("Humanoid")
                n3 = 12
            elseif n3 == 12 then
                if humanoidRootPart and humanoid and humanoid.Health > 0 and fn24(character) then
                    n3 = 13
                else
                    n3 = 18
                end
            elseif n3 == 13 then
                if flag6 then
                    n3 = 14
                else
                    n3 = 17
                end
            elseif n3 == 14 then
                headHB = character:FindFirstChild("HeadHB")
                v14 = headHB

                if headHB then
                    n3 = 16
                else
                    n3 = 15
                end
            elseif n3 == 15 then
                v14 = humanoidRootPart
                n3 = 16
            elseif n3 == 16 then
                if fn10(v14) then
                    n3 = 17
                else
                    n3 = 18
                end
            elseif n3 == 17 then
                flag11 = true
                fn21(v13, character)
                n3 = 18
            elseif n3 == 18 then
                if flag11 then
                    n3 = 6
                else
                    n3 = 19
                end
            elseif n3 == 19 then
                fn22(v13)
                n3 = 6
            elseif n3 == 20 then
                v15, v16, v17 = pairs(tbl10)
                v18 = v17
                v19 = v15
                v20 = v16
                n3 = 21
            elseif n3 == 21 then
                v21, v22 = v19(v20, v18)

                if v21 == nil then
                    n3 = 27
                else
                    n3 = 22
                end
            elseif n3 == 22 then
                v23, v24, v25 = pairs(v22)
                v26 = v19
                v27 = v20
                v28 = v25
                n3 = 23
            elseif n3 == 23 then
                v29 = v23(v24, v28)

                if v29 == nil then
                    n3 = 26
                else
                    n3 = 24
                end
            elseif n3 == 24 then
                v28 = v29

                if v29 and v29.Parent then
                    n3 = 25
                else
                    n3 = 23
                end
            elseif n3 == 25 then
                v29.LocalTransparencyModifier = 1
                n3 = 23
            elseif n3 == 26 then
                v18 = v21
                v19 = v26
                v20 = v27
                n3 = 21
            elseif n3 == 27 then
                return
            end
        end
    end)

    localPlayer2.CharacterAdded:Connect(fn23)
    Players2.PlayerRemoving:Connect(fn22)
    local v8 = tbl.Combat:AddLeftGroupbox("Silent Aim")

    v8:AddToggle("SA", {
        Text = "Silent Aim",
        Default = false,
        Tooltip = "Teleports the chosen invisible hitbox to your aim point.",
        Callback = function(arg)
            flag4 = arg

            if not arg then
                fn17()
            end
        end,
    })

    v8:AddToggle("TC", {
        Text = "Team Check",
        Default = true,
        Tooltip = "Never target teammates.",
        Callback = function(arg)
            flag5 = arg
        end,
    })

    v8:AddToggle("WC", {
        Text = "Wall Check",
        Default = false,
        Tooltip = "Only lock players you can actually see.",
        Callback = function(arg)
            flag6 = arg
        end,
    })

    v8:AddDivider()

    v8:AddDropdown("HP", {
        Text = "Hit Part",
        Default = "HeadHB",
        Values = {"HeadHB", "TorsoHB", "Random"},
        Tooltip = "Invisible hit region. TorsoHB also runs the auto FOV catch-box. Never moves a visible part.",
        Callback = function(arg)
            str = arg
        end,
    })

    v8:AddSlider("HC", {
        Text = "Hit Chance (%)",
        Default = 100,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Tooltip = "Percentage of shots that aim. 100 = every shot.",
        Callback = function(arg)
            n = arg
        end,
    })

    v8:AddDivider()

    v8:AddToggle("SNAP", {
        Text = "Snapline to Target",
        Default = false,
        Tooltip = "Draws a purple line from your crosshair to the locked target.",
        Callback = function(arg)
            flag8 = arg
        end,
    })

    v8:AddToggle("HL", {
        Text = "Target Highlight",
        Default = false,
        Tooltip = "Highlights the locked target in purple so you can see who's hooked.",
        Callback = function(arg)
            flag9 = arg
        end,
    })

    tbl.Combat:AddRightGroupbox("Hitbox"):AddToggle("SilentHitbox", {
        Text = "Hitbox Expander",
        Default = false,
        Tooltip = "Expands hitbox of the player",
        Callback = function(arg)
            if arg then
                local v9 = fn3()
                local localPlayer3 = game[v9].LocalPlayer

                if connection then
                    connection:Disconnect()
                end

                connection = RunService3.RenderStepped:Connect(function()
                    local v10, v11, v12 = pairs(game[v9]:GetPlayers())
                    local v13 = v12
                    local v14 = v10
                    local v15 = v11

                    while true do
                        local v16, v17 = v14(v15, v13)
                        if v16 == nil then
                            break
                        end
                        v13 = v16

                        if v17.Name ~= localPlayer3.Name and v17.Character then
                            for k, v18 in pairs({
                                v17.Character:FindFirstChild("RightUpperLeg"),
                                v17.Character:FindFirstChild("LeftUpperLeg"),
                                v17.Character:FindFirstChild("HeadHB"),
                                v17.Character:FindFirstChild("HumanoidRootPart"),
                            }) do
                                if v18 then
                                    v18.CanCollide = false
                                    v18.Transparency = 1
                                    v18.Size = Vector3.new(20, 20, 20)
                                end
                            end

                            v13 = v16
                        end
                    end
                end)
            else
                if connection then
                    connection:Disconnect()
                end

                local v9 = fn3()
                local v10, v11, v12 = pairs(game[v9]:GetPlayers())
                local v13 = v12
                local v14 = v10
                local v15 = v11

                while true do
                    local v16, v17 = v14(v15, v13)
                    if v16 == nil then
                        break
                    end
                    v13 = v16

                    if v17.Character then
                        for k, v18 in pairs({
                            v17.Character:FindFirstChild("RightUpperLeg"),
                            v17.Character:FindFirstChild("LeftUpperLeg"),
                            v17.Character:FindFirstChild("HeadHB"),
                            v17.Character:FindFirstChild("HumanoidRootPart"),
                        }) do
                            if v18 then
                                v18.CanCollide = false
                                v18.Transparency = 1
                                v18.Size = Vector3.new(2, 2, 2)
                            end
                        end

                        v13 = v16
                    end
                end
            end
        end,
    })

    local Aimbot = tbl.Combat:AddLeftGroupbox("Aimbot")

    Aimbot:AddToggle("Aimbot", {
        Text = "Aimbot",
        Default = false,
        Callback = function(arg)
            flag = arg
        end,
    })

    Aimbot:AddToggle("MB2 To Aimbot", {
        Text = "MB2 To Aimbot",
        Default = false,
        Callback = function(arg)
            flag2 = arg
        end,
    })

    Aimbot:AddToggle("WallCheck", {
        Text = "Wall Check",
        Default = false,
        Callback = function(arg)
            flag3 = arg
        end,
    })

    Aimbot:AddSlider("Smoothness", {
        Text = "Smoothness",
        Default = 2,
        Min = 1,
        Max = 10,
        Rounding = 0,
        Callback = function(arg) end,
    })

    Aimbot:AddSlider("Prediction", {
        Text = "Prediction",
        Default = 1,
        Min = 1,
        Max = 10,
        Rounding = 0,
        Callback = function(arg) end,
    })

    Aimbot:AddDropdown("AimPart", {
        Values = {"Head", "UpperHead"},
        Default = 1,
        Text = "Aim Part",
        Callback = function(arg) end,
    })

    RunService3.RenderStepped:Connect(function()
        if not flag then
            return
        end
        local flag11 = true

        if flag2 then
            flag11 = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        end

        if flag11 then
            local v9 = fn6()

            if v9 and v9.Character and v9.Character:FindFirstChild("Head") then
                Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, v9.Character.Head.Position)
            end
        end
    end)

    local Wallbang = tbl.Combat:AddRightGroupbox("Wallbang")

    Wallbang:AddToggle("WallBang", {
        Text = "WallBang",
        Default = false,
        Callback = function() end,
    })

    Wallbang:AddDropdown("Method", {
        Text = "Method",
        Default = "Hitbox",
        Values = {"Hitbox", "Raycast Bypass"},
        Callback = function(arg)
            if arg == "Raycast Bypass" then
                createScreenGui({
                    Title = "KamiHub",
                    Text = "Only VIP users can access to that feature",
                    Duration = 2,
                })
            end
        end,
    })

    local v9 = tbl.Combat:AddLeftGroupbox("Trigger Bot")
    local connection2 = nil
    local n3 = 0

    v9:AddToggle("Triggerbot", {
        Text = "Triggerbot",
        Default = false,
        Callback = function(arg)
            if arg then
                connection2 = RunService3.RenderStepped:Connect(function()
                    local now = tick()
                    if now - n3 < 0.02 then
                        return
                    end
                    local target = mouse.Target

                    if target and target.Parent then
                        local head = target.Parent:FindFirstChild("Head")
                        local humanoid = target.Parent:FindFirstChild("Humanoid")

                        if head and humanoid then
                            local playerFromCharacter = Players2:GetPlayerFromCharacter(target.Parent)

                            if playerFromCharacter and playerFromCharacter ~= localPlayer and playerFromCharacter.Team ~= localPlayer.Team and (not _G.AimbotTarget or _G.AimbotTarget ~= playerFromCharacter) then
                                mouse1press()
                                task.wait(0.01)
                                mouse1release()
                                n3 = now
                            end
                        end
                    end
                end)
            elseif connection2 then
                connection2:Disconnect()
                connection2 = nil
            end
        end,
    })

    local tbl11 = {}
    tbl11.Recoil = {}
    tbl11.FireRate = {}
    tbl11.ReloadTime = {}
    tbl11.EReloadTime = {}
    tbl11.Spread = {}
    tbl11.Auto = {}
    tbl11.Recoil = {}
    tbl11.FireRate = {}
    tbl11.ReloadTime = {}
    tbl11.EReloadTime = {}
    tbl11.Spread = {}
    tbl11.Auto = {}
    tbl11.Bullets = {}
    tbl11.Sway = {}
    local v10 = tbl.Combat:AddRightGroupbox("Gun Mods")

    v10:AddToggle("AntiRecoil", {
        Text = "Anti Recoil",
        Default = false,
        Tooltip = "Removes recoil by setting recoil values to 0.",
        Callback = function(arg)
            for k, descendant in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
                if descendant:IsA("NumberValue") and (descendant.Name == "Recoil" or descendant.Name == "RecoilControl") then
                    if arg then
                        local recoil = tbl11.Recoil
                        local v11 = tbl11.Recoil[descendant]
                        local value = v11 or descendant.Value
                        recoil[descendant] = value
                        descendant.Value = 0
                    else
                        local v11 = tbl11.Recoil[descendant]
                        local value = v11 or 1
                        descendant.Value = value
                    end
                end
            end
        end,
    })

    v10:AddToggle("BulletMultiplier", {
        Text = "Always Onetap",
        Default = false,
        Tooltip = "DETECTED Fires multiple bullets per shot (Insta-kill potential).",
        Callback = function(arg)
            for k, descendant in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
                if (descendant:IsA("NumberValue") or descendant:IsA("IntValue")) and (descendant.Name == "Bullets" or descendant.Name == "BulletCount") then
                    if arg then
                        local bullets = tbl11.Bullets
                        local bullets2 = bullets or {}
                        tbl11.Bullets = bullets2
                        tbl11.Bullets[descendant] = descendant.Value
                        descendant.Value = 20
                    else
                        local v11 = tbl11.Bullets[descendant]
                        local value = v11 or 1
                        descendant.Value = value
                    end
                end
            end
        end,
    })

    local RunService4 = game:GetService("RunService")
    local flag11 = false

    local ok, result = pcall(function()
        return require(game:GetService("ReplicatedStorage").Modules.ClientFunctions)
    end)

    if ok and result and type(result.createtrail) == "function" then
        local createtrail = result.createtrail

        result.createtrail = function(...)
            if not flag11 then
                return createtrail(...)
            end
        end
    end

    local function fn25(arg)
        local v11 = string.lower(tostring(arg))
        local pos = v11:find("equip")
        local pos2 = pos or v11:find("draw") or v11:find("raise") or v11:find("reload") or v11:find("pull") or v11:find("inspect")
        return pos2
    end

    local function fn26(arg)
        local v11 = string.lower(tostring(arg))
        if fn25(v11) then
            return false
        end
        local pos = v11:find("fire")
        local pos2 = pos or v11:find("shoot") or v11:find("idle") or v11:find("sway")
        return pos2
    end

    local function fn27()
        local currentCamera2 = workspace.CurrentCamera
        local arms = currentCamera2 and currentCamera2:FindFirstChild("Arms")
        return arms
    end

    local function fn28(arg)
        local v11, v12, v13 = ipairs(arg:GetDescendants())
        local v14 = v13
        local v15 = v11
        local v16 = v12

        while true do
            local v17, v18 = v15(v16, v14)
            if v17 == nil then
                break
            end
            v14 = v17

            if v18:IsA("Humanoid") or v18:IsA("Animator") or v18:IsA("AnimationController") then
                local ok2, result2 = pcall(function()
                    return v18:GetPlayingAnimationTracks()
                end)

                if ok2 and result2 then
                    for i, v19 in ipairs(result2) do
                        if fn26(v19.Name) and v19.Speed ~= 0 then
                            v19:AdjustSpeed(0)
                        end
                    end

                    v14 = v17
                end
            end
        end
    end

    local function fn29(arg)
        for i, descendant in ipairs(arg:GetDescendants()) do
            if not descendant:IsA("ParticleEmitter") and not descendant:IsA("Beam") and not descendant:IsA("Smoke") and not descendant:IsA("Fire") and not descendant:IsA("Sparkles") and not descendant:IsA("Trail") then
                if descendant:IsA("PointLight") or descendant:IsA("SpotLight") or descendant:IsA("SurfaceLight") then
                    local v11 = string.lower(descendant.Name)

                    if (v11:find("flash") or v11:find("muzzle") or v11:find("fire")) and descendant.Enabled then
                        descendant.Enabled = false
                    end
                end
            else
                if descendant.Enabled then
                    descendant.Enabled = false
                end

                if descendant:IsA("ParticleEmitter") and descendant.Rate ~= 0 then
                    descendant.Rate = 0
                end
            end
        end
    end

    local v11 = nil

    v11 = hookmetamethod(game, "__namecall", newcclosure(function(arg, ...)
        if not flag11 or checkcaller() or getnamecallmethod() ~= "SetPrimaryPartCFrame" or typeof(arg) ~= "Instance" or arg.Name ~= "Arms" then
            return v11(arg, ...)
        end
        local tbl12 = {...}
        tbl12[1] = workspace.CurrentCamera.CFrame
        return v11(arg, unpack(tbl12))
    end))

    RunService4.RenderStepped:Connect(function()
        if not flag11 then
            return
        end
        local v12 = fn27()
        if not v12 then
            return
        end
        fn28(v12)
        fn29(v12)
    end)

    v10:AddToggle("DisableViewmodelAnims", {
        Text = "Disable Viewmodel Animations",
        Default = false,
        Tooltip = "Freezes sway/fire, kills bob, muzzle flash and bullet tracers",
        Callback = function(arg)
            flag11 = arg
        end,
    })

    local UserInputService2 = game:GetService("UserInputService")
    local Players3 = game:GetService("Players")
    local RunService5 = game:GetService("RunService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local Workspace2 = game:GetService("Workspace")
    local localPlayer3 = Players3.LocalPlayer
    local currentCamera2 = Workspace2.CurrentCamera
    local tbl12 = {Enabled = false, Active = false, MaxDistance = 1000}

    local function fn30()
        local nrpbs = localPlayer3:FindFirstChild("NRPBS")
        local equippedTool = nrpbs and nrpbs:FindFirstChild("EquippedTool")
        if not equippedTool then
            return false
        end
        local flag12 = equippedTool.Value == "Knife" or equippedTool.Value == "Golden Knife"
        return flag12
    end

    local function fn31()
        local v12 = Options
        local str2 = v12 and Options.KnifePeekKey and Options.KnifePeekKey.Value or "E"
        return Enum.KeyCode[str2]
    end

    local function fn32()
        local character = localPlayer3.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then
            return nil
        end
        local humanoidRootPart = character.HumanoidRootPart
        local character2 = nil
        local maxDistance = tbl12.MaxDistance

        for k, player in pairs(Players3:GetPlayers()) do
            if player ~= localPlayer3 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Team ~= localPlayer3.Team then
                local magnitude = (humanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude

                if magnitude < maxDistance then
                    maxDistance = magnitude
                    character2 = player.Character
                end
            end
        end

        return character2
    end

    local function fn33()
        if tbl12.Active then
            return
        end

        if not fn30() then
            return
        end
        local v12 = fn32()
        local character = localPlayer3.Character
        local humanoidRootPart = character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")
        if not v12 or not humanoidRootPart then
            return
        end
        tbl12.Active = true
        local cFrame = humanoidRootPart.CFrame
        local now = os.clock()
        local humanoidRootPart2 = v12.HumanoidRootPart
        local cameraType = currentCamera2.CameraType
        currentCamera2.CameraType = Enum.CameraType.Scriptable
        local connection3 = nil

        connection3 = RunService5.Heartbeat:Connect(function()
            if humanoidRootPart2 and os.clock() - now <= 0.6 then
                local n4 = humanoidRootPart2.CFrame * CFrame.new(0, 0.5, 3)
                local n5 = CFrame.new(n4.Position) * humanoidRootPart2.CFrame.Rotation
                humanoidRootPart.CFrame = humanoidRootPart.CFrame:Lerp(n5, 0.4)
                local vector = Vector3.new(0, 2, 8)
                local v13 = humanoidRootPart.CFrame:PointToWorldSpace(vector)
                currentCamera2.CFrame = CFrame.lookAt(v13, humanoidRootPart2.Position)
                return
            end

            connection3:Disconnect()
            currentCamera2.CameraType = cameraType
            humanoidRootPart.CFrame = cFrame
            tbl12.Active = false
        end)

        task.wait(0.2)

        for i = 1, 2 do
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait(0.05)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            task.wait(0.2)
        end
    end

    UserInputService2.InputBegan:Connect(function(input, gameProcessed)
        if not tbl12.Enabled then
            return
        end

        if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
            return
        end

        if not fn30() then
            return
        end
        local v12 = fn31()
        if not v12 then
            return
        end
        VirtualInputManager:SendKeyEvent(true, v12, false, game)
        task.wait(0.5)
        VirtualInputManager:SendKeyEvent(false, v12, false, game)
    end)

    UserInputService2.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end

        if not tbl12.Enabled or tbl12.Active then
            return
        end

        if input.UserInputType ~= Enum.UserInputType.Keyboard then
            return
        end

        if input.KeyCode ~= fn31() then
            return
        end
        fn33()
    end)

    v10:AddToggle("KnifePeek", {
        Text = "Knife Peek",
        Default = false,
        Tooltip = "Teleports and kills the closest enemy if you have a knife equipped when you press the bound key",
        Callback = function(enabled)
            tbl12.Enabled = enabled
        end,
    }):AddKeyPicker("KnifePeekKey", {
        Default = "E",
        SyncToggleState = false,
        Mode = "Toggle",
        Text = "Knife Peek Key",
        NoUI = false,
    })

    local tbl13 = {}

    v10:AddToggle("InstantEquip", {
        Text = "Instant Equip",
        Default = false,
        Tooltip = "DETECTED Equips instantly.",
        Callback = function(arg)
            for k, child in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
                local equipTime = child:FindFirstChild("EquipTime")

                if equipTime and equipTime:IsA("NumberValue") then
                    if tbl13[child] == nil then
                        tbl13[child] = equipTime.Value
                    end

                    if arg then
                        equipTime.Value = 0
                    else
                        equipTime.Value = tbl13[child]
                    end
                end
            end
        end,
    })

    v10:AddToggle("RapidFire", {
        Text = "Rapid Fire",
        Default = false,
        Tooltip = "Fires bullets rapidly.",
        Callback = function(arg)
            for k, descendant in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
                if descendant:IsA("NumberValue") and (descendant.Name == "FireRate" or descendant.Name == "BFireRate") then
                    if arg then
                        local fireRate = tbl11.FireRate
                        local v12 = tbl11.FireRate[descendant]
                        local value = v12 or descendant.Value
                        fireRate[descendant] = value
                        descendant.Value = 0.011
                    else
                        local v12 = tbl11.FireRate[descendant]
                        local value = v12 or 0.8
                        descendant.Value = value
                    end
                end
            end
        end,
    })

    v10:AddToggle("InstantReload", {
        Text = "Instant Reload",
        Default = false,
        Tooltip = "Reloads instantly.",
        Callback = function(arg)
            for k, child in pairs(game.ReplicatedStorage.Weapons:GetChildren()) do
                local reloadTime = child:FindFirstChild("ReloadTime")
                local eReloadTime = child:FindFirstChild("EReloadTime")

                if reloadTime and reloadTime:IsA("NumberValue") then
                    local reloadTime2 = tbl11.ReloadTime
                    local v12 = tbl11.ReloadTime[reloadTime]
                    local value = v12 or reloadTime.Value
                    reloadTime2[reloadTime] = value
                    local value2 = arg and 0.01

                    if not value2 then
                        local v13 = tbl11.ReloadTime[reloadTime]
                        value2 = v13 or 0.8
                    end

                    reloadTime.Value = value2
                end

                if eReloadTime and eReloadTime:IsA("NumberValue") then
                    local eReloadTime2 = tbl11.EReloadTime
                    local v12 = tbl11.EReloadTime[eReloadTime]
                    local value = v12 or eReloadTime.Value
                    eReloadTime2[eReloadTime] = value
                    local value2 = arg and 0.01

                    if not value2 then
                        local v13 = tbl11.EReloadTime[eReloadTime]
                        value2 = v13 or 0.8
                    end

                    eReloadTime.Value = value2
                end
            end
        end,
    })

    v10:AddToggle("AntiSpread", {
        Text = "Anti Spread",
        Default = false,
        Tooltip = "Removes bullet spread.",
        Callback = function(arg)
            for k, descendant in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
                if descendant:IsA("NumberValue") and (descendant.Name == "Spread" or descendant.Name == "MaxSpread" or descendant.Name == "SpreadControl") then
                    local spread = tbl11.Spread
                    local v12 = tbl11.Spread[descendant]
                    local value = v12 or descendant.Value
                    spread[descendant] = value
                    local value2 = arg and 0

                    if not value2 then
                        local v13 = tbl11.Spread[descendant]
                        value2 = v13 or 1
                    end

                    descendant.Value = value2
                end
            end
        end,
    })

    v10:AddToggle("AlwaysAuto", {
        Text = "Always Auto",
        Default = false,
        Tooltip = "Makes all guns fully automatic.",
        Callback = function(value)
            for k, descendant in pairs(game.ReplicatedStorage.Weapons:GetDescendants()) do
                if descendant:IsA("BoolValue") and descendant.Name:lower():find("auto") then
                    local auto = tbl11.Auto
                    local v12 = tbl11.Auto[descendant]
                    local value2 = v12 or descendant.Value
                    auto[descendant] = value2
                    descendant.Value = value
                end
            end
        end,
    })

    local flag12 = false

    v10:AddToggle("Infinite Ammo", {
        Text = "Inf Ammo",
        Default = false,
        Callback = function(arg)
            flag12 = arg
            local wkspc = game.ReplicatedStorage:FindFirstChild("wkspc")

            if wkspc and wkspc:FindFirstChild("CurrentCurse") then
                if arg then
                    wkspc.CurrentCurse.Value = "Infinite Ammo"
                else
                    wkspc.CurrentCurse.Value = ""
                end
            end

            if arg then
                task.spawn(function()
                    local weapons, v12, v13, v14, v15, v16, v17, n4
                    n4 = 1

                    while true do
                        if n4 == 1 then
                            if flag12 then
                                n4 = 2
                            else
                                n4 = 7
                            end
                        elseif n4 == 2 then
                            task.wait(0.01)
                            weapons = game.ReplicatedStorage:FindFirstChild("Weapons")

                            if weapons then
                                n4 = 3
                            else
                                n4 = 1
                            end
                        elseif n4 == 3 then
                            v12, v13, v14 = pairs(weapons:GetChildren())
                            v15 = v14
                            n4 = 4
                        elseif n4 == 4 then
                            v16, v17 = v12(v13, v15)

                            if v16 == nil then
                                n4 = 1
                            else
                                n4 = 5
                            end
                        elseif n4 == 5 then
                            v15 = v16

                            if v17:FindFirstChild("Ammo") and v17.Ammo:IsA("IntValue") then
                                n4 = 6
                            else
                                n4 = 4
                            end
                        elseif n4 == 6 then
                            v17.Ammo.Value = 360
                            n4 = 4
                        elseif n4 == 7 then
                            return
                        end
                    end
                end)
            end
        end,
    })

    local tbl14 = {Enabled = false, Connection = nil}
    local RunService6 = game:GetService("RunService")
    local Players4 = game:GetService("Players")

    local function fn34()
        return Color3.fromRGB(255, 0, 255)
    end

    local function fn35(color3)
        local arms = workspace.Camera:FindFirstChild("Arms")

        if arms then
            for k, descendant in pairs(arms:GetDescendants()) do
                if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                    descendant.Color = color3
                end
            end
        end
    end

    local function fn36()
        local tbl15 = {}
        local arms = workspace.Camera:FindFirstChild("Arms")

        if arms then
            for k, descendant in pairs(arms:GetDescendants()) do
                if (descendant:IsA("BasePart") or descendant:IsA("MeshPart")) and descendant.Color then
                    tbl15[descendant.Name] = descendant.Color
                end
            end
        end

        return tbl15
    end

    local function fn37(arg)
        local arms = workspace.Camera:FindFirstChild("Arms")
        if not arms then
            return
        end

        for k, v12 in pairs(arg) do
            local v13 = arms:FindFirstChild(k, true)

            if v13 and (v13:IsA("BasePart") or v13:IsA("MeshPart")) then
                v13.Color = v12
            end
        end
    end

    v10:AddToggle("PurplishGun", {
        Text = "Purplish Gun",
        Default = false,
        Callback = function(enabled)
            tbl14.Enabled = enabled

            if enabled then
                tbl14.OriginalColors = fn36()

                if tbl14.Connection then
                    tbl14.Connection:Disconnect()
                    tbl14.Connection = nil
                end

                local n4 = 0
                local localPlayer4 = Players4.LocalPlayer
                if not localPlayer4 then
                    return
                end

                tbl14.Connection = RunService6.RenderStepped:Connect(function(deltaTime)
                    n4 = n4 + deltaTime

                    if n4 >= 0.1 then
                        n4 = 0
                        fn35(fn34())
                    end

                    local character = localPlayer4.Character
                    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

                    if humanoid and humanoid.Health <= 0 then
                        n4 = 0
                        fn35(fn34())
                        tbl14.Connection:Disconnect()
                        tbl14.Connection = nil
                    end
                end)

                fn35(fn34())
            else
                if tbl14.Connection then
                    tbl14.Connection:Disconnect()
                    tbl14.Connection = nil
                end

                if tbl14.OriginalColors then
                    fn37(tbl14.OriginalColors)
                    tbl14.OriginalColors = nil
                else
                    fn35(Color3.fromRGB(255, 255, 255))
                end
            end
        end,
    })

    local tbl15 = {Enabled = false, Connection = nil}

    v10:AddToggle("TransparentGun", {
        Text = "Transparent Gun",
        Default = false,
        Callback = function(enabled)
            tbl15.Enabled = enabled

            if enabled then
                tbl15.Connection = game:GetService("RunService").RenderStepped:Connect(function()
                    local arms = game.Workspace.Camera:FindFirstChild("Arms")

                    if arms then
                        for k, descendant in pairs(arms:GetDescendants()) do
                            if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                                descendant.Transparency = 0.8
                                local surfaceAppearance = descendant:FindFirstChildOfClass("SurfaceAppearance")

                                if surfaceAppearance then
                                    surfaceAppearance:Destroy()
                                end
                            end
                        end
                    end
                end)
            else
                if tbl15.Connection then
                    tbl15.Connection:Disconnect()
                    tbl15.Connection = nil
                end

                local arms = game.Workspace.Camera:FindFirstChild("Arms")

                if arms then
                    for k, descendant in pairs(arms:GetDescendants()) do
                        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                            descendant.Transparency = 0
                        end
                    end
                end
            end
        end,
    })

    local flag13 = false

    v10:AddToggle("NoSpray", {
        Text = "No Spray",
        Default = false,
        Tooltip = "Removes bullet spread by hooking the shooting remote.",
        Callback = function(arg)
            flag13 = arg

            if arg then
                local shootEvent = game:GetService("ReplicatedStorage"):WaitForChild("ShootEvent")
                local fireServer = shootEvent.FireServer

                shootEvent.FireServer = newcclosure(function(arg2, arg3, ...)
                    if not flag13 then
                        return fireServer(arg2, arg3, ...)
                    end
                    local position = workspace.CurrentCamera.CFrame.Position
                    return fireServer(arg2, position + (arg3 - position).Unit * 500, ...)
                end)
            end
        end,
    })

    local v12 = tbl.Combat:AddRightGroupbox("Kill All")
    local Players5 = game:GetService("Players")
    RunService = game:GetService("RunService")
    local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
    local Workspace3 = game:GetService("Workspace")
    local localPlayer4 = Players5.LocalPlayer
    local currentCamera3 = Workspace3.CurrentCamera
    local flag14 = false
    local thread = nil
    local flag15 = false
    local n4 = 0

    local function fn38()
        local now = tick()
        if now - n4 < 1 then
            return flag15
        end
        n4 = now
        local players = Players5:GetPlayers()
        if #players <= 1 then
            flag15 = false
            return false
        end
        local team = nil
        local flag16 = false

        for i, player in ipairs(players) do
            if not player.Team then
                continue
            end

            if not flag16 then
                team = player.Team
                flag16 = true
                continue
            end

            if player.Team ~= team then
                flag15 = false
                print("team mode detected")
                return flag15
            end
        end

        if flag16 then
            flag15 = true
            print("ffa mode detected everyone on same team")
        else
            flag15 = false
        end

        return flag15
    end

    local function fn39(arg)
        if arg == localPlayer4 then
            return false
        end

        if fn38() then
            if arg.Team and arg.Team.Name == "TGC" then
                return false
            end
        else
            if arg.Team == localPlayer4.Team then
                return false
            end

            if not arg.Team then
                return false
            end

            if arg.Team.Name == "TGC" then
                return false
            end
        end

        local character = arg.Character
        if not character then
            return false
        end

        if not character:FindFirstChild("HumanoidRootPart") or not character:FindFirstChild("Head") then
            return false
        end
        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid or humanoid.Health <= 0 then
            return false
        end

        if character.HumanoidRootPart.Position.Y < -100 then
            return false
        end
        local vector = Vector3.new(0.9, -400, 2.5)
        if (character.HumanoidRootPart.Position - vector).Magnitude < 50 then
            return false
        end
        local character2 = localPlayer4.Character
        if not character2 or not character2:FindFirstChild("HumanoidRootPart") then
            return false
        end

        if (character.HumanoidRootPart.Position - character2.HumanoidRootPart.Position).Magnitude > 300 then
            return false
        end
        return true
    end

    v12:AddToggle("KillAll", {
        Text = "Enable",
        Default = false,
        Callback = function(arg)
            flag14 = arg

            if arg then
                thread = task.spawn(function()
                    while flag14 do
                        for i, player in ipairs(Players5:GetPlayers()) do
                            if not flag14 then
                                break
                            end

                            if fn39(player) then
                                local character = player.Character
                                local character2 = localPlayer4.Character

                                while flag14 and fn39(player) do
                                    local humanoidRootPart = character.HumanoidRootPart
                                    local head = character.Head
                                    local cframe = CFrame.new(humanoidRootPart.Position - humanoidRootPart.CFrame.LookVector * 3, head.Position)
                                    character2.HumanoidRootPart.CFrame = cframe
                                    currentCamera3.CFrame = CFrame.new(currentCamera3.CFrame.Position, head.Position)
                                    task.wait()
                                end

                                if fn39(player) then
                                    local tool = character2:FindFirstChildOfClass("Tool")
                                    local fireEvent = ReplicatedStorage2:FindFirstChild("FireEvent")

                                    if tool and fireEvent then
                                        fireEvent:FireServer()
                                    elseif tool then
                                        tool:Activate()
                                    end
                                end
                            end
                        end

                        task.wait()
                    end
                end)
            elseif thread then
                task.cancel(thread)
                thread = nil
            end
        end,
    })

    v12:AddDropdown("Method", {
        Text = "Method",
        Default = "Teleport",
        Values = {"Teleport", "Raycast Bypass(soon)"},
        Callback = function(arg) end,
    })

    local Fov = tbl.Combat:AddLeftGroupbox("Fov")

    Fov:AddToggle("ShowFov", {
        Text = "Show Fov",
        Default = false,
        Callback = function(arg)
            flag7 = arg
            local circle = Drawing.new("Circle")
            circle.Thickness = 2
            circle.NumSides = 64
            circle.Filled = false
            circle.Visible = true
            local viewportSize = Workspace3.CurrentCamera.ViewportSize
            local vector2 = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
            local connection3 = nil

            connection3 = RunService.RenderStepped:Connect(function()
                if not flag7 then
                    connection3:Disconnect()
                    circle:Remove()
                    return
                end

                circle.Position = vector2
                circle.Color = Color3.fromHex("A020F0")
                circle.Radius = radius
            end)
        end,
    })

    Fov:AddSlider("FovSize", {
        Text = "Fov Size",
        Default = 50,
        Min = 10,
        Max = 500,
        Rounding = 0,
        Callback = function(arg)
            radius = arg
        end,
    })

    local v13 = tbl.Blatant:AddRightGroupbox("Anti Aim")
    local n5 = 35
    local bodyGyro = nil

    v13:AddToggle("AntiAim", {
        Text = "Anti Aim",
        Default = false,
        Callback = function(arg)
            local character = game.Players.LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

            if arg then
                if humanoidRootPart then
                    local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
                    bodyAngularVelocity.Name = "AntiAimSpin"
                    bodyAngularVelocity.AngularVelocity = Vector3.new(0, n5, 0)
                    bodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
                    bodyAngularVelocity.P = 500000
                    bodyAngularVelocity.Parent = humanoidRootPart
                    bodyGyro = Instance.new("BodyGyro")
                    bodyGyro.Name = "AntiAimGyro"
                    local vector = Vector3.new(math.huge, math.huge, math.huge)
                    bodyGyro.MaxTorque = vector
                    bodyGyro.CFrame = humanoidRootPart.CFrame
                    bodyGyro.P = 3000
                    bodyGyro.Parent = humanoidRootPart
                end
            elseif humanoidRootPart then
                local antiAimSpin = humanoidRootPart:FindFirstChild("AntiAimSpin")

                if antiAimSpin then
                    antiAimSpin:Destroy()
                end

                if bodyGyro then
                    bodyGyro:Destroy()
                    bodyGyro = nil
                end
            end
        end,
    })

    v13:AddSlider("AntiAimSpeed", {
        Text = "Anti Aim Speed",
        Default = 35,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Callback = function(arg)
            n5 = arg
            local character = game.Players.LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

            if humanoidRootPart then
                local antiAimSpin = humanoidRootPart:FindFirstChild("AntiAimSpin")

                if antiAimSpin then
                    antiAimSpin.AngularVelocity = Vector3.new(0, n5, 0)
                end
            end
        end,
    })

    local jumpPower = 50
    local flag16 = false
    local connection3 = nil
    local v14 = tbl.Blatant:AddLeftGroupbox("Jump Power")

    v14:AddToggle("JumpPower", {
        Text = "JumpPower",
        Default = false,
        Callback = function(arg)
            flag16 = arg

            if connection3 then
                connection3:Disconnect()
                connection3 = nil
            end

            if arg then
                connection3 = runService.RenderStepped:Connect(function()
                    local character = localPlayer3.Character
                    if not character then
                        return
                    end
                    local humanoid = character:FindFirstChildOfClass("Humanoid")

                    if humanoid then
                        humanoid.UseJumpPower = true
                        humanoid.JumpPower = jumpPower
                    end
                end)
            else
                local character = localPlayer3.Character

                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")

                    if humanoid then
                        humanoid.JumpPower = 21
                        humanoid.UseJumpPower = true
                    end
                end
            end
        end,
    })

    v14:AddSlider("JumpPowerValue", {
        Text = "JumpPower Value",
        Default = 50,
        Min = 1,
        Max = 200,
        Rounding = 0,
        Callback = function(arg)
            jumpPower = arg
        end,
    })

    local RunService7 = game:GetService("RunService")
    local localPlayer5 = game.Players.LocalPlayer

    spawn(function()
        while true do
            RunService7.RenderStepped:Wait()

            if jumpHeld then
                local character = localPlayer5.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if not humanoid or humanoid.FloorMaterial == Enum.Material.Air then
                    continue
                end
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                task.wait(1.2)
            end
        end
    end)
end

local flag4 = false
game:GetService("RunService")
lithiumExclusive = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService2 = game:GetService("RunService")
local localPlayer = game.Players.LocalPlayer
local flag5 = false
local n = 0.2
local flag6 = false

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Space then
        flag6 = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        flag6 = false
    end
end)

RunService.Heartbeat:Connect(function()
    if not flag5 then
        return
    end
    local character = localPlayer.Character
    if not character then
        return
    end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not humanoidRootPart then
        return
    end

    if flag6 and humanoid.FloorMaterial ~= Enum.Material.Air then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 20, humanoidRootPart.Velocity.Z)
    end

    if humanoid.FloorMaterial == Enum.Material.Air and humanoid.MoveDirection.Magnitude > 0 then
        local unit = humanoid.MoveDirection.Unit
        humanoidRootPart.Velocity = Vector3.new(unit.X * 50 * n, humanoidRootPart.Velocity.Y, unit.Z * 50 * n)
    end
end)

local v3 = tbl.Blatant:AddLeftGroupbox("Bunny Hop")

v3:AddToggle("BunnyHop", {
    Text = "Bunny Hop",
    Default = false,
    Tooltip = "Speed-boosted bunny hopping",
}):OnChanged(function(arg)
    flag5 = arg
end)

v3:AddSlider("BunnyHopSpeed", {
    Text = "BunnyHop Speed",
    Min = 0,
    Max = 3,
    Default = n,
    Rounding = 1,
    Compact = false,
}):OnChanged(function(arg)
    n = arg
end)

tbl.Blatant:AddLeftGroupbox("Auto Jump"):AddToggle("AutoJump", {
    Text = "AutoJump",
    Default = false,
    Callback = function(arg)
        flag4 = arg

        spawn(function()
            while flag4 do
                local character = localPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")

                if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end

                RunService2.RenderStepped:Wait()
            end
        end)
    end,
})

tbl.Blatant:AddRightGroupbox("No Clip"):AddToggle("NoClip", {
    Text = "No Clip",
    Default = false,
    Callback = function(arg)
        local character = game.Players.LocalPlayer.Character

        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid

            if arg then
                humanoid.PlatformStand = true

                for k, child in pairs(character:GetChildren()) do
                    if child:IsA("BasePart") then
                        child.CanCollide = false
                    end
                end
            else
                humanoid.PlatformStand = false

                for k, child in pairs(character:GetChildren()) do
                    if child:IsA("BasePart") then
                        child.CanCollide = true
                    end
                end
            end
        end
    end,
})

local Fly = tbl.Blatant:AddRightGroupbox("Fly")
local tbl2 = {fly = false, flyspeed = 50}
local character = nil
local humanoid = nil
local bodyVelocity = nil
local bodyAngularVelocity = nil
local camera = nil
local flag7 = nil
local localPlayer2 = game.Players.LocalPlayer
local tbl3 = {W = false, S = false, A = false, D = false, Moving = false}

local function fn()
    if not localPlayer2.Character or not localPlayer2.Character.Head or flag7 then
        return
    end
    character = localPlayer2.Character
    humanoid = character.Humanoid
    humanoid.PlatformStand = true
    camera = workspace:WaitForChild("Camera")
    bodyVelocity = Instance.new("BodyVelocity")
    bodyAngularVelocity = Instance.new("BodyAngularVelocity")
    local vector = Vector3.new(0, 0, 0)
    local vector2 = Vector3.new(10000, 10000, 10000)
    bodyVelocity.Velocity = vector
    bodyVelocity.MaxForce = vector2
    bodyVelocity.P = 1000
    local vector3 = Vector3.new(0, 0, 0)
    local vector4 = Vector3.new(10000, 10000, 10000)
    bodyAngularVelocity.AngularVelocity = vector3
    bodyAngularVelocity.MaxTorque = vector4
    bodyAngularVelocity.P = 1000
    bodyVelocity.Parent = character.Head
    bodyAngularVelocity.Parent = character.Head
    flag7 = true

    humanoid.Died:connect(function()
        flag7 = false
    end)
end

local function fn2()
    if not localPlayer2.Character or not flag7 then
        return
    end
    humanoid.PlatformStand = false
    bodyVelocity:Destroy()
    bodyAngularVelocity:Destroy()
    flag7 = false
end

game:GetService("UserInputService").InputBegan:connect(function(arg, arg2)
    if arg2 then
        return
    end

    for k in pairs(tbl3) do
        if k ~= "Moving" and arg.KeyCode == Enum.KeyCode[k] then
            tbl3[k] = true
            tbl3.Moving = true
        end
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end
    local moving = false

    for k in pairs(tbl3) do
        if k ~= "Moving" then
            if input.KeyCode == Enum.KeyCode[k] then
                tbl3[k] = false
            end

            if tbl3[k] then
                moving = true
            end
        end
    end

    tbl3.Moving = moving
end)

local function fn3()
    local n2 = bit32.bor(124) ~= 90 and string.len("\239") or 239
    local n3 = 25206 + n2 + -25204
    return error("deobf: instruction 20 could not be followed: the program wrote one of its own instructions with a value that is not known", 0)
end

game:GetService("RunService").Heartbeat:connect(function(arg)
    if flag7 and character and character.PrimaryPart then
        local position = character.PrimaryPart.Position
        local cFrame = camera.CFrame
        local v4, v5, v6 = cFrame:toEulerAnglesXYZ()
        character:SetPrimaryPartCFrame(CFrame.new(position.x, position.y, position.z) * CFrame.Angles(v4, v5, v6))

        if tbl3.Moving then
            local vector = Vector3.new()
            local n2 = vector

            if tbl3.W then
                n2 = vector + fn3(cFrame.lookVector)
            end

            if tbl3.S then
                n2 = n2 - fn3(cFrame.lookVector)
            end

            if tbl3.A then
                n2 = n2 - fn3(cFrame.rightVector)
            end

            if tbl3.D then
                n2 = n2 + fn3(cFrame.rightVector)
            end

            character:TranslateBy(n2 * arg)
        end
    end
end)

Fly:AddToggle("Fly", {
    Text = "Fly",
    Default = false,
    Callback = function(arg)
        if arg then
            fn()
        else
            fn2()
        end
    end,
})

Fly:AddSlider("FlySpeed", {
    Text = "Fly Speed",
    Default = 30,
    Min = 0,
    Max = 500,
    Rounding = 0,
    Callback = function(flyspeed)
        tbl2.flyspeed = flyspeed
    end,
})

tbl.Blatant:AddRightGroupbox("Infinite Jump"):AddToggle("InfiniteJump", {
    Text = "Infinite Jump",
    Default = false,
    Callback = function(infiniteJump)
        _G.InfiniteJump = infiniteJump

        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJump then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end,
})

local v4 = tbl.Blatant:AddRightGroupbox("Speed Hack")
game:GetService("TweenService")
game:GetService("RunService")

lithiumExclusive = {
    FontColor = Color3.fromHex("ffffff"),
    MainColor = Color3.fromHex("000000"),
    BackgroundColor = Color3.fromHex("000000"),
    AccentColor = Color3.fromHex("A020F0"),
    OutlineColor = Color3.fromHex("282828"),
}

local RunService3 = game:GetService("RunService")

v4:AddToggle("SpeedHack", {
    Text = "SpeedHack",
    Default = false,
    Callback = function(arg)
        speedActive = arg

        if speedActive then
            spawn(function()
                while speedActive do
                    local localPlayer3 = game.Players.LocalPlayer

                    if localPlayer3 and localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart") then
                        local humanoidRootPart = localPlayer3.Character.HumanoidRootPart
                        local moveDirection = localPlayer3.Character:FindFirstChildOfClass("Humanoid").MoveDirection

                        if moveDirection.Magnitude > 0 then
                            humanoidRootPart.Velocity = Vector3.new(moveDirection.X * speedValue * 10, humanoidRootPart.Velocity.Y, moveDirection.Z * speedValue * 10)
                        else
                            humanoidRootPart.Velocity = Vector3.new(0, humanoidRootPart.Velocity.Y, 0)
                        end
                    end

                    RunService3.RenderStepped:Wait()
                end
            end)
        end
    end,
})

v4:AddSlider("SpeedHackVolume", {
    Text = "SpeedHack Volume",
    Default = 3,
    Min = 1,
    Max = 50,
    Rounding = 0,
    Callback = function(arg)
        speedValue = arg
    end,
})

local v5 = backDistance
local n2 = v5 or 5
backDistance = n2
local v6 = jitterAmount
local n3 = v6 or 0.5
jitterAmount = n3
local v7 = heightOffset
local n4 = v7 or 2
heightOffset = n4
local v8 = headLock
local flag8 = v8 or true
headLock = flag8
local str = ""
local v9 = snipePlayerActive
local flag9 = v9 or false
snipePlayerActive = flag9
local vector = Vector3.new(0.9, -400, 2.5)
local flag10 = false
local v10 = nil
local v11 = nil
local n5 = 5
local n6 = 3

local function fn4(arg, arg2, arg3)
    if not arg2 or arg3 <= 0 then
        return false
    end
    local n7 = math.abs(arg - arg2)
    local n8 = n7

    if math.pi < n7 then
        n8 = 2 * math.pi - n7
    end

    local flag11 = n5 < n8 / arg3
    return flag11
end

local function fn5(arg, arg2, arg3, arg4)
    if not v10 or arg4 <= 0 then
        return false
    end
    local n7 = arg - v10
    if n6 >= n7.Magnitude / arg4 then
        return false
    end
    local flag11 = (arg3.Position - arg).Unit:Dot(n7.Unit) > 0.7
    return flag11
end

local function fn6()
    local UserInputService2 = game:GetService("UserInputService")
    local v12 = UserInputService2:IsKeyDown(Enum.KeyCode.S)
    local v13 = v12 or UserInputService2:IsKeyDown(Enum.KeyCode.Down)
    return v13
end

local now = tick()

game:GetService("RunService").Stepped:Connect(function()
    if not snipePlayerActive or str == "" then
        return
    end
    local now2 = tick()
    local n7 = now2 - now
    now = now2
    local Players = game:GetService("Players")
    local localPlayer3 = Players.LocalPlayer
    local v12 = Players:FindFirstChild(str)

    if not v12 then
        createScreenGui({
            Title = "KamiHub",
            Text = "Target player not found",
            Duration = 3,
        })

        snipePlayerActive = false
        return
    end

    if not v12.Character then
        createScreenGui({
            Title = "KamiHub",
            Text = "Target character not found",
            Duration = 3,
        })

        snipePlayerActive = false
        return
    end

    local humanoidRootPart = v12.Character:FindFirstChild("HumanoidRootPart")

    if not humanoidRootPart then
        createScreenGui({
            Title = "KamiHub",
            Text = "HumanoidRootPart missing on target",
            Duration = 3,
        })

        snipePlayerActive = false
        return
    end

    local head = v12.Character:FindFirstChild("Head")
    local character2 = localPlayer3.Character
    if not character2 or not character2:FindFirstChild("HumanoidRootPart") then
        return
    end
    local humanoidRootPart2 = character2.HumanoidRootPart
    local currentCamera = workspace.CurrentCamera
    local position = humanoidRootPart.Position
    local lookVector = humanoidRootPart.CFrame.LookVector
    local v13 = math.atan2(lookVector.X, lookVector.Z)
    local v14 = fn6()
    local v15 = fn4(v13, v11, n7)
    local v16 = fn5(position, humanoidRootPart, humanoidRootPart2, n7)
    local v17 = v14 or v15 or v16

    if v17 and not flag10 then
        flag10 = true
    elseif not v17 and flag10 then
        flag10 = false
    end

    v10 = position
    v11 = v13

    if flag10 then
        humanoidRootPart2.CFrame = CFrame.new(vector)
        currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, currentCamera.CFrame.Position + currentCamera.CFrame.LookVector)
        print("At safe location: " .. tostring(vector))
    else
        local n8 = -humanoidRootPart.CFrame.LookVector.Unit * backDistance
        local vector2 = Vector3.new(math.random(-100, 100) / 100 * jitterAmount, 0, math.random(-100, 100) / 100 * jitterAmount)
        local n9 = humanoidRootPart.Position + n8 + vector2 + Vector3.new(0, heightOffset, 0)
        local v18 = headLock
        local position2 = v18 and head and head.Position or humanoidRootPart.Position
        local unit = (position2 - n9).Unit
        local v19 = math.atan2(unit.X, unit.Z)
        humanoidRootPart2.CFrame = CFrame.new(n9) * CFrame.Angles(0, v19, 0)
        currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, position2)
    end
end)

local v12 = tbl.Blatant:AddLeftGroupbox("Snipe Player")

v12:AddToggle("SnipePlayer", {
    Text = "Snipe Player",
    Default = false,
    Callback = function(arg)
        snipePlayerActive = arg

        if not arg then
            flag10 = false
            v10 = nil
            v11 = nil
        end

        if snipePlayerActive and str == "" then
            createScreenGui({
                Title = "KamiHub",
                Text = "Please enter a valid target",
                Duration = 3,
            })
        end
    end,
})

game:GetService("Players")

local v13 = v12:AddDropdown("Target Name", {
    Text = "Select target name.",
    Default = 1,
    Values = {},
    Callback = function(arg)
        str = arg
    end,
})

local Players = game:GetService("Players")
local localPlayer3 = Players.LocalPlayer

local function fn7()
    local tbl4 = {}

    for i, player in ipairs(Players:GetPlayers()) do
        if player ~= localPlayer3 then
            table.insert(tbl4, player.Name)
        end
    end

    return tbl4
end

task.spawn(function()
    while true do
        v13:SetValues(fn7())
        task.wait(1)
    end
end)

v12:AddSlider("SpinThreshold", {
    Text = "Spin Detection",
    Default = 5,
    Min = 1,
    Max = 20,
    Rounding = 1,
    Callback = function(arg)
        n5 = arg
    end,
})

v12:AddSlider("MovementThreshold", {
    Text = "Movement Detection",
    Default = 3,
    Min = 1,
    Max = 10,
    Rounding = 1,
    Callback = function(arg)
        n6 = arg
    end,
})

local esp = tbl.Visuals:AddLeftGroupbox("ESP")

local tbl4 = {
    tracers = {enabled = false, thickness = 2, transparency = 0.7},
    box = {enabled = false},
    healthbar = {enabled = false},
    name = {enabled = false, size = 13},
    headPos = false,
    distance = false,
    speed = false,
    skeleton = {enabled = false},
    teamCheck = false,
}

local Players2 = game:GetService("Players")
local RunService4 = game:GetService("RunService")
local currentCamera = workspace.CurrentCamera
local vector2 = Vector2.new
local vector3 = Vector3.new
local format = string.format
local clamp = math.clamp
local color2 = Color3.new(0, 0, 0)
vector3(0, 0, 0)

local tbl5 = {
    {"Head", "HumanoidRootPart"},
    {"HumanoidRootPart", "LeftUpperArm"},
    {"HumanoidRootPart", "RightUpperArm"},
    {"LeftUpperArm", "LeftLowerArm"},
    {"RightUpperArm", "RightLowerArm"},
    {"LeftLowerArm", "LeftHand"},
    {"RightLowerArm", "RightHand"},
    {"HumanoidRootPart", "LeftUpperLeg"},
    {"HumanoidRootPart", "RightUpperLeg"},
    {"LeftUpperLeg", "LeftLowerLeg"},
    {"RightUpperLeg", "RightLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"},
    {"RightLowerLeg", "RightFoot"},
}

local n7 = #tbl5
local tbl6 = {}

local function fn8()
    local function createLine(arg)
        local v14 = nil
        local line = Drawing.new("Line")
        line.Visible = false
        line.Thickness = 2

        if arg then
            local v15 = next

            while true do
                local v16, v17 = v15(arg, v14)
                if v16 == nil then
                    break
                end
                v14 = v16
                line[v16] = v17
            end
        end

        return line
    end

    local function createText(arg)
        local v14 = nil
        local text = Drawing.new("Text")
        text.Visible = false
        text.Center = true
        text.Outline = true
        text.OutlineColor = color2
        text.Font = 2

        if arg then
            local v15 = next

            while true do
                local v16, v17 = v15(arg, v14)
                if v16 == nil then
                    break
                end
                v14 = v16
                text[v16] = v17
            end
        end

        return text
    end

    local function createSquare(arg)
        local v14 = nil
        local square = Drawing.new("Square")
        square.Visible = false
        square.Filled = true

        if arg then
            local v15 = next

            while true do
                local v16, v17 = v15(arg, v14)
                if v16 == nil then
                    break
                end
                v14 = v16
                square[v16] = v17
            end
        end

        return square
    end

    local function createCircle()
        local circle = Drawing.new("Circle")
        circle.Visible = false
        circle.Filled = true
        circle.NumSides = 16
        circle.Thickness = 1
        return circle
    end

    local v14 = table.create(n7)

    for i = 1, n7 do
        v14[i] = createLine()
    end

    return {
        b1 = createLine(),
        b2 = createLine(),
        b3 = createLine(),
        b4 = createLine(),
        hbBg = createSquare({Color = color2}),
        hbFill = createSquare(),
        nameT = createText({Size = 13}),
        distT = createText({Size = 17}),
        spdT = createText({Size = 17}),
        hdDot = createCircle(),
        tracer = createLine(),
        bones = v14,
    }
end

local function fn9(arg)
    local v14 = tbl6[arg]
    local v15 = v14

    if not v14 then
        local v16 = fn8()
        v15 = v16
        tbl6[arg] = v16
    end

    return v15
end

local function fn10(arg)
    arg.b1.Visible = false
    arg.b2.Visible = false
    arg.b3.Visible = false
    arg.b4.Visible = false
    arg.hbBg.Visible = false
    arg.hbFill.Visible = false
    arg.nameT.Visible = false
    arg.distT.Visible = false
    arg.spdT.Visible = false
    arg.hdDot.Visible = false
    arg.tracer.Visible = false
    local bones = arg.bones

    for i = 1, n7 do
        bones[i].Visible = false
    end
end

local function fn11(arg)
    local v14 = tbl6[arg]
    if not v14 then
        return
    end
    v14.b1:Remove()
    v14.b2:Remove()
    v14.b3:Remove()
    v14.b4:Remove()
    v14.hbBg:Remove()
    v14.hbFill:Remove()
    v14.nameT:Remove()
    v14.distT:Remove()
    v14.spdT:Remove()
    v14.hdDot:Remove()
    v14.tracer:Remove()

    for i = 1, n7 do
        v14.bones[i]:Remove()
    end

    tbl6[arg] = nil
end

RunService4.RenderStepped:Connect(function()
    local enabled, enabled2, localPlayer4, team, y, n8, n9, position, worldToViewportPoint, enabled3, enabled4, enabled5, headPos, distance, speed, enabled6, enabled7, teamCheck, thickness, transparency
    local size, players, v14, v15, v16, v17, v18, v19, v20, character2, humanoid2, humanoidRootPart, head, v21, v22, v23, n10, n11, n12, n13
    local n14, v24, n15, n16, n17, n18, n19, x, y2, v25, v26, v27, v28, n20, n21, n22, spdT, n23, bones, n24
    local v29, v30, n25, n26, v31, v32, v33, v34, v35, v36, v37, v38, bones2, n27, v39, v40, n28, n29, n30
    n30 = 1

    while true do
        if n30 == 1 then
            enabled = tbl4.tracers.enabled
            enabled2 = enabled

            if enabled then
                n30 = 3
            else
                n30 = 2
            end
        elseif n30 == 2 then
            enabled2 = tbl4.box.enabled
            n30 = 3
        elseif n30 == 3 then
            if enabled2 then
                n30 = 5
            else
                n30 = 4
            end
        elseif n30 == 4 then
            enabled2 = tbl4.healthbar.enabled
            n30 = 5
        elseif n30 == 5 then
            if enabled2 then
                n30 = 7
            else
                n30 = 6
            end
        elseif n30 == 6 then
            enabled2 = tbl4.name.enabled
            n30 = 7
        elseif n30 == 7 then
            if enabled2 then
                n30 = 9
            else
                n30 = 8
            end
        elseif n30 == 8 then
            enabled2 = tbl4.skeleton.enabled
            n30 = 9
        elseif n30 == 9 then
            if enabled2 then
                n30 = 11
            else
                n30 = 10
            end
        elseif n30 == 10 then
            enabled2 = tbl4.headPos
            n30 = 11
        elseif n30 == 11 then
            if enabled2 then
                n30 = 13
            else
                n30 = 12
            end
        elseif n30 == 12 then
            enabled2 = tbl4.distance
            n30 = 13
        elseif n30 == 13 then
            if enabled2 then
                n30 = 15
            else
                n30 = 14
            end
        elseif n30 == 14 then
            enabled2 = tbl4.speed
            n30 = 15
        elseif n30 == 15 then
            if enabled2 then
                n30 = 16
            else
                n30 = 65
            end
        elseif n30 == 16 then
            localPlayer4 = Players2.LocalPlayer
            team = localPlayer4.Team
            y = currentCamera.ViewportSize.Y
            n8 = currentCamera.ViewportSize.X * 0.5
            n9 = y * 0.5
            position = currentCamera.CFrame.Position
            worldToViewportPoint = currentCamera.WorldToViewportPoint
            enabled3 = tbl4.box.enabled
            enabled4 = tbl4.healthbar.enabled
            enabled5 = tbl4.name.enabled
            headPos = tbl4.headPos
            distance = tbl4.distance
            speed = tbl4.speed
            enabled6 = tbl4.skeleton.enabled
            enabled7 = tbl4.tracers.enabled
            teamCheck = tbl4.teamCheck
            thickness = tbl4.tracers.thickness
            transparency = tbl4.tracers.transparency
            size = tbl4.name.size
            players, v14 = Players2:GetPlayers()
            v15 = v14
            v16 = next
            v17 = players
            n30 = 17
        elseif n30 == 17 then
            v18, v19 = v16(v17, v15)

            if v18 == nil then
                n30 = 64
            else
                n30 = 18
            end
        elseif n30 == 18 then
            v15 = v18

            if v19 == localPlayer4 then
                n30 = 17
            else
                n30 = 19
            end
        elseif n30 == 19 then
            v20 = fn9(v19.Name)
            character2 = v19.Character

            if character2 then
                n30 = 20
            else
                n30 = 63
            end
        elseif n30 == 20 then
            if teamCheck and team and v19.Team == team then
                n30 = 62
            else
                n30 = 21
            end
        elseif n30 == 21 then
            humanoid2 = character2:FindFirstChildOfClass("Humanoid")
            humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")
            head = character2:FindFirstChild("Head")

            if humanoid2 and humanoid2.Health > 0 and humanoidRootPart and head then
                n30 = 23
            else
                n30 = 22
            end
        elseif n30 == 22 then
            fn10(v20)
            n30 = 17
        elseif n30 == 23 then
            v21, v22 = worldToViewportPoint(currentCamera, humanoidRootPart.Position)

            if v22 then
                n30 = 24
            else
                n30 = 61
            end
        elseif n30 == 24 then
            v23 = worldToViewportPoint(currentCamera, head.Position)
            n10 = head.Size.Y * 0.5
            n11 = position.X - humanoidRootPart.Position.X
            n12 = position.Y - humanoidRootPart.Position.Y
            n13 = position.Z - humanoidRootPart.Position.Z
            n14 = (n11 * n11 + n12 * n12 + n13 * n13) ^ 0.5
            v24 = worldToViewportPoint(currentCamera, vector3(humanoidRootPart.Position.X, humanoidRootPart.Position.Y - humanoid2.HipHeight, humanoidRootPart.Position.Z))
            n15 = v23.Y - n10 - 10
            n16 = v24.Y + 10
            n17 = (n16 - n15) * 0.25
            n18 = v21.X - n17
            n19 = v21.X + n17
            x = v21.X
            y2 = v21.Y

            if enabled3 then
                n30 = 25
            else
                n30 = 26
            end
        elseif n30 == 25 then
            v25 = vector2(n18, n15)
            v26 = vector2(n19, n15)
            v27 = vector2(n18, n16)
            v28 = vector2(n19, n16)
            v20.b1.From = v25
            v20.b1.To = v26
            v20.b1.Color = color
            v20.b1.Visible = true
            v20.b2.From = v27
            v20.b2.To = v28
            v20.b2.Color = color
            v20.b2.Visible = true
            v20.b3.From = v25
            v20.b3.To = v27
            v20.b3.Color = color
            v20.b3.Visible = true
            v20.b4.From = v26
            v20.b4.To = v28
            v20.b4.Color = color
            v20.b4.Visible = true
            n30 = 27
        elseif n30 == 26 then
            v20.b1.Visible = false
            v20.b2.Visible = false
            v20.b3.Visible = false
            v20.b4.Visible = false
            n30 = 27
        elseif n30 == 27 then
            if enabled4 then
                n30 = 28
            else
                n30 = 29
            end
        elseif n30 == 28 then
            n20 = n18 - 9
            n21 = humanoid2.Health / humanoid2.MaxHealth
            v20.hbBg.Size = vector2(8, 82)
            v20.hbBg.Position = vector2(n20, y2 - 41)
            v20.hbBg.Visible = true
            n22 = 80 * n21
            v20.hbFill.Size = vector2(6, n22)
            v20.hbFill.Position = vector2(n20 + 1, y2 + 39 - n22)
            v20.hbFill.Color = color
            v20.hbFill.Visible = true
            n30 = 30
        elseif n30 == 29 then
            v20.hbBg.Visible = false
            v20.hbFill.Visible = false
            n30 = 30
        elseif n30 == 30 then
            if enabled5 then
                n30 = 31
            else
                n30 = 32
            end
        elseif n30 == 31 then
            v20.nameT.Text = v19.Name
            v20.nameT.Size = size
            v20.nameT.Color = color
            v20.nameT.Position = vector2(x, n15 - 15)
            v20.nameT.Visible = true
            n30 = 33
        elseif n30 == 32 then
            v20.nameT.Visible = false
            n30 = 33
        elseif n30 == 33 then
            if headPos then
                n30 = 34
            else
                n30 = 35
            end
        elseif n30 == 34 then
            v20.hdDot.Radius = clamp(n10 * (y / (n1
