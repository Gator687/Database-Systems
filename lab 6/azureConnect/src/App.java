import java.util.*;
import java.sql.*;

import javax.swing.JOptionPane;

public class App {
    static String connString = "jdbc:sqlserver://dbthomas.database.windows.net:1433;database=thomasdatabase;user=thomas@dbthomas;password=dbgator@687;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    Connection SQLcnn;
    Statement sqlStatement;
    ResultSet result;
    static Scanner sc = new Scanner(System.in);
    public static void main(String[] args){
        login();
        boolean run = true;
        int input;
        List<String> order = new ArrayList<>();
        while(run == true){
            System.out.println("Choose one:");
            System.out.println("1.) Show menu");
            System.out.println("2.) Place order");
            System.out.println("3.) Display order");
            System.out.println("4.) exit");
            input = sc.nextInt();

            if(input == 1){
                displayFood();
            }
            else if(input == 2){
                order = getOrder();
                totalOrder(order);
            }
            else if(input == 3){
                displayOrder(order);
            }
            else if(input == 4){
                run = false;
            }
            else{
                System.out.println("invalid");
            }
        }
    }

    public static void login(){
        try{
            Connection SQLcnn = DriverManager.getConnection(connString);
            //JOptionPane.showMessageDialog(null, "SQL server connection successfully");
            Statement azureSt = SQLcnn.createStatement();
            ResultSet results = null;
            String SQL = "select * from dbo.labCustomer";
            String username;
            boolean cont = false;
            while(cont == false){
                System.out.print("Login: ");
                username = sc.nextLine();

                results = azureSt.executeQuery(SQL);
                while(results.next()){
                    if(username.equalsIgnoreCase(results.getString("name"))){
                        cont = true;
                        System.out.println("login successful");
                        break;
                    }
                }
                if(cont == false){
                    System.out.println("Login fail");
                }
            }

            SQLcnn.close();
        }catch (Exception CnnErr) {
            JOptionPane.showMessageDialog(null, "SQL server Connection Problem\n" + CnnErr);
        }
    }

    public static void displayFood(){
        try{
            Connection SQLcnn = DriverManager.getConnection(connString);
            //JOptionPane.showMessageDialog(null, "SQL server connection successfully");
            Statement azureSt = SQLcnn.createStatement();
            ResultSet results = null;
            String SQL = "select * from dbo.labfood order by cost";

            results = azureSt.executeQuery(SQL);
            while(results.next()){
            String output;
            output = String.format("%s: $%.2f", results.getString("food"), results.getFloat("cost"));
            System.out.println(output);
            }
            SQLcnn.close();
        }catch (Exception CnnErr) {
            JOptionPane.showMessageDialog(null, "SQL server Connection Problem\n" + CnnErr);
        }
    }

    public static List getOrder(){
        List<String> order = new ArrayList<>();
        try{
            Connection SQLcnn = DriverManager.getConnection(connString);
            //JOptionPane.showMessageDialog(null, "SQL server connection successfully");
            Statement azureSt = SQLcnn.createStatement();
            ResultSet results = null;
            String SQL = "select * from dbo.labfood order by cost";

            
            String foodOrder;
            boolean done = false;
            while(!done){
                System.out.println("Order item or type done:");
                foodOrder = sc.nextLine();
                results = azureSt.executeQuery(SQL);
                while(results.next()){
                    if(foodOrder.equalsIgnoreCase(results.getString("food"))){
                        order.add(foodOrder);
                        System.out.println("Item added");
                    }
                    else if(foodOrder.equalsIgnoreCase("done")){
                        done = true;
                    }
                }
            }
            SQLcnn.close();
            return order;
        }catch (Exception CnnErr) {
            JOptionPane.showMessageDialog(null, "SQL server Connection Problem\n" + CnnErr);
            return order;
        }
    }

    public static void totalOrder(List<String> order){
        try{
            Connection SQLcnn = DriverManager.getConnection(connString);
            //JOptionPane.showMessageDialog(null, "SQL server connection successfully");
            Statement azureSt = SQLcnn.createStatement();
            ResultSet results = null;
            double total = 0;

            for(String item : order){
                
                String SQL = "select * from dbo.labfood where food = '" + item + "';";
                results = azureSt.executeQuery(SQL);
                while(results.next()){
                    total += results.getDouble("cost");
                }
            }

            System.out.println("Total: $" + total);
            SQLcnn.close();
        }catch (Exception CnnErr) {
            JOptionPane.showMessageDialog(null, "SQL server Connection Problem\n" + CnnErr);
        }
    }

    public static void displayOrder(List<String> order){
        try{
            Connection SQLcnn = DriverManager.getConnection(connString);
            //JOptionPane.showMessageDialog(null, "SQL server connection successfully");
            Statement azureSt = SQLcnn.createStatement();
            ResultSet results = null;

            for(String item : order){
                
                String SQL = "select * from dbo.labfood where food = '" + item + "';";
                results = azureSt.executeQuery(SQL);
                while(results.next()){
                    System.out.println(results.getString("food")+" $"+results.getFloat("cost"));
                }
            }
            SQLcnn.close();
        }catch (Exception CnnErr) {
            JOptionPane.showMessageDialog(null, "SQL server Connection Problem\n" + CnnErr);
        }
    }
}
