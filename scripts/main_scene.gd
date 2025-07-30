extends Control

var active_drag : bool = true

func _input(event: InputEvent) -> void:
	if not active_drag:
		return

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_viewport().get_mouse_position()
		var root = get_tree().root
		var clicked_node = get_ui2(root, mouse_pos)
		
		if clicked_node:
			if clicked_node is PanelContainer:
				print("Kliknięto przycisk: ", clicked_node.name)
			elif clicked_node is TextureRect:
				print("Kliknięto teksturę: ", clicked_node.name)
			else:
				print("coś", clicked_node.name)
		else:
			print("Kliknięto w puste miejsce")

func get_ui(mouse_pos: Vector2) -> Control:
	var root = get_tree().root
	for child in root.get_children():
		if child is Control and child.get_global_rect().has_point(mouse_pos):
			return child
	return null

func get_ui2(node: Node, mouse_pos: Vector2) -> Control:
	if node is Control and node.get_global_rect().has_point(mouse_pos):
		for child in node.get_children():
			var found = get_ui2(child, mouse_pos)
			if found:
				return found
		return node
	return null
