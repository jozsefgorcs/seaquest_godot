extends AnimatedSprite2D

var velocity = Vector2(0, 0)
const SPEED = Vector2(125, 90) 
const BULLET = preload("res://player/player_bullet/player_bullet.tscn")
const BULLET_OFFSET = 7
var can_shoot = true

@onready var reload_timer = $ReloadTimer


func _process(delta):
	velocity.x = Input.get_axis("move_left","move_right")
	velocity.y = Input.get_axis("move_up","move_down")
	
	velocity = velocity.normalized()
	
	if velocity.x > 0:
		flip_h = false
	elif velocity.x < 0:
		flip_h = true
		
	if Input.is_action_pressed("shoot") and can_shoot:
		var bullet_instance = BULLET.instantiate()
		
		get_tree().current_scene.add_child(bullet_instance)  
		if flip_h:
			bullet_instance.velocity.x = -1
			bullet_instance.velocity.y = -bullet_instance.velocity.y
			bullet_instance.flip_h = true
			bullet_instance.global_position = global_position - Vector2(BULLET_OFFSET,0)
		else:
			bullet_instance.global_position = global_position + Vector2(BULLET_OFFSET,0)	
		can_shoot = false
		reload_timer.start()
	

func _physics_process(delta):
	global_position += velocity * delta * SPEED


func _on_reload_timer_timeout():
	can_shoot = true # Replace with function body.
