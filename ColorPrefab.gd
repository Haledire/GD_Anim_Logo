tool
extends HBoxContainer

export(Color) var fill = Color.white setget set_fill
export(Color) var stroke = Color.white setget set_stroke
export(bool) var linked = true setget push_linked

func set_fill(val):
	fill = val
	if linked:
		set_stroke(val)
		if Engine.editor_hint:
			property_list_changed_notify()
	if is_inside_tree():
		$Fill.color = val
	
func set_stroke(val):
	stroke = val
	if is_inside_tree():
		$Stroke.color = val
		
func push_linked(val):
	linked = val
	if linked:
		set_stroke(fill)
		property_list_changed_notify()
		
func _ready():
	set_fill(fill)
	set_stroke(stroke)
