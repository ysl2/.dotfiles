package javarestore;

public interface Definition {
        // .dotfiles的存放位置，注意最后的斜杠不能省略，并且必须用绝对路径
        String SOURCE_STRING = "/home/yusoli/.dotfiles/";
        // 想要建立链接的目标位置。通常是家目录（即/home/yusoli/）注意最后的斜杠不能省略，并且必须用绝对路径
        String TARGET_STRING = "/home/yusoli/";
        // 输出脚本的存放位置，注意最后的斜杠不能省略，并且必须用绝对路径
        String LINK_FILES_SCRIPT_STRING = "/home/yusoli/.dotfiles/.RESTORE-BY-JAVA/assets/";
        // 用于输出冲突文件列表
        String CONFLICT_LOG = "conflict.sh";

        String STOW_SHELL = "run-stow.sh";
}
