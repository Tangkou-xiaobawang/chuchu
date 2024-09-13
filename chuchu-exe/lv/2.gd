extends Node2D



var th0=Thread.new()
func _ready():
	dt()
	th0.start(await upoo())
	pass


var pos0=Vector2(-200,0)
func _process(delta):
	pos0=gamestate.pos0
	$sco2.position=pos0
	await tscript.dt(10)
	$sco2.position=Vector2(-200,0)
	pass



#战略点生成
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
var fenshu=0
var oo=0
#关卡倒计时时间
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
	else:
		gamestate.dff=fenshu
	return



var in0=0
func _on_e_0_body_entered(body):
	in0=1
	await tscript.dt(0.3)
	if in0==1:
		body.position=$e2.position
	pass # Replace with function body.



func _on_e_0_body_exited(body):
	await tscript.dt(0.1)
	in0=0
	pass # Replace with function body.



func _on_e_1_body_entered(body):
	in0=1
	await tscript.dt(0.3)
	if in0==1:
		body.position=$e3.position
	pass



func _on_e_1_body_exited(body):
	await tscript.dt(0.1)
	in0=0
	pass



func _on_e_2_body_entered(body):
	in0=1
	await tscript.dt(0.3)
	if in0==1:
		body.position=$e1.position
	pass



func _on_e_2_body_exited(body):
	await tscript.dt(0.1)
	in0=0
	pass



func _on_e_3_body_entered(body):
	in0=1
	await tscript.dt(0.3)
	if in0==1:
		body.position=$e0.position
	pass



func _on_e_3_body_exited(body):
	await tscript.dt(0.1)
	in0=0
	pass
