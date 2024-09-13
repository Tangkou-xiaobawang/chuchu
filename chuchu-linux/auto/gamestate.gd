extends Node

	#创建websocketserver
@onready var _server: webs
	#创建websocketclient
@onready var _client: webc

var chushihua=load("res://lobby.tscn").instantiate()

func _ready():
	multiplayer.peer_connected.connect(_player_connected)
	multiplayer.peer_disconnected.connect(_player_disconnected)
	multiplayer.connected_to_server.connect(_connected_ok)
	multiplayer.connection_failed.connect(_connected_fail)
	multiplayer.server_disconnected.connect(_server_disconnected)



#默认端口
const DEFAULT_PORT = 10567

#最大玩家数
const MAX_PEERS = 8

var peer = null

#默认玩家名称
var player_name = "player"


var players = {}
var players_ready = []


signal player_list_changed()
signal connection_failed()
signal connection_succeeded()
signal game_ended()
signal game_error(what)


var nn=0
func _player_connected(id):
	#玩家登入
	register_player.rpc_id(id, player_name)



func _player_disconnected(id):
	if has_node("/root/World"): 
		if multiplayer.is_server():
			game_error.emit("Player " + players[id] + " disconnected")
			
		else: 
			#玩家登出
			unregister_player(id)
		end_game()




func _connected_ok():
	#连接成功
	connection_succeeded.emit()



#服务器断开
func _server_disconnected():
	game_error.emit("Server disconnected")
	end_game()



#连接失败
func _connected_fail():
	multiplayer.set_network_peer(null) 
	connection_failed.emit()



#登入实现
@rpc("any_peer")
func register_player(new_player_name):
	var id = multiplayer.get_remote_sender_id()
	players[id] = new_player_name
	player_list_changed.emit()



#登出实现
func unregister_player(id):
	players.erase(id)
	player_list_changed.emit()



#场景加载
var tt=0
var lvl=['world','0','1','2','3']
var lvn=0
@rpc("call_local")
func load_world():
	var world = load("res://lv/"+lvl[lvn]+".tscn").instantiate()
	get_tree().get_root().add_child(world)
	get_tree().get_root().get_child(2).hide()



#创建游戏
func host_game(new_player_name):
	player_name = new_player_name
	peer = ENetMultiplayerPeer.new()
	peer.create_server(DEFAULT_PORT, MAX_PEERS)
	multiplayer.set_multiplayer_peer(peer)



#加入游戏
func join_game(ip, new_player_name):
	player_name = new_player_name
	peer = ENetMultiplayerPeer.new()
	peer.create_client(ip, DEFAULT_PORT)
	multiplayer.set_multiplayer_peer(peer)



#获取玩家列表
func get_player_list():
	return players.values()



#获取玩家名称
func get_player_name():
	return player_name



#开始游戏
var all_peers=[]
func begin_game():
	print(get_tree().root.get_children())
	
	var r0=randi()%80
	var l0=tscript.br(r0,r0+len(players))
	#从0-7中获取len(players)个整数
	var l1=tscript.rr(0,7,len(players)+1)
	
	assert(multiplayer.is_server())
	load_world.rpc()
	
	var world = get_tree().get_root().get_node("World")
	var player_scene = load("res://player.tscn")
	var tn=0
	
	var ll=Label.new()
	ll.position=Vector2(20,20)
	ll.text='You：'+str(l0[tn])
	get_tree().root.get_node("World").add_child(ll)
	
	var spawn_points = {}
	spawn_points[1] = 0 
	var spawn_point_idx = 1
	for p in players:
		spawn_points[p] = spawn_point_idx
		spawn_point_idx += 1
		
	#将关卡加入场景，将角色加入关卡
	for p_id in spawn_points:
		var spawn_pos = world.get_node("SpawnPoints/" + str(l1[tn])).position
		var player = player_scene.instantiate()
		player.synced_position = spawn_pos
		player.name = str(p_id)
		
		world.get_node("Players").add_child(player)
		
		player.get_node('q').text=str(l0[tn])
		
		tn+=1
		if tn>len(players):
			return
			
		gamestate._server.send(all_peers[tn-1],'kaishi'+str(l0[tn]))
		#if player.name==str(multiplayer.get_unique_id()):
			#player.get_node('q').text='player'



#结束游戏
func end_game():
	get_tree().root.get_node("Lobby/lv").hide()
	if has_node("/root/World"):
		get_node("/root/World").queue_free()
		
	game_ended.emit()
	players.clear()


	#以下代码无用
	#multiplayer.multiplayer_peer=null
	#_server.stop()
	#_client.close()
	
	#await tscript.dt(3)
	#get_tree().root.get_node("Lobby").queue_free()
	#get_tree().root.add_child(chushihua)


#得分处理
var dff=0
#位置信息
var pos0=Vector2(-200,0)


#不建议使用
func _input(event):
	if event is InputEventKey:
		if event.is_pressed():
			if event.keycode==KEY_ESCAPE:
				end_game()
	pass
