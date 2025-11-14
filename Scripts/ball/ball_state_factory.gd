class_name BallStateFactory

var states :Dictionary

func _init() -> void:
	states = {
		Ball.State.CARRIED : BallStateCarried,
		Ball.State.FREEFORM : BallStateFreefrom,
		Ball.State.SHOT : BallStateShoot,
	}

func get_fresh_state(state : Ball.State) -> BallState:
	assert(states.has(state),"state doesn't exist!")
	return states.get(state).new()
	
	
