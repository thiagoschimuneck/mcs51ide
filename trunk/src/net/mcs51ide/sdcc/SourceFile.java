/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.sdcc;

import java.io.File;
import net.mcs51ide.utils.Utils;

/**
 *
 * @author thiago
 */
public class SourceFile {
    private String fileName;
    private String type;
    private Project prj;
    private String absPath;

    /**
     * @return the fileName
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param fileName the fileName to set
     */
    public void setFileName(String fileName) {
        this.fileName = Utils.removePath(fileName);
        File f = new File(fileName);
        f = f.getParentFile();
        if (f!=null)
            this.absPath = f.getAbsolutePath();
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }
    
    public boolean detectType() {
        String extension = Utils.getExtension(this.fileName);
        switch(extension.toLowerCase()) {
            case "c":
                this.setType("c");
                return true;
            case "h":
                this.setType("c");
                return true;
            case "asm":
                this.setType("asm");
                return true;
        }
        return false;
    }

    /**
     * @return the prj
     */
    public Project getProject() {
        return prj;
    }

    /**
     * @param prj the prj to set
     */
    public void setProject(Project prj) {
        this.prj = prj;
    }
    
    public String getFullFileName() {
        if (this.prj != null) {
            return this.prj.getAbsPath().concat(File.separator).concat(this.fileName);
        } else {
            return this.absPath.concat(File.separator).concat(this.fileName);
        }
    }
    
    public SourceFile getAsmSourceFileName() {
        SourceFile src;
        src = new SourceFile();
        if (this.getProject() != null) {
            src.setProject(this.getProject());
        } else {
            src.absPath = this.absPath;
        }
        src.setType("asm");
        String fn = Utils.removeExtension(this.getFileName());
        fn = Utils.putExtension(fn, "asm");
        src.setFileName(fn);
        return src;
        
    }
}
