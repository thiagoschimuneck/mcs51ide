package net.mcs51ide;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.DefaultCellEditor;
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
public class RegistersConsole extends JPanel {

    private JTable table;
    private JScrollPane sp;
    private String[] vars = {"A", "B", "SP", "IE", "DPH", "DPL", "PSW", "PC", "R0", "R1", "R2", "R3", "R4", "R5", "R6", "R7"};
    private JComboBox cbVars;
    private JButton btnUpdate;
    private boolean noUpd;

    public RegistersConsole() {
        this.setLayout(new BorderLayout());
        DefaultTableModel model = new DefaultTableModel();
        model.addColumn("Símbolo");
        model.addColumn("Valor");
        model.addRow(new Object[]{"A", "0"});
        model.addRow(new Object[]{"B", "0"});
        model.addRow(new Object[]{"SP", "07"});
        model.addRow(new Object[]{"IE", "0"});
        model.addRow(new Object[]{"DPH", "0"});
        model.addRow(new Object[]{"DPL", "0"});
        model.addRow(new Object[]{"PSW", "0"});
        model.addRow(new Object[]{"PC", "0"});
        model.addRow(new Object[]{"R0", "0"});
        model.addRow(new Object[]{"R1", "0"});
        model.addRow(new Object[]{"R2", "0"});
        model.addRow(new Object[]{"R3", "0"});
        model.addRow(new Object[]{"R4", "0"});
        model.addRow(new Object[]{"R5", "0"});
        model.addRow(new Object[]{"R6", "0"});
        model.addRow(new Object[]{"R7", "0"});
        model.addRow(new Object[]{"DPTR", "0"});
        this.table = new JTable(model);
        this.table.setRowHeight(20);
        noUpd=false;

        this.table.getModel().addTableModelListener(new TableModelListener() {
            @Override
            public void tableChanged(TableModelEvent e) {
                if (noUpd) {
                    return;
                }
                DefaultTableModel model = (DefaultTableModel) e.getSource();
                TableModelListener[] tml = model.getTableModelListeners();
                model.removeTableModelListener(tml[0]);
                if (e.getType() == TableModelEvent.UPDATE) {
                    if (e.getColumn() == 1) {
                        if (e.getFirstRow() == e.getLastRow()) {
                            String varName = (String) model.getValueAt(e.getFirstRow(), 0);
                            String varValue = (String) model.getValueAt(e.getFirstRow(), 1);
                            ArrayList aVar = new ArrayList();
                            aVar.add(varName);
                            CMON51Interface cMon = MainIDE.getInstance().getCMon51();
                            if (cMon.getCdb() != null) {
                                ArrayList bVar = cMon.getDebugVarsCdb(aVar);
                                if (bVar != null && bVar.size() > 0) {
                                    VariableInfo vi = (VariableInfo) bVar.get(0);
                                    vi.setValue(varValue);
                                    cMon.setSymbolValue(vi);
                                }
                            }
                        }
                    }
                }
                model.addTableModelListener(tml[0]);
            }
        });
        int vColIndex = 0;
        TableColumn col = table.getColumnModel().getColumn(vColIndex);
        //col.setCellEditor(new MyComboBoxEditor(this.vars));
        col = table.getColumnModel().getColumn(1);
        col.setCellEditor(new DefaultCellEditor(new JTextField()));
        col.setCellRenderer(new MyBoxRenderer());
        this.sp = new JScrollPane(this.table);
        this.add(this.sp, BorderLayout.CENTER);
        this.btnUpdate = new JButton();
        this.btnUpdate.setText("Atualizar variáveis");
        this.btnUpdate.setEnabled(false);
        this.add(this.btnUpdate, BorderLayout.SOUTH);
        this.btnUpdate.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                CMON51Interface cMon = MainIDE.getInstance().getCMon51();
                RegistersConsole regsCons = MainIDE.getInstance().getPaneOutputs().getRegistersConsole();
                ArrayList names = regsCons.getVarsVisible();
                ArrayList vars = cMon.getDebugVarsCdb(names);
                for (int i = 0; i < vars.size(); i++) {
                    VariableInfo v = (VariableInfo) vars.get(i);
                    v.setValue(cMon.getSymbolValue(v));
                }
                regsCons.setVarsValue(vars);

            }
        });
    }

    public ArrayList getVarsVisible() {
        DefaultTableModel model = (DefaultTableModel) this.table.getModel();
        int i;
        ArrayList r = new ArrayList();
        for (i = 0; i < model.getRowCount(); i++) {
            String v = (String) model.getValueAt(i, 0);
            if (!v.equals("")) {
                r.add(v);
            }
        }
        return r;
    }

    public void setVarsValue(ArrayList vars) {
        noUpd=true;
        DefaultTableModel model = (DefaultTableModel) this.table.getModel();
        /*TableModelListener tml = model.getTableModelListeners()[0];
         model.removeTableModelListener(tml);*/
        int i;
        for (int y = 0; y < vars.size(); y++) {
            VariableInfo vi = (VariableInfo) vars.get(y);
            for (i = 0; i < model.getRowCount(); i++) {
                String v = (String) model.getValueAt(i, 0);
                if (v.startsWith(vi.getName())) {
                    model.setValueAt(vi.getValue(), i, 1);
                }
            }
        }
        //model.addTableModelListener(tml);
        noUpd=false;
    }

    public JComboBox getCbVars() {
        return this.cbVars;
    }

    public void setUpdateButtonEnabled(boolean e) {
        this.btnUpdate.setEnabled(e);
    }

    public class MyBoxRenderer extends JLabel implements TableCellRenderer {

        public MyBoxRenderer() {
            super();
        }

        @Override
        public Component getTableCellRendererComponent(JTable table,
                Object value, boolean isSelected, boolean hasFocus, int row,
                int column) {
            this.setText((String)value + "h - " + Integer.parseInt((String)value, 16)+"d");
            this.setOpaque(true);
            this.setForeground(new Color(255, 0, 0));
            if (isSelected) {
                this.setForeground(new Color(255, 0, 0));
            } else {
                this.setForeground(table.getForeground());
                this.setBackground(new JButton().getBackground());
            }
            return this;
        }
    }

    private class MyComboBoxEditor extends DefaultCellEditor {

        public MyComboBoxEditor(String[] items) {
            super(new JComboBox(items));
            cbVars = (JComboBox) this.getComponent();
        }
    }
}
