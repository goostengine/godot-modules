extends Node2D

func _ready():
	var importer = TabletopImporter.new()
	importer.import_texture("user://icon.png") # Note: not `res://`!
	$sprite.texture = load("user://icon.png")
