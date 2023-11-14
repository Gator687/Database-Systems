package henrydroppractice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class HenryDropPracticeForm extends javax.swing.JFrame {
    private Statement sqlStatement;
    private ResultSet result;
    private String mySqlURL = "jdbc:mysql://127.0.0.1:3306/henrybooks";
    Connection sqlConnect;
    void connectDatabase(){
        this.setTitle("Connected");

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            sqlConnect = DriverManager.getConnection(mySqlURL,"root","Chilled687");
            sqlStatement = sqlConnect.createStatement();
        }
        catch(Exception ex){
            JOptionPane.showMessageDialog(this, "Loading error " + ex.getMessage());
            this.setTitle("Not connected");
            System.exit(1);
        }
    }
    
    /*public HenryDropPracticeForm(){
        initComponents();
        connectDatabase();
    }

    @SuppressWarnings("Unchecked")

    private void initComponents(){
        JComboBox authorCombo = new javax.swing.JComboBox<>();
        JScrollPane jscrollPane1 = new javax.swing.JScrollPane();
        JList bookList = new javax.swing.JList<>();
        JLabel jLabel1 = new javax.swing.JLabel();
        JLabel jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt){
                formWindowClosing(evt);
            }
        });

        authorCombo.setFont(new java.awt.Font("Tahoma", 0, 18));
        authorCombo.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                authorComboItemStateChanged(evt);
            }
        });
        authorCombo.addActionListener(new java.awt.event.ActionListener(){
            public void actionPerformed(java.awt.event.ActionEvent evt){
                authorComboActionPerformed(evt);
            }
        });

        bookList.setFont(new java.awt.Font("Tahoma", 0, 18));
        jscrollPane1.setViewportView(bookList);

        jLabel1.setText("Author Name");

        jLabel2.setText("Books in stock");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
            .addContainterGap()
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING))
            .addComponent(jLabel1)
            .addComponent(authorCombo, javax.swing.GroupLayout.PREFERRED_SIZE, 27)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING))
            .addGroup(layout.createSequentialGroup()
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
            .addComponent(jLabel2)
            .addGap(219,219,219)
            .addGroup(layout.createSequentialGroup()
            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
            .addComponent(jscrollPane1)
            .addContainerGap())))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
            .addContainerGap()
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
            .addComponent(jLabel1)
            .addComponent(jLabel2))
            .addGap(6,6,6)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jscrollPane1, javax.swing.GroupLayout.Alignment.TRAILING)
            .addGroup(layout.createSequentialGroup()
            .addComponent(authorCombo, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addContainerGap(290, Short.MAX_VALUE))))
        );

        pack();
    }

    private void authorComboActionPerformed(java.awt.event.ActionEvent evt){



    }

    private void authorComboItemStateChanged(java.awt.event.ItemEvent evt){


    }

    private void formWindowClosing(java.awt.event.WindowEvent evt) {

    }*/

    
    
    
    public static void main(String[] args){
        //initComponents();
        //connectDatabase();
        /*try{
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getIn){
                if("Nimbus".equals(info.getName())){
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        }catch (ClassNotFoundException ex) {
            java.util.logging.getLogger(HenryDropPracticeForm.class.getName().logging);
        }*/
    }
}
