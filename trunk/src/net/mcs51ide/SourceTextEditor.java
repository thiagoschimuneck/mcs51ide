package net.mcs51ide;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import static java.nio.file.StandardCopyOption.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.text.BadLocationException;
import net.mcs51ide.sdcc.CDBFileParser;
import net.mcs51ide.sdcc.Project;
import net.mcs51ide.sdcc.SDCCRunner;
import net.mcs51ide.sdcc.SourceFile;
import net.mcs51ide.utils.Utils;
import org.fife.ui.rsyntaxtextarea.RSyntaxTextArea;
import org.fife.ui.rsyntaxtextarea.SyntaxConstants;
import org.fife.ui.rtextarea.Gutter;
import org.fife.ui.rtextarea.GutterIconInfo;
import org.fife.ui.rtextarea.RTextScrollPane;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
public class SourceTextEditor extends RTextScrollPane {

    private RSyntaxTextArea myTextArea;
    private Gutter gutter;
    private File sourceFile;
    private Project project;
    private boolean isChanged;
    private boolean isChangedAfterCompilation;
    private JLabel tabLabel;
    private ImageIcon iconTrack;
    private ImageIcon iconTrackBP;
    private ImageIcon breakPointIcon;
    private List internalBreakPoints;
    private int currentRunLine;
    private SourceTextEditor linkedEd;

    public SourceTextEditor() {
        super(new RSyntaxTextArea(20, 10));
        this.setMinimumSize(new Dimension(200, 100));
        this.myTextArea = (RSyntaxTextArea) this.getTextArea();
        this.myTextArea.setSyntaxEditingStyle(SyntaxConstants.SYNTAX_STYLE_C);
        this.myTextArea.setCodeFoldingEnabled(true);
        this.myTextArea.setAntiAliasingEnabled(true);
        this.myTextArea.getDocument().addDocumentListener(new IDEDocumentListener(this));
        this.setLineNumbersEnabled(true);
        this.setFoldIndicatorEnabled(true);
        this.setIconRowHeaderEnabled(true);
        gutter = this.getGutter();
        this.breakPointIcon = new ImageIcon(getClass().getResource("/resources/breakpoint.png"));
        gutter.setBookmarkIcon(this.breakPointIcon);
        gutter.setBookmarkingEnabled(true);
        this.iconTrack = new ImageIcon(getClass().getResource("/resources/currentLine1.gif"));
        this.iconTrackBP = new ImageIcon(getClass().getResource("/resources/bpCurrLine.png"));
        this.project = null;
    }

    public File getSourceFile() {
        return sourceFile;
    }

    public void setSourceFile(File sourceFile) {
        this.sourceFile = sourceFile;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public boolean getIsChanged() {
        return this.isChanged;
    }

    public void setTabName(String nm) {
        if (this.getProject() != null) {
            this.tabLabel.setText("[" + nm + "]");
        } else {
            this.tabLabel.setText(nm);
        }
    }

    public void updateTabName() {
        String nm;
        if (this.isChanged) {
            nm = "*".concat(this.sourceFile.getName());
        } else {
            nm = this.sourceFile.getName();
        }

        if (this.getProject() != null) {
            this.tabLabel.setText("[" + nm + "]");
        } else {
            this.tabLabel.setText(nm);
        }
    }

    public void setIsChanged(boolean isChanged) {
        File sourceFileTmp = this.sourceFile;
        if (sourceFileTmp == null) {
            sourceFileTmp = new File("Sem Nome");
        }
        this.sourceFile = sourceFileTmp;
        this.isChanged = isChanged;
    }

    public boolean isIsChangedAfterCompilation() {
        return isChangedAfterCompilation;
    }

    public void setIsChangedAfterCompilation(boolean isChangedAfterCompilation) {
        this.isChangedAfterCompilation = isChangedAfterCompilation;
    }

    public JLabel getTabLabel() {
        return tabLabel;
    }

    public void setTabLabel(JLabel tabLabel) {
        this.tabLabel = tabLabel;
    }

    public void loadFromFile(String fileName) {
        try {
            this.sourceFile = new File(fileName);
            this.setTabName(this.sourceFile.getName());
            FileReader r = new FileReader(fileName);
            this.setSourceFile(new File(fileName));
            this.getTextArea().read(r, null);
            r.close();
            this.setIsChanged(false);
            this.setIsChangedAfterCompilation(false);
            this.getTextArea().setCaretPosition(0);
            this.updateTabName();
        } catch (IOException e) {
            Toolkit.getDefaultToolkit().beep();
            JOptionPane.showMessageDialog(this, "Não foi possível abrir o arquivo " + fileName);
        }
    }

    public void saveToFile(String fileName) {
        try {
            FileWriter w = new FileWriter(fileName);
            this.getTextArea().write(w);
            w.close();
            this.setIsChanged(false);
            this.setIsChangedAfterCompilation(false);
            this.updateTabName();
            //Save.setEnabled(false);
        } catch (IOException e) {
        }
    }

    public void saveToFile() {
        if (this.sourceFile != null) {
            this.saveToFile(this.sourceFile.getAbsolutePath());
        }
    }

    public boolean compile() {
        try {
            if (this.getSourceFile() != null) {
                SDCCRunner sRun = new SDCCRunner();
                CompilerOutput co = MainIDE.getInstance().getPaneOutputs().getCompilerOutput();
                co.clear();
                CDBFileParser cdb = new CDBFileParser();

                Project prj = this.getProject();
                if (prj != null) {
                    co.writeLn("Compilando projeto " + prj.getName());
                    sRun.setWorkDir(prj.getAbsPath());

                    boolean doBreakPoints = true;
                    for (int mkLoop = 0; doBreakPoints; mkLoop++) {
                        doBreakPoints = false;
                        for (int i = 0; i < prj.getSourceFiles().size(); i++) {
                            SourceFile src = (SourceFile) prj.getSourceFiles().get(i);
                            SourceTextEditor ed = MainIDE.getInstance().checkFileIsOpen(src.getFullFileName());

                            int brkCount = 0; // tera a quantidade de breakpoints
                            if (ed != null) {
                                // Buscar os breakpoints
                                GutterIconInfo[] gii = ed.getGutter().getBookmarks();
                                for (brkCount = 0; brkCount < gii.length; brkCount++) {
                                    if (mkLoop == 1) {
                                        GutterIconInfo gi = gii[brkCount];
                                        int lin = ed.getTextArea().getLineOfOffset(gi.getMarkedOffset()) + 1;
                                        Integer iAddr = cdb.getLineAddr(src.getFileName().toLowerCase(),lin);
                                        if (iAddr != null) {
                                            if (src.getType().equals("c")) {
                                                Utils.insertLine("__asm lcall 0x001B __endasm;", lin, src.getFullFileName());
                                            } else if (src.getType().equals("asm")) {
                                                Utils.insertLine("lcall 0x001B ", lin, src.getFullFileName());
                                            }
                                        }
                                    }
                                }
                            }

                            if (src.getType().equals("c")) {
                                String cmd;
                                int val;
                                Files.copy(Paths.get(src.getFullFileName()), Paths.get(src.getFullFileName()+"BKP"), REPLACE_EXISTING );
                                if (OSValidator.isWindows()) {
                                    cmd = "sdcc --noinduction --nooverlay --code-loc 0x2000 --debug -c \"" + src.getFullFileName() + "\"";
                                } else {
                                    cmd = "sdcc --noinduction --nooverlay --code-loc 0x2000 --debug -c " + src.getFullFileName();
                                }
                                co.writeLn(cmd);
                                val = sRun.executeCommand(cmd);
                                co.writeLn(sRun.stdOut);
                                co.writeLn(sRun.stdErr);
                                if (val != 0) {
                                    co.writeLn("ERRO!");
                                    return false;
                                }
                                //src = src.getAsmSourceFileName();
                            }

                            if (brkCount > 0) {
                                doBreakPoints = true;
                            }

                            if (src.getType().equals("asm")) {
                                int val;
                                String cmd;
                                if (OSValidator.isWindows()) {
                                    cmd = "asx8051  -l -s -o -c \"" + src.getFullFileName() + "\"";
                                } else {
                                    cmd = "asx8051  -l -s -o -c " + src.getFullFileName();
                                }
                                co.writeLn(cmd);
                                val = sRun.executeCommand(cmd);
                                co.writeLn(sRun.stdOut.trim());
                                co.writeLn(sRun.stdErr.trim());
                                if (val != 0) {
                                    co.writeLn("ERRO!");
                                    return false;
                                }
                            }
                            if (ed != null && mkLoop > 1) {
                                ed.saveToFile();
                            }
                        }
                        String cmd;
                        prj.createLinkFile();
                        //cmd = "aslink -n -f \"" + prj.getLinkFileName() + "\"";
                        cmd = "sdcc --code-loc 0x2000 --debug " + prj.getAllRelFiles();
                        //String cmd = "/usr/bin/sdcc --debug --code-loc 0x2000 --out-fmt-ihx pisca.rel other.rel";
                        co.writeLn(cmd);
                        int val = sRun.executeCommand(cmd);
                        co.writeLn(sRun.stdOut.trim());
                        co.writeLn(sRun.stdErr.trim());
                        if (val != 0) {
                            co.writeLn("ERRO!");
                            return false;
                        }
                        new File(Utils.putExtension(prj.getOutName(), "ihx")).renameTo(new File(prj.getFinalIHXName()));
                        new File(Utils.putExtension(prj.getOutName(), "cdb")).renameTo(new File(prj.getFinalCDBName()));
                        if (!cdb.parseFile(prj.getFinalCDBName())) {
                            co.writeLn("ERRO CDB!");
                            return false;
                        }
                        if (mkLoop > 1) { // forca parada apos insercao dos breakpoints.
                            doBreakPoints = false;
                        }
                    }
                    // AQUI eh para compilar um fonte sozinho
                } else {
                    SourceTextEditor ed = this;
                    SourceFile src = new SourceFile();
                    src.setFileName(ed.getSourceFile().getAbsolutePath());
                    src.setType(Utils.getExtension(src.getFileName().toLowerCase()));
                    int brkCount = 0; // tera a quantidade de breakpoints
                    // Buscar os breakpoints
                    GutterIconInfo[] gii = ed.getGutter().getBookmarks();
                    for (brkCount = 0; brkCount < gii.length; brkCount++) {
                        GutterIconInfo gi = gii[brkCount];
                        int lin = ed.getTextArea().getLineOfOffset(gi.getMarkedOffset()) + 1;
                        Integer iAddr = cdb.getLineAddr(src.getFileName().toLowerCase(),lin);
                        if (iAddr != null) {
                            if (src.getType().equals("c")) {
                                Utils.insertLine("__asm lcall 0x001B __endasm;", lin, src.getFullFileName());
                            } else if (src.getType().equals("asm")) {
                                Utils.insertLine("lcall 0x001B ", lin, src.getFullFileName());
                            }
                        }
                    }

                    if (net.mcs51ide.utils.Utils.getExtension(this.getSourceFile()).equals("c")) {

                        MainIDE.getInstance().getPaneOutputs().getCompilerOutput().writeLn("Compiling without project...");
                        File workDir = new File(this.sourceFile.getAbsoluteFile().getParent());
                        String cmdSDCC;
                        if (OSValidator.isWindows()) {
                            cmdSDCC = "sdcc --debug -mmcs51 --code-loc 0x2000 --out-fmt-ihx \"" + this.sourceFile.getPath() + "\"";
                        } else {
                            cmdSDCC = "sdcc --debug -mmcs51 --code-loc 0x2000 --out-fmt-ihx " + this.sourceFile.getPath();
                        }
                        MainIDE.getInstance().getPaneOutputs().getCompilerOutput().writeLn("Path: " + workDir.getAbsolutePath());
                        MainIDE.getInstance().getPaneOutputs().getCompilerOutput().writeLn(cmdSDCC);
                        sRun.setWorkDir(workDir.getAbsolutePath());

                        //Get and display the standard output and/or the
                        // error output produced by the child process.
                        //getChildOutput(proc);

                        int val = sRun.executeCommand(cmdSDCC);
                        co.writeLn(sRun.stdOut.trim());
                        co.writeLn(sRun.stdErr.trim());
                        if (val == 0) {
                            co.writeLn("Finished.");
                        } else {
                            co.writeLn("Error!");
                            return false;
                        }//end else
                    } else if (net.mcs51ide.utils.Utils.getExtension(this.getSourceFile()).equals("asm")
                            || net.mcs51ide.utils.Utils.getExtension(this.getSourceFile()).equals("a51")) {

                        co.writeLn("Compiling...");
                        File workDir = new File(this.sourceFile.getAbsoluteFile().getParent());
                        String cmdASX;
                        if (OSValidator.isWindows()) {
                            cmdASX = "asx8051 -x -l -o -s -c \"" + this.sourceFile.getPath() + "\"";
                        } else {
                            cmdASX = "asx8051 -x -l -o -s -c " + this.sourceFile.getPath();                            
                        }
                        //String cmdASX = "/usr/bin/as31 " + this.sourceFile.getPath();
                        co.writeLn("Path: " + workDir.getAbsolutePath());
                        co.writeLn(cmdASX);

                        sRun.setWorkDir(workDir.getAbsolutePath());
                        int val = sRun.executeCommand(cmdASX);
                        co.writeLn(sRun.stdOut.trim());
                        co.writeLn(sRun.stdErr.trim());
                        if (val != 0) {
                            co.writeLn("Error!");
                            return false;
                        }//end else
                        String fLnkName = Utils.removeExtension(this.sourceFile.getPath());
                        fLnkName = Utils.putExtension(fLnkName, "lnk");
                        String asmFName = Utils.removePath(this.sourceFile.getPath());
                        asmFName = Utils.removeExtension(asmFName);
                        asmFName = Utils.putExtension(asmFName, "rel");
                        Project.createAsmLinkFile(fLnkName, asmFName);
                        String cmdLnk;
                        if (OSValidator.isWindows()) {                        
                            cmdLnk = "aslink -n -f \"" + fLnkName + "\"";
                        } else {                            
                            cmdLnk = "aslink -n -f " + fLnkName;
                        }
                        val = sRun.executeCommand(cmdLnk);
                        if (val == 0) {
                            co.writeLn("Concluído!");
                        } else {
                            co.writeLn("Erro na linkagem!");
                            return false;
                        }//end else                        
                    }
                    String fName = Utils.removeExtension(src.getFileName());
                    fName = Utils.putExtension(fName, "cdb");
                    fName = this.sourceFile.getParent().concat(File.separator).concat(fName);
                    if (!cdb.parseFile(fName)) {
                        co.writeLn("ERRO CDB!");
                        return false;
                    }

                    ed.saveToFile();
                }
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }//end catch       
        return false;
    }

    public boolean executeOnTarget() {
        if (MainIDE.getInstance().getCMon51().isRunning()) {
            if (MainIDE.getInstance().getCMon51().resume()) {
                MainIDE.getInstance().disableAllFilesToRun(false);
                MainIDE.getInstance().disableAllFilesToRun(true);
                return true;
            } else {
                return false;
            }
        } else {
            if (!MainIDE.getInstance().initCMon51()) {
                return false;
            }
            MainIDE.getInstance().saveChangedFiles();
            if (!this.compile()) {
                return false;
            }
            MainIDE.getInstance().setRunnedEd(this);
            String fileName = this.sourceFile.getPath();
            File hexFile;
            CDBFileParser cdb = new CDBFileParser();
            if (this.getProject() != null) {
                hexFile = new File(this.getProject().getFinalIHXName());
                if (!cdb.parseFile(this.getProject().getFinalCDBName())) {
                    return false;
                }
            } else {
                hexFile = new File(Utils.removeExtension(fileName) + ".ihx");
                if (!hexFile.exists()) {
                    hexFile = new File(Utils.removeExtension(fileName) + ".IHX");
                }
                if (!hexFile.exists()) {
                    hexFile = new File(Utils.removeExtension(fileName) + ".hex");
                }
                if (!hexFile.exists()) {
                    hexFile = new File(Utils.removeExtension(fileName) + ".HEX");
                }
                if (!cdb.parseFile(Utils.removeExtension(fileName) + ".cdb")) {
                    return false;
                }
            }
            FileReader fr = null;
            try {
                fr = new FileReader(hexFile);
            } catch (FileNotFoundException ex) {
                return false;
            }
            if (!MainIDE.getInstance().getCMon51().targetReset()) {
                JOptionPane.showMessageDialog(MainIDE.getInstance(), "Erro de comunicação com o hardware!");
                return false;
            }
            if (MainIDE.getInstance().getCMon51().loadHex(hexFile.getAbsolutePath()) < 0) {
                JOptionPane.showMessageDialog(MainIDE.getInstance(), "Erro ao carregar imagem para o hardware!");
                return false;
            }
            AssemblyConsole as = MainIDE.getInstance().getPaneOutputs().getAssemblyConsole();
            RegistersConsole rg = MainIDE.getInstance().getPaneOutputs().getRegistersConsole();
            //as.setInstructions(MainIDE.getInstance().getCMon51().getInstructions(),
            //        MainIDE.getInstance().getCMon51().getAddressLines());
            MainIDE.getInstance().getCMon51().setCdb(cdb);
            MainIDE.getInstance().getCMon51().runCode();
            MainIDE.getInstance().disableAllFilesToRun(true);
        }
        return true;
    }

    public List getBreakPointLines() {
        List bps = new ArrayList();
        int brkCount = 0;
        GutterIconInfo[] gii = this.getGutter().getBookmarks();
        for (brkCount = 0; brkCount < gii.length; brkCount++) {
            GutterIconInfo gi = gii[brkCount];
            int lin;
            try {
                bps.add(this.getTextArea().getLineOfOffset(gi.getMarkedOffset()) + 1);
            } catch (BadLocationException ex) {
                return null;
            }
        }
        return bps;
    }

    public boolean defTrackLine(int ln) {
        List bps = this.internalBreakPoints;
        try {
            if (bps != null) {
                this.getGutter().removeAllTrackingIcons();
                for (int i = 0; i < bps.size(); i++) {
                    int bLn = ((Integer) bps.get(i)).intValue() - 1;
                    if (bLn == ln) {
                        this.getGutter().addLineTrackingIcon(ln, iconTrackBP);
                        this.setCurrentRunLine(ln);
                        ln = -1;
                    } else {
                        this.getGutter().addLineTrackingIcon(bLn, this.breakPointIcon);
                    }
                }
            }
            if (ln > -1) {
                this.getGutter().addLineTrackingIcon(ln, iconTrack);
                this.setCurrentRunLine(ln);
            }
        } catch (BadLocationException ex) {
            return false;
        }
        return false;
    }

    public void lockBreakPoints() {
        List bps;
        if (this.internalBreakPoints != null) {
            bps = this.internalBreakPoints;
        } else {
            bps = this.getBreakPointLines();
        }
        this.getGutter().setBookmarkingEnabled(false);
        for (int i = 0; i < bps.size(); i++) {
            int ln = ((Integer) bps.get(i)).intValue() - 1;
            try {
                this.getGutter().addLineTrackingIcon(ln, this.breakPointIcon);
            } catch (BadLocationException ex) {
                Logger.getLogger(SourceTextEditor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.internalBreakPoints = bps;
    }

    public void unlockBreakPoints() {
        List bps = this.internalBreakPoints;
        this.getGutter().removeAllTrackingIcons();
        this.getGutter().setBookmarkingEnabled(true);
        if (bps != null) {
            for (int i = 0; i < bps.size(); i++) {
                int ln = ((Integer) bps.get(i)).intValue() - 1;
                try {
                    this.getGutter().toggleBookmark(ln);
                } catch (BadLocationException ex) {
                    Logger.getLogger(SourceTextEditor.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        if (this.getLinkedEd() != null) {
            this.getLinkedEd().getGutter().removeAllTrackingIcons();
        }
        this.internalBreakPoints = null;
    }

    /**
     * @return the currentRunLine
     */
    public int getCurrentRunLine() {
        return currentRunLine;
    }

    /**
     * @param currentRunLine the currentRunLine to set
     */
    public void setCurrentRunLine(int currentRunLine) {
        this.currentRunLine = currentRunLine;
    }

    /**
     * @return the linkedEd
     */
    public SourceTextEditor getLinkedEd() {
        return linkedEd;
    }

    /**
     * @param linkedEd the linkedEd to set
     */
    public void setLinkedEd(SourceTextEditor linkedEd) {
        this.linkedEd = linkedEd;
    }
}
