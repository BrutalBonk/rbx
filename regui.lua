--[[

	  _       ,-'REGUI`-._
	(,-.`._,'( By Depso |\`-/|
		`-.-' \ )-----`( , o o)
			`-       \`_`"'_

    Written by depso
    MIT License
        
    https://github.com/depthso
]]

local ReGui = {
	--// Package data
	Version = "1.1",
	Author = "Depso",
	License = "MIT",
	Repository = "https://github.com/depthso/regui",

	Debug = false,

	--// Path info
	PrefabsId = 71968920594655,
	DefaultTitle = "ReGui",
	ContainerName = "ReGui",

	Container = nil,
	Prefabs = nil,
	Tooltip = nil,
	ActiveWindow = nil,

	--// Classes
	Elements = {},
	Animation = {
		DefaultTweenInfo = TweenInfo.new(0.08)
	},

	Windows = {},
	AnimationConnections = {},
}

ReGui.Icons = {
	Dot = "rbxasset://textures/whiteCircle.png",
	Arrow = "rbxassetid://4731371527",
	Close = "rbxasset://textures/AnimationEditor/icon_close.png",
	Checkmark = "rbxasset://textures/AnimationEditor/icon_checkmark.png",
	Cat = "rbxassetid://16211812161",
	Script = "rbxassetid://11570895459",
	Settings = "rbxassetid://9743465390",
	Info = "rbxassetid://18754976792",
	Move = "rbxassetid://6710235139",
	Roblox = "rbxassetid://7414445494",
	Warning = "rbxassetid://11745872910",
	Audio = "rbxassetid://302250236",
	Shop = "rbxassetid://6473525198",
	CharacterDance = "rbxassetid://11932783331",
	Pants = "rbxassetid://10098755331",
	Home = "rbxassetid://4034483344",
	Robux = "rbxassetid://5986143282",
	Badge = "rbxassetid://16170504068",
	SpawnLocation = "rbxassetid://6400507398",
	Sword = "rbxassetid://7485051715",
	Clover = "rbxassetid://11999300014",
	Star = "rbxassetid://3057073083",
	Code = "rbxassetid://11348555035",
	Paw = "rbxassetid://13001190533",
	Shield = "rbxassetid://7461510428",
	Shield2 = "rbxassetid://7169354142",
	File = "rbxassetid://7276823330",
	Book = "rbxassetid://16061686835",
	Location = "rbxassetid://13549782519",
	Puzzle = "rbxassetid://8898417863",
	Discord = "rbxassetid://84828491431270",
	Premium = "rbxassetid://6487178625",
	Friend = "rbxassetid://10885655986",
	User = "rbxassetid://18854794412",
	Duplicate = "rbxassetid://11833749507",
	ChatBox = "rbxassetid://15839118471",
	ChatBox2 = "rbxassetid://15839116089",
	Devices = "rbxassetid://4458812712",
	Weight = "rbxassetid://9855685269",
	Image = "rbxassetid://4669770840",
	Profile = "rbxassetid://13585614795",
	Admin = "rbxassetid://11656483170",
	PaintBrush = "rbxassetid://12111879608",
	Speed = "rbxassetid://12641434961",
	NoConnection = "rbxassetid://9795340967",
	Connection = "rbxassetid://119759670842477",
	Globe = "rbxassetid://18870359747",
	Box = "rbxassetid://140217940575618",
	Crown = "rbxassetid://18826490498",
	Control = "rbxassetid://18979524646",
	Send = "rbxassetid://18940312887",
	FastForward = "rbxassetid://112963221295680",
	Pause = "rbxassetid://109949100737970",
	Reload = "rbxassetid://11570018242",
	Joystick = "rbxassetid://18749336354",
	Controller = "rbxassetid://11894535915",
	Lock = "rbxassetid://17783082088",
	Calculator = "rbxassetid://85861816563977",
	Sun = "rbxassetid://13492317832",
	Moon = "rbxassetid://8498174594",
	Prohibited = "rbxassetid://5248916036",
	Flag = "rbxassetid://251346532",
	Website = "rbxassetid://98455290625865",
	Telegram = "rbxassetid://115860270107061",
	MusicNote = "rbxassetid://18187351229",
	Music = "rbxassetid://253830398",
	Headphones = "rbxassetid://1311321471",
	Phone = "rbxassetid://8411963035",
	Smartphone = "rbxassetid://14040313879",
	Desktop = "rbxassetid://3120635703",
	Desktop2 = "rbxassetid://4728059490",
	Laptop = "rbxassetid://4728059725",
	Server = "rbxassetid://9692125126",
	Wedge = "rbxassetid://9086583059",
	Drill = "rbxassetid://11959189471",
	Character = "rbxassetid://13285102351",
}

ReGui.Accent = {
	--// ReGui acent colors
	Light = Color3.fromRGB(50, 150, 250),
	Dark = Color3.fromRGB(30, 66, 115),
	White = Color3.fromRGB(240, 240, 240),
	Gray = Color3.fromRGB(127, 126, 129),
	Black = Color3.fromRGB(15, 19, 24),
	Yellow = Color3.fromRGB(230, 180, 0),
	Orange = Color3.fromRGB(230, 150, 0),
	Green = Color3.fromRGB(130, 188, 91),
	Red = Color3.fromRGB(255, 69, 69),

	--// ImGui acent colors
	ImGui = {
		Light = Color3.fromRGB(66, 150, 250),
		Dark = Color3.fromRGB(41, 74, 122),
		Black = Color3.fromRGB(15, 15, 15),
		Gray = Color3.fromRGB(36, 36, 36)
	}
}

type ThemeData = {
	[string]: any
}
ReGui.ThemeConfigs = {
	--// Base theme
	DarkTheme = {
		TextFont = Font.fromName("Inconsolata"),
		Text = ReGui.Accent.White,
		TextDisabled = ReGui.Accent.Gray,
		ErrorText = ReGui.Accent.Red,

		--// Elements
		InputsBg = ReGui.Accent.Dark,
		InputsBgTransparency = 0.4,
		InputsGrabColor = ReGui.Accent.Light,
		ButtonsBg = ReGui.Accent.Light,
		CollapsingHeaderBg = ReGui.Accent.Light,
		CollapsingHeaderText = ReGui.Accent.White,
		CheckboxBg = ReGui.Accent.Dark,
		CheckboxTick = ReGui.Accent.Light,
		RadioButtonSelectedBg = ReGui.Accent.Light,
		ComboBg = ReGui.Accent.Light,
		ResizeGrab = ReGui.Accent.Light,
		HeaderBg = ReGui.Accent.Gray,
		HeaderBgTransparency = 0.6,
		HistogramBar = ReGui.Accent.Yellow,
		ProgressBar = ReGui.Accent.Yellow,
		RegionBg = ReGui.Accent.Dark,
		RegionBgTransparency = 0.1,

		--// Tabsbox
		TabTextPaddingTop = UDim.new(0, 3),
		TabTextPaddingBottom = UDim.new(0, 8),
		TabText = ReGui.Accent.Gray,
		TabBg = ReGui.Accent.Dark,
		ActiveTabText = ReGui.Accent.White,
		ActiveTabBg = ReGui.Accent.Light,
		TabsBarBg = Color3.fromRGB(36, 36, 36),
		TabsBarBgTransparency = 1,

		--// Window
		WindowBg = ReGui.Accent.Black,
		WindowBgTransparency = 0.05,
		Border = ReGui.Accent.Gray,
		BorderTransparency = 0.7,
		Title = ReGui.Accent.White,
		TitleAlign = Enum.TextXAlignment.Left,
		TitleBarBg = ReGui.Accent.Black,
		TitleBarTransparency = 0,
		ActiveTitle = ReGui.Accent.White,
		ActiveTitleBarBg = ReGui.Accent.Dark,
		ActiveTitleBarTransparency = 0.05,
		ActiveBorderTransparency = 0.4,
	},
	LightTheme = {
		Text = ReGui.Accent.Black,
		TextFont = Font.fromName("Ubuntu"),

		--// Elements
		InputsBg = ReGui.Accent.Gray,
		InputsBgTransparency = 0.4,
		InputsGrabColor = ReGui.Accent.White,
		ButtonsBg = ReGui.Accent.Gray,
		CollapsingHeaderBg = ReGui.Accent.Gray,
		CollapsingHeaderText = ReGui.Accent.Black,
		CheckboxBg = ReGui.Accent.Gray,
		CheckboxTick = ReGui.Accent.Black,
		RadioButtonSelectedBg = ReGui.Accent.Black,
		ComboBg = ReGui.Accent.Gray,

		--// Tabsbox
		TabText = ReGui.Accent.Black,
		TabBg = ReGui.Accent.White,
		ActiveTabText = ReGui.Accent.Black,
		ActiveTabBg = ReGui.Accent.Gray,

		--// Window
		WindowBg = ReGui.Accent.White,
		Border = ReGui.Accent.Gray,
		ResizeGrab = ReGui.Accent.Gray,
		Title = ReGui.Accent.White,
		TitleAlign = Enum.TextXAlignment.Center,
		TitleBarBg = ReGui.Accent.Black,
		ActiveTitle = ReGui.Accent.Black,
		ActiveTitleBarBg = ReGui.Accent.Gray,
	},
	Classic = {
		Text = Color3.fromRGB(255, 255, 255),

		--// Elements
		InputsBg = ReGui.Accent.ImGui.Dark,
		InputsBgTransparency = 0.4,
		ButtonsBg = ReGui.Accent.ImGui.Light,
		CollapsingHeaderBg = ReGui.Accent.ImGui.Light,
		CollapsingHeaderText = ReGui.Accent.White,
		CheckboxBg = ReGui.Accent.ImGui.Dark,
		CheckboxTick = ReGui.Accent.ImGui.Light,
		RadioButtonSelectedBg = ReGui.Accent.ImGui.Light,
		ComboBg = ReGui.Accent.ImGui.Light,
		ResizeGrab = ReGui.Accent.ImGui.Light,

		--// Tabsbox
		TabTextPaddingTop = UDim.new(0, 0),
		TabText = ReGui.Accent.Gray,
		TabBg = ReGui.Accent.ImGui.Gray,
		ActiveTabText = ReGui.Accent.White,
		ActiveTabBg = ReGui.Accent.ImGui.Gray,
		TabsBarBg = ReGui.Accent.ImGui.Gray,
		TabsBarBgTransparency = 0,

		--// Window
		WindowBg = ReGui.Accent.ImGui.Black,
		WindowBgTransparency = 0.05,
		Border = ReGui.Accent.Gray,
		BorderTransparency = 0.7,
		Title = ReGui.Accent.White,
		TitleBarBg = ReGui.Accent.ImGui.Black,
		TitleBarTransparency = 0,
		ActiveTitleBarBg = ReGui.Accent.ImGui.Dark,
		ActiveBorderTransparency = 0.4,
		ActiveTitleBarTransparency = 0,
	}
}

ReGui.ElementColors = {
	["Region"] = {
		BackgroundColor3 = "RegionBg",
		BackgroundTransparency = "RegionBgTransparency",
	},
	["Label"] = {
		TextColor3 = "Text",
		FontFace = "TextFont",
	},
	["LabelDisabled"] = {
		TextColor3 = "TextDisabled",
		FontFace = "TextFont",
	},
	["Plot"] = {
		BackgroundColor3 = "HistogramBar",
	},
	["Header"] = {
		BackgroundColor3 = "HeaderBg",
		BackgroundTransparency = "HeaderBgTransparency",
	},
	["WindowTitle"] = {
		TextXAlignment = "TitleAlign",
		FontFace = "TextFont"
	},
	["TitleBar"] = {
		BackgroundColor3 = "ActiveTitleBarBg"
	},
	["Window"] = {
		BackgroundColor3 = "WindowBg",
		BackgroundTransparency = "WindowBgTransparency"
	},
	["ActiveTitleBarBg"] = {
		BackgroundColor3 = "ActiveTitleBarBg",
		BackgroundTransparency = "ActiveTitleBarTransparency"
	},
	["DeActiveTitleBar"] = {
		BackgroundColor3 = "TitleBarBg",
		BackgroundTransparency = "TitleBarTransparency"
	},
	["TabsBoxTabsBar"] = {
		BackgroundColor3 = "TabsBarBg",
		BackgroundTransparency = "TabsBarBgTransparency",
	},
	["TabPadding"] = {
		PaddingTop = "TabTextPaddingTop",
		PaddingBottom = "TabTextPaddingBottom"
	},
	["Border"] = {
		Color = "Border"
	},
	["ResizeGrab"] = {
		TextColor3 = "ResizeGrab"
	},
	["SelectedBorder"] = {
		Transparency = "ActiveBorderTransparency"
	},
	["DeselectedBorder"] = {
		Transparency = "BorderTransparency"
	},
	["Input"] = {
		BackgroundColor3 = "InputsBg",
		BackgroundTransparency = "InputsBgTransparency",
		TextColor3 = "Text",
		FontFace = "TextFont",
	},
	["InputGrab"] = {
		BackgroundColor3 = "InputsGrabColor"
	},
	["Button"] = {
		BackgroundColor3 = "ButtonsBg",
		TextColor3 = "Text",
		FontFace = "TextFont",
	},
	["Keybind"] = {
		BackgroundColor3 = "InputsBg",
		TextColor3 = "Text",
		FontFace = "TextFont",
	},
	["CollapsingHeader"] = {
		FontFace = "TextFont",
		TextColor3 = "CollapsingHeaderText",
		BackgroundColor3 = "CollapsingHeaderBg",
	},
	["Checkbox"] = {
		BackgroundColor3 = "CheckboxBg",
	},
	["CheckboxTick"] = {
		ImageColor3 = "CheckboxTick",
		BackgroundColor3 = "CheckboxTick",
	},
	["RadioButton"] = {
		BackgroundColor3 = "RadioButtonSelectedBg",
	},
	["Combo"] = {
		BackgroundColor3 = "ComboBg"
	}
}

ReGui.Styles = {
	RadioButton = {
		Animation = "RadioButtons",
		CornerRadius = UDim.new(1, 0),
	},
	Button = {
		Animation = "Buttons"
	},
	CollapsingHeader = {
		Animation = "Buttons"
	},
	TreeNode = {
		Animation = "TransparentButtons"
	},
	TransparentButton = {
		Animation = "TransparentButtons"
	}
}

ReGui.Animations = {
	["Buttons"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0.3,
			},
			MouseLeave = {
				BackgroundTransparency = 0.7,
			}
		},
		Init = "MouseLeave"
	},
	["TransparentButtons"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0.3,
			},
			MouseLeave = {
				BackgroundTransparency = 1,
			}
		},
		Init = "MouseLeave"
	},
	["RadioButtons"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0.5,
			},
			MouseLeave = {
				BackgroundTransparency = 1,
			}
		},
		Init = "MouseLeave"
	},
	["Inputs"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0,
			},
			MouseLeave = {
				BackgroundTransparency = 0.5,
			},
		},
		Init = "MouseLeave"
	},
	["Plots"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0.3,
			},
			MouseLeave = {
				BackgroundTransparency = 0,
			},
		},
		Init = "MouseLeave"
	},
	["Border"] = {
		Connections = {
			Selected = {
				Transparency = 0,
				Thickness = 1
			},
			Deselected = {
				Transparency = 0.7,
				Thickness = 1
			}
		},
		Init = "Selected"
	},
}

--// Global flags for styling
type FlagFunc = {
	Data: {
		Class: {},
		WindowClass: table?
	},
	Object: GuiObject
}
ReGui.ElementFlags = {
	{
		Properties = {"Center"},
		Callback = function<FlagFunc>(Data, Object, Value)
			local Position = Object.Position

			ReGui:SetProperties(Object, {
				Position = UDim2.new(
					Value:find("X") and 0.5 or Position.X.Scale,
					Position.X.Offset,
					Value:find("Y") and 0.5 or Position.Y.Scale,
					Position.Y.Offset
				),
				AnchorPoint = Vector2.new(
					Value:find("X") and 0.5 or 0,
					Value:find("Y") and 0.5 or 0
				)
			})
		end,
	},
	{
		Properties = {"ElementStyle"},
		Callback = function<StyleFunc>(Data, Object, Value)
			ReGui:ApplyStyle(Object, Value)
		end,
	},
	{
		Properties = {"ColorTag"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local WindowClass = Data.WindowClass
			local Class = Data.Class
			local NoTheme = Class.NoTheme

			if not WindowClass then return end
			if NoTheme then return end

			local Theme = WindowClass.Theme

			ReGui:UpdateColors({
				Object = Object,
				Tag = Value,
				NoAnimation = true,
				Theme = Theme,
			})
		end,
	},
	{
		Properties = {"Animation"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local NoAnimation = Data.Class.NoAnimation
			if NoAnimation then return end

			ReGui:SetAnimation(Object, Value)
		end,
	},
	{
		Properties = {"Icon", "IconSize", "IconRotation"},
		Callback = function<StyleFunc>(Data, Object, Value)
			--// Locate icon element
			local Icon = Object:FindFirstChild("Icon", true)
			if not Icon then 
				return warn("No icon for", Object) 
			end 

			local Class = Data.Class
			ReGui:CheckConfig(Class, {
				Icon = "",
				IconSize = UDim2.fromScale(1,1),
				IconRotation = 0
			})

			--// Unpack configuration
			local Size = Class.IconSize
			local Image = Class.Icon
			local Rotation = Class.IconRotation

			Image = ReGui:CheckAssetUrl(Image)

			ReGui:SetProperties(Icon, {
				Visible = Value and true,
				Image = Image,
				Size = Size,
				Rotation = Rotation
			})
		end,
	},
	{
		Properties = {"BorderThickness", "Border", "BorderColor"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local Class = Data.Class
			local Enabled = Class.Border == true

			ReGui:CheckConfig(Class, {
				BorderThickness = Enabled and 1 or 0,
				BorderStrokeMode = Enum.ApplyStrokeMode.Border
			})

			--// Apply properties to UIStroke
			local Stroke = ReGui:GetChildOfClass(Object, "UIStroke")
			ReGui:SetProperties(Stroke, {
				Thickness = Class.BorderThickness,
				Color = Class.BorderColor,
				ApplyStrokeMode = Class.BorderStrokeMode,
				Enabled = Enabled
			})
		end,
	},
	{
		Properties = {"Ratio"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local Class = Data.Class

			ReGui:CheckConfig(Class, {
				Ratio = 4/3,
				RatioAxis = Enum.DominantAxis.Height,
				RatioAspectType = Enum.AspectType.ScaleWithParentSize
			})

			--// Unpack data
			local AspectRatio = Class.Ratio
			local Axis = Class.RatioAxis
			local AspectType = Class.RatioAspectType

			local Ratio = ReGui:GetChildOfClass(Object, "UIAspectRatioConstraint")
			ReGui:SetProperties(Ratio, {
				DominantAxis = Axis,
				AspectType = AspectType,
				AspectRatio = AspectRatio
			})
		end,
	},
	{
		Properties = {"FlexMode"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local FlexItem = ReGui:GetChildOfClass(Object, "UIFlexItem")
			FlexItem.FlexMode = Value
		end,
	},
	{
		Recursive = true,
		Properties = {"CornerRadius"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local UICorner = ReGui:GetChildOfClass(Object, "UICorner")
			UICorner.CornerRadius = Value
		end,
	},
	{
		Properties = {"Fill"},
		Callback = function<StyleFunc>(Data, Object, Value)
			if Value ~= true then return end

			local Class = Data.Class

			ReGui:CheckConfig(Class, {
				Size = UDim2.fromScale(1, 1),
				UIFlexMode = Enum.UIFlexMode.Fill,
				AutomaticSize = Enum.AutomaticSize.None
			})

			--// Create FlexLayout property
			local Flex = ReGui:GetChildOfClass(Object, "UIFlexItem")
			Flex.FlexMode = Class.UIFlexMode

			Object.Size = Class.Size
			Object.AutomaticSize = Class.AutomaticSize
		end,
	},
	{
		Properties = {"Label"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local Label = Object:FindFirstChild("Label")
			if not Label then return end

			local Class = Data.Class
			function Class:SetLabel(Text)
				Label.Text = Text
				return Class
			end

			Label.Text = tostring(Value)
		end,
	},
	{
		Properties = {"NoGradient"},
		WindowProperties = {"NoGradients"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local UIGradient = Object:FindFirstChildOfClass("UIGradient")
			if not UIGradient then return end

			UIGradient.Enabled = Value
		end,
	},
	{
		Properties = {
			"UiPadding", 
			"PaddingBottom", 
			"PaddingTop",
			"PaddingRight", 
			"PaddingTop"
		},
		Callback = function<StyleFunc>(Data, Object, Value)
			Value = Value or 0

			local Class = Data.Class
			ReGui:CheckConfig(Class, {
				PaddingBottom = UDim.new(0, Value),
				PaddingLeft = UDim.new(0, Value),
				PaddingRight = UDim.new(0, Value),
				PaddingTop = UDim.new(0, Value),
			})

			local UIPadding = ReGui:GetChildOfClass(Object, "UIPadding")
			ReGui:SetProperties(UIPadding, {
				PaddingBottom = Class.PaddingBottom,
				PaddingLeft = Class.PaddingLeft,
				PaddingRight = Class.PaddingRight,
				PaddingTop = Class.PaddingTop,
			})
		end,
	},
	{
		Properties = {"Callback"},
		Callback = function<StyleFunc>(Data, Object)
			local Class = Data.Class

			function Class:SetCallback(NewCallback)
				Class.Callback = NewCallback
				return Class
			end
			function Class:FireCallback(NewCallback)
				Class.Callback(Object)
				return Class
			end
		end,
	},
	{
		Properties = {"Value"},
		Callback = function<StyleFunc>(Data, Object)
			local Class = Data.Class
			ReGui:CheckConfig(Class, {
				GetValue = function(self)
					return Class.Value
				end,
			})
		end,
	}
}

--// Compatibility 
local EmptyFunction = function() end
local GetHiddenUI = get_hidden_gui or gethui
local NewReference = cloneref or function(Ins): Instance 
	return Ins 
end

--// Service handlers
local Services = setmetatable({}, {
	__index = function(self, Name: string)
		local Service = game:GetService(Name)
		return NewReference(Service)
	end,
})

--// Core functions 
--// Services
local Players: Players = Services.Players
local CoreGui = Services.CoreGui
local UserInputService = Services.UserInputService
local TweenService = Services.TweenService

--// Local player
local LocalPlayer = Players.LocalPlayer
ReGui.PlayerGui = LocalPlayer.PlayerGui
ReGui.Mouse = LocalPlayer:GetMouse()

--// Lexer service


--// Animation class
local Animation = ReGui.Animation

type AnimationTween = {
	Object: Instance,
	NoAnimation: boolean?,
	Tweeninfo: TweenInfo?,
	EndProperties: {},
	Completed: (() -> any?)?
}
function Animation:Tween(Data: AnimationTween): Tween?
	local DefaultTweenInfo = self.DefaultTweenInfo

	--// Unpack animation data for the Tween
	local Object = Data.Object
	local NoAnimation = Data.NoAnimation
	local Tweeninfo = Data.Tweeninfo or DefaultTweenInfo
	local EndProperties = Data.EndProperties
	local StartProperties = Data.StartProperties
	local Completed = Data.Completed

	--// Apply Start Properties to the object
	if StartProperties then
		ReGui:SetProperties(Object, StartProperties)
	end

	--// Set properties without a tween for NoAnimation flag
	if NoAnimation then
		ReGui:SetProperties(Object, EndProperties)

		--// Invoke Completed event
		if Completed then
			Completed()
		end

		return
	end

	--// Create the tween animation
	local MasterTween = nil

	for Key, Value in next, EndProperties do
		local Properties = {
			[Key] = Value
		}

		--// Create the tween for the property
		local Success, Tween = pcall(function()
			return TweenService:Create(Object, Tweeninfo, Properties)
		end)

		--// Set Properties instead of tweening
		if not Success then
			ReGui:SetProperties(Object, Properties)
			continue
		end

		--// Set the MasterTween if it does not exist
		if not MasterTween then
			MasterTween = Tween
		end

		Tween:Play()
	end

	--// Connect the TweenCompleted event
	if Completed then
		if MasterTween then
			MasterTween.Completed:Connect(Completed)
		else
			Completed()
		end
	end

	return MasterTween
end

type Animate = {
	NoAnimation: boolean?,
	Objects: {},
	Tweeninfo: TweenInfo?,
	Completed: () -> any,
}
function Animation:Animate(Data: Animate): Tween
	local NoAnimation = Data.NoAnimation
	local Objects = Data.Objects
	local Tweeninfo = Data.Tweeninfo
	local Completed = Data.Completed

	local BaseTween = nil

	--// Create tweens
	for Object, EndProperties in next, Objects do
		local Tween = self:Tween({
			NoAnimation = NoAnimation,
			Object = Object,
			Tweeninfo = Tweeninfo, 
			EndProperties = EndProperties
		})

		if not BaseTween then
			BaseTween = Tween
		end
	end

	--// Connect completed event call
	if Completed then
		BaseTween.Completed:Connect(Completed)
	end

	return BaseTween
end

type HeaderCollapseToggle = {
	Rotations: {
		Open: number?,
		Closed: number?
	},
	Toggle: GuiObject,
	NoAnimation: boolean?,
	Collapsed: boolean
}
function Animation:HeaderCollapseToggle(Data: HeaderCollapseToggle)
	--// Check configuration
	ReGui:CheckConfig(Data, {
		Rotations = {
			Open = 90,
			Closed = 0
		}
	})

	--// Unpack configuration
	local Toggle = Data.Toggle
	local NoAnimation = Data.NoAnimation
	local Rotations = Data.Rotations
	local Collapsed = Data.Collapsed

	local Rotation = Collapsed and Rotations.Closed or Rotations.Open

	--// Animate toggle
	self:Tween({
		NoAnimation = NoAnimation,
		Object = Toggle,
		EndProperties = {
			Rotation = Rotation,
		}
	})
end

type HeaderCollapse = {
	Collapsed: boolean,
	ClosedSize: UDim2,
	OpenSize: UDim2,
	Toggle: Instance,
	Resize: Instance?,
	Hide: Instance?,
	NoAnimation: boolean?,
	NoAutomaticSize: boolean?,
	IconOnly: boolean?,
	Completed: (() -> any)?,
	IconRotations: {
		Open: number?,
		Closed: number?
	}
}
function Animation:HeaderCollapse(Data: HeaderCollapse): Tween
	--// Unpack config
	local Collapsed = Data.Collapsed
	local ClosedSize = Data.ClosedSize
	local OpenSize: UDim2 = Data.OpenSize
	local Toggle = Data.Toggle
	local Resize = Data.Resize
	local Hide = Data.Hide
	local NoAnimation = Data.NoAnimation
	local NoAutomaticSize = Data.NoAutomaticSize
	local Rotations = Data.IconRotations
	local Completed = Data.Completed

	--// Apply base properties
	if not NoAutomaticSize then
		Resize.AutomaticSize = Enum.AutomaticSize.None
	end
	if not Collapsed then
		Hide.Visible = true
	end

	--// Build and play animation keyframes
	self:HeaderCollapseToggle({
		Collapsed = Collapsed,
		NoAnimation = NoAnimation,
		Toggle = Toggle,
		Rotations = Rotations
	})

	local Tween = self:Tween({
		NoAnimation = NoAnimation,
		Object = Resize,
		StartProperties = {
			Size = Collapsed and OpenSize or ClosedSize
		},
		EndProperties = {
			Size = Collapsed and ClosedSize or OpenSize
		},
		Completed = function()
			Hide.Visible = not Collapsed

			--// Invoke completed callback function
			if Completed then 
				Completed() 
			end

			--// Reset AutomaticSize after animation
			if Collapsed then return end
			if NoAutomaticSize then return end

			--// Reset sizes of the object
			Resize.Size = UDim2.fromScale(1, 0)
			Resize.AutomaticSize = Enum.AutomaticSize.Y
		end,
	})

	return Tween
end

function Merge(Base, New)
	for Key, Value in next, New do
		Base[Key] = Value
	end
end

function Copy(Original: table, Insert: table?)
	local Table = table.clone(Original)
	
	--// Insert values
	if Insert then
		Merge(Table, Insert)
	end
	
	return Table
end

function NewClass(Base)
	Base.__index = Base
	return setmetatable({}, Base)
end

function ReGui:Init(Overwrites)
	--// Check if the library has already initalised
	if self.AlreadyRan then return end
	self.AlreadyRan = true

	--// Merge overwrites
	Overwrites = Overwrites or {}
	Merge(self, Overwrites)

	--// Fetch folders
	self:CheckConfig(self, {
		ContainerParent = function()
			return self:ResolveContainerParent()
		end,
		Prefabs = function()
			return self:LoadPrefabs()
		end,
	}, true)

	--// Fetch required assets
	self:CheckConfig(self, {
		Container = function()
			return self:InsertPrefab("Container", {
				Parent = self.ContainerParent,
				Name = self.ContainerName
			})
		end,
	}, true)

	--// WindowActiveStates event
	UserInputService.InputBegan:Connect(function(Input)
		if not self:IsMouseEvent(Input) then return end

		self:UpdateWindowFocuses()
	end)

	--self.FullScreenGui = ReGui:CreateInstance("ScreenGui", GuiParent, {
	--	DisplayOrder = 99999,
	--	ResetOnSpawn = false,
	--	ScreenInsets = Enum.ScreenInsets.None
	--})
end

function ReGui:GetVersion(): string
	return self.Version
end

function ReGui:LoadPrefabs(): Folder?
	local PlayerGui = self.PlayerGui
	local Name = "ReGui-Prefabs"

	--// Check script for prefabs
	local ScriptUi = script:WaitForChild(Name, 2)
	if ScriptUi then return ScriptUi end

	--// Check PlayerGui for prefabs (Studio Debug)
	local PlayerUI = PlayerGui:WaitForChild(Name, 2)
	if PlayerUI then return PlayerUI end

	return nil
end

function ReGui:ResolveContainerParent(): GuiObject?
	local PlayerGui = self.PlayerGui
	local Debug = self.Debug

	local Steps = {
		[1] = function()
			return GetHiddenUI()
		end,
		[2] = function()
			return CoreGui:FindFirstChild('RobloxGui')
		end,
		[3] = function()
			return CoreGui
		end,
		[4] = function()
			return PlayerGui
		end
	}

	local Test = self:CreateInstance("ScreenGui")

	--// Test each step for a successful parent
	for Step, CreateFunc in next, Steps do
		local Success, Parent = pcall(CreateFunc)
		if not Success then continue end

		--// Test parenting
		local CanParent = pcall(function()
			Test.Parent = Parent
		end)
		if not CanParent then continue end

		if Debug then
			warn(`Step: {Step} was chosen as the parent!: {Parent}`)
		end

		return Parent
	end

	--// Error message
	warn("The ReGui container does not have a parent defined")

	return nil
end

function ReGui:CheckConfig(Source, Base, Call: boolean?)
	if not Source then return end 

	for Key: string?, Value in next, Base do
		if Source[Key] ~= nil then continue end

		--// Call value function
		if Call then
			Value = Value()
		end

		--// Set value
		Source[Key] = Value
	end

	return Source
end

function ReGui:CheckAssetUrl(Url: (string|number)): string
	--// Convert Id number to asset URL
	if tonumber(Url) then
		return `rbxassetid://{Url}`
	end

	return Url
end

function ReGui:CreateInstance(Class, Parent, Properties): Instance
	local Instance = Instance.new(Class, Parent)

	--// Apply Properties
	if Properties then
		ReGui:SetProperties(Instance, Properties)
	end

	return Instance
end

function ReGui:GetAnimation(Animate: boolean?)
	return Animate and self.Animation or TweenInfo.new(0)
end

function ReGui:GetDictSize(Dict: table): number
	local Count = 0
	for Key, Value in Dict do
		Count += 1
	end
	return Count
end

function ReGui:RemoveAnimationSignals(Object: GuiObject)
	local AllConnections = self.AnimationConnections

	local Connections = AllConnections[Object]
	if not Connections then return end 

	--// Disconnect each connection 
	for _, Connection in next, Connections do
		Connection:Disconnect()
	end
end

function ReGui:AddAnimationSignal(Object: GuiObject, Connection: RBXScriptSignal)
	local AllConnections = self.AnimationConnections

	--// Create signals array for Object
	local Connections = AllConnections[Object]
	if not Connections then
		Connections = {}
		AllConnections[Object] = Connections
	end

	table.insert(Connections, Connection)
end

function ReGui:SetAnimation(Object: GuiObject, Reference: string, Listener: GuiObject?)
	Listener = Listener or Object

	local Animations = self.Animations

	local Data = Animations[Reference]
	assert(Data, `No animation data for Class {Reference}!`)

	--// Disconnect previous
	self:RemoveAnimationSignals(Listener)

	local Init = Data.Init
	local Connections = Data.Connections
	local Tweeninfo = Data.Tweeninfo
	local NoAnimation = Data.NoAnimation

	--// Connect signals
	local InitFunc = nil
	for SignalName: string, Properties in next, Connections do
		local function OnSignal(NoAnim: boolean?)
			NoAnim = NoAnim == true --// Convert to boolean

			Animation:Tween({
				NoAnimation = NoAnim or NoAnimation,
				Object = Object,
				Tweeninfo = Tweeninfo, 
				EndProperties = Properties
			})
		end

		--// Connect animation to signal
		local Signal = Listener[SignalName]
		local Connection = Signal:Connect(OnSignal)

		--// Collect signal into array
		self:AddAnimationSignal(Listener, Connection)

		--// Call init connection
		if SignalName == Init then
			InitFunc = OnSignal
		end
	end

	--// Reset colors function
	if InitFunc then
		InitFunc(true)
	end
end

function ReGui:GetChildOfClass(Object: GuiObject, ClassName: string): GuiObject
	local Child = Object:FindFirstChildOfClass(ClassName)

	--// Create missing child
	if not Child then
		Child = self:CreateInstance(ClassName, Object)
	end

	return Child
end

export type ConnectDrag = {
	DragStart: () -> nil,
	DragEnd: () -> nil,
	DragMovement: () -> nil,
}
function ReGui:ConnectDrag(Frame: GuiObject, Data)
	self:CheckConfig(Data, {
		DragStart = EmptyFunction,
		DragEnd = EmptyFunction,
		DragMovement = EmptyFunction,
	})
	
	--// Unpack Configuration
	local DragStart = Data.DragStart
	local DragEnd = Data.DragEnd
	local DragMovement = Data.DragMovement
	
	--// Whitelist
	local UserInputTypes = {
		Enum.UserInputType.MouseButton1,
		Enum.UserInputType.Touch
	}
	
	local Dragging = false
	
	local function UserInputTypeAllowed(InputType: Enum.UserInputType)
		return table.find(UserInputTypes, InputType)
	end
	
	local function CanDrag(Key): boolean?
		if not UserInputTypeAllowed(Key.UserInputType) then return end
		return true
	end
	local function KeyToVector(Key): Vector2
		local InputPosition = Key.Position
		local InputVector = Vector2.new(InputPosition.X, InputPosition.Y)
		return InputVector
	end

	--// DragDetector event functions
	local function _DragStart(Key)
		if not CanDrag(Key) then return end
		local InputVector = KeyToVector(Key)
		
		Dragging = true
		DragStart(InputVector)
	end
	local function _DragEnd(Key)
		if not Dragging then return end
		local InputVector = KeyToVector(Key)
		
		Dragging = false
		DragEnd(InputVector)
	end
	local function _DragMovement(Key)
		if not Dragging then return end
		
		local InputVector = KeyToVector(Key)
		DragMovement(InputVector)
	end
	
	--// Connect movement events
	Frame.InputBegan:Connect(_DragStart)
	UserInputService.InputEnded:Connect(_DragEnd)
	UserInputService.TouchMoved:Connect(_DragMovement)
	UserInputService.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then 
			return _DragMovement(Input)
		end
	end)
end

type MakeDraggableFlags = {
	Move: Instance,
	Grab: Instance,
	Enabled: boolean?,
	OnUpdate: ((Vector2) -> ...any)?,
	DragBegin: ((InputObject) -> ...any)?,
	StateChanged: ((MakeDraggableFlags) -> any)?
}
function ReGui:MakeDraggable(Config: MakeDraggableFlags)
	self:CheckConfig(Config, {
		Enabled = true
	})

	--// Unpack config
	local Move = Config.Move
	local Grab = Config.Grab
	local Enabled = Config.Enabled

	local PositionOrgin = nil
	local InputOrgin = nil

	--// Interface
	local Interface = {}
	function Interface:SetEnabled(State: boolean)
		local StateChanged = Config.StateChanged
		self.Enabled = State
		--DragDetector.Enabled = State

		--// Invoke the state changed callback function
		if StateChanged then 
			StateChanged(self)
		end
	end
	function Interface:CanDrag(Key)
		if not self.Enabled then return end
		return true
	end

	--// DragDetector event functions
	local function DragStart(InputVector)
		if not Interface:CanDrag() then return end
		
		local DragBegin = Config.DragBegin
		InputOrgin = InputVector

		DragBegin(InputOrgin)
	end
	local function DragMovement(InputVector)
		local Delta = InputVector - InputOrgin
		local OnUpdate = Config.OnUpdate

		OnUpdate(Delta)
	end

	--// Movement functions
	local function PositionBegan(Key)
		PositionOrgin = Move.Position
	end
	local function UpdatePosition(Delta)
		local Position = UDim2.new(
			PositionOrgin.X.Scale, 
			PositionOrgin.X.Offset + Delta.X, 
			PositionOrgin.Y.Scale, 
			PositionOrgin.Y.Offset + Delta.Y
		)

		--// Tween frame element to the new size
		Animation:Tween({
			Object = Move,
			EndProperties = {
				Position = Position
			}
		})
	end

	--// Check configuration
	self:CheckConfig(Config, {
		OnUpdate = UpdatePosition,
		DragBegin = PositionBegan
	})
	
	--// Connect movement events
	self:ConnectDrag(Grab, {
		DragStart = DragStart,
		DragMovement = DragMovement,
	})

	--// Set enabled state
	Interface:SetEnabled(Enabled)

	return Interface
end

--type MakeDraggableFlags = {
--	Move: Instance,
--	Grab: Instance,
--	Enabled: boolean?,
--	OnUpdate: ((Vector2) -> ...any)?,
--	DragBegin: ((InputObject) -> ...any)?,
--	StateChanged: ((MakeDraggableFlags) -> any)?
--}
--function ReGui:MakeDraggable(Config: MakeDraggableFlags)
--	self:CheckConfig(Config, {
--		Enabled = true
--	})

--	--// Unpack config
--	local Move = Config.Move
--	local Grab = Config.Grab
--	local Enabled = Config.Enabled

--	local PositionOrgin = nil
--	local InputOrgin = nil

--	local DragDetector = ReGui:GetChildOfClass(Grab, "UIDragDetector")

--	--// Interface
--	local Interface = {}
--	function Interface:SetEnabled(State: boolean)
--		local StateChanged = Config.StateChanged
--		self.Enabled = State
--		DragDetector.Enabled = State

--		--// Invoke the state changed callback function
--		if StateChanged then 
--			StateChanged(self)
--		end
--	end

--	--// DragDetector event functions
--	local function DragStart(InputPosition)
--		local DragBegin = Config.DragBegin
--		InputOrgin = InputPosition

--		DragBegin(InputPosition)
--	end
--	local function DragMovement(InputPosition)
--		local Delta = InputPosition - InputOrgin
--		local OnUpdate = Config.OnUpdate

--		OnUpdate(Delta)
--	end

--	--// Movement functions
--	local function PositionBegan(InputPosition)
--		PositionOrgin = Move.Position
--	end
--	local function UpdatePosition(Delta)
--		local Position = UDim2.new(
--			PositionOrgin.X.Scale, 
--			PositionOrgin.X.Offset + Delta.X, 
--			PositionOrgin.Y.Scale, 
--			PositionOrgin.Y.Offset + Delta.Y
--		)

--		--// Tween frame element to the new size
--		Animation:Tween({
--			Object = Move,
--			EndProperties = {
--				Position = Position
--			}
--		})
--	end

--	--// Check configuration
--	self:CheckConfig(Config, {
--		OnUpdate = UpdatePosition,
--		DragBegin = PositionBegan
--	})

--	--// Connect movement events
--	DragDetector.DragStart:Connect(DragStart)
--	DragDetector.DragContinue:Connect(DragMovement)

--	--// Set enabled state
--	Interface:SetEnabled(Enabled)

--	return Interface
--end

export type MakeResizableFlags = {
	MinimumSize: Vector2,
	MaximumSize: Vector2?,
	--Grab: Instance,
	Resize: Instance,
	OnUpdate: (UDim2) -> ...any
}
function ReGui:MakeResizable(Config: MakeResizableFlags)
	ReGui:CheckConfig(Config, {
		MinimumSize = Vector2.new(160, 90),
		MaximumSize = Vector2.new(math.huge, math.huge)
	})

	--// Unpack config
	local MaximumSize = Config.MaximumSize
	local MinimumSize = Config.MinimumSize
	local Resize = Config.Resize
	local OnUpdate = Config.OnUpdate

	local SizeOrgin = nil

	--// Create grab element
	local Grab = ReGui:InsertPrefab("ResizeGrab", {
		Parent = Resize
	})

	local function StateChanged(Interface)
		Grab.Visible = Interface.Enabled
	end

	--// Resize functions
	local function UpdateSize(Delta)
		local NewSize = SizeOrgin + Delta

		--// Clamp size
		local Size = UDim2.fromOffset(
			math.clamp(NewSize.X, MinimumSize.X, MaximumSize.X), 
			math.clamp(NewSize.Y, MinimumSize.Y, MaximumSize.Y)
		)

		--// Call update function instead of tweening
		if OnUpdate then
			OnUpdate(Size)
			return
		end

		--// Tween frame element to the new size
		Animation:Tween({
			Object = Resize,
			EndProperties = {
				Size = Size
			}
		})
	end
	local function ResizeBegin(InputPosition)
		SizeOrgin = Resize.AbsoluteSize
	end

	--// Connect movement events
	local DragDetection = self:MakeDraggable({
		Grab = Grab,
		OnUpdate = UpdateSize,
		DragBegin = ResizeBegin,
		StateChanged = StateChanged
	})

	DragDetection.Grab = Grab

	return DragDetection
end

function ReGui:IsMouseEvent(Input)
	local Name = Input.UserInputType.Name
	return Name:find("Touch") or Name:find("Mouse")
end

export type ConnectHover = {
	OnInput: ((boolean, InputObject?) -> ...any?)?,
	Anykey: boolean?,
	MouseMove: boolean?,
	MouseOnly: boolean?,
	MouseEnter: boolean?,
	Hovering: boolean?,
}
function ReGui:ConnectHover(Object: GuiObject, Config: ConnectHover)
	Config = Config or {}

	--// Unpack configuration
	local OnInput = Config.OnInput
	local Anykey = Config.Anykey
	local MouseMove = Config.MouseMove
	local MouseEnter = Config.MouseEnter
	local MouseOnly = Config.MouseOnly

	Config.Hovering = false

	local function Update(Input, IsHovering: boolean?, IsMouseEvent: boolean?)
		--// Check if the input is mouse or touch
		if Input and MouseOnly then
			if not ReGui:IsMouseEvent(Input) then return end
		end

		--// Update data
		if IsHovering ~= nil then
			Config.Hovering = IsHovering
		end

		--// Mouse Enter events
		if not MouseEnter and IsMouseEvent then return end

		--// Call OnInput function
		if OnInput then
			local Value = Config.Hovering
			return OnInput(Value, Input)
		end
	end

	--// Connect Events
	local Connections = {
		Object.MouseEnter:Connect(function()
			Update(nil, true, true)
		end),
		Object.MouseLeave:Connect(function()
			Update(nil, false, true)
		end)
	}

	--// Update on keyboard events or Mouse eveents
	if Anykey or MouseOnly then
		table.insert(Connections, UserInputService.InputBegan:Connect(function(Input)
			Update(Input)
		end))
	end

	--// Update on mouse move
	if MouseMove then
		local Connection = Object.MouseMoved:Connect(Update)
		table.insert(Connections, Connection)
	end

	function Config:Disconnect()
		for _, Connection in next, Connections do
			Connection:Disconnect()
		end
	end

	return Config
end

function ReGui:StackWindows()
	local Windows = self.Windows
	local Offset = 20

	for Index, Class in next, Windows do
		local Window = Class.WindowFrame

		local Position = UDim2.fromOffset(Offset*Index, Offset*Index)

		Class:Center()
		Window.Position += Position
	end
end

type UpdateColors = {
	Config: Instance,
	Tag: string,
	Animate: boolean?,
}
function ReGui:UpdateColors(Config)
	--// Unpack global configuration
	local ElementColors = self.ElementColors
	local Themes = self.ThemeConfigs
	local Debug = self.Debug

	local BaseTheme = Themes.DarkTheme

	--// Unpack config
	local Object = Config.Object
	local Tag = Config.Tag
	local NoAnimation = Config.NoAnimation
	local Elements = Config.TagsList
	local SelectedTheme = Config.Theme

	local Theme = Themes[SelectedTheme] or BaseTheme

	local Coloring = ElementColors[Tag]

	--// Add element to the Element tag list
	if Elements then
		Elements[Object] = Tag
	end

	if typeof(Tag) == "table" then
		Coloring = Tag
	end

	--// Check if coloring data exists
	if not Coloring then return end

	--// Add coloring data to properties
	local Properties = {}
	for Key: string, Name: string in next, Coloring do
		local Color = Theme[Name] or BaseTheme[Name]

		if not Color then 
			if Debug then
				warn(`Color: '{Name}' does not exist!`)
			end
			continue 
		end

		Properties[Key] = Color
	end

	--// Tween new properties
	Animation:Tween({
		Object = Object,
		NoAnimation = NoAnimation,
		EndProperties = Properties
	})
end

function ReGui:MultiUpdateColors(Config)
	local Objects = Config.Objects

	for Object: GuiObject, Tag: string? in next, Objects do
		self:UpdateColors({
			TagsList = Config.TagsList,
			Theme = Config.Theme,
			NoAnimation = not Config.Animate,

			Object = Object,
			Tag = Tag,
		})
	end
end

function ReGui:ApplyStyle(Object: GuiObject, StyleName: string)
	local Styles = self.Styles

	local Style = Styles[StyleName]
	if not Style then return end

	--// Apply style properties
	self:ApplyFlags({
		Object = Object,
		Class = Style
	})
end

function ReGui:MergeMetatables(Class, Object: GuiObject)
	local Debug = self.Debug
	local Metadata = {}

	Metadata.__index = function(self, Key: string)
		--// Fetch value from class
		local Value = Class[Key]

		if Value ~= nil then return Value end

		--// Fetch value from Object
		local Success, Value = pcall(function()
			return Object[Key]
		end)

		if Success then
			--// Patch 'self'
			if typeof(Value) == "function" then
				return function(_, ...)
					return Value(Object, ...)
				end
			end

			return Value
		end

		return nil
	end

	Metadata.__newindex = function(self, Key: string, Value)
		local IsClassValue = Class[Key] ~= nil or typeof(Value) == "function"

		if IsClassValue then
			Class[Key] = Value
			return
		end

		xpcall(function()
			Object[Key] = Value
		end, function(err)
			if Debug then
				warn(`Newindex Error: {Object}.{Key} = {Value}\n{err}`)
			end

			Class[Key] = Value
		end)
	end

	return setmetatable({}, Metadata)
end

function ReGui:Concat(Table, Separator: " ") 
	local Concatenated = ""
	for Index, String in next, Table do
		Concatenated ..= tostring(String) .. (Index ~= #Table and Separator or "")
	end
	return Concatenated
end

function ReGui:GetValueFromAliases(Aliases, Table)
	for _, Alias: string in Aliases do
		local Value = Table[Alias]
		if Value ~= nil then
			return Value
		end
	end

	return nil
end

function ReGui:RecursiveCall(Object: GuiObject, Func: (GuiObject)->...any)
	for _, Child in next, Object:GetDescendants() do
		Func(Child)
	end
end

export type ApplyFlags = {
	Object: Instance,
	Class: table,
	WindowClass: table?
}
function ReGui:ApplyFlags(Config: ApplyFlags)
	local Properties = self.ElementFlags

	--// Unpack config
	local Object = Config.Object
	local Class = Config.Class
	local WindowClass = Config.WindowClass

	--// Set base properties
	self:SetProperties(Object, Class)

	--// Check for callbacks
	for _, Flag in next, Properties do
		local Aliases = Flag.Properties
		local Callback = Flag.Callback
		local Recursive = Flag.Recursive
		local WindowFlags = Flag.WindowProperties

		--// Find value from element class
		local Value = self:GetValueFromAliases(Aliases, Class)

		--// Find value from window class
		if WindowClass and WindowFlags and Value == nil then
			Value = self:GetValueFromAliases(WindowFlags, WindowClass)
		end

		if Value == nil then continue end

		--// Apply flag
		Callback(Config, Object, Value)

		--// Recursively apply flag
		if Recursive then
			self:RecursiveCall(Object, function(Child)
				Callback(Config, Child, Value)
			end)
		end
	end
end

function ReGui:SetProperties(Object: Instance, Properties)
	for Key: string, Value in next, Properties do
		pcall(function()
			Object[Key] = Value
		end)
	end
end

function ReGui:InsertPrefab(Name: string, Properties): Instance
	local Folder = self.Prefabs
	local Prefabs = Folder.Prefabs

	local Element = Prefabs:WaitForChild(Name)
	local New = Element:Clone()

	--// Apply properties
	if Properties then 
		local UseProps = Properties.UsePropertiesList

		if not UseProps then
			self:SetProperties(New, Properties)
		else
			self:ApplyFlags({
				Object = New,
				Class = Properties
			})
		end
	end

	return New
end

function ReGui:GetContentSize(Object: GuiObject): Vector2
	local UIListLayout = Object:FindFirstChildOfClass("UIListLayout")
	local UIPadding = Object:FindFirstChildOfClass("UIPadding")

	local ContentSize

	--// Fetch absolute size
	if UIListLayout then
		ContentSize = UIListLayout.AbsoluteContentSize
	else
		ContentSize = Object.AbsoluteSize
	end

	--// Apply padding
	if UIPadding then
		local Top = UIPadding.PaddingTop.Offset
		local Bottom = UIPadding.PaddingBottom.Offset

		local Left = UIPadding.PaddingLeft.Offset
		local Right = UIPadding.PaddingRight.Offset

		ContentSize += Vector2.new(Left+Right, Top+Bottom)
	end

	return ContentSize
end

type MakeCanvas = {
	Element: Instance,
	WindowClass: WindowClass?,
	Class: {}?
}
function ReGui:MakeCanvas(Config: MakeCanvas)
	--// Unpack ReGui data
	local ElementsClass = self.Elements
	local Debug = self.Debug

	--// Unpack configuration
	local Element = Config.Element
	local WindowClass = Config.WindowClass
	local Class = Config.Class

	--// Debug report
	if not WindowClass and Debug then
		warn(`No WindowClass for {Element}`)
		print(Config)
	end

	--// Create new canvas class
	local Canvas = NewClass(ElementsClass)
	Canvas.ParentCanvas = Element
	Canvas.WindowClass = WindowClass or false

	--// Create metatable merge
	local Meta = {
		__index = function(_, Key: string)
			--// Check Canvas class for value
			local CanvasValue = Canvas[Key]
			if CanvasValue ~= nil then 
				return CanvasValue 
			end

			--// Check class for value
			local ClassValue = Class[Key]
			if ClassValue ~= nil then 
				return ClassValue 
			end

			--// Fetch value from Element
			return Element[Key]
			--local Success, ElementValue = pcall(function()
			--	return Element[Key]
			--end)

			--if Success then
			--	return ElementValue
			--end

			--return nil
		end,
		__newindex = function(self, Key: string, Value)
			local IsClassValue = Class[Key] ~= nil

			--// Update key value
			if IsClassValue then
				Class[Key] = Value
			else
				Element[Key] = Value
			end
		end,
	}

	return setmetatable({}, Meta)
end

type WrapGeneration = {
	Base: table,
}
function ReGui:WrapGeneration(Function, Data: WrapGeneration)
	local Base = Data.Base

	return function(Canvas, Flags, ...)
		Flags = Flags or {}

		--// Check Flags with Base flags from the Element
		self:CheckConfig(Flags, Base)

		--// Get generation flags
		local CloneTable = Flags.CloneTable

		--// Clone configuration table flag
		if CloneTable then
			Flags = table.clone(Flags)
		end

		local WindowClass = Canvas.WindowClass
		local Parent = Canvas.ParentCanvas

		--// Check flags again as the element generation may have modified
		self:CheckConfig(Flags, {
			Parent = Parent,
			Name = Flags.ColorTag
		})

		--// Create element and apply properties
		--local Class, Element = Function(Canvas, Flags, ...)
		local Success, Class, Element = pcall(Function, Canvas, Flags, ...)

		--// Check for errors
		if Success == false then
			--// Create visual error message
			if Canvas.Error then
				Canvas:Error({
					Parent = Parent,
					Text = Class
				})
			end

			warn("Class:", Class)
			error(debug.traceback())
		end

		--// Some elements may return the instance without a class
		if Element == nil then
			Element = Class
		end

		local NoAutoRegistor = Flags.NoAutoRegistor
		local NoAutoFlags = Flags.NoAutoFlags
		local ColorTag = Flags.ColorTag

		--// Load element into theme
		if Element then
			--// Registor element into WindowClass
			if not NoAutoRegistor and WindowClass then
				WindowClass:TagElements({
					[Element] = ColorTag
				})
			end

			--// Apply flags to the element
			if not NoAutoFlags then
				self:ApplyFlags({
					Object = Element,
					Class = Flags,
					WindowClass = WindowClass
				})
			end
		end

		return Class, Element
	end
end

function ReGui:DefineElement(Name: string, Data)
	local Elements = self.Elements
	local Themes = self.ThemeConfigs
	local ElementColors = self.ElementColors
	
	local BaseTheme = Themes.DarkTheme

	--// Element data
	local Base = Data.Base
	local Create = Data.Create
	local Export = Data.Export
	local ThemeTags = Data.ThemeTags
	local ColorData = Data.ColorData

	--// Add missing keys to base config
	self:CheckConfig(Base, {
		ColorTag = Name,
		ElementStyle = Name,
		Visible = true,
	})

	--// Declare new coloring variables into theme
	if ThemeTags then
		Merge(BaseTheme, ThemeTags)
	end

	--// Declare new ColorData
	if ColorData then
		Merge(ElementColors, ColorData)
	end

	--// Create element function wrap
	local Generate = self:WrapGeneration(Create, {
		Base = Base
	})

	--// Export creation function into ReGui dict
	if Export then
		self[Name] = Generate
	end

	--// Add element into the Elements class
	Elements[Name] = Generate

	return Generate
end

function ReGui:DefineGlobalFlag(Flag)
	local Flags = self.ElementFlags
	table.insert(Flags, Flag)
end

function ReGui:DefineTheme(Name: string, ThemeData: ThemeData)
	local Themes = self.ThemeConfigs
	Themes[Name] = ThemeData
end

function ReGui:GetMouseLocation()
	local Mouse = self.Mouse
	return Mouse.X, Mouse.Y
end

function ReGui:UpdateWindowFocuses()
	local Windows = self.Windows

	--// Update each window state
	for _, Class in Windows do
		local Connection = Class.HoverConnection

		--// Check hover state
		local Hovering = Connection.Hovering
		if Hovering then
			self:SetFocusedWindow(Class)
			return
		end
	end

	self:SetFocusedWindow(nil)
end

function ReGui:WindowCanFocus(WindowClass): boolean
	if WindowClass.NoSelect then return false end
	if WindowClass.Collapsed then return false end

	return true
end

function ReGui:SetFocusedWindow(ActiveClass)
	local Previous = self.ActiveWindow
	local Windows = self.Windows

	--// Check if the Active window is the same as previous
	if Previous == ActiveClass then return end
	self.ActiveWindow = ActiveClass

	--// Only update the window if the NoSelect flag is enabled
	if ActiveClass then
		local CanSelect = self:WindowCanFocus(ActiveClass)
		if not CanSelect then return end
	end

	--// Update active state for each window
	for _, Class in Windows do
		local CanSelect = self:WindowCanFocus(Class)

		--// Ignore NoSelect windows with NoSelect flag
		if not CanSelect then continue end

		--// Update Window state
		local Active = Class == ActiveClass
		Class:SetFocused(Active)
	end
end

function ReGui:SetTooltip(Tooltip: GuiObject)
	local Previous = self.Tooltip

	--// Check if the tooltip is the same as the previous
	if not Previous then return end
	if Previous == Tooltip then return end

	Previous.Visible = false

	--// Set new Tooltip
	self.Tooltip = Tooltip
end

function ReGui:SetItemTooltip(Object: GuiObject, Render: () -> ...any)
	local Elements = self.Elements
	local Container = self.Container

	--// Create tooltip
	local Tooltip = Elements:Tooltip({
		Visible = false,
		Parent = Container.Overlays
	})

	--// Create content
	task.spawn(Render, Tooltip)

	--// Connect events
	ReGui:ConnectHover(Object, {
		MouseMove = true,
		MouseEnter = true,
		OnInput = function(MouseHovering, Input)
			Tooltip:Update(MouseHovering)
		end,
	})
end

function ReGui:CheckFlags(Flags, Config)
	for Name, Func in next, Flags do
		local Value = Config[Name]
		if not Value then continue end

		Func(Value)
	end
end

--// Container class
local Elements = ReGui.Elements
Elements.__index = Elements

function Elements:GetParent()
	return self.ParentCanvas
end

function Elements:TagElements(Objects)
	local WindowClass = self.WindowClass

	if WindowClass then 
		WindowClass:TagElements(Objects)
	end
end

function Elements:SetColorTags(Objects, Animate)
	local WindowClass = self.WindowClass
	if not WindowClass then return end

	local Elements = WindowClass.TagsList
	local Theme = WindowClass.Theme

	ReGui:MultiUpdateColors({
		Animate = Animate,
		Theme = Theme,
		TagsList = Elements,
		Objects = Objects,
	})
end

ReGui:DefineElement("Dropdown", {
	Base = {
		Disabled = false,
		MaxSizeY = 220,
		OnClosed = EmptyFunction,
		OnSelected = EmptyFunction
	},
	Create = function(self, Config: Tooltip)
		Config.Parent = ReGui.Container.Overlays

		--// Unpack configuration
		local Selected = Config.Selected
		local Parent = Config.ParentObject
		local Items = Config.Items
		local MaxSizeY = Config.MaxSizeY
		local OnClosed = Config.OnClosed
		local OnSelected = Config.OnSelected

		if not Parent then return end

		--// Create overlay object
		local Canvas, Object = self:OverlayScroll(Config)
		local UIStroke = Object.UIStroke

		--// Get content size of parent
		local Padding = UIStroke.Thickness
		local Position = Parent.AbsolutePosition
		local Size = ReGui:GetContentSize(Parent)

		local Entries = {}
		local IsHovered

		--// Connect hover watch
		local Hover = ReGui:ConnectHover(Object, {
			MouseOnly = true,
			OnInput = function(MouseHovering, Input)
				if MouseHovering then return end
				Config:Close()
			end,
		})

		function Config:Close()
			if self.Disabled then return end

			Hover:Disconnect()
			Object:Remove()

			self.Disabled = true

			--// Invoke closed callback
			OnClosed()
		end

		local function SetValue(Value)
			Config:Close()

			--// Invoke selected callback
			OnSelected(Value)
		end

		--// Position dropdown
		Object.Position = UDim2.fromOffset(
			Position.X + Padding, 
			Position.Y + Size.Y
		)

		--// Append items
		for Index, Index2 in next, Items do
			local Value = typeof(Index) ~= "number" and Index or Index2
			local IsSelected = Index == Selected or Index2 == Selected

			--// Create button
			local Entry = Canvas:Button({
				Text = tostring(Value),
				Size = UDim2.fromScale(1, 0),
				ZIndex = 6,
			})

			--// Connect callback
			Entry.Activated:Connect(function()
				return SetValue(Value)
			end)

			--// Set animation
			ReGui:SetAnimation(Entry, IsSelected and "Buttons" or "TransparentButtons")

			table.insert(Entries, Entry)
		end

		--// Configure size of the frame
		-- Roblox does not support UISizeConstraint on a scrolling frame grr
		local Absolute = Canvas:GetCanvasSize()
		local YSize = math.clamp(Absolute.Y, Size.Y, MaxSizeY)
		Object.Size = UDim2.fromOffset(Size.X-Padding, YSize)

		return Config, Object
	end,
})

export type Tooltip = {
	Offset: number?
}
ReGui:DefineElement("Tooltip", {
	Base = {
		Offset = 15
	},
	Create = function(self, Config: Tooltip)
		--// Unpack configuration
		local Offset = Config.Offset

		--// Create content canvas
		local Overlay = self:Overlay(Config)
		local Class = ReGui:MergeMetatables(Config, Overlay)

		function Config:Update(Hovering: boolean)
			Overlay.Visible = Hovering

			--// If the tooltip is not visible
			if not Hovering then return end

			--// Set new tooltip
			ReGui:SetTooltip(Overlay)

			--// Set frame position to mosue location
			local X, Y = ReGui:GetMouseLocation()
			Overlay.Position = UDim2.fromOffset(
				X + Offset, 
				Y + Offset
			)
		end

		return Class, Overlay
	end,
})

ReGui:DefineElement("OverlayScroll", {
	Base = {},
	Create = function(self, Config)
		local WindowClass = self.WindowClass

		--// Create overlay object
		local Object = ReGui:InsertPrefab("OverlayScroll", Config)

		local ContentFrame = Object.ContentFrame

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = ContentFrame,
			WindowClass = WindowClass,
			Class = self
		})

		function Config:GetCanvasSize()
			return ContentFrame.AbsoluteCanvasSize
		end

		local Class = ReGui:MergeMetatables(Config, Canvas)
		return Class, Object
	end,
})

ReGui:DefineElement("Overlay", {
	Base = {},
	Create = function(self, Config)
		local WindowClass = self.WindowClass

		--// Create overlay object
		local Object = ReGui:InsertPrefab("Overlay", Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = self
		})

		return Canvas, Object
	end,
})

export type Image = {
	Image: (string|number),
	Callback: ((...any) -> unknown)?
}
ReGui:DefineElement("Image", {
	Base = {
		Image = "",
		Callback = EmptyFunction
	},
	Create = function(self, Config: Image): ImageButton
		--// Correct configuration
		local Image = Config.Image
		Config.Image = ReGui:CheckAssetUrl(Image)

		--// Create image object
		local Object = ReGui:InsertPrefab("Image", Config)
		Object.Activated:Connect(function(...)
			local Func = Config.Callback
			return Func(Object, ...)
		end)

		return Object
	end,
})

export type VideoPlayer = {
	Video: (string|number),
	Callback: ((...any) -> unknown)?
}
ReGui:DefineElement("VideoPlayer", {
	Base = {
		Video = "",
		Callback = EmptyFunction
	},
	Create = function(self, Config: VideoPlayer): VideoFrame
		--// Correct configuration
		local Video = Config.Video
		Config.Video = ReGui:CheckAssetUrl(Video)

		--// Create object
		local Object = ReGui:InsertPrefab("VideoPlayer", Config)
		return Object
	end,
})

export type Button = {
	Text: string?,
	Callback: ((...any) -> unknown)?,
}
ReGui:DefineElement("Button", {
	Base = {
		Text = "Button",
		Callback = EmptyFunction
	},
	Create = function(self, Config: Button): TextButton
		--// Create button object
		local Object = ReGui:InsertPrefab("Button", Config)
		Object.Activated:Connect(function(...)
			local Func = Config.Callback
			return Func(Object, ...)
		end)

		return Object
	end,
})

export type ImageButton = {
	Image: (string|number),
	Callback: ((...any) -> unknown)?
}
ReGui:DefineElement("ImageButton", {
	Base = {
		ElementStyle = "Button",
		Callback = EmptyFunction
	},
	Create = Elements.Image,
})

ReGui:DefineElement("SmallButton", {
	Base = {
		Text = "Button",
		PaddingTop = UDim.new(),
		PaddingBottom = UDim.new(),
		PaddingLeft = UDim.new(0, 2),
		PaddingRight = UDim.new(0, 2),
		ColorTag = "Button",
		ElementStyle = "Button",
		Callback = EmptyFunction,
	},
	Create = Elements.Button
})

export type Keybind = {
	Value: Enum.KeyCode?,
	DeleteKey: Enum.KeyCode?,
	Enabled: boolean?,
	IgnoreGameProcessed: boolean?,
	Callback: ((Enum.KeyCode) -> any)?,

	SetValue: ((Keybind, New: Enum.KeyCode) -> any)?,
	WaitForNewKey: ((Keybind) -> any)?,
}
ReGui:DefineElement("Keybind", {
	Base = {
		Label = "Keybind",
		Value = nil,
		DeleteKey = Enum.KeyCode.Backspace,
		Callback = EmptyFunction,
		IgnoreGameProcessed = true,
		Enabled = true,
		ElementStyle = "Button",
		UiPadding = UDim.new(),
		AutomaticSize = Enum.AutomaticSize.None,
		Size = UDim2.new(0.4, 0, 0, 20)
	},
	Create = function(self, Config: Keybind)
		local Value = Config.Value
		local Label = Config.Label

		--// Create keybind object
		local Object = ReGui:InsertPrefab("Button", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		self:Label({
			Parent = Object, 
			Text = Label,
			Position = UDim2.new(1, 5, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		})

		function Config:SetValue(New: Enum.KeyCode)
			local DeleteKey = Config.DeleteKey

			--// Remove keybind 
			if not New or New == DeleteKey then
				Object.Text = "Not set"
				self.Value = nil
				return
			end

			Object.Text = New.Name
			self.Value = New
		end

		function Config:WaitForNewKey()
			local Previous = self.Value

			Object.Text = "..."
			Object.Interactable = false

			--// Wait for new key
			local Key = UserInputService.InputBegan:Wait()
			local KeyCode = Key.KeyCode

			wait() Object.Interactable = true

			--// Check if window is focused
			if not UserInputService.WindowFocused then return end 

			--// Reset back to previous if new key is unknown
			if KeyCode.Name == "Unknown" then
				return self:SetValue(Previous)
			end

			--// Set new keybind
			self:SetValue(KeyCode)
		end

		local function InputBegan(Input, GameProcessed)
			local IgnoreGameProcessed = Config.IgnoreGameProcessed
			local Enabled = Config.Enabled and Object.Interactable
			local Callback = Config.Callback 
			local NullKey = Config.NullKey
			local Previous = Config.Value

			local KeyCode = Input.KeyCode

			--// Check input state
			if not Enabled then return end
			if not IgnoreGameProcessed and GameProcessed then return end

			--// Check KeyCode
			if KeyCode == NullKey then return end
			if KeyCode ~= Previous then return end 

			return Callback(Input.KeyCode)
		end

		--// Update UI
		Config:SetValue(Value)

		--// Connect events
		Config.Connection = UserInputService.InputBegan:Connect(InputBegan)
		Object.Activated:Connect(function()
			Config:WaitForNewKey()
		end)

		return Class, Object
	end
})

ReGui:DefineElement("ArrowButton", {
	Base = {
		Icon = ReGui.Icons.Arrow,
		Direction = "Left",
		Size = UDim2.fromOffset(21,21),
		ColorTag = "Button",
		Rotations = {
			Left = 180,
			Right = 0,
		}
	},
	Create = function(self, Config): ScrollingFrame
		--// Unpack configuration
		local Direction = Config.Direction
		local Rotations = Config.Rotations

		local Rotation = Rotations[Direction]
		Config.IconRotation = Rotation

		--// Create object
		local Object = ReGui:InsertPrefab("ArrowButton", Config)
		Object.Activated:Connect(function(...)
			local Func = Config.Callback
			return Func(Object, ...)
		end)

		return Object
	end,
})

export type Label = {
	Text: string,
	Bold: boolean?,
	Italic: boolean?,
	Font: string?
}
ReGui:DefineElement("Label", {
	Base = {
		Bold = false,
		Italic = false,
		Font = "Inconsolata"
	},
	Create = function(self, Config: Label): TextLabel
		--// Unpack config
		local IsBold = Config.Bold
		local IsItalic = Config.Italic
		local Name = Config.Font

		--// Weghts
		local Medium = Enum.FontWeight.Medium
		local Bold = Enum.FontWeight.Bold

		--// Styles
		local Normal = Enum.FontStyle.Normal
		local Italic = Enum.FontStyle.Italic

		local Weight = IsBold and Bold or Medium
		local Style = IsItalic and Italic or Normal

		if not Config.FontFace then
			Config.FontFace = Font.fromName(Name, Weight, Style)
		end

		--// Create label
		return ReGui:InsertPrefab("Label", Config)
	end,
})

ReGui:DefineElement("Error", {
	Base = {
		RichText = true,
		TextWrapped = true
	},
	ColorData = {
		["Error"] = {
			TextColor3 = "ErrorText",
			FontFace = "TextFont",
		},
	},
	Create = function(self, Config: Label)
		local Message = Config.Text
		Config.Text = `<b>⛔ Error:</b> {Message}`

		return self:Label(Config)
	end,
})

----// Tabs box class
local TabsBoxClass = {
	ColorTags = {
		BGSelected = {
			[true] = "SelectedTab",
			[false] = "DeselectedTab"
		},
		LabelSelected = {
			[true] = "SelectedTabLabel",
			[false] = "DeselectedTabLabel"
		},
	}
}
function TabsBoxClass:UpdateButton(Tab: table, Selected: boolean)	
	local IsSelected = Tab.IsSelected
	local TabFrame = Tab.Tab
	local Button = TabFrame.Button

	--// Ignore update if the value is identical
	if IsSelected == Selected then return end
	Tab.IsSelected = Selected

	local NoAnimation = self.NoAnimation
	local WindowClass = self.WindowClass
	local ColorTags = self.ColorTags

	--// Coloring dicts
	local Theme = WindowClass.Theme
	local Elements = WindowClass.TagsList

	--// Colors tags
	local BGSelected = ColorTags.BGSelected
	local LabelSelected = ColorTags.LabelSelected

	ReGui:MultiUpdateColors({
		Animate = not NoAnimation,
		Theme = Theme,
		TagsList = Elements,
		Objects = {
			[Button] = BGSelected[Selected],
			[Button.Label] = LabelSelected[Selected],
		},
	})
end

function TabsBoxClass:ShowTab(Target: (table|string))
	--// Unpack class data
	local Tabs = self.Tabs
	local NoAnimation = self.NoAnimation

	local MatchName = typeof(Target) == "string"
	local FoundPage = nil
	local IsVisible = false

	--// Hide other tabs
	for _, Tab in next, Tabs do
		local Page = Tab.Content
		local Canvas = Tab.Canvas
		local Name = Tab.Name

		local Match = false

		--// Match for requested content type
		if MatchName then
			Match = Name == Target
		else --Match Canvas class
			Match = Canvas == Target
		end

		--// Name matches
		if Match then
			IsVisible = Page.Visible
			FoundPage = Page
		end

		--// Set visiblity
		Page.Visible = Match

		--// Animate tab buttons
		self:UpdateButton(Tab, Match)
	end

	--// Page animation
	if NoAnimation then return self end
	if IsVisible then return self end
	if not FoundPage then return self end 

	--// Slide in effect
	Animation:Tween({
		Object = FoundPage,
		NoAnimation = NoAnimation,
		StartProperties = {
			Position = UDim2.fromOffset(0, 5)
		},
		EndProperties = {
			Position = UDim2.fromOffset(0, 0)
		}
	})

	return self
end

function TabsBoxClass:RemoveTab(Target: (table|string))
	--// Unpack class data
	local Tabs = self.Tabs

	local MatchName = typeof(Target) == "string"

	--// Hide other tabs
	for Index, Tab in Tabs do
		local Canvas = Tab.Canvas
		local Name = Tab.Name
		local Page = Tab.Content
		local TabFrame = Tab.Tab

		local Match = false

		--// Match for requested content type
		if MatchName then
			Match = Name == Target
		else --Match Canvas class
			Match = Canvas == Target
		end

		if not Match then continue end

		--// Remove
		table.remove(Tabs, Index)

		Page:Destroy()
		TabFrame:Destroy()
	end

	return self
end

export type Tab = {
	Name: string,
	AutoSize: string?,
	TabButton: boolean?,
	Icon: (string|number)?
}
function TabsBoxClass:CreateTab(Config: Tab): Elements
	ReGui:CheckConfig(Config, {
		Name = "Tab",
		AutoSize = "Y",
		CanClose = false
	})

	--// Unpack class data
	local ParentCanvas = self.ParentCanvas
	local WindowClass = self.WindowClass
	local Templates = self.Templates
	local TabsBar = self.TabsBar
	local Body = self.Body
	local Tabs = self.Tabs

	--// Unpack config
	local Name = Config.Name
	local Icon = Config.Icon
	local AutoSize = Config.AutoSize
	local Selected = #Tabs <= 0

	--// Template sources
	local Page = Templates.Page
	local TabButton = Templates.TabButton

	--// Create new tab button
	local Tab = TabButton:Clone()
	local Button = Tab.Button
	local Label = Button.Label
	local Padding = ReGui:GetChildOfClass(Button, "UIPadding")

	Label.Text = tostring(Name)
	Tab.Parent = TabsBar
	Tab.Visible = true

	--// Create new page
	local NewPage = Page:Clone()
	ReGui:SetProperties(NewPage, {
		Parent = Body,
		Name = Name,
		Visible = Selected
	})

	--// Content canvas
	local Canvas = ReGui:MakeCanvas({
		Element = NewPage,
		WindowClass = WindowClass,
		Class = self
	})

	local function Activated()
		self:ShowTab(Canvas)
	end

	local TabData = {
		Name = Name,
		Tab = Tab,
		Canvas = Canvas,
		Content = NewPage
	}

	--// Addional flags
	local ExtraFlags = {
		["CanClose"] = function()
			ParentCanvas:RadioButton({
				Parent = Button,
				Visible = not self.NoClose,
				Icon = ReGui.Icons.Close,
				IconSize = UDim2.fromOffset(11,11),
				LayoutOrder = 3,
				ZIndex = 2,
				UsePropertiesList = true,
				Callback = function()
					self:RemoveTab(Canvas)
				end,
			})
		end,
	}

	--// Connect events
	Button.Activated:Connect(Activated)

	--// Apply flags
	ReGui:CheckFlags(ExtraFlags, Config)

	--// Add to tabs dict
	table.insert(Tabs, TabData)

	--// Add color infomation
	WindowClass:TagElements({
		[Button] = "Tab",
		[Label] = "TabLabel",
		[Padding] = "TabPadding",
	})

	--// Apply automatic size
	ReGui:SetProperties(NewPage, {
		AutomaticSize = Enum.AutomaticSize[AutoSize],
		Size = UDim2.fromScale(
			AutoSize == "Y" and 1 or 0, 
			AutoSize == "X" and 1 or 0
		)
	})

	--// Set animation for tab button
	ReGui:SetAnimation(Button, "Buttons")

	--// Apply flags
	ReGui:ApplyFlags({
		Object = Button,
		Class = {
			Icon = Icon
		}
	})

	--// Update UI
	self:UpdateButton(TabData, Selected)

	return Canvas
end

export type TabsBox = {
	TabsBar: boolean?,
	NoAnimation: boolean?,

	CreateTab: (TabsBox, Tab) -> Elements,
	RemoveTab: (TabsBox, Target: (table|string)) -> nil,
	ShowTab: (TabsBox, Target: (table|string)) -> nil,
}
ReGui:DefineElement("TabsBox", {
	Base = {
		TabsBar = true
	},
	ColorData = {
		["DeselectedTab"] = {
			BackgroundColor3 = "TabBg"
		},
		["SelectedTab"] = {
			BackgroundColor3 = "ActiveTabBg"
		},
		["DeselectedTabLabel"] = {
			FontFace = "TextFont",
			TextColor3 = "TabText",
		},
		["SelectedTabLabel"] = {
			FontFace = "TextFont",
			TextColor3 = "ActiveTabText",
		},
		["TabsBoxLine"] = {
			Color = "ActiveTabBg",
		},
	},
	Create = function(self, Config: TabsBox): (TabsBox, GuiObject)
		local WindowClass = self.WindowClass

		local TabsBarShown = Config.TabsBar

		--// Create TabsBox object
		local Object = ReGui:InsertPrefab("TabsBox", Config)
		local Class = NewClass(TabsBoxClass)

		--// TabsBar (TabsBar)
		local TabsBar = Object.TabsBar
		local Body = Object.Body
		local TemplateButton = TabsBar.TemplateButton
		local PageTemplate = Body.PageTemplate

		local Line = TabsBar:FindFirstChildOfClass("UIStroke")

		--// Hide template objects
		TemplateButton.Visible = false
		PageTemplate.Visible = false

		--// Hide/Show elements
		TabsBar.Visible = TabsBarShown

		--// Merge table into class
		Merge(Class, Config)
		Merge(Class, {
			Templates = {
				TabButton = TemplateButton,
				Page = PageTemplate
			},
			ParentCanvas = self,
			WindowClass = WindowClass,
			Body = Body,
			TabsBar = TabsBar,
			Tabs = {}
		})

		self:TagElements({
			[TabsBar] = "TabsBoxTabsBar",
			[Line] = "TabsBoxLine",
		})

		return Class, Object
	end,
})

export type RadioButton = {
	Icon: string?,
	IconRotation: number?,
	Callback: ((...any) -> unknown)?,
}
ReGui:DefineElement("RadioButton", {
	Base = {
		Callback = EmptyFunction,
	},
	Create = function(self, Config: RadioButton): GuiButton
		local Object = ReGui:InsertPrefab("RadioButton", Config)

		Object.Activated:Connect(function(...)
			local Callback = Config.Callback
			return Callback(Object, ...)
		end)

		return Object
	end,
})

export type Checkbox = {
	Label: string?,
	IsRadio: boolean?,
	Value: boolean,
	NoAnimation: boolean?,
	Callback: ((...any) -> unknown)?,
	SetTicked: (self: Checkbox, Value: boolean, NoAnimation: boolean) -> ...any,
	Toggle: (self: Checkbox) -> ...any,
	TickedImageSize: UDim2,
	UntickedImageSize: UDim2,
}
ReGui:DefineElement("Checkbox", {
	Base = {
		Label = "Checkbox",
		IsRadio = false,
		Value = false,
		NoAutoRegistor = true,
		TickedImageSize = UDim2.fromScale(1, 1),
		UntickedImageSize = UDim2.fromScale(0,0),
		Callback = EmptyFunction,
		Disabled = false
	},
	Create = function(Canvas, Config: Checkbox): Checkbox
		--// Unpack configuration
		local IsRadio = Config.IsRadio
		local Value = Config.Value
		local Text = Config.Label
		local TickedSize = Config.TickedImageSize
		local UntickedSize = Config.UntickedImageSize
		local Disabled = Config.Disabled

		--// Check checkbox object
		local Object = ReGui:InsertPrefab("CheckBox", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Tickbox = Object.Tickbox
		local Tick = Tickbox.Tick
		Tick.Image = ReGui.Icons.Checkmark

		--// Styles
		local UIPadding = Tickbox:FindFirstChildOfClass("UIPadding")
		local UICorner = ReGui:GetChildOfClass(Tickbox, "UICorner")

		--// Create label
		local Label = Canvas:Label({
			Text = Text,
			Parent = Object,
			LayoutOrder = 2
		})

		--// Stylise to correct type
		local PaddingSize = UDim.new(0, 3)
		if IsRadio then
			Tick.ImageTransparency = 1
			Tick.BackgroundTransparency = 0
			UICorner.CornerRadius = UDim.new(1, 0)
		else
			PaddingSize = UDim.new(0, 2)
		end
		
		--// Apply UIPadding sizes
		ReGui:SetProperties(UIPadding, {
			PaddingBottom = PaddingSize,
			PaddingLeft = PaddingSize,
			PaddingRight = PaddingSize,
			PaddingTop = PaddingSize,
		})

		--// Callback
		local function Callback(...)
			local func = Config.Callback
			return func(Class, ...)
		end

		local function SetStyle(Value: boolean, NoAnimation: boolean)
			--// Animate tick
			local Size = Value and TickedSize or UntickedSize
			Animation:Tween({
				Object = Tick,
				NoAnimation = NoAnimation,
				EndProperties = {
					Size = Size
				}
			})
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled

			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		function Config:SetTicked(Value: boolean, NoAnimation: boolean)
			self.Value = Value

			--// Animate
			SetStyle(Value, NoAnimation)

			--// Fire callback
			Callback(Value)

			return self
		end

		function Config:Toggle()
			local Value = not self.Value
			self.Value = Value
			self:SetTicked(Value)

			return self
		end

		--// Connect functions
		local function Clicked()
			Config:Toggle()
		end

		--// Connect events
		Object.Activated:Connect(Clicked)
		Tickbox.Activated:Connect(Clicked)

		--// Update UI
		Config:SetTicked(Value, true)
		Config:SetDisabled(Disabled)

		ReGui:SetAnimation(Tickbox, "Buttons", Object)

		--// Register elements
		Canvas:TagElements({
			[Tick] = "CheckboxTick",
			[Tickbox] = "Checkbox"
		})

		return Class, Object
	end,
})

ReGui:DefineElement("Radiobox", {
	Base = {
		IsRadio = true,
		CornerRadius = UDim.new(1,0),
	},
	Create = function(self, Config: Checkbox): Checkbox
		return self:Checkbox(Config)
	end,
})

export type PlotHistogram = {
	Label: string?,
	Points: {
		[number]: number
	},
	Minimum: number?,
	Maximum: number?,
	GetBaseValues: (PlotHistogram) -> (number, number),
	UpdateGraph: (PlotHistogram) -> PlotHistogram,
	PlotGraph: (PlotHistogram, Points: {
		[number]: number
	}) -> PlotHistogram,
	Plot: (PlotHistogram, Value: number) -> {
		SetValue: (Plot, Value: number) -> nil,
		GetPointIndex: (Plot) -> number,
		Remove: (Plot, Value: number) -> nil,
	},
}
ReGui:DefineElement("PlotHistogram", {
	Base = {
		ColorTag = "Input",
		Label = "Histogram"
	},
	Create = function(Canvas, Config: PlotHistogram)
		--// Unpack configuration
		local LabelText = Config.Label
		local Points = Config.Points

		--// Create Object
		local Object = ReGui:InsertPrefab("Histogram", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local GraphCanvas = Object.Canvas
		local PointTemplate = GraphCanvas.PointTemplate
		PointTemplate.Visible = false --// Hide template

		local Label = Canvas:Label({
			Text = LabelText,
			Parent = Object,
			Position = UDim2.new(1, 5)
		})

		--// Create tooltip
		local ValueLabel = nil
		ReGui:SetItemTooltip(Object, function(Canvas)
			ValueLabel = Canvas:Label()
		end)

		Merge(Config, {
			_Plots = {},
			_Cache = {}
		})

		function Config:GetBaseValues(): (number, number)
			local Minimum = self.Minimum
			local Maximum = self.Maximum
			
			--// User defined minimum
			if Minimum and Maximum then
				return Minimum, Maximum
			end
			
			local Plots = self._Plots

			for _, Data in Plots do
				local Value = Data.Value

				--// Minimum
				if not Minimum or Value < Minimum then
					Minimum = Value
				end

				--// Maximum
				if not Maximum or Value > Maximum then
					Maximum = Value
				end
			end

			return Minimum, Maximum
		end

		function Config:UpdateGraph()
			local Plots = self._Plots

			local Minimum, Maximum = self:GetBaseValues()
			if not Minimum or not Maximum then return end
			
			local Difference = Maximum - Minimum

			--// Update each plot on the graph
			for _, Data in Plots do
				local Point = Data.Point
				local Value = Data.Value

				local Scale = (Value - Minimum) / Difference
				Scale = math.clamp(Scale, 0.05, 1)

				Point.Size = UDim2.fromScale(1, Scale)
			end

			return self
		end

		function Config:Plot(Value)
			local Plots = self._Plots
			local Module = {}

			--// Create a new plot Object
			local Plot = PointTemplate:Clone()
			local Point = Plot.Bar

			ReGui:SetProperties(Plot, {
				Parent = GraphCanvas,
				Visible = true
			})
			
			local HoverConnection = ReGui:ConnectHover(Plot, {
				MouseEnter = true,
				OnInput = function()
					Module:UpdateTooltip()
				end,
			})

			local Data = {
				Object = Plot,
				Point = Point,
				Value = Value
			}
			
			function Module:UpdateTooltip()
				local Index = Module:GetPointIndex()
				ValueLabel.Text = `{Index}:	{Data.Value}`
			end

			function Module:SetValue(Value)
				Data.Value = Value
				Config:UpdateGraph()
				
				--// Update tooltip value if hovered
				if HoverConnection.Hovering then
					self:UpdateTooltip()
				end
			end

			function Module:GetPointIndex(): number
				return table.find(Plots, Data)
			end

			function Module:Remove(Value)
				table.remove(Plots, self:GetPointIndex())
				Plot:Remove()
				Config:UpdateGraph()
			end

			--// Registor plot
			table.insert(Plots, Data)

			--// Update the graph with new values
			self:UpdateGraph()

			--// Style the plot object
			ReGui:SetAnimation(Point, "Plots", Plot)
			Canvas:TagElements({
				[Point] = "Plot"
			})

			return Module
		end

		function Config:PlotGraph(Points)
			local Cache = self._Cache

			--// Remove unsused graph points
			local Extra = #Cache-#Points 
			if Extra >= 1 then
				--// Remove unused graph points
				for Index = 1, Extra do
					local Point = table.remove(Cache, Index)
					if Point then
						Point:Remove()
					end
				end
			end

			for Index, Value in Points do
				--// Use existing point
				local Point = Cache[Index]
				if Point then
					Point:SetValue(Value)
					continue
				end

				--// Create new point
				Cache[Index] = self:Plot(Value)
			end

			return self
		end

		--// Display points
		if Points then
			Config:PlotGraph(Points)
		end

		return Class, Object
	end,
})


export type Viewport = {
	Model: Instance,
	WorldModel: WorldModel?,
	Viewport: ViewportFrame?,
	Camera: Camera?,
	Clone: boolean?,

	SetCamera: (self: Viewport, Camera: Camera) -> Viewport,
	SetModel: (self: Viewport, Model: Model, PivotTo: CFrame?) -> Model,
}
ReGui:DefineElement("Viewport", {
	Base = {
		IsRadio = true,
	},
	Create = function(self, Config: Viewport): Viewport
		local Object = ReGui:InsertPrefab("Viewport", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Viewport = Object.Viewport
		local WorldModel = Viewport.WorldModel

		--// Unpack configuration
		local Model = Config.Model
		local Camera = Config.Camera 

		if not Camera then
			Camera = ReGui:CreateInstance("Camera", Viewport)
		end

		Merge(Config, {
			Camera = Camera,
			WorldModel = WorldModel,
			Viewport = Viewport
		})

		function Config:SetCamera(Camera)
			Camera.CFrame = CFrame.new(0,0,0)
			Viewport.CurrentCamera = Camera

			self.Camera = Camera
			return self
		end

		function Config:SetModel(Model: Model, PivotTo: CFrame?)
			local CreateClone = self.Clone

			WorldModel:ClearAllChildren()

			--// Set new model
			if CreateClone then
				Model = Model:Clone()
			end
			if PivotTo then
				Model:PivotTo(PivotTo)
			end

			Model.Parent = WorldModel
			self.Model = Model

			return Model
		end

		--// Set model
		if Model then
			Config:SetModel(Model)
		end

		Config:SetCamera(Camera)

		return Class
	end,
})

export type InputText = {
	Value: string,
	Placeholder: string?,
	MultiLine: boolean?,
	Label: string?,
	Callback: ((string, ...any) -> unknown)?,
	Clear: (InputText) -> InputText,
	SetValue: (InputText, Value: string) -> InputText,
}
ReGui:DefineElement("InputText", {
	Base = {
		Value = "",
		Placeholder = "",
		Label = "Input text",
		Callback = EmptyFunction,
		MultiLine = false,
		NoAutoRegistor = true,
		Disabled = false
	},
	Create = function(Canvas, Config: InputText): InputText
		--// Unpack configuration
		local MultiLine = Config.MultiLine
		local Placeholder = Config.Placeholder
		local Label = Config.Label
		local Disabled = Config.Disabled

		--// Create Text input object
		local Object = ReGui:InsertPrefab("InputBox", Config)
		local Frame = Object.Frame
		local TextBox = Frame.Input

		local Class = ReGui:MergeMetatables(Config, Object)

		Canvas:Label({
			Parent = Object,
			Text = Label,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, 19),
			LayoutOrder = 2
		})

		ReGui:SetProperties(TextBox, {
			PlaceholderText = Placeholder,
			MultiLine = MultiLine
		})

		local function Callback(...)
			local Func = Config.Callback
			Func(Class, ...)
		end

		function Config:SetValue(Value: string?)
			TextBox.Text = tostring(Value)
			self.Value = Value
			return self
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled

			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		function Config:Clear()
			TextBox.Text = ""
			return self
		end

		local function TextChanged()
			local Value = TextBox.Text
			Config.Value = Value
			Callback(Value)
		end

		--// Connect events
		TextBox:GetPropertyChangedSignal("Text"):Connect(TextChanged)

		--// Update UI
		Config:SetDisabled(Disabled)

		Canvas:TagElements({
			[TextBox] = "Input"
		})

		return Class, Object
	end,
})

export type InputInt = {
	Value: number,
	Maximum: number?,
	Minimum: number?,
	Placeholder: string?,
	MultiLine: boolean?,
	Label: string?,
	Increment: number?,
	Callback: ((string, ...any) -> unknown)?,
	SetValue: (InputInt, Value: number, NoTextUpdate: boolean?) -> InputInt,
	Decrease: (InputInt) -> nil,
	Increase: (InputInt) -> nil,
}
ReGui:DefineElement("InputInt", {
	Base = {
		Value = 0,
		Increment = 1,
		Placeholder = "",
		Label = "Input Int",
		Callback = EmptyFunction,
	},
	Create = function(self, Config: InputInt): InputInt
		--// Unpack configuration
		local Value = Config.Value
		local Placeholder = Config.Placeholder
		local Label = Config.Label

		--// Create Text input object
		local Object = ReGui:InsertPrefab("InputBox", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Frame = Object.Frame
		local TextBox = Frame.Input
		TextBox.PlaceholderText = Placeholder

		--// Decrease
		local Decrease = self:Button({
			Text = "-",
			Parent = Frame,
			LayoutOrder = 2,
			Ratio = 1,
			AutomaticSize = Enum.AutomaticSize.None,
			FlexMode = Enum.UIFlexMode.None,
			Size = UDim2.fromScale(1,1),
			Callback = function()
				Config:Decrease()
			end,
		})

		--// Increase
		local Increase = self:Button({
			Text = "+",
			Parent = Frame,
			LayoutOrder = 3,
			Ratio = 1,
			AutomaticSize = Enum.AutomaticSize.None,
			FlexMode = Enum.UIFlexMode.None,
			Size = UDim2.fromScale(1,1),
			Callback = function()
				Config:Increase()
			end,
		})

		self:Label({
			Parent = Object,
			Text = Label,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, 19),
			LayoutOrder = 4
		})

		local function Callback(...)
			local Func = Config.Callback
			Func(Class, ...)
		end

		function Config:Increase()
			local Value = self.Value
			local Increment = self.Increment
			Config:SetValue(Value + Increment)
		end

		function Config:Decrease()
			local Value = self.Value
			local Increment = self.Increment
			Config:SetValue(Value - Increment)
		end

		function Config:SetValue(Value: number?)
			local Previous = self.Value
			local Minimum = self.Minimum
			local Maximum = self.Maximum

			--// Replace empty string value with 0
			Value = tonumber(Value)

			--// Check if value is accepted
			if not Value then 
				Value = Previous
			end

			--// Clamp value into a limied range
			if Minimum and Maximum then
				Value = math.clamp(Value, Minimum, Maximum)
			end

			--// Update values
			TextBox.Text = Value
			Config.Value = Value
			Callback(Value)

			return self
		end

		local function TextChanged()
			local New = TextBox.Text
			Config:SetValue(New)
		end

		--// Update UI
		Config:SetValue(Value)

		--// Connect events
		TextBox.FocusLost:Connect(TextChanged)

		--// Register elements
		self:TagElements({
			[Increase] = "Button",
			[Decrease] = "Button",
			[TextBox] = "Input",
		})

		return Class, Object
	end,
})

ReGui:DefineElement("InputTextMultiline", {
	Base = {
		Label = "",
		Size = UDim2.new(1, 0, 0, 39),
		Border = false,
		ColorTag = "Input"
	},
	Create = function(self, Config)
		return self:Console(Config)
	end,
})

export type Console = {
	Enabled: boolean?,
	ReadOnly: boolean?,
	Value: string?,
	RichText: boolean?,
	TextWrapped: boolean?,
	LineNumbers: boolean?,
	AutoScroll: boolean,
	LinesFormat: string,
	MaxLines: number,

	UpdateLineNumbers: (Console) -> Console,
	UpdateScroll: (Console) -> Console,
	SetValue: (Console, Value: string) -> Console,
	GetValue: (Console) -> string,
	Clear: (Console) -> Console,
	AppendText: (Console, ...string) -> Console,
	CheckLineCount: (Console) -> Console
}
ReGui:DefineElement("Console", {
	Base = {
		Enabled = true,
		ReadOnly = false,
		Value = "",
		TextWrapped = false,
		RichText = false,
		LineNumbers = false,
		LinesFormat = "%s",
		Callback = EmptyFunction,
	},
	Create = function(self, Config: Console): Console
		--// Unpack configuration
		local ReadOnly = Config.ReadOnly
		local LineNumbers = Config.LineNumbers
		local Fill = Config.Fill
		local Value = Config.Value
		local Placeholder = Config.Placeholder

		--// Create console object
		local Object = ReGui:InsertPrefab("Console", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Source: TextBox = Object.Source
		local Lines = Object.Lines

		ReGui:SetProperties(Source, Config)
		ReGui:SetProperties(Source, {
			TextEditable = not ReadOnly,
			Parent = Object,
			PlaceholderText = Placeholder
		})

		Lines.Visible = LineNumbers

		function Config:UpdateLineNumbers()
			--// configuration
			local LineNumbers = self.LineNumbers
			local Format = self.LinesFormat

			--// If line counts are disabled
			if not LineNumbers then return end

			local LinesCount = #Source.Text:split("\n")

			--// Update lines text
			Lines.Text = ""

			for Line = 1, LinesCount do
				local Text = Format:format(Line)
				local End = Line ~= LinesCount and '\n' or ''
				Lines.Text ..= `{Text}{End}`
			end

			--// Update console size to fit line numbers
			local LinesWidth = Lines.AbsoluteSize.X
			Source.Size = UDim2.new(1, -LinesWidth, 0, 0)

			return self
		end

		function Config:CheckLineCount()
			--// configuration
			local MaxLines = Config.MaxLines
			if not MaxLines then return end

			local Text = Source.Text
			local Lines = Text:split("\n")

			--// Cut the first line
			if #Lines > MaxLines then
				local Line = `{Lines[1]}\\n`
				local Cropped = Text:sub(#Line)
				self:SetValue(Cropped)
			end

			return self
		end

		function Config:UpdateScroll()
			local CanvasSize = Object.AbsoluteCanvasSize
			Object.CanvasPosition = Vector2.new(0, CanvasSize.Y)
			return self
		end

		function Config:SetValue(Text: string?)
			if not self.Enabled then return end

			Source.Text = tostring(Text)
			self:Update()

			return self
		end

		function Config:GetValue()
			return Source.Text
		end

		function Config:Clear()
			Source.Text = ""
			self:Update()
			return self
		end

		function Config:AppendText(...)
			local NewString = "\n" .. ReGui:Concat({...}, " ") 

			--// Append string
			local Value = self:GetValue()
			self:SetValue(Value..NewString)

			--// Check if content needs to be cut
			self:CheckLineCount()

			return self
		end

		function Config:Update()
			--// Configuration
			local AutoScroll = Config.AutoScroll

			Config:UpdateLineNumbers()

			--// Automatically scroll to bottom
			if AutoScroll then
				Config:UpdateScroll()
			end
		end

		local function Changed()
			local Value = Config:GetValue()
			Config:Update()
			Config.Callback(Value)
		end

		--// Update element
		Config:SetValue(Value)

		--// Connect events
		Source:GetPropertyChangedSignal("Text"):Connect(Changed)

		return Class, Object
	end,
})

ReGui:DefineElement("Header", {
	Base = {
		Size = UDim2.new(1, 0, 0, 20)
	},
	Create = Elements.Label,
})

export type Table = {
	Align: string?,
	Border: boolean?,
	RowBackground: boolean?,
	RowBgTransparency: number?,

	Row: (Table) -> {
		Column: (Row) -> Elements
	},
	ClearRows: (Table) -> unknown,
}
ReGui:DefineElement("Table", {
	Base = {
		Align = "Center",
		RowBackground = false,
		RowBgTransparency = 0.9,
		Border = false,
	},
	Create = function(Canvas, Config: Table): Table
		local WindowClass = Canvas.WindowClass

		--// Unpack configuration
		local RowTransparency = Config.RowBgTransparency
		local RowBackground = Config.RowBackground
		local Border = Config.Border
		local Align = Config.Align

		--// Create table object
		local Object = ReGui:InsertPrefab("Table", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local RowTemplate = Object.RowTemp

		local RowsCount = 0
		function Config:Row()
			RowsCount += 1

			--// Create Row object (Different to :Row)
			local Row = RowTemplate:Clone()
			ReGui:SetProperties(Row, {
				Name = "Row",
				Visible = true,
				Parent = Object,
			})

			--// Set alignment
			local UIListLayout = Row:FindFirstChildOfClass("UIListLayout")
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment[Align]

			--// Background colors
			if RowBackground then
				local Transparency = RowsCount % 2 ~= 1 and RowTransparency or 1
				Row.BackgroundTransparency = Transparency
			end

			--// Row class
			local RowClass = {}
			function RowClass:Column()
				--// Create column object
				local Column = Row.ColumnTemp:Clone()
				ReGui:SetProperties(Column, {
					Visible = true,
					Parent = Row,
					Name = "Column"
				})

				--// Apply border
				local Stroke = Column:FindFirstChildOfClass("UIStroke")
				Stroke.Enabled = Border

				--// Content canvas
				return ReGui:MakeCanvas({
					Element =  Column,
					WindowClass = WindowClass,
					Class = Class
				})
			end

			--// Content canvas
			return ReGui:MakeCanvas({
				Element = Row,
				WindowClass = WindowClass,
				Class = RowClass
			})
		end

		function Config:ClearRows()
			RowsCount = 0

			--// Destroy each row
			for _, Row: Frame in next, Object:GetChildren() do
				if not Row:IsA("Frame") then continue end
				if Row == RowTemplate then continue end

				Row:Destroy()
			end

			return Config
		end

		return Class, Object
	end,
})

export type List = {
	Spacing: number?
}
ReGui:DefineElement("List", {
	Base = {
		Spacing = 5,
		HorizontalFlex = Enum.UIFlexAlignment.None,
		VerticalFlex = Enum.UIFlexAlignment.None,
	},
	Create = function(self, Config)
		local WindowClass = self.WindowClass
		
		--// Unpack configuration
		local Spacing = Config.Spacing
		local HorizontalFlex = Config.HorizontalFlex
		local VerticalFlex = Config.VerticalFlex

		--// Create object
		local Object = ReGui:InsertPrefab("List", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local ListLayout: UIListLayout = Object.UIListLayout
		ReGui:SetProperties(ListLayout, {
			Padding = UDim.new(0, Spacing),
			HorizontalFlex = HorizontalFlex,
			VerticalFlex = VerticalFlex
		})

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Class
		})

		return Canvas, Object
	end,
})

export type CollapsingHeader = {
	Title: string,
	Icon: string?,
	IsTree: boolean?,
	NoAnimation: boolean?,
	Collapsed: boolean?,
	Offset: number?,

	SetCollapsed: (CollapsingHeader, Open: boolean) -> CollapsingHeader
}
ReGui:DefineElement("CollapsingHeader", {
	Base = {
		Title = "Collapsing Header",
		Icon = ReGui.Icons.Arrow,
		Collapsed = true,
		Offset = 0,
		NoAutoRegistor = true,
		NoAutoFlags = true,
	},
	Create = function(self, Config: CollapsingHeader): CollapsingHeader
		--// Unpack config
		local Title = Config.Title
		local Icon = Config.Icon
		local Collapsed = Config.Collapsed
		local Style = Config.ElementStyle
		local Offset = Config.Offset
		local TitleProperties = Config.TitleBarProperties

		--// Create header object
		local Object = ReGui:InsertPrefab("CollapsingHeader", Config)

		local Titlebar = Object.TitleBar
		local ToggleButton = Titlebar.Toggle.Icon

		local TitleText = self:Label({
			ColorTag = "CollapsingHeader",
			Text = Title,
			Parent = Titlebar,
			LayoutOrder = 2
		})

		--// Content canvas
		local Canvas, ContentFrame = self:Indent({
			Parent = Object,
			Offset = Offset,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.None,
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 2),
			UsePropertiesList = true,
		})

		--// Open Animations
		function Config:SetCollapsed(Collapsed)
			self.Collapsed = Collapsed

			local ContentSize = ReGui:GetContentSize(ContentFrame)

			--// Sizes
			local ClosedSize = UDim2.fromScale(1, 0)
			local OpenSize = ClosedSize + UDim2.fromOffset(0, ContentSize.Y)

			Animation:HeaderCollapse({
				Collapsed = Collapsed,
				Toggle = ToggleButton,
				Resize = ContentFrame,
				Hide = ContentFrame,

				--// Sizes
				ClosedSize = ClosedSize,
				OpenSize = OpenSize ,
			})

			return self
		end

		local function Toggle()
			Config:SetCollapsed(not Config.Collapsed)
		end

		--// Apply flags
		if TitleProperties then
			ReGui:ApplyFlags({
				Object = Titlebar,
				Class = TitleProperties
			})
		end

		TitleText.Text = Title
		ToggleButton.Image = Icon

		--// Apply style
		ReGui:ApplyStyle(Titlebar, Style)

		--// Update UI
		Config:SetCollapsed(Collapsed)

		--// Connect events
		Titlebar.Activated:Connect(Toggle)
		ToggleButton.Activated:Connect(Toggle)

		--// Register elements
		self:TagElements({
			[Titlebar] = "CollapsingHeader",
		})

		return Canvas, Object
	end,
})

ReGui:DefineElement("TreeNode", {
	Base = {
		Offset = 15,
		IsTree = true,
		TitleBarProperties = {
			Size = UDim2.new(1, 0, 0, 15),
			IconSize = UDim2.fromOffset(11,11),
		}
	},
	Create = function(self, Config)
		return self:CollapsingHeader(Config)
	end,
})

export type Separator = {
	Text: string?
}
ReGui:DefineElement("Separator", {
	Base = {},
	Create = function(self, Config)
		local Text = Config.Text

		--// Create septator object
		local Object = ReGui:InsertPrefab("SeparatorText", Config)

		local Label = self:Label({
			Text = tostring(Text),
			Visible = Text ~= nil,
			Parent = Object,
			LayoutOrder = 2,
			Size = UDim2.new()
		})

		return Object
	end,
})

export type Indent = {
	Scroll: boolean?
}
ReGui:DefineElement("Canvas", {
	Base = {
		Scroll = false
	},
	Create = function(self, Config: Indent)
		local WindowClass = self.WindowClass

		local Scroll = Config.Scroll
		local Class = Scroll and "ScrollingCanvas" or "Canvas"

		--// Create object
		local Object = ReGui:InsertPrefab(Class, Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Config
		})

		return Canvas, Object
	end,
})

export type Region = {
	Scroll: boolean?
}
ReGui:DefineElement("Region", {
	Base = {
		Scroll = false,
		AutomaticSize = Enum.AutomaticSize.Y
	},
	Create = function(self, Config: Indent)
		local WindowClass = self.WindowClass

		local Scroll = Config.Scroll
		local Class = Scroll and "ScrollingCanvas" or "Canvas"

		--// Create object
		local Object = ReGui:InsertPrefab(Class, Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Config
		})

		return Canvas, Object
	end,
})

export type Indent = {
	Offset: number?
}
ReGui:DefineElement("Indent", {
	Base = {
		Offset = 15,
		PaddingTop = UDim.new(),
		PaddingBottom = UDim.new(),
		PaddingRight = UDim.new(),
	},
	Create = function(self, Config: Indent)
		local Offset = Config.Offset
		Config.PaddingLeft = UDim.new(0, Offset)

		return self:Canvas(Config)
	end,
})

export type BulletText = {
	Padding: number,
	Icon: (string|number)?,
	Rows: {
		[number]: string?,
	}
} 
ReGui:DefineElement("BulletText", {
	Base = {},
	Create = function(self, Config: BulletText)
		local Rows = Config.Rows

		--// Create each row
		for _, Text in next, Rows do
			local Object = self:Bullet(Config)
			Object:Label({
				Text = tostring(Text),
				LayoutOrder = 2,
				Size = UDim2.fromOffset(0,14),
			})
		end
	end,
})

export type Bullet = {
	Padding: number?
}
ReGui:DefineElement("Bullet", {
	Base = {
		Padding = 3,
		Icon = ReGui.Icons.Dot,
		IconSize = UDim2.fromOffset(5,5)
	},
	Create = function(self, Config: Bullet)
		local WindowClass = self.WindowClass

		--// Unpack configuration
		local Padding = Config.Padding

		--// Create object
		local Object = ReGui:InsertPrefab("Bullet", Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = self
		})

		--// Apply padding
		local ListLayout = Object.UIListLayout
		ListLayout.Padding = UDim.new(0, Padding)

		return Canvas, Object
	end,
})

export type Row = {
	Spacing: number?,
	Expand: (Row) -> Row
}
ReGui:DefineElement("Row", {
	Base = {
		Spacing = 4,
		Expanded = false, 
	},
	Create = function(self, Config: Row)
		local WindowClass = self.WindowClass
		
		--// Unpack configuration
		local Spacing = Config.Spacing
		local Expanded = Config.Expanded
		
		--// Create row object
		local Object = ReGui:InsertPrefab("Row", Config)
		local Class = ReGui:MergeMetatables(Config, Object)
		
		local UIListLayout = Object:FindFirstChildOfClass("UIListLayout")
		UIListLayout.Padding = UDim.new(0, Spacing)
		
		function Config:Expand()
			UIListLayout.HorizontalFlex = Enum.UIFlexAlignment.Fill
			return self
		end
		
		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Class
		})
		
		--// Expand if Fill flag is enabled
		if Expanded then
			Config:Expand()
		end
		
		return Canvas, Object
	end,
})

--TODO
-- Vertical 
-- :SetPercentage
export type SliderIntFlags = {
	Value: number?,
	Format: string?,
	Label: string?,
	Progress: boolean?,
	NoGrab: boolean?,
	Minimum: number,
	Maximum: number,
	NoAnimation: boolean?,
	Callback: (number) -> any?,
	ReadOnly: boolean?,
	SetValue: (SliderInt, Value: number, IsSlider: boolean?) -> SliderInt?,
	MakeProgress: (SliderInt) -> nil?,
}
ReGui:DefineElement("SliderBase", {
	Base = {
		Format = "%.f/%s",
		Label = "",
		Type = "Slider",
		Callback = EmptyFunction,
		NoGrab = false,
		NoClick = false,
		Minimum = 0,
		Maximum = 100,
		ColorTag = "Input",
		Disabled = false,
	},
	Create = function(Canvas, Config)
		--// Unpack config
		local Value = Config.Value or Config.Minimum
		local Format = Config.Format
		local LabelText = Config.Label
		local NoAnimation = Config.NoAnimation
		local NoGrab = Config.NoGrab
		local NoClick = Config.NoClick
		local Type = Config.Type
		local Disabled = Config.Disabled

		--// Create slider element
		local Object = ReGui:InsertPrefab("Slider")
		local Track = Object.Track
		local Grab = Track.Grab
		local ValueText = Track.ValueText

		--local Drag = ReGui:GetChildOfClass(Track, "UIDragDetector")
		local UIPadding = Track:FindFirstChildOfClass("UIPadding")

		local Class = ReGui:MergeMetatables(Config, Object)

		local Label = Canvas:Label({
			Parent = Object, 
			Text = LabelText,
			Position = UDim2.new(1, 7),
			Size = UDim2.fromScale(0, 1)
		})

		Merge(Config, {
			Grab = Grab,
			Name = LabelText,
		})

		local GrabSize = Grab.AbsoluteSize

		--// Temporary solution
		if Type == "Slider" then
			Track.Position = UDim2.fromOffset(GrabSize.X/2, 0)
			Track.Size = UDim2.new(1, -GrabSize.X, 1, 0)
		end

		local Types = {
			["Slider"] = function(Percentage)
				return {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(Percentage, 0.5)
				}
			end,
			["Progress"] = function(Percentage)
				return {
					Size = UDim2.fromScale(Percentage, 1)
				}
			end,
			["Snap"] = function(Percentage, Value, Minimum, Maximum)
				local X = (math.round(Value) - Minimum) / Maximum
				return {
					Size = UDim2.fromScale(1 / Maximum, 1),
					Position = UDim2.fromScale(X, 0.5)
				}
			end,
		}

		local function Callback(...)
			local func = Config.Callback
			return func(Class, ...)
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled

			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		function Config:SetValueText(Text: string)
			ValueText.Text = tostring(Text)
		end

		function Config:SetValue(Value, IsPercentage: boolean)
			local Minimum = Config.Minimum
			local Maximum = Config.Maximum

			local Percentage = Value
			local Difference = Maximum - Minimum

			--// Convert Value into a Percentage
			if not IsPercentage then
				Percentage = (Value - Minimum) / Difference
			else
				--// Convert Percentage into Value
				Value = Minimum + (Difference * Percentage)
			end

			--// Clamp the percentage to ensure the grab stays within bounds
			Percentage = math.clamp(Percentage, 0, 1)

			--// Get properties for the Grab
			local Props = Types[Type](Percentage, Value, Minimum, Maximum) 

			--// Animate
			Animation:Tween({
				Object = Grab,
				NoAnimation = NoAnimation,
				EndProperties = Props
			})

			--// Update UI
			Config.Value = Value
			self:SetValueText(Format:format(Value, Maximum))

			--// Fire callback
			Callback(Value)

			return self
		end

		------// Move events
		local function CanDrag()
			if Config.Disabled then return end
			if Config.ReadOnly then return end

			return true 
		end
		local function DragMovement(InputPosition)
			if not CanDrag() then return end

			--// Track Position and Size
			local TrackLeft = Track.AbsolutePosition.X
			local TrackWidth = Track.AbsoluteSize.X

			--// Get the mouse position relative to the track
			local MouseX = InputPosition.X
			local RelativeX = MouseX - TrackLeft

			--// Get the percentage based on the width of the track
			local Percentage = math.clamp(RelativeX / TrackWidth, 0, 1)

			Config:SetValue(Percentage, true)
		end
		--// Update UI
		Grab.Visible = not NoGrab
		Config:SetValue(Value) -- Ensure the grab is positioned correctly on initialization
		Config:SetDisabled(Disabled)

		--// Set object animations
		ReGui:SetAnimation(Object, "Inputs")

		Canvas:TagElements({
			[ValueText] = "Label",
			[Grab] = "InputGrab"
		})

		--// Connect movement events
		ReGui:ConnectDrag(Track, {
			DragStart =  not NoClick and DragMovement or nil,
			DragMovement = DragMovement,
		})
		
		--if not NoClick then
		--	Drag.DragStart:Connect(DragMovement)
		--end
		--Drag.DragContinue:Connect(DragMovement)

		return Class, Object
	end,
})

export type SliderEnumFlags = {
	Items: {
		[number]: any
	},
	Label: string,
	Value: number,
} & SliderIntFlags
ReGui:DefineElement("SliderEnum", {
	Base = {
		Items = {},
		Label = "Slider Enum",
		Type = "Snap",
		Minimum = 1,
		Maximum = 10,
		Value = 1,
		Callback = EmptyFunction,
		ColorTag = "Input"
	},
	Create = function(self, Config: SliderEnumFlags)
		--// Unpack configuration
		local Callback = Config.Callback
		local Value = Config.Value

		local function Calculate(self, Value: number)
			Value = math.round(Value)

			--// Dymanic size
			local Items = self.Items
			self.Maximum = #Items

			--// Get value from array
			return Items[Value]
		end

		--// Custom callback for the Enum type
		Config.Callback = function(self, Index, NoCallback: boolean)
			local Value = Calculate(self, Index)
			self:SetValueText(Value)

			Config.Value = Value

			return Callback(self, Value)
		end

		Calculate(Config, Value)

		--// Create object 
		return self:SliderBase(Config)
	end,
})

ReGui:DefineElement("SliderInt", {
	Base = {
		Label = "Slider Int",
		ColorTag = "Input",
	},
	Create = Elements.SliderBase,
})

ReGui:DefineElement("SliderFloat", {
	Base = {
		Label = "Slider Float",
		Format = "%.3f/%s",
		ColorTag = "Input",
	},
	Create = Elements.SliderBase,
})

export type DragIntFlags = {
	Format: string?,
	Label: string?,
	Callback: (DragIntFlags, number) -> any,
	Minimum: number?,
	Maximum: number?,
	Value: number?,
	ReadOnly: boolean?,

	SetValue: (DragIntFlags, number) -> DragIntFlags,
}
ReGui:DefineElement("DragInt", {
	Base = {
		Format = "%.f",
		Label = "Drag Int",
		Callback = EmptyFunction,
		Minimum = 0,
		Maximum = 100,
		ColorTag = "Input",
		Disabled = false
	},
	Create = function(Canvas, Config: DragIntFlags)
		--// Unpack config
		local Value = Config.Value or Config.Minimum
		local Format = Config.Format
		local LabelText = Config.Label
		local Disabled = Config.Disabled

		--// Create slider element
		local Object = ReGui:InsertPrefab("Slider")
		local Class = ReGui:MergeMetatables(Config, Object)

		local Track = Object.Track
		local ValueText = Track.ValueText
		local Grab = Track.Grab
		Grab.Visible = false

		local Drag = ReGui:GetChildOfClass(Track, "UIDragDetector")

		local Label = Canvas:Label({
			Parent = Object, 
			Text = LabelText,
			Position = UDim2.new(1, 7),
			Size = UDim2.fromScale(0, 1)
		})

		local InputBeganPosition = nil
		local Percentage = 0
		local BeganPercentage = 0

		local function Callback(...)
			local Func = Config.Callback
			return Func(Class, ...)
		end

		function Config:SetValue(Value: number, IsPercentage: boolean)
			local Minimum = self.Minimum
			local Maximum = self.Maximum

			local Difference = Maximum - Minimum

			--// Convert Value into a Percentage
			if not IsPercentage then
				Percentage = ((Value - Minimum) / Difference) * 100
			else
				--// Convert Percentage into Value
				Value = Minimum + (Difference * (Percentage / 100))
			end

			Value = math.clamp(Value, Minimum, Maximum)

			--// Update UI
			self.Value = Value
			ValueText.Text = Format:format(Value, Maximum) 

			--// Fire callback
			Callback(Value)

			return self
		end
		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled

			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		------// Move events
		local function CanDrag(): boolean
			if Config.Disabled then return end
			if Config.ReadOnly then return end

			return true
		end
		local function DragStart(InputPosition)
			if not CanDrag() then return end

			InputBeganPosition = InputPosition
			BeganPercentage = Percentage
		end
		local function DragMovement(InputPosition)
			if not CanDrag() then return end

			local Delta = InputPosition.X - InputBeganPosition.X
			local New = BeganPercentage + (Delta/2)

			Percentage = math.clamp(New, 0, 100)
			Config:SetValue(Percentage, true)
		end

		--// Update UI
		Config:SetValue(Value)
		Config:SetDisabled(Disabled)

		--// Connect movement events
		ReGui:ConnectDrag(Track, {
			DragStart = DragStart,
			DragMovement = DragMovement,
		})
		
		--Drag.DragStart:Connect(DragStart)
		--Drag.DragContinue:Connect(DragMovement)

		--// Set object animations
		ReGui:SetAnimation(Object, "Inputs")

		return Class, Object
	end,
})

ReGui:DefineElement("DragFloat", {
	Base = {
		Format = "%.3f/%s",
		Label = "Drag Float",
		ColorTag = "Input"
	},
	Create = Elements.DragInt,
})

ReGui:DefineElement("MultiDrag", {
	Base = {
		Callback = EmptyFunction,
		Value = ReGui.Accent.Light,
		Label = "",
		Disabled = false,
		BaseDragIntConfig = {},
		DragIntsConfig = {}
	},
	Create = function(Canvas, Config)
		--// Unpack configuration
		local LabelText = Config.Label
		local BaseDragConfig = Config.BaseDragIntConfig
		local DragIntsConfig = Config.DragIntsConfig
		
		ReGui:CheckConfig(BaseDragConfig, {
			Size = UDim2.new(1, 0, 0, 20),
			Label = ""
		})
		
		--// Create container row
		local ContainerRow = Canvas:Row({
			Spacing = 5,
		})
		local Class = ReGui:MergeMetatables(Config, ContainerRow)

		local Label = ContainerRow:Label({
			Size = UDim2.fromScale(0.35, 0),
			LayoutOrder = 2,
			Text = LabelText
		})

		--// Create row for sliders and preview frame
		local Row = ContainerRow:Row({
			Size = UDim2.fromScale(0.65, 0),
		})
		
		--// Expand row
		Row:Expand()

		--// Create DragInt elements
		local Drags = {}
		for _, DragConfig in DragIntsConfig do
			local Drag = Row:DragInt(Copy(BaseDragConfig, DragConfig))
			table.insert(Drags, Drag)
		end
		
		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			
			--// Chaneg the tag of the Label
			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
			
			--// Set state of each Drag element
			for _, Drag in Drags do
				Drag:SetDisabled(Disabled)
			end
		end
		
		--// Merge properties into the configuration
		Merge(Config, {
			Row = Row,
			Drags = Drags
		})
		
		return Config, ContainerRow
	end,
})

export type InputColor3Flags = {
	Label: string?,
	Value: Color3?,
	Callback: (InputColor3Flags, Value: Color3) -> any,

	ValueChanged: (InputColor3Flags) -> nil,
	SetValue: (InputColor3Flags, Value: Color3) -> InputColor3Flags,
}
ReGui:DefineElement("InputColor3", {
	Base = {
		Callback = EmptyFunction,
		Value = ReGui.Accent.Light,
		Label = "Input Color3",
		Disabled = false,
		BaseDragIntConfig = {
			Minimum = 0,
			Maximum = 255
		},
		DragIntsConfig = {
			[1] = {Format = "R: %.f"},
			[2] = {Format = "R: %.f"},
			[3] = {Format = "R: %.f"},
		}
	},
	Create = function(self, Config: InputColor3Flags)
		--// Unpack configuration
		local DragIntConfig = Config.BaseDragIntConfig
		local Value = Config.Value
		local Disabled = Config.Disabled
		
		DragIntConfig.Callback = function()
			if Config.ValueChanged then
				Config:ValueChanged()
			end
		end
		
		--// Create Object
		local MultiInput = self:MultiDrag(Config)
		local Class = ReGui:MergeMetatables(Config, MultiInput)
		
		local Row = MultiInput.Row
		local Drags = MultiInput.Drags
		
		--// Preview frame
		local Preview = Row:Button({
			BackgroundTransparency = 0,
			Size = UDim2.fromOffset(16, 16),
			Text = "",
			Ratio = 1,
			ColorTag = "",
			ElementStyle = ""
		})
		
		local function Callback(...)
			local func = Config.Callback
			return func(Class, ...)
		end

		local function SetPreview(Color: Color3)
			Preview.BackgroundColor3 = Color
			Callback(Color)
		end

		function Config:ValueChanged()
			local R, B, G = Drags[1], Drags[2], Drags[3]
			local Color = Color3.fromRGB(R.Value, G.Value, B.Value)
			
			self.Value = Color
			SetPreview(Color)
		end

		function Config:SetValue(Color: Color3)
			self.Value = Color
			SetPreview(Color)
			
			--// Update Drag elements
			local R, B, G = Drags[1], Drags[2], Drags[3]
			R:SetValue(Color.R*255)
			B:SetValue(Color.B*255)
			G:SetValue(Color.G*255)
		end

		--// Update UI
		Config:SetValue(Value)
		Config:SetDisabled(Disabled)

		return MultiInput, Row
	end,
})

export type InputCFrameFlags = {
	Label: string?,
	Value: CFrame?,
	Callback: (InputCFrameFlags, Value: CFrame) -> any,

	ValueChanged: (InputCFrameFlags) -> nil,
	SetValue: (InputCFrameFlags, Value: CFrame) -> InputCFrameFlags,
}
ReGui:DefineElement("InputCFrame", {
	Base = {
		Callback = EmptyFunction,
		Value = CFrame.new(1,1,1),
		Label = "Input CFrame",
		Disabled = false,
		Minimum = -100,
		Maximum = 100,
		BaseDragIntConfig = {},
		DragIntsConfig = {
			[1] = {Format = "X: %.f"},
			[2] = {Format = "Y: %.f"},
			[3] = {Format = "Z: %.f"},
		}
	},
	Create = function(self, Config: InputCFrameFlags)
		--// Unpack configuration
		local DragIntConfig = Config.BaseDragIntConfig
		local Value = Config.Value
		local Disabled = Config.Disabled
		local Maximum = Config.Maximum
		local Minimum = Config.Minimum
		
		ReGui:CheckConfig(DragIntConfig, {
			Maximum = Maximum,
			Minimum = Minimum
		})

		DragIntConfig.Callback = function()
			if Config.ValueChanged then
				Config:ValueChanged()
			end
		end

		--// Create Object
		local MultiInput = self:MultiDrag(Config)
		local Class = ReGui:MergeMetatables(Config, MultiInput)

		local Row = MultiInput.Row
		local Drags = MultiInput.Drags
		
		local function Callback(...)
			local func = Config.Callback
			return func(Class, ...)
		end

		function Config:ValueChanged()
			local X, Y, Z = Drags[1], Drags[2], Drags[3]
			local _CFrame = CFrame.new(X.Value, Y.Value, Z.Value)

			self.Value = _CFrame
			Callback(_CFrame)
		end

		function Config:SetValue(_CFrame: CFrame)
			self.Value = _CFrame

			--// Update Drag elements
			local X, Y, Z = Drags[1], Drags[2], Drags[3]
			X:SetValue(_CFrame.X)
			Y:SetValue(_CFrame.Y)
			Z:SetValue(_CFrame.Z)
		end

		--// Update UI
		Config:SetValue(Value)
		Config:SetDisabled(Disabled)

		return MultiInput, Row
	end,
})

ReGui:DefineElement("SliderProgress", {
	Base = {
		Label = "Slider Progress",
		Type = "Progress",
		ColorTag = "Input",
	},
	Create = Elements.SliderBase,
})

export type ProgressBar = {
	SetPercentage: (ProgressBar, Value: number) -> nil
}
ReGui:DefineElement("ProgressBar", {
	Base = {
		Label = "Progress Bar",
		Type = "Progress",
		ReadOnly = true,
		MinValue = 0,
		MaxValue = 100,
		Format = "% i%%",
		Interactable = false,
		ColorTag = "Input"
	},
	Create = function(self, Config)
		function Config:SetPercentage(Value: number)
			Config:SetValue(Value)
		end

		local Slider, Object = self:SliderBase(Config)
		local Grab = Slider.Grab

		self:TagElements({
			[Grab] = {
				BackgroundColor3 = "ProgressBar"
			}
		})

		return Slider, Object
	end,
})

export type Combo = {
	Label: string?,
	Placeholder: string?,
	Callback: ((Combo, Value: any) -> any)?,
	Items: {[number?]: any}?,
	GetItems: (() -> table)?,
}
ReGui:DefineElement("Combo", {
	Base = {
		Value = "",
		Placeholder = "",
		Callback = EmptyFunction,
		ColorTag = "Input",
		Items = {},
		Disabled = false
	},
	Create = function(Canvas, Config)
		--// Unpack configuration
		local Placeholder = Config.Placeholder
		local NoAnimation = Config.NoAnimation
		local Selected = Config.Selected
		local LabelText = Config.Label
		local Disabled = Config.Disabled

		--// Create slider element
		local Object = ReGui:InsertPrefab("Combo", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local ValueText = Canvas:Label({
			Text = tostring(Placeholder),
			Parent = Object,
			LayoutOrder = 2,
			Center = "Y",
			Position = UDim2.new(0, 5),
			Name = "ValueText"
		})

		local ArrowButton = Canvas:ArrowButton({
			Parent = Object,
			Ratio = 1,
			Interactable = false,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(1, 0),
			AnchorPoint = Vector2.new(1, 0)
		})

		local Label = Canvas:Label({
			Text = LabelText,
			Parent = Object,
			LayoutOrder = 2,
			Position = UDim2.new(1, 5),
			Center = "Y",
		})

		local Hovering = ReGui:ConnectHover(Object)

		local Dropdown = nil

		local function Callback(Value, ...)
			local Func = Config.Callback
			Config:SetOpen(false)

			return Func(Class, Value, ...)
		end
		
		local function SetAnimationState(Open: boolean)
			Object.Interactable = not Open

			--// Animate Arrow button
			Animation:HeaderCollapseToggle({
				NoAnimation = NoAnimation,
				Collapsed = not Open,
				Toggle = ArrowButton.Icon,
			})

		end

		local function GetItems()
			local GetItems = Config.GetItems
			local Items = Config.Items

			--// Invoke the GetItems function
			if GetItems then
				return GetItems()
			end

			--// Return Dict/Array
			return Items
		end

		function Config:SetValueText(Value: string?)
			ValueText.Text = tostring(Value)
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled

			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		function Config:SetValue(Selected)
			local Items = GetItems()

			local DictValue = Items[Selected]
			local Value = DictValue or Selected

			self._Selected = Selected
			self.Value = Value

			--// Update Value text with selected item
			if typeof(Selected) == "number" then
				self:SetValueText(Value)
			else
				self:SetValueText(Selected)
			end

			return Callback(Selected, Value)
		end

		function Config:SetOpen(Open: boolean)
			local Selected = self._Selected

			self.Open = Open
			SetAnimationState(Open)
			
			if not Open	then 
				--// Close open dropdown
				if Dropdown then
					Dropdown:Close()
				end

				return 
			end

			--// Create dropdown
			Dropdown = Canvas:Dropdown({
				ParentObject = Object,
				Items = GetItems(),
				Selected = Selected,
				OnSelected = function(...)
					Config:SetValue(...)
				end,
				OnClosed = function()
					self:SetOpen(false)
				end,
			})

			return self
		end

		local function ToggleOpen()
			local IsOpen = Config.Open
			Config:SetOpen(not IsOpen)
		end

		--// Connect events
		Object.Activated:Connect(ToggleOpen)

		--// Update UI
		SetAnimationState(false)
		Config:SetDisabled(Disabled)
		
		if Selected then
			Config:SetValue(Selected)
		end

		--// Set object animations
		ReGui:SetAnimation(Object, "Inputs")

		return Class, Object 
	end,
})

local WindowClass = {
	--// Icons
	TileBarConfig = {
		Close = {
			Image = ReGui.Icons.Close,	
			IconSize = UDim2.fromOffset(11,11),
		},
		Collapse = {
			Image = ReGui.Icons.Arrow,
			IconSize = UDim2.fromScale(1,1),
		},
	},

	CloseCallback = EmptyFunction, --// Placeholder

	--// States
	Collapsible = true,
	Open = true,
	Focused = false
}

function WindowClass:TagElements(Objects)
	local Debug = ReGui.Debug

	if not WindowClass then 	
		if Debug then
			warn("No WindowClass for objects registor:", Objects)
		end
		return 
	end

	--// Unpack WindowClass
	local Elements = self.TagsList
	local Theme = self.Theme

	ReGui:MultiUpdateColors({
		Theme = Theme,
		TagsList = Elements,
		Objects = Objects
	})
end

export type TitleBarCanvas = {
	Right: table,
	Left: table,
}
function WindowClass:MakeTitleBarCanvas(): TitleBarCanvas
	local TitleBar = self.TitleBar

	--// Create canvas for each side
	local Canvas = {
		Right = ReGui:MakeCanvas({
			WindowClass = self,
			Element = TitleBar.Right
		}),
		Left = ReGui:MakeCanvas({
			WindowClass = self,
			Element = TitleBar.Left
		})
	}

	self.TitleBarCanvas = Canvas

	return Canvas
end

function WindowClass:AddDefaultTitleButtons()
	local Config = self.TileBarConfig
	local IsOpen = self.Open

	local Toggle = Config.Collapse
	local Close = Config.Close

	--// Check for Titlebar canvas
	local Canvas = self.TitleBarCanvas
	if not Canvas then
		Canvas = self:MakeTitleBarCanvas()
	end

	--// Canvas groups
	local Left = Canvas.Left
	local Right = Canvas.Right

	ReGui:CheckConfig(self, {
		--// Create window interaction buttons
		Toggle = Left:RadioButton({
			Icon = Toggle.Image,
			IconSize = Toggle.IconSize,
			Rotation = IsOpen and 90 or 0,
			LayoutOrder = 1,

			Callback = function()
				self:ToggleCollapsed()
			end,
		}),
		CloseButton = Right:RadioButton({
			Icon = Close.Image,
			IconSize = Close.IconSize,
			LayoutOrder = 2,

			Callback = function()
				self:Close()
			end,
		}),
		TitleLabel = Left:Label({
			Text = "ReGui by depso",
			ColorTag = "Title",
			LayoutOrder = 2,
			TextSize = 14,
			Size = UDim2.new(1, 0),
			Fill = true,
			AutomaticSize = Enum.AutomaticSize.Y
		})
	})

	--// Registor Elements into Window class
	self:TagElements({
		[self.TitleLabel] = "WindowTitle"
	})
end

function WindowClass:Close()
	local Callback = self.CloseCallback

	--// Test for interupt
	if Callback then
		local ShouldClose = Callback(self)
		if ShouldClose == false then return end
	end

	self:Remove()
end

function WindowClass:GetWindowSize(): Vector2
	local Window = self.WindowFrame
	return Window.AbsoluteSize
end

function WindowClass:GetTitleBarSizeY(): number
	local TitleBar = self.TitleBar
	return TitleBar.Visible and TitleBar.AbsoluteSize.Y or 0
end

function WindowClass:GetTabsBarSizeY(): number
	local TabsBar = self.TabsBar
	return TabsBar.Visible and TabsBar.AbsoluteSize.Y or 0
end

function WindowClass:GetHeaderSizeY(): number
	local TitlebarY = self:GetTitleBarSizeY()
	local TabsBarY = self:GetTabsBarSizeY()

	return TabsBarY + TitlebarY
end

function WindowClass:UpdateBody()
	local HeaderSizeY = self:GetHeaderSizeY()
	local Body = self.Body
	Body.Size = UDim2.new(1, 0, 1, -HeaderSizeY)
end

function WindowClass:SetVisible(Visible: boolean): WindowClass
	self.Visible = Visible

	--// Update the visibility of the Window frame
	local Window = self.WindowFrame
	Window.Visible = Visible

	--// Update window focus
	if Visible then
		ReGui:SetFocusedWindow(self)
	end

	return self
end

function WindowClass:SetTitle(Text: string?): WindowClass
	local Title = self.TitleLabel
	Title.Text = tostring(Text)
	return self
end

function WindowClass:Remove()
	local Window = self.WindowFrame
	Window:Destroy()
end

function WindowClass:SetPosition(Position): WindowClass
	local Window = self.WindowFrame
	Window.Position = Position
	return self
end

function WindowClass:SetSize(Size: (Vector2|UDim2), NoAnimation: boolean): WindowClass
	local Window = self.WindowFrame

	--// Convert Vector2 to UDim2
	if typeof(Size) == "Vector2" then
		Size = UDim2.fromOffset(Size.X, Size.Y)
	end

	--// Tween to the new size
	Animation:Tween({
		Object = Window,
		NoAnimation = NoAnimation,
		EndProperties = {
			Size = Size
		}
	})

	self.Size = Size

	return self
end

function WindowClass:Center(): WindowClass --// Without an Anchor point
	local Size = self:GetWindowSize() / 2
	local Position = UDim2.new(0.5, -Size.X, 0.5, -Size.Y)

	self:SetPosition(Position)
	return self
end

function WindowClass:SetTheme(ThemeName: string): WindowClass
	local Themes = ReGui.ThemeConfigs

	local Elements = self.TagsList
	local Focused = self.Focused

	--// Use the current theme if no theme is defined
	if not ThemeName then
		ThemeName = self.Theme
	end

	--// Check if the theme actually exists
	assert(Themes[ThemeName], `{ThemeName} is not a valid theme!`)

	self.Theme = ThemeName

	--// Update elements with new colors
	ReGui:MultiUpdateColors({
		Animate = false,
		Theme = ThemeName,
		Objects = Elements
	})

	--// Refresh Focus styles
	self:SetFocused(Focused)

	return self
end

function WindowClass:SetFocused(Focused: true)
	Focused = Focused == nil and true or Focused

	self.Focused = Focused

	--// Update Window focus
	if Focused then
		ReGui:SetFocusedWindow(self)
	end

	--// Unpack elements
	local Window = self.WindowFrame
	local TitleBar = self.TitleBar
	local Theme = self.Theme
	local TitleLabel = self.TitleLabel

	local Border = Window:FindFirstChildOfClass("UIStroke")

	--// Color tags
	local Tags = {
		Focused = {
			[Border] = "SelectedBorder",
			[TitleBar] = "ActiveTitleBarBg",
			[TitleLabel] = {
				TextColor3 = "ActiveTitle"
			}
		},
		UnFocused = {
			[Border] = "DeselectedBorder",
			[TitleBar] = "DeActiveTitleBar",
			[TitleLabel] = {
				TextColor3 = "Title"
			}
		}
	}

	--// Update colors
	ReGui:MultiUpdateColors({
		Animate = true,
		Objects = Focused and Tags.Focused or Tags.UnFocused,
		Theme = Theme,
	})
end

function WindowClass:GetColor(Tag: string)
	local Themes = ReGui.ThemeConfigs

	local BaseTheme = Themes.DarkTheme
	local Theme = Themes[self.Theme] or BaseTheme

	return Theme[Tag] or BaseTheme[Tag]
end

function WindowClass:ResetColors(): WindowClass
	local Defaults = ReGui.Theme
	local Theme = self.Theme
	local Elements = self.TagsList

	--// Reset values
	table.clear(Theme)
	--for Name in next, Colors do
	--	Colors[Name] = Defaults[Name]
	--end

	ReGui:MultiUpdateColors({
		Animate = false,
		Theme = Defaults,
		Objects = Elements
	})

	return WindowClass
end

function WindowClass:SetCollapsible(Collapsible: boolean): WindowClass
	self.Collapsible = Collapsible
	return self
end

function WindowClass:ToggleCollapsed(NoCheck: boolean?): WindowClass
	local Collapsed = self.Collapsed
	local Collapsible = self.Collapsible

	--// Check if the window can be opened
	if not NoCheck and not Collapsible then return self end

	self:SetCollapsed(not Collapsed)
	return self
end

function WindowClass:SetCollapsed(Collapsed: boolean, NoAnimation: false): WindowClass
	local Window = self.WindowFrame
	local Body = self.Body
	local Toggle = self.Toggle
	local ResizeGrab = self.ResizeGrab
	local OpenSize = self.Size
	local AutoSize = self.AutoSize

	local WindowSize = self:GetWindowSize()
	local TitleBarSizeY = self:GetTitleBarSizeY()

	local ToggleIcon = Toggle.Icon
	local ClosedSize = UDim2.fromOffset(WindowSize.X, TitleBarSizeY)

	self.Collapsed = Collapsed
	self:SetCollapsible(false)

	--// Change the window focus
	self:SetFocused(not Collapsed)

	--// Animate the closing
	Animation:HeaderCollapse({
		NoAnimation = NoAnimation,
		Collapsed = Collapsed,
		Toggle = ToggleIcon,
		Resize = Window,
		NoAutomaticSize = not AutoSize,
		Hide = Body,
		--// Sizes
		ClosedSize = ClosedSize,
		OpenSize = OpenSize,
		Completed = function()
			self:SetCollapsible(true)
		end
	})

	--// ResizeGrab
	Animation:Tween({
		Object = ResizeGrab,
		NoAnimation = NoAnimation,
		EndProperties = {
			TextTransparency = Collapsed and 1 or 0.6,
			Interactable = not Collapsed
		}
	})

	return self
end

function WindowClass:UpdateConfig(Config)
	local Flags = {
		NoTitleBar = function(Value)
			local Object = self.TitleBar
			Object.Visible = not Value
		end,
		NoClose = function(Value)
			local Object = self.CloseButton
			Object.Visible = not Value
		end,
		NoCollapse = function(Value)
			local Object = self.Toggle
			Object.Visible = not Value
		end,
		NoTabsBar = function(Value)
			local Object = self.WindowTabsBox
			local TabsBar = Object.TabsBar
			TabsBar.Visible = not Value
		end,
		NoScrollBar = function(Value)
			local Object = self.WindowTabsBox
			local Body = Object.Body
			Body.ScrollBarThickness = Value and 0 or 9
		end,
		NoMove = function(Value)
			local Drag = self.DragConnection
			Drag:SetEnabled(not Value)
		end,
		NoResize = function(Value)
			local Drag = self.ResizeConnection
			Drag:SetEnabled(not Value)
		end,
		NoBackground = function(Value)
			local Transparency = self:GetColor("WindowBgTransparency")
			local Frame = self.CanvasFrame
			Frame.BackgroundTransparency = Value and 1 or Transparency
		end,
	}

	--// Update class data
	Merge(self, Config)

	--// Update options
	for Key, Value in Config do
		local Func = Flags[Key]
		if Func then
			Func(Value)
		end
	end
	
	return self
end

export type WindowFlags = {
	AutoSize: string?,
	CloseCallback: (Window) -> boolean?,
	Collapsed: boolean?,
	MinSize: Vector2?,
	Theme: any?,
	Title: string?,
	NoTabs: boolean?,
	NoMove: boolean?,
	NoGradients: boolean?,
	NoResize: boolean?,
	NoTitleBar: boolean?,
	NoClose: boolean?,
	NoCollapse: boolean?,
	NoScrollBar: boolean?,
	NoSelectEffect: boolean?,
	NoDefaultTitleBarButtons: boolean,
	SetTheme: (Window, ThemeName: string) -> Window,
	SetTitle: (Window, Title: string) -> Window,
	UpdateConfig: (Window, Config: table) -> Window,
	SetCollapsed: (Window, Collapsed: boolean, NoAnimation: boolean?) -> Window,
	SetCollapsible: (Window, Collapsible: boolean) -> Window,
	SetFocused: (Window, Focused: boolean) -> Window,
	Center: (Window) -> Window,
	SetVisible: (Window, Visible: boolean) -> Window,
	TagElements: (Window, Objects: {
		[GuiObject]: string
	}) -> nil,
	Close: (Window) -> nil,
}
ReGui:DefineElement("Window", {
	Export = true,
	Base = {
		NoSelect = false,
		NoTabs = true,
		NoScroll = false,
		Collapsed = false,
		Visible = true,
		AutoSize = false,
		MinSize = Vector2.new(160, 90),
		Theme = "DarkTheme",
		NoTheme = true
	},
	Create = function(self, Config: WindowFlags)
		ReGui:CheckConfig(Config, {
			Parent = ReGui.Container.Windows,
			Title = ReGui.DefaultTitle
		})

		--// Global config unpack
		local Windows = ReGui.Windows

		--// Unpack config
		local NoTitleButtons = Config.NoDefaultTitleBarButtons
		local Collapsed = Config.Collapsed
		local MinSize = Config.MinSize
		local Title = Config.Title
		local NoTabs = Config.NoTabs
		local NoScroll = Config.NoScroll
		local Theme = Config.Theme

		--// Create Window frame
		local Window = ReGui:InsertPrefab("Window", Config)
		local ContentFrame = Window.Content

		local CanvasFrame = ContentFrame.Canvas
		local TitleBar = ContentFrame.TitleBar

		--// Create window class
		local Class = NewClass(WindowClass)

		--// Make the window resizable
		local ResizeConnection = ReGui:MakeResizable({
			MinimumSize = MinSize,
			Resize = Window,
			OnUpdate = function(Size)
				Class:SetSize(Size, true)
			end,
		})

		--// Merge tables
		Merge(Class, Config)
		Merge(Class, {
			WindowFrame = Window,  
			ContentFrame = ContentFrame,
			CanvasFrame = CanvasFrame,

			ResizeGrab = ResizeConnection.Grab,
			TitleBar = TitleBar,

			Elements = Elements,
			TagsList = {},

			--// Connections
			HoverConnection = ReGui:ConnectHover(Window),
			DragConnection = ReGui:MakeDraggable({
				Move = Window,
				Grab = ContentFrame
			}),
			ResizeConnection = ResizeConnection,
		})

		--// Content canvas
		local WindowCanvas = ReGui:MakeCanvas({
			Element = CanvasFrame,
			WindowClass = Class,
			Class = Class
		})

		--// Create canvas for Window type
		local Canvas, Body = nil, nil
		if NoTabs then
			--// Window
			Canvas, Body = WindowCanvas:Canvas({
				Scroll = not NoScroll,
				Fill = true
			})
		else
			--// TabsWindow
			Canvas, Body = WindowCanvas:TabsBox({
				Fill = true
			})
		end

		--// Merge canvas data
		Merge(Class, {
			WindowTabsBox = Canvas,
			Body = Body,
		})

		--// Create Window class from Canvas and Class merge
		local WindowClass = ReGui:MergeMetatables(Class, Canvas)

		--// Create default title bar
		if not NoTitleButtons then
			Class:AddDefaultTitleButtons()
		end

		--// Update window UI
		Class:SetTitle(Title)
		Class:SetCollapsed(Collapsed, true)

		--// Update window configuration
		Class:SetTheme(Theme)
		Class:UpdateConfig(Config)

		--// Update selection
		Class:SetFocused()

		--// Append to Windows array
		table.insert(Windows, WindowClass)

		--// Register elements into Window Class
		WindowClass:TagElements({
			[ResizeConnection.Grab] = "ResizeGrab",
			[TitleBar] = "TitleBar",
			[CanvasFrame] = "Window"
		})

		return WindowClass, Window
	end,
})

ReGui:DefineElement("TabsWindow", {
	Export = true,
	Base = {
		NoTabs = false
	},
	Create = function(self, Config: WindowFlags)
		return self:Window(Config)
	end,
})

--// Load the library
--ReGui:Init()

return ReGui
