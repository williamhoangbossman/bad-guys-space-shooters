extends RichTextLabel

func _ready():
	var scrollbar = get_v_scroll_bar()
	
	var normal_style = StyleBoxFlat.new()
	normal_style.bg_color = Color("34DDEC") # Your normal color
	normal_style.set_corner_radius_all(4)
	
	var hover_style = StyleBoxFlat.new()
	hover_style.bg_color = Color("94DDE4")
	hover_style.set_corner_radius_all(4)
	
	scrollbar.add_theme_stylebox_override("grabber", normal_style)
	scrollbar.add_theme_stylebox_override("grabber_highlight", hover_style)
	scrollbar.add_theme_stylebox_override("grabber_pressed", hover_style)
