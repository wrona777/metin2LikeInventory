extends Control

var follow_mouse := false

func ItemPopup(item : Item):
	if item != null:
		set_value(item)
		%ItemPopup.popup()
		follow_mouse = true
		update_popup_position()

func HideItemPopup():
	%ItemPopup.hide()
	follow_mouse = false

func set_value(item : Item):
	%Name.text = item.name + " +" + str(item.upgrade_lvl)
	%lvlReq.text = "Od poziomu: " + str(item.lvl_req)
	%baseStats.text = item.base_stats
	%rolls.text = item.rolls
	%class.text = "[ Do Ubrania ]\n" + item.classes

func _process(_delta):
	if follow_mouse:
		update_popup_position()

func update_popup_position():
	var mouse_pos = get_viewport().get_mouse_position()
	var offset = Vector2(5, 5)
	%ItemPopup.position = mouse_pos + offset
