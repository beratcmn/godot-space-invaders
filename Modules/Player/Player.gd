extends Area2D

var speed: int = 400
var movementVector: Vector2 = Vector2(0, 0)

var shipMovementPadding: float = 50

var Bullet = preload("res://Modules/PlayerBullet/PlayerBullet.tscn")

var Level: Node2D

func _ready() -> void:
	Level = get_tree().get_root().get_child(0)

func _process(delta: float) -> void:
	HandleMovementInput()
	
	if Input.is_action_just_released("shoot"):
		var bullet = Bullet.instance()
		bullet.global_position = $BulletSpawnPoint.global_position
		Level.add_child(bullet)

func _physics_process(delta: float) -> void:
	global_position += movementVector * speed * delta

func HandleMovementInput():
	movementVector = Vector2(
		1 if Input.is_action_pressed("move_right") and global_position.x < 480 - shipMovementPadding else -1 if Input.is_action_pressed("move_left") and  global_position.x > 0 + shipMovementPadding else 0,
		0
	)
