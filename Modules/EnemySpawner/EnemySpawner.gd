extends Node2D

var spawnPositions = null

var EnemyScene = preload("res://Modules/Enemies/EnemyShip1/EnemyShip1.tscn")

func _ready() -> void:
	#randomize()
	spawnPositions = $SpawnPositions.get_children()
	
#func _process(delta: float) -> void:
#	pass

func SpawnEnemy():
	var index = randi()% spawnPositions.size()
	var enemy = EnemyScene.instance()
	enemy.global_position = spawnPositions[index].global_position
	$Enemies.add_child(enemy)

func _on_Timer_timeout() -> void:
	SpawnEnemy()
