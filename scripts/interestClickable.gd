extends Area2D
@onready var colision: CollisionShape2D = get_node("CollisionShape2D")
@onready var parentNode = get_parent()
@onready var popUpMenubaseNode = parentNode.get_node("PopupMenuRoleta")
@onready var popupInteracMenu = popUpMenubaseNode.get_node("PopupInteracMenu")

var inside:bool = false

func _mouse_enter() -> void:
	inside = true
	
func _mouse_exit() -> void:
	inside = false

func _physics_process(delta: float) -> void:
	if_mouse_and_click()
	pass

func if_mouse_and_click() -> void:
	if (inside and Input.is_action_just_pressed("ui_left_mouse_click")):
		#print("clicou elem interessante . . . ")
		popupInteracMenu.popup()
