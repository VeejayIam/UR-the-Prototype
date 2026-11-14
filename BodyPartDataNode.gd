@tool
class_name BodyPartData
extends Node

@export var mesh : MeshInstance3D
@export var collision : CollisionShape3D

@export_tool_button("create mesh and collision shape")
var _make = func(): _prepare()

func _prepare():
	if !mesh:
		mesh = MeshInstance3D.new()
		add_sibling(mesh)
		mesh.owner = owner
		mesh.name = "BPmesh"

	if !collision:
		collision = CollisionShape3D.new()
		add_sibling(collision)
		collision.owner = owner
		collision.name = "BPcollision"

func move(new_parent: Node):
	if not new_parent is PhysicsBody3D:
		var new_phys_body := RigidBody3D.new()
		new_parent.add_child(new_phys_body)
		new_phys_body.owner = new_parent.owner
		new_parent = new_phys_body
		new_parent.transform = get_parent().transform

	var old_parent = get_parent()

	reparent(new_parent, false)
	mesh.reparent(new_parent, false)
	collision.reparent(new_parent, false)

	if old_parent is RigidBody3D:
		old_parent.free()

func _enter_tree() -> void:
	if get_parent() is PhysicsBody3D:
		for sibling in get_parent().get_children():
			if sibling is CollisionShape3D:
				if !collision:
					collision = sibling
					collision.name = "BPcollision"
				elif collision != sibling:
					push_warning("collision object already set")
				else:
					collision.name = "BPcollision"
					
			elif sibling is MeshInstance3D:
				if !mesh:
					mesh = sibling
					collision.name = "BPmesh"
				elif mesh != sibling:
					push_warning("mesh already set")
				else:
					collision.name = "BPmesh"
