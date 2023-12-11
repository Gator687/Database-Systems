import java.sql.*;

import javax.swing.JOptionPane;

public class App {
    public static void main(String[] args){
        try{
            Connection SQLcnn = DriverManager.getConnection("jdbc:sqlserver://dbthomas.database.windows.net:1433;database=thomasdatabase;user=thomas@dbthomas;password=dbgator@687;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
            //JOptionPane.showMessageDialog(null, "SQL server connection successfully");
            Statement azureSt = SQLcnn.createStatement();
            ResultSet results = null;
            String SQL = "select * from dbo.part order by description";

            results = azureSt.executeQuery(SQL);
            while(results.next()){
            String output;
            output = String.format("%s costs $%.2f", results.getString("Description"), results.getFloat("Price"));
            System.out.println(output); 
        }
            SQLcnn.close();
        }catch (Exception CnnErr) {
            JOptionPane.showMessageDialog(null, "SQL server Connection Problem\n" + CnnErr);
        }
    }
}
