extends CharacterBody2D

@export var base_speed = 300
var speed
@export var acceleration_factor = 1.1
var screen_size
var rng = RandomNumberGenerator.new()
var direction : Vector2
var collision
var collider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	new_ball()
	
func new_ball():
	position.x = screen_size.x/2
	position.y = rng.randi_range(200, screen_size.y - 200)
	direction = Vector2.RIGHT.rotated(2*PI*rng.randf())
	speed = base_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var velocity = direction.normalized() * speed
	collision = move_and_collide(velocity * delta)
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player1" or collider == $"../Player2":
			direction = new_direction(collider)
		if collider == $"../Borders":
			direction = direction.bounce(collision.get_normal())
		speed *= 1.1
	
func new_direction(collider):
	return Vector2(-direction.x, ((position.y - collider.position.y) / (collider.player_height / 2)) * 0.6)
	direction.x = -direction.x
	
	
	
