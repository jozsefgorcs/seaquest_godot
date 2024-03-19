extends AnimatedSprite2D

const SPEED = 50
const MOVEMENT_FREQUENCY = 0.15
const MOVEMENT_AMPLITUDE = 0.5
var velocity = Vector2(1,0)

func _physics_process(delta):
	velocity.y = sin(global_position.x * MOVEMENT_FREQUENCY) * MOVEMENT_AMPLITUDE
	global_position += velocity * SPEED * delta


func _on_hitbox_area_entered(area):
	queue_free()
	area.get_parent().queue_free()
