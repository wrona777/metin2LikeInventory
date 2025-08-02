extends PanelContainer

@onready var panel = $"."

##func _get_drag_data(at_position: Vector2) -> Variant:
	##print("essa!")
	##return true

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Item

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var item_scene = preload("res://scenes/item.tscn")
	var new_item = item_scene.instantiate()
	new_item.item = data
	panel.add_child(new_item)
