
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;
public class Transformer1 {
    public static void main(String[] args) {
        try {
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(new File(args[0])));
            transformer.transform(new StreamSource(new File(args[1])), new StreamResult(new File(args[2])));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
