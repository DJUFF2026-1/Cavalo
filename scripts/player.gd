extends CharacterBody2D
#onready var animation: AnimationPlayer = get_node("Animation")
@onready var sprite: Sprite2D = get_node("Sprite")

#const TILE_SIZE

#meio que o update 
func _physics_process(delta: float) -> void:
	get_input_and_move_player()
	animate()
	flip_sprite_direction_based_on_velocity()
	pass
	
func get_input_and_move_player() -> void:
	#ui_right eh o input do botao direito etc, diminui para pegar o negativo ou positivo e definir velocidade
	var direction_vector: Vector2 = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
	velocity = direction_vector * Globals.PLAYER_SPEED
	#atualiza posicao conforme velocidade
	move_and_slide()
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
	
