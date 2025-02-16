extends Area2D

@export var speed = 400
var angle = 0
var current_animation = "idle"
var screen_size
var velocity = Vector2.ZERO

@onready var playerAnimation = $AnimatedSprite2D

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	current_animation = "Idle"
	var input_dir = Input.get_vector("Left","Right","Up","Down")
	if input_dir.length() != 0:
		angle = input_dir.angle() / (PI/4)
		angle = wrapi(int(angle), 0, 8)
		angle = angle_match(angle)
		current_animation = "Run"
	velocity = input_dir * speed
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	playerAnimation.play(current_animation + str(angle))
	

func start(pos):
	position = pos

func angle_match(angle):
	if angle == 0:
		return 2
	if angle == 1:
		return 1
	if angle == 2:
		return 0
	if angle == 3:
		return 7
	if angle == 4:
		return 6
	if angle == 5:
		return 5
	if angle == 6:
		return 4
	if angle == 7:
		return 3
