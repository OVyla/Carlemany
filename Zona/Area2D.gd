extends Area2D

export var velocitat = 500
var direccio = Vector2(0,0)

func _ready():
	position = Vector2(500,300)

func _process(delta):
	direccio = Vector2.ZERO
	
	if Input.is_action_pressed("mov_dreta"):
		direccio += Vector2.RIGHT
	if Input.is_action_pressed("mov_esq"):
		direccio += Vector2.LEFT
	if Input.is_action_pressed("mov_amunt"):
		direccio += Vector2.UP
	if Input.is_action_pressed("mov_avall"):
		direccio += Vector2.DOWN

	position += direccio.normalized() * velocitat * delta
