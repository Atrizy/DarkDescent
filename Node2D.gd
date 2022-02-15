extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 100
const GRAVITY = 30
const JUMPFORCE = -500

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = false
		$CollisionShape2D2.position.x = 3
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		$Sprite.play("Walk")
		$Sprite.flip_h = true
		$CollisionShape2D2.position.x = -3
	else:
		$Sprite.play("Idle")
		
	if not is_on_floor():
		$Sprite.play("Jump")
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.23)
