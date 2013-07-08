package net.mcs51ide.sdcc;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import net.mcs51ide.MainIDE;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
class ChildDataHandler extends Thread {

    InputStream inputStream;
    String type;
    public static String stdOut;
    public static String stdErr;

    ChildDataHandler(InputStream inputStream, SDCCRunner lnk) {
        this.inputStream = inputStream;
        this.type = type;
    }//end constructor

    @Override
    public void run() {
        try {
            InputStreamReader inputStreamReader =
                    new InputStreamReader(inputStream);
            BufferedReader bufferedReader =
                    new BufferedReader(inputStreamReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                MainIDE.getInstance().getPaneOutputs().getCompilerOutput().writeLn(line);
            }//end while
        } catch (Exception e) {
            e.printStackTrace();
        }//end catch
    }//end run

    
}//end class ChildDataHandler
