extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "[rainbow freq=0.5 sat=0.8 val=0.9][wave amp=30 freq=10]Pong tout guez \n Z et S pour déplacer le joueur de gauche \n flèches pour le joeur de dorite[/wave][/rainbow]"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
