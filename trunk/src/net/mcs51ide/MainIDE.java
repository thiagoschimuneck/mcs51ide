package net.mcs51ide;

/**
 *
 * @author thiago
 */
import java.awt.*;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import javax.swing.*;
import javax.swing.text.BadLocationException;
import net.mcs51ide.cmon51.CMON51CallBack;
import net.mcs51ide.cmon51.CMON51Interface;
import net.mcs51ide.sdcc.CDBFileParser;
import net.mcs51ide.sdcc.Project;
import net.mcs51ide.sdcc.SDCCRunner;
import net.mcs51ide.sdcc.SourceFile;
import net.mcs51ide.sdcc.VariableInfo;
import net.mcs51ide.utils.AsmFileFilter;
import net.mcs51ide.utils.CFileFilter;
import net.mcs51ide.utils.ProjectFileFilter;
import net.mcs51ide.utils.Utils;
import org.fife.ui.rsyntaxtextarea.*;
import org.fife.ui.rtextarea.*;

public class MainIDE extends JFrame implements CMON51CallBack {

    private static MainIDE myInstance;
    private static final long serialVersionUID = 1L;
    private JFileChooser dialog = new JFileChooser(System.getProperty("user.dir"));
    private String currentFile = "Sem nome";
    private boolean changed = false;
    private final RSyntaxTextArea textArea;
    private final SourceTextEditor textPane;
    private Gutter gutter;
    private IDEMenuBar menuBar;
    private MainToolBar mainToolBar;
    private final JSplitPane splitPaneA;
    private final JSplitPane splitPaneB;
    private final JSplitPane splitPaneC;
    private PaneOutputs paneOutputs;
    private JTabbedPane tabEditors;
    private CMON51Interface cMon51;
    private String serialPort;
    private ProjectFilesList projectFilesList;
    private Project mainProject;
    private SourceTextEditor runnedEd, backEd;

    public MainIDE() {
        this.cMon51 = new CMON51Interface();
        this.mainProject = new Project();
        HashMap m = this.cMon51.getAvaliablePorts();
        if (m.size() > 0) {
            Set s = m.keySet();
            Iterator i = s.iterator();
            if (i.hasNext()) {
                serialPort = i.next().toString();
            }
        }

        setTitle("MCS51 IDE");

        JPanel cp = new JPanel(new BorderLayout());
        setJMenuBar(this.menuBar = new IDEMenuBar());

        this.mainToolBar = new MainToolBar();
        add(this.mainToolBar, BorderLayout.NORTH);

        this.tabEditors = new TabbedPaneClosable();

        this.projectFilesList = new ProjectFilesList();
        this.textPane = new SourceTextEditor();
        this.textArea = (RSyntaxTextArea) this.textPane.getTextArea();
        this.paneOutputs = new PaneOutputs();

        JTabbedPane tbpRight = new JTabbedPane();
        tbpRight.add("Variáveis", this.paneOutputs.getRegistersConsole());
        tbpRight.add("Mem. Interna", this.paneOutputs.getMemoryInternalConsole());
        tbpRight.add("Mem. Externa", this.paneOutputs.getMemoryExternalConsole());

        splitPaneA = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT,
                projectFilesList, this.tabEditors);
        projectFilesList.setMinimumSize(new Dimension(80, 60));

        splitPaneB = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT,
                splitPaneA, tbpRight);

        splitPaneC = new JSplitPane(JSplitPane.VERTICAL_SPLIT,
                splitPaneB, this.paneOutputs);

        add(splitPaneC, BorderLayout.CENTER);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        pack();
        setLocationRelativeTo(null);
        this.cMon51.setCallBack(this);
        this.runnedEd = null;
        this.backEd = null;
        MainIDE.myInstance = this;
        //this.loadProject("/home/thiago/8051/Projeto/Projeto.51project");
        //this.loadTabFromFile("/home/thiago/8051/Projeto/TestAsm.asm");
    }

    public JFileChooser getDialog() {
        return this.dialog;
    }

    public static MainIDE getInstance() {
        return MainIDE.myInstance;
    }

    public PaneOutputs getPaneOutputs() {
        return this.paneOutputs;
    }

    public SourceTextEditor getCurrentSourceTextEditor() {
        if (this.tabEditors.getSelectedIndex() > -1) {
            return (SourceTextEditor) this.tabEditors.getSelectedComponent();
        }
        return null;
    }

    public void setCurrentSourceTextEditor(SourceTextEditor ed) {
        this.tabEditors.setSelectedComponent(ed);
    }

    public void saveOld() {
        if (changed) {
            if (JOptionPane.showConfirmDialog(this, "Would you like to save " + currentFile + " ?", "Save", JOptionPane.YES_NO_OPTION) == JOptionPane.YES_OPTION) {
                //saveFile(currentFile);
            }
        }
    }

    public SourceTextEditor loadTabFromFile(String fileName) {
        SourceTextEditor ed;
        ed = this.checkFileIsOpen(fileName);
        if (ed == null) {
            ed = new SourceTextEditor();
            this.tabEditors.add("Sem nome", ed);
            this.tabEditors.setSelectedComponent(ed);
            ed.loadFromFile(fileName);
        }
        return ed;
    }

    public final SourceTextEditor newTabFile() {
        SourceTextEditor ed = new SourceTextEditor();
        this.tabEditors.add("Sem Nome", ed);
        this.tabEditors.setSelectedComponent(ed);
        ed.setSourceFile(new File("Sem Nome"));
        return ed;
    }

    public static void main(String[] args) {
        if (!SDCCRunner.detectSdcc()) {
            JOptionPane.showMessageDialog(null, "Erro localizando o SDCC! Verifique saida do console para maiores informações!", "MCS51", JOptionPane.ERROR_MESSAGE);
            return;
        }
        if (SDCCRunner.getVersion() > 2) {
            JOptionPane.showMessageDialog(null, "Necessário SDCC versão 2.9.0 exclusivamente!", "MCS51", JOptionPane.ERROR_MESSAGE);
            return;
        }
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                MainIDE m = new MainIDE();
                m.setVisible(true);
                m.setExtendedState(MainIDE.MAXIMIZED_BOTH);
                m.pack();
                m.splitPaneA.setDividerLocation(0.4);
                m.splitPaneB.setDividerLocation(0.99);
                m.splitPaneC.setDividerLocation(0.99);

            }
        });
    }

    public CMON51Interface getCMon51() {
        return cMon51;
    }

    public boolean initCMon51() {
        return this.cMon51.openPort(this.serialPort);
    }

    public String getSerialPort() {
        return this.serialPort;
    }

    public void setSerialPort(String s) {
        this.serialPort = s;
    }

    public boolean loadFileDialog() {
        JFileChooser dialog2 = MainIDE.getInstance().getDialog();
        dialog2.setAcceptAllFileFilterUsed(false);
        dialog2.resetChoosableFileFilters();
        dialog2.addChoosableFileFilter(new CFileFilter());
        dialog2.addChoosableFileFilter(new AsmFileFilter());
        dialog2.addChoosableFileFilter(dialog2.getAcceptAllFileFilter());
        if (dialog2.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) {
            MainIDE.getInstance().loadTabFromFile(dialog2.getSelectedFile().getAbsolutePath());
            return true;
        }
        return false;
    }

    public boolean loadProjectDialog() {
        JFileChooser dialog2 = MainIDE.getInstance().getDialog();
        dialog2.setAcceptAllFileFilterUsed(false);
        dialog2.resetChoosableFileFilters();
        dialog2.addChoosableFileFilter(new ProjectFileFilter());
        dialog2.addChoosableFileFilter(dialog2.getAcceptAllFileFilter());
        if (dialog2.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) {
            this.loadProject(dialog2.getSelectedFile().getAbsolutePath());
            return true;
        }
        return false;
    }

    public void loadProject(String fileName) {
        Project prj = new Project();
        prj.loadFromFile(fileName);
        MainIDE.getInstance().setProject(prj);
        this.updateProjectList();
    }

    public void saveAsCurrentEd() {
        boolean saved = MainIDE.getInstance().saveAsFileDialog(MainIDE.getInstance().getCurrentSourceTextEditor());
    }

    public boolean saveAsProjectDialog() {
        Project prj = MainIDE.getInstance().getProject();
        JFileChooser dialog2 = MainIDE.getInstance().getDialog();
        dialog2.setAcceptAllFileFilterUsed(false);
        dialog2.resetChoosableFileFilters();
        dialog2.addChoosableFileFilter(new ProjectFileFilter());
        dialog2.addChoosableFileFilter(dialog2.getAcceptAllFileFilter());
        dialog2.setSelectedFile(prj.getProjectFile());
        if (dialog2.showSaveDialog(this) == JFileChooser.APPROVE_OPTION) {
            File f = dialog2.getSelectedFile();
            if (Utils.getExtension(f).equals("")) {
                f = new File(Utils.putExtension(f.getAbsolutePath(), "51project"));
            }
            prj.setName(Utils.removeExtension(Utils.removePath(f.getAbsolutePath())));
            prj.setAbsPath(Utils.getPath(f.getParent()));
            prj.writeToFile(dialog2.getSelectedFile().getAbsolutePath());
            return true;
        }
        return false;
    }

    public boolean saveCurrentProject() {
        Project prj = MainIDE.getInstance().getProject();
        if (!prj.getProjectFile().getName().equals("Sem Nome")) {
            prj.writeToFile(prj.getProjectFile().getAbsolutePath());
            return true;
        } else {
            return this.saveAsProjectDialog();
        }
    }

    public void updateProjectList() {
        ArrayList sourceFiles = (ArrayList) this.mainProject.getSourceFiles();
        this.projectFilesList.clear();
        for (int i = 0; i < sourceFiles.size(); i++) {
            SourceFile src = (SourceFile) sourceFiles.get(i);
            this.projectFilesList.addFile(src.getFileName());
        }
    }

    public boolean saveAsFileDialog(SourceTextEditor ed) {
        JFileChooser dialog2 = MainIDE.getInstance().getDialog();
        dialog2.setAcceptAllFileFilterUsed(false);
        dialog2.resetChoosableFileFilters();
        dialog2.addChoosableFileFilter(new CFileFilter());
        dialog2.addChoosableFileFilter(new AsmFileFilter());
        dialog2.addChoosableFileFilter(dialog2.getAcceptAllFileFilter());
        dialog2.setSelectedFile(ed.getSourceFile() == null ? new File("Sem nome") : ed.getSourceFile());
        if (dialog2.showSaveDialog(this) == JFileChooser.APPROVE_OPTION) {
            ed.setSourceFile(dialog2.getSelectedFile());
            ed.saveToFile();
            ed.loadFromFile(ed.getSourceFile().getAbsolutePath());
            return true;
        }
        return false;
    }

    public void saveCurrentEd() {
        SourceTextEditor ed;
        ed = MainIDE.getInstance().getCurrentSourceTextEditor();
        if (ed.getSourceFile() == null) {
            this.saveAsFileDialog(ed);
        } else {
            ed.saveToFile();
        }
    }

    public boolean checkFilesChanged() {
        for (int i = 0; i < this.tabEditors.getTabCount(); i++) {
            SourceTextEditor ed = (SourceTextEditor) this.tabEditors.getComponentAt(i);
            if (ed.getIsChanged()) {
                int op = JOptionPane.showConfirmDialog(MainIDE.getInstance(),
                        "Deseja salvar o arquivo " + ed.getSourceFile().getName() + " ?",
                        "Arquivo alterado", JOptionPane.YES_NO_CANCEL_OPTION,
                        JOptionPane.WARNING_MESSAGE);
                if (op == JOptionPane.YES_OPTION) {
                    ed.saveToFile();
                } else if (op == JOptionPane.CANCEL_OPTION) {
                    return false;
                }
            }
        }
        return true;
    }

    public boolean saveChangedFiles() {
        boolean isC = false;
        for (int i = 0; i < this.tabEditors.getTabCount(); i++) {
            SourceTextEditor ed = (SourceTextEditor) this.tabEditors.getComponentAt(i);
            if (ed.getIsChanged()) {
                ed.saveToFile();
                isC = true;
            }
        }
        return isC;
    }

    public SourceTextEditor checkFileIsOpen(String fileName) {
        for (int i = 0; i < this.tabEditors.getTabCount(); i++) {
            SourceTextEditor ed = (SourceTextEditor) this.tabEditors.getComponentAt(i);
            File f1;
            File f2;
            if (Utils.getExtension(fileName).equals("asm")) {
                f1 = new File(fileName.toLowerCase());
                f2 = new File(ed.getSourceFile().getAbsolutePath().toLowerCase());
            } else {
                f1 = new File(fileName);
                f2 = ed.getSourceFile();
            }
            if (f1.equals(f2)) {
                return ed;
            }
        }
        return null;
    }

    public Project getProject() {
        return this.mainProject;
    }

    public Project setProject(Project prj) {
        return (this.mainProject = prj);
    }

    public void addCurrentFileProject() {
        SourceTextEditor ed = this.getCurrentSourceTextEditor();
        if (ed != null) {
            SourceFile src = new SourceFile();
            src.setFileName(ed.getSourceFile().getAbsolutePath());
            if (this.mainProject.getAbsPath().equals("")) {
                this.mainProject.setAbsPath(Utils.getPath(ed.getSourceFile().getAbsolutePath()));
            } else {
                String p1 = Utils.getPath(ed.getSourceFile().getAbsolutePath());
                String p2 = this.mainProject.getAbsPath();
                if (!p1.equals(p2)) {
                    JOptionPane.showMessageDialog(this, "Arquivo fonte precisa estar no caminho " + p2, "Erro", JOptionPane.ERROR_MESSAGE);
                    return;
                }
            }
            if (!src.detectType()) {
                JOptionPane.showMessageDialog(this, "Arquivo inválido!", "Erro", JOptionPane.ERROR_MESSAGE);
            } else {
                src.setType(Utils.getExtension(src.getFileName()).toLowerCase());
                if (!this.mainProject.addSourceFile(src)) {
                    JOptionPane.showMessageDialog(this, "Já existe um arquivo de mesmo nome no projeto!", "Erro", JOptionPane.ERROR_MESSAGE);
                } else {
                    src.setProject(this.mainProject);
                }
            }
            this.updateProjectList();
        }
    }

    @Override
    public void pauseRun() {
        this.pauseTarget(2); // parada por breakpoint
    }

    /**
     * @return the mainToolBar
     */
    public MainToolBar getMainToolBar() {
        return mainToolBar;
    }

    /**
     * @param mainToolBar the mainToolBar to set
     */
    public void setMainToolBar(MainToolBar mainToolBar) {
        this.mainToolBar = mainToolBar;
    }

    public void disableAllFilesToRun(boolean disabled) {
        Project prj = MainIDE.getInstance().getCurrentSourceTextEditor().getProject();
        if (prj != null) {
            for (int i = 0; i < prj.getSourceFiles().size(); i++) {
                SourceFile src = (SourceFile) prj.getSourceFiles().get(i);
                SourceTextEditor ed;
                ed = MainIDE.getInstance().checkFileIsOpen(src.getFullFileName());
                if (ed != null) {
                    ed.getTextArea().setEditable(!disabled);
                    if (disabled) {
                        ed.lockBreakPoints();
                    } else {
                        ed.unlockBreakPoints();
                    }
                }
            }
        } else {
            SourceTextEditor edi = MainIDE.getInstance().getCurrentSourceTextEditor();
            if (edi != null) {
                edi.getTextArea().setEditable(!disabled);
                if (disabled) {
                    edi.lockBreakPoints();
                } else {
                    edi.unlockBreakPoints();
                }
            }
        }
    }

    void pauseTarget(int pauseSource) {
        CMON51Interface cMon = MainIDE.getInstance().getCMon51();
        cMon.pause();
        cMon.setPauseSource(pauseSource);
        RegistersConsole regsCons = MainIDE.getInstance().getPaneOutputs().getRegistersConsole();
        MemoryConsole internalMem = MainIDE.getInstance().getPaneOutputs().getMemoryInternalConsole();
        MemoryConsole externalMem = MainIDE.getInstance().getPaneOutputs().getMemoryExternalConsole();
        CDBFileParser cdb = MainIDE.getInstance().getCMon51().getCdb();
        Integer pc = MainIDE.getInstance().getCMon51().getPC();
        if (cMon.getPauseSource() == 2) {
            pc = new Integer(pc.intValue() - 3);
        }
        String fName = cdb.getFileAddr(pc.intValue());

        SourceTextEditor edView;
        SourceTextEditor ed = MainIDE.getInstance().getRunnedEd();
        int lineAddr = cdb.getAddrLine(fName, pc.intValue());
        cMon.setAsmPausedPositionFile(fName);
        cMon.setAsmPausedPositionLine(lineAddr);
        if (Utils.getExtension(fName).equals("asm")) {
            String cFile = Utils.putExtension(Utils.removeExtension(fName), "c");
            if (cdb.haveThisSource(cFile)) {
                fName = cFile;
            }
            lineAddr = cdb.getCLineAprox(fName, pc.intValue());
        } else {
            String asmFile = Utils.removeExtension(fName);
            asmFile = Utils.putExtension(asmFile, "asm");
            cMon.setAsmPausedPositionFile(fName);
            cMon.setAsmPausedPositionLine(cdb.getAddrLine(asmFile, pc.intValue()));
        }
        if (pauseSource == 2) { // se for breakpoint, a posicao em asm deve ignorar o breakpoint
            cMon.setAsmPausedPositionLine(cMon.getAsmPausedPositionLine() + 1);
        }

        Project prj = ed.getProject();
        if (prj != null) {
            String nfName = prj.getAbsPath().concat(File.separator).concat(fName);
            edView = MainIDE.getInstance().checkFileIsOpen(nfName);
            if (edView == null) {
                nfName = prj.getRealAbsName(fName);
                edView = MainIDE.getInstance().loadTabFromFile(nfName);
                edView.getTextArea().setEditable(false);
            }
        } else {
            edView = ed;
        }
        if (this.backEd != null) {
            this.backEd.defTrackLine(-1);
        }
        if (edView.getLinkedEd() != null) {
            SourceTextEditor nEd = edView.getLinkedEd();
            if (cMon.getAsmPausedPositionLine() > -1) {
                nEd.defTrackLine(cMon.getAsmPausedPositionLine() - 1);
                try {
                    nEd.getTextArea().setCaretPosition(nEd.getTextArea().getLineEndOffset(cMon.getAsmPausedPositionLine() - 1));
                } catch (BadLocationException ex) {
                }
            }
        }
        this.backEd = edView;
        if (lineAddr > -1 && edView != null) {
            edView.defTrackLine(lineAddr - 1);
            try {
                edView.getTextArea().setCaretPosition(edView.getTextArea().getLineEndOffset(lineAddr - 1) - 1);
            } catch (BadLocationException ex) {
            }
        }
        this.setCurrentSourceTextEditor(edView);

        ArrayList names = regsCons.getVarsVisible();
        ArrayList vars = cMon.getDebugVarsCdb(names);
        for (int i = 0; i < vars.size(); i++) {
            VariableInfo v = (VariableInfo) vars.get(i);
            v.setValue(cMon.getSymbolValue(v));
        }
        regsCons.setVarsValue(vars);
        String[] iMem = null;
        iMem = cMon.readBlockDData();
        internalMem.setInternalMemoryValues(iMem);
        if (externalMem.getUserAddr() > -1) {
            iMem = cMon.readBlockXData(externalMem.getUserAddr());
            externalMem.setExternalMemoryValues(externalMem.getUserAddr(), iMem);
        }
        this.mainToolBar.pausedMode();
        MainIDE.getInstance().disableAllFilesToRun(true);
    }

    void stopTarget() {
        MainIDE.getInstance().getCMon51().targetReset();
        MainIDE.getInstance().getPaneOutputs().getAssemblyConsole().clearStep();
        RegistersConsole r = MainIDE.getInstance().getPaneOutputs().getRegistersConsole();
        //r.updateRegisters(MainIDE.getInstance().getCMon51().getRegisters());
        String pc = Integer.toHexString(MainIDE.getInstance().getCMon51().getPC());
        //AssemblyConsole as = MainIDE.getInstance().getPaneOutputs().getAssemblyConsole();
        //as.setStepLine(pc);
        //MainIDE.getInstance().getPaneOutputs().getMDataConsole().setData(MainIDE.getInstance().getCMon51().dataMem);
        this.disableAllFilesToRun(false);
        MainIDE.getInstance().setRunnedEd(null);
    }

    void stepIntoTarget() {
        if (this.backEd != null) {
            CMON51Interface cMon = MainIDE.getInstance().getCMon51();
            CDBFileParser cdb = cMon.getCdb();
            SourceTextEditor edView = this.getCurrentSourceTextEditor();
            String ext = Utils.getExtension(edView.getSourceFile());
            String fName = Utils.removePath(edView.getSourceFile().getAbsolutePath()).toLowerCase();
            if (ext.toLowerCase().equals("c")) {
                int currLine = this.backEd.getCurrentRunLine();
                while (true) {
                    cMon.doStep();
                    Integer pc = cMon.getPC();
                    fName = cdb.getFileAddr(pc.intValue());
                    //int nLine = cdb.getAddrLine(fName, pc.intValue());
                    int nLine = cdb.getCLineAprox(fName, pc.intValue());
                    if (nLine != currLine) {
                        edView.defTrackLine(nLine - 1);
                        try {
                            edView.getTextArea().setCaretPosition(edView.getTextArea().getLineEndOffset(nLine - 1) - 1);
                        } catch (BadLocationException ex) {
                        }
                        break;
                    }
                }
            } else {
                if (MainIDE.getInstance().getCMon51().isRunning()) {
                    MainIDE.getInstance().disableAllFilesToRun(false);
                    if (MainIDE.getInstance().getCMon51().doStep()) {
                    }
                    MainIDE.getInstance().disableAllFilesToRun(true);
                }

            }
        }
        //MainIDE.getInstance().getCMon51().resume();
        //RegistersConsole r = MainIDE.getInstance().getPaneOutputs().getRegistersConsole();
        //r.updateRegisters(MainIDE.getInstance().getCMon51().getRegisters());
        //String pc = Integer.toHexString(MainIDE.getInstance().getCMon51().getPC());
        //AssemblyConsole as = MainIDE.getInstance().getPaneOutputs().getAssemblyConsole();
        //as.setStepLine(pc);
    }

    /**
     * @return the runnedEd
     */
    public SourceTextEditor getRunnedEd() {
        return runnedEd;
    }

    /**
     * @param runnedEd the runnedEd to set
     */
    public void setRunnedEd(SourceTextEditor runnedEd) {
        this.runnedEd = runnedEd;
    }

    void showAsmSource() {
        SourceTextEditor ed = this.getCurrentSourceTextEditor();
        CMON51Interface cMon = this.getCMon51();
        String ext = Utils.getExtension(ed.getSourceFile());
        if (ext.toLowerCase().equals("c")) {
            String asmFile = ed.getSourceFile().getAbsolutePath();
            asmFile = Utils.removeExtension(asmFile);
            asmFile = Utils.putExtension(asmFile, "asm");
            SourceTextEditor nEd = this.loadTabFromFile(asmFile);
            nEd.getTextArea().setEditable(false);
            if (cMon.getAsmPausedPositionLine() > -1) {
                nEd.defTrackLine(cMon.getAsmPausedPositionLine() - 1);
                try {
                    nEd.getTextArea().setCaretPosition(nEd.getTextArea().getLineEndOffset(cMon.getAsmPausedPositionLine() - 1));
                } catch (BadLocationException ex) {
                }
                ed.setLinkedEd(nEd);
                nEd.getGutter().setBookmarkingEnabled(false);
                this.setCurrentSourceTextEditor(nEd);
            }
        }
    }
}
