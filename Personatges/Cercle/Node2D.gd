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

func _on_Node2D_area_entered(area: Area2D):
	if area.is_in_group('Inici'):
		area.modulate = Color(50,0,0)
	else:
		area.modulate = Color(0,0,50)
	if area.is_in_group('límit'):
		print("limit")
		
	
func _on_Node2D_area_exited(area):
	area.modulate = Color(1,1,1,1)
