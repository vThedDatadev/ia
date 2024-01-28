extends CharacterBody3D

# Paramètres du saut
var jump_speed : float = 5.0  # La vitesse de saut réduite pour des petits sauts
var gravity : float = 2000.8  # La gravité appliquée au personnage
var bounce_interval : float = 0.5  # Intervalle entre les sauts
var next_bounce_time : float = 1  # Temps pour le prochain saut

func _ready():
	# Activez le traitement physique pour ce nœud
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	# Calculer la gravité
	if is_on_floor() and Time.get_ticks_msec() > next_bounce_time:
		# Sauter à intervalles réguliers
		velocity.y = jump_speed
		next_bounce_time =  Time.get_ticks_msec()+ bounce_interval * 1000

	# Appliquer la gravité
	velocity.y -= gravity * delta

	# S'assurer que le personnage reste sur place s'il ne doit pas se déplacer
	velocity.x = 0
	velocity.z = 0

	# Déplacer le personnage
	var motion =Vector3.UP
	velocity = motion
	move_and_slide()
	motion = velocity
