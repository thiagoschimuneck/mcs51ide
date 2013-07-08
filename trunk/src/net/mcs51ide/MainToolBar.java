package net.mcs51ide;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JToolBar;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
public class MainToolBar extends JToolBar implements ActionListener {

    public JButton New, Save, Open, Play, Pause, StepInto, StepOut, StepOver, Stop, Reset, SourceAsm;
    public JButton SaveAs, Compile;

    public MainToolBar() {
        super();
        setFloatable(false);

        New = new JButton(new ImageIcon(getClass().getResource("/resources/new.png")));
        New.addActionListener(this);
        New.setToolTipText("Novo");

        SaveAs = new JButton(new ImageIcon(getClass().getResource("/resources/saveas.png")));
        SaveAs.addActionListener(this);
        SaveAs.setToolTipText("Salvar como");

        Save = new JButton(new ImageIcon(getClass().getResource("/resources/save.png")));
        Save.addActionListener(this);
        Save.setToolTipText("Salvar");

        Open = new JButton(new ImageIcon(getClass().getResource("/resources/open.png")));
        Open.addActionListener(this);
        Open.setToolTipText("Abrir");

        Play = new JButton(new ImageIcon(getClass().getResource("/resources/play.png")));
        Play.addActionListener(this);
        Play.setToolTipText("Executar");

        Pause = new JButton(new ImageIcon(getClass().getResource("/resources/pause.png")));
        Pause.addActionListener(this);
        Pause.setToolTipText("Pause");
        Pause.setEnabled(false);

        StepInto = new JButton(new ImageIcon(getClass().getResource("/resources/stepinto.png")));
        StepInto.addActionListener(this);
        StepInto.setToolTipText("Step In To");
        StepInto.setEnabled(false);

        StepOut = new JButton(new ImageIcon(getClass().getResource("/resources/stepout.png")));
        StepOut.addActionListener(this);
        StepOut.setToolTipText("Step In To");
        StepOut.setEnabled(false);

        StepOver = new JButton(new ImageIcon(getClass().getResource("/resources/stepover.png")));
        StepOver.addActionListener(this);
        StepOver.setToolTipText("Step Over");
        StepOver.setEnabled(false);

        Stop = new JButton(new ImageIcon(getClass().getResource("/resources/stop.png")));
        Stop.addActionListener(this);
        Stop.setToolTipText("Stop");
        Stop.setEnabled(false);

        Reset = new JButton(new ImageIcon(getClass().getResource("/resources/reset.png")));
        Reset.addActionListener(this);
        Reset.setToolTipText("Reset");
        Reset.setEnabled(false);

        Compile = new JButton(new ImageIcon(getClass().getResource("/resources/compile0.png")));
        Compile.addActionListener(this);
        Compile.setToolTipText("Compilar");

        SourceAsm = new JButton(new ImageIcon(getClass().getResource("/resources/sourceasm.gif")));
        SourceAsm.addActionListener(this);
        SourceAsm.setToolTipText("Ver assembler");
        SourceAsm.setEnabled(false);


        this.addSeparator(new Dimension(30, 1));
        add(New);
        add(Open);
        add(Save);
        add(SaveAs);
        this.addSeparator(new Dimension(30, 1));
        add(Compile);
        this.addSeparator();
        add(Play);
        add(Pause);
        add(StepInto);
        add(StepOut);
        add(StepOver);
        add(Reset);
        add(Stop);
        this.addSeparator();
        add(SourceAsm);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource().equals(New)) {
            MainIDE.getInstance().newTabFile();
        } else if (e.getSource().equals(Compile)) {
            SourceTextEditor ed = MainIDE.getInstance().getCurrentSourceTextEditor();
            if (ed != null) {
                ed.saveToFile();
                ed.compile();
            }
        } else if (e.getSource().equals(Open)) {
            MainIDE.getInstance().loadFileDialog();
        } else if (e.getSource().equals(Save)) {
            MainIDE.getInstance().saveCurrentEd();
        } else if (e.getSource().equals(SaveAs)) {
            MainIDE.getInstance().saveAsCurrentEd();
        } else if (e.getSource().equals(Play)) {
            SourceTextEditor ed;
            ed = MainIDE.getInstance().getCurrentSourceTextEditor();
            if (ed != null) {
                if (ed.executeOnTarget()) {
                    this.runningMode();
                }
            }
        } else if (e.getSource().equals(Pause)) {
            MainIDE.getInstance().pauseTarget(1);
            this.pausedMode();
        } else if (e.getSource().equals(StepInto)) {
            MainIDE.getInstance().stepIntoTarget();
        } else if (e.getSource().equals(Stop)) {
            MainIDE.getInstance().stopTarget();
            this.stopedMode();
        } else if (e.getSource().equals(SourceAsm)) {
            MainIDE.getInstance().showAsmSource();
        } else {
            System.out.println();
        }
    }

    public void pausedMode() {
        Pause.setEnabled(false);
        Play.setEnabled(true);
        StepInto.setEnabled(true);
        StepOut.setEnabled(false); // true
        StepOver.setEnabled(false); // true
        SourceAsm.setEnabled(true);
        MainIDE.getInstance().getPaneOutputs().getRegistersConsole().setUpdateButtonEnabled(true);
        MainIDE.getInstance().getPaneOutputs().getMemoryExternalConsole().setUpdateButtonEnabled(true);
        MainIDE.getInstance().getPaneOutputs().getMemoryInternalConsole().setUpdateButtonEnabled(true);
    }

    public void stopedMode() {
        Stop.setEnabled(false);
        Pause.setEnabled(false);
        Play.setEnabled(true);
        StepInto.setEnabled(false);
        StepOut.setEnabled(false);
        StepOver.setEnabled(false);
        SourceAsm.setEnabled(false);
        MainIDE.getInstance().getPaneOutputs().getRegistersConsole().setUpdateButtonEnabled(false);
        MainIDE.getInstance().getPaneOutputs().getMemoryExternalConsole().setUpdateButtonEnabled(false);
        MainIDE.getInstance().getPaneOutputs().getMemoryInternalConsole().setUpdateButtonEnabled(false);
    }

    public void runningMode() {
        Play.setEnabled(false);
        Stop.setEnabled(true);
        Pause.setEnabled(true);
        StepInto.setEnabled(false);
        StepOut.setEnabled(false);
        StepOver.setEnabled(false);
        SourceAsm.setEnabled(false);
        MainIDE.getInstance().getPaneOutputs().getRegistersConsole().setUpdateButtonEnabled(false);
        MainIDE.getInstance().getPaneOutputs().getMemoryExternalConsole().setUpdateButtonEnabled(false);
        MainIDE.getInstance().getPaneOutputs().getMemoryInternalConsole().setUpdateButtonEnabled(false);
    }
}
