extends KinematicBody2D

var velocitat_inicial = 100
var velocitat = Vector2.ZERO 
var gravetat = Vector2.DOWN * 800
var velocitat_salt = -325
var n_salt = 0

func _physics_process(delta):
	velocitat += gravetat * delta
	velocitat.x = 0
	
	if Input.is_action_pressed("mov_dreta"):
		velocitat += Vector2.RIGHT * velocitat_inicial
		
	if Input.is_action_pressed("mov_esq"):
		velocitat += Vector2.LEFT * velocitat_inicial
	
	if Input.is_action_pressed("mov_amunt") and is_on_floor():
		velocitat.y = velocitat_salt

#		n_salt -= 1
#
#	if Input.is_action_just_pressed("mov_amunt") and n_salt > 0:
#		velocitat.y = velocitat_salt
#		n_salt -= 1
#
#	if is_on_floor():
#		n_salt = 1

	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	
func anima(velocitat):
	if velocitat.x < 0:
		$AnimatedSprite.play('Córrer')
		$AnimatedSprite.flip_h = true
	if 0 < velocitat.x:
		$AnimatedSprite.play('Córrer')
		$AnimatedSprite.flip_h = false
	if velocitat.x == 0:
		$AnimatedSprite.play('Quiet')
	if velocitat.y < 0:
		$AnimatedSprite.play('Salt')
	if velocitat.y > 0:
		$AnimatedSprite.play('Caiguda')

#func _on_StaticBody2D_body_entered(body):
#	get_tree().change_scene("res://Escenes/Escena_2.tscn")


func _on_Area2D_body_entered(body):
	position = Vector2(102, 159)
