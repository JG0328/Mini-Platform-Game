extends Control



func _on_StartGameBtn_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_QuitGameBtn_pressed():
	get_tree().quit()
