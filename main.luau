local CoreGui = game:GetService("CoreGui")
local DrawText = {}

local baseDrawingObj = {
	Visible = true,
	ZIndex = 0,
	Transparency = 1,
	Color = Color3.new(),
	Text = "",
	Outline = false,
	Thickness = 1,
	Font = 0,
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(0, 0, 0, 0)
}

local drawingFontsEnum = {
	[0] = Enum.Font.Roboto,
	[1] = Enum.Font.Legacy,
	[2] = Enum.Font.SourceSans,
	[3] = Enum.Font.RobotoMono,
}

DrawText.Fonts = {
	UI = 0,
	System = 1,
	Plex = 2,
	Monospace = 3,
}



local function clone(t1)
	local result = {}
	for i,v in pairs(t1) do
		result[i] = v
	end
	return result
end

function DrawText.new()
	local obj = clone(baseDrawingObj)
	local textLabel, uiStroke = Instance.new("TextLabel"), Instance.new("UIStroke")

	local Drawing = Instance.new("ScreenGui", CoreGui)
	Drawing.Name = "Drawing"
	Drawing.DisplayOrder = math.huge
	Drawing.IgnoreGuiInset = true
	
	spawn(function()
		while wait() do
			pcall(function()
				textLabel.Font = drawingFontsEnum[obj.Font]
				textLabel.Text = obj.Text
				textLabel.TextColor3 = obj.Color
				textLabel.Parent = Drawing

				textLabel.BackgroundTransparency = 1

				textLabel.TextScaled = true

				textLabel.Position = obj.Position
				textLabel.Size = obj.Size

				uiStroke.Parent = textLabel
				uiStroke.Enabled = obj.Outline
				uiStroke.Thickness = obj.Thickness

				textLabel.Visible = obj.Visible
			end)
		end
	end)

	function obj:Remove()
		Drawing:Destroy()
	end

	function obj:Destroy()
		Drawing:Destroy()
	end

	return obj
end

getgenv().DrawText = DrawText
