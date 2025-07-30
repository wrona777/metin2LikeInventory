extends Control

@onready var texture = $Texture
@onready var itemNode = $"."
@export var item : Item

var dragged_item_preview = null
var is_item_dragged = false
var original_parent = null
var saved_item = null

func _ready() -> void:
	if item:
		itemSetter()

func _process(_delta: float) -> void:
	if dragged_item_preview:
		_update_dragged_position()

func itemSetter() -> void:
	texture.custom_minimum_size = Vector2(item.width,item.height)
	texture.texture = item.texture

func _on_texture_mouse_entered() -> void:
	if item == null:
		return
	Popups.ItemPopup(item)

func _on_texture_mouse_exited() -> void:
	Popups.HideItemPopup()

func _on_texture_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		original_parent = itemNode.get_parent() #Slot
		createPreview()
		saved_item = item.duplicate()
		texture.hide()

func createPreview():
	dragged_item_preview = TextureRect.new()
	dragged_item_preview.texture = texture.texture
	dragged_item_preview.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	dragged_item_preview.stretch_mode = TextureRect.STRETCH_SCALE
	dragged_item_preview.ignore_texture_size = true
	dragged_item_preview.size = Vector2(94, 94)
	
	add_child(dragged_item_preview)
	dragged_item_preview.z_index = 999
	dragged_item_preview.position = get_local_mouse_position()
	set_listening(true)

func _update_dragged_position() -> void:
	if dragged_item_preview:
		var mouse_pos = get_local_mouse_position()
		var texture_size = dragged_item_preview.size
		dragged_item_preview.position = mouse_pos - texture_size / 2
	
func set_listening(state: bool) -> void:
	is_item_dragged = state
