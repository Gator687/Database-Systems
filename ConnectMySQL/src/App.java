import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Welcome to Premiere");
        Statement sqlst;    //runs SQL
        //String useSQL = new String("use henrybooks");
        String output;
        ResultSet result;   //holds the output from the SQL
        String SQL = "select customername, balance, creditlimit, creditlimit - balance as remaining, lastname, firstname from customer join rep on rep.repnum = customer.repnum order by customername;";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/premiere";
            Connection dbConnect = DriverManager.getConnection(dbURL, "root", "");
            sqlst = dbConnect.createStatement();    //allows SQL to be executed
            result = sqlst.executeQuery(SQL);
            //result holds the output from the SQL
            while(result.next() !=false){
                output = result.getString("CustomerName") + " " + result.getString("balance") + result.getString("creditlimit");
                System.out.println(output);
            }
            sqlst.close();
        }
        catch(ClassNotFoundException ex){
            Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Class not found, check the JAR");
        }
        catch (SQLException ex){
            Logger.getLogger(App.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("SQL is BAD!! " + ex.getMessage());
        }
    }
}
