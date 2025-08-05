extends Control

@onready var texture = $Texture
@onready var itemNode = $"."
@export var item : Item

var saved_item = null
var is_dragging = false
func _ready() -> void:
	if item:
		itemSetter()

func itemSetter() -> void:
	texture.custom_minimum_size = Vector2(item.width,item.height)
	texture.texture = item.texture

func _on_texture_mouse_entered() -> void:
	if item == null:
		return
	Popups.ItemPopup(item)

func _on_texture_mouse_exited() -> void:
	Popups.HideItemPopup()

func _get_drag_data(at_position: Vector2) -> Variant:
	saved_item = item.duplicate()
	saved_item.original_parent = self
	
	#drag prewiev
	var drag_preview := Control.new()
	var preview = TextureRect.new()
	
	preview.texture = item.texture
	preview.ignore_texture_size = true
	preview.stretch_mode = TextureRect.STRETCH_SCALE
	preview.custom_minimum_size = Vector2(94, 94)
	preview.position = -0.5 * preview.custom_minimum_size
	
	drag_preview.add_child(preview)
	set_drag_preview(drag_preview)
	is_dragging = true
	itemNode.queue_free()
	
	return saved_item
