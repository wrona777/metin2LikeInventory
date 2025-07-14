extends Control

@onready var texture = $Texture

@export var item : Item

func _ready() -> void:
	if item:
		itemSetter()

func itemSetter() -> void:
	texture.custom_minimum_size = Vector2(item.width,item.height)
	texture.texture = item.texture
