extends CharacterBody3D

@export_category("movement")
@export var mouse_sensitivity = 1.0
@export var speed = 8

@export_category("rotation limits & tresholds")
# limits in degrees as deviation from straight ahead (0°)
## limit how much is plaayer able to look up and down
@export var vertical_limit = 85
## how much can player look to one side before pelvis tries to catch up
@export var rotation_limit = 45
## how much can player look to side before strafing changes
@export var deadzone_threshold = 15
## how much can player look to side before strafing changes again
@export var side_deadzone_threshold = 30


func _physics_process(delta: float) -> void:
	pass