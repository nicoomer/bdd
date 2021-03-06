package bdd.view;

import java.awt.Color;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class SubscriptionView extends JDialog {
    
    private JPanel mainPanel;
    private JButton okButton;
    private JButton cancelButton;
    
    private JTextField emailTextField;
    private JTextField surnameTextField;
    private JTextField passwordTextField;
    private JTextField avatarTextField;
    private JTextField countryTextField;
    private JTextField cityTextField;
    private JTextField biographyTextField;
    
    private JTextField streamNameTextField;
    private JTextField streamDescriptionTextField;
    private JTextField streamWebLinkTextField;
    
    public SubscriptionView() {
	super();
	this.setTitle("Fenêtre d'inscription");
	this.setSize(450, 400);
	this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	this.build();
    }
    
    public void build() {
	this.mainPanel = new JPanel();
	this.mainPanel.setLayout(new GridBagLayout());

	GridBagConstraints gbc = new GridBagConstraints();
	
	emailTextField = new JTextField(10);
	surnameTextField = new JTextField(10);
	passwordTextField = new JPasswordField(10);
	avatarTextField = new JTextField(15);
	countryTextField = new JTextField(10);
	cityTextField = new JTextField(10);
	biographyTextField = new JTextField(20);
	streamNameTextField = new JTextField(10);
	streamDescriptionTextField = new JTextField(20);
	streamWebLinkTextField = new JTextField(10);
	okButton = new JButton("Ok");
	cancelButton = new JButton("Cancel");
	
	gbc.gridx = 0;
	gbc.gridy = 0;

	gbc.gridheight = 1;
	gbc.gridwidth = 1;
	mainPanel.add(new JLabel("Adresse mail : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(emailTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 1;
	mainPanel.add(new JLabel("Pseudonyme : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(surnameTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 2;
	mainPanel.add(new JLabel("Mot de Passe : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(passwordTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 3;
	mainPanel.add(new JLabel("Avatar : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(avatarTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 4;
	mainPanel.add(new JLabel("Pays : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(countryTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 5;
	mainPanel.add(new JLabel("Ville : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(cityTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 6;
	mainPanel.add(new JLabel("Biographie : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(biographyTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 7;
	mainPanel.add(new JLabel("Nom de votre flux : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(streamNameTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 8;
	mainPanel.add(new JLabel("Lien Web de votre flux : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(streamWebLinkTextField, gbc);
	
	gbc.gridx = 0;
	gbc.gridy = 9;
	mainPanel.add(new JLabel("Description de votre flux : "), gbc);
	
	gbc.gridx = 1;
	mainPanel.add(streamDescriptionTextField, gbc);

	gbc.gridx = 1;
	gbc.gridy = 10;
	gbc.gridwidth = 2;
	mainPanel.add(okButton, gbc);
	
	gbc.gridx = 1;
	gbc.gridy = 11;
	gbc.gridwidth = 2;
	mainPanel.add(cancelButton, gbc);
	
	this.setContentPane(this.mainPanel);
	this.setVisible(true);
    }
    
    public String getEmail() {
	return emailTextField.getText();
    }
    
    public String getSurname() {
	return surnameTextField.getText();
    }
    
    public String getPassword() {
	return passwordTextField.getText();
    }
    
    public String getAvatar() {
	return avatarTextField.getText();
    }
    
    public String getCountry() {
	return countryTextField.getText();
    }
    
    public String getCity() {
	return cityTextField.getText();
    }
    
    public String getBiography() {
	return biographyTextField.getText();
    }
    
    public String getStreamName() {
	return streamNameTextField.getText();
    }
    
    public String getStreamDescription() {
	return streamDescriptionTextField.getText();
    }
    
    public String getStreamWebLink() {
	return streamWebLinkTextField.getText();
    }
    
    public void setEmailFieldBackground(Color color) {
	emailTextField.setBackground(color);
    }
    
    public void addOkListener(ActionListener okListener) {
	okButton.addActionListener(okListener);
    }
    
    public void addCancelListener(ActionListener cancelListener) {
	cancelButton.addActionListener(cancelListener);
    }
}