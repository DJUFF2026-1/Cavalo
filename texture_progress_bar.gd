extends TextureProgressBar
@export var texture_progress_bar_2: TextureProgressBar

var time: float = 0.0
@export var time_max: float = 600.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = time_max
	value = 0.0 

var corGradiente: float = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time <= time_max:
		time += delta
		value = time
		texture_progress_bar_2.modulate = Color(1.0, 0.0, 0.0, 0.0 + 1.0 * value / max_value + 0.1)
	else: 
		print("Game Over!") #aqui deve entrar a tela de game over
