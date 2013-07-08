package net.mcs51ide;

import java.awt.Component;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.ListCellRenderer;
import net.mcs51ide.utils.Utils;

public class ProjectListCellRenderer extends JLabel implements ListCellRenderer {

    private final ImageIcon CIcon = new ImageIcon(ProjectListCellRenderer.class.getResource("/resources/sourcec.png"));
    private final ImageIcon HIcon = new ImageIcon(ProjectListCellRenderer.class.getResource("/resources/sourceh.png"));
    private final ImageIcon AsmIcon = new ImageIcon(ProjectListCellRenderer.class.getResource("/resources/sourceasm.gif"));

    // This is the only method defined by ListCellRenderer.
    // We just reconfigure the JLabel each time we're called.
    @Override
    public Component getListCellRendererComponent(
            JList list, // the list
            Object value, // value to display
            int index, // cell index
            boolean isSelected, // is the cell selected
            boolean cellHasFocus) // does the cell have focus
    {
        String s = value.toString();
        setText(s);
        if (isSelected) {
            setBackground(list.getSelectionBackground());
            setForeground(list.getSelectionForeground());
        } else {
            setBackground(list.getBackground());
            setForeground(list.getForeground());
        }
        setEnabled(list.isEnabled());
        setFont(list.getFont());
        setOpaque(true);
        switch (Utils.getExtension(s).toLowerCase()) {
            case "c":
                this.setIcon(CIcon);
                break;
            case "h":
                this.setIcon(HIcon);
                break;
            case "asm":
                this.setIcon(AsmIcon);
                break;
        }
        return this;
    }
}
