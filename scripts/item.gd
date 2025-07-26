extends Control

@onready var texture = $Texture
@export var item : Item
var theTexture : Texture2D

var is_dragging := false
var original_position: Vector2
var original_parent: Control
var original_slot: Control

func _ready() -> void:
	if item:
		itemSetter()

func itemSetter() -> void:
	texture.custom_minimum_size = Vector2(item.width,item.height)
	texture.texture = item.texture
	theTexture = item.texture

func _on_texture_mouse_entered() -> void:
	if item == null:
		return
	Popups.ItemPopup(item)

func _on_texture_mouse_exited() -> void:
	Popups.HideItemPopup()
