extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(2), "timeout")
	$AnimationPlayer.play("Fade")
	yield(get_tree().create_timer(4), "timeout")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/NewTestLevel.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.
