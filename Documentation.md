# DrawText Documentation

```Text : string```
```AnchorPoint: Vector2```
```Position: UDim2```
```Size: UDim2```
```Color: Color3```
```Visible: boolean```
```Outline: boolean```
```Thickness: number```
```Font: number```
```ZIndex: number```
```Transparency: number```

# Example

```lua
local text = DrawText.new()
text.Text = "This is a center drawing"
text.AnchorPoint = Vector2.new(0.5, 0.5)
text.Position = UDim2.new(0.5, 0, 0.5, 0)
text.Size = UDim2.new(0, 200, 0, 50)
text.Color = Color3.new(1, 1, 1)
text.Outline = true
text.Thickness = 1.5
text.Font = DrawText.Fonts.UI
text.ZIndex = 99
text.Transparency = 0.5

wait(1)

text:Remove()

```
