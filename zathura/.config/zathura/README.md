# How To Use Zathura

## 普通浏览模式

```text
J: 下翻一页
K: 上翻一页
h,k,j,l
Ctrl+t,Ctrl+y: 左右滚动半页
Ctrl+d, Ctrl+u: 上下滚动半页
t, y： 左右滚动一页
Ctrl+f, Ctrl+b: 上下滚动一页
space, : 上下滚动一页
gg, G, nG: 第一页，最后一页，跳转到第n页
H, L: 跳转到当前页面的top，bottom
Ctrl+o,Ctrl+i: 移动到之前的跳转的页面，移动到之后跳转的页面，参考vimperator
Ctrl+j, Ctrl+k: 在两个跳转之间切换
Ctrl+c, Escape: 终止
a, s: 以高度或者宽度适应窗口
/, ?: 搜索，向前和向后，参考vim
o, O: 打开文件
f: 链接
<:>: 输入命令
r: 旋转90度
Ctrl+r: 换色
R: 重新加载文件
Tab: 打开/关闭目录
d: 打开/关闭 双页面显示
F5: 切换显示模式
F11: 切换到全屏模式
Ctrl+m: 打开/关闭 输入栏
Ctrl+n: 打开/关闭 状态栏
+, -, =: 放大，缩小，恢复原始大小
n=: 放大到大小为n
mX: 快速标记‘X: 跳转到标记处
```

## 目录模式

k,j: 移动
l,h: 展开，折叠
L,H: 全部展开，全部折叠
space, Return: 选中并打开

## 命令行模式（按:进入命令行模式）

bmark: 保存书签
bdelete: 删除书签
blist: 列出书签
close: 关闭文档
exec: 执行外部命令
info: 显示文档信息
open: 打开一个文档
offset: 设置页面偏移
print: 打印文档
write(!)： 保存文档（强制覆盖）
export: 导出附件
