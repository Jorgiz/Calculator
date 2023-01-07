extends Node2D

@onready var display = $Layout/VBoxContainer/Display/Text


var value1_txt: String = ""
var operator: String = ""
var value2_txt: String = ""

var value1: float
var value2: float

var value1_is_empty: bool
var value2_is_empty: bool

var new_operation := false


func _add_to_value2(value: String) -> void:
	if new_operation:
		value1_txt = ""
		_set_value2("")
		value2_txt += value
		value2 = float(value2_txt)
		new_operation = false
	else:
		value2_txt += value
		value2 = float(value2_txt)


func _set_value2(value: String) -> void:
	value2_txt = value
	value2 = float(value2_txt)


func _check_values() -> void:
	value1_is_empty = value1_txt == ""
	value2_is_empty = value2_txt == "" or value2_txt == "+" or value2_txt == "-"


func _value2_to_value1() -> void:
	value1_txt = value2_txt
	value2_txt = ""
	value1 = float(value1_txt)
	value2 = float(value2_txt)


func _addition(a: float, b: float) -> void:
	value1 = a + b
	value1_txt = str(value1)
	_set_value2("")

func _multiplication(a: float, b: float) -> void:
	value1 = a * b
	value1_txt = str(value1)
	_set_value2("")


func _update_display() -> void:
	display.text = value1_txt + operator + value2_txt


func _on_button_1_pressed() -> void:
	_add_to_value2("1")
	_update_display()


func _on_button_2_pressed() -> void:
	_add_to_value2("2")
	_update_display()


func _on_button_3_pressed() -> void:
	_add_to_value2("3")
	_update_display()


func _on_button_4_pressed() -> void:
	_add_to_value2("4")
	_update_display()


func _on_button_5_pressed() -> void:
	_add_to_value2("5")
	_update_display()


func _on_button_6_pressed() -> void:
	_add_to_value2("6")
	_update_display()


func _on_button_7_pressed() -> void:
	_add_to_value2("7")
	_update_display()


func _on_button_8_pressed() -> void:
	_add_to_value2("8")
	_update_display()


func _on_button_9_pressed() -> void:
	_add_to_value2("9")
	_update_display()


func _on_button_0_pressed() -> void:
	_add_to_value2("0")
	_update_display()


func _on_dot_pressed() -> void:
	_add_to_value2(".")
	_update_display()


func _on_equals_pressed() -> void:
	_check_values()
	
	if not value1_is_empty and not value2_is_empty:
		match operator:
			"*":
				_multiplication(value1, value2)
			"/":
				_multiplication(value1, 1/value2)
			"":
				_addition(value1, value2)
		
	
	operator = ""
	new_operation = true
	
	_update_display()


func _on_plus_btn_pressed() -> void:
	_check_values()
	
	if value2_is_empty:
		_set_value2("+")
		
	elif value1_is_empty and not value2_is_empty:
		_value2_to_value1()
		_set_value2("+")
		
	elif not value1_is_empty and not value2_is_empty:
		_on_equals_pressed()
		_set_value2("+")
	
	new_operation = false
	_update_display()


func _on_minus_btn_pressed() -> void:
	_check_values()
	
	if value2_is_empty:
		_set_value2("-")
		
	elif value1_is_empty and not value2_is_empty:
		_value2_to_value1()
		_set_value2("-")
		
	elif not value1_is_empty and not value2_is_empty:
		_on_equals_pressed()
		_set_value2("-")
	
	new_operation = false
	_update_display()


func _on_times_btn_pressed() -> void:
	_check_values()
	
	if not value1_is_empty and value2_is_empty:
		operator = "*" if operator != "*" else ""
	
	elif value1_is_empty and not value2_is_empty:
		_value2_to_value1()
		_set_value2("")
		operator = "*" if operator != "*" else ""
	
	elif not value1_is_empty and not value2_is_empty:
		_on_equals_pressed()
		operator = "*" if operator != "*" else ""
	
	new_operation = false
	_update_display()


func _on_by_btn_pressed() -> void:
	_check_values()
	
	if not value1_is_empty and value2_is_empty:
		operator = "/" if operator != "/" else ""
	
	elif value1_is_empty and not value2_is_empty:
		_value2_to_value1()
		_set_value2("")
		operator = "/" if operator != "/" else ""
	
	elif not value1_is_empty and not value2_is_empty:
		_on_equals_pressed()
		operator = "/" if operator != "/" else ""
	
	new_operation = false
	_update_display()
