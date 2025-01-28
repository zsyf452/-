extends CanvasLayer

@onready var countPiece = $black_stones_count/countPiece

# Called when the node enters the scene tree for the first time.
func _ready():
	var parent_node = get_parent()
	
	# 使用 Callable 连接信号到子节点的函数
	parent_node.connect("update_signal", Callable(self, "_on_update_signal"))
	pass # Replace with function body.


func _on_update_signal():
	#print(1)
	countPiece.text = str(get_parent().getCountPiece())
	pass
