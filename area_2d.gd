extends Area2D

var g = 200
var vx = 0

@onready var arschloch = $"../Arschloch"
@onready var sign = $"../Sign"
	

func _physics_process(delta: float) -> void:
	position.y += g*delta
	position.x += vx * delta


func reset(area):
	sign.hide()
	arschloch.ist_gut = false
	position = Vector2(331,11)
	vx = 0
	$AnimatedSprite2D.frame = 0
