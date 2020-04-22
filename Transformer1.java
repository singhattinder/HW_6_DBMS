
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;
public class Transformer1 {
    public static void main(String[] args) {
        String XSL = args[0];
        String IN = args[1];
        String OUT = args[2];

        StreamSource xsl = new StreamSource(new File(XSL));
        StreamSource input = new StreamSource(new File(IN));
        StreamResult output = new StreamResult(new File(OUT));

        try {
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(xsl);
            transformer.transform(input, output);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
