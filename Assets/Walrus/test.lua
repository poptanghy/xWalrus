function Awake()
	print(kCube)
end

function Update()
	kCube.transform.Rotate(0, Time.deltaTime * 100, 0)
end