package net.mcs51ide.cmon51;


/**
 * **************************************************************
 * This is an intel hexfile parser written in java. Copyright (C) 2002 Deva
 * Seetharam http://www.dseetharam.org
 *
 * Modified by Thiago Schimuneck 2012
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details. It is available at http://www.gnu.org/licenses/gpl.html
 */
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Vector;

/*
 Intel Hex File Format. this description is taken from www.8052.com.
 Pos Description
 1   Record Marker: 
 The first character of the line is always a colon (ASCII 0x3A) 
 to identify the line as an Intel HEX file 

 2-3 Record Length: 
 This field contains the number of data bytes in the register 
 represented as a 2-digit hexidecimal number. This is the 
 total number of data bytes, not including the checksum byte 
 nor the first 9 characters of the line.   

 4-7 Address: 
 This field contains the address where the data should be 
 loaded into the chip. This is a value from 0 to 65,535 
 represented as a 4-digit hexidecimal value. 

 8-9 Record Type: 
 This field indicates the type of record for this line. 
 The possible values are: 
 00=Register contains normal data. 
 01=End of File. 
 02=Extended address. 

 10-? Data Bytes: 
 The following bytes are the actual data that 
 will be burned into the EPROM. The data is represented as 
 2-digit hexidecimal values. 

 Last 2 Checksum: 
 The last two characters of the line are a checksum for the 
 line. The checksum value is calculated by taking the two's 
 complement of the sum of all the preceeding data bytes, 
 excluding the checksum byte itself and the colon at the
 beginning of the line.
 */
public class HexFileParser {
    //***you have to specify the required MAX_CODE_LENGTH

    public static final int MAX_CODE_LENGTH = 65536; //64kB
    public static final int RADIX = 16;
    public static final byte DATA_RECORD = 0;
    public static final byte EOF_RECORD = 1;
    public static int startAddress = 65536, lastAddress = 0;
    public static Vector<String> hexs;

    /**
     * parses the hexfile and returns an array of bytes that actually contain
     * that would be burnt into the target device. the position of bytes in the
     * array is determined by the specified address. If an element doesn't have
     * any code specified, it will contain a 0.
     *
     * @return returns an array of code bytes.
     *
     */
    public static byte[] parseFile(String fileName) {
        String record;
        byte dataLength;
        short address;
        byte[] data = null;
        byte[] hexVals;
        int sum;
        byte recordType;
        byte computedChecksum;
        byte checksum;
        int recordLength;
        int j;
        int k;
        int l;
        byte temp;
        int recordNum = 0;
        byte[] image;
        image = new byte[MAX_CODE_LENGTH];
        byte[] markers = new byte[MAX_CODE_LENGTH];

        hexs = new Vector<>();
        Arrays.fill(markers, (byte) 0);

        FileReader fr;
        BufferedReader br;
        try {
            fr = new FileReader(fileName);
            br = new BufferedReader(fr);
            while ((record = br.readLine()) != null) {
            	hexs.add(record);

                recordLength = record.length();

                hexVals = new byte[recordLength / 2];

                dataLength = (byte) (Integer.parseInt(record.substring(1, 3), RADIX));

                //allocate memory for data in this record.
                data = new byte[dataLength];

                address = (short) (Integer.parseInt(record.substring(3, 7), RADIX));

                recordType = (byte) (Integer.parseInt(record.substring(7, 9), RADIX));
                if (recordType == 0x00) {
                    if (address < startAddress) {
                        startAddress = address;
                    }
                }

                //Extract the code bytes.

                temp = (byte) (9 + (2 * dataLength));
                for (j = 9, k = 0, l = address; j < temp; j = j + 2, k++, l++) {
                    if (address > MAX_CODE_LENGTH) {
                        return null;
                    }
                    if (l > lastAddress) {
                        lastAddress = l;
                    }
                    data[k] = (byte) (Integer.parseInt(record.substring(j, (j + 2)), RADIX));

                    image[l] = data[k];
                    markers[l] = (byte) 1;
                }

                //Compute the sum of hexvalues
                k = 0;
                sum = 0;
                for (j = 1; j < (recordLength - 2); j = j + 2) {
                    hexVals[k] = (byte) (Integer.parseInt(record.substring(j, (j + 2)), RADIX));
                    sum += hexVals[k];
                    k++;
                }

                computedChecksum = (byte) ((sum % 256) * (0xFF));

                checksum = (byte) (Integer.parseInt(record.substring((recordLength - 2),
                        recordLength), RADIX));

                if (computedChecksum != checksum) {
                    return null;
                }
            }
        } catch (IOException ex) {
            return null;
        }

        return image;
    }
}
