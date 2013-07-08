/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.sdcc;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import net.mcs51ide.utils.Utils;

/**
 *
 * @author thiago
 */
public class CDBFileParser {

    private HashMap fileLineAddr;
    private HashMap fileCAddr;
    private HashMap fileAAddr;
    private boolean CSource;
    private ArrayList vars;

    public CDBFileParser() {
        this.fileLineAddr = new HashMap();
        this.fileCAddr = new HashMap();
        this.fileAAddr = new HashMap();
        this.vars = new ArrayList();
        this.CSource = false;
    }

    public boolean parseFile(String fileName) {
        String record;
        this.CSource = false;
        FileReader fr;
        BufferedReader br;
        try {
            fr = new FileReader(fileName);
            br = new BufferedReader(fr);
            while ((record = br.readLine()) != null) {
                char typeRecord, subType;

                typeRecord = record.charAt(0);
                subType = record.charAt(2);
                switch (typeRecord) {
                    case 'L':
                        if (subType == 'C') {
                            String sAddr = record.substring(record.indexOf(":", 3) + 1);
                            int addr = Integer.parseInt(sAddr, 16);
                            String fName = record.split("\\$")[1];
                            fName = fName.toLowerCase();
                            int lineNum = Integer.parseInt(record.split("\\$")[2]);
                            if (this.fileLineAddr.get(fName) == null) {
                                this.fileLineAddr.put(fName, new HashMap());
                            }
                            HashMap hm = (HashMap) this.fileLineAddr.get(fName);
                            hm.put(new Integer(lineNum), new Integer(addr));
                            this.fileCAddr.put(new Integer(addr), fName);
                            this.CSource = true;
                        }
                        if (subType == 'A') {
                            String sAddr = record.substring(record.indexOf(":", 3) + 1);
                            int addr = Integer.parseInt(sAddr, 16);
                            String fName = record.split("\\$")[1];
                            fName = Utils.putExtension(fName, "asm").toLowerCase();
                            int lineNum = Integer.parseInt(record.split("\\$")[2].split(":")[0]);
                            if (this.fileLineAddr.get(fName) == null) {
                                this.fileLineAddr.put(fName, new HashMap());
                            }
                            HashMap hm = (HashMap) this.fileLineAddr.get(fName);
                            hm.put(new Integer(lineNum), new Integer(addr));
                            this.fileAAddr.put(new Integer(addr), fName);
                        }
                        if (subType == 'G') {
                            String sAddr = record.substring(record.indexOf(":", 3) + 1);
                            int addr = Integer.parseInt(sAddr, 16);
                            String vName = record.split("\\$")[1];
                            String tmp = record.split("\\$")[3];
                            int vBlock = Integer.parseInt(tmp.substring(0, tmp.indexOf(':')));
                            VariableInfo v = this.getVarByNameBlock(vName, vBlock);
                            if (v != null) {
                                v.setAddr(addr);
                            }
                        }
                        break;
                    case 'S':
                        String tmp;
                        String vScope = record.substring(2, 3);
                        String vnScope = "";
                        if (vScope.equals("L") || vScope.equals("F")) {
                            vnScope = record.substring(3, record.indexOf('$'));
                        }
                        String vName = record.split("\\$")[1];
                        int vLevel = Integer.parseInt(record.split("\\$")[2]);
                        tmp = record.split("\\$")[3];
                        tmp = tmp.substring(0, tmp.indexOf('('));
                        int vBlock = Integer.parseInt(tmp);
                        tmp = record.substring(record.indexOf("{") + 1, record.indexOf("}"));
                        int vSize = Integer.parseInt(tmp);
                        String vType = record.substring(record.indexOf("}") + 1, record.indexOf("}") + 3);
                        String vSpace = record.substring(record.indexOf(",") + 1, record.indexOf(",") + 2);
                        String vRegs = null;
                        if (record.indexOf("[") > -1) {
                            vRegs = record.substring(record.indexOf("[") + 1, record.indexOf("]"));
                        }

                        if (vType.equals("SL") || vType.equals("SI") || vType.equals("SC")
                                || vType.equals("SS") || vType.equals("SV") || vType.equals("SF")
                                || vType.equals("SX")) {
                            VariableInfo v = this.getVarByNameBlock(vName, vBlock);
                            if (v == null) {
                                v = new VariableInfo();
                                v.setScope(vScope);
                                v.setScopeName(vnScope);
                                v.setName(vName);
                                v.setLevel(vLevel);
                                v.setBlock(vBlock);
                                v.setVarSize(vSize);
                                v.setVarType(vType);
                                v.setVarSign('U');
                                v.setSpace(vSpace);
                                v.setReg(vRegs);
                                this.vars.add(v);
                            } else {
                                v.setScope(vScope);
                                v.setScopeName(vnScope);
                                v.setLevel(vLevel);
                                v.setBlock(vBlock);
                                v.setVarSize(vSize);
                                v.setVarType(vType);
                                v.setVarSign('U');
                                v.setSpace(vSpace);
                                v.setReg(vRegs);
                            }
                        }
                        break;
                }
            }
        } catch (IOException ex) {
            return false;
        }
        return true;
    }

    public VariableInfo getVarByNameBlock(String name, int block) {
        for (int i = 0; i < this.vars.size(); i++) {
            VariableInfo v = (VariableInfo) this.vars.get(i);
            if (v.getName().equals(name)) { // && v.getBlock() == block) {
                return v;
            }
        }
        return null;
    }

    public HashMap getLineAddr(String fileName) {
        HashMap hp = (HashMap) this.fileLineAddr.get(fileName);
        return hp;
    }

    public int getAddrLine(String fileName, int addr) {
        int rLn = -1;
        HashMap hp = (HashMap) this.fileLineAddr.get(fileName);
        if (hp != null) {
            Iterator i = hp.keySet().iterator();
            for (; i.hasNext();) {
                Integer ln = (Integer) i.next();
                Integer mAddr = (Integer) hp.get(ln);
                if (mAddr.intValue() == addr) {
                    rLn = ln.intValue();
                }
            }
        }
        return rLn;
    }

    public int getNextLineAddr(String fileName, int nLn) {
        HashMap hp = (HashMap) this.fileLineAddr.get(fileName);
        Iterator i = hp.keySet().iterator();
        int rLn = -1;
        boolean gNLn = false;
        for (; i.hasNext();) {
            Integer ln = (Integer) i.next();
            if (ln.intValue() == nLn) {
                gNLn = true;
            }
            if (gNLn) {
                Integer addr = (Integer) hp.get(ln);
                return addr.intValue();
            }
        }
        return -1;
    }

    public int getCLineAprox(String fileName, int addr) {
        HashMap hp = (HashMap) this.fileLineAddr.get(fileName);
        Iterator i = hp.keySet().iterator();
        int sLn = -1;
        int dAddr = 0xFFFF;
        for (; i.hasNext();) {
            Integer ln = (Integer) i.next();
            Integer mAddr = (Integer) hp.get(ln);
            if (mAddr.intValue() <= addr) {
                if (dAddr > Math.abs(mAddr.intValue() - addr)) {
                    sLn = ln.intValue();
                    dAddr = Math.abs(mAddr.intValue() - addr);
                }
            }
        }
        return sLn;
    }

    public int getLineAddr(String fileName, int ln) {
        HashMap hp = (HashMap) this.fileLineAddr.get(fileName);
        if (hp != null) {
            Integer addr = (Integer) hp.get(new Integer(ln));
            if (addr != null) {
                return addr.intValue();
            }
        }
        return -1;
    }

    public String getFileAddr(int addr) {
        String fName = (String) this.fileCAddr.get(new Integer(addr));
        if (fName == null) {
            fName = (String) this.fileAAddr.get(new Integer(addr));
        }
        return fName;
    }

    public boolean haveThisSource(String fileName) {
        HashMap hp = (HashMap) this.fileLineAddr.get(fileName);
        return (hp != null);
    }

    /**
     * @return the CSource
     */
    public boolean isCSource() {
        return CSource;
    }
}
