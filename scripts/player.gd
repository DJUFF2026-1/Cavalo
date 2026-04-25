extends CharacterBody2D
#onready var animation: AnimationPlayer = get_node("Animation")
@onready var sprite: Sprite2D = get_node("Sprite")

#const TILE_SIZE
var target_pos: Vector2
var moving = false
func _ready():
	target_pos = position

#meio que o update 
func _physics_process(delta: float) -> void:
	get_input_and_move_player()
	animate()
	flip_sprite_direction_based_on_velocity()
	pass
	
func get_input_and_move_player() -> void:
	#ui_right eh o input do botao direito etc, diminui para pegar o negativo ou positivo e definir velocidade
	if not moving:
		var input = Vector2.ZERO
		
		if Input.is_action_just_pressed("ui_right"): 
			input = Vector2.RIGHT
			velocity = velocity * (-1)
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
		#position = position.move_toward(target_pos, Globals.PLAYER_SPEED)
		move_and_slide()
		if position.distance_to(target_pos) == 0.0:
			position = target_pos
			velocity = Vector2.ZERO
			moving = false
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
	
