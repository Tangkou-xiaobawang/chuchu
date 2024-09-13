extends CharacterBody2D

const MOTION_SPEED = 200


@export
var synced_position := Vector2()

@export
var stunned = false

@onready
var inputs = $Inputs



func _ready():
	#修改角色样式
	$"0".texture=load("res://pic/"+str(gamestate.nn)+".png")
	stunned = false
	position = synced_position
	if str(name).is_valid_int():
		get_node("Inputs/InputsSync").set_multiplayer_authority(str(name).to_int())



func _physics_process(delta):
	if multiplayer.multiplayer_peer == null or str(multiplayer.get_unique_id()) == str(name):
		inputs.update()

	if multiplayer.multiplayer_peer == null or is_multiplayer_authority():
		synced_position = position

	else:
		position = synced_position

	if not stunned:
		velocity = inputs.motion * MOTION_SPEED
		move_and_slide()
