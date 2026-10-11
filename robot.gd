extends CharacterBody3D
@onready var simulator = $body/Skeleton3D/PhysicalBoneSimulator3D

func _ready() -> void:
	simulator.physical_bones_start_simulation(["Armature_rootJoint"])
