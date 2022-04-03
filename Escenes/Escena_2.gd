extends Control

func _on_Start_pressed():
	get_tree().change_scene("res://Escenes/Escena_cossos.tscn")


func _on_Surt_pressed():
	get_tree().quit()
