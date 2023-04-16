# MYZSH

## lock (outdated)

1. `*.lock`

    To confirm a package if has been installed

    If lock file generated, it means that the package has been installed.

2. `*.flag`

    To confirm a function has been activated. (Ture or False)

    If flag file generated, it means that function has been activated.


## Conda

需要在`~/.zshenv-spec`设置`$MYCONDA`，注意是conda的全路径。

```bash
# ~/.zshenv-spec
# ==============

# 家目录下的anaconda3
export MYCONDA="/home/$USER/.bin/anaconda3"
# 家目录下的miniconda3
export MYCONDA="/home/$USER/.bin/miniconda3"
# 全局的anaconda3
export MYCONDA="/opt/anaconda3"
# 全局的miniconda3
export MYCONDA="/opt/miniconda3"
```

