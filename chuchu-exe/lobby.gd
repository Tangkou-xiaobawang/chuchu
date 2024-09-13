extends Control



func _ready():
	gamestate._server=$wbserver
	gamestate._client=$wbclient
	
	$Players/lvt.text=gamestate.lvl[gamestate.lvn]
	
	gamestate.connection_failed.connect(_on_connection_failed)
	gamestate.connection_succeeded.connect(_on_connection_success)
	gamestate.player_list_changed.connect(refresh_lobby)
	gamestate.game_ended.connect(_on_game_ended)
	gamestate.game_error.connect(_on_game_error)
	
	$Connect/Name.text='oo'
		
	for i in gamestate.lvl:
		$lv.add_item(i)



func _process(delta):
	
	pass



func _on_host_pressed():
	gamestate._server.listen(2222)
	if $Connect/Name.text == "":
		$Connect/ErrorLabel.text = "Invalid name!"
		return

	$Connect.hide()
	$Players.show()
	$Connect/ErrorLabel.text = ""

	var player_name = $Connect/Name.text
	gamestate.host_game(player_name)
	refresh_lobby()
	$lv.show()



func _on_join_pressed():
	gamestate._client.connect_to_url('127.0.0.1:2222')
	if $Connect/Name.text == "":
		$Connect/ErrorLabel.text = "Invalid name!"
		return

	var ip = $Connect/IPAddress.text
	if not ip.is_valid_ip_address():
		$Connect/ErrorLabel.text = "Invalid IP address!"
		return

	$Connect/ErrorLabel.text = ""
	$Connect/Host.disabled = true
	$Connect/Join.disabled = true
	var player_name = $Connect/Name.text
	gamestate.join_game(ip, player_name)



func _on_connection_success():
	$Connect.hide()
	$Players.show()



func _on_connection_failed():
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false
	$Connect/ErrorLabel.set_text("Connection failed.")



func _on_game_ended():
	show()
	$Connect.show()
	$Players.hide()
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false



func _on_game_error(errtxt):
	$ErrorDialog.dialog_text = errtxt
	$ErrorDialog.popup_centered()
	$Connect/Host.disabled = false
	$Connect/Join.disabled = false



func refresh_lobby():
	var players = gamestate.get_player_list()
	players.sort()
	$Players/List.clear()
	$Players/List.add_item(gamestate.get_player_name() + " (You)")
	for p in players:
		$Players/List.add_item(p)
	if multiplayer.multiplayer_peer:
		$Players/Start.disabled = not multiplayer.is_server()



func _on_start_pressed():
	gamestate._client.send('defen')
	gamestate.begin_game()
	$lv.hide()



func _on_find_public_ip_pressed():
	OS.shell_open("https://icanhazip.com/")



#点击lv列表条目时执行
func _on_lv_item_clicked(index, at_position, mouse_button_index):
	if mouse_button_index==1:
		$Players/lvt.text=$lv.get_item_text(index)
		gamestate.tt=$lv.get_item_text(index)
		gamestate.lvn=index
		print(gamestate.lvn)
		#服务器向0：所有连接用户发送信息
		gamestate._server.send(0,'lv'+str(gamestate.lvn))



#客户端收到信息时，客户端执行
func _on_wbclient_message_received(message):
	if message.substr(0,2)=='lv':
		print('接收：',message)
		gamestate.lvn=int(message.substr(message.length()-2,))
		$Players/lvt.text=gamestate.lvl[gamestate.lvn]
		
		#接收到开始信息后创建提示标签
	if message.substr(0,6)=='kaishi':
		print(get_tree().root.get_children())
		var ll=Label.new()
		ll.position=Vector2(20,20)
		ll.text='You：'+message.substr(6,2)
		get_tree().root.get_node("World").add_child(ll)
		
	if message.substr(0,6)=='weizhi':
		print(int(message.substr(6)))
		gamestate.pos0=tscript.wbcl0(message.substr(6))
		#gamestate.pos0=message.substr(6)
		
	if message.substr(0,6)=='winwin':
		$ErrorDialog.dialog_text=message.substr(6)
		$ErrorDialog.popup_centered()
		await tscript.dt(2)
		gamestate.end_game()
		$ErrorDialog.hide()
	pass



#当客户端连接服务器时，服务器执行
func _on_wbserver_client_connected(peer_id):
	#将连接的id添加到公共脚本的数组中
	gamestate.all_peers.append(peer_id)
	gamestate._server.send(peer_id,'lv'+str(gamestate.lvn))
	gamestate._server.send(peer_id,str(peer_id))
	pass



#当客户端连接服务器时，客户端执行
func _on_wbclient_connected_to_server():
	pass



#服务器接收到消息后，服务器执行
func _on_wbserver_message_received(peer_id, message):
	var a0=[]
	var a1=[]
	var a2=[]
	#接收得分信息	
	if message.substr(0,5)=='defen':
		#print(str(peer_id)+message.substr(0,15))
		print('defen')
		a0.append(peer_id)
		a0.append(message.substr(5))
		a1.append(a0)
		a0=[]
	await tscript.dt(2)
	for i in a1:
		a2.append(i[1])
	var maxi=a2.find(a2.max())
	var win=str(a1[maxi][0])+'win'
	print(win)
	gamestate._server.send(0,'winwin'+win)
	$ErrorDialog.dialog_text=win
	$ErrorDialog.popup_centered()
	await tscript.dt(2)
	gamestate.end_game()
	$ErrorDialog.hide()
	pass
