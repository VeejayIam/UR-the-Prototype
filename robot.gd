extends CharacterBody3D

@export_category("movement")
## how much is mouse senstive to movement
@export var mouse_sensitivity : float = 1.0
## movement speed
@export var speed : float = 8
## how fast will pelvis rotate to get back to 0°
@export var pelvis_rotation_speed : float = 1

@export_category("rotation limits & tresholds")
# limits in degrees as deviation from straight ahead (0°)
## limit how much is plaayer able to look up and down
@export var vertical_limit : int = 85
## how much can player look to one side before pelvis tries to catch up
@export var horizontal_soft_limit : int = 45
## how much can head_target rotate against the pelvis
@export var horizontal_hard_limit : int = 120
## how much can player look to side before strafing changes
@export var middle_deadzone_threshold : int = 15
## how much can player look to side before strafing changes again
@export var side_deadzone_threshold : int = 30
## how small head_delta needs to be to stop correcting pelvis 
@export var pelvis_correction_treshold : float = 0.01

var correct_pelvis : bool = false

@onready var head_target : Marker3D = $"look target"

func vec2_to_vec3(input : Vector2) -> Vector3:
	var output : Vector3 = Vector3.ZERO
	output.x = input.x
	output.z = input.y

	return output

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	if correct_pelvis:
		var head_delta = head_target.rotation_degrees.y - lerp(head_target.rotation_degrees.y, 0.0, pelvis_rotation_speed*delta)
		if abs(head_delta) < pelvis_correction_treshold:
			correct_pelvis = false
		else:
			head_target.rotation_degrees.y -= head_delta
			rotation_degrees.y += head_delta

	var direction := Input.get_vector("left", "right", "forward", "backward")
	var movement := Vector2.ZERO

	if abs(head_target.rotation_degrees.y) > horizontal_soft_limit:
		correct_pelvis = true
		movement = direction.rotated(head_target.rotation.y)
	elif abs(head_target.rotation_degrees.y) > side_deadzone_threshold:
		movement = direction
	elif abs(head_target.rotation_degrees.y) > middle_deadzone_threshold: 
		# wierd things happen here
		if direction.x == 0:
			movement = direction
		elif direction.x < 0:
			movement.y = direction.y
			movement = movement.rotated(sign(head_target.rotation.y) * head_target.rotation.y)
		elif direction.x > 0:
			movement.y = direction.y
			movement = movement.rotated(-sign(head_target.rotation.y) * head_target.rotation.y)
			
	elif abs(head_target.rotation_degrees.y) <= middle_deadzone_threshold:
		# strafe perp to pelvis
		movement = direction
	else:
		push_error("yep, it's fucked at angle %.2f" % head_target.rotation_degrees.y)


	velocity = vec2_to_vec3(movement * speed * delta)

	move_and_slide()

var prev_pelvis_rotation = 0
var prev_head_rotation = 0

func _process(delta: float) -> void:
	$"HBoxContainer/VBoxContainer2/head rotation num".text = str("%.2f" % head_target.rotation_degrees.y)
	$"HBoxContainer/VBoxContainer2/pelvis rotation num".text = str("%.2f" % rotation_degrees.y)

	$"HBoxContainer/VBoxContainer3/head rotation delta".text = "%.2f" % (head_target.rotation_degrees.y - prev_head_rotation)
	$"HBoxContainer/VBoxContainer3/pelvis rotation delta".text = "%.2f" % (rotation_degrees.y - prev_pelvis_rotation)

	prev_pelvis_rotation = rotation_degrees.y
	prev_head_rotation = head_target.rotation_degrees.y

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head_target.rotation_degrees.x += event.relative.y * -mouse_sensitivity
		head_target.rotation_degrees.y += event.relative.x * -mouse_sensitivity

		head_target.rotation_degrees.x = clamp(head_target.rotation_degrees.x, -vertical_limit, vertical_limit)
		head_target.rotation_degrees.y = clamp(head_target.rotation_degrees.y, -horizontal_hard_limit, horizontal_hard_limit)
