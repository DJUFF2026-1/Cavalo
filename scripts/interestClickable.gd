extends Area2D
@onready var colision: CollisionShape2D = get_node("CollisionShape2D")
@onready var parentNode = get_parent()
#@onready var popUpMenubaseNode = parentNode.get_node("PopupMenuRoleta")
#@onready var popupInteracMenu = popUpMenubaseNode.get_node("PopupInteracMenu")
@onready var roletaMenuScene = preload("res://scenes/scene_obj/popup_menu_roleta.tscn")
var inside:bool = false
var roletaMenu = null

func _mouse_enter() -> void:
	inside = true
	
func _mouse_exit() -> void:
	inside = false

func _physics_process(delta: float) -> void:
	if_mouse_and_click()
	pass

func if_mouse_and_click() -> void:
	if (inside and Input.is_action_just_pressed("ui_left_mouse_click")):
		roletaMenu = roletaMenuScene.instantiate()
		get_tree().current_scene.add_child(roletaMenu)

		# desativa player principal
		var main_player = parentNode.get_node("Player")
		#roletaMenu.position = main_player.position
		main_player.active = false

		# ativa player submenu
		var sub_player = roletaMenu.get_node("Roleta").get_node("Player")
		sub_player.active = true
	
	if (not inside and Input.is_action_just_pressed("ui_left_mouse_click")):
		if roletaMenu != null:
			roletaMenu.close()
			var main_player = parentNode.get_node("Player")
			main_player.active = true
