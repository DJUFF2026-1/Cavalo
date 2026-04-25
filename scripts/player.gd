extends CharacterBody2D
#onready var animation: AnimationPlayer = get_node("Animation")
@onready var sprite: Sprite2D = get_node("Sprite")
@onready var colision: CollisionShape2D = get_node("Collision")
@onready var tile_map_layer = $TileMapLayer

#const TILE_SIZE
var target_pos: Vector2
var moving = false
func _ready():
	target_pos = position
#meio que o update 
func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity)
	get_input_and_move_player(collision)
	animate()
	flip_sprite_direction_based_on_velocity()
	pass
	
func get_input_and_move_player(collision:KinematicCollision2D) -> void:
	#ui_right eh o input do botao direito etc, diminui para pegar o negativo ou positivo e definir velocidade
	if not moving:
		var input = Vector2.ZERO
		
		if Input.is_action_just_pressed("ui_right"): 
			input = Vector2.RIGHT
		elif Input.is_action_just_pressed("ui_left"): 
			input = Vector2.LEFT
		elif Input.is_action_just_pressed("ui_down"): 
			input = Vector2.DOWN
		elif Input.is_action_just_pressed("ui_up"): 
			input = Vector2.UP
		
		if input != Vector2.ZERO:
			
			target_pos = position + input * Globals.TILE_SIZE
			velocity = input * Globals.PLAYER_SPEED
			moving = true
		
	if moving:
		#var tile_atlas_coords = tile_map_layer.get_cell_atlas_coords(0)
		move_and_slide()
		if (position.distance_to(target_pos) >= 0.5) or (collision):
			print("nao moving")
			position = target_pos
			velocity = Vector2.ZERO
			moving = false
	print(target_pos)
	pass
#fazer depois de placeholder eon
func animate() -> void:
	#mover
	if velocity != Vector2.ZERO:
		pass
	else:
		pass
	pass

#placehgolder sprite test
func flip_sprite_direction_based_on_velocity() -> void:
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	
