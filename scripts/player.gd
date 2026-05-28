extends CharacterBody2D

@onready var sprite: Sprite2D = get_node("Sprite")
@onready var sceneParent = get_parent()
@onready var tile_map_layer = sceneParent.get_node("TileMapLayer")

var target_pos: Vector2

@export var last_L_dir = false
@export var active := true

var moving = false
var moving_to_L = false

var movement_of_num_tiles_count = 0

var next_pos: Vector2
var input: Vector2

var tileSize = 0
var playerVel = 0

func _ready():

	target_pos = position

	if sceneParent.half_tile:
		tileSize = Globals.TILE_SIZE / 2
		playerVel = Globals.PLAYER_SPEED / 2
	else:
		tileSize = Globals.TILE_SIZE
		playerVel = Globals.PLAYER_SPEED

func _physics_process(delta: float) -> void:

	if not active:
		return

	get_input_and_move_player(delta)

	animate()

	flip_sprite_direction_based_on_velocity()

func is_tile_walkable(world_pos: Vector2) -> bool:

	var map_pos = tile_map_layer.local_to_map(
		tile_map_layer.to_local(world_pos)
	)

	var tile_data = tile_map_layer.get_cell_tile_data(map_pos)

	if tile_data == null:
		return false

	var classe = tile_data.get_custom_data("classe")

	return classe != "parede"

func get_last_walkable_in_line(dir: Vector2) -> Vector2:

	var last_walkable = position

	for i in range(1, 3):

		var check_pos = position + dir * tileSize * i

		if is_tile_walkable(check_pos):

			last_walkable = check_pos
			movement_of_num_tiles_count += 1

		else:
			break

	return last_walkable

func turn_deslocamento_direcao_L() -> void:

	last_L_dir = !last_L_dir

func get_input_desloc_for_L_dir() -> Vector2:

	turn_deslocamento_direcao_L()

	if input == Vector2.RIGHT:

		if last_L_dir:
			return Vector2.DOWN
		else:
			return Vector2.UP

	elif input == Vector2.LEFT:

		if last_L_dir:
			return Vector2.UP
		else:
			return Vector2.DOWN

	elif input == Vector2.UP:

		if last_L_dir:
			return Vector2.RIGHT
		else:
			return Vector2.LEFT

	elif input == Vector2.DOWN:

		if last_L_dir:
			return Vector2.LEFT
		else:
			return Vector2.RIGHT

	return Vector2.ZERO

func get_desloc_to_L_dir():

	var L_dir_by_input = get_input_desloc_for_L_dir()

	next_pos = position + L_dir_by_input * tileSize

	if is_tile_walkable(next_pos):

		target_pos = next_pos

		velocity = L_dir_by_input * playerVel

		moving_to_L = true

func get_input_and_move_player(delta: float) -> void:

	if not moving and not moving_to_L:

		input = Vector2.ZERO

		if Input.is_action_just_pressed("ui_right"):
			input = Vector2.RIGHT

		elif Input.is_action_just_pressed("ui_left"):
			input = Vector2.LEFT

		elif Input.is_action_just_pressed("ui_down"):
			input = Vector2.DOWN

		elif Input.is_action_just_pressed("ui_up"):
			input = Vector2.UP

		if input != Vector2.ZERO:

			next_pos = get_last_walkable_in_line(input)

			if next_pos != position:

				target_pos = next_pos

				velocity = input * playerVel

				moving = true

	if moving:

		position += velocity * delta

		if position.distance_to(target_pos) < 0.5:

			position = target_pos

			velocity = Vector2.ZERO

			moving = false

			if movement_of_num_tiles_count == 2:
				get_desloc_to_L_dir()
			else:
				movement_of_num_tiles_count = 0

	if moving_to_L:

		position += velocity * delta

		if position.distance_to(target_pos) < 0.5:

			position = target_pos

			velocity = Vector2.ZERO

			moving_to_L = false
			moving = false

			movement_of_num_tiles_count = 0

func animate() -> void:

	if velocity != Vector2.ZERO:
		pass
	else:
		pass

func flip_sprite_direction_based_on_velocity() -> void:

	if velocity.x > 0:
		sprite.flip_h = true

	elif velocity.x < 0:
		sprite.flip_h = false
