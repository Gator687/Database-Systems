import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import javax.swing.*;

public class App extends javax.swing.JFrame {
    private JComboBox<String> customerComboBox;
    private JTextArea productTextArea;

    private Connection sqlConnect;

    public App() {
        connectDatabase();


        //this was during bug-fixing
        // try {   
        //     Class.forName("com.mysql.cj.jdbc.Driver");
        //     String dbUrl = "jdbc:mysql://localhost:3306/premiere";
        //     sqlConnect = DriverManager.getConnection(dbUrl, "root", "");
    
        //     // Successful connection
        //     System.out.println("Connected to the database!");
    
        // } catch (ClassNotFoundException ex) {
        //     // Driver class not found
        //     ex.printStackTrace();
        //     System.exit(1);
    
        // } catch (SQLException ex) {
        //     // SQL exception
        //     ex.printStackTrace();
        //     JOptionPane.showMessageDialog(this, "Database connection error: " + ex.getMessage());
        //     System.exit(1);
        // }

        // Set up GUI components
        customerComboBox = new JComboBox<>();
        productTextArea = new JTextArea(10, 30);
        JScrollPane scrollPane = new JScrollPane(productTextArea);

        JButton addPartButton = new JButton("Add Part");

        JPanel buttonPanel = new JPanel();
        buttonPanel.add(addPartButton);

        // Add components to the frame
        setLayout(new BorderLayout());
        add(customerComboBox, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);
        add(buttonPanel, BorderLayout.SOUTH);

        populateCustomerComboBox();

        // Add action listener to the combo box
        customerComboBox.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                customerComboBoxActionPerformed(evt);
            }
        });

        // Add action listener to the "Add Part" button
        addPartButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                // Show a JOptionPane input dialog to gather part information
        JTextField partNumField = new JTextField();
        JTextField descriptionField = new JTextField();
        JTextField onHandField = new JTextField();
        JTextField classField = new JTextField();
        JTextField warehouseField = new JTextField();
        JTextField priceField = new JTextField();

        JPanel inputPanel = new JPanel();
        inputPanel.setLayout(new GridLayout(6, 2));
        inputPanel.add(new JLabel("Part Number:"));
        inputPanel.add(partNumField);
        inputPanel.add(new JLabel("Description:"));
        inputPanel.add(descriptionField);
        inputPanel.add(new JLabel("On Hand:"));
        inputPanel.add(onHandField);
        inputPanel.add(new JLabel("Class:"));
        inputPanel.add(classField);
        inputPanel.add(new JLabel("Warehouse:"));
        inputPanel.add(warehouseField);
        inputPanel.add(new JLabel("Price:"));
        inputPanel.add(priceField);

        int result = JOptionPane.showConfirmDialog(
            App.this,
            inputPanel,
            "Add New Part",
            JOptionPane.OK_CANCEL_OPTION
        );

        if (result == JOptionPane.OK_OPTION) {
            // Gather input data
            String partNum = partNumField.getText();
            String description = descriptionField.getText();
            int onHand = Integer.parseInt(onHandField.getText());
            String classValue = classField.getText();
            String warehouse = warehouseField.getText();
            double price = Double.parseDouble(priceField.getText());

            // Add the new part to the database using the addNewPart method
            addNewPart(partNum, description, onHand, classValue, warehouse, price);

            // Optionally, you can update the customerComboBox or refresh the UI as needed
        }
            }
        });

        // Set up JFrame properties
        setTitle("Customer Product App");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

 


    private void populateCustomerComboBox() {
        try {
            String query = "SELECT CustomerName FROM Customer";
            PreparedStatement statement = sqlConnect.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                customerComboBox.addItem(resultSet.getString("CustomerName"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private void customerComboBoxActionPerformed(java.awt.event.ActionEvent evt) {
        String selectedCustomer = (String) customerComboBox.getSelectedItem();
        if (selectedCustomer != null) {
            showOrderedProducts(selectedCustomer);
        }
    }

    private void showOrderedProducts(String customerName) {
        productTextArea.setText("");

        try {
            String query = "SELECT p.Description FROM Part p " +
                           "JOIN OrderLine ol ON p.PartNum = ol.PartNum " +
                           "JOIN Orders o ON ol.OrderNum = o.OrderNum " +
                           "JOIN Customer c ON o.CustomerNum = c.CustomerNum " +
                           "WHERE c.CustomerName = ?";
            PreparedStatement statement = sqlConnect.prepareStatement(query);
            statement.setString(1, customerName);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                productTextArea.append(resultSet.getString("Description") + "\n");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Implement the logic for adding a new part to the database
    private void addNewPart(String partNum, String description, int onHand, String classValue, String warehouse, double price) {
        try {
            String query = "INSERT INTO Part (PartNum, Description, OnHand, Class, Warehouse, Price) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = sqlConnect.prepareStatement(query);
            statement.setString(1, partNum);
            statement.setString(2, description);
            statement.setInt(3, onHand);
            statement.setString(4, classValue);
            statement.setString(5, warehouse);
            statement.setDouble(6, price);
            statement.executeUpdate();

            // Show a message indicating success
            JOptionPane.showMessageDialog(this, "New part added successfully!");

            // Clear input fields or update GUI as needed
            // Refresh the combo box or other relevant parts of the UI
        } catch (SQLException ex) {
            ex.printStackTrace();
            // Handle database errors or other exceptions
        }
    }

    public void connectDatabase() {
        try {   
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/premiere";
            sqlConnect = DriverManager.getConnection(dbUrl, "root", "");
    
            // Successful connection
            System.out.println("Connected to the database!");
    
        } catch (ClassNotFoundException ex) {
            // Driver class not found
            ex.printStackTrace();
            System.exit(1);
    
        } catch (SQLException ex) {
            // SQL exception
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Database connection error: " + ex.getMessage());
            System.exit(1);
        }
    }

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new App();
            }
        });
    }
}