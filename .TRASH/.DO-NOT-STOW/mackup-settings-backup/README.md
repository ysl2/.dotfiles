# YuSoLi's Dotfiles

> **:warning: This README is outdated. Please do not use. Just for backing up.**
>
> NOTE: The repository is managed by [`mackup`](https://github.com/lra/mackup) (A dotfile manager).

## How to use

Before using this dotfiles repository, you need install all the necessary packages. After doing that, follow the instructions below:

```bash
# If you are not in China
cd ~ && git clone https://github.com/ysl2/.dotfiles.git

# If you are in China
cd ~ && git clone https://hub.fastgit.org/ysl2/.dotfiles.git
```

Then, run this command:

```bash
mackup restore
```

## Things you can't backup with mackup:

1. The files' executable permission will disappear. And I offered a script to solve it.

	`add-file-permission.sh`

