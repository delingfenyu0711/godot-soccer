extends PlayerState
class_name PlayerSstateRecovering

const DURATION_RECOVERY := 500

var time_stat_tackle := Time.get_ticks_msec()

func _enter_tree() -> void:
	time_stat_tackle = Time.get_ticks_msec()
	player.velocity = Vector2.ZERO
	animation_player.play("recover")
	
func _process(_delta: float) -> void:
	if Time.get_ticks_msec() - time_stat_tackle > DURATION_RECOVERY:
		state_transition_requested.emit(Player.State.MOVING)
