local ZoneUiLibrary = {}

function ZoneUiLibrary:Validate(default, options)
	options = options or {}
	for i,v in pairs(default) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function ZoneUiLibrary:CreateWindow(options)
	options = ZoneUiLibrary:Validate({Name = "Zone"}, options or {})
	
	local Zone = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local Sidebar = Instance.new("Frame")
	local SidebarTitle = Instance.new("TextLabel")
	local Explorer = Instance.new("ScrollingFrame")
	local ExplorerListlayout = Instance.new("UIListLayout")
	local TabHolder = Instance.new("Frame")
	local TabHolderPadding = Instance.new("UIPadding")
	
	Zone.Name = "Zone"
	Zone.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

	Main.Name = "Main"
	Main.Parent = Zone
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 700, 0, 500)

	DropShadowHolder.Name = "DropShadowHolder"
	DropShadowHolder.Parent = Main
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Sidebar.Name = "Sidebar"
	Sidebar.Parent = Main
	Sidebar.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	Sidebar.BorderSizePixel = 0
	Sidebar.Size = UDim2.new(0, 200, 1, 0)

	SidebarTitle.Name = "SidebarTitle"
	SidebarTitle.Parent = Sidebar
	SidebarTitle.AnchorPoint = Vector2.new(0.5, 0)
	SidebarTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SidebarTitle.BackgroundTransparency = 1.000
	SidebarTitle.BorderSizePixel = 0
	SidebarTitle.Position = UDim2.new(0.5, 0, 0, 0)
	SidebarTitle.Size = UDim2.new(1, -20, 0, 40)
	SidebarTitle.Font = Enum.Font.Ubuntu
	SidebarTitle.Text = options["Name"]
	SidebarTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	SidebarTitle.TextSize = 30.000
	SidebarTitle.TextWrapped = true

	Explorer.Name = "Explorer"
	Explorer.Parent = Sidebar
	Explorer.Active = true
	Explorer.AnchorPoint = Vector2.new(0.5, 0)
	Explorer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Explorer.BackgroundTransparency = 1.000
	Explorer.BorderSizePixel = 0
	Explorer.Position = UDim2.new(0.5, 0, 0, 60)
	Explorer.Size = UDim2.new(1, 0, 1, -70)
	Explorer.ScrollBarThickness = 0
	
	ExplorerListlayout.Name = "ExplorerListlayout"
	ExplorerListlayout.Parent = Explorer
	ExplorerListlayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Main
	TabHolder.AnchorPoint = Vector2.new(1, 0)
	TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHolder.BackgroundTransparency = 1.000
	TabHolder.BorderSizePixel = 0
	TabHolder.ClipsDescendants = true
	TabHolder.Position = UDim2.new(1, 0, 0, 0)
	TabHolder.Size = UDim2.new(1, -200, 1, 0)

	TabHolderPadding.Name = "TabHolderPadding"
	TabHolderPadding.Parent = TabHolder
	TabHolderPadding.PaddingBottom = UDim.new(0, 10)
	TabHolderPadding.PaddingTop = UDim.new(0, 10)
	
	local Tabs = {}
	
	function Tabs:CreateTab(options)
		options = ZoneUiLibrary:Validate({Name = "Tab Name", Icon = "rbxassetid://11749319400"}, options or {})
		
		local TabButton = Instance.new("TextButton")
		local TabIcon = Instance.new("ImageLabel")
		local TabTitle = Instance.new("TextLabel")
		local Tab = Instance.new("ScrollingFrame")
		local TabListlayout = Instance.new("UIListLayout")
		local TabPadding = Instance.new("UIPadding")
		
		TabButton.Name = "TabButton"
		TabButton.Parent = Explorer
		TabButton.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
		TabButton.BackgroundTransparency = 1.000
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(0, 200, 0, 40)
		TabButton.AutoButtonColor = false
		TabButton.Font = Enum.Font.Ubuntu
		TabButton.Text = ""
		TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.TextSize = 14.000

		TabIcon.Name = "TabIcon"
		TabIcon.Parent = TabButton
		TabIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		TabIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabIcon.BackgroundTransparency = 1.000
		TabIcon.BorderSizePixel = 0
		TabIcon.Position = UDim2.new(0, 20, 0.5, 0)
		TabIcon.Size = UDim2.new(0, 30, 0, 30)
		TabIcon.Image = options["Icon"]
		TabIcon.ImageColor3 = Color3.fromRGB(115, 115, 115)

		TabTitle.Name = "TabTitle"
		TabTitle.Parent = TabButton
		TabTitle.AnchorPoint = Vector2.new(1, 0.5)
		TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabTitle.BackgroundTransparency = 1.000
		TabTitle.BorderSizePixel = 0
		TabTitle.Position = UDim2.new(1, -5, 0.5, 0)
		TabTitle.Size = UDim2.new(0.75, 0, 1, -10)
		TabTitle.Font = Enum.Font.Ubuntu
		TabTitle.Text = options["Name"]
		TabTitle.TextColor3 = Color3.fromRGB(115, 115, 115)
		TabTitle.TextSize = 15.000
		TabTitle.TextXAlignment = Enum.TextXAlignment.Left
		
		Tab.Name = "Tab"
		Tab.Parent = TabHolder
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderSizePixel = 0
		Tab.ClipsDescendants = false
		Tab.Selectable = false
		Tab.Size = UDim2.new(1, 0, 1, 0)
		Tab.Visible = false
		Tab.ScrollBarThickness = 0
		
		TabListlayout.Name = "TabListlayout"
		TabListlayout.Parent = Tab
		TabListlayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		TabListlayout.SortOrder = Enum.SortOrder.LayoutOrder

		TabPadding.Name = "TabPadding"
		TabPadding.Parent = Tab
		TabPadding.PaddingLeft = UDim.new(0, 10)
		TabPadding.PaddingRight = UDim.new(0, 10)
		
		TabButton.MouseButton1Down:Connect(function()
			for i,v in pairs(TabHolder:GetChildren()) do
				if v:IsA("ScrollingFrame") and v.Name == "Tab" then
					v.Visible = false
				end
			end
			Tab.Visible = true
			for i,v in pairs(Explorer:GetChildren()) do
				if v:IsA("TextButton") and v.Name == "TabButton" then
					game:GetService("TweenService"):Create(v, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
					game:GetService("TweenService"):Create(v.TabIcon, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					game:GetService("TweenService"):Create(v.TabTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					game:GetService("TweenService"):Create(TabButton, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
					game:GetService("TweenService"):Create(TabIcon, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					game:GetService("TweenService"):Create(TabTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()	
				end
			end
		end)
		
		local Elements = {}
		
		function Elements:CreateButton(options)
			options = ZoneUiLibrary:Validate({Name = "Button", Description = "No description given."}, options or {})
			
			local DescriptionToggled = false
			
			local Button = Instance.new("TextButton")
			local ButtonTitle = Instance.new("TextLabel")
			local ButtonArrow = Instance.new("TextButton")
			local ButtonArrowImage = Instance.new("ImageLabel")
			local ButtonBar = Instance.new("Frame")
			local ButtonDescription = Instance.new("TextLabel")
			
			Button.Name = "Button"
			Button.Parent = Tab
			Button.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(1, 0, 0, 40)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000

			ButtonTitle.Name = "ButtonTitle"
			ButtonTitle.Parent = Button
			ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.BackgroundTransparency = 1.000
			ButtonTitle.BorderSizePixel = 0
			ButtonTitle.Position = UDim2.new(0, 10, 0, 10)
			ButtonTitle.Size = UDim2.new(0.5, 175, 0, 20)
			ButtonTitle.Font = Enum.Font.Ubuntu
			ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.TextSize = 14.000
			ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

			ButtonArrow.Name = "ButtonArrow"
			ButtonArrow.Parent = Button
			ButtonArrow.AnchorPoint = Vector2.new(1, 0)
			ButtonArrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonArrow.BackgroundTransparency = 1.000
			ButtonArrow.BorderSizePixel = 0
			ButtonArrow.Position = UDim2.new(1, -5, 0, 5)
			ButtonArrow.Size = UDim2.new(0, 30, 0, 30)
			ButtonArrow.AutoButtonColor = false
			ButtonArrow.Font = Enum.Font.SourceSans
			ButtonArrow.Text = ""
			ButtonArrow.TextColor3 = Color3.fromRGB(0, 0, 0)
			ButtonArrow.TextSize = 14.000

			ButtonArrowImage.Name = "ButtonArrowImage"
			ButtonArrowImage.Parent = ButtonArrow
			ButtonArrowImage.AnchorPoint = Vector2.new(0.5, 0.5)
			ButtonArrowImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonArrowImage.BackgroundTransparency = 1.000
			ButtonArrowImage.BorderSizePixel = 0
			ButtonArrowImage.Position = UDim2.new(0.5, 0, 0.5, 0)
			ButtonArrowImage.Size = UDim2.new(0, 20, 0, 20)
			ButtonArrowImage.Image = "rbxassetid://11750627572"

			ButtonBar.Name = "ButtonBar"
			ButtonBar.Parent = Button
			ButtonBar.AnchorPoint = Vector2.new(0.5, 1)
			ButtonBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonBar.BorderSizePixel = 0
			ButtonBar.Position = UDim2.new(0.5, 0, 1, 0)
			ButtonBar.Size = UDim2.new(0, 0, 0, 1)
			
			ButtonDescription.Name = "ButtonDescription"
			ButtonDescription.Parent = Button
			ButtonDescription.AnchorPoint = Vector2.new(0.5, 1)
			ButtonDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonDescription.BackgroundTransparency = 1.000
			ButtonDescription.BorderSizePixel = 0
			ButtonDescription.Position = UDim2.new(0.5, 0, 1, -10)
			ButtonDescription.Size = UDim2.new(1, -20, 0.5, 0)
			ButtonDescription.Font = Enum.Font.Ubuntu
			ButtonDescription.Text = options["Description"]
			ButtonDescription.TextColor3 = Color3.fromRGB(168, 168, 168)
			ButtonDescription.TextSize = 20.000
			ButtonDescription.TextTransparency = 1.000
			ButtonDescription.TextWrapped = true
			
			ButtonArrow.MouseButton1Down:Connect(function()
				if DescriptionToggled then
					DescriptionToggled = false
					game:GetService("TweenService"):Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 40)}):Play()
					game:GetService("TweenService"):Create(ButtonArrowImage, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					game:GetService("TweenService"):Create(ButtonBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 1)}):Play()	
					game:GetService("TweenService"):Create(ButtonDescription, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()	
				else
					DescriptionToggled = true
					game:GetService("TweenService"):Create(Button, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 100)}):Play()
					game:GetService("TweenService"):Create(ButtonArrowImage, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play()
					game:GetService("TweenService"):Create(ButtonBar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 1)}):Play()
					game:GetService("TweenService"):Create(ButtonDescription, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()		
				end	
			end)
		end
		
		return Elements
	end
	
	return Tabs
end

return ZoneUiLibrary
