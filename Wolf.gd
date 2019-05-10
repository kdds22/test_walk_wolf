extends KinematicBody2D


export (int, 100, 1000, 50) var GRAVITY = 100
export (int, 10, 1000, 10) var speed = 300

var velocity = Vector2()


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
