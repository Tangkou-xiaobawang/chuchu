#这是个函数工具集合脚本
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
