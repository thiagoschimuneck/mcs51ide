/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author thiago
 */
public class Utils {

    public final static String asm = "asm";
    public final static String a51 = "a51";
    public final static String c = "c";
    /*
     * Get the extension of a file.
     */

    public static String putExtension(String s, String ext) {
        String separator = ".";
        return s.concat(separator).concat(ext);
    }

    public static String getExtension(String s) {

        String separator = System.getProperty("file.separator");
        String filename;

        // Remove the path upto the filename.
        int lastSeparatorIndex = s.lastIndexOf(separator);
        if (lastSeparatorIndex == -1) {
            filename = s;
        } else {
            filename = s.substring(lastSeparatorIndex + 1);
        }

        // get the extension.
        int extensionIndex = filename.lastIndexOf(".");
        if (extensionIndex == -1) {
            return "";
        }
        return filename.substring(extensionIndex + 1);
    }

    public static String getExtension(File f) {
        String ext = null;
        String s = f.getName();
        int i = s.lastIndexOf('.');

        if (i > 0 && i < s.length() - 1) {
            ext = s.substring(i + 1).toLowerCase();
        }
        return ext;
    }

    public static String removeExtension(String in) {
        int p = in.lastIndexOf(".");
        if (p < 0) {
            return in;
        }

        int d = in.lastIndexOf(File.separator);

        if (d < 0 && p == 0) {
            return in;
        }

        if (d >= 0 && d > p) {
            return in;
        }

        return in.substring(0, p);
    }

    public static String removePath(String s) {

        String separator = System.getProperty("file.separator");
        String filename;

        // Remove the path upto the filename.
        int lastSeparatorIndex = s.lastIndexOf(separator);
        if (lastSeparatorIndex == -1) {
            filename = s;
        } else {
            filename = s.substring(lastSeparatorIndex + 1);
        }

        return filename;
    }

    public static String getPath(String fileName) {
        if (fileName.lastIndexOf(File.separator) != -1) {
            return fileName.substring(0, fileName.lastIndexOf(File.separator));
        } else {
            return fileName;
        }
    }

    public static boolean insertLine(String line, int lineNum, String fileName) {

        File file = new File(fileName);
        if (!file.exists()) {
            return false;
        }
        BufferedReader br;
        try {
            br = new BufferedReader(new FileReader(file));
            StringBuilder buf = new StringBuilder();

            String l;
            int c=1;
            while ((l = br.readLine()) != null) {
                if (c++ == lineNum) {
                    buf.append(line);
                }
                buf.append(l).append(System.lineSeparator());
            }
            br.close();
            file.delete();
            FileWriter fw = new FileWriter(file,false);
            fw.write(new String(buf));
            fw.flush();
            fw.close();
        } catch (IOException ex) {
            return false;
        }
        return true;

    }
}
