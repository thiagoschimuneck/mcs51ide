package net.mcs51ide;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
public class IDEMenuBar extends JMenuBar implements ActionListener {

    private JMenu mnuFile;
    private JMenuItem mnuNew, mnuOpen, mnuSave, mnuSaveAs, mnuExit;
    private JMenu mnuEdit;
    private final JMenuItem mnuCut, mnuCopy, mnuPaste, mnuUndo, mnuRedo;
    private final JMenu mnuTarget;
    private final JMenuItem mnuPort;
    private final JMenu mnuProject;
    private final JMenuItem mnuNewProject, mnuOpenProject, mnuSaveProject, mnuOptionsProject,mnuAddFile;

    public IDEMenuBar() {
        super();
        mnuFile = new JMenu("Arquivo");
        add(mnuFile);
        mnuNew = new JMenuItem("Novo", new ImageIcon(getClass().getResource("/resources/new.png")));
        mnuNew.addActionListener(this);
        mnuFile.add(mnuNew);
        mnuOpen = new JMenuItem("Abrir", new ImageIcon(getClass().getResource("/resources/open.png")));
        mnuOpen.addActionListener(this);
        mnuFile.add(mnuOpen);
        mnuSave = new JMenuItem("Salvar", new ImageIcon(getClass().getResource("/resources/save.png")));
        mnuSave.addActionListener(this);
        mnuFile.add(mnuSave);
        mnuSaveAs = new JMenuItem("Salvar como", new ImageIcon(getClass().getResource("/resources/saveas.png")));
        mnuSaveAs.addActionListener(this);
        mnuFile.add(mnuSaveAs);
        mnuFile.addSeparator();
        mnuExit = new JMenuItem("Sair", new ImageIcon(getClass().getResource("/resources/exit.png")));
        mnuExit.addActionListener(this);
        mnuFile.add(mnuExit);

        mnuEdit = new JMenu("Editar");
        mnuUndo = new JMenuItem("Desfazer");
        mnuUndo.addActionListener(this);
        mnuEdit.add(mnuUndo);
        mnuRedo = new JMenuItem("Refazer");
        mnuRedo.addActionListener(this);
        mnuEdit.add(mnuRedo);

        mnuEdit.addSeparator();
        mnuCut = new JMenuItem("Cortar");
        mnuCut.addActionListener(this);
        mnuEdit.add(mnuCut);
        mnuCopy = new JMenuItem("Copiar");
        mnuCopy.addActionListener(this);
        mnuEdit.add(mnuCopy);
        mnuPaste = new JMenuItem("Colar");
        mnuPaste.addActionListener(this);
        mnuEdit.add(mnuPaste);
        add(mnuEdit);

        mnuTarget = new JMenu("Hardware");
        mnuPort = new JMenuItem("Porta");
        mnuPort.addActionListener(this);
        mnuTarget.add(mnuPort);
        add(mnuTarget);

        mnuProject = new JMenu("Projeto");
        mnuNewProject = new JMenuItem("Novo", new ImageIcon(getClass().getResource("/resources/new.png")));
        mnuNewProject.addActionListener(this);
        mnuProject.add(mnuNewProject);
        mnuOpenProject = new JMenuItem("Abrir", new ImageIcon(getClass().getResource("/resources/open.png")));
        mnuOpenProject.addActionListener(this);
        mnuProject.add(mnuOpenProject);
        mnuSaveProject = new JMenuItem("Salvar", new ImageIcon(getClass().getResource("/resources/save.png")));
        mnuSaveProject.addActionListener(this);
        mnuProject.add(mnuSaveProject);
        mnuOptionsProject = new JMenuItem("Propriedades");
        mnuOptionsProject.addActionListener(this);
        mnuProject.add(mnuOptionsProject);
        mnuProject.addSeparator();
        mnuAddFile = new JMenuItem("Adicionar arquivo ao projeto");
        mnuAddFile.addActionListener(this);
        mnuProject.add(mnuAddFile);
        
        add(mnuProject);

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        JMenuItem mi = (JMenuItem) e.getSource();
        if (mi.equals(mnuOpen)) {
            MainIDE.getInstance().loadFileDialog();
        } else if (mi.equals(mnuSave)) {
            MainIDE.getInstance().saveCurrentEd();
        } else if (mi.equals(mnuSaveAs)) {
            MainIDE.getInstance().saveAsCurrentEd();
        } else if (mi.equals(mnuExit)) {
            if (MainIDE.getInstance().checkFilesChanged()) {
                MainIDE.getInstance().getCMon51().close();
                MainIDE.getInstance().dispose();
            }
        } else if (mi.equals(mnuUndo)) {
            MainIDE.getInstance().getCurrentSourceTextEditor().getTextArea().undoLastAction();
        } else if (mi.equals(mnuRedo)) {
            MainIDE.getInstance().getCurrentSourceTextEditor().getTextArea().redoLastAction();
        } else if (mi.equals(mnuCut)) {
            MainIDE.getInstance().getCurrentSourceTextEditor().getTextArea().cut();
        } else if (mi.equals(mnuCopy)) {
            MainIDE.getInstance().getCurrentSourceTextEditor().getTextArea().copy();
            int s = MainIDE.getInstance().getCurrentSourceTextEditor().getTextArea().getSelectionEnd();
            MainIDE.getInstance().getCurrentSourceTextEditor().getTextArea().select(s,s);
        } else if (mi.equals(mnuPaste)) {
            MainIDE.getInstance().getCurrentSourceTextEditor().getTextArea().paste();
        } else if (mi.equals(mnuPort)) {
            TargetPortConfiguration p = new TargetPortConfiguration();
            p.setVisible(true);
        } else if (mi.equals(mnuNew)) {
            MainIDE.getInstance().newTabFile();
        }
        else if (mi.equals(mnuOpenProject)) {
            MainIDE.getInstance().loadProjectDialog();
        }
        else if (mi.equals(mnuSaveProject)) {
            MainIDE.getInstance().saveCurrentProject();
        }
        else if (mi.equals(mnuAddFile)) {
            MainIDE.getInstance().addCurrentFileProject();
        }

    }
}
