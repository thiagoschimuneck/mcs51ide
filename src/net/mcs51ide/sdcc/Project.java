/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package net.mcs51ide.sdcc;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import net.mcs51ide.utils.Utils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author thiago
 */
public class Project {

    private String name;
    private File projectFile;
    private List sourceFiles;
    private int codeLoc;
    private String absPath;
    private String outIHXName;

    public Project() {
        this.sourceFiles = new ArrayList();
        this.projectFile = new File("Sem Nome");
        this.absPath = "";
        this.name = "Project1";
        this.outIHXName = null;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the cFiles
     */
    public List getSourceFiles() {
        return sourceFiles;
    }

    public boolean addSourceFile(SourceFile f) {
        for (int i = 0; i < this.sourceFiles.size(); i++) {
            SourceFile src = (SourceFile) this.sourceFiles.get(i);
            if (Utils.removeExtension(src.getFileName()).equals(Utils.removeExtension(f.getFileName()))) {
                return false;
            }
        }
        this.sourceFiles.add(f);
        f.setProject(this);
        return true;
    }

    public void remSourceFile(SourceFile f) {
        this.sourceFiles.remove(f);
    }

    public int getCodeLoc() {
        return codeLoc;
    }

    public void setCodeLoc(int codeLoc) {
        this.codeLoc = codeLoc;
    }

    /**
     * @return the absPath
     */
    public String getAbsPath() {
        return absPath;
    }

    /**
     * @param absPath the absPath to set
     */
    public void setAbsPath(String absPath) {
        this.absPath = absPath;
    }

    public void loadFromFile(String fileName) {
        DocumentBuilderFactory dbf =
                DocumentBuilderFactory.newInstance();

        DocumentBuilder docBuilder;
        try {
            docBuilder = dbf.newDocumentBuilder();
            File f = new File(fileName);
            Document doc = docBuilder.parse(f);
            this.setAbsPath(f.getParent());
            Element projectTag = doc.getDocumentElement();
            this.setName(projectTag.getAttribute("name"));
            Element mcs51 = (Element) projectTag.getElementsByTagName("mcs51").item(0);
            NodeList sources = mcs51.getChildNodes();
            List newSources = new ArrayList();
            for (int i = 0; i < sources.getLength(); i++) {
                Element mySource = (Element) sources.item(i);
                SourceFile source = new SourceFile();
                source.setFileName(mySource.getAttribute("name"));
                source.setType(mySource.getAttribute("type"));
                source.setProject(this);
                newSources.add(source);
            }
            this.sourceFiles = newSources;
        } catch (SAXException ex) {
            Logger.getLogger(Project.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Project.class
                    .getName()).log(Level.SEVERE, null, ex);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(Project.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean writeToFile(String fileName) {
        try {

            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

            // root elements
            Document doc = docBuilder.newDocument();
            Element projectElement = doc.createElement("project");
            projectElement.setAttribute("absPath", this.getAbsPath());
            projectElement.setAttribute("name", this.getName());
            doc.appendChild(projectElement);

            Element mcs51 = doc.createElement("mcs51");
            projectElement.appendChild(mcs51);

            for (Iterator i = this.sourceFiles.iterator(); i.hasNext();) {
                SourceFile sFile = (SourceFile) i.next();
                Element source = doc.createElement("source");
                source.setAttribute("type", sFile.getType());
                source.setAttribute("name", sFile.getFileName());
                mcs51.appendChild(source);
            }

            // write the content into xml file
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            DOMSource source = new DOMSource(doc);
            File f = new File(fileName);
            StreamResult result = new StreamResult(f);
            this.setAbsPath(f.getParent());

            transformer.transform(source, result);
            return true;

        } catch (ParserConfigurationException | TransformerException pce) {
            return false;
        }
    }

    /**
     * @return the projectFile
     */
    public File getProjectFile() {
        return projectFile;
    }

    public String getLinkFileName() {
        String lf = this.getAbsPath().concat(File.separator).concat(this.getName());
        lf = Utils.putExtension(lf, "lnk");
        return lf;
    }

    public boolean createLinkFile() {
        FileWriter fw;
        try {
            this.outIHXName = null;
            fw = new FileWriter(this.getLinkFileName());
            fw.write("-myuxiz" + System.lineSeparator());
            fw.write("-Y" + System.lineSeparator());
            fw.write("-v 0x0100" + System.lineSeparator());
            fw.write("-w 0x2000" + System.lineSeparator());
            fw.write("-b HOME = 0x2000" + System.lineSeparator());
            fw.write("-b XSEG = 0x0000" + System.lineSeparator());
            fw.write("-b PSEG = 0x0000" + System.lineSeparator());
            fw.write("-b ISEG = 0x0000" + System.lineSeparator());
            fw.write("-b BSEG = 0x0000" + System.lineSeparator());
            fw.write("-k /usr/bin/../share/sdcc/lib/small" + System.lineSeparator());
            fw.write("-k /usr/share/sdcc/lib/small" + System.lineSeparator());
            fw.write("-l mcs51" + System.lineSeparator());
            fw.write("-l libsdcc" + System.lineSeparator());
            fw.write("-l libint" + System.lineSeparator());
            fw.write("-l liblong" + System.lineSeparator());
            fw.write("-l libfloat" + System.lineSeparator());
            for (int i = 0; i < this.sourceFiles.size(); i++) {
                SourceFile src = (SourceFile) this.sourceFiles.get(i);
                if (src.getType().equals("c") || src.getType().equals("asm")) {
                    String ffn = Utils.removeExtension(src.getFileName());
                    if (this.outIHXName == null) {
                        this.outIHXName = ffn;
                    }
                    ffn = Utils.putExtension(ffn, "rel");
                    fw.write(ffn + System.lineSeparator());
                }
            }
            fw.write("-e" + System.lineSeparator());
            fw.close();
        } catch (IOException ex) {
            return false;
        }
        return true;
    }

    public static boolean createAsmLinkFile(String linkFName, String asmFName) {
        FileWriter fw;
        try {
            fw = new FileWriter(linkFName);
            fw.write("-myuxiz" + System.lineSeparator());
            fw.write("-Y" + System.lineSeparator());
            fw.write("-v 0x0100" + System.lineSeparator());
            fw.write("-w 0x2000" + System.lineSeparator());
            //fw.write("-b HOME = 0x2000" + System.lineSeparator());
            //fw.write("-b XSEG = 0x0000" + System.lineSeparator());
            //fw.write("-b PSEG = 0x0000" + System.lineSeparator());
            //fw.write("-b ISEG = 0x0000" + System.lineSeparator());
            //fw.write("-b BSEG = 0x0000" + System.lineSeparator());
            fw.write("-k /usr/bin/../share/sdcc/lib/small" + System.lineSeparator());
            fw.write("-k /usr/share/sdcc/lib/small" + System.lineSeparator());
            fw.write("-l mcs51" + System.lineSeparator());
            fw.write("-l libsdcc" + System.lineSeparator());
            fw.write("-l libint" + System.lineSeparator());
            fw.write("-l liblong" + System.lineSeparator());
            fw.write("-l libfloat" + System.lineSeparator());
            fw.write(asmFName + System.lineSeparator());
            fw.write("-e" + System.lineSeparator());
            fw.close();
        } catch (IOException ex) {
            return false;
        }
        return true;
    }

    public String getAllRelFiles() {
        String ret="";
        for (int i = 0; i < this.sourceFiles.size(); i++) {
            SourceFile src = (SourceFile) this.sourceFiles.get(i);
            if (src.getType().equals("c") || src.getType().equals("asm")) {
                String ffn = Utils.removeExtension(src.getFileName());
                ret = ret.concat(" ").concat(Utils.putExtension(ffn, "rel"));
            }
        }
        return ret;
    }

    public String getRealAbsName(String fName) {
        for (int i = 0; i < this.sourceFiles.size(); i++) {
            SourceFile src = (SourceFile) this.sourceFiles.get(i);
            if (src.getFileName().toLowerCase().equals(fName)) {
                return src.getFullFileName();
            }
        }
        return null;
    }

    public String getOutName() {
        return this.getAbsPath().concat(File.separator).concat(this.outIHXName);
    }

    public String getFinalIHXName() {
        return Utils.putExtension(this.getAbsPath().concat(File.separator).concat(this.getName()), "ihx");
    }

    public String getFinalCDBName() {
        return Utils.putExtension(this.getAbsPath().concat(File.separator).concat(this.getName()), "cdb");
    }
}
