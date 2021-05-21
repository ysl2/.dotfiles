# How to use

啥也不用动，就放在这，等着yay来调用就行了

> Original link:
>
> - https://zhuanlan.zhihu.com/p/176987140
> - https://zhuanlan.zhihu.com/p/268002096

## Modify `/etc/makepkg.conf`

```text
DLAGENTS=('file::/usr/bin/curl -gqC - -o %o %u'
          'ftp::/usr/bin/aria2c -x16 -o %o %u'
          'http::/usr/bin/aria2c -x16 -o %o %u'
          'https::/home/yusoli/.dotfiles/.MY-SHELL-SCRIPT/fake-aur-download/fake-curl-for-makepkg %o %u'
          'rsync::/usr/bin/rsync --no-motd -z %u %o'
          'scp::/usr/bin/scp -C %u %o')
```
