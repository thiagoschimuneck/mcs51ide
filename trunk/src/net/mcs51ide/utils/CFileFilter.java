/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.utils;

import java.io.File;
import javax.swing.filechooser.FileFilter;

/**
 *
 * @author thiago
 */
public class CFileFilter extends FileFilter {
     @Override
    public boolean accept(File f) {
        if (f.isDirectory()) {
            return true;
        }
 
        String extension = Utils.getExtension(f);
        if (extension != null) {
            if (extension.equals(Utils.c)) {
                    return true;
            } else {
                return false;
            }
        }
 
        return false;
    }
 
    //The description of this filter
    @Override
    public String getDescription() {
        return "C Files";
    }
}
