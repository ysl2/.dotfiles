# .dotlib

1. Conda 特定目录自动切换环境

   ```bash
   # ~/.bashrc.localhost


   #!/bin/bash
   function cd {
       builtin cd "$@" && conda_env
   }

   function conda_env {
       [[ $PWD == $HOME/Documents/BaiduSeg* ]] && conda activate BaiduSeg
   }
   ```
