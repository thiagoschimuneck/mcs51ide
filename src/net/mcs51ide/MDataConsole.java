package net.mcs51ide;

import java.awt.BorderLayout;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
public class MDataConsole extends JPanel {

    private JTextArea textArea;
    private JScrollPane sp;

    public MDataConsole() {
        this.setLayout(new BorderLayout());
        this.textArea = new JTextArea(15, 80);
        this.sp = new JScrollPane(this.textArea);
        this.add(this.sp);

    }

    public void setData(String line) {
        this.textArea.setText(line);
        textArea.setCaretPosition(0);
    }
}
