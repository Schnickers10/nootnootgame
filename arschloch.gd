extends CharacterBody2D
var fallend: Area2D
var fallend_sprite: AnimatedSprite2D
var sign: Area2D
var sign_sprite: AnimatedSprite2D
var r = 0
var ist_gut

func _ready() -> void:
	ist_gut = false
	fallend = $"../Area2D"
	fallend_sprite = $"../Area2D/AnimatedSprite2D"
	sign = $"../Sign"
	sign_sprite = $"../Sign/AnimatedSprite2D"
	
	sign.hide()
	

func _input(event: InputEvent):
	if event.is_action_pressed("hit"):
		hit()
		$AnimatedSprite2D.frame = 1
	if event.is_action_released("hit"):
		$AnimatedSprite2D.frame = 0

func hit() -> void:
	r = randi_range(360, 900)
	if fallend.position.y < 355 and fallend.position.y > 300:
		sign.show()
		fallend.vx = 600
		sign_sprite.frame = 0
		fallend_sprite.frame = 1
	elif fallend.position.y < 370 and fallend.position.y > 355:
		sign.show()
		ist_gut = true
		fallend.vx = 600
		sign_sprite.frame = 1
		fallend_sprite.frame = 1
		await get_tree().create_timer(1.9).timeout
		get_tree().change_scene_to_file("res://video.tscn")
	elif fallend.position.y < 475 and fallend.position.y > 370:
		sign.show()
		fallend.vx = 600
		sign_sprite.frame = 2
		fallend_sprite.frame = 1

func _physics_process(delta: float) -> void:
	if (fallend.position.x < r and fallend.position.x > 340) or ist_gut:
		fallend.g = 0
	else:
		fallend.g = 200
