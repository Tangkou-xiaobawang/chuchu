GDPC                                                                                      2   P   res://.godot/exported/133200997/export-051bb6b66ba7335de7f8cb207e396f83-2.scn    <      f      �X
�w҄p2T$Y8    T   res://.godot/exported/133200997/export-23186f883164cbeaffe487e6aecd5af8-lobby.scn   P�      �      �w�rD"�T>���)��    T   res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn  0�      �      K#��P�9��;�N�    T   res://.godot/exported/133200997/export-3852a867da1b416eb429bcdd62f84b87-world.scn   `_      	      K�8��8 �~iAɂ�    P   res://.godot/exported/133200997/export-c3ed94e2d4f728880b51f4b1b1ed4580-3.scn   @O            �'ue��6�@���Ɉ�J    P   res://.godot/exported/133200997/export-c4633ead38b434a822b4b6061901f58c-1.scn   �)      �      "j��u�	Tχ�\�]N�    P   res://.godot/exported/133200997/export-d42b1c3946eb3f171a3b2dc2c6a3574d-0.scn   �      B      QU�DzDɭh<�'C    ,   res://.godot/global_script_class_cache.cfg  ��      �       �YHY����VS&,��    D   res://.godot/imported/0.png-2335029e7b3112e9d242f1944d066706.ctex   ph      �       I��&~�QB�U��F�    D   res://.godot/imported/1.png-e03fa9c4d787ff8aebcb0d3cc6a7bce6.ctex    j      �       �l^&3i�R�菎�|_    D   res://.godot/imported/2.png-01309d012bed3adfd0121dc5247bbba8.ctex   pk      �       B�f��Z�
$�� ����    D   res://.godot/imported/3.png-f9c99cd1957ce2569f3608bc85ca2acb.ctex   �l      �       CqV9#��r$`�yH�O    D   res://.godot/imported/4.png-c3ac0e9c2119490698502bb68a1e5c53.ctex   `n      �       _GNp�Q�3P��1�7    D   res://.godot/imported/5.png-bf7576ff9e6c8b11fc2963a8468502ec.ctex   �o      �       �B19MB�lqvu)     D   res://.godot/imported/6.png-1c75144a861f82a6ed87eb5297277b7a.ctex   �q      �       ��qÂt٣aX�Ŝ��    D   res://.godot/imported/7.png-0d3cb7dad4f5b0405df9719b747101ea.ctex   s      �       �]~}��m%���A3%#    D   res://.godot/imported/8.png-120d781912968cc3187b9ba0fb19b87a.ctex   �t      �       qJɇC*�����T��R    D   res://.godot/imported/9.png-28359d61e64894367148caad5582df3f.ctex    v      �       P�BX-k�,Q�W�q       res://.godot/uid_cache.bin  ��      �      </r{8�~���f���*�       res://auto/gamestate.gd         �      rA�7o�i$��3�9�]       res://auto/t_script.gd  �      �      �̃�2��9�����       res://lobby.gd  �w      �      G؃v�sQ/'�ɒ%���       res://lobby.tscn.remap  ��      b       �ې�=3���!��       res://lv/0.gd   �      E      �x���l)����8�       res://lv/0.tscn.remap   ��      ^       ���K��?�E��i�!       res://lv/1.gd   @$      e      �Q��W�	�Ә�R�       res://lv/1.tscn.remap   �      ^        5��g��e�&��:�       res://lv/2.gd   �5      W      &]F�� ���y�'�       res://lv/2.tscn.remap   p�      ^       |,Б/H4m��8��}       res://lv/3.gd   pK      �      47�V�Wo���-07��       res://lv/3.tscn.remap   ��      ^       6ib�P'�Y5g8�:       res://lv/world.gd   �Z      �      �e�D��y�(�]V�       res://lv/world.tscn.remap   0�      b       ��&j����4���T�       res://pic/0.png.import  @i      �       �r|�/�֭���2N�       res://pic/1.png.import  �j      �       ��,^ӵ�!g�'�:T�       res://pic/2.png.import  l      �       L-�l�e��Kw]d���       res://pic/3.png.import  �m      �       ��%1���|i�<���.�       res://pic/4.png.import  0o      �       _��^�i��-Ĺ���       res://pic/5.png.import  �p      �       �k�D�WzH�SͲ�Չ       res://pic/6.png.import  Pr      �       ��������Ʀ>       res://pic/7.png.import  �s      �       N����H�n���B�       res://pic/8.png.import  `u      �       �a�D�� !5�]$�       res://pic/9.png p�      *      M���<ZҦm�!P�       res://pic/9.png.import  �v      �       �6�߈�8;ͥ  ���       res://player.gd 0�      �      �����%#"���       res://player.tscn.remap �      c       ������T�?�L���       res://player_controls.gd �      �      \��c���~F��"7�       res://project.binary��      �      ��'>h#t���%�O=       res://wbclient.gd   Ч            JPS9�&�������       res://wbserver.gd   �      �      5)��v�-/�@                extends Node

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
             #这是个函数工具集合脚本
extends Node



#打乱序列整数,从s开始，到e结束，包括e
func br(s:int,e:int):
	#原始数组
	var rl=[]
	#随机生成数组
	var rl0=[]
	if s>e:
		return
	for i in range(s,e+1):
		rl.append(i)

	while len(rl)!=0:
		var a=len(rl)
		#获取索引
		var a0=randi()%a
		rl0.append(rl[a0])
		rl.remove_at(a0)
	return rl0


#获取包含s,e区间内n个不同的随机整数
func rr(s:int,e:int,n:int):
	if s>e or n>e-s+1 or n<1:
		return
	var a0=[]
	for i in range(n):
		var t0=randi_range(s,e)
		while t0 in a0:
			t0=randi_range(s,e)
		a0.append(t0)
	return a0


#倒计时器
func dt(n0):
	if n0<=0:
		return
	var a0=Timer.new()
	add_child(a0)
	while n0>0:
		a0.wait_time=0.1
		a0.start()
		await a0.timeout
		n0-=0.1
	return


#计时器
func jsq(a):
	if a<0:
		return
	var tt=0
	var aa=Timer.new()
	add_child(aa)
	while a:
		aa.wait_time=0.01
		aa.start()
		await aa.timeout
		tt+=0.01
	return tt



#文本处理-针对Vector2信息
func wbcl0(text):
	var t0=''
	var t1=0
	var t2=0
	for i in text:
		if i in '0123456789':
			t0+=i
		if i==',':
			t1=int(t0)
			t0=''
		if i==')':
			t2=int(t0)
			t0=''
	return Vector2(t1,t2)



func _ready():
	#print(br(-10,2))
	#print(rr(0,10,3))
	pass
        extends Node2D



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
           RSRC                    PackedScene            ��������                                                  ..    Players    resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://lv/0.gd ��������
   Texture2D    res://pic/9.png ``����?      local://RectangleShape2D_gkrk1 �         local://RectangleShape2D_jl0gi          local://RectangleShape2D_ucl7x E         local://PackedScene_a1rll f         RectangleShape2D       
   ��A  �A         RectangleShape2D       
   ȇ�A  �A         RectangleShape2D             PackedScene          	         names "   +      World    script    Node2D    SpawnPoints    0 	   position 	   Marker2D    1    2    3    4    5    6    7    8    9    10    11    Players    PlayerSpawner    _spawnable_scenes    spawn_path    MultiplayerSpawner    w0    StaticBody2D    CollisionShape2D 	   rotation    scale    shape    texture 	   Sprite2D    w1    sco2    Area2D 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    sco    ddtime    Label    	   variants    #             
     �B  �B
     �B  C
     �B  HC
     �B  zC
     �B  �C
     �B  �C
     �B  �C
     �B  �C
     �C  �C
     .D  �B
     �C  �B
     jD  �B"         res://player.tscn              
   �� DBkC   qZ?
     �A  �?          
    � D  kC         
   �TD���C   �6@
    ��A  �?         
    @D  �C   ��6@
     H�  ^C
     @@  @@               �      A   ��(?  �?  �?  �?      B     �A      node_count             nodes       ��������       ����                            ����                     ����                          ����                          ����                       	   ����                       
   ����                          ����                          ����                          ����                          ����      	                    ����      
                    ����                          ����                           ����                      ����                                 ����                     ����                                            ����                                             ����                     ����                                            ����                                       !       ����                                ����                    "   "   ����   #      $      %      &      '                     (   ����                *   )   ����   %   !   &   "             conn_count              conns               node_paths              editable_instances              version             RSRC              extends Node2D



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
		body.position=$e1.position
	pass



func _on_e_0_body_exited(body):
	await tscript.dt(0.1)
	in0=0
	pass



func _on_e_1_body_entered(body):
	in0=1
	await tscript.dt(0.3)
	if in0==1:
		body.position=$e2.position
	pass



func _on_e_1_body_exited(body):
	await tscript.dt(0.1)
	in0=0
	pass



func _on_e_2_body_entered(body):
	in0=1
	await tscript.dt(0.3)
	if in0==1:
		body.position=$e0.position
	pass



func _on_e_2_body_exited(body):
	await tscript.dt(0.1)
	in0=0
	pass

           RSRC                    PackedScene            ��������                                                  ..    Players    resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://lv/1.gd ��������
   Texture2D    res://pic/9.png ``����?      local://RectangleShape2D_eh8ch �         local://RectangleShape2D_wd5h5 �         local://PackedScene_f166t �         RectangleShape2D             RectangleShape2D             PackedScene          	         names "   2      World    script    Node2D    SpawnPoints    0 	   position 	   Marker2D    1    2    3    4    5    6    7    8    9    10    11    Players    PlayerSpawner    _spawnable_scenes    spawn_path    MultiplayerSpawner    e0    Area2D    CollisionShape2D    shape    texture 	   Sprite2D    e1    e2    ddtime    offset_right    offset_bottom    Label    sco2    scale 
   ColorRect    offset_left    offset_top    color    sco    _on_e_0_body_entered    body_entered    _on_e_0_body_exited    body_exited    _on_e_1_body_entered    _on_e_1_body_exited    _on_e_2_body_entered    _on_e_2_body_exited    	   variants                 
     �B  �B
     �B  C
     �B  HC
     �B  zC
     �B  �C
     �B  �C
     �B  �C
     �B  �C
     �C  �C
     .D  �B
     �C  �B
     jD  �B"         res://player.tscn              
    ��C  �C                   
     mD ��C
    �<D  C      B     �A
     H�  ^C
     @@  @@               �      A   ��(?  �?  �?  �?      node_count             nodes       ��������       ����                            ����                     ����                          ����                          ����                       	   ����                       
   ����                          ����                          ����                          ����                          ����      	                    ����      
                    ����                          ����                           ����                      ����                                 ����                          ����                          ����                           ����                          ����                          ����                           ����                          ����                          ����                     "      ����          !                     #   ����         $                       ����                    %   %   ����   &      '             !      (                    )   ����              conn_count             conns     *          +   *                     -   ,                     +   .                     -   /                     +   0                     -   1                    node_paths              editable_instances              version             RSRC extends Node2D



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
         RSRC                    PackedScene            ��������                                                  ..    Players    resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://lv/2.gd ��������
   Texture2D    res://pic/9.png ``����?      local://RectangleShape2D_o2266 �         local://RectangleShape2D_pvgp1          local://RectangleShape2D_t5fyc 5         local://PackedScene_t5y83 V         RectangleShape2D             RectangleShape2D       
     �A ��C         RectangleShape2D             PackedScene          	         names "   :      World    script    Node2D    SpawnPoints    0 	   position 	   Marker2D    1    2    3    4    5    6    7    8    9    10    11    Players    PlayerSpawner    _spawnable_scenes    spawn_path    MultiplayerSpawner    e0    Area2D    texture 	   Sprite2D    CollisionShape2D    shape    e1    e2    e3    w0    StaticBody2D    scale    w2 	   rotation    w1    sco2 
   ColorRect    offset_left    offset_top    offset_right    offset_bottom    color    sco    ddtime    Label    _on_e_0_body_entered    body_entered    _on_e_0_body_exited    body_exited    _on_e_1_body_entered    _on_e_1_body_exited    _on_e_2_body_entered    _on_e_2_body_exited    _on_e_3_body_entered    _on_e_3_body_exited    	   variants    &             
     �B  �B
     �B  C
     �B  HC
     �B  zC
     �B  �C
     �B  �C
     �B  �C
     �B  �C
     �C  �C
     .D  �B
     �C  �B
     jD  �B"         res://player.tscn              
    ��C  �C                   
    ��C  KC
    �wD @D
    �bD  LC
    @D  B
        �C         
        �C
     �? ��A
    @mD  �C   � ?
    ��C ��C   5A̿
     H�  ^C
     @@  @@               �      A   ��(?  �?  �?  �?      B     �A      node_count    *         nodes     �  ��������       ����                            ����                     ����                          ����                          ����                       	   ����                       
   ����                          ����                          ����                          ����                          ����      	                    ����      
                    ����                          ����                           ����                      ����                                 ����                          ����                          ����                           ����                          ����                          ����                           ����                          ����                          ����                           ����                          ����                          ����                     !       ����                          ����                                ����         "                        !   #   ����         $                       ����                                ����         "                        !   %   ����         $          "             ����                   "             ����         "                           &   ����         "          %             ����              %       '   '   ����   (   !   )   !   *   "   +   "   ,   #       %          -   ����                /   .   ����   *   $   +   %             conn_count             conns     8          1   0                     3   2                     1   4                     3   5                     1   6                     3   7                     1   8                     3   9                    node_paths              editable_instances              version             RSRC          #这一关延迟较高
extends Node2D



var th0=Thread.new()
func _ready():
	#print(get_viewport_rect())
	dt()
	if multiplayer.is_server():
		th0.start(await upoo())
	pass


func _physics_process(delta):
	$liuliuqiu.rotation+=0.01


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




           RSRC                    PackedScene            ��������                                                  ..    Players    resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://lv/3.gd ��������
   Texture2D    res://pic/9.png ``����?      local://RectangleShape2D_bcgh4          local://RectangleShape2D_b6hlm /         local://RectangleShape2D_x80so P         local://RectangleShape2D_m54db q         local://PackedScene_3yj3x �         RectangleShape2D             RectangleShape2D             RectangleShape2D             RectangleShape2D       
     BD  �A         PackedScene          	         names "   +      World    script    Node2D    SpawnPoints    0 	   position 	   Marker2D    1    2    3    4    5    6    7    8    9    10    11    Players    PlayerSpawner    _spawnable_scenes    spawn_path    MultiplayerSpawner    ddtime    offset_right    offset_bottom    Label    sco2    scale    Area2D    CollisionShape2D    shape 
   ColorRect    offset_left    offset_top    color    sco 	   Sprite2D    e0    texture    e1 
   liuliuqiu    StaticBody2D    	   variants                 
     �B  �B
     �B  C
     �B  HC
     �B  zC
     �B  �C
     �B  �C
     �B  �C
     �B  �C
     �C  �C
     .D  �B
     �C  �B
     jD  �B"         res://player.tscn                    B     �A
     H�  ^C
     @@  @@                �      A   ��(?  �?  �?  �?
     �C  �C                  
    �HD  �C         
    @D  �C
    �@B  �?               node_count             nodes       ��������       ����                            ����                     ����                          ����                          ����                       	   ����                       
   ����                          ����                          ����                          ����                          ����      	                    ����      
                    ����                          ����                           ����                      ����                                 ����                                 ����                                ����                            ����   !      "                  #                 %   $   ����                   &   ����                    %      ����   '                       ����                        (   ����                    %      ����   '                       ����                     *   )   ����                    %      ����         '                       ����                   conn_count              conns               node_paths              editable_instances              version             RSRC extends Node2D



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
           RSRC                    PackedScene            ��������                                                  ..    Players    resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://lv/world.gd ��������      local://RectangleShape2D_fg867 g         local://PackedScene_qua53 �         RectangleShape2D             PackedScene          	         names "   *      World    script    Node2D    SpawnPoints    0 	   position 	   Marker2D    1    2    3    4    5    6    7    8    9    10    11    Players    PlayerSpawner    _spawnable_scenes    spawn_path    MultiplayerSpawner    ddtime    offset_right    offset_bottom    Label    sco2    scale    Area2D    CollisionShape2D    shape 
   ColorRect    offset_left    offset_top    color    sco 	   Sprite2D    _on_sco_2_body_entered    body_entered    _on_sco_2_body_exited    body_exited    	   variants                 
     �B  �B
     �B  C
     �B  HC
     �B  zC
     �B  �C
     �B  �C
     �B  �C
     �B  �C
     �C  �C
     .D  �B
     �C  �B
     jD  �B"         res://player.tscn                    B     �A
     H�  ^C
     @@  @@                �      A   ��(?  �?  �?  �?      node_count             nodes     �   ��������       ����                            ����                     ����                          ����                          ����                       	   ����                       
   ����                          ����                          ����                          ����                          ����      	                    ����      
                    ����                          ����                           ����                      ����                                 ����                                 ����                                ����                            ����   !      "                  #                 %   $   ����              conn_count             conns               '   &                     )   (                    node_paths              editable_instances              version             RSRC  GST2            ����                        �   RIFF�   WEBPVP8Lv   /� ���$���_�
۶A
��;�¶m�����7�	@$!�$l����n������l��O���CeL�GG�I�(�+!���AI6r�e`���Y��N�
�J��ȇ�x�               [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dmom8a1jhex02"
path="res://.godot/imported/0.png-2335029e7b3112e9d242f1944d066706.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        l   RIFFd   WEBPVP8LX   /� G��m&�y�/5m0��ϳ�iۀI��`�(�$��֖m�mE�$)�]Gg��VBD�'��~�6�A�䐋r������            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c34vmc2tmrw1t"
path="res://.godot/imported/1.png-e03fa9c4d787ff8aebcb0d3cc6a7bce6.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        \   RIFFT   WEBPVP8LH   /� �F��ݿ�̌�� ��� !+3�o9Ȏ&�&McY�Гl+��� Il�m�$;9�            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://d2522lknf6isy"
path="res://.godot/imported/2.png-01309d012bed3adfd0121dc5247bbba8.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        �   RIFF�   WEBPVP8L}   /� w��m��?���PضR�����m���w�� I"I�"������ݝ���f���ȶ�\R�%|%&�E"�z<�%?����O ?J2�D���<K���SJr�n�P9ȑ�K��<        [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bujeraogno72s"
path="res://.godot/imported/3.png-f9c99cd1957ce2569f3608bc85ca2acb.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        �   RIFF�   WEBPVP8Lw   /� ��m$���_f
۶A
��;�¶m�����7�	@$!�$l�u��}ݩ;�/w�Um[Q.^"���O"��ְ�0G���0P�V8�2�V0�dY���%������-<'��^              [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dfcw32a5cerdf"
path="res://.godot/imported/4.png-c3ac0e9c2119490698502bb68a1e5c53.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        �   RIFF�   WEBPVP8L|   /� w���$���\~
�6R����m#�`�q�!�"RU�*3���� ����D ��vc	�"���vkCU03�����	��$�
T�
>��@��qm�wpH�V7��;}\         [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c64wi32s0eqhe"
path="res://.godot/imported/5.png-bf7576ff9e6c8b11fc2963a8468502ec.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        �   RIFF�   WEBPVP8L{   /� o��m��?���PضR�����m���w�� I"I�"���w��U��WU�Xն�@��D���60�El`1F�����������ď�����@G�͠y7�����ǿ~Z�         [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b1iou1s07itkq"
path="res://.godot/imported/6.png-1c75144a861f82a6ed87eb5297277b7a.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        �   RIFF�   WEBPVP8L�   /� `�m�?��w��4�m�)���f m�O��{l�����D�m��f��� T� �������<k������`c؁1BD�' �H�9F�	x� ���YC��Y9[��@��ã�ױ;n[ [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bqefqjax388xh"
path="res://.godot/imported/7.png-0d3cb7dad4f5b0405df9719b747101ea.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        �   RIFF|   WEBPVP8Lo   /� _��m��?���PضR�����m���w�� I"I�"�ݹ;���U��U�mC�/�"(1��B�$�#D��G@v�E��� Y,�����6޳��6��~�c�     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dxdyloub1y77f"
path="res://.godot/imported/8.png-120d781912968cc3187b9ba0fb19b87a.ctex"
metadata={
"vram_texture": false
}
   GST2            ����                        v   RIFFn   WEBPVP8La   /���H�e���^*xݾP�����@�o��h�mۆ���K�wm�&�4p�X�?���5��@d�q�wp�׃@��<< T�.h�����/I��   [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://b6nphfp7wmqiq"
path="res://.godot/imported/9.png-28359d61e64894367148caad5582df3f.ctex"
metadata={
"vram_texture": false
}
   extends Control



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
         RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://lobby.gd ��������   Script    res://wbserver.gd ��������   Script    res://wbclient.gd ��������      local://PackedScene_117gb X         PackedScene          	         names "   @      Lobby    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    size_flags_horizontal    size_flags_vertical    script    Control    Players    visible    anchor_left    anchor_top    offset_left    offset_top    offset_right    offset_bottom    Panel    Label    text    horizontal_alignment    Start    Button    List 	   ItemList    PortForward &   theme_override_constants/line_spacing    FindPublicIP    LinkButton    lvt    Connect 
   NameLabel    Name 	   LineEdit    IPLabel $   theme_override_font_sizes/font_size 
   IPAddress    Host    Join    ErrorLabel !   theme_override_colors/font_color    ErrorDialog 	   position    AcceptDialog    lv 	   wbserver    Node 	   wbclient    _on_start_pressed    pressed    _on_find_public_ip_pressed    _on_host_pressed    _on_join_pressed    _on_lv_item_clicked    item_clicked    _on_wbserver_client_connected    client_connected    _on_wbserver_message_received    message_received !   _on_wbclient_connected_to_server    connected_to_server    _on_wbclient_message_received    	   variants    N                    �?                                         ?     ��    �1�     �B    �1C            �A     �@     eC     �A      Awaiting Players...      �B    ��C     AC     �C      START!      �A     B     �C     ��    ��C      C    ��C         e   If you want non-LAN clients to connect,
make sure the port 10567 in UDP
is forwarded on your router.      HC    ��C     �C    @�C      Find your public IP address      �C    @�C     �C    ��C    �
�     ��    �
C     �B     `A     0A     `B      Name:      �A     B     -C     �B     pA     �B     dB     �B            IP:      �B     C   
   127.0.0.1      5C     vC      Host       Join      
C    ��C     !C   ��Q?�K�>�K�>  �?-       $       �HD     OC    �wD    ��C                        node_count             nodes     �  ��������
       ����	                                                    	                        ����                                                	      
                                                        ����	                                                                          ����                                                                    ����                                                              ����                                                               ����            !      "      #      $      %                    ����            &      '      (      )                            ����                                          *      +      ,      -                                         !   ����            .      /      0                        1              #   "   ����            2      3      4      5                             $   ����	            6      7      8      9               %   :      ;              #   &   ����            2      <      4      =                  >                 '   ����            ?      3      @      5                  A                 (   ����            ?      <      @      =                  B                 )   ����            6      C      D      E               *   F               -   +   ����   ,   G                  .   ����                  H      I      J      K               0   /   ����   	   L               0   1   ����   	   M             conn_count    	         conns     ?          3   2                     3   4                     3   5                     3   6                     8   7                     :   9                     <   ;                     >   =                     <   ?                    node_paths              editable_instances              version             RSRC       extends CharacterBody2D

const MOTION_SPEED = 200


@export
var synced_position := Vector2()

@export
var stunned = false

@onready
var inputs = $Inputs



func _ready():
	#修改角色样式
	$"0".texture=load("res://pic/"+str(gamestate.nn)+".png")
	stunned = false
	position = synced_position
	if str(name).is_valid_int():
		get_node("Inputs/InputsSync").set_multiplayer_authority(str(name).to_int())



func _physics_process(delta):
	if multiplayer.multiplayer_peer == null or str(multiplayer.get_unique_id()) == str(name):
		inputs.update()

	if multiplayer.multiplayer_peer == null or is_multiplayer_authority():
		synced_position = position

	else:
		position = synced_position

	if not stunned:
		velocity = inputs.motion * MOTION_SPEED
		move_and_slide()
     RSRC                    PackedScene            ��������                                                  .    synced_position    q    text    motion    resource_local_to_scene    resource_name    custom_solver_bias    radius    script    properties/0/path    properties/0/spawn    properties/0/replication_mode    properties/1/path    properties/1/spawn    properties/1/replication_mode 	   _bundled       Script    res://player.gd ��������
   Texture2D    res://pic/0.png y �X�to   Script    res://player_controls.gd ��������   
   local://1 �      %   local://SceneReplicationConfig_sh64w �      %   local://SceneReplicationConfig_w53uu v         local://PackedScene_3wvvj �         CircleShape2D            �A	         SceneReplicationConfig    
                                                                 	         SceneReplicationConfig    
                                 	         PackedScene          	         names "         player    z_index    motion_mode    script    CharacterBody2D    0    texture 	   Sprite2D    shape 	   position    CollisionShape2D    MultiplayerSynchronizer    replication_config    Inputs    Node    InputsSync    q    offset_left    offset_top    offset_right    offset_bottom    horizontal_alignment    Label    	   variants          
                            
         ��                                          ��     �     �A     0�      node_count             nodes     M   ��������       ����                                        ����                     
      ����   	                              ����                           ����                          ����                           ����      	      
                               conn_count              conns               node_paths              editable_instances              version       	      RSRC          extends Node

@export
var motion = Vector2():
	set(value):
		motion = clamp(value, Vector2(-1, -1), Vector2(1, 1))


func update():
	var m = Vector2()
	if Input.is_action_pressed("move_left"):
		m += Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		m += Vector2(1, 0)
	if Input.is_action_pressed("move_up"):
		m += Vector2(0, -1)
	if Input.is_action_pressed("move_down"):
		m += Vector2(0, 1)

	motion = m

              extends Node
class_name webc


@export var handshake_headers: PackedStringArray
@export var supported_protocols: PackedStringArray
var tls_options: TLSOptions = null


var socket = WebSocketPeer.new()
var last_state = WebSocketPeer.STATE_CLOSED


signal connected_to_server()
signal connection_closed()
signal message_received(message: Variant)



func connect_to_url(url) -> int:
	socket.supported_protocols = supported_protocols
	socket.handshake_headers = handshake_headers
	
	var err = socket.connect_to_url(url, tls_options)
	if err != OK:
		return err
	last_state = socket.get_ready_state()
	
	return OK



func send(message) -> int:
	#屏蔽
	if multiplayer.is_server():
		return 0
	if typeof(message) == TYPE_STRING:
		return socket.send_text(message)
	return socket.send(var_to_bytes(message))



func get_message() -> Variant:
	if socket.get_available_packet_count() < 1:
		return null
	var pkt = socket.get_packet()
	if socket.was_string_packet():
		return pkt.get_string_from_utf8()
	return bytes_to_var(pkt)



func close(code := 1000, reason := "") -> void:
	socket.close(code, reason)
	last_state = socket.get_ready_state()
	gamestate.player_list_changed.emit()



func clear() -> void:
	socket = WebSocketPeer.new()
	last_state = socket.get_ready_state()



func get_socket() -> WebSocketPeer:
	return socket



func poll() -> void:
	if socket.get_ready_state() != socket.STATE_CLOSED:
		socket.poll()
	var state = socket.get_ready_state()
	if last_state != state:
		last_state = state
		if state == socket.STATE_OPEN:
			connected_to_server.emit()
		elif state == socket.STATE_CLOSED:
			connection_closed.emit()
	while socket.get_ready_state() == socket.STATE_OPEN and socket.get_available_packet_count():
		message_received.emit(get_message())



func _process(delta):
	poll()


          extends Node
class_name webs

signal message_received(peer_id: int, message)
signal client_connected(peer_id: int)
signal client_disconnected(peer_id: int)

@export var handshake_headers := PackedStringArray()
@export var supported_protocols: PackedStringArray
@export var handshake_timout := 3000
@export var use_tls := false
@export var tls_cert: X509Certificate
@export var tls_key: CryptoKey
@export var refuse_new_connections := false:
	set(refuse):
		if refuse:
			pending_peers.clear()



class PendingPeer:
	var connect_time: int
	var tcp: StreamPeerTCP
	var connection: StreamPeer
	var ws: WebSocketPeer

	func _init(p_tcp: StreamPeerTCP):
		tcp = p_tcp
		connection = p_tcp
		connect_time = Time.get_ticks_msec()



var tcp_server := TCPServer.new()
var pending_peers: Array[PendingPeer] = []
var peers: Dictionary



func listen(port: int) -> int:
	#检查端口是否可用
	if ENetMultiplayerPeer.new().create_server(port)!=OK:
		printerr('fail to create server')
		return 0
	#assert(not tcp_server.is_listening())
	return tcp_server.listen(port)



func stop():
	tcp_server.stop()
	pending_peers.clear()
	peers.clear()



func send(peer_id, message) -> int:
	var type = typeof(message)
	if peer_id <= 0:
		for id in peers:
			if id == peer_id:
				continue
			if type == TYPE_STRING:
				peers[id].send_text(message)
			else:
				peers[id].put_packet(message)
		return OK

	assert(peers.has(peer_id))
	var socket = peers[peer_id]
	if type == TYPE_STRING:
		return socket.send_text(message)
	return socket.send(var_to_bytes(message))



func get_message(peer_id) -> Variant:
	assert(peers.has(peer_id))
	var socket = peers[peer_id]
	if socket.get_available_packet_count() < 1:
		return null
	var pkt = socket.get_packet()
	if socket.was_string_packet():
		return pkt.get_string_from_utf8()
	return bytes_to_var(pkt)



func has_message(peer_id) -> bool:
	assert(peers.has(peer_id))
	return peers[peer_id].get_available_packet_count() > 0



func _create_peer() -> WebSocketPeer:
	var ws = WebSocketPeer.new()
	ws.supported_protocols = supported_protocols
	ws.handshake_headers = handshake_headers
	return ws


#轮询状态
func poll() -> void:
	if not tcp_server.is_listening():
		return
	while not refuse_new_connections and tcp_server.is_connection_available():
		var conn = tcp_server.take_connection()
		assert(conn != null)
		pending_peers.append(PendingPeer.new(conn))
	var to_remove := []
	for p in pending_peers:
		if not _connect_pending(p):
			if p.connect_time + handshake_timout < Time.get_ticks_msec():
				# Timeout
				to_remove.append(p)
			continue # Still pending
		to_remove.append(p)
	for r in to_remove:
		pending_peers.erase(r)
	to_remove.clear()
	for id in peers:
		var p: WebSocketPeer = peers[id]
		var packets = p.get_available_packet_count()
		p.poll()
		if p.get_ready_state() != WebSocketPeer.STATE_OPEN:
			client_disconnected.emit(id)
			to_remove.append(id)
			continue
		while p.get_available_packet_count():
			message_received.emit(id, get_message(id))
	for r in to_remove:
		peers.erase(r)
	to_remove.clear()


#连接状态
func _connect_pending(p: PendingPeer) -> bool:
	if p.ws != null:
		# Poll websocket client if doing handshake
		p.ws.poll()
		var state = p.ws.get_ready_state()
		if state == WebSocketPeer.STATE_OPEN:
			var id = randi_range(2, 1 << 30)
			peers[id] = p.ws
			client_connected.emit(id)
			return true # Success.
		elif state != WebSocketPeer.STATE_CONNECTING:
			return true # Failure.
		return false # Still connecting.
	elif p.tcp.get_status() != StreamPeerTCP.STATUS_CONNECTED:
		return true # TCP disconnected.
	elif not use_tls:
		# TCP is ready, create WS peer
		p.ws = _create_peer()
		p.ws.accept_stream(p.tcp)
		return false # WebSocketPeer connection is pending.
	else:
		if p.connection == p.tcp:
			assert(tls_key != null and tls_cert != null)
			var tls = StreamPeerTLS.new()
			tls.accept_stream(p.tcp, TLSOptions.server(tls_key, tls_cert))
			p.connection = tls
		p.connection.poll()
		var status = p.connection.get_status()
		if status == StreamPeerTLS.STATUS_CONNECTED:
			p.ws = _create_peer()
			p.ws.accept_stream(p.connection)
			return false # WebSocketPeer connection is pending.
		if status != StreamPeerTLS.STATUS_HANDSHAKING:
			return true # Failure.
		return false



func _process(delta):
	poll()


 [remap]

path="res://.godot/exported/133200997/export-d42b1c3946eb3f171a3b2dc2c6a3574d-0.scn"
  [remap]

path="res://.godot/exported/133200997/export-c4633ead38b434a822b4b6061901f58c-1.scn"
  [remap]

path="res://.godot/exported/133200997/export-051bb6b66ba7335de7f8cb207e396f83-2.scn"
  [remap]

path="res://.godot/exported/133200997/export-c3ed94e2d4f728880b51f4b1b1ed4580-3.scn"
  [remap]

path="res://.godot/exported/133200997/export-3852a867da1b416eb429bcdd62f84b87-world.scn"
              [remap]

path="res://.godot/exported/133200997/export-23186f883164cbeaffe487e6aecd5af8-lobby.scn"
              [remap]

path="res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn"
             list=Array[Dictionary]([{
"base": &"Node",
"class": &"webc",
"icon": "",
"language": &"GDScript",
"path": "res://wbclient.gd"
}, {
"base": &"Node",
"class": &"webs",
"icon": "",
"language": &"GDScript",
"path": "res://wbserver.gd"
}])
     �PNG

   IHDR         ��a   sRGB ���   gAMA  ���a   �IDAT8O��I�0E��`�X��Uz�ބ^��
VL��0��I?Q�dp�~ ���3EV�4$�1�����h�&hۖsUU�D�@����ޛYP{�4Y�%�k�Dh�T%��<����B�(�8��<��eYH%�.&I�9��,!MSޗ(]���h��<sr�1��A찅�}�r��XJ@���a��H"��uA�� �%1��@��͞R2��    IEND�B`�         ��H��:   res://lv/0.tscn��>��Z   res://lv/1.tscnGBmC�-   res://lv/2.tscnjk��R�p   res://lv/3.tscn���ΎM9   res://lv/world.tscny �X�to   res://pic/0.png��f[��[^   res://pic/1.png�H͒�~   res://pic/2.png�V��v�4   res://pic/3.png���5Mh   res://pic/4.png�'Iۯ7Ha   res://pic/5.pngċz�:   res://pic/6.png���z�0   res://pic/7.pngE/\�y   res://pic/8.png``����?   res://pic/9.png��݉N�   res://lobby.tscn�j���x   res://player.tscn          ECFG      application/config/name         chuhcu_linux   application/config/description�      �   A multiplayer implementation of the classic bomberman game.
One of the players should press "Host", while the other
should type in his address and press "Play".   application/config/tags8   "         2d     demo       network 	   official       application/run/main_scene         res://lobby.tscn   application/config/features   "         4.2    application/config/icon         res://pic/9.png    autoload/gamestate          *res://auto/gamestate.gd   autoload/tscript          *res://auto/t_script.gd    display/window/stretch/mode         canvas_items   display/window/stretch/aspect         expand     input/move_down�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device     ����   axis      
   axis_value       �?   script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed           script         input/move_left�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    q      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device     ����   axis       
   axis_value       ��   script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed           script         input/move_right�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device     ����   axis       
   axis_value       �?   script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed           script         input/move_up�              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script            InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @ 	   key_label             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device     ����   axis      
   axis_value       ��   script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed           script         input/set_bomb              deadzone  �������?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode       	   key_label             unicode           echo          script            InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index          pressure          pressed           script            InputEventJoypadButton        resource_local_to_scene           resource_name             device     ����   button_index         pressure          pressed           script      #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility   replication/config,              uid://dviwgv2ty8v6u          
   replicated              spawn_properties             sync_interval               sync_properties             :stunned      sprite:hframes        sprite:vframes        :server_position   
   label:text        synced           