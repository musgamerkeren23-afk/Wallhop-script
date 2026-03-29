local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local Workspace = game:GetService("Workspace")
local VALID_KEY = "Wallhop_access"

local C_BG = Color3.fromRGB(10, 0, 0)
local C_DARK = Color3.fromRGB(20, 0, 0)
local C_RED = Color3.fromRGB(180, 0, 0)
local C_BRIGHTRED = Color3.fromRGB(220, 0, 0)
local C_GREEN = Color3.fromRGB(0, 180, 0)
local C_TEXT = Color3.fromRGB(200, 200, 200)
local C_WHITE = Color3.fromRGB(255, 255, 255)

-- ══════════════════════════════
--         KEY SYSTEM
-- ══════════════════════════════

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystem"
keyGui.ResetOnSpawn = false
keyGui.Parent = player:WaitForChild("PlayerGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 360, 0, 220)
keyFrame.Position = UDim2.new(0.5, -180, 0.5, -110)
keyFrame.BackgroundColor3 = C_BG
keyFrame.BorderSizePixel = 0
keyFrame.Active = true
keyFrame.Draggable = true
keyFrame.Parent = keyGui
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 10)

local fs = Instance.new("UIStroke")
fs.Color = C_RED
fs.Thickness = 2
fs.Parent = keyFrame

local keyTitleBar = Instance.new("Frame")
keyTitleBar.Size = UDim2.new(1, 0, 0, 46)
keyTitleBar.BackgroundColor3 = C_DARK
keyTitleBar.BorderSizePixel = 0
keyTitleBar.Parent = keyFrame
Instance.new("UICorner", keyTitleBar).CornerRadius = UDim.new(0, 10)

local keyIcon = Instance.new("TextLabel")
keyIcon.Size = UDim2.new(0, 40, 1, 0)
keyIcon.Position = UDim2.new(0, 8, 0, 0)
keyIcon.BackgroundTransparency = 1
keyIcon.Text = "💀"
keyIcon.TextSize = 22
keyIcon.Font = Enum.Font.GothamBold
keyIcon.Parent = keyTitleBar

local keyTitleLabel = Instance.new("TextLabel")
keyTitleLabel.Size = UDim2.new(1, -60, 1, 0)
keyTitleLabel.Position = UDim2.new(0, 48, 0, 0)
keyTitleLabel.BackgroundTransparency = 1
keyTitleLabel.Text = "h4ll0 w0rld | Key System"
keyTitleLabel.TextColor3 = C_BRIGHTRED
keyTitleLabel.TextSize = 15
keyTitleLabel.Font = Enum.Font.GothamBold
keyTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
keyTitleLabel.Parent = keyTitleBar

local keySep = Instance.new("Frame")
keySep.Size = UDim2.new(1, -20, 0, 1)
keySep.Position = UDim2.new(0, 10, 0, 50)
keySep.BackgroundColor3 = C_RED
keySep.BorderSizePixel = 0
keySep.Parent = keyFrame

local subLabel = Instance.new("TextLabel")
subLabel.Size = UDim2.new(1, -20, 0, 24)
subLabel.Position = UDim2.new(0, 10, 0, 58)
subLabel.BackgroundTransparency = 1
subLabel.Text = "Enter your key to unlock the hub"
subLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
subLabel.TextSize = 12
subLabel.Font = Enum.Font.Gotham
subLabel.Parent = keyFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -20, 0, 40)
keyInput.Position = UDim2.new(0, 10, 0, 88)
keyInput.BackgroundColor3 = C_DARK
keyInput.Text = ""
keyInput.PlaceholderText = "Enter key here..."
keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
keyInput.TextColor3 = C_WHITE
keyInput.TextSize = 13
keyInput.Font = Enum.Font.Gotham
keyInput.BorderSizePixel = 0
keyInput.ClearTextOnFocus = false
keyInput.Parent = keyFrame
Instance.new("UICorner", keyInput).CornerRadius = UDim.new(0, 6)

local inputStroke = Instance.new("UIStroke")
inputStroke.Color = C_RED
inputStroke.Thickness = 1
inputStroke.Parent = keyInput

local keyStatusLabel = Instance.new("TextLabel")
keyStatusLabel.Size = UDim2.new(1, -20, 0, 20)
keyStatusLabel.Position = UDim2.new(0, 10, 0, 132)
keyStatusLabel.BackgroundTransparency = 1
keyStatusLabel.Text = ""
keyStatusLabel.TextColor3 = C_BRIGHTRED
keyStatusLabel.TextSize = 11
keyStatusLabel.Font = Enum.Font.Gotham
keyStatusLabel.Parent = keyFrame

local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(1, -20, 0, 38)
verifyBtn.Position = UDim2.new(0, 10, 0, 158)
verifyBtn.BackgroundColor3 = C_RED
verifyBtn.Text = "🔑 Verify Key"
verifyBtn.TextColor3 = C_WHITE
verifyBtn.TextSize = 14
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.BorderSizePixel = 0
verifyBtn.Parent = keyFrame
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 6)

coroutine.wrap(function()
    while keyTitleLabel and keyTitleLabel.Parent do
        keyTitleLabel.TextTransparency = 0.6
        task.wait(0.05)
        keyTitleLabel.TextTransparency = 0
        task.wait(math.random(3, 7))
    end
end)()

local function shakeFrame()
    local orig = keyFrame.Position
    for i = 1, 3 do
        TweenService:Create(keyFrame, TweenInfo.new(0.04), {
            Position = UDim2.new(orig.X.Scale, orig.X.Offset + 10, orig.Y.Scale, orig.Y.Offset)
        }):Play()
        task.wait(0.04)
        TweenService:Create(keyFrame, TweenInfo.new(0.04), {
            Position = UDim2.new(orig.X.Scale, orig.X.Offset - 10, orig.Y.Scale, orig.Y.Offset)
        }):Play()
        task.wait(0.04)
    end
    TweenService:Create(keyFrame, TweenInfo.new(0.05), {Position = orig}):Play()
end

local function loadMainHub()

-- ══════════════════════════════
--         MAIN HUB
-- ══════════════════════════════

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.BackgroundColor3 = C_BG
frame.Size = UDim2.new(0, 340, 0, 220)
frame.Position = UDim2.new(0.5, -170, 0.5, -110)
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = false
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = C_RED
FrameStroke.Thickness = 2
FrameStroke.Parent = frame

local titleBar = Instance.new("Frame")
titleBar.Parent = frame
titleBar.BackgroundColor3 = C_DARK
titleBar.Size = UDim2.new(1, 0, 0, 44)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BorderSizePixel = 0
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 10)

local titleIcon = Instance.new("TextLabel")
titleIcon.Parent = titleBar
titleIcon.BackgroundTransparency = 1
titleIcon.Size = UDim2.new(0, 40, 1, 0)
titleIcon.Position = UDim2.new(0, 8, 0, 0)
titleIcon.Text = "💀"
titleIcon.TextSize = 22
titleIcon.Font = Enum.Font.GothamBold

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = titleBar
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(1, -90, 1, 0)
titleLabel.Position = UDim2.new(0, 50, 0, 0)
titleLabel.Text = "h4ll0 w0rld | WallHop V4"
titleLabel.TextColor3 = C_BRIGHTRED
titleLabel.TextSize = 15
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

coroutine.wrap(function()
    while titleLabel and titleLabel.Parent do
        titleLabel.TextTransparency = 0.6
        task.wait(0.05)
        titleLabel.TextTransparency = 0
        task.wait(math.random(3, 7))
    end
end)()

local sep = Instance.new("Frame")
sep.Parent = frame
sep.BackgroundColor3 = C_RED
sep.Size = UDim2.new(1, -20, 0, 1)
sep.Position = UDim2.new(0, 10, 0, 48)
sep.BorderSizePixel = 0

local statusLabel = Instance.new("TextLabel")
statusLabel.Parent = frame
statusLabel.BackgroundColor3 = C_DARK
statusLabel.Size = UDim2.new(1, -20, 0, 34)
statusLabel.Position = UDim2.new(0, 10, 0, 55)
statusLabel.Text = "💀 WallHop V4: OFF"
statusLabel.TextColor3 = C_BRIGHTRED
statusLabel.TextSize = 14
statusLabel.Font = Enum.Font.GothamBold
statusLabel.BorderSizePixel = 0
Instance.new("UICorner", statusLabel).CornerRadius = UDim.new(0, 6)

local function makeButton(parent, text, bgColor, x, y, w, h)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.BackgroundColor3 = bgColor
    btn.Size = UDim2.new(0, w, 0, h)
    btn.Position = UDim2.new(0, x, 0, y)
    btn.Text = text
    btn.TextColor3 = C_WHITE
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke")
    s.Color = C_RED
    s.Thickness = 1
    s.Parent = btn
    return btn
end

local onButton = makeButton(frame, "✅ On", C_DARK, 10, 98, 95, 34)
local offButton = makeButton(frame, "❌ Off", C_DARK, 115, 98, 95, 34)
local additionButton = makeButton(frame, "➕ Addition", C_DARK, 220, 98, 110, 34)
local destroyButton = makeButton(frame, "💥 Destroy", C_DARK, 10, 142, 150, 34)
local autoButton = makeButton(frame, "🔄 Auto: OFF", C_DARK, 170, 142, 160, 34)
local plusButton = makeButton(frame, "+", C_RED, -44, 55, 34, 34)

local wallhopToggle = false
local InfiniteJumpEnabled = true
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
local jumpConnection = nil
local autoJumpConnection = nil
local autoToggle = false
local additionToggle = false
local additionalFrame = nil
local jumpButtonInAddition = nil
local plusButtonToggle = false
local plusFrame = nil
local selectButtonInPlusFrame = nil
local selectModeActive = false
local colorListLabelInPlusFrame = nil
local mouseClickConnection = nil
local selectedBrickColor = nil

local function getWallRaycastResult()
    local character = player.Character
    if not character then return nil end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return nil end
    raycastParams.FilterDescendantsInstances = {character}
    local detectionDistance = 2
    local closestHit = nil
    local minDistance = detectionDistance + 1
    local hrpCF = humanoidRootPart.CFrame
    for i = 0, 7 do
        local angle = math.rad(i * 45)
        local direction = (hrpCF * CFrame.Angles(0, angle, 0)).LookVector
        local ray = Workspace:Raycast(humanoidRootPart.Position, direction * detectionDistance, raycastParams)
        if ray and ray.Instance and ray.Distance < minDistance then
            minDistance = ray.Distance
            closestHit = ray
        end
    end
    local blockCastSize = Vector3.new(1.5, 1, 0.5)
    local blockCastOffset = CFrame.new(0, -1, -0.5)
    local blockCastOriginCF = hrpCF * blockCastOffset
    local blockCastDirection = hrpCF.LookVector
    local blockCastDistance = 1.5
    local blockResult = Workspace:Blockcast(blockCastOriginCF, blockCastSize, blockCastDirection * blockCastDistance, raycastParams)
    if blockResult and blockResult.Instance and blockResult.Distance < minDistance then
        minDistance = blockResult.Distance
        closestHit = blockResult
    end
    return closestHit
end

local function executeWallJump(wallRayResult, jumpType)
    if jumpType ~= "Button" and not InfiniteJumpEnabled then return end
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local camera = Workspace.CurrentCamera
    if not (humanoid and rootPart and camera and humanoid:GetState() ~= Enum.HumanoidStateType.Dead and wallRayResult) then return end
    if jumpType ~= "Button" then InfiniteJumpEnabled = false end
    local maxInfluenceAngleRight = math.rad(20)
    local maxInfluenceAngleLeft = math.rad(-100)
    local wallNormal = wallRayResult.Normal
    local baseDirectionAwayFromWall = Vector3.new(wallNormal.X, 0, wallNormal.Z).Unit
    if baseDirectionAwayFromWall.Magnitude < 0.1 then
        local dirToHit = (wallRayResult.Position - rootPart.Position) * Vector3.new(1,0,1)
        baseDirectionAwayFromWall = -dirToHit.Unit
        if baseDirectionAwayFromWall.Magnitude < 0.1 then
            baseDirectionAwayFromWall = -rootPart.CFrame.LookVector * Vector3.new(1,0,1)
            if baseDirectionAwayFromWall.Magnitude > 0.1 then baseDirectionAwayFromWall = baseDirectionAwayFromWall.Unit end
            if baseDirectionAwayFromWall.Magnitude < 0.1 then baseDirectionAwayFromWall = Vector3.new(0,0,1) end
        end
    end
    baseDirectionAwayFromWall = Vector3.new(baseDirectionAwayFromWall.X, 0, baseDirectionAwayFromWall.Z).Unit
    if baseDirectionAwayFromWall.Magnitude < 0.1 then baseDirectionAwayFromWall = Vector3.new(0,0,1) end
    local cameraLook = camera.CFrame.LookVector
    local horizontalCameraLook = Vector3.new(cameraLook.X, 0, cameraLook.Z).Unit
    if horizontalCameraLook.Magnitude < 0.1 then horizontalCameraLook = baseDirectionAwayFromWall end
    local dot = math.clamp(baseDirectionAwayFromWall:Dot(horizontalCameraLook), -1, 1)
    local angleBetween = math.acos(dot)
    local cross = baseDirectionAwayFromWall:Cross(horizontalCameraLook)
    local rotationSign = -math.sign(cross.Y)
    if rotationSign == 0 then angleBetween = 0 end
    local actualInfluenceAngle
    if rotationSign == 1 then
        actualInfluenceAngle = math.min(angleBetween, maxInfluenceAngleRight)
    elseif rotationSign == -1 then
        actualInfluenceAngle = math.min(angleBetween, maxInfluenceAngleLeft)
    else
        actualInfluenceAngle = 0
    end
    local adjustmentRotation = CFrame.Angles(0, actualInfluenceAngle * rotationSign, 0)
    local initialTargetLookDirection = adjustmentRotation * baseDirectionAwayFromWall
    rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + initialTargetLookDirection)
    RunService.Heartbeat:Wait()
    local didJump = false
    if humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        didJump = true
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, -1, 0)
        task.wait(0.15)
        rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, 1, 0)
    end
    if didJump then
        local directionTowardsWall = -baseDirectionAwayFromWall
        task.wait(0.05)
        rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + directionTowardsWall)
    end
    if jumpType ~= "Button" then
        task.wait(0.1)
        InfiniteJumpEnabled = true
    end
end

local function performFaceWallJump()
    local wallRayResult = getWallRaycastResult()
    if wallRayResult then executeWallJump(wallRayResult, "Button") end
end

onButton.MouseButton1Click:Connect(function()
    wallhopToggle = true
    statusLabel.Text = "💀 WallHop V4: ON"
    statusLabel.TextColor3 = C_GREEN
    TweenService:Create(onButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 50, 0)}):Play()
    TweenService:Create(offButton, TweenInfo.new(0.2), {BackgroundColor3 = C_DARK}):Play()
end)

offButton.MouseButton1Click:Connect(function()
    wallhopToggle = false
    statusLabel.Text = "💀 WallHop V4: OFF"
    statusLabel.TextColor3 = C_BRIGHTRED
    TweenService:Create(offButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 0, 0)}):Play()
    TweenService:Create(onButton, TweenInfo.new(0.2), {BackgroundColor3 = C_DARK}):Play()
end)

additionButton.MouseButton1Click:Connect(function()
    additionToggle = not additionToggle
    if additionToggle then
        TweenService:Create(additionButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 50, 0)}):Play()
        if not additionalFrame then
            additionalFrame = Instance.new("Frame")
            additionalFrame.Parent = frame
            additionalFrame.BackgroundColor3 = C_DARK
            additionalFrame.Size = UDim2.new(0, 220, 0, 80)
            additionalFrame.Position = UDim2.new(0, 10, 1, 8)
            additionalFrame.BorderSizePixel = 0
            Instance.new("UICorner", additionalFrame).CornerRadius = UDim.new(0, 8)
            local as = Instance.new("UIStroke")
            as.Color = C_RED
            as.Thickness = 1
            as.Parent = additionalFrame
            jumpButtonInAddition = makeButton(additionalFrame, "💀 Wall Jump", C_RED, 30, 20, 160, 36)
            jumpButtonInAddition.MouseButton1Click:Connect(performFaceWallJump)
        end
    else
        TweenService:Create(additionButton, TweenInfo.new(0.2), {BackgroundColor3 = C_DARK}):Play()
        if additionalFrame then additionalFrame:Destroy(); additionalFrame = nil; jumpButtonInAddition = nil end
    end
end)

autoButton.MouseButton1Click:Connect(function()
    local desired = not autoToggle
    if desired then
        if selectedBrickColor then
            autoToggle = true
            autoButton.Text = "🔄 Auto: ON"
            TweenService:Create(autoButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 50, 0)}):Play()
        else
            statusLabel.Text = "⚠️ Select a color first!"
            statusLabel.TextColor3 = Color3.fromRGB(255, 150, 0)
            task.wait(2)
            statusLabel.Text = wallhopToggle and "💀 WallHop V4: ON" or "💀 WallHop V4: OFF"
            statusLabel.TextColor3 = wallhopToggle and C_GREEN or C_BRIGHTRED
        end
    else
        autoToggle = false
        autoButton.Text = "🔄 Auto: OFF"
        TweenService:Create(autoButton, TweenInfo.new(0.2), {BackgroundColor3 = C_DARK}):Play()
    end
end)

plusButton.MouseButton1Click:Connect(function()
    plusButtonToggle = not plusButtonToggle
    if plusButtonToggle then
        TweenService:Create(plusButton, TweenInfo.new(0.2), {BackgroundColor3 = C_GREEN}):Play()
        if not plusFrame then
            plusFrame = Instance.new("Frame")
            plusFrame.Parent = frame
            plusFrame.BackgroundColor3 = C_DARK
            plusFrame.Size = UDim2.new(0, 220, 0, 110)
            plusFrame.Position = UDim2.new(0, -230, 0, 55)
            plusFrame.BorderSizePixel = 0
            Instance.new("UICorner", plusFrame).CornerRadius = UDim.new(0, 8)
            local ps = Instance.new("UIStroke")
            ps.Color = C_RED
            ps.Thickness = 1
            ps.Parent = plusFrame

            local plusTitle = Instance.new("TextLabel")
            plusTitle.Parent = plusFrame
            plusTitle.BackgroundTransparency = 1
            plusTitle.Size = UDim2.new(1, 0, 0, 28)
            plusTitle.Position = UDim2.new(0, 0, 0, 4)
            plusTitle.Text = "🎨 Color Selector"
            plusTitle.TextColor3 = C_BRIGHTRED
            plusTitle.TextSize = 13
            plusTitle.Font = Enum.Font.GothamBold

            selectButtonInPlusFrame = makeButton(plusFrame, "🎯 Select", C_RED, 10, 36, 100, 30)

            colorListLabelInPlusFrame = Instance.new("TextLabel")
            colorListLabelInPlusFrame.Parent = plusFrame
            colorListLabelInPlusFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
            colorListLabelInPlusFrame.Size = UDim2.new(1, -20, 0, 30)
            colorListLabelInPlusFrame.Position = UDim2.new(0, 10, 0, 72)
            colorListLabelInPlusFrame.Text = "Click a part to detect color"
            colorListLabelInPlusFrame.TextColor3 = C_TEXT
            colorListLabelInPlusFrame.TextSize = 11
            colorListLabelInPlusFrame.Font = Enum.Font.Gotham
            colorListLabelInPlusFrame.BorderSizePixel = 0
            Instance.new("UICorner", colorListLabelInPlusFrame).CornerRadius = UDim.new(0, 6)

            selectButtonInPlusFrame.MouseButton1Click:Connect(function()
                selectModeActive = not selectModeActive
                if selectModeActive then
                    TweenService:Create(selectButtonInPlusFrame, TweenInfo.new(0.2), {BackgroundColor3 = C_GREEN}):Play()
                    colorListLabelInPlusFrame.Text = "👁 Click any part..."
                    if mouseClickConnection then mouseClickConnection:Disconnect(); mouseClickConnection = nil end
                    mouseClickConnection = mouse.Button1Down:Connect(function()
                        local target = mouse.Target
                        if target and target:IsA("BasePart") then
                            selectedBrickColor = target.BrickColor
                            colorListLabelInPlusFrame.Text = "Color: " .. target.BrickColor.Name
                            colorListLabelInPlusFrame.TextColor3 = target.Color
                        end
                    end)
                else
                    TweenService:Create(selectButtonInPlusFrame, TweenInfo.new(0.2), {BackgroundColor3 = C_RED}):Play()
                    if mouseClickConnection then mouseClickConnection:Disconnect(); mouseClickConnection = nil end
                end
            end)
        else
            plusFrame.Visible = true
        end
    else
        TweenService:Create(plusButton, TweenInfo.new(0.2), {BackgroundColor3 = C_RED}):Play()
        if plusFrame then
            plusFrame.Visible = false
            if selectModeActive then
                selectModeActive = false
                if selectButtonInPlusFrame then
                    TweenService:Create(selectButtonInPlusFrame, TweenInfo.new(0.2), {BackgroundColor3 = C_RED}):Play()
                end
                if mouseClickConnection then mouseClickConnection:Disconnect(); mouseClickConnection = nil end
            end
        end
    end
end)

autoJumpConnection = RunService.Heartbeat:Connect(function()
    if not autoToggle then return end
    if not selectedBrickColor then return end
    if not wallhopToggle then return end
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not (humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Dead) then return end
    local wallRayResult = getWallRaycastResult()
    if wallRayResult and wallRayResult.Instance then
        local hitPart = wallRayResult.Instance
        if hitPart:IsA("BasePart") and hitPart.BrickColor == selectedBrickColor then
            executeWallJump(wallRayResult, "Auto")
        end
    end
end)

destroyButton.MouseButton1Click:Connect(function()
    if jumpConnection then jumpConnection:Disconnect(); jumpConnection = nil end
    if autoJumpConnection then autoJumpConnection:Disconnect(); autoJumpConnection = nil end
    if mouseClickConnection then mouseClickConnection:Disconnect(); mouseClickConnection = nil end
    if screenGui and screenGui.Parent then screenGui:Destroy() end
end)

jumpConnection = UserInputService.JumpRequest:Connect(function()
    if not wallhopToggle then return end
    local wallRayResult = getWallRaycastResult()
    if wallRayResult then executeWallJump(wallRayResult, "Manual") end
end)

print("💀 h4ll0 w0rld | WallHop V4 loaded!")
end

-- ══════════════════════════════
--       KEY VERIFY LOGIC
-- ══════════════════════════════

local function verifyKey(input)
    if input == VALID_KEY then
        keyStatusLabel.TextColor3 = C_GREEN
        keyStatusLabel.Text = "✅ Key verified! Loading hub..."
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 0)}):Play()
        task.wait(1)
        TweenService:Create(keyFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        task.wait(0.5)
        keyGui:Destroy()
        loadMainHub()
    else
        keyStatusLabel.TextColor3 = C_BRIGHTRED
        keyStatusLabel.Text = "❌ Wrong key! Try again."
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(100, 0, 0)}):Play()
        task.wait(0.2)
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = C_RED}):Play()
        shakeFrame()
    end
end

verifyBtn.MouseButton1Click:Connect(function() verifyKey(keyInput.Text) end)
keyInput.FocusLost:Connect(function(enter) if enter then verifyKey(keyInput.Text) end end)
