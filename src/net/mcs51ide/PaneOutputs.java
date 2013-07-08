package net.mcs51ide;


import java.awt.Dimension;
import java.awt.event.KeyEvent;
import javax.swing.JTabbedPane;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author thiago
 */
public class PaneOutputs extends JTabbedPane {
    private ConsoleOutput output;
    private CompilerOutput compiler;
    private RegistersConsole registers;
    private MDataConsole mData;
    private AssemblyConsole assembly;
    private MemoryConsole memoryExt,memoryInt;
    
    public PaneOutputs() {
        super();
        // Console output
        compiler = new CompilerOutput();
        this.addTab("Compiler output", null, compiler, "Console output -");
        //setMnemonicAt(0, KeyEvent.VK_1);
        output = new ConsoleOutput();
        //this.addTab("Console output", null, output, "Console output -");
        //setMnemonicAt(0, KeyEvent.VK_2);
        registers = new RegistersConsole();
        //this.addTab("Registers", null, registers, "Registers -");
        //setMnemonicAt(0, KeyEvent.VK_2);
        mData = new MDataConsole();
        //this.addTab("Data", null, mData, "Data");
        //setMnemonicAt(0, KeyEvent.VK_2);
        assembly = new AssemblyConsole();
        //this.addTab("Assembly", null, assembly, "Assembly");
        //setMnemonicAt(0, KeyEvent.VK_2);
        memoryExt = new MemoryConsole(true);
        //this.addTab("Memory", null, memoryExt, "Memória Externa");
        //setMnemonicAt(0, KeyEvent.VK_2);
        memoryInt = new MemoryConsole(false);
        //this.addTab("Memory", null, memoryInt, "Memória Interna");
        //setMnemonicAt(0, KeyEvent.VK_2);
        
        this.setMinimumSize(new Dimension(0,10));
        this.setSize(0,100);
    }
    
    public ConsoleOutput getConsoleOutput() {
        return output;
    }
    
    public CompilerOutput getCompilerOutput() {
        return compiler;
    }
    
    public RegistersConsole getRegistersConsole() {
        return this.registers;
    }

    public AssemblyConsole getAssemblyConsole() {
        return this.assembly;
    }
    
    public MDataConsole getMDataConsole() {
        return this.mData;
    }
    
    public MemoryConsole getMemoryExternalConsole() {
        return this.memoryExt;
    }
    
    public MemoryConsole getMemoryInternalConsole() {
        return this.memoryInt;
    }

}
