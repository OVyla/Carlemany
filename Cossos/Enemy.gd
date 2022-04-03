extends KinematicBody2D

var velocitat = Vector2.LEFT * 50
var gravetat = Vector2.DOWN * 800

func _process(delta):
	
	if is_on_wall():
		velocitat.x *= -1
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	anima(velocitat)
	
func anima(velocitat):
	if velocitat.x > 0:
		$AnimatedSprite.play('avança')
		$AnimatedSprite.flip_h = false
	if velocitat.x < 0:
		$AnimatedSprite.play('avança')
		$AnimatedSprite.flip_h = true

