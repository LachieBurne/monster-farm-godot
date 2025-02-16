extends Node2D

@onready var startPosition = $StartPosition
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.start(startPosition.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
