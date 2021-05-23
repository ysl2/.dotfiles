# Stow Conflict Manager

此脚本用于在新环境下快速还原dotfiles文件，仅适用于以`stow`方式管理的dotfiles

> 此脚本不会对dotfiles造成影响，但可能对家目录下的同名文件产生影响。

## What it does

1. 正常情况

	- 用户启动`start.sh`脚本

	- 调用java脚本在对应的家目录下创建与dotfiles相同结构的文件夹

	- 将dotfiles中的所有文件以`stow -R 文件名`的形式存储到`run-stow.sh`文件中

	- 脚本调用`run-stow.sh`并清理中间产物，一切都恢复正常

2. 特殊处理

	- 文件夹

		- 如果家目录下对应的文件夹已经存在，则不会进行文件夹的创建

		- 只要家目录下对应文件夹路径中的任意一级文件夹是链接形式，就会删除这个链接形式文件夹（只是删除了链接文件夹，并没有删除链接文件夹中的内容）

	- 文件

		- 如果家目录下存在对应的文件的链接，会删除原链接
3. 解决冲突

	- 如果家目录下存在对应的真实文件，会识别为冲突，并将冲突信息记录在另一个文件`conflicts.sh`中，让用户自己处理（可以删除`conflicts.sh`以保留家目录下的冲突文件，也可以执行`conflicts.sh`以删除家目录下的冲突文件）

	- 用户处理后，再次执行`start.sh`，一切都恢复正常

## What it generates

1. `javarestore/assets/conflicts.sh`

	- 捕捉到文件冲突后，会把冲突的文件记录在这里。

	- 默认以`覆盖家目录下文件`的命令方式存储在此文件中。如果确定执行覆盖，就直接更改文件后缀为`.sh`然后添加可执行权限并运行即可

2. `javarestore/assets/run-stow.sh`

	- 通过stow产生符号链接：`家目录/文件名 -> dotfiles/文件名`，也就是把dotfiles目录下的文件映射到家目录下

## Customize

`javarestore/Definition.java`中定义了所有支持更改的文件路径

