extends CanvasLayer
class_name UI

@onready var health_label = %Health

func _ready() -> void:
	display_health()

func _update_health_label():
	display_health()
	
func display_health():
	health_label.text = "Health: " + str(PlayerGlobals.current_health)
