extends Node2D

@onready var display = $Layout/VBoxContainer/Display/Text

var current_value: String
var operator: String
var previous_value: String

var new_operation = false


func _add(a: float, b: float) -> float:
	return a + b


func _subtract(a: float, b: float) -> float:
	return a - b


func _multiply(a: float, b: float) -> float:
	return a * b


func _divide(a: float, b: float) -> float:
	return a / b


func _add_value(value: String) -> void:
	if new_operation:
		current_value = "" + value
		new_operation = false
		return
	
	if current_value.length() < 10:
		current_value += value


func _clear_current_value() -> void:
	if current_value != "":
		previous_value = current_value
		current_value = ""


func _reset() -> void:
	new_operation = true if operator != "" else false
	previous_value = ""
	operator = ""


func _update_display() -> void:
	display.text = previous_value + " " + operator + " " + current_value


func _on_button_1_pressed() -> void:
	_add_value("1")
	_update_display()


func _on_button_2_pressed() -> void:
	_add_value("2")
	_update_display()


func _on_button_3_pressed() -> void:
	_add_value("3")
	_update_display()


func _on_button_4_pressed() -> void:
	_add_value("4")
	_update_display()


func _on_button_5_pressed() -> void:
	_add_value("5")
	_update_display()


func _on_button_6_pressed() -> void:
	_add_value("6")
	_update_display()


func _on_button_7_pressed() -> void:
	_add_value("7")
	_update_display()


func _on_button_8_pressed() -> void:
	_add_value("8")
	_update_display()


func _on_button_9_pressed() -> void:
	_add_value("9")
	_update_display()


func _on_button_0_pressed() -> void:
	_add_value("0")
	_update_display()


func _on_dot_pressed() -> void:
	_add_value(".")
	_update_display()


func _on_equals_pressed() -> void:	
	match operator:
		"+":
			current_value = str(
				_add(float(previous_value), float(current_value))
				)
		"-":
			current_value = str(
				_subtract(float(previous_value), float(current_value))
				)
		"*":
			current_value = str(
				_multiply(float(previous_value), float(current_value))
			) if current_value != "" else previous_value
		"/":
			current_value = str(
				_divide(float(previous_value), float(current_value))
			) if current_value != "" else previous_value
	
	_reset()
	_update_display()


func _on_plus_btn_pressed() -> void:
	_on_equals_pressed()
	_clear_current_value()
	operator = "+"
	_update_display()


func _on_minus_btn_pressed() -> void:
	_on_equals_pressed()
	_clear_current_value()
	operator = "-"
	_update_display()


func _on_times_btn_pressed() -> void:
	_on_equals_pressed()
	_clear_current_value()
	operator = "*"
	_update_display()


func _on_by_btn_pressed() -> void:
	_on_equals_pressed()
	_clear_current_value()
	operator = "/"
	_update_display()
