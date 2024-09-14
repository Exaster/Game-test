extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const DASH_SPEED = 300.0  
const DASH_DURATION = 0.3  
const DASH_COOLDOWN = 3.0  

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var powerup_sound: AudioStreamPlayer2D = $PowerupSound
@onready var hit_sound: AudioStreamPlayer2D = $HitSound
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var animated_sprite: AnimatedSprite2D = %PlayerSprite


var is_dashing = false
var dash_time_left = 0.0
var dash_cooldown_time_left = 0.0

func _physics_process(delta):
	update_dash_cooldown(delta)
	apply_gravity(delta)
	handle_movement(delta)
	handle_dash()

	move_and_slide()

func update_dash_cooldown(delta):
	if dash_cooldown_time_left > 0:
		dash_cooldown_time_left -= delta
		print("time till nex cooldown	"+str(dash_cooldown_time_left))

	if is_dashing:
		dash_time_left -= delta
		if dash_time_left <= 0:
			is_dashing = false
			velocity.x = 0 


func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_movement(delta):
	var direction = Input.get_axis("move_left", "move_right")

	if not is_dashing:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_sound.play() 

		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true

		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
			

		if direction != 0:
			velocity.x = direction * SPEED 
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

func handle_dash():
	if Input.is_action_just_pressed("dash") and dash_cooldown_time_left <= 0 and not is_dashing:
		is_dashing = true
		dash_time_left = DASH_DURATION
		dash_cooldown_time_left = DASH_COOLDOWN
		velocity.x = DASH_SPEED * (1 if animated_sprite.flip_h == false else -1)
		animated_sprite.play("dash") 
		powerup_sound.play() 


func on_player_died():
	animated_sprite.play("dying") 
	#dying_sound_player.play() 
