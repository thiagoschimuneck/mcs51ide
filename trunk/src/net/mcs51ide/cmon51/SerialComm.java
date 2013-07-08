package net.mcs51ide.cmon51;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
import gnu.io.CommPortIdentifier;
import gnu.io.NoSuchPortException;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.TooManyListenersException;
import javax.swing.JOptionPane;
import net.mcs51ide.MainIDE;

/**
 *
 * @author prototipo
 */
public class SerialComm implements SerialPortEventListener {

    private SerialPort port;
    protected InputStream inputStream;
    protected OutputStream outputStream;
    protected BufferedReader input;
    protected PrintWriter output;

    public SerialComm() {
        this.inputStream = null;
        this.outputStream = null;
    }

    public boolean openPort(String portName) {
        if (this.port == null) {
            try {
                CommPortIdentifier portId = CommPortIdentifier.getPortIdentifier(portName);
                if (portId != null) {

                    SerialPort serialPort = (SerialPort) portId.open(this.getClass().getName(), 2000);
                    this.port = serialPort;
                    this.port.enableReceiveTimeout(1);

                    inputStream = serialPort.getInputStream();
                    outputStream = serialPort.getOutputStream();

                    serialPort.setSerialPortParams(57600, SerialPort.DATABITS_8,
                            SerialPort.STOPBITS_2, SerialPort.PARITY_NONE);
                    this.port.setFlowControlMode(SerialPort.FLOWCONTROL_NONE);
                    try {
                        port.addEventListener(this);
                    } catch (TooManyListenersException ex) {
                        return false;
                    }

                }
            } catch (NoSuchPortException ex) {
                JOptionPane.showMessageDialog(MainIDE.getInstance(), "Erro abrindo porta!", "Erro", JOptionPane.ERROR_MESSAGE);
                return false;
            } catch (PortInUseException e) {
                JOptionPane.showMessageDialog(MainIDE.getInstance(), "Erro abrindo porta!", "Erro", JOptionPane.ERROR_MESSAGE);
                return false;
            } catch (IOException e) {
                JOptionPane.showMessageDialog(MainIDE.getInstance(), "Erro abrindo porta!", "Erro", JOptionPane.ERROR_MESSAGE);
                return false;
            } catch (UnsupportedCommOperationException e) {
                JOptionPane.showMessageDialog(MainIDE.getInstance(), "Erro abrindo porta!", "Erro", JOptionPane.ERROR_MESSAGE);
                return false;
            }
            return true;
        }
        return true;
    }

    public void close() {
        if (this.port != null) {
            this.port.close();
        }
    }

    public void enableListener(boolean e) {
        this.port.notifyOnDataAvailable(e);
    }

    /**
     * Get the Port Identifier
     *
     */
    public HashMap getAvaliablePorts() {
        HashMap avaliablePorts = new HashMap();
        Enumeration portList = CommPortIdentifier.getPortIdentifiers();
        while (portList.hasMoreElements()) {
            CommPortIdentifier portId = (CommPortIdentifier) portList.nextElement();
            if (portId.getPortType() == CommPortIdentifier.PORT_SERIAL) {
                avaliablePorts.put(portId.getName(), portId);
            }
        }
        return avaliablePorts;
    }

    public void sendSpace() {
        try {
            outputStream.write(0x20);
            outputStream.flush();
            Thread.sleep(50);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void sendCommand(String cmd) {
        try {
            outputStream.write(cmd.getBytes());
            outputStream.write(0xD);
            outputStream.flush();
            Thread.sleep(10);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void sendEndLine() {
        try {
            outputStream.write(0xD);
            outputStream.flush();
            Thread.sleep(10);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void sendData(String dat) {
        try {
            outputStream.write(dat.getBytes());
            outputStream.flush();
            Thread.sleep(10);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public String readAll() {
        int i = 0, offset = 0, t;
        byte[] buf = new byte[8196];
        t = 100;
        while ((t--) > 0) {
            try {
                Thread.sleep(1);
                i = inputStream.read(buf, offset, 1024);
                offset += i;
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return new String(buf, 0, offset);
    }
    public String readBytesNum(int qtd) {
        int i = 0, offset = 0, t;
        byte[] buf = new byte[1024];
        t = 20;
        while ((t--) > 0 && offset < qtd) {
            try {
                Thread.sleep(1);
                i = inputStream.read(buf, offset, 128);
                offset += i;
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return new String(buf, 0, offset);
    }

    @Override
    public void serialEvent(SerialPortEvent spe) {
        if (spe.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
            System.out.println("Tem dados");
        }
    }
}
