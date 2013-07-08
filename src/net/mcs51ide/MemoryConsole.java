package net.mcs51ide;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumn;
import net.mcs51ide.cmon51.CMON51Interface;
import net.mcs51ide.sdcc.VariableInfo;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
public class MemoryConsole extends JPanel {

    private JTable table;
    private JScrollPane sp;
    private JPanel pLoc;
    private JTextField tAddr;
    private JButton btnUpdate;
    private boolean noUpd;
    private boolean externInstance;
    private JComboBox cbType;

    public MemoryConsole(boolean extern) {
        this.externInstance = extern;
        this.setLayout(new BorderLayout());
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("-");
        model.addColumn("0");
        model.addColumn("1");
        model.addColumn("2");
        model.addColumn("3");
        model.addColumn("4");
        model.addColumn("5");
        model.addColumn("6");
        model.addColumn("7");
        model.addColumn("8");
        model.addColumn("9");
        model.addColumn("A");
        model.addColumn("B");
        model.addColumn("C");
        model.addColumn("D");
        model.addColumn("E");
        model.addColumn("F");
        model.addRow(new Object[]{"00", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        model.addRow(new Object[]{"10", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        model.addRow(new Object[]{"20", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        model.addRow(new Object[]{"30", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        model.addRow(new Object[]{"40", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        model.addRow(new Object[]{"50", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        model.addRow(new Object[]{"60", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        model.addRow(new Object[]{"70", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        if (!externInstance) {
            model.addRow(new Object[]{"80", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
            model.addRow(new Object[]{"90", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
            model.addRow(new Object[]{"A0", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
            model.addRow(new Object[]{"B0", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
            model.addRow(new Object[]{"C0", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
            model.addRow(new Object[]{"D0", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
            model.addRow(new Object[]{"E0", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
            model.addRow(new Object[]{"F0", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF", "FF"});
        }

        this.table = new JTable(model);

        this.table.setRowHeight(20);
        this.noUpd = false;

        this.table.getModel()
                .addTableModelListener(new TableModelListener() {
            @Override
            public void tableChanged(TableModelEvent e) {
                if (noUpd) {
                    return;
                }
                DefaultTableModel model = (DefaultTableModel) e.getSource();
                TableModelListener[] tml = model.getTableModelListeners();
                model.removeTableModelListener(tml[0]);
                if (e.getType() == TableModelEvent.UPDATE) {
                    if (e.getColumn() > 0) {
                        if (e.getFirstRow() == e.getLastRow()) {
                            if (externInstance) {
                                String uAddr = (String) model.getValueAt(e.getFirstRow(), 0);
                                if (!uAddr.trim().equals("")) {
                                    int addr = Integer.parseInt(uAddr, 16) + e.getColumn() - 1;
                                    String value = (String) model.getValueAt(e.getFirstRow(), e.getColumn());
                                    CMON51Interface cMon = MainIDE.getInstance().getCMon51();
                                    if (!cMon.isRunning()) {
                                        return;
                                    }
                                    int iValue[] = new int[1];
                                    iValue[0] = Integer.parseInt(value, 16);
                                    cMon.writeXData(addr, iValue);
                                }
                            } else {
                                int addr = e.getFirstRow() * 16 + e.getColumn() - 1;
                                String value = (String) model.getValueAt(e.getFirstRow(), e.getColumn());
                                CMON51Interface cMon = MainIDE.getInstance().getCMon51();
                                if (!cMon.isRunning()) {
                                    return;
                                }
                                int iValue[] = new int[1];
                                iValue[0] = Integer.parseInt(value, 16);
                                cMon.writeDData(addr, iValue);
                            }
                        }
                    }
                }
                model.addTableModelListener(tml[0]);
            }
        });
        for (int vColIndex = 0; vColIndex < model.getColumnCount(); vColIndex++) {
            table.getColumnModel().getColumn(vColIndex).setCellRenderer(new MyBoxRenderer());
        }
        this.sp = new JScrollPane(this.table);
        this.pLoc = new JPanel(new FlowLayout());
        ((FlowLayout) this.pLoc.getLayout()).setAlignment(FlowLayout.LEFT);
        if (externInstance) {
            this.pLoc.add(new JLabel("Endereço externo:"));
            this.tAddr = new JTextField();
            this.tAddr.setColumns(8);
            this.pLoc.add(this.tAddr);
        }
        this.cbType = new JComboBox(new Object[]{"Hex", "Dec", "Ascii"});
        this.cbType.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                table.repaint();
            }
        });
        this.pLoc.add(this.cbType);
        this.add(this.pLoc, BorderLayout.NORTH);

        this.add(this.sp, BorderLayout.CENTER);
        this.btnUpdate = new JButton();

        this.btnUpdate.setText("Atualizar Memória");
        this.btnUpdate.setEnabled(false);
        this.add(this.btnUpdate, BorderLayout.SOUTH);
        if (!externInstance) {
            this.btnUpdate.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    CMON51Interface cMon = MainIDE.getInstance().getCMon51();
                    String[] iMem = null;
                    iMem = cMon.readBlockDData();
                    MemoryConsole mc = MainIDE.getInstance().getPaneOutputs().getMemoryInternalConsole();
                    mc.setInternalMemoryValues(iMem);
                }
            });
        } else {
            this.btnUpdate.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    CMON51Interface cMon = MainIDE.getInstance().getCMon51();
                    MemoryConsole mc = MainIDE.getInstance().getPaneOutputs().getMemoryExternalConsole();
                    String[] iMem = null;
                    if (mc.getUserAddr() > -1) {
                        iMem = cMon.readBlockXData(mc.getUserAddr());
                        mc.setExternalMemoryValues(mc.getUserAddr(), iMem);
                    }
                }
            });

        }
    }

    public void setUpdateButtonEnabled(boolean e) {
        this.btnUpdate.setEnabled(e);
    }

    public void setInternalMemoryValues(String[] values) {
        noUpd = true;
        DefaultTableModel model = (DefaultTableModel) this.table.getModel();
        for (int d = 0; d < values.length; d++) {
            model.setValueAt(values[d], d / 16, d % 16 + 1);
        }
        noUpd = false;
    }

    public void setExternalMemoryValues(int startAddr, String[] values) {
        noUpd = true;
        startAddr = startAddr / 16;
        startAddr = startAddr * 16;
        DefaultTableModel model = (DefaultTableModel) this.table.getModel();
        for (int d = 0; d < values.length; d++) {
            model.setValueAt(values[d], d / 16, d % 16 + 1);
            if (d % 16 == 0) {
                String sAddr = Integer.toString(startAddr, 16);
                while (sAddr.length() < 4) {
                    sAddr = "0".concat(sAddr);
                }
                model.setValueAt(sAddr, d / 16, 0);
                startAddr += 16;
            }
        }
        noUpd = false;
    }

    public int getUserAddr() {
        try {
            int uAddr = Integer.parseInt(this.tAddr.getText(), 16);
            return uAddr;
        } catch (Exception e) {
            return -1;
        }
    }

    public class MyBoxRenderer extends JLabel implements TableCellRenderer {

        public MyBoxRenderer() {
            super();
        }

        @Override
        public Component getTableCellRendererComponent(JTable table,
                Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            if (column > 0) {
                switch (cbType.getSelectedIndex()) {
                    case 0:
                        this.setText((String) value);
                        break;
                    case 1:
                        this.setText(Integer.toString(Integer.parseInt((String) value, 16)));
                        break;
                    case 2:
                        byte[] bValue = new byte[]{(byte) Integer.parseInt((String) value, 16)};
                        this.setText(new String(bValue));
                        break;
                    default:
                        this.setText("-");
                }
                this.setForeground(table.getForeground());
                this.setBackground(table.getBackground());
            } else {
                this.setText((String) value);
                this.setBackground(new JButton().getBackground());
            }
            this.setOpaque(true);
            this.setHorizontalAlignment(JLabel.CENTER);
            return this;
        }
    }
}
