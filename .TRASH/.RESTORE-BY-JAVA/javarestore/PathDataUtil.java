package javarestore;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.nio.file.Files;

public class PathDataUtil implements Definition {

    private PathDataUtil() {

    }

    /**
     * 脚本运行的入口
     * @param pathData
     */
    public static void initScript(PathData pathData) {
        File source = new File(SOURCE_STRING);
        // File target = new File(targetString);

        // 扫描，得到文件列表和文件夹列表
        checkAll(source, pathData);

        // 替换为新路径
        pathData.getReplacedNewfileMap();
        pathData.getReplacedNewFolderSet();

        // 对于文件和文件夹执行不同的操作
        pathData.folderSetOperate();
        pathData.fileMapOperate();

        pathData.allDoneClean();
    }

    /**
     * 对.dotfiles/目录下的内容进行遍历
     * @param folderSet
     * @param pathData
     */
    public static void checkAll(File source, PathData pathData) {
        File[] files = source.listFiles();
        if (files == null) {
            return;
        }
        File path = new File(LINK_FILES_SCRIPT_STRING);
        if (!path.exists()) {
            path.mkdirs();
        }
        File stowScript = new File(LINK_FILES_SCRIPT_STRING + STOW_SHELL);
        if (stowScript.exists()) {
            stowScript.delete();
        }
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(LINK_FILES_SCRIPT_STRING + STOW_SHELL, true))) {
            boolean flag = false;
            for (File f : files) {
                if (f.getName().startsWith(".")) {
                    continue;
                } else if (f.isFile()) {
                    // System.out.println(file.getName());
                    continue;
                } else if (f.isDirectory()) {
                    // 如果发现了文件夹， 并且之前没写过下面这句，则在开头加上这句。以后如果再发现文件夹就不写这句了
                    if (flag == false) {
                        bw.write("cd " + SOURCE_STRING + "\n");
                        bw.flush();
                        flag = true;
                    }
                    bw.write("stow -R " + f.getName() + " && echo '[link stow]created: " + f.getName() + "'" + "\n");
                    bw.flush();
                    getAllFiles(f, pathData);
                }
            }
            // 在最后加上删除自己的语句
            bw.write("rm " + LINK_FILES_SCRIPT_STRING + STOW_SHELL);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 遍历整个文件夹，输出所有文件的路径，并将所有文件夹路径存放在TreeSet中
     *
     * @param folder
     * @param folderSet
     */
    private static void getAllFiles(File folder, PathData pathData) {
        File[] files = folder.listFiles();
        if (files == null) {
            return;
        }
        // 如果一个目录下既有文件也有文件夹那么就不会把当前目录的文件夹纳入到TreeSet中
        // 下面这个for用于判断是否是上述情况
        boolean flag = false;
        for (File f : files) {
            if (f.isDirectory()) {
                flag = true;
                break;
            }
        }
        for (File f : files) {
            if (f.isDirectory()) {
                getAllFiles(f, pathData);
            } else if (f.isFile()) {
                pathData.addFile(f, null);
                if (flag == false) {
                    pathData.addFolder(f.getParentFile());
                }
            }
        }
    }

    /**
     * 文件或文件夹路径替换 给定一个路径，先去除路径开头的sourceString和下一个子文件夹，然后在开头加上targetString
     *
     * 比如： 原路径： "/home/yusoli/.dotfiles/alacritty/.config/alacritty/alacritty.yml"
     * 目标路径： "/home/yusoli/.config/alacritty/alacritty.yml"
     *
     * 用变量替换后： 原路径： sourceString + "alacritty/.config/alacritty/alacritty.yml" 目标路径：
     * targetString + ".config/alacritty/alacritty.yml"
     *
     * 另外还需要考虑： 如果是文件夹，路径截断后变为null的情况 比如： 原路径： /home/yusoli/.dotfiles/bash 目标路径：
     * /home/yusoli/
     *
     * 用变量替换后： 原路径： sourceString + "bash" 目标路径： targetString + ""
     * @param path
     * @return
     */
    public static String replacePath(String path) {
        int i = SOURCE_STRING.length();
        for (; i < path.length(); i++) {
            if (path.charAt(i) == '/') {
                break;
            }
        }
        if (i >= path.length()) {
            return TARGET_STRING;
        }
        return TARGET_STRING + path.substring(i + 1);
    }

    /**
     * 对于一个给定的文件夹，判断此文件夹及其父文件夹是否是符号链接。如果是符号链接，就直接删掉
     * @param folder
     */
    public static void deleteAllSubFolderSymbLink(File folder) {
        String folderString = folder.getAbsolutePath();
        while (folderString.length() > TARGET_STRING.length()) {
            File subfolder = new File(folderString);
            if (Files.isSymbolicLink(subfolder.toPath())) {
                System.out.println("[link folder]deleted: " + subfolder.getAbsolutePath());
                // ! Dangerous Operation
                subfolder.delete();
            }
            folderString = folderString.substring(0, folderString.lastIndexOf("/"));
        }
    }
}
