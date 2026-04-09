extends Node2D

@onready var popup: CanvasLayer = $Popup
@onready var popup_text_label: RichTextLabel = $Popup/MarginContainer/VBoxContainer/PanelContainer/MarginContainer/PopupTextLabel
@onready var no_button: Button = $Popup/MarginContainer/VBoxContainer/HBoxContainer/NoButton
@onready var yes_button: Button = $Popup/MarginContainer/VBoxContainer/HBoxContainer/YesButton
@onready var next_button: Button = $Popup/MarginContainer/VBoxContainer/HBoxContainer/NextButton

enum Modes {CONFIRMATION, DIALOG}

func show_popup(popup_text: String, mode: int, no_button_text: String = "No", yes_button_text: String = "Yes", next_button_text: String = "Next") -> void:
	match mode:
		Modes.CONFIRMATION:
			no_button.show()
			yes_button.show()
			next_button.hide()	
		Modes.DIALOG:
			no_button.hide()
			yes_button.hide()
			next_button.show()
	
	popup.show()
	popup_text_label.text = popup_text
	no_button.text = no_button_text
	yes_button.text = yes_button_text
	next_button.text = next_button_text
