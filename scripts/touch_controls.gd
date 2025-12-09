extends CanvasLayer

func is_mobile() -> bool:
	return ["mobile", "web_android", "web_ios"].any(OS.has_feature)

func _ready() -> void:
	$".".visible = is_mobile()
