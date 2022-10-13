class_name Player
extends RigidBody2D

## Atributos Export
export var potencia_motor:int = 20
export var potencia_rotacion:int = 280 

## Metodos
func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	apply_central_impulse(empuje.rotated(rotation))
	apply_torque_impulse(dir_rotacion * potencia_rotacion)
	

func _process(delta: float) -> void:
	player_input()
	

	
	
func player_input() -> void:
	# Empuje
	empuje= Vector2.ZERO
	if Input.is_action_pressed("mover_adelante"):
		empuje = Vector2(potencia_motor, 0)
	elif Input.is_action_pressed("mover_atras"):
		empuje = Vector2(-potencia_motor, 0)
	
	# Rotacion
	dir_rotacion = 0
	if Input.is_action_pressed("Rotar_antihorario"):
		dir_rotacion -= 1
	elif Input.is_action_pressed("Rotar_Horario"):
		dir_rotacion += 1




var empuje:Vector2 = Vector2.ZERO
var dir_rotacion:int = 0
