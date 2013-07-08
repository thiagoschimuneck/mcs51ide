/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide;

import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;

/**
 *
 * @author thiago
 */
public class IDEDocumentListener implements DocumentListener {

    private SourceTextEditor ed;
    
    public IDEDocumentListener(SourceTextEditor ed) {
        this.ed = ed;
    }

    @Override
    public void insertUpdate(DocumentEvent e) {
        ed.setIsChanged(true);
        ed.updateTabName();
    }

    @Override
    public void removeUpdate(DocumentEvent e) {
        ed.setIsChanged(true);
        ed.updateTabName();
    }

    @Override
    public void changedUpdate(DocumentEvent e) {
        ed.setIsChanged(true);
        ed.updateTabName();
    }

    public void updateLog(DocumentEvent e, String action) {
        ed.setIsChanged(true);
        ed.updateTabName();
    }
}