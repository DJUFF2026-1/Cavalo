extends PopupPanel

@onready var parentNode = get_parent()
@onready var nextButton = get_node("MenuButton")
@onready var popupRoleta = parentNode.get_node("PopupRoleta")

func _ready() -> void:
	nextButton.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	hide()
	popupRoleta.popup()
