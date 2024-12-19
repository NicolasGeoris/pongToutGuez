extends Sprite2D

var score = [0 ,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_score_left_body_entered(body: Node2D) -> void:
	$Ball.new_ball()
	score[1] += 1
	$HUD/ScoreRight.text = str(score[1])


func _on_score_right_body_entered(body: Node2D) -> void:
	$Ball.new_ball()
	score[0]+= 1
	$HUD/ScoreLeft.text = str(score[0])
