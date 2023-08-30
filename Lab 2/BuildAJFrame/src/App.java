import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class App extends JFrame{
    private static JLabel directionsLabel = new JLabel("Enter your name in the box");
    private static JLabel outputLabel = new JLabel();
    private static JTextField nameBox = new JTextField(25);
    private static JButton nameButton = new JButton("Click me");
    public static void main(String[] args) throws Exception {
        App window = new App();
        window.setSize(500,500);
        window.setVisible(true);
        window.setTitle("My JFrame");

        //window.setLayout(new FlowLayout());
        window.getContentPane().add(directionsLabel);
        window.setLayout(new GridLayout(3, 2));//rows, columns

        window.getContentPane().setBackground(new Color(200,0,200));
        nameBox.setForeground(new Color(100, 0, 100));

        directionsLabel.setFont(new Font("Calibri", Font.ITALIC, 18));

        window.getContentPane().add(nameBox);
        //blank line
        window.getContentPane().add(new JLabel());
        window.getContentPane().add(new JLabel());
        window.getContentPane().add(nameButton);
        window.getContentPane().add(outputLabel);

        //add an action listener
        nameButton.addActionListener(new ActionListener(){
            public void actionPerformed(ActionEvent e){
                buttonClick(e);//function that handles the event
            }
        });

        //window.pack();

        //add Swing objects here
        window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }//end of main
    public static void buttonClick(ActionEvent e){
        //put code int here to respond to the button
        //JOptionPane.showMessageDialog(null, "Button Works!!", "Hi!", JOptionPane.INFORMATION_MESSAGE);
        /*
         * 1.   strip from the screen objects
         * 2.   do something with the data from the screen
         * 3.   output the something
         */

         String yourName = nameBox.getText();
         String outputMessage = "Hello there " + yourName;
         outputLabel.setText(outputMessage);
    }
}
