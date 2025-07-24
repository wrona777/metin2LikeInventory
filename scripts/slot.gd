extends PanelContainer



func has_item():
	return get_child_count() > 0

func get_item():
	return get_child(0) if has_item() else null

func can_drop_data(_position, data):
	return data is Control

func drop_data(_position, data):
	var dragged_item = data as Control
	if not dragged_item:
		return
	
	var this_item = get_item()

	if this_item:
		var old_parent = dragged_item.get_parent()
		old_parent.remove_child(dragged_item)
		remove_child(this_item)

		add_child(dragged_item)
		old_parent.add_child(this_item)
	else:
		dragged_item.get_parent().remove_child(dragged_item)
		add_child(dragged_item)
