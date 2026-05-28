extends Node2D

@export var half_tile = true
var rotation_speed = 1.5

func _process(delta):

	rotation += rotation_speed * delta
