extends Spatial

export(Vector3) var chunk_size := Vector3(16, 32, 16)
export(int) var render_distance := 11
export(float, 0.0, 0.5) var wall_density := 0.35
export(OpenSimplexNoise) var noise: OpenSimplexNoise
export(Material) var cave_material: Material

onready var COMBINATIONS := CombinationData.COMBINATIONS as Array
onready var VERTICES := CombinationData.VERTICES as PoolVector3Array
onready var EDGES := CombinationData.EDGES as PoolVector2Array
onready var EDGE_CENTERS := CombinationData.EDGE_CENTER as PoolVector3Array

onready var _camera := $"../Camera" as Camera
onready var _half_chunk_size = chunk_size * 0.5

var _last_cam_pos := - Vector3.ONE
var _cam_pos := Vector3.ZERO
var _chunk_cache := {}
var _thread := Thread.new()
var _pending_chunk_queue := []
var _st = SurfaceTool.new()

var top_limit := 0.3
var bottom_limit := 0.8

func _ready() -> void:
	randomize()
	noise.seed = randi()


func _process(delta: float) -> void:
	_cam_pos = _camera.translation.snapped(chunk_size)
	_cam_pos.y = 0
	if _cam_pos != _last_cam_pos:
		_update_blocks(_cam_pos)
		_last_cam_pos = _cam_pos


func _update_blocks(pos: Vector3) -> void:
	
	var _existing_chunks := {}
	for child in get_children():
		var direction = (pos - child.translation).abs()
		var dist = max(direction.x, direction.z)
		if dist > render_distance * chunk_size.x:
			remove_child(child)
		else:
			_existing_chunks[child.translation] = true
	
	for i in render_distance:
		for k in render_distance:
			var chunk_translation := pos + Vector3(i - render_distance/2, 0.0, k - render_distance/2) * chunk_size
			if _existing_chunks.has(chunk_translation):
				continue

			if chunk_translation in _chunk_cache:
				add_child(_chunk_cache[chunk_translation])
			elif not _pending_chunk_queue.has(chunk_translation):
				_pending_chunk_queue.append(chunk_translation)
				if not _thread.is_active():
					_thread.start(self, '_thread_function')


func _generate_meshes() -> void:
	while _pending_chunk_queue.size() > 0:
		var offset: Vector3 = _pending_chunk_queue.pop_front()
		var dir: Vector3 = _cam_pos - offset
		var abs_dir = dir.abs()
		var dist = max(abs_dir.x, max(abs_dir.y , abs_dir.z))
		
		var chunk := MeshInstance.new()
		var array_mesh := _create_array_mesh(offset)
		chunk.name = "%d%d%d" % [offset.x, offset.y, offset.z]
		chunk.mesh = array_mesh
		chunk.translation = offset
		_chunk_cache[offset] = chunk
		call_deferred("add_child", chunk)
	
	call_deferred("_finish_thread")


func _create_array_mesh(offset: Vector3) -> ArrayMesh:
	_st.clear()
	_st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_st.set_material(cave_material.duplicate())
	var _noise_data := {}
	
	for x in chunk_size.x:
		for y in chunk_size.y:
			for z in chunk_size.z:
				var cube_pos := Vector3(x, y, z) + offset
				var cube_state := 0
	
				for i in 8:
					var corner = cube_pos + VERTICES[i]
					var vert_state = _noise_data[corner] if _noise_data.has(corner) else _get_point_state(corner)
					_noise_data[corner] = vert_state
					cube_state += vert_state << i
	
				for comb in COMBINATIONS[cube_state]:
					for point_index in comb:
						var vert = cube_pos + EDGE_CENTERS[point_index] - offset
						_st.add_color(Color.white)
						_st.add_vertex(vert)
	
	_st.generate_normals(true)
	return _st.commit()


func _get_point_state(pos: Vector3) -> int:
	var top := noise.get_noise_3d(pos.x, top_limit * chunk_size.y, pos.z)
	var bottom := noise.get_noise_3d(pos.x, bottom_limit * chunk_size.y, pos.z)
	
	top = smoothstep(-1.0, 1.0, top)
	bottom = smoothstep(-1.0, 1.0, bottom)
	
	var n: float = lerp(bottom, top, pos.y / chunk_size.y)
	var dist := 1.0 - pow(abs(1.0 - pos.y / _half_chunk_size.y), 4)
	var h := 0.5 + 0.5 * (n - dist)
	var smin: float = lerp(n, dist, h) - h*(1.0 - h)
	return 0 if smin < wall_density else 1


func _exit_tree():
	_pending_chunk_queue.clear()
	_chunk_cache.clear()
	if _thread.is_active():
		_thread.wait_to_finish()


func _finish_thread() -> void:
	_thread.wait_to_finish()


func _thread_function(data) -> void:
	_generate_meshes()
