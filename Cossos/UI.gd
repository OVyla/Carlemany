extends CanvasLayer

var pinyes = 0


func _ready():
	var senyal = get_tree().get_root().fnd_node('Pinya', true, false)
	senyal.connect('pinya_agafada', self, 'num')
	$Nombre_pinyes.text = String(pinyes)
func num():
	print('pinya agafada')
	pinyes += 1
	$Nombre_pinyes.text = String(pinyes)
