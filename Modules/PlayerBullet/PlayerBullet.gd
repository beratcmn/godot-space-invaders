extends Area2D

var speed: int = 500

func _ready() -> void:
	pass # Replace with function body.


#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
	global_position.y -= speed * delta


func _on_Timer_timeout() -> void:
	queue_free()
