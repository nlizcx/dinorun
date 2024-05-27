extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -1000.0

# G# Get the gravity from the project settings to be synced with RigidBody nodes.
const gravity = 2500


func _physics_process(delta):
	if GHUD.is_playing == true:
		if is_on_floor():
			if Input.is_action_pressed("ui_down"):
				$AnimatedSprite2D.play("dash")
			else:
				$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("jump")
			velocity.y += gravity * delta
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			$AnimatedSprite2D.play()
			velocity.y = JUMP_VELOCITY
		velocity.x = SPEED + GHUD.score
		move_and_slide()
			
