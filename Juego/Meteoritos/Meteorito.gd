class_name Meteorito
extends RigidBody2D


## Atributos Export
export var vel_lineal_base:Vector2 = Vector2(300.0, 300.0)
export var vel_ang_base:float = 3.0
export var hitpoints_base:float = 10.0
onready var impacto_SFX: AudioStreamPlayer2D = $impacto_SFX


# Atributos
var hitpoints:float


## Metodos

## Metodos Custom
func recibir_danio(danio: float) -> void:
	hitpoints -= danio
	if hitpoints <= 0:
		destruir()

	impacto_SFX.play()
	$AnimationPlayer.play("impacto")
	

func aleatorizar_velocidad() -> float:
	randomize()
	return rand_range(1.1, 1.4)
	
	
func destruir() -> void:
	$CollisionShape2D.set_deferred("disabled", true)
	Eventos.emit_signal("meteorito_destruido", global_position)
	queue_free()

# Constructor
func crear(pos: Vector2, dir: Vector2, tamanio: float) -> void:
	position = pos
	mass *= tamanio
	$Sprite.scale = Vector2.ONE * tamanio
	var radio:int = int($Sprite.texture.get_size().x / 2.3 * tamanio)
	var forma_colision:CircleShape2D = CircleShape2D.new()
	forma_colision.radius = radio
	$CollisionShape2D.shape = forma_colision
	linear_velocity = vel_lineal_base * dir / tamanio
	angular_velocity = vel_ang_base / tamanio
	hitpoints = hitpoints_base * tamanio
	# Calcular Velocidades
	linear_velocity = (vel_lineal_base * dir / tamanio) * aleatorizar_velocidad()
	angular_velocity = (vel_ang_base / tamanio) * aleatorizar_velocidad()
	

