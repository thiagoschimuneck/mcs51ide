/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.cmon51;

/**
 *
 * @author thiago
 */
public class DeAsm51 {

    private String instruction;
    private int pc;
    private byte[] image;

    public DeAsm51() {
        this.pc = 0;
        this.image = new byte[64 * 1024];
        this.instruction = "";
    }

    public int deAsmByte() {
        String mne = "--";
        byte opcode = (byte) (image[pc]);
        int b1 = (int) image[pc + 1]&0x0FF;
        int b2 = (int) image[pc + 2]&0x0FF;
        int opcode_size = 0;
        // DATA TRANSFER
        if ((opcode & 0xF8) == 0xE8) { // MOV A,Rn
            mne = "MOV A, R" + (Integer.toString((opcode & 0x07)));
            opcode_size = 1;
        } else if (opcode == (byte) 0xE5) {// MOV A,direct
            mne = "MOV A, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0xE6) { // MOV A, @Ri
            mne = "MOV A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0x74) { // MOV A, #data
            mne = "MOV A, #0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xF8) == 0xF8) { //MOV Rn, A
            mne = "MOV R" + Integer.toString(opcode & 0x07) + ", A";
            opcode_size = 1;
        } else if ((opcode & 0xF8) == 0xA8) { // MOV Rn, direct
            mne = "MOV R" + Integer.toString(opcode & 0x07) + ", 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xF8) == 0x78) { // MOV Rn, #data
            mne = "MOV R" + Integer.toString(opcode & 0x07) + ", #0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0xF5) { // MOV direct, A 
            mne = "MOV 0x" + toHex8(b1) + ", A";
            opcode_size = 2;
        } else if ((opcode & 0xF8) == 0x88) { // MOV direct, Rn
            mne = "MOV 0x" + toHex8(b1) + ", R" + Integer.toString(opcode & 0x07);
            opcode_size = 2;
        } else if (opcode == (byte) 0x85) { // MOV direct, direct
            mne = "MOV 0x" + toHex8(b1) + ", 0x" + toHex8(b2);
            opcode_size = 3;
        } else if (opcode == (byte) 0xF5) { // MOV direct, @Ri
            mne = "MOV 0x" + toHex8(b1) + ", @R" + Integer.toString(opcode & 0x01);
            opcode_size = 2;
        } else if (opcode == (byte) 0x75) { // MOV direct, #data
            mne = "MOV 0x" + toHex8(b1) + ", #0x" + toHex8(b2);
            opcode_size = 3;
        } else if ((opcode & 0xFE) == 0xF6) { // MOV @Ri, A
            mne = "MOV @R" + Integer.toString(opcode & 0x01) + ", A";
            opcode_size = 1;
        } else if ((opcode & 0xFE) == 0xA6) { // MOV @Ri, direct
            mne = "MOV @R" + Integer.toString(opcode & 0x01) + ", 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0x76) { // MOV @Ri, #data
            mne = "MOV @R" + Integer.toString(opcode & 0x01) + ", #0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x90) { // MOV DPTR, #data16
            mne = "MOV DPTR, #0x" + toHex8(b1) + toHex8(b2);
            opcode_size = 3;
        } else if (opcode == (byte) 0x93) { // MOVC A, @A+DPTR
            mne = "MOVC A, @A+DPTR";
            opcode_size = 1;
        } else if (opcode == (byte) 0x83) { // MOVC A, @A+PC
            mne = "MOVC A, @A+PC";
            opcode_size = 1;
        } else if ((opcode & 0xFE) == 0xE2) { // MOVX A,@Ri
            mne = "MOVC A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0xE0) { // MOVX A, @DPTR
            mne = "MOVX A, @DPTR";
            opcode_size = 1;
        } else if ((opcode & 0xFE) == 0xF2) { // MOVX @Ri, A
            mne = "MOVX @R" + Integer.toString(opcode & 0x01) + ", A";
            opcode_size = 1;
        } else if (opcode == (byte) 0xF0) { // MOVX @DPTR, A
            mne = "MOVX @DPTR, A";
            opcode_size = 1;
        } else if (opcode == (byte) 0xC0) { // PUSH direct 
            mne = "PUSH 0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0xD0) { // POP direct
            mne = "POP 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xF8) == 0xC8) { // XCH A, Rn
            mne = "XCH A, R" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0xC5) { // XCH A, direct
            mne = "XCH A, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0xC6) { // XCH A, @Ri
            mne = "XCH A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if ((opcode & 0xFE) == 0xD6) { // XCHD A, @Ri
            mne = "XCHD A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else // OPERACOES ATITMETICAS
        if ((opcode & 0xF8) == 0x28) { // ADD A, Rn
            mne = "ADD A, R" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0x25) { // ADD A, direct
            mne = "ADD A, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0x26) { // ADD A, @Ri
            mne = "ADD A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0x24) { // ADD A, #data
            mne = "ADD A, #0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xF8) == 0x38) { // ADDC A, Rn
            mne = "ADDC A, R" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0x35) { // ADDC A, direct
            mne = "ADDC A, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0x36) { // ADDC A, @Ri
            mne = "ADDC A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0x34) { // ADDC A, #data
            mne = "ADDC A, #0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xF8) == 0x98) { // SUBB A, Rn
            mne = "SUBB A, Rn" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0x95) { // SUBB A, direct
            mne = "SUBB A, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0x96) { // SUBB A, @Ri
            mne = "SUBB A,@R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0x94) { // SUBB A, #data
            mne = "SUBB A, #0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x04) { // INC A
            mne = "INC A";
            opcode_size = 1;
        } else if ((opcode & 0xF8) == 0x08) { // INC Rn
            mne = "INC R" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0x05) { // INC direct
            mne = "INC 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0x06) { // INC @Ri
            mne = "INC @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0xA3) { // INC DPTR
            mne = "INC DPTR";
            opcode_size = 1;
        } else if (opcode == (byte) 0x14) { // DEC A
            mne = "DEC A";
            opcode_size = 1;
        } else if ((opcode & 0xF8) == 0x18) { // DEC Rn
            mne = "DEC R" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0x15) { // DEC direct
            mne = "DEC 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0x16) { // DEC @Ri
            mne = "DEC @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0xA4) { // MUL AB
            mne = "MUL AB";
            opcode_size = 1;
        } else if (opcode == (byte) 0x84) { // DIV AB
            mne = "DIV AB";
            opcode_size = 1;
        } else if (opcode == (byte) 0xD4) { // DA A
            mne = "DA A";
            opcode_size = 1;
        } else // OPERACOES LOGICAS
        if ((opcode & 0xF8) == 0x58) { // ANL A, Rn
            mne = "ANL A, R" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0x55) { // ANL A, direct
            mne = "ANL A, 0x" + Integer.toString(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0x56) { // ANL A,@Ri
            mne = "ANL A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0x54) { // ANL A, #data
            mne = "ANL A, #0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x52) { // ANL direct, A
            mne = "ANL 0x" + toHex8(b1) + ", A";
            opcode_size = 2;
        } else if (opcode == (byte) 0x53) { // ANL direct, #data
            mne = "ANL 0x" + toHex8(b1) + ", #" + toHex8(b2);
            opcode_size = 3;
        } else if ((opcode & 0xF8) == 0x48) { // ORL A, Rn
            mne = "ORL A, R" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0x45) { // ORL A, direct
            mne = "ORL A, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & 0xFE) == 0x46) { // ORL A, @Ri
            mne = "ORL A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0x44) { // ORL A, #data
            mne = "ORL A, #0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x42) { // ORL direct, A
            mne = "ORL 0x" + toHex8(b1) + ", A";
            opcode_size = 2;
        } else if (opcode == (byte) 0x43) { // ORL direct, #data
            mne = "ORL 0x" + toHex8(b1) + ", #" + toHex8(b2);
            opcode_size = 3;
        } else if ((opcode & 0xF8) == 0x68) { // XRL A, Rn
            mne = "XRL A, R" + Integer.toString(opcode & 0x07);
            opcode_size = 1;
        } else if (opcode == (byte) 0x65) { // XRL A, direct
            mne = "XRL A, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if ((opcode & (byte) 0xFE) == 0x66) { // XRL A, @Ri
            mne = "XRL A, @R" + Integer.toString(opcode & 0x01);
            opcode_size = 1;
        } else if (opcode == (byte) 0x64) { // XRL A, #data
            mne = "XRL A, #0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x62) { // XRL direct, A
            mne = "XRL 0x" + toHex8(b1) + ", A";
            opcode_size = 2;
        } else if (opcode == (byte) 0x63) { // XRL direct, #data
            mne = "XRL 0x" + toHex8(b1) + ", #" + toHex8(b2);
            opcode_size = 3;
        } else if (opcode == (byte) 0xE4) { // CLR A 
            mne = "CLR A";
            opcode_size = 1;
        } else if (opcode == (byte) 0xF4) { // CPL A
            mne = "CPL A";
            opcode_size = 1;
        } else if (opcode == (byte) 0x23) { // RL A
            mne = "RL A";
            opcode_size = 1;
        } else if (opcode == (byte) 0x33) { // RLC A
            mne = "RLC A";
            opcode_size = 1;
        } else if (opcode == (byte) 0x03) { // RR A
            mne = "RR A";
            opcode_size = 1;
        } else if (opcode == (byte) 0x13) { // RRC A
            mne = "RRC A";
            opcode_size = 1;
        } else if (opcode == (byte) 0xC4) { // SWAP A
            mne = "SWAP A";
            opcode_size = 1;
        } else // MANIPULACAO BOOLEAN
        if (opcode == (byte) 0xC3) { // CLR C
            mne = "CLR C";
            opcode_size = 1;
        } else if (opcode == (byte) 0xC2) { // CLR bit
            mne = "CLR 0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0xD3) { // SETB C
            mne = "SETB C";
            opcode_size = 1;
        } else if (opcode == (byte) 0xD2) { // SETB bit
            mne = "SETB " + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0xB3) { // CPL C 
            mne = "CPL C";
            opcode_size = 1;
        } else if (opcode == (byte) 0xB2) { // CPL bit
            mne = "CPL 0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x82) { // ANL C, bit
            mne = "ANL C, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0xB2) { // ANL C, /bit
            mne = "ANL C, /0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x72) { // ORL C, bit
            mne = "ORL C, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0xA0) { // ORL C, /bit
            mne = "ORL C, /0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0xA2) { // MOV C, bit
            mne = "MOV C, 0x" + toHex8(b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x92) { // MOV bit, C
            mne = "MOV 0x" + toHex8(b1) + ", C";
            opcode_size = 2;
        } else if (opcode == (byte) 0x40) { // JC rel
            opcode_size = 2;
            mne = "JC " + toHex16((pc + opcode_size) + ((byte) b1));
        } else if (opcode == (byte) 0x50) { // JNC rel
            opcode_size = 2;
            mne = "JNC " + toHex16((pc + opcode_size) + ((byte) b1));
        } else if (opcode == (byte) 0x20) { // JB bit, rel
            opcode_size = 3;
            mne = "JB 0x" + toHex8(b1) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b1));
        } else if (opcode == (byte) 0x30) { // JNB bit, rel
            opcode_size = 3;
            mne = "JNB 0x" + toHex8(b1) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b1));
        } else if (opcode == (byte) 0x10) { // JBC bit, rel
            opcode_size = 3;
            mne = "JBC 0x" + toHex8(b1) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b1));
        } else // INSTRUCOES DE DESVIO
        if ((opcode & 0x1F) == 0x11) { // ACALL addr11
            mne = "ACALL 0x" + toHex16((pc & 0xF800) + (opcode & 0xE0) * 256 + b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x12) { // LCALL addr16
            mne = "LCALL 0x" + toHex16( b1 * 256 + b2 );
            opcode_size = 3;
        } else if (opcode == (byte) 0x22) { // RET
            mne = "RET";
            opcode_size = 1;
        } else if (opcode == (byte) 0x32) { // RETI
            mne = "RETI";
            opcode_size = 1;
        } else if ((opcode & 0x1F) == 0x01) { // AJMP addr11
            mne = "AJMP 0x" + toHex16((pc & 0xF800) + (opcode & 0xE0) * 256 + b1);
            opcode_size = 2;
        } else if (opcode == (byte) 0x02) { // LJMP addr16
            mne = "LJMP 0x" + toHex16(b1 * 256 + b2);
            opcode_size = 3;
        } else if (opcode == (byte) 0x80) { // SJMP rel
            opcode_size = 2;
            mne = "SJMP 0x" + toHex16((pc + opcode_size) + ((byte) b1));
        } else if (opcode == (byte) 0x73) { // JMP @A+DPTR
            mne = "JMP @A+DPTR";
            opcode_size = 1;
        } else if (opcode == (byte) 0x60) { // JZ rel
            opcode_size = 2;
            mne = "JZ 0x" + toHex16((pc + opcode_size) + ((byte) b1));
        } else if (opcode == (byte) 0x70) { // JNZ rel
            opcode_size = 2;
            mne = "JNZ 0x" + toHex16((pc + opcode_size) + ((byte) b1));
        } else if (opcode == (byte) 0xB5) { // CJNE A, direct, rel
            opcode_size = 3;
            mne = "CJNE A, 0x" + toHex8(b1) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b2));
        } else if (opcode == (byte) 0xB4) { // CJNE A, #data, rel
            opcode_size = 3;
            mne = "CJNE A, #0x" + toHex8(b1) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b2));
        } else if ((opcode & 0xF8) == 0xB8) { // CJNE Rn, #data, rel
            opcode_size = 3;
            mne = "CJNE R" + Integer.toString(opcode & 0x07) + ", #0x" + toHex8(b1) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b2));
        } else if ((opcode & 0xFE) == 0xB6) { // CJNE @Rn, #data, rel
            opcode_size = 3;
            mne = "CJNE @R" + Integer.toString(opcode & 0x01) + ", #0x" + toHex8(b1) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b2));
        } else if ((opcode & 0xF8) == 0xD8) { // DJNZ Rn, rel
            opcode_size = 2;
            mne = "DJNZ R" + Integer.toString(opcode & 0x07) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b1));
        } else if (opcode == (byte) 0xD5) { // DJNZ direct, rel
            opcode_size = 3;
            mne = "DJNZ 0x" + toHex8(b1) + ", 0x" + toHex16((pc + opcode_size) + ((byte) b2));
        } else if (opcode == (byte) 0x00) { // NOP
            mne = "NOP";
            opcode_size = 1;
        } else {
            System.out.println("Opcode nao loc: " + Integer.toHexString(opcode));
        }
        this.instruction = mne;
        this.pc += opcode_size;
        return opcode_size;
    }

    public static String toHex8(int b) {
        return String.format("%02x", b & 0x0ff).toUpperCase();
    }

    public static String toHex16(int b) {
        return String.format("%04x", b & 0x0ffff).toUpperCase();
    }

    public String getInstruction() {
        return this.instruction;
    }

    public int getPC() {
        return this.pc;
    }

    public void setImage(byte image[]) {
        this.image = image;
    }

    public int setPC(int pc) {
        this.pc = pc;
        return pc;
    }

    public static void main(String args[]) {

        byte imagem[];
        imagem = HexFileParser.parseFile(args[0]);
        int pc = 0x2000;
        char m[] = new char[32];
        DeAsm51 de = new DeAsm51();
        de.setImage(imagem);
        de.setPC(pc);
        while (true) {
            System.out.print(String.format("%04x", de.getPC()));
            de.deAsmByte();
            System.out.println(": " + de.getInstruction());
            if (de.getPC() > 0x20ab) {
                break;
            }
        }

    }
}
