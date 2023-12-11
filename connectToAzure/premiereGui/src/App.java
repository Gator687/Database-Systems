/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

 import java.sql.Connection;
 import java.sql.DriverManager;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.sql.Statement;
 
 import javax.swing.DefaultComboBoxModel;
 import javax.swing.DefaultListModel;
 import javax.swing.JOptionPane;
 
 /**
  *
  * @author Thomas
  */
 public class App extends javax.swing.JFrame {
     Statement sqlst;
     ResultSet result;
     String dbURL = "jdbc:mysql://localhost:3306/premiere";
     Connection dbConnect;
     private DefaultComboBoxModel<Customer> authorDrop = new DefaultComboBoxModel<Customer>();
     int firstRun = 1;
     private DefaultListModel<PartOrdered> bookModel = new DefaultListModel<PartOrdered>();
     
     void connectDatabase(){
         this.setTitle("Connected");
             
         try{
             Class.forName("com.mysql.jdbc.Driver");
             dbConnect = DriverManager.getConnection(dbURL, "root", "");
             sqlst = dbConnect.createStatement();
         }
         catch(Exception ex){
             JOptionPane.showMessageDialog(this, "Loading error " + ex.getMessage());
             this.setTitle("Not connected");
             System.exit(1);
         }
     }
 
     public void fillDropDown(){
         String SQL = "select * from customer order by customerName";
         Customer aCustomer = new Customer("Select a Customer",-1);
 
         //change the default Combo Box Model
         this.jComboBox1.setModel(authorDrop);
         authorDrop.addElement(aCustomer);
 
         try{
             result = sqlst.executeQuery(SQL);
             while (result.next()) {
                 aCustomer = new Customer(result.getString("CustomerName"),result.getInt("CustomerNum"));
                 authorDrop.addElement(aCustomer);
             }
         }
         catch(SQLException ex){
             JOptionPane.showMessageDialog(this, "Customer fill error" + ex.getMessage());
         }
     }
 
     public void fillBookList(){
         String SQL;
         Customer picked = (Customer) this.jComboBox1.getSelectedItem();
         //SQL = String.format("select c.customerName, c.customerNum, ol.orderNum p.description from customer as c join orders as o on c.customerNum = o.customerNum join orderLine as ol on o.orderNum = ol.orderNum join part as p on ol.partNum = p.partNum",picked.getCustomerNum());
         SQL = String.format("select description from customer c join orders o on c.customerNum = o.customerNum join orderLine ol on o.orderNum = ol.orderNum join part p on ol.partNum = p.partNum where o.customerNum=%d group by description",picked.getCustomerNum());
 
         //System.out.println(SQL);
         bookModel.clear();
         try{
             result = sqlst.executeQuery(SQL);
             while(result.next()){
                 PartOrdered part = new PartOrdered(result.getString("description"));
                 bookModel.addElement(part);
             }
         }
         catch(SQLException ex){
             JOptionPane.showMessageDialog(this, "List error " + ex.toString());
         }
     }
     /**
      * Creates new form HenryDropPracticeForm
      */
     public App() {
         initComponents();
         connectDatabase();
 
         this.jList1.setModel(bookModel);
         fillDropDown();
     }
 
     /**
      * This method is called from within the constructor to initialize the form.
      * WARNING: Do NOT modify this code. The content of this method is always
      * regenerated by the Form Editor.
      */
     //@SuppressWarnings("unchecked")
     // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
     private void initComponents() {
 
         jPanel1 = new javax.swing.JPanel();
         jLabel1 = new javax.swing.JLabel();
         jLabel2 = new javax.swing.JLabel();
         jComboBox1 = new javax.swing.JComboBox<>();
         jScrollPane1 = new javax.swing.JScrollPane();
         jList1 = new javax.swing.JList<>();
 
         setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
 
         jLabel1.setText("Customer Label");
 
         jLabel2.setText("Ordered parts");
 
         //jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
         jComboBox1.addActionListener(new java.awt.event.ActionListener() {
             public void actionPerformed(java.awt.event.ActionEvent evt) {
                 jComboBox1ActionPerformed(evt);
             }
         });
 
         // jList1.setModel(new javax.swing.AbstractListModel<BookAndPrice>() {
         //     String[] strings = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" };
         //     public int getSize() { return strings.length; }
         //     public String getElementAt(int i) { return strings[i]; }
         // });
         jScrollPane1.setViewportView(jList1);
 
         javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
         jPanel1.setLayout(jPanel1Layout);
         jPanel1Layout.setHorizontalGroup(
             jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
             .addGroup(jPanel1Layout.createSequentialGroup()
                 .addContainerGap()
                 .addComponent(jLabel1)
                 .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 301, Short.MAX_VALUE)
                 .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                 .addGap(209, 209, 209))
             .addGroup(jPanel1Layout.createSequentialGroup()
                 .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 285, javax.swing.GroupLayout.PREFERRED_SIZE)
                 .addGap(34, 34, 34)
                 .addComponent(jScrollPane1))
         );
         jPanel1Layout.setVerticalGroup(
             jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
             .addGroup(jPanel1Layout.createSequentialGroup()
                 .addContainerGap()
                 .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                     .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                     .addComponent(jLabel2))
                 .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                 .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                     .addGroup(jPanel1Layout.createSequentialGroup()
                         .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                         .addGap(339, 339, 339))
                     .addGroup(jPanel1Layout.createSequentialGroup()
                         .addComponent(jScrollPane1)
                         .addContainerGap())))
         );
 
         javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
         getContentPane().setLayout(layout);
         layout.setHorizontalGroup(
             layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
             .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
         );
         layout.setVerticalGroup(
             layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
             .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
         );
 
         pack();
     }// </editor-fold>//GEN-END:initComponents
 
     private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt){
         if(firstRun == 1){
             firstRun = 0;
             return;
         }
         fillBookList();
     }//GEN-LAST:event_jComboBox1ActionPerformed
 
     /**
      * @param args the command line arguments
      */
     public static void main(String args[]) {
         /* Set the Nimbus look and feel */
         //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
         /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
          * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
          */
         try {
             for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                 if ("Nimbus".equals(info.getName())) {
                     javax.swing.UIManager.setLookAndFeel(info.getClassName());
                     break;
                 }
             }
         } catch (ClassNotFoundException ex) {
             java.util.logging.Logger.getLogger(App.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
         } catch (InstantiationException ex) {
             java.util.logging.Logger.getLogger(App.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
         } catch (IllegalAccessException ex) {
             java.util.logging.Logger.getLogger(App.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
         } catch (javax.swing.UnsupportedLookAndFeelException ex) {
             java.util.logging.Logger.getLogger(App.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
         }
         //</editor-fold>
 
         /* Create and display the form */
         java.awt.EventQueue.invokeLater(new Runnable() {
             public void run() {
                 new App().setVisible(true);
             }
         });
     }
 
     // Variables declaration - do not modify//GEN-BEGIN:variables
     private javax.swing.JComboBox<Customer> jComboBox1;
     private javax.swing.JLabel jLabel1;
     private javax.swing.JLabel jLabel2;
     private javax.swing.JList<PartOrdered> jList1;
     private javax.swing.JPanel jPanel1;
     private javax.swing.JScrollPane jScrollPane1;
     // End of variables declaration//GEN-END:variables
 }