# chuchu
A game base godot


项目介绍
一、项目结构

1.文件夹包含auto、lv、pic。

1）auto文件夹存放项目自动加载脚本。

2）lv文件夹存放关卡场景以及关卡脚本。

3）pic文件夹包含关卡所需素材。

2.节点说明

1）lobby.tscn为主场景，主要功能有：目标端口设置、目标ip地址设置、服务端创建、客户端创建、关卡选取、开始游戏等。

2）player.tscn为角色场景，包含角色信息和multiplayersynchronizer对等体。

3）lv中的.tscn场景为关卡场景。

2.脚本介绍

1）auto中的gamestate.gd脚本主要包括lobby中按钮的事件方法，其中夹杂信号绑定和角色加入场景的方法。

2）auto中的tscript.gd脚本主要包括关卡内调用的工具方法。

3）lv中的.gd文件为关卡内节点运动的脚本。

4）wbclient和wbserver脚本是lobby中的网络tcp脚本，主要使用的是tcp连接。

二、游戏相关

1.游戏内容

1）wasd键以及方向键控制移动，支持手柄（如果兼容）。

2）游戏中，玩家出生地在特定几个点中随机匹配。

3）关卡会生成战略点，玩家需要进行占领。

4）占领的有效时间积累最高者获胜。

2.可优化项

1）在该游戏中不需要tcp会话进行关卡报文传输，直接对关卡使用multiplayersynchronizer进行属性传输即可。

2）应自行添加素材，并对关卡参数进行调整。

3）其他功能添加，以及在编译层面的优化。

