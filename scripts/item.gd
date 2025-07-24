extends Control

@onready var texture = $Texture

@export var item : Item

func _ready() -> void:
	if item:
		itemSetter()
	$TextureRect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	mouse_filter = Control.MOUSE_FILTER_STOP

func itemSetter() -> void:
	texture.custom_minimum_size = Vector2(item.width,item.height)
	texture.texture = item.texture

func _on_texture_mouse_entered() -> void:
	if item == null:
		return
	Popups.ItemPopup(item)

func _on_texture_mouse_exited() -> void:
	Popups.HideItemPopup()

func get_drag_data(_position):
	var preview = TextureRect.new()
	preview.texture = item.texture
	preview.expand_mode = TextureRect.EXPAND_KEEP_SIZE
	set_drag_preview(preview)
	return self 

func can_drop_data(_position, data):
	return data is Control

func drop_data(_position, data):
	var parent_slot = get_parent()
	if parent_slot and data != self:
		parent_slot.swap_items(self, data)
