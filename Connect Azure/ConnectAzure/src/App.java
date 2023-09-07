import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class App {
    public static void main(String[] args) throws Exception {
        try{
            Connection SQlCnn = DriverManager.getConnection("jdbc:sqlserver://dbsthomas.database.windows.net:1433;database=thomasdatabase;user=thomas@dbsthomas;password=1dbserver!;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
            
            //JOptionPane.showMessageDialog(null,"SQL Server Connection Successfully");

            Statement azureSt = SQlCnn.createStatement();

            ResultSet results = null;
            String SQL = "select * from premiere.Part order by Description";

            results = azureSt.executeQuery(SQL);
            while(results.next()){
                String output;
                output = String.format("%s costs $%.2f", results.getString("Description"),results.getFloat("Price"));
                System.out.println(output);
            }

            SQlCnn.close();

        }catch(SQLException CnnErr){
            JOptionPane.showMessageDialog(null,"SQL Server Connection Problem\n" + CnnErr);
        }
    }
}
