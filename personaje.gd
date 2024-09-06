extends Area2D

@export var speed = 400 #Agregar Var de velocidad al personaje.
var screen_size # Var del tamaño de la pantalla.


func _ready():
	screen_size = get_viewport_rect().size # Establecer el tamaño de la pantalla.


func _process(delta):
	var velocity = Vector2.ZERO # Declarar la variable de velocidad en 0.0
	if Input.is_action_pressed("Move_Right"):
		velocity.x += 1 ##Cambiar la velocidad a 1.1 en la direccion de la tecla.
	if Input.is_action_pressed("Move_Left"):
		velocity.x -= 1
	if Input.is_action_pressed("Move_Down"):
		velocity.y += 1
	if Input.is_action_pressed("Move_Up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		# Hacer la velocidad constante para que coincida con los fotogramas.

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size) #Hacer que el personaje no pueda pasar los limites de la pantalla.
	
