package net.mcs51ide;

import java.awt.Dimension;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JScrollPane;
import javax.swing.text.BadLocationException;
import org.fife.ui.rsyntaxtextarea.RSyntaxTextArea;
import org.fife.ui.rsyntaxtextarea.SyntaxConstants;
import org.fife.ui.rtextarea.RTextScrollPane;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
public class AssemblyConsole extends RTextScrollPane {

    private RSyntaxTextArea myTextArea;
    private JScrollPane sp;
    private HashMap AddressLines;

    public AssemblyConsole() {
        super(new RSyntaxTextArea(20, 40));
        this.setMinimumSize(new Dimension(200, 100));
        this.myTextArea = (RSyntaxTextArea) this.getTextArea();
        this.myTextArea.setSyntaxEditingStyle(SyntaxConstants.SYNTAX_STYLE_ASSEMBLER_X86);
        this.myTextArea.setCodeFoldingEnabled(true);
        this.myTextArea.setAntiAliasingEnabled(true);
        this.myTextArea.setEditable(false);
        this.setLineNumbersEnabled(true);
        this.setFoldIndicatorEnabled(true);
        this.setIconRowHeaderEnabled(true);

    }

    public void setInstructions(ArrayList instructions, HashMap lines) {
        this.AddressLines = lines;
        this.myTextArea.setText("");
        String line = " ";
        for (int i = 0; i < instructions.size(); i++) {
            this.myTextArea.append(instructions.get(i) + System.lineSeparator());
        }
    }

    public void setStepLine(String addr) {
        int ad = Integer.parseInt(addr, 16);
        int line = (int) this.AddressLines.get(ad);
        try {
            this.getGutter().removeAllTrackingIcons();
            this.getGutter().addLineTrackingIcon(line-1, new ImageIcon(getClass().getResource("/resources/play.png")));
            this.myTextArea.setCaretPosition(this.myTextArea.getLineStartOffset(line-1));
        } catch (BadLocationException ex) {
            Logger.getLogger(AssemblyConsole.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void clearStep() {
        this.getGutter().removeAllTrackingIcons();
    }
}
