extends TileMapLayer

@onready var cameraMundo:Camera2D = get_node("Camera2D")

@onready var player:CharacterBody2D = get_node("Player")
@onready var playerCamera = player.get_node("Camera2D")

#pegar height e width do tileMapLayer (todas as tiles colocadas no mapa) e 
#settar maximo zoom out de maximo mapa


func _physics_process(delta: float) -> void:
	get_input_to_free_camera()
	get_input_to_edit_zoom_world_camera()
	pass

func get_input_to_free_camera() -> void:
	if Input.is_action_just_pressed("ui_free_camera"):
		if(cameraMundo.enabled):
			cameraMundo.enabled = false
			playerCamera.enabled = true
		else:
			cameraMundo.enabled = true
			playerCamera.enabled = false

func get_input_to_edit_zoom_world_camera() -> void:
	var zoomVector:Vector2 = cameraMundo.zoom
	if Input.is_action_just_pressed("ui_zoom_camera_world_bigger"):
		print("MAIS")
		zoomVector = zoomVector + Vector2(0.05 , 0.05)
	if Input.is_action_just_pressed("ui_zoom_camera_world_smaller"):
		print("MENOS")
		zoomVector = zoomVector - Vector2(0.05 , 0.05)
	cameraMundo.zoom = zoomVector
		
	
