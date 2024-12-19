extends StaticBody2D

@export var player_number = 1
@export var speed = 400
var screen_size
var player_height

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = $"../ColorRect".size
	player_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if player_number == 1:
		if Input.is_action_pressed("left_player_up"):
			velocity.y -= 1
		if Input.is_action_pressed("left_player_down"):
			velocity.y += 1
	else:
		if Input.is_action_pressed("right_player_up"):
			velocity.y -= 1
		if Input.is_action_pressed("right_player_down"):
			velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position.y = clamp(position.y, player_height/2, screen_size.y - player_height/2)
