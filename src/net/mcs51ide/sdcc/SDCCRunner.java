/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.sdcc;

import java.io.File;
import net.mcs51ide.OSValidator;

/**
 *
 * @author thiago
 */
public class SDCCRunner {

    public String stdOut;
    public String stdErr;
    private String workDir;
    private static String pathToSdcc;
    private static int sdccVersion;

    public SDCCRunner() {
        this.stdErr = "";
        this.stdOut = "";
    }

    public int executeCommand(String command) {
        Process proc;
        this.stdErr = "";
        this.stdOut = "";
        int val;
        try {
            proc = Runtime.getRuntime().exec(pathToSdcc.concat(command), null, new File(getWorkDir()));
            ChildDataHandler errorHandler =
                    new ChildDataHandler(proc.getErrorStream(), this);
            ChildDataHandler outputHandler =
                    new ChildDataHandler(proc.getInputStream(), this);

            errorHandler.start();
            outputHandler.start();
            val = proc.waitFor();

        } catch (Exception e) {
            val = -1;
        }
        return val;
    }

    /**
     * @return the workDir
     */
    public String getWorkDir() {
        return workDir;
    }

    /**
     * @param workDir the workDir to set
     */
    public void setWorkDir(String workDir) {
        this.workDir = workDir;
    }

    public static boolean detectSdcc() {
        if (OSValidator.isWindows()) {
            String pf = System.getenv("ProgramFiles");
            if ((new File(pf.concat("\\sdcc\\bin\\sdcc.exe"))).exists()) {
                pathToSdcc = pf.concat("\\sdcc\\bin\\");
            } else if ((new File("\\sdcc\\bin\\sdcc.exe")).exists()) {
                pathToSdcc = "\\sdcc\\bin\\";
            } else {
                System.out.println("O Sdcc deve estar em c:\\sdcc\\");
                return false;
            }
            if ((new File(pathToSdcc.concat("sdas8051.exe"))).exists()) {
                sdccVersion = 3;
            } else {
                sdccVersion = 2;
            }
        } else if (OSValidator.isUnix()) {
            if ((new File("/usr/local/sdcc/bin/sdcc")).exists()) {
                pathToSdcc = "/usr/local/sdcc/bin/";
            } else if ((new File("/usr/bin/sdcc")).exists()) {
                pathToSdcc = "/usr/bin/";
            } else {
                System.out.println("O Sdcc deve estar na distriuição ou no /usr/local/sdcc.");
                return false;
            }
            if ((new File(pathToSdcc.concat("sdas8051"))).exists()) {
                sdccVersion = 3;
            } else {
                sdccVersion = 2;
            }

        }
        return true;
    }
    
    public static int getVersion() {
        return sdccVersion;
    }
}
