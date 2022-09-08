extends Area2D

export var hp: int = 50

export var speed: int = 100

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	DestroyEnemyOutOfScreen()

func _physics_process(delta: float) -> void:
	global_position.y += speed * delta


func DestroyEnemyOutOfScreen():
	if global_position.y > (get_viewport_rect().size.y + 15):
		queue_free()

func TakeDamage(_damage: int):
	hp -= _damage
	if (hp <= 0):
		var player = get_tree().get_root().get_child(0).get_node("Player")
		player.playerScore += 1
		queue_free()


func _on_EnemyShip1_area_entered(area: Area2D) -> void:
	if (area is Player):
		area.TakeDamage(50)
