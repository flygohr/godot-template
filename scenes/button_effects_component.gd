extends Node
class_name ButtonEffectsComponent

@export var ease_type: Tween.EaseType
@export var transition_type: Tween.TransitionType
@export var animation_duration: float = 0.1
@export var scale_amount: Vector2 = Vector2(1.0,1.0)
@export var rotation_amount: float = 0.0
@export var outline_color_hover: Color = Color.html("#FFFFFF")
@export var outline_color_focus: Color = Color.html("#FFFFFF")

@onready var button: Button = get_parent()

var tween: Tween
var background_rect: ColorRect

func _ready() -> void:
	button.mouse_entered.connect(_on_mouse_hovered.bind(true))
	button.mouse_exited.connect(_on_mouse_hovered.bind(false))
	button.pressed.connect(_on_mouse_pressed)
	
	background_rect = ColorRect.new()
	background_rect.hide()
	background_rect.position += Vector2(-1, -1)
	background_rect.size = button.size+Vector2(2,2)
	background_rect.z_index = button.z_index -1
	background_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	background_rect.color = Color(1.0, 1.0, 1.0, 0.0)
	button.add_child.call_deferred(background_rect)
	
func _on_mouse_hovered(hovered: bool) -> void:
	reset_tween()
	tween.tween_property(background_rect, "visible", true if hovered else false, 0.0)
	tween.tween_property(background_rect, "color", outline_color_hover if hovered else Color(0.0, 0.0, 0.0, 0.0), animation_duration)

func _on_mouse_pressed() -> void:
	reset_tween()
	
	tween.tween_property(background_rect, "visible", true, 0.0)
	tween.tween_property(background_rect, "color", outline_color_focus, animation_duration)
	
func reset_tween() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_ease(ease_type).set_trans(transition_type).set_parallel(true)
