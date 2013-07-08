/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 *
 * @author thiago
 */
public class TargetPortConfiguration extends JDialog {

    public TargetPortConfiguration() {
        super(MainIDE.getInstance(), JDialog.ModalityType.APPLICATION_MODAL);
        this.setSize(new Dimension(320, 200));
        this.setResizable(false);
        final JDialog dialog = this;
        JPanel p = new JPanel();

        p.setLayout(new BoxLayout(p, BoxLayout.PAGE_AXIS));

        final JComboBox cPorts = new JComboBox();
        HashMap m = MainIDE.getInstance().getCMon51().getAvaliablePorts();
        if (m.size() > 0) {
            Set s = m.keySet();
            Iterator i = s.iterator();
            while (i.hasNext()) {
                String item = i.next().toString();
                cPorts.addItem(item);
                if (MainIDE.getInstance().getSerialPort().equals(item)) {
                    cPorts.setSelectedItem(item);
                }
            }
        }
        p.add(new JLabel("Porta:"));
        p.add(cPorts);
        JButton bOk = new JButton("Ok");
        bOk.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                MainIDE.getInstance().setSerialPort((String)cPorts.getSelectedItem());
                dialog.dispose();
            }
        });
        p.add(bOk);
        JButton bCancel = new JButton("Cancelar");
        bCancel.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dialog.dispose();
            }
        });
        p.add(bCancel);

        this.add(p);
    }
}
