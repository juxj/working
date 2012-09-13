/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package italk.util;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
*
* @author chenzhihui
*/
@SuppressWarnings("all")
public class ClassUtils {

// 从一个包中查找出所有的类，在jar包中不能查找
    public static List<String> getClasses(String packageName)
            throws ClassNotFoundException, IOException {
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        String path = packageName.replace('.', '/');
        Enumeration<URL> resources = classLoader.getResources(path);
        List<File> dirs = new ArrayList<File>();
        while (resources.hasMoreElements()) {
            URL resource = resources.nextElement();
            dirs.add(new File(resource.getFile()));
        }
        ArrayList<String> classes = new ArrayList<String>();
        for (File directory : dirs) {
            classes.addAll(findClasses(directory, packageName));
        }
        return classes;
    }

    public static List<String> findClasses(File directory, String packageName)
            throws ClassNotFoundException {
        List<String> classes = new ArrayList<String>();
        if (!directory.exists()) {
            return classes;
        }
        File[] files = directory.listFiles();
        for (File file : files) {
            if (file.isDirectory()) {
                assert !file.getName().contains(".");
                classes.addAll(findClasses(file, packageName + "."
                        + file.getName()));
            } else if (file.getName().endsWith(".class")) {
                classes.add(packageName
                        + '.'
                        + file.getName().substring(0,
                        file.getName().length() - 6));
            }
        }
        return classes;
    }

    public static void main(String[] args) throws Exception {
        System.out.println(ClassUtils.getClasses("italk.ui.skin"));
    }
}