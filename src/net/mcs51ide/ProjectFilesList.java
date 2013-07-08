/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide;

import java.awt.BorderLayout;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.util.HashMap;
import javax.swing.DefaultListModel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.ListSelectionModel;
import net.mcs51ide.utils.Utils;

/**
 *
 * @author thiago
 */
public class ProjectFilesList extends JPanel {

    private JList list;
    private HashMap fSed;
    private DefaultListModel items;
    
    public ProjectFilesList() {
        super();
        fSed = new HashMap();
        items = new DefaultListModel();
        list = new JList(items);
        this.setLayout(new BorderLayout());
        list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        list.setCellRenderer(new ProjectListCellRenderer());
        this.add(list);
        list.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent evt) {
                JList list = (JList) evt.getSource();
                if (evt.getClickCount() == 2) {
                    int index = list.locationToIndex(evt.getPoint());
                    list.setSelectedIndex(index);
                    String f = (String)fSed.get(index);
                    String workDir = MainIDE.getInstance().getProject().getAbsPath();
                    f = workDir.concat(File.separator.concat(f));
                    SourceTextEditor ed;
                    ed = MainIDE.getInstance().checkFileIsOpen(f);
                    if (ed != null) {
                        MainIDE.getInstance().setCurrentSourceTextEditor(ed);
                    } else {
                        ed = MainIDE.getInstance().loadTabFromFile(f);
                    }
                    ed.setProject(MainIDE.getInstance().getProject());
                    ed.updateTabName();
                }
            }
        });
    }
    
    public JList getJList() {
        return this.list;
    }
    
    public void addFile(String fileName) {
        String f = Utils.removePath(fileName);
        items.addElement(f);
        this.fSed.put(items.size()-1,fileName);
    }

    void clear() {
        this.fSed.clear();
        this.items.clear();
    }
}
