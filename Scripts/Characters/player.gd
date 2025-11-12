extends CharacterBody2D
class_name Player

enum ControlScheme {CPU,P1,P2}

@export var control_scheme : ControlScheme
@export var speed : float

@onready var animation_player : AnimationPlayer = %AnimationPlayer
@onready var player_Sprite : Sprite2D = %PlayerSprite

var heading := Vector2.RIGHT

func _ready() -> void:
	pass
	
func _physics_process(_delta: float) -> void:
	if control_scheme == ControlScheme.CPU:
		pass
	else:
		handle_human_movement()
	set_movement_animation()
	set_heading()
	flip_sprites()
	move_and_slide()

func handle_human_movement():
	var direction := KeyUtils.get_input_vector(control_scheme)
	velocity = direction * speed

func set_movement_animation() -> void:
	if velocity.length() > 0:
		animation_player.play("run")
	else:
		animation_player.play("idle")

func set_heading() -> void:
	if velocity.x > 0:
		heading = Vector2.RIGHT
	elif velocity.x < 0:
		heading = Vector2.LEFT

func flip_sprites() -> void:
	#player_Sprite.flip_h = true if heading == Vector2.LEFT else false
	
	if heading == Vector2.RIGHT:
		player_Sprite.flip_h = false
	elif heading == Vector2.LEFT:
		player_Sprite.flip_h = true
