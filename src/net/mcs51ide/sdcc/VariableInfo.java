/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.sdcc;

/**
 *
 * @author thiago
 */
public class VariableInfo {
    
    private String scope; // G=global F=arquivo L=funcao
    private String scopeName; // pode ser funcao ou nome de arquivo
    private String name;
    private int level;
    private int block;
    private int varSize;
    private String varType;
    private char varSign;
    private String space; // qual memoria CeD=Code, E=128low, F=External G=Internal H=bit I=SRF J=sbit R=register
    private String reg; // se usa um registrador para alocacao
    private int addr;
    private String value;

    /**
     * @return the scope
     */
    public String getScope() {
        return scope;
    }

    /**
     * @param scope the scope to set
     */
    public void setScope(String scope) {
        this.scope = scope;
    }

    /**
     * @return the scopeName
     */
    public String getScopeName() {
        return scopeName;
    }

    /**
     * @param scopeName the scopeName to set
     */
    public void setScopeName(String scopeName) {
        this.scopeName = scopeName;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the level
     */
    public int getLevel() {
        return level;
    }

    /**
     * @param level the level to set
     */
    public void setLevel(int level) {
        this.level = level;
    }

    /**
     * @return the block
     */
    public int getBlock() {
        return block;
    }

    /**
     * @param block the block to set
     */
    public void setBlock(int block) {
        this.block = block;
    }

    /**
     * @return the varType
     */
    public String getVarType() {
        return varType;
    }

    /**
     * @param varType the varType to set
     */
    public void setVarType(String varType) {
        this.varType = varType;
    }

    /**
     * @return the space
     */
    public String getSpace() {
        return space;
    }

    /**
     * @param space the space to set
     */
    public void setSpace(String space) {
        this.space = space;
    }

    /**
     * @return the reg
     */
    public String getReg() {
        return reg;
    }

    /**
     * @param reg the reg to set
     */
    public void setReg(String reg) {
        this.reg = reg;
    }

    /**
     * @return the varSign
     */
    public char getVarSign() {
        return varSign;
    }

    /**
     * @param varSign the varSign to set
     */
    public void setVarSign(char varSign) {
        this.varSign = varSign;
    }

    /**
     * @return the varSize
     */
    public int getVarSize() {
        return varSize;
    }

    /**
     * @param varSize the varSize to set
     */
    public void setVarSize(int varSize) {
        this.varSize = varSize;
    }

    /**
     * @return the addr
     */
    public int getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(int addr) {
        this.addr = addr;
    }

    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }
    
    public int[] getArrayIntValue() {
        int r[] = new int[this.getVarSize()];
        int v = Integer.parseInt(this.getValue(), 16);
        for(int i=0;i<this.getVarSize();i++) {
            r[i] = v % 256;
            v /= 256;
        }
        return r;
        
    }
    
}
