package italk.ui.bean;

import italk.util.ImageManager;

import javax.swing.Icon;


/**
 * ComboBoxImageItem
 * 
 * @author chenzhihui
 * @email chengnuo128@gmail.com
 */
public class ComboBoxImageItem {
    private Icon icon = null;
    private String text = null;
    private int indent = 0;

    public ComboBoxImageItem(String text, Icon icon, int indent) {
        this.text = text;
        this.icon = icon;
        this.indent = indent;
    }
    public ComboBoxImageItem(String text, String shortName) {
        this.text = text;
        this.icon = ImageManager.getImageIconByShortName(shortName);
        this.indent = 1;
    }
    public ComboBoxImageItem(){
    	
    }

    public String getText() {
        return text;
    }

    public Icon getIcon() {
        return icon;
    }

    public int getIndent() {
        return indent;
    }
}
