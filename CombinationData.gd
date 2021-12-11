class_name CombinationData extends Object

const VERTICES := PoolVector3Array([
	Vector3(0, 0, 0), #0
	Vector3(1, 0, 0), #1
	Vector3(1, 1, 0), #2
	Vector3(0, 1, 0), #3
	Vector3(0, 0, 1), #4
	Vector3(1, 0, 1), #5
	Vector3(1, 1, 1), #6
	Vector3(0, 1, 1), #7
])

const EDGE_CENTER := PoolVector3Array([
	Vector3(0.5, 0, 0),
	Vector3(1, 0.5, 0),
	Vector3(0.5, 1, 0),
	Vector3(0, 0.5, 0),
	Vector3(0.5, 0, 1),
	Vector3(1, 0.5, 1),
	Vector3(0.5, 1, 1),
	Vector3(0, 0.5, 1),
	Vector3(0, 0, 0.5),
	Vector3(1, 0, 0.5),
	Vector3(1, 1, 0.5),
	Vector3(0, 1, 0.5),
])

const EDGES := PoolVector2Array([
	Vector2(0, 1),
	Vector2(1, 2),
	Vector2(2, 3),
	Vector2(3, 0),
	Vector2(4, 5),
	Vector2(5, 6),
	Vector2(6, 7),
	Vector2(7, 4),
	Vector2(0, 4),
	Vector2(1, 5),
	Vector2(2, 6),
	Vector2(3, 7),
])

const COMBINATIONS := [[],
 [[8, 0, 3]],
 [[1, 0, 9]],
 [[8, 1, 3], [8, 9, 1]],
 [[10, 2, 1]],
 [[8, 0, 3], [1, 10, 2]],
 [[9, 2, 0], [9, 10, 2]],
 [[3, 8, 2], [2, 8, 10], [10, 8, 9]],
 [[3, 2, 11]],
 [[0, 2, 8], [2, 11, 8]],
 [[1, 0, 9], [2, 11, 3]],
 [[2, 9, 1], [11, 9, 2], [8, 9, 11]],
 [[3, 10, 11], [3, 1, 10]],
 [[1, 10, 0], [0, 10, 8], [8, 10, 11]],
 [[0, 11, 3], [9, 11, 0], [10, 11, 9]],
 [[8, 9, 11], [11, 9, 10]],
 [[7, 4, 8]],
 [[3, 7, 0], [7, 4, 0]],
 [[7, 4, 8], [9, 1, 0]],
 [[9, 1, 4], [4, 1, 7], [7, 1, 3]],
 [[7, 4, 8], [2, 1, 10]],
 [[4, 3, 7], [4, 0, 3], [2, 1, 10]],
 [[2, 0, 10], [0, 9, 10], [7, 4, 8]],
 [[9, 10, 4], [4, 10, 3], [3, 10, 2], [4, 3, 7]],
 [[4, 8, 7], [3, 2, 11]],
 [[7, 4, 11], [11, 4, 2], [2, 4, 0]],
 [[1, 0, 9], [2, 11, 3], [8, 7, 4]],
 [[2, 11, 1], [1, 11, 9], [9, 11, 7], [9, 7, 4]],
 [[10, 11, 1], [11, 3, 1], [4, 8, 7]],
 [[4, 0, 7], [7, 0, 10], [0, 1, 10], [7, 10, 11]],
 [[7, 4, 8], [0, 11, 3], [9, 11, 0], [10, 11, 9]],
 [[4, 11, 7], [9, 11, 4], [10, 11, 9]],
 [[9, 4, 5]],
 [[9, 4, 5], [0, 3, 8]],
 [[0, 5, 1], [0, 4, 5]],
 [[4, 3, 8], [5, 3, 4], [1, 3, 5]],
 [[5, 9, 4], [10, 2, 1]],
 [[8, 0, 3], [1, 10, 2], [4, 5, 9]],
 [[10, 4, 5], [2, 4, 10], [0, 4, 2]],
 [[3, 10, 2], [8, 10, 3], [5, 10, 8], [4, 5, 8]],
 [[9, 4, 5], [11, 3, 2]],
 [[11, 0, 2], [11, 8, 0], [9, 4, 5]],
 [[5, 1, 4], [1, 0, 4], [11, 3, 2]],
 [[5, 1, 4], [4, 1, 11], [1, 2, 11], [4, 11, 8]],
 [[3, 10, 11], [3, 1, 10], [5, 9, 4]],
 [[9, 4, 5], [1, 10, 0], [0, 10, 8], [8, 10, 11]],
 [[5, 0, 4], [11, 0, 5], [11, 3, 0], [10, 11, 5]],
 [[5, 10, 4], [4, 10, 8], [8, 10, 11]],
 [[9, 7, 5], [9, 8, 7]],
 [[0, 5, 9], [3, 5, 0], [7, 5, 3]],
 [[8, 7, 0], [0, 7, 1], [1, 7, 5]],
 [[7, 5, 3], [3, 5, 1]],
 [[7, 5, 8], [5, 9, 8], [2, 1, 10]],
 [[10, 2, 1], [0, 5, 9], [3, 5, 0], [7, 5, 3]],
 [[8, 2, 0], [5, 2, 8], [10, 2, 5], [7, 5, 8]],
 [[2, 3, 10], [10, 3, 5], [5, 3, 7]],
 [[9, 7, 5], [9, 8, 7], [11, 3, 2]],
 [[0, 2, 9], [9, 2, 7], [7, 2, 11], [9, 7, 5]],
 [[3, 2, 11], [8, 7, 0], [0, 7, 1], [1, 7, 5]],
 [[11, 1, 2], [7, 1, 11], [5, 1, 7]],
 [[3, 1, 11], [11, 1, 10], [8, 7, 9], [9, 7, 5]],
 [[11, 7, 0], [7, 5, 0], [5, 9, 0], [10, 11, 0], [1, 10, 0]],
 [[0, 5, 10], [0, 7, 5], [0, 8, 7], [0, 10, 11], [0, 11, 3]],
 [[10, 11, 5], [11, 7, 5]],
 [[5, 6, 10]],
 [[8, 0, 3], [10, 5, 6]],
 [[0, 9, 1], [5, 6, 10]],
 [[8, 1, 3], [8, 9, 1], [10, 5, 6]],
 [[1, 6, 2], [1, 5, 6]],
 [[6, 2, 5], [2, 1, 5], [8, 0, 3]],
 [[5, 6, 9], [9, 6, 0], [0, 6, 2]],
 [[5, 8, 9], [2, 8, 5], [3, 8, 2], [6, 2, 5]],
 [[3, 2, 11], [10, 5, 6]],
 [[0, 2, 8], [2, 11, 8], [5, 6, 10]],
 [[3, 2, 11], [0, 9, 1], [10, 5, 6]],
 [[5, 6, 10], [2, 9, 1], [11, 9, 2], [8, 9, 11]],
 [[11, 3, 6], [6, 3, 5], [5, 3, 1]],
 [[11, 8, 6], [6, 8, 1], [1, 8, 0], [6, 1, 5]],
 [[5, 0, 9], [6, 0, 5], [3, 0, 6], [11, 3, 6]],
 [[6, 9, 5], [11, 9, 6], [8, 9, 11]],
 [[7, 4, 8], [6, 10, 5]],
 [[3, 7, 0], [7, 4, 0], [10, 5, 6]],
 [[7, 4, 8], [6, 10, 5], [9, 1, 0]],
 [[5, 6, 10], [9, 1, 4], [4, 1, 7], [7, 1, 3]],
 [[1, 6, 2], [1, 5, 6], [7, 4, 8]],
 [[6, 1, 5], [2, 1, 6], [0, 7, 4], [3, 7, 0]],
 [[4, 8, 7], [5, 6, 9], [9, 6, 0], [0, 6, 2]],
 [[2, 3, 9], [3, 7, 9], [7, 4, 9], [6, 2, 9], [5, 6, 9]],
 [[2, 11, 3], [7, 4, 8], [10, 5, 6]],
 [[6, 10, 5], [7, 4, 11], [11, 4, 2], [2, 4, 0]],
 [[1, 0, 9], [8, 7, 4], [3, 2, 11], [5, 6, 10]],
 [[1, 2, 9], [9, 2, 11], [9, 11, 4], [4, 11, 7], [5, 6, 10]],
 [[7, 4, 8], [11, 3, 6], [6, 3, 5], [5, 3, 1]],
 [[11, 0, 1], [11, 4, 0], [11, 7, 4], [11, 1, 5], [11, 5, 6]],
 [[6, 9, 5], [0, 9, 6], [11, 0, 6], [3, 0, 11], [4, 8, 7]],
 [[5, 6, 9], [9, 6, 11], [9, 11, 7], [9, 7, 4]],
 [[4, 10, 9], [4, 6, 10]],
 [[10, 4, 6], [10, 9, 4], [8, 0, 3]],
 [[1, 0, 10], [10, 0, 6], [6, 0, 4]],
 [[8, 1, 3], [6, 1, 8], [6, 10, 1], [4, 6, 8]],
 [[9, 2, 1], [4, 2, 9], [6, 2, 4]],
 [[3, 8, 0], [9, 2, 1], [4, 2, 9], [6, 2, 4]],
 [[0, 4, 2], [2, 4, 6]],
 [[8, 2, 3], [4, 2, 8], [6, 2, 4]],
 [[4, 10, 9], [4, 6, 10], [2, 11, 3]],
 [[11, 8, 2], [2, 8, 0], [6, 10, 4], [4, 10, 9]],
 [[2, 11, 3], [1, 0, 10], [10, 0, 6], [6, 0, 4]],
 [[8, 4, 1], [4, 6, 1], [6, 10, 1], [11, 8, 1], [2, 11, 1]],
 [[3, 1, 11], [11, 1, 4], [1, 9, 4], [11, 4, 6]],
 [[6, 11, 1], [11, 8, 1], [8, 0, 1], [4, 6, 1], [9, 4, 1]],
 [[3, 0, 11], [11, 0, 6], [6, 0, 4]],
 [[4, 11, 8], [4, 6, 11]],
 [[6, 8, 7], [10, 8, 6], [9, 8, 10]],
 [[3, 7, 0], [0, 7, 10], [7, 6, 10], [0, 10, 9]],
 [[1, 6, 10], [0, 6, 1], [7, 6, 0], [8, 7, 0]],
 [[10, 1, 6], [6, 1, 7], [7, 1, 3]],
 [[9, 8, 1], [1, 8, 6], [6, 8, 7], [1, 6, 2]],
 [[9, 7, 6], [9, 3, 7], [9, 0, 3], [9, 6, 2], [9, 2, 1]],
 [[7, 6, 8], [8, 6, 0], [0, 6, 2]],
 [[3, 6, 2], [3, 7, 6]],
 [[3, 2, 11], [6, 8, 7], [10, 8, 6], [9, 8, 10]],
 [[7, 9, 0], [7, 10, 9], [7, 6, 10], [7, 0, 2], [7, 2, 11]],
 [[0, 10, 1], [6, 10, 0], [8, 6, 0], [7, 6, 8], [2, 11, 3]],
 [[1, 6, 10], [7, 6, 1], [11, 7, 1], [2, 11, 1]],
 [[1, 9, 6], [9, 8, 6], [8, 7, 6], [3, 1, 6], [11, 3, 6]],
 [[9, 0, 1], [11, 7, 6]],
 [[0, 11, 3], [6, 11, 0], [7, 6, 0], [8, 7, 0]],
 [[7, 6, 11]],
 [[11, 6, 7]],
 [[3, 8, 0], [11, 6, 7]],
 [[1, 0, 9], [6, 7, 11]],
 [[1, 3, 9], [3, 8, 9], [6, 7, 11]],
 [[10, 2, 1], [6, 7, 11]],
 [[10, 2, 1], [3, 8, 0], [6, 7, 11]],
 [[9, 2, 0], [9, 10, 2], [11, 6, 7]],
 [[11, 6, 7], [3, 8, 2], [2, 8, 10], [10, 8, 9]],
 [[2, 6, 3], [6, 7, 3]],
 [[8, 6, 7], [0, 6, 8], [2, 6, 0]],
 [[7, 2, 6], [7, 3, 2], [1, 0, 9]],
 [[8, 9, 7], [7, 9, 2], [2, 9, 1], [7, 2, 6]],
 [[6, 1, 10], [7, 1, 6], [3, 1, 7]],
 [[8, 0, 7], [7, 0, 6], [6, 0, 1], [6, 1, 10]],
 [[7, 3, 6], [6, 3, 9], [3, 0, 9], [6, 9, 10]],
 [[7, 8, 6], [6, 8, 10], [10, 8, 9]],
 [[8, 11, 4], [11, 6, 4]],
 [[11, 0, 3], [6, 0, 11], [4, 0, 6]],
 [[6, 4, 11], [4, 8, 11], [1, 0, 9]],
 [[1, 3, 9], [9, 3, 6], [3, 11, 6], [9, 6, 4]],
 [[8, 11, 4], [11, 6, 4], [1, 10, 2]],
 [[1, 10, 2], [11, 0, 3], [6, 0, 11], [4, 0, 6]],
 [[2, 9, 10], [0, 9, 2], [4, 11, 6], [8, 11, 4]],
 [[3, 4, 9], [3, 6, 4], [3, 11, 6], [3, 9, 10], [3, 10, 2]],
 [[3, 2, 8], [8, 2, 4], [4, 2, 6]],
 [[2, 4, 0], [6, 4, 2]],
 [[0, 9, 1], [3, 2, 8], [8, 2, 4], [4, 2, 6]],
 [[1, 2, 9], [9, 2, 4], [4, 2, 6]],
 [[10, 3, 1], [4, 3, 10], [4, 8, 3], [6, 4, 10]],
 [[10, 0, 1], [6, 0, 10], [4, 0, 6]],
 [[3, 10, 6], [3, 9, 10], [3, 0, 9], [3, 6, 4], [3, 4, 8]],
 [[9, 10, 4], [10, 6, 4]],
 [[9, 4, 5], [7, 11, 6]],
 [[9, 4, 5], [7, 11, 6], [0, 3, 8]],
 [[0, 5, 1], [0, 4, 5], [6, 7, 11]],
 [[11, 6, 7], [4, 3, 8], [5, 3, 4], [1, 3, 5]],
 [[1, 10, 2], [9, 4, 5], [6, 7, 11]],
 [[8, 0, 3], [4, 5, 9], [10, 2, 1], [11, 6, 7]],
 [[7, 11, 6], [10, 4, 5], [2, 4, 10], [0, 4, 2]],
 [[8, 2, 3], [10, 2, 8], [4, 10, 8], [5, 10, 4], [11, 6, 7]],
 [[2, 6, 3], [6, 7, 3], [9, 4, 5]],
 [[5, 9, 4], [8, 6, 7], [0, 6, 8], [2, 6, 0]],
 [[7, 3, 6], [6, 3, 2], [4, 5, 0], [0, 5, 1]],
 [[8, 1, 2], [8, 5, 1], [8, 4, 5], [8, 2, 6], [8, 6, 7]],
 [[9, 4, 5], [6, 1, 10], [7, 1, 6], [3, 1, 7]],
 [[7, 8, 6], [6, 8, 0], [6, 0, 10], [10, 0, 1], [5, 9, 4]],
 [[3, 0, 10], [0, 4, 10], [4, 5, 10], [7, 3, 10], [6, 7, 10]],
 [[8, 6, 7], [10, 6, 8], [5, 10, 8], [4, 5, 8]],
 [[5, 9, 6], [6, 9, 11], [11, 9, 8]],
 [[11, 6, 3], [3, 6, 0], [0, 6, 5], [0, 5, 9]],
 [[8, 11, 0], [0, 11, 5], [5, 11, 6], [0, 5, 1]],
 [[6, 3, 11], [5, 3, 6], [1, 3, 5]],
 [[10, 2, 1], [5, 9, 6], [6, 9, 11], [11, 9, 8]],
 [[3, 11, 0], [0, 11, 6], [0, 6, 9], [9, 6, 5], [1, 10, 2]],
 [[0, 8, 5], [8, 11, 5], [11, 6, 5], [2, 0, 5], [10, 2, 5]],
 [[11, 6, 3], [3, 6, 5], [3, 5, 10], [3, 10, 2]],
 [[3, 9, 8], [6, 9, 3], [5, 9, 6], [2, 6, 3]],
 [[9, 6, 5], [0, 6, 9], [2, 6, 0]],
 [[6, 5, 8], [5, 1, 8], [1, 0, 8], [2, 6, 8], [3, 2, 8]],
 [[2, 6, 1], [6, 5, 1]],
 [[6, 8, 3], [6, 9, 8], [6, 5, 9], [6, 3, 1], [6, 1, 10]],
 [[1, 10, 0], [0, 10, 6], [0, 6, 5], [0, 5, 9]],
 [[3, 0, 8], [6, 5, 10]],
 [[10, 6, 5]],
 [[5, 11, 10], [5, 7, 11]],
 [[5, 11, 10], [5, 7, 11], [3, 8, 0]],
 [[11, 10, 7], [10, 5, 7], [0, 9, 1]],
 [[5, 7, 10], [10, 7, 11], [9, 1, 8], [8, 1, 3]],
 [[2, 1, 11], [11, 1, 7], [7, 1, 5]],
 [[3, 8, 0], [2, 1, 11], [11, 1, 7], [7, 1, 5]],
 [[2, 0, 11], [11, 0, 5], [5, 0, 9], [11, 5, 7]],
 [[2, 9, 5], [2, 8, 9], [2, 3, 8], [2, 5, 7], [2, 7, 11]],
 [[10, 3, 2], [5, 3, 10], [7, 3, 5]],
 [[10, 0, 2], [7, 0, 10], [8, 0, 7], [5, 7, 10]],
 [[0, 9, 1], [10, 3, 2], [5, 3, 10], [7, 3, 5]],
 [[7, 8, 2], [8, 9, 2], [9, 1, 2], [5, 7, 2], [10, 5, 2]],
 [[3, 1, 7], [7, 1, 5]],
 [[0, 7, 8], [1, 7, 0], [5, 7, 1]],
 [[9, 5, 0], [0, 5, 3], [3, 5, 7]],
 [[5, 7, 9], [7, 8, 9]],
 [[4, 10, 5], [8, 10, 4], [11, 10, 8]],
 [[3, 4, 0], [10, 4, 3], [10, 5, 4], [11, 10, 3]],
 [[1, 0, 9], [4, 10, 5], [8, 10, 4], [11, 10, 8]],
 [[4, 3, 11], [4, 1, 3], [4, 9, 1], [4, 11, 10], [4, 10, 5]],
 [[1, 5, 2], [2, 5, 8], [5, 4, 8], [2, 8, 11]],
 [[5, 4, 11], [4, 0, 11], [0, 3, 11], [1, 5, 11], [2, 1, 11]],
 [[5, 11, 2], [5, 8, 11], [5, 4, 8], [5, 2, 0], [5, 0, 9]],
 [[5, 4, 9], [2, 3, 11]],
 [[3, 4, 8], [2, 4, 3], [5, 4, 2], [10, 5, 2]],
 [[5, 4, 10], [10, 4, 2], [2, 4, 0]],
 [[2, 8, 3], [4, 8, 2], [10, 4, 2], [5, 4, 10], [0, 9, 1]],
 [[4, 10, 5], [2, 10, 4], [1, 2, 4], [9, 1, 4]],
 [[8, 3, 4], [4, 3, 5], [5, 3, 1]],
 [[1, 5, 0], [5, 4, 0]],
 [[5, 0, 9], [3, 0, 5], [8, 3, 5], [4, 8, 5]],
 [[5, 4, 9]],
 [[7, 11, 4], [4, 11, 9], [9, 11, 10]],
 [[8, 0, 3], [7, 11, 4], [4, 11, 9], [9, 11, 10]],
 [[0, 4, 1], [1, 4, 11], [4, 7, 11], [1, 11, 10]],
 [[10, 1, 4], [1, 3, 4], [3, 8, 4], [11, 10, 4], [7, 11, 4]],
 [[9, 4, 1], [1, 4, 2], [2, 4, 7], [2, 7, 11]],
 [[1, 9, 2], [2, 9, 4], [2, 4, 11], [11, 4, 7], [3, 8, 0]],
 [[11, 4, 7], [2, 4, 11], [0, 4, 2]],
 [[7, 11, 4], [4, 11, 2], [4, 2, 3], [4, 3, 8]],
 [[10, 9, 2], [2, 9, 7], [7, 9, 4], [2, 7, 3]],
 [[2, 10, 7], [10, 9, 7], [9, 4, 7], [0, 2, 7], [8, 0, 7]],
 [[10, 4, 7], [10, 0, 4], [10, 1, 0], [10, 7, 3], [10, 3, 2]],
 [[8, 4, 7], [10, 1, 2]],
 [[4, 1, 9], [7, 1, 4], [3, 1, 7]],
 [[8, 0, 7], [7, 0, 1], [7, 1, 9], [7, 9, 4]],
 [[0, 7, 3], [0, 4, 7]],
 [[8, 4, 7]],
 [[9, 8, 10], [10, 8, 11]],
 [[3, 11, 0], [0, 11, 9], [9, 11, 10]],
 [[0, 10, 1], [8, 10, 0], [11, 10, 8]],
 [[11, 10, 3], [10, 1, 3]],
 [[1, 9, 2], [2, 9, 11], [11, 9, 8]],
 [[9, 2, 1], [11, 2, 9], [3, 11, 9], [0, 3, 9]],
 [[8, 2, 0], [8, 11, 2]],
 [[11, 2, 3]],
 [[2, 8, 3], [10, 8, 2], [9, 8, 10]],
 [[0, 2, 9], [2, 10, 9]],
 [[3, 2, 8], [8, 2, 10], [8, 10, 1], [8, 1, 0]],
 [[1, 2, 10]],
 [[3, 1, 8], [1, 9, 8]],
 [[9, 0, 1]],
 [[3, 0, 8]],
 []]
