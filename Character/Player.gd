extends "res://Character/template_character.gd"

var motion : Vector2 = Vector2();
onready var torch : Light2D = $Torch;
onready var sprite : Sprite = $Sprite;
onready var light_occluder_2d : LightOccluder2D = $LightOccluder2D;
onready var light_2d : Light2D = $Light2D;

const  PLAYER_SPRITE = "res://GFX/PNG/Hitman 1/hitman1_stand.png";
const  PLAYER_LIGHT = "res://GFX/PNG/Hitman 1/hitman1_stand.png";
const BOX_SPRITE = "res://GFX/PNG/Tiles/tile_130.png";
const BOX_LIGHT = "res://GFX/PNG/Tiles/tile_130.png";
const PLAYER_OCCLUDER = "res://Character/HumanOccluder.tres";
const BOX_OCCLUDER = "res://Character/BoxOccluder.tres";

var disguised = false;

func _physics_process(delta):
    update_motion();
    move_and_slide(motion);

func update_motion():
    look_at(get_global_mouse_position());
    if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
        motion.y = clamp(motion.y+SPEED,0,MAX_SPEED);
    elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
        motion.y = clamp(motion.y-SPEED,-MAX_SPEED,0);
    else:
        motion.y = lerp(motion.y,0,FRICTION);

    if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
        motion.x = clamp(motion.x-SPEED,-MAX_SPEED,0);
    elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
        motion.x = clamp(motion.x+SPEED,0,MAX_SPEED);
    else:
        motion.x = lerp(motion.x,0,FRICTION);

func _input(event):
    if Input.is_action_just_pressed("torch_vision_mode"):
        get_tree().call_group("Interface","cycle_vision_mode");
    if Input.is_action_just_pressed("toggle_disguise"):
        toggle_disguise();

func toggle_disguise():
    if disguised:
        reveal();
    else:
        disguise();

func reveal():
    sprite.texture = load(PLAYER_SPRITE);
    light_occluder_2d.occluder = load(PLAYER_OCCLUDER);
    light_2d.texture = load(PLAYER_LIGHT);
    disguised = false;
    collision_layer = 1;


func disguise():
    sprite.texture = load(BOX_SPRITE);
    light_occluder_2d.occluder = load(BOX_OCCLUDER);
    light_2d.texture = load(BOX_LIGHT);
    disguised = true;
    collision_layer = 16;