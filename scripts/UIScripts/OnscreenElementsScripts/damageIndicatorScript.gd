extends Label

func setup(damageAmount: int, start_position: Vector2) -> void:
	text = str(damageAmount)
	global_position = start_position
	
	global_position.x += randf_range(-10.0, 10.0)
	
	var tween = create_tween().set_parallel(true)
	
	tween.tween_property(self, "global_position:y", global_position.y - 10.0, 0.6)\
		.set_trans(Tween.TRANS_BACK)\
		.set_ease(Tween.EASE_OUT)
		
	tween.tween_property(self, "modulate:a", 0.0, 0.6)\
		.set_trans(Tween.TRANS_BACK)\
		.set_ease(Tween.EASE_IN)
		
	tween.finished.connect(queue_free)
