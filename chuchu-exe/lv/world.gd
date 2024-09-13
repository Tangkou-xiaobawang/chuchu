extends Node2D



var pos0=Vector2(-200,0)
func _ready():
	dt()
	if multiplayer.is_server():
		var th0=Thread.new()
		th0.start(await upoo())
	pass



func _process(delta):
	pos0=gamestate.pos0
	$sco2.position=pos0
	await tscript.dt(10)
	$sco2.position=Vector2(-200,0)
	pass



#战略点生成
#var zhenying=0
func upoo():
	while 1:
		await tscript.dt(3)
		#$sco2.scale=...
		#zhenying+=1
		var ttn=Vector2(randi()%1050+50,randi()%550+50)
		gamestate._server.send(0,'weizhi'+str(ttn))
		gamestate.pos0=ttn
	pass



#倒计时器
var n0=20
func dt():
	var a0=Timer.new()
	add_child(a0)
	while n0:
		$ddtime.text=str(n0)
		a0.wait_time=1
		a0.start()
		await a0.timeout
		n0-=1
		$ddtime.text=str(n0)
	oo=0	
	if !multiplayer.is_server():
		gamestate._client.send('defen'+str(fenshu))
		print(123)
	else:
		gamestate.dff=fenshu
	return


var fenshu:float=0
var oo=0
func _on_sco_2_body_entered(body):
	#body.hide()
	#if zhenying==...
	#...
	await tscript.dt(3)
	oo=1
	var aa=Timer.new()
	add_child(aa)
	while oo:
		aa.wait_time=0.01
		aa.start()
		await aa.timeout
		fenshu+=0.01
	pass



func _on_sco_2_body_exited(body):
	#body.show()
	print(oo)
	print(fenshu)
	oo=0
	pass
