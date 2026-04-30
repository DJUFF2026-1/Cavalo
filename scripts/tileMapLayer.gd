extends TileMapLayer

@onready var cameraMundo:Camera2D = get_node("Camera2D")

@onready var sceneParent = get_parent()
@onready var player:CharacterBody2D = sceneParent.get_node("Player")
@onready var playerCamera = player.get_node("Camera2D")

#pegar height e width do tileMapLayer (todas as tiles colocadas no mapa) e 
#settar maximo zoom out de maximo mapa


const ZOOM_MAX = Vector2(1.0, 1.0)  # limite de zoom in
var zoom_min: Vector2               # calculado pelo tamanho do mapa

func _ready() -> void:
	zoom_min = calcular_zoom_minimo()

func calcular_zoom_minimo() -> Vector2:
	var used_rect = get_used_rect()              # Rect2i em tiles
	var tile_size = tile_set.tile_size           # Vector2i (ex: 16x16)
	
	# tamanho total do mapa em pixels
	var map_size = Vector2(used_rect.size) * Vector2(tile_size)
	
	# tamanho da viewport
	var viewport_size = get_viewport_rect().size
	
	# zoom mínimo = menor escala que ainda cabe o mapa inteiro
	var zoom_x = viewport_size.x / map_size.x
	var zoom_y = viewport_size.y / map_size.y
	
	# usa o menor dos dois para garantir que o mapa inteiro apareça
	var zoom_fit = min(zoom_x, zoom_y)
	return Vector2(zoom_fit, zoom_fit)
	
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
		#print("MAIS")
		zoomVector = zoomVector + Vector2(0.08 , 0.08)
	if Input.is_action_just_pressed("ui_zoom_camera_world_smaller"):
		#print("MENOS")
		zoomVector = zoomVector - Vector2(0.08 , 0.08)
		
	zoomVector = zoomVector.clamp(zoom_min, ZOOM_MAX)
	
	cameraMundo.zoom = zoomVector
		
	
