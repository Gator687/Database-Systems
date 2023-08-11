import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Welcome to database");
        Statement sqlst;    //runs SQL
        //String useSQL = new String("use mysql");
        String output;
        ResultSet result;   //holds the output from the SQL
        String SQL = "select * from mysql";
        try{
            Class.forName("com.mysql.jbdc.Driver");
            String dbURL = "jdbc:mysql://localhost:3305/mysql";
            Connection dbConnect = DriverManager.getConnection(dbURL, "root", "");
            sqlst = dbConnect.createStatement();    //allows SQL to be executed
            result = sqlst.executeQuery(SQL);
            //result holds the output from the SQL
            while(result.next() !=false){
                output = result.getString("Host");
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
            System.out.println("SQL is BAD!!" + ex.getMessage());
        }
    }
}
