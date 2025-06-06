-- Services
local Players           = game:GetService("Players")
local UserInputService  = game:GetService("UserInputService")

-- Player variables
local player    = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Constants
local REQUIRED_KEY = "TG:furizanscript"
local TELEGRAM_URL  = "https://t.me/furizanscript"

-- Create ScreenGui container
local screenGui = Instance.new("ScreenGui")
screenGui.Name        = "AuthenticationAndStealUI"
screenGui.ResetOnSpawn = false
screenGui.Parent      = playerGui

-- ========================================
--  Key Entry Frame (Authentication Menu)
-- ========================================
local keyFrame = Instance.new("Frame")
keyFrame.Name             = "KeyFrame"
keyFrame.Size             = UDim2.new(0, 300, 0, 300)
keyFrame.AnchorPoint      = Vector2.new(0.5, 0.5)
keyFrame.Position         = UDim2.new(0.5, 0, 0.5, 0)
keyFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 30)
keyFrame.BorderSizePixel  = 0
keyFrame.ZIndex           = 5
keyFrame.Parent           = screenGui

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 12)
keyCorner.Parent       = keyFrame

-- Title for KeyFrame
local keyTitle = Instance.new("TextLabel")
keyTitle.Name                   = "KeyTitle"
keyTitle.Size                   = UDim2.new(1, -20, 0, 40)
keyTitle.Position               = UDim2.new(0, 10, 0, 10)
keyTitle.BackgroundTransparency = 1
keyTitle.Text                   = "Доступ по ключу"
keyTitle.TextColor3             = Color3.fromRGB(255, 255, 255)
keyTitle.Font                   = Enum.Font.GothamBold
keyTitle.TextSize               = 22
keyTitle.TextXAlignment         = Enum.TextXAlignment.Center
keyTitle.ZIndex                 = 6
keyTitle.Parent                 = keyFrame

-- Instruction Label 1
local keyInstruction1 = Instance.new("TextLabel")
keyInstruction1.Name                   = "KeyInstruction1"
keyInstruction1.Size                   = UDim2.new(1, -20, 0, 40)
keyInstruction1.Position               = UDim2.new(0, 10, 0, 55)
keyInstruction1.BackgroundTransparency = 1
keyInstruction1.Text                   = "Нажмите кнопку, чтобы скопировать ссылку на Telegram-канал"
keyInstruction1.TextColor3             = Color3.fromRGB(200, 200, 200)
keyInstruction1.Font                   = Enum.Font.Gotham
keyInstruction1.TextSize               = 14
keyInstruction1.TextWrapped            = true
keyInstruction1.TextXAlignment         = Enum.TextXAlignment.Center
keyInstruction1.TextYAlignment         = Enum.TextYAlignment.Top
keyInstruction1.ZIndex                 = 6
keyInstruction1.Parent                 = keyFrame

-- Copy Link Button
local copyLinkButton = Instance.new("TextButton")
copyLinkButton.Name             = "CopyLinkButton"
copyLinkButton.Size             = UDim2.new(0.6, 0, 0, 35)
copyLinkButton.Position         = UDim2.new(0.2, 0, 0, 100)
copyLinkButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
copyLinkButton.TextColor3       = Color3.fromRGB(255, 255, 255)
copyLinkButton.Text             = "Скопировать ссылку"
copyLinkButton.Font             = Enum.Font.GothamBold
copyLinkButton.TextSize         = 16
copyLinkButton.ZIndex           = 6
copyLinkButton.Parent           = keyFrame

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 6)
copyCorner.Parent       = copyLinkButton

-- Display the URL (so user sees it)
local urlLabel = Instance.new("TextLabel")
urlLabel.Name                   = "UrlLabel"
urlLabel.Size                   = UDim2.new(1, -20, 0, 20)
urlLabel.Position               = UDim2.new(0, 10, 0, 145)
urlLabel.BackgroundTransparency = 1
urlLabel.Text                   = TELEGRAM_URL
urlLabel.TextColor3             = Color3.fromRGB(180, 180, 180)
urlLabel.Font                   = Enum.Font.Gotham
urlLabel.TextSize               = 14
urlLabel.TextXAlignment         = Enum.TextXAlignment.Center
urlLabel.ZIndex                 = 6
urlLabel.Parent                 = keyFrame

-- Instruction Label 2
local keyInstruction2 = Instance.new("TextLabel")
keyInstruction2.Name                   = "KeyInstruction2"
keyInstruction2.Size                   = UDim2.new(1, -20, 0, 25)
keyInstruction2.Position               = UDim2.new(0, 10, 0, 175)
keyInstruction2.BackgroundTransparency = 1
keyInstruction2.Text                   = "Введите ключ:"
keyInstruction2.TextColor3             = Color3.fromRGB(200, 200, 200)
keyInstruction2.Font                   = Enum.Font.Gotham
keyInstruction2.TextSize               = 16
keyInstruction2.TextXAlignment         = Enum.TextXAlignment.Center
keyInstruction2.ZIndex                 = 6
keyInstruction2.Parent                 = keyFrame

-- TextBox for entering the key
local keyInputBox = Instance.new("TextBox")
keyInputBox.Name             = "KeyInputBox"
keyInputBox.Size             = UDim2.new(1, -40, 0, 35)
keyInputBox.Position         = UDim2.new(0, 20, 0, 205)
keyInputBox.BackgroundColor3 = Color3.fromRGB(45, 45, 48)
keyInputBox.TextColor3       = Color3.fromRGB(255, 255, 255)
keyInputBox.PlaceholderText  = "Введите ключ здесь"
keyInputBox.Font             = Enum.Font.Gotham
keyInputBox.TextSize         = 16
keyInputBox.Text             = ""
keyInputBox.ClearTextOnFocus = false
keyInputBox.ZIndex           = 6
keyInputBox.Parent           = keyFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 6)
inputCorner.Parent       = keyInputBox

-- Submit button for key
local submitKeyButton = Instance.new("TextButton")
submitKeyButton.Name             = "SubmitKeyButton"
submitKeyButton.Size             = UDim2.new(0.5, -10, 0, 35)
submitKeyButton.Position         = UDim2.new(0.5, 5, 0, 250)
submitKeyButton.AnchorPoint      = Vector2.new(0.5, 0)
submitKeyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
submitKeyButton.Text              = "Проверить"
submitKeyButton.TextColor3        = Color3.fromRGB(255, 255, 255)
submitKeyButton.Font              = Enum.Font.GothamBold
submitKeyButton.TextSize          = 16
submitKeyButton.ZIndex            = 6
submitKeyButton.Parent            = keyFrame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 6)
submitCorner.Parent       = submitKeyButton

-- Error label for wrong key
local keyErrorLabel = Instance.new("TextLabel")
keyErrorLabel.Name                   = "KeyErrorLabel"
keyErrorLabel.Size                   = UDim2.new(1, -20, 0, 20)
keyErrorLabel.Position               = UDim2.new(0, 10, 0, 290)
keyErrorLabel.BackgroundTransparency = 1
keyErrorLabel.Text                   = ""
keyErrorLabel.TextColor3             = Color3.fromRGB(255, 80, 80)
keyErrorLabel.Font                   = Enum.Font.Gotham
keyErrorLabel.TextSize               = 14
keyErrorLabel.TextXAlignment         = Enum.TextXAlignment.Center
keyErrorLabel.ZIndex                 = 6
keyErrorLabel.Parent                 = keyFrame

-- ======================================
--  Main Functionality Frame (Hidden initially)
-- ======================================
local mainFrame = Instance.new("Frame")
mainFrame.Name             = "MainFrame"
mainFrame.Size             = UDim2.new(0, 300, 0, 260)
mainFrame.AnchorPoint      = Vector2.new(0.5, 0.5)
mainFrame.Position         = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel  = 0
mainFrame.ZIndex           = 1
mainFrame.Visible          = false
mainFrame.Parent           = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent       = mainFrame

-- Title label for main UI
local titleLabel = Instance.new("TextLabel")
titleLabel.Name                   = "TitleLabel"
titleLabel.Size                   = UDim2.new(1, -40, 0, 40)
titleLabel.Position               = UDim2.new(0, 20, 0, 20)
titleLabel.BackgroundTransparency = 1
titleLabel.Text                   = "Steal Inventory"
titleLabel.TextColor3             = Color3.fromRGB(255, 255, 255)
titleLabel.Font                   = Enum.Font.GothamBold
titleLabel.TextSize               = 20
titleLabel.TextXAlignment         = Enum.TextXAlignment.Left
titleLabel.ZIndex                 = 2
titleLabel.Parent                 = mainFrame

-- Close button for main UI
local closeButton = Instance.new("TextButton")
closeButton.Name            = "CloseButton"
closeButton.Size            = UDim2.new(0, 30, 0, 30)
closeButton.Position        = UDim2.new(1, -45, 0, 20)
closeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
closeButton.TextColor3      = Color3.fromRGB(255, 255, 255)
closeButton.Text            = "X"
closeButton.Font            = Enum.Font.GothamBold
closeButton.TextSize        = 18
closeButton.ZIndex          = 2
closeButton.Parent          = mainFrame

local closeCorner2 = Instance.new("UICorner")
closeCorner2.CornerRadius = UDim.new(0, 6)
closeCorner2.Parent       = closeButton

-- Minimize button for main UI
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name            = "MinimizeButton"
minimizeButton.Size            = UDim2.new(0, 30, 0, 30)
minimizeButton.Position        = UDim2.new(1, -85, 0, 20)
minimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimizeButton.TextColor3      = Color3.fromRGB(255, 255, 255)
minimizeButton.Text            = "_"
minimizeButton.Font            = Enum.Font.GothamBold
minimizeButton.TextSize        = 18
minimizeButton.ZIndex          = 2
minimizeButton.Parent          = mainFrame

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(0, 6)
minimizeCorner.Parent       = minimizeButton

-- Button to steal inventory
local stealButton = Instance.new("TextButton")
stealButton.Name             = "StealButton"
stealButton.Size             = UDim2.new(0.8, 0, 0, 45)
stealButton.Position         = UDim2.new(0.1, 0, 0, 80)
stealButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
stealButton.Text             = "STEAL INVENTORY"
stealButton.TextColor3       = Color3.fromRGB(255, 255, 255)
stealButton.Font             = Enum.Font.GothamBold
stealButton.TextSize         = 18
stealButton.ZIndex           = 2
stealButton.Parent           = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent       = stealButton

-- ESP Button (new, small button at bottom)
local espButton = Instance.new("TextButton")
espButton.Name             = "ESPButton"
espButton.Size             = UDim2.new(0.6, 0, 0, 36)
espButton.Position         = UDim2.new(0.5, 0, 0, 180)
espButton.AnchorPoint      = Vector2.new(0.5, 0)
espButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
espButton.Text             = "Включить ESP игроков"
espButton.TextColor3       = Color3.fromRGB(255, 255, 255)
espButton.Font             = Enum.Font.GothamBold
espButton.TextSize         = 16
espButton.ZIndex           = 2
espButton.Parent           = mainFrame

local espCorner = Instance.new("UICorner")
espCorner.CornerRadius = UDim.new(0, 8)
espCorner.Parent       = espButton

-- Text input box for another player's name
local textBox = Instance.new("TextBox")
textBox.Name             = "PlayerNameBox"
textBox.Size             = UDim2.new(0.8, 0, 0, 35)
textBox.Position         = UDim2.new(0.1, 0, 0, 130)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextColor3       = Color3.fromRGB(255, 255, 255)
textBox.PlaceholderText  = "Enter player name"
textBox.Font             = Enum.Font.Gotham
textBox.TextSize         = 16
textBox.Text             = ""
textBox.ClearTextOnFocus = false
textBox.ZIndex           = 2
textBox.Parent           = mainFrame

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 6)
textBoxCorner.Parent       = textBox

-- Suggestions frame (initially hidden)
local suggestionsFrame = Instance.new("Frame")
suggestionsFrame.Name             = "SuggestionsFrame"
suggestionsFrame.Size             = UDim2.new(0.8, 0, 0, 0)
suggestionsFrame.Position         = UDim2.new(0.1, 0, 0, 165)
suggestionsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
suggestionsFrame.BorderSizePixel  = 0
suggestionsFrame.ClipsDescendants = true
suggestionsFrame.Visible          = false
suggestionsFrame.ZIndex           = 3
suggestionsFrame.Parent           = mainFrame

local suggestionsUIList = Instance.new("UIListLayout")
suggestionsUIList.Parent      = suggestionsFrame
suggestionsUIList.SortOrder   = Enum.SortOrder.LayoutOrder
suggestionsUIList.Padding     = UDim.new(0, 2)

-- Minimized version (icon)
local minimizedIcon = Instance.new("TextButton")
minimizedIcon.Name            = "MinimizedIcon"
minimizedIcon.Size            = UDim2.new(0, 50, 0, 50)
minimizedIcon.Position        = UDim2.new(0, 20, 0, 20)
minimizedIcon.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
minimizedIcon.TextColor3      = Color3.fromRGB(255, 255, 255)
minimizedIcon.Text            = "📦"
minimizedIcon.Font            = Enum.Font.SourceSans
minimizedIcon.TextSize        = 24
minimizedIcon.Visible         = false
minimizedIcon.ZIndex          = 2
minimizedIcon.Parent          = screenGui

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 12)
iconCorner.Parent       = minimizedIcon

-- Helper: trim whitespace
local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-- Function to update suggestions under the TextBox
local function updateSuggestions(filterText)
    filterText = trim(filterText):lower()
    -- Clear existing suggestions
    for _, child in ipairs(suggestionsFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    local matches = {}
    if filterText == "" then
        -- If empty, show up to 5 other players
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player then
                table.insert(matches, plr.Name)
                if #matches >= 5 then
                    break
                end
            end
        end
    else
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player then
                local nameLower = plr.Name:lower()
                if nameLower:sub(1, #filterText) == filterText then
                    table.insert(matches, plr.Name)
                end
            end
        end
    end

    if #matches == 0 then
        suggestionsFrame.Visible = false
        suggestionsFrame.Size    = UDim2.new(0.8, 0, 0, 0)
        return
    end

    -- Populate suggestions
    for i, name in ipairs(matches) do
        local btn = Instance.new("TextButton")
        btn.Size             = UDim2.new(1, 0, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        btn.TextColor3       = Color3.fromRGB(255, 255, 255)
        btn.Font             = Enum.Font.Gotham
        btn.TextSize         = 16
        btn.Text             = name
        btn.LayoutOrder      = i
        btn.ZIndex           = 4
        btn.Parent           = suggestionsFrame

        btn.MouseButton1Click:Connect(function()
            textBox.Text = name
            suggestionsFrame.Visible = false
            suggestionsFrame.Size    = UDim2.new(0.8, 0, 0, 0)
        end)
    end

    -- Resize suggestionsFrame based on number of matches (max 5)
    local visibleCount = math.min(#matches, 5)
    suggestionsFrame.Size    = UDim2.new(0.8, 0, 0, visibleCount * 32)
    suggestionsFrame.Visible = true
end

-- Hide suggestions when focus is lost (short delay to allow click)
textBox.FocusLost:Connect(function()
    task.delay(0.1, function()
        suggestionsFrame.Visible = false
        suggestionsFrame.Size    = UDim2.new(0.8, 0, 0, 0)
    end)
end)

-- Update suggestions when text changes or when box gains focus
textBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateSuggestions(textBox.Text)
end)
textBox.Focused:Connect(function()
    updateSuggestions(textBox.Text)
end)

-- Function to add items (with text) into Backpack
local function addItemsToBackpack(targetName)
    local trimmedName = trim(targetName)
    local target = Players:FindFirstChild(trimmedName)
    if not target then
        warn("Player '" .. tostring(trimmedName) .. "' not found!")
        return false
    end

    local backpack = player:FindFirstChild("Backpack")
    if not backpack then
        warn("Backpack not found for player " .. player.Name)
        return false
    end

    -- List of items with exact weight and age data
    local items = {
        {Name = "Raccoon [15.56KG] [16 Age]"},
        {Name = "Dragonfly [12.56KG] [18 Age]"},
        {Name = "Candy Blossom [6.99KG]"},
        {Name = "Grape [15.56KG]"},
        {Name = "frog [15.56KG] [16 Age]"},
    }

    -- Удалим старые предметы с такими же именами, чтобы не копились дубли
    for _, child in ipairs(backpack:GetChildren()) do
        if child:IsA("Tool") then
            for _, data in ipairs(items) do
                if child.Name == data.Name then
                    child:Destroy()
                    break
                end
            end
        end
    end

    -- Добавляем каждый Tool прямо в Backpack
    for _, data in ipairs(items) do
        local tool = Instance.new("Tool")
        tool.Name    = data.Name
        tool.ToolTip = data.Name

        -- Невидимый Handle для отображения в инвентаре
        local handle = Instance.new("Part")
        handle.Name         = "Handle"
        handle.Size         = Vector3.new(1, 1, 1)
        handle.Transparency = 1
        handle.CanCollide   = false
        handle.Parent       = tool

        tool.Parent = backpack
        task.wait(0.05)
    end

    return true
end

-- Toggle minimize/restore for main UI
local function toggleMinimize()
    if mainFrame.Visible then
        mainFrame.Visible    = false
        minimizedIcon.Visible = true
        minimizedIcon.Position = UDim2.new(
            0, mainFrame.AbsolutePosition.X,
            0, mainFrame.AbsolutePosition.Y
        )
    else
        minimizedIcon.Visible = false
        mainFrame.Visible     = true
    end
end

-- Button behavior for main UI
stealButton.MouseButton1Click:Connect(function()
    local targetName = textBox.Text
    if trim(targetName) ~= "" then
        stealButton.Text            = "WORKING..."
        stealButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

        local success = addItemsToBackpack(targetName)
        if success then
            stealButton.Text            = "SUCCESS!"
            stealButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        else
            stealButton.Text            = "FAILED!"
            stealButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
        end

        task.wait(1)
        stealButton.Text            = "STEAL INVENTORY"
        stealButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    else
        stealButton.Text = "ENTER NAME!"
        task.wait(0.5)
        stealButton.Text = "STEAL INVENTORY"
    end
end)

-- Close main UI
closeButton.MouseButton1Click:Connect(function()
    mainFrame:Destroy()
    minimizedIcon:Destroy()
end)

-- Minimize/restore main UI
minimizeButton.MouseButton1Click:Connect(toggleMinimize)
minimizedIcon.MouseButton1Click:Connect(toggleMinimize)

-- ESP Button functionality
espButton.MouseButton1Click:Connect(function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and not p.Character:FindFirstChild("ESP") then
            local h = Instance.new("Highlight", p.Character)
            h.Name             = "ESP"
            h.FillColor        = Color3.fromRGB(255, 0, 0)
            h.OutlineColor     = Color3.fromRGB(255, 255, 255)
            h.FillTransparency = 0.7
            h.DepthMode        = Enum.HighlightDepthMode.AlwaysOnTop
        end
    end
end)

-- Update suggestions under TextBox
textBox.FocusLost:Connect(function()
    task.delay(0.1, function()
        suggestionsFrame.Visible = false
        suggestionsFrame.Size    = UDim2.new(0.8, 0, 0, 0)
    end)
end)

textBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateSuggestions(textBox.Text)
end)
textBox.Focused:Connect(function()
    updateSuggestions(textBox.Text)
end)

-- Make main window draggable
local dragging, dragInput, dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    if mainFrame.Visible then
        mainFrame.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
    else
        minimizedIcon.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
    end
end

local function startDrag(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging  = true
        dragStart = input.Position
        startPos  = mainFrame.Visible and mainFrame.Position or minimizedIcon.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end

mainFrame.InputBegan:Connect(startDrag)
mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

minimizedIcon.InputBegan:Connect(startDrag)
minimizedIcon.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        updateDrag(input)
    end
end)

-- ===========================================
--  Key Submission Logic: Copy link, Check key
-- ===========================================
copyLinkButton.MouseButton1Click:Connect(function()
    -- Попытка скопировать ссылку в буфер
    local success, err = pcall(function()
        setclipboard(TELEGRAM_URL)
    end)
    if success then
        copyLinkButton.Text            = "Ссылка скопирована!"
        copyLinkButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
        task.delay(1, function()
            copyLinkButton.Text            = "Скопировать ссылку"
            copyLinkButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        end)
    else
        copyLinkButton.Text            = "Ошибка копирования"
        copyLinkButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
        task.delay(1, function()
            copyLinkButton.Text            = "Скопировать ссылку"
            copyLinkButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        end)
        warn("Не удалось скопировать ссылку в буфер: " .. tostring(err))
    end
end)

submitKeyButton.MouseButton1Click:Connect(function()
    local entered = trim(keyInputBox.Text)
    keyErrorLabel.Text = ""
    if entered == "" then
        keyErrorLabel.Text = "Поле не может быть пустым!"
        return
    end

    if entered == REQUIRED_KEY then
        -- Правильный ключ, скрываем KeyFrame и показываем MainFrame
        keyFrame.Visible = false
        mainFrame.Visible = true
    else
        keyErrorLabel.Text = "Неверный ключ! Повторите попытку."
    end
end)
