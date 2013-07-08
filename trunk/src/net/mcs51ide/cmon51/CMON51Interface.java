package net.mcs51ide.cmon51;

import gnu.io.SerialPortEvent;
import java.io.IOException;
import java.util.ArrayList;
import net.mcs51ide.sdcc.CDBFileParser;
import net.mcs51ide.sdcc.VariableInfo;

public class CMON51Interface extends SerialComm {

    private boolean flagIsRunning;
    private boolean targetInited;
    private byte buf[] = new byte[1024];
    private byte codeImage[] = new byte[65536];
    private byte xDataImage[] = new byte[65536];
    private byte iDataImage[] = new byte[65536];
    private byte dDataImage[] = new byte[65536];
    private int startAddress = 65536, lastAddress = 0;
    private int breakPoints[] = new int[4];
    private CMON51CallBack callBack;
    private CDBFileParser cdb;
    private int pauseSource;
    private String pausedAsmPositionFile;
    private int pausedAsmPositionLine;

    public CMON51Interface() {
        super();
        this.flagIsRunning = false;
        this.targetInited = false;
    }

    public boolean targetReset() {
        String ret;
        this.enableListener(false);
        sendSpace();
        ret = readAll();
        sendCommand("RST");
        ret = readAll();
        if (ret.indexOf("CMON") == -1) {
            this.targetInited = false;
            return false;
        }
        this.flagIsRunning = false;

        this.targetInited = true;
        return true;
    }

    public int loadHex(String fileName) {
        byte[] cI;
        int i;
        cI = HexFileParser.parseFile(fileName);
        if (cI == null) {
            return -1;
        }
        this.codeImage = cI;
        this.lastAddress = HexFileParser.lastAddress;
        this.startAddress = HexFileParser.startAddress;
        try {
            sendCommand("L");
            String s = readAll();
            if (s.indexOf("Send") == -1) {
                return -2;
            }
            for (i = 0; i < HexFileParser.hexs.size(); i++) {
                sendCommand(HexFileParser.hexs.get(i));
            }
            Thread.sleep(50);
            s = readAll();
            if (s.indexOf("Done") == -1) {
                return -3;
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return (this.lastAddress - this.startAddress) + 1;
    }

    public boolean runCode() {
        String ret;
        sendCommand("g 2000");
        ret = readBytesNum(8);
        this.enableListener(true);
        this.flagIsRunning = true;
        return ret.indexOf("g 2000") > -1;
    }

    public boolean isRunning() {
        return this.flagIsRunning;
    }

    public boolean resume() {
        String ret;
        sendCommand("g");
        ret = readBytesNum(3);
        this.enableListener(true);
        this.flagIsRunning = true;
        return (ret.indexOf("g") > -1);
    }

    public boolean doSoftStep() {
        int offset, i;
        try {
            String rst = "gb ";
            outputStream.write(rst.getBytes());
            outputStream.write(13);
            outputStream.write(10);
            outputStream.flush();
            Thread.sleep(0, 9000);
            offset = 0;
            while (offset < 5) {
                i = inputStream.read(buf, offset, 5);
                offset += i;
            }
        } catch (IOException | InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return true;
    }

    public boolean pause() {
        String ret;
        this.enableListener(false);
        sendSpace();
        ret = readAll();
        if (ret.indexOf('>') == -1) {
            return false;
        }
        this.flagIsRunning = true;
        return true;
    }

    public boolean doStep() {
        String ret;
        this.enableListener(true);
        sendCommand("s");
        ret = readAll();
        if (buf[0] != '>') {
            return false;
        }
        return true;
    }

    public int getPC() {
        String ret;
        ret = readAll();
        sendCommand("PC");
        ret = readAll();
        try {
            ret = ret.substring(4, 8);
            return Integer.parseInt(ret, 16);
        } catch (Exception e) {
            System.out.println("RET:"+ret);
            return -1;
        }
    }

    public String getSRF(String srf) {
        String ret;
        sendCommand(srf);
        ret = this.readBytesNum(14);
        try {
            ret = ret.substring(ret.indexOf(0x0D) + 1);
            ret = ret.substring(0, ret.indexOf(0x0A));
            return ret;
        } catch (Exception e) {
            return "";
        }
    }

    public String setSRF(String srf, String value) {
        String ret;
        sendCommand(srf + "=" + value);
        ret = this.readBytesNum(14);
        return value;
    }

    public boolean insertBreakPoint(int addr) {
        String addr16 = Integer.toHexString(addr);
        String ret;
        sendCommand("mx " + addr16);
        sendData("12");
        sendData("00");
        sendData("1B");
        sendEndLine();
        ret = readAll();
        return (ret.indexOf("X:" + addr16) != -1);
    }

    public boolean restoreCode(int addr, int length) {
        int i;
        String addr16 = Integer.toHexString(addr);
        String ret;
        sendCommand("mx " + addr16);
        for (i = 0; i < length; i++) {
            if ((codeImage[addr + i] & 0xFF) < 0x10) {
                sendData("0");
            }
            sendData(Integer.toHexString(codeImage[addr + i] & 0xFF));
        }
        sendEndLine();
        ret = readAll();
        return (ret.indexOf("X:" + addr16) != -1);
    }

    public String readXData(int addr, int lenght) {
        String addr16 = Integer.toHexString(addr).toUpperCase();
        String r = "";
        while (addr16.length() < 4) {
            addr16 = (new String("0")).concat(addr16);
        }
        String ret;
        sendCommand("x " + addr16);
        ret = readAll().substring(8);
        ret = ret.substring(ret.indexOf(addr16.substring(0, 3)) + 7);
        ret = ret.substring(0, 48).concat(ret.substring(78, 126)).concat(
                ret.substring(156, 204)).concat(ret.substring(234, 282)).concat(
                ret.substring(312, 360)).concat(ret.substring(390, 438)).concat(
                ret.substring(468, 516)).concat(ret.substring(546, 594));
        int dd = Integer.parseInt(addr16.substring(3), 16) * 3;
        ret = ret.substring(dd, dd + lenght * 3);
        for (dd = 0; dd < lenght; dd++) {
            r = ret.substring(dd * 3, dd * 3 + 2).concat(r);
        }
        return r;
    }

    public boolean writeXData(int addr, int[] values) {
        String addr16 = Integer.toHexString(addr);
        String ret;
        sendCommand("mx " + addr16);
        for (int i = 0; i < values.length; i++) {
            String va = Integer.toHexString(values[i]);
            if (va.length() < 2) {
                va = "0".concat(va);
            } else if (va.length() > 2) {
                va = va.substring(0, 2);
            }
            sendData(va);
        }
        sendEndLine();
        ret = readAll();
        return (ret.indexOf("X:" + addr16) != -1);
    }

    public String readCData(int addr, int lenght) {
        String addr16 = Integer.toHexString(addr).toUpperCase();
        String r = "";
        while (addr16.length() < 4) {
            addr16 = (new String("0")).concat(addr16);
        }
        String ret;
        sendCommand("c " + addr16);
        ret = readAll().substring(8);
        ret = ret.substring(ret.indexOf(addr16.substring(0, 3)) + 7);
        ret = ret.substring(0, 48).concat(ret.substring(78, 126)).concat(
                ret.substring(156, 204)).concat(ret.substring(234, 282)).concat(
                ret.substring(312, 360)).concat(ret.substring(390, 438)).concat(
                ret.substring(468, 516)).concat(ret.substring(546, 594));
        int dd = Integer.parseInt(addr16.substring(3), 16) * 3;
        ret = ret.substring(dd, dd + lenght * 3);
        for (dd = 0; dd < lenght; dd++) {
            r = ret.substring(dd * 3, dd * 3 + 2).concat(r);
        }
        return r;
    }

    public String readDData(int addr, int lenght) {
        String addr8 = Integer.toHexString(addr).toUpperCase();
        String r = "";
        while (addr8.length() < 2) {
            addr8 = (new String("0")).concat(addr8);
        }
        String ret;
        if (addr > 0x7f) {
            sendCommand("i ");
        } else {
            sendCommand("d ");
        }
        ret = readAll().substring(4);
        if (addr > 0x7f) {
            ret = ret.substring(ret.indexOf("I:" + addr8.substring(0, 1)) + 7);
        } else {
            ret = ret.substring(ret.indexOf("D:" + addr8.substring(0, 1)) + 7);
        }
        //ret = ret.substring(0, 48).concat(ret.substring(76));
        ret = ret.substring(0,48).concat(ret.substring(76,124)).concat(
                ret.substring(152,200)).concat(ret.substring(228,276)).concat(
                ret.substring(304,352)).concat(ret.substring(380,428)).concat(
                ret.substring(456,504));
        int dd = Integer.parseInt(addr8.substring(1), 16) * 3;
        ret = ret.substring(dd, dd + lenght * 3);
        for (dd = 0; dd < lenght; dd++) {
            r = ret.substring(dd * 3, dd * 3 + 2).concat(r);
        }
        return r;
    }

    public boolean writeDData(int addr, int[] values) {
        String addr8 = Integer.toHexString(addr);
        String ret;
        if (addr > 0x7F) {
            sendCommand("mi " + addr8);
        } else {
            sendCommand("md " + addr8);
        }
        for (int i = 0; i < values.length; i++) {
            String va = Integer.toHexString(values[i]);
            if (va.length() < 2) {
                va = "0".concat(va);
            } else if (va.length() > 2) {
                va = va.substring(0, 2);
            }
            sendData(va);
        }
        sendEndLine();
        ret = readAll();
        return (ret.indexOf(":" + addr8) != -1);
    }

    @Override
    public void serialEvent(SerialPortEvent spe) {
        if (spe.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
            this.callBack.pauseRun();
        }
    }

    /**
     * @return the callBack
     */
    public CMON51CallBack getCallBack() {
        return callBack;
    }

    /**
     * @param callBack the callBack to set
     */
    public void setCallBack(CMON51CallBack callBack) {
        this.callBack = callBack;
    }

    /**
     * @return the cdb
     */
    public CDBFileParser getCdb() {
        return cdb;
    }

    /**
     * @param cdb the cdb to set
     */
    public void setCdb(CDBFileParser cdb) {
        this.cdb = cdb;
    }

    /**
     * @return the pauseSource
     */
    public int getPauseSource() {
        return pauseSource;
    }

    /**
     * @param pauseSource the pauseSource to set
     */
    public void setPauseSource(int pauseSource) {
        this.pauseSource = pauseSource;
    }

    /**
     * @return the pausedPositionFile
     */
    public String getAsmPausedPositionFile() {
        return pausedAsmPositionFile;
    }

    /**
     * @param pausedPositionFile the pausedPositionFile to set
     */
    public void setAsmPausedPositionFile(String pausedPositionFile) {
        this.pausedAsmPositionFile = pausedPositionFile;
    }

    /**
     * @return the pausedPositionLine
     */
    public int getAsmPausedPositionLine() {
        return pausedAsmPositionLine;
    }

    /**
     * @param pausedPositionLine the pausedPositionLine to set
     */
    public void setAsmPausedPositionLine(int pausedPositionLine) {
        this.pausedAsmPositionLine = pausedPositionLine;
    }

    public ArrayList getDebugVarsCdb(ArrayList names) {
        int i;
        ArrayList r = new ArrayList();
        for (i = 0; i < names.size(); i++) {
            int block;
            String vName = (String) names.get(i);
            if (vName.indexOf("$") > -1) {
                block = Integer.parseInt(vName.split("\\$")[1]);
                vName = vName.split("\\$")[0];
            } else {
                block = 0;
            }
            VariableInfo v = this.cdb.getVarByNameBlock(vName, block);
            if (v != null) {
                r.add(v);
            } else {
                v = new VariableInfo();
                switch (vName) {
                    case "PC":
                        v.setName("PC");
                        v.setSpace("I"); // SRF
                        v.setVarSize(2);
                        break;
                    case "R0":
                        v.setName("R0");
                        v.setSpace("I"); // SRF
                        v.setVarSize(1);
                        break;
                    case "R1":
                        v.setName("R1");
                        v.setSpace("I"); // SRF
                        v.setVarSize(1);
                        break;
                    case "R2":
                        v.setName("R2");
                        v.setSpace("I"); // SRF
                        v.setVarSize(1);
                        break;
                    case "R3":
                        v.setName("R3");
                        v.setSpace("I"); // SRF
                        v.setVarSize(1);
                        break;
                    case "R4":
                        v.setName("R4");
                        v.setSpace("I"); // SRF
                        v.setVarSize(1);
                        break;
                    case "R5":
                        v.setName("R5");
                        v.setSpace("I"); // SRF
                        v.setVarSize(1);
                        break;
                    case "R6":
                        v.setName("R6");
                        v.setSpace("I"); // SRF
                        v.setVarSize(1);
                        break;
                    case "R7":
                        v.setName("R7");
                        v.setSpace("I"); // SRF
                        v.setVarSize(1);
                        break;
                    case "DPTR":
                        v.setName("DPTR");
                        v.setSpace("I"); // SRF
                        v.setVarSize(4);
                        break;
                    default:
                        v = null;
                }
                if (v != null) {
                    r.add(v);
                }
            }
        }
        return r;
    }

    public String getSymbolValue(VariableInfo vInf) {
        if (this.cdb != null) {
            switch (vInf.getSpace()) {
                case "C":
                case "D":
                    return this.readCData(vInf.getAddr(), vInf.getVarSize());
                case "E":
                case "G":
                    return this.readDData(vInf.getAddr(), vInf.getVarSize());
                case "F":
                    return this.readXData(vInf.getAddr(), vInf.getVarSize());
                case "I":
                    return this.getSRF(vInf.getName());
                case "R":
                    if (vInf.getReg().indexOf(",") > -1) {
                        String[] regs = vInf.getReg().split(",");
                        String vls = "";
                        for (int i = 0; i < regs.length; i++) {
                            vls = this.getSRF(regs[i]).concat(vls);
                        }
                        return vls;
                    } else {
                        return this.getSRF(vInf.getReg());
                    }
                default:
                    return "0";
            }
        }
        return "0";
    }

    public boolean setSymbolValue(VariableInfo vInf) {
        if (this.cdb != null) {
            switch (vInf.getSpace()) {
                case "C":
                case "D":
                //return this.readCData(vInf.getAddr(), vInf.getVarSize());
                case "E":
                case "G":
                    return this.writeDData(vInf.getAddr(), vInf.getArrayIntValue());
                case "F":
                    return this.writeXData(vInf.getAddr(), vInf.getArrayIntValue());
                case "I":
                    this.setSRF(vInf.getName(), vInf.getValue());
                    return true;
                case "R":
                    if (vInf.getReg().indexOf(",") > -1) {
                        String[] regs = vInf.getReg().split(",");
                        String vls = "";
                        int[] parts = vInf.getArrayIntValue();
                        for (int i = 0; i < regs.length; i++) {
                            this.setSRF(regs[i], Integer.toHexString(parts[i]));
                        }
                        return true;
                    } else {
                        this.setSRF(vInf.getReg(), vInf.getValue());
                        return true;
                    }
                default:
                    return false;
            }
        }
        return false;
    }

        public String[] readBlockXData(int addr) {
        String addr16 = Integer.toHexString(addr).toUpperCase();
        String r[] = new String[128];
        while (addr16.length() < 4) {
            addr16 = (new String("0")).concat(addr16);
        }
        String ret;
        sendCommand("x " + addr16);
        ret = readAll().substring(8);
        ret = ret.substring(ret.indexOf(addr16.substring(0, 3)) + 7);
        ret = ret.substring(0, 48).concat(ret.substring(78, 126)).concat(
                ret.substring(156, 204)).concat(ret.substring(234, 282)).concat(
                ret.substring(312, 360)).concat(ret.substring(390, 438)).concat(
                ret.substring(468, 516)).concat(ret.substring(546, 594));
        int dd;
        for (dd = 0; dd < 128; dd++) {
            r[dd] = ret.substring(dd * 3, dd * 3 + 2);
        }
        return r;
    }

        public String[] readBlockCData(int addr) {
        String addr16 = Integer.toHexString(addr).toUpperCase();
        String r[] = new String[128];
        while (addr16.length() < 4) {
            addr16 = (new String("0")).concat(addr16);
        }
        String ret;
        sendCommand("c " + addr16);
        ret = readAll().substring(8);
        ret = ret.substring(ret.indexOf(addr16.substring(0, 3)) + 7);
        ret = ret.substring(0, 48).concat(ret.substring(78, 126)).concat(
                ret.substring(156, 204)).concat(ret.substring(234, 282)).concat(
                ret.substring(312, 360)).concat(ret.substring(390, 438)).concat(
                ret.substring(468, 516)).concat(ret.substring(546, 594));
        int dd;
        for (dd = 0; dd < 128; dd++) {
            r[dd] = ret.substring(dd * 3, dd * 3 + 2);
        }
        return r;
    }

    public String[] readBlockDData() {
        String r[] = new String[256];
        String ret;
        sendCommand("d ");
        ret = readAll().substring(4);
        ret = ret.substring(ret.indexOf("D:") + 7);
        //ret = ret.substring(0, 48).concat(ret.substring(76));
        ret = ret.substring(0,48).concat(ret.substring(76,124)).concat(
                ret.substring(152,200)).concat(ret.substring(228,276)).concat(
                ret.substring(304,352)).concat(ret.substring(380,428)).concat(
                ret.substring(456,504)).concat(ret.substring(532,580));
        for (int dd = 0; dd < 128; dd++) {
            r[dd] = ret.substring(dd * 3, dd * 3 + 2);

        }
        sendCommand("i ");
        ret = readAll().substring(4);
        ret = ret.substring(ret.indexOf("I:") + 7);
        //ret = ret.substring(0, 48).concat(ret.substring(76));
        ret = ret.substring(0,48).concat(ret.substring(76,124)).concat(
                ret.substring(152,200)).concat(ret.substring(228,276)).concat(
                ret.substring(304,352)).concat(ret.substring(380,428)).concat(
                ret.substring(456,504)).concat(ret.substring(532,580));
        for (int dd = 0; dd < 128; dd++) {
            r[128+dd] = ret.substring(dd * 3, dd * 3 + 2);
        }
        return r;
    }
}
