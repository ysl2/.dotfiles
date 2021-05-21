package javarestore;

import java.util.TreeSet;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.TreeMap;
import java.util.Set;
import java.util.Map.Entry;
import java.nio.file.Files;
import java.io.BufferedWriter;

/**
 * PathData
 */
public class PathData implements Definition {
    private TreeMap<File, File> fileMap = new TreeMap<File, File>();
    private TreeSet<File> folderSet = new TreeSet<File>();
    private boolean isConflict = false;

    public PathData() {
    }

    public void addFile(File oldFile, File newFile) {
        fileMap.put(oldFile, newFile);
    }

    public void addFolder(File folder) {
        folderSet.add(folder);
    }

    public TreeMap<File, File> getFileList() {
        return fileMap;
    }

    public TreeSet<File> getFolderList() {
        return folderSet;
    }

    public void setFolderList(TreeSet<File> newFolderMap) {
        this.folderSet = newFolderMap;
    }

    /**
     * 对文件夹的路径进行替换，并存储
     */
    public void getReplacedNewFolderSet() {
        TreeSet<File> newfolderSet = new TreeSet<File>();
        for (File f : folderSet) {
            String newPath = PathDataUtil.replacePath(f.getAbsolutePath());
            if (!newPath.equals(TARGET_STRING)) {
                f = new File(newPath);
                newfolderSet.add(f);
            }
        }
        folderSet = newfolderSet;
    }

    /**
     * 对文件的路径进行替换，并将替换前和替换后的内容以键值对的方式存储
     */
    public void getReplacedNewfileMap() {
        Set<Entry<File, File>> keySet = fileMap.entrySet();
        for (Entry<File, File> element : keySet) {
            String newPath = PathDataUtil.replacePath(element.getKey().getAbsolutePath());
            if (!newPath.equals(TARGET_STRING)) {
                element.setValue(new File(newPath));
            }
        }
    }

    /**
     * 输出所有替换后的文件夹的路径
     */
    public void echoFolderSet() {
        for (File folder : folderSet) {
            System.out.println(folder.getAbsolutePath());
        }
    }

    /**
     * 输出所有替换前和替换后的文件的路径
     */
    public void echoFileMap() {
        Set<Entry<File, File>> keySet = fileMap.entrySet();
        for (Entry<File, File> element : keySet) {
            System.out.println("sudo ln -s " + element.getKey().getAbsolutePath() + " "
                    + element.getValue().getAbsolutePath() + "\n");
        }
    }

    /**
     * 对于文件夹： 如果文件夹路径中存在软链接，要把软链接删除后重新创建一个真实文件夹。如果文件夹不存在，要执行创建操作。 如果存在就什么都不做
     */
    public void folderSetOperate() {
        for (File folder : folderSet) {
            PathDataUtil.deleteAllSubFolderSymbLink(folder);
            if (!folder.exists()) {
                System.out.println("[folder]created: " + folder.getAbsolutePath());
                // ! Dangerous Operation
                folder.mkdirs();
            }
        }
    }

    /**
     * 对于文件，需要判断对应的家目录是否已经存在文件。如果存在真实文件，就判定为冲突，输出到日志中，然后跳过这个文件 如果只是链接，就删掉。
     * 最终，无论是链接，还是不存在的文件，都需要重新链接起来
     */
    public void fileMapOperate() {
        PathData.checkIfScriptExists();
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(LINK_FILES_SCRIPT_STRING + CONFLICT_LOG, true);
            Set<Entry<File, File>> keySet = fileMap.entrySet();
            // key是dotfiles里的，value是对应的家目录
            for (Entry<File, File> element : keySet) {
                if (element.getValue().exists() && !Files.isSymbolicLink(element.getValue().toPath())) {
                    // 如果是真实文件，不删除，记录到冲突日志里，然后直接跳过
                    isConflict = true;
                    // 下面这行是原先的
                    // fos.write(("sudo rm " + element.getValue().getAbsolutePath() + " && sudo ln -s " + element.getKey().getAbsolutePath() + " " + element.getValue().getAbsolutePath() + "\n") .getBytes());
                    fos.write(("sudo rm " + element.getValue().getAbsolutePath() + "\n") .getBytes());
                    continue;
                } else if (element.getValue().exists()
                        && Files.isSymbolicLink(element.getValue().toPath().toAbsolutePath())) {
                    // 如果是软链接，才删除。
                    System.out.println("[link file]deleted: " + element.getValue().getAbsolutePath());
                    // ! Dangerous Operation
                    element.getValue().delete();
                }
                // 创建软链接
                // createMySymbolicLink(element.getKey(), element.getValue());
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 这是原先的方法。用于直接创建链接的。但是我发现通过java创建的链接不能被stow管理，因此单独分离出来作为方法，万一后面依然不好使，就用这个方法恢复
     * @param key
     * @param value
     */
    private static void createMySymbolicLink(File key, File value) {
        // 最终剩下的都是不含冲突且不存在的文件，就执行链接操作
        System.out.println("[link file]created: " + value.getAbsolutePath());
        // ! Dangerous Operation
        try {
            Files.createSymbolicLink(value.toPath().toAbsolutePath(), key.toPath().toAbsolutePath());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 用于检测输出脚本的路径是否已经存在，如果不存在就创建。 并检查输出脚本文件是否存在，如果存在就删除后重新创建。如果不存在就直接创建
     */
    private static void checkIfScriptExists() {
        File path = new File(LINK_FILES_SCRIPT_STRING);
        if (!path.exists()) {
            path.mkdirs();
        }
        File conflictLog = new File(LINK_FILES_SCRIPT_STRING + CONFLICT_LOG);
        if (conflictLog.exists()) {
            conflictLog.delete();
        }
        try {
            conflictLog.createNewFile();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void allDoneClean() {
        // 就算没有冲突也不能直接删除assets文件夹了
        if (!isConflict) {
            // 但是冲突文件依然需要删掉
            File conflictFile = new File(LINK_FILES_SCRIPT_STRING + CONFLICT_LOG);
            conflictFile.delete();
            // File conflictFolder = new File(LINK_FILES_SCRIPT_STRING);
            // conflictFolder.delete();
        } else {
            // 如果发生冲突，就在最后加上删除自己的语句
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(LINK_FILES_SCRIPT_STRING + CONFLICT_LOG, true))) {
                bw.write("\n# 清理产生的冲突文件\nsudo rm " + LINK_FILES_SCRIPT_STRING + CONFLICT_LOG + "\n");
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println("----------------------------------");
            System.out.println("Conflict detected. \nThe conflict files list has been saved in " + LINK_FILES_SCRIPT_STRING + CONFLICT_LOG);
        }
    }
}
