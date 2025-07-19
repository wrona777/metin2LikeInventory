extends Control

func ItemPopup(item : Item):
	if item != null:
		set_value(item)
	%ItemPopup.popup()

func HideItemPopup():
	%ItemPopup.hide()

func set_value(item : Item):
	%Name.text = item.name + " +" + str(item.upgrade_lvl)
	%lvlReq.text = "Od poziomu: " + str(item.lvl_req)
	%baseStats.text = item.base_stats
	%rolls.text = item.rolls
	%class.text = "[ Do Ubrania ]\n" + item.classes
