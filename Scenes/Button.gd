extends Area2D

var can_press
var been_pressed = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var DisplayValue = 9
onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_press:
		if Input.is_action_pressed("ui_accept"):
			been_pressed = true;
			pressed()
	if been_pressed:
		$Pressed.show()
		$Prompt.hide()
	else:
		$Display.show()	

func _on_Button_body_entered(body):
	if !been_pressed:
		$Prompt.show()
	can_press = true

func _on_Button_body_exited(body):
	$Prompt.hide()
	can_press = false
	
func pressed():
	timer.set_wait_time(3)
	$Display.hide()
	timer.set_wait_time(1)
	been_pressed = false
	DisplayValue = 9

func _on_Timer_timeout():
	if DisplayValue > 0:
		DisplayValue -= 1
	if !been_pressed:
		$Display.show()	
		timer.start()

