extends Control

func _ready() -> void:
	$VideoStreamPlayer.finished.connect(
		_on_video_stream_player_finished
	)

func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://title_screen.tscn")
