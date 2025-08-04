extends Resource
class_name Item

@export var name : String
@export var texture : Texture2D
@export var width : int = 74
@export var height : int = 74

@export var lvl_req : int = 0
@export_multiline var base_stats : String
@export_multiline var rolls : String
@export var classes : String #Wojownik Ninja Sura Szaman

var upgrade_lvl : int = 0
var original_parent = null
