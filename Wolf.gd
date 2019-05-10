extends KinematicBody2D


export (int, 100, 1000, 50) var GRAVITY = 100
export (int, 10, 1000, 10) var speed = 300

export (int, 1, 2, 1) var Wolf_type
#export (String, FILE, "*png") var White_Wolf
#export (String, FILE, "*png") var Black_Wolf

var white_wolf_sprite = "res://assets/wolf-Sheet.png"
var black_wolf_sprite = "res://assets/black-wolf-Sheet.png"


var velocity = Vector2()

func _ready():
	if Wolf_type == 1:
		$Sprite.texture = load(white_wolf_sprite)
	elif Wolf_type == 2:
		$Sprite.texture = load(black_wolf_sprite)
	else:
		$Sprite.texture = white_wolf_sprite

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if Input.is_action_pressed("ui_left"):
		$Sprite.scale = Vector2(1,1)
		velocity.x = -speed
		$AnimationPlayer.play("walk")
	elif Input.is_action_pressed("ui_right"):
		$Sprite.scale = Vector2(-1,1)
		velocity.x = speed
		$AnimationPlayer.play("walk")
	else: 
		velocity.x = 0
		$AnimationPlayer.stop()
	
#	var motion = velocity * delta
	move_and_slide(velocity, Vector2(0,-1))


func _on_Area2D_area_entered(area):
	if area.is_in_group("coin"):
		area.queue_free()
