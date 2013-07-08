/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.sdcc;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;

/**
 *
 * @author thiago
 */
public class AsmFileParser {

    private HashMap CLineALine;

    public boolean parseFile(String fileName) {
        String record;
        String fileSource = net.mcs51ide.utils.Utils.removePath(fileName);

        FileReader fr;
        BufferedReader br;
        FileWriter fw;
        try {
            fr = new FileReader(fileName);
            br = new BufferedReader(fr);
            int aLine=0;
            while ((record = br.readLine()) != null) {
                aLine++;
                int p = record.indexOf("C$");
                if (p > -1) {
                    int p2;
                    if (record.substring(p+2, p2=record.indexOf("$",p+2)).equals(fileSource)) {
                        int cLine = Integer.parseInt(record.substring(p2+1, record.indexOf("$",p2+1)));
                        this.CLineALine.put(cLine, aLine);
                    }
                }
            }
        } catch (IOException ex) {
            return false;
        }
        return true;
    }
}
