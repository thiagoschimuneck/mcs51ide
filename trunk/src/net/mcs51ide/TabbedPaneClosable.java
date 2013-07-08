package net.mcs51ide;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author thiago
 */
public class TabbedPaneClosable extends JTabbedPane implements ActionListener {

    public TabbedPaneClosable() {
        super();
    }

    @Override
    public void addTab(String title, Component component) {
        super.addTab(title, component);
        JButton closeButton = new JButton();
        int count = this.getTabCount() - 1;
        closeButton.setActionCommand("" + count);
        closeButton.addActionListener(this);
        closeButton.setIcon(new ImageIcon(getClass().getResource("/resources/close.png")));
        closeButton.setBorderPainted(false);
        closeButton.setPreferredSize(new Dimension(16, 16));
        JPanel pnl = new JPanel();
        pnl.setOpaque(false);
        JLabel lblTitle = new JLabel(title);
        pnl.add(lblTitle);
        pnl.add(closeButton);
        this.setTabComponentAt(this.getTabCount() - 1, pnl);
        if (component instanceof SourceTextEditor) {
            ((SourceTextEditor) component).setTabLabel(lblTitle);
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        JButton btn = (JButton) e.getSource();
        String s1 = btn.getActionCommand();
        for (int i = 0; i < this.getTabCount(); i++) {
            JPanel pnl = (JPanel) this.getTabComponentAt(i);
            btn = (JButton) pnl.getComponent(1);
            String s2 = btn.getActionCommand();
            if (s1.equals(s2)) {
                SourceTextEditor ed = (SourceTextEditor) this.getComponentAt(i);
                this.removeTabAt(i);
                break;
            }
        }
    }
}
