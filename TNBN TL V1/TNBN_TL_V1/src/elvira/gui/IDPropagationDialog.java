/* IDPropagationDialog.java */

package elvira.gui;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.util.Vector;
import java.io.File;

import elvira.Elvira;
import elvira.*;

/**
 * <P>Implements the dialog with all the necessary components for
 * selecting the propagation method desired. </P>
 * <P>The main component of this dialog is a combo box (methodComboBox)
 * that contains the algorithms that can be selected. Some of this algorithms
 * have different variants, so the election of one of them could make appear
 * some radio buttons with this variants.</P>
 * <P>This dialog automatically shows the necessary fields for give
 * to the algorithm the parameters it needs. This parameters will be
 * stored in a vector that will be used for the propagation algorithm.
 * If an algorithm need any output/input file, its names will stored
 * in another vector.
 *
 * @author Roberto Atienza
 * @since 20/11/2000
 */

public class IDPropagationDialog extends MethodDialog
{

   /**
    * Main constructor
    */

	public IDPropagationDialog(Frame parent)
	{
		super(parent);


		inferencePanel=((NetworkFrame)Elvira.getElviraFrame().getCurrentNetworkFrame()).getInferencePanel();

		// This code is automatically generated by Visual Cafe when you add
		// components to the visual environment. It instantiates and initializes
		// the components. To modify the code, only use code syntax that matches
		// what Visual Cafe can generate, or Visual Cafe may be unable to back
		// parse your Java file into its visual environment.
		//{{INIT_CONTROLS
		setTitle("Select propagation method for Influence Diagram");
		getContentPane().setLayout(null);
		setSize(416,429);
		setVisible(false);
		methodLabel.setText("Propagation method");
		getContentPane().add(methodLabel);
		methodLabel.setBounds(24,12,132,24);
		getContentPane().add(methodComboBox);
		methodComboBox.setBounds(168,12,220,23);
		okButton.setText("OK");
		okButton.setActionCommand("OK");
		getContentPane().add(okButton);
		okButton.setBounds(96,384,105,36);
		cancelButton.setText("Cancel");
		cancelButton.setActionCommand("Cancel");
		getContentPane().add(cancelButton);
		cancelButton.setBounds(228,384,100,38);
		methodTypePanel.setLayout(null);
		getContentPane().add(methodTypePanel);
		methodTypePanel.setBounds(24,48,360,110);//84);
		methodTypePanel.setVisible(false);
		generalRadioButton.setText("General");
		generalRadioButton.setOpaque(false);
		generalRadioButton.setActionCommand("General");
		methodTypePanel.add(generalRadioButton);
		generalRadioButton.setBounds(12,24,120,24);
		treeRadioButton.setText("Tree");
		treeRadioButton.setActionCommand("Tree");
		methodTypePanel.add(treeRadioButton);
		treeRadioButton.setBounds(12,48,120,24);
                treeAndConstraintsRadioButton.setText("TreeAndConstraints");
		treeAndConstraintsRadioButton.setActionCommand("TreeAndConstraints");
		
		methodTypePanel.add(withDivsPoliciesAndUtilitiesRadioButton);
		withDivsPoliciesAndUtilitiesRadioButton.setBounds(12,24,120,24);
		methodTypePanel.add(withDivsOnlyPoliciesRadioButton);
		withDivsOnlyPoliciesRadioButton.setBounds(12,48,120,24);
		methodTypePanel.add(withoutDivsRadioButton);
		withoutDivsRadioButton.setBounds(12,72,120,24);
		withDivsPoliciesAndUtilitiesRadioButton.setSelected(true);
		
		methodTypePanel.add(tatmanAndShachterPoliciesAndUtilitiesRadioButton);
		methodTypePanel.add(tatmanAndShachterOnlyPoliciesRadioButton);
		tatmanAndShachterPoliciesAndUtilitiesRadioButton.setBounds(12,24,140,24);
		tatmanAndShachterOnlyPoliciesRadioButton.setBounds(12,48,120,24);
		tatmanAndShachterPoliciesAndUtilitiesRadioButton.setSelected(true);
				
		methodTypePanel.add(treeAndConstraintsRadioButton);
		treeAndConstraintsRadioButton.setBounds(12,72,120,24);
		JLabel4.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
		JLabel4.setText("Limit for pruning");
		getContentPane().add(JLabel4);
		JLabel4.setBounds(12,180,132,24);
		JLabel4.setVisible(false);
		getContentPane().add(JTextField4);
		JTextField4.setBounds(156,180,49,26);
		JTextField4.setVisible(false);
		JLabel1.setText("Maximum potential size");
		getContentPane().add(JLabel1);
		JLabel1.setBounds(12,144,144,24);
		JLabel1.setVisible(false);
		getContentPane().add(JTextField1);
		JTextField1.setBounds(156,144,36,26);
		JTextField1.setVisible(false);
		JLabel2.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
		JLabel2.setText("Simulation steps");
		getContentPane().add(JLabel2);
		JLabel2.setBounds(204,144,132,24);
		JLabel2.setVisible(false);
		getContentPane().add(JTextField2);
		JTextField2.setBounds(348,144,48,26);
		JTextField2.setVisible(false);
		JLabel5.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
		JLabel5.setText("Output error file");
		getContentPane().add(JLabel5);
		JLabel5.setBounds(24,300,100,24);
		JLabel5.setVisible(false);
		getContentPane().add(outputFileTextField);
		outputFileTextField.setBounds(132,300,226,26);
		outputFileTextField.setVisible(false);
		JLabel6.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
		JLabel6.setText("Exacts results file");
		getContentPane().add(JLabel6);
		JLabel6.setBounds(12,336,110,24);
		JLabel6.setVisible(false);
		getContentPane().add(exactFileTextField);
		exactFileTextField.setBounds(132,336,226,26);
		exactFileTextField.setVisible(false);
		openErrorFileButton.setText("...");
		openErrorFileButton.setActionCommand("OK");
		getContentPane().add(openErrorFileButton);
		openErrorFileButton.setBounds(360,300,36,26);
		openErrorFileButton.setVisible(false);
		openExactFileButton.setText("...");
		openExactFileButton.setActionCommand("OK");
		getContentPane().add(openExactFileButton);
		openExactFileButton.setBounds(360,336,36,26);
		openExactFileButton.setVisible(false);
		sortAndBoundCheckBox.setText("Sort and bound");
		sortAndBoundCheckBox.setActionCommand("Sort and bound");
		getContentPane().add(sortAndBoundCheckBox);
		sortAndBoundCheckBox.setBounds(264,180,110,24);
		sortAndBoundCheckBox.setVisible(false);
		joinLabel.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
		joinLabel.setText("Method to join potentials");
		getContentPane().add(joinLabel);
		joinLabel.setBounds(12,216,144,24);
		joinLabel.setVisible(false);
		getContentPane().add(joinComboBox);
		joinComboBox.setBounds(168,216,144,23);
		joinComboBox.setVisible(false);
		heuristicLabel.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
		heuristicLabel.setText("Heuristic to join");
		getContentPane().add(heuristicLabel);
		heuristicLabel.setBounds(24,252,132,24);
		heuristicLabel.setVisible(false);
		getContentPane().add(heuristicComboBox);
		heuristicComboBox.setBounds(168,252,208,23);
		heuristicComboBox.setVisible(false);
		cacheCheckBox.setText("Cache");
		cacheCheckBox.setActionCommand("Sort and bound");
		getContentPane().add(cacheCheckBox);
		cacheCheckBox.setBounds(336,216,62,24);
		cacheCheckBox.setVisible(false);
		//}}
		if (modelcombo.getSize()>0) modelcombo.removeAllElements();
		  if (inferencePanel.INFERENCEAIM==InferencePanel.POSTERIORI){
			methodComboBox.addItem("VE for ID with super-value nodes");
			methodComboBox.addItem("Tatman and Shachter");
		    methodComboBox.addItem("Variable Elimination");
		    methodComboBox.addItem("Arc Reversal");
		    //By default VE for ID with super-value nodes
		    methodComboBox.setSelectedItem("VE for ID with super-value nodes");
		  }
		  else {
		    methodComboBox.addItem("Exact Abductive Inference");
		    methodComboBox.addItem("Approximate Abductive Inference");
		  }

		methodTypePanel.setBorder(new TitledBorder(
		   "Importance Sampling Method"));

		typeGroup.add (generalRadioButton);
		typeGroup.add (treeRadioButton);
		typeGroup.add (treeAndConstraintsRadioButton);

		policiesAndUtilitiesGroup.add(this.withDivsPoliciesAndUtilitiesRadioButton);
		policiesAndUtilitiesGroup.add(this.withDivsOnlyPoliciesRadioButton);
		policiesAndUtilitiesGroup.add(this.withoutDivsRadioButton);
		
		tatmanAndShachterGroup.add(this.tatmanAndShachterPoliciesAndUtilitiesRadioButton);
		tatmanAndShachterGroup.add(this.tatmanAndShachterOnlyPoliciesRadioButton);
		
		
		
		setLocationRelativeTo(Elvira.getElviraFrame());

		joinComboBox.addItem ("Never");
		joinComboBox.addItem ("Intersection");
		joinComboBox.addItem ("Union");
		joinComboBox.addItem ("List Potential");
		joinComboBox.addItem ("Content");

		if (modelcomboheu.getSize()>0) modelcomboheu.removeAllElements();

                heuristicComboBox.addItem ("Minimum size variables");
                heuristicComboBox.addItem ("Minimum size variables and prods");
                heuristicComboBox.addItem ("Minimum size prods");
                heuristicComboBox.addItem ("Minimum difference size prods");
                heuristicComboBox.addItem ("Minimum difference size variables");


		//{{REGISTER_LISTENERS
		SymAction lSymAction = new SymAction();
		okButton.addActionListener(lSymAction);
		cancelButton.addActionListener(lSymAction);
		SymItem lSymItem = new SymItem();
		methodComboBox.addItemListener(lSymItem);
		generalRadioButton.addItemListener(lSymItem);
		treeRadioButton.addItemListener(lSymItem);
		treeAndConstraintsRadioButton.addItemListener(lSymItem);
		openErrorFileButton.addActionListener(lSymAction);
		openExactFileButton.addActionListener(lSymAction);
		methodComboBox.addActionListener(lSymAction);
		//}}
	}


	/**
	 * Creates the dialog without parent
	 */

	public IDPropagationDialog()
	{
		this((Frame)null);
	}


	/**
	 * Creates the dialog without a parent and set its title
	 *
	 * param @param sTitle Title of the dialog
	 */

	public IDPropagationDialog(String sTitle)
	{
		this();
		setTitle(sTitle);
	}


	/**
	 * Creates the dialog and set the inference method into
	 * the method ComboBox and, if it is necessary, select
	 * the radio button in the case that there is multiple choices
	 * for the selected method.
	 * It also shows and fills the fields with the parameters of the
	 * selected method.
	 *
	 * @param ip Contains the inference panel where the propagation
	 * will be made
	 */

	public IDPropagationDialog(InferencePanel ip) {
	   this();
	   inferencePanel = ip;
	   int index = inferencePanel.getInferenceMethod();
           boolean withConstraints = false;
           Vector reList = inferencePanel.getBayesNet().getRelationList();
           for (int i=0; i<reList.size(); i++) {
             if (((Relation) reList.elementAt(i)).getKind() == Relation.CONSTRAINT) {
               withConstraints = true;
             }
           }
           /*if (withConstraints) {
              generalRadioButton.setEnabled(false);
              treeRadioButton.setEnabled(false);
           }*/
	   switch (index) {
			case 0: withDivsPoliciesAndUtilitiesRadioButton.setSelected(true);
					index=0;
					break;
			case 1: withDivsOnlyPoliciesRadioButton.setSelected(true);
					index=0;
					break;
			case 2: withoutDivsRadioButton.setSelected(true);
					index=0;
					break;					
			case 3: tatmanAndShachterPoliciesAndUtilitiesRadioButton.setSelected(true);
					index=1;
					break;
			case 4: tatmanAndShachterOnlyPoliciesRadioButton.setSelected(true);
					index=1;
					break;
					
            case 5: generalRadioButton.setSelected(true);
                    index=2;
                    break;
            case 6: treeRadioButton.setSelected(true);
		    		showFields(false,false,true);
                    index=2;
                    break;
            case 7: treeAndConstraintsRadioButton.setSelected(true);
		    		showFields(false,false,true);
                    index=2;
                    break;
            case 8: generalRadioButton.setSelected(true);
                    index=3;
                    break;
            case 9: treeRadioButton.setSelected(true);
		    		showFields(false,false,true);
                    index=3;
                    break;
            case 10: treeAndConstraintsRadioButton.setSelected(true);
		    		showFields(false,false,true);
                    index=3;
                    break;
			
            
	   }
	   methodComboBox.setSelectedIndex(index);
	   fillTextFields (inferencePanel.getParameters(),
	                   inferencePanel.getAuxiliaryFilesNames());
	   //generalRadioButton_itemStateChanged(null);
	}

	public void setVisible(boolean b)
	{
		if (b)
			setLocation(50, 50);
		super.setVisible(b);
	}

	static public void main(String args[])
	{
		(new IDPropagationDialog()).setVisible(true);
	}

	public void addNotify()
	{
		// Record the size of the window prior to calling parents addNotify.
		Dimension size = getSize();

		super.addNotify();

		if (frameSizeAdjusted)
			return;
		frameSizeAdjusted = true;

		// Adjust size of frame according to the insets
		Insets insets = getInsets();
		setSize(insets.left + insets.right + size.width, insets.top + insets.bottom + size.height);
	}



	// Used by addNotify
	boolean frameSizeAdjusted = false;

        public static final int VARIABLE_ELIMINATION = 2;
        public static final int ARC_REVERSAL = 3;
        public static final int VARIABLE_ELIMINATION_FOR_IDWSV = 1;
	    private static final int TATMAN_AND_SHACHTER = 0;

	//{{DECLARE_CONTROLS
	javax.swing.JLabel methodLabel = new javax.swing.JLabel();
        javax.swing.DefaultComboBoxModel modelcombo=new DefaultComboBoxModel();
	javax.swing.JComboBox methodComboBox = new javax.swing.JComboBox(modelcombo);
	javax.swing.JButton okButton = new javax.swing.JButton();
	javax.swing.JButton cancelButton = new javax.swing.JButton();
	javax.swing.JPanel methodTypePanel = new javax.swing.JPanel();
	javax.swing.JRadioButton generalRadioButton = new javax.swing.JRadioButton();
	javax.swing.JRadioButton treeRadioButton = new javax.swing.JRadioButton();
	javax.swing.JRadioButton treeAndConstraintsRadioButton = new javax.swing.JRadioButton();
	javax.swing.JRadioButton withoutDivsRadioButton = new javax.swing.JRadioButton();
	javax.swing.JRadioButton withDivsPoliciesAndUtilitiesRadioButton = new javax.swing.JRadioButton();
	javax.swing.JRadioButton withDivsOnlyPoliciesRadioButton = new javax.swing.JRadioButton();
	javax.swing.JRadioButton tatmanAndShachterPoliciesAndUtilitiesRadioButton = new javax.swing.JRadioButton();
	javax.swing.JRadioButton tatmanAndShachterOnlyPoliciesRadioButton = new javax.swing.JRadioButton();
	ButtonGroup policiesAndUtilitiesGroup = new ButtonGroup();
	ButtonGroup tatmanAndShachterGroup = new ButtonGroup();
	javax.swing.JLabel JLabel4 = new javax.swing.JLabel();
	javax.swing.JTextField JTextField4 = new javax.swing.JTextField();
	javax.swing.JLabel JLabel1 = new javax.swing.JLabel();
	javax.swing.JTextField JTextField1 = new javax.swing.JTextField();
	javax.swing.JLabel JLabel2 = new javax.swing.JLabel();
	javax.swing.JTextField JTextField2 = new javax.swing.JTextField();
	javax.swing.JLabel JLabel5 = new javax.swing.JLabel();
	javax.swing.JTextField outputFileTextField = new javax.swing.JTextField();
	javax.swing.JLabel JLabel6 = new javax.swing.JLabel();
	javax.swing.JTextField exactFileTextField = new javax.swing.JTextField();
	javax.swing.JButton openErrorFileButton = new javax.swing.JButton();
	javax.swing.JButton openExactFileButton = new javax.swing.JButton();
	javax.swing.JCheckBox sortAndBoundCheckBox = new javax.swing.JCheckBox();
	javax.swing.JLabel joinLabel = new javax.swing.JLabel();
	javax.swing.JComboBox joinComboBox = new javax.swing.JComboBox();
	javax.swing.JLabel heuristicLabel = new javax.swing.JLabel();
	javax.swing.DefaultComboBoxModel modelcomboheu=new DefaultComboBoxModel();
	javax.swing.JComboBox heuristicComboBox = new javax.swing.JComboBox(modelcomboheu);
	javax.swing.JCheckBox cacheCheckBox = new javax.swing.JCheckBox();
	//}}

	InferencePanel inferencePanel;
        ButtonGroup typeGroup = new ButtonGroup();
        JFileChooser fileChooser = new JFileChooser();


   /**
    * Show/Hides the main labels and the textfields that allow the
    * introduction of the algorithm's parameters.
    * The parameters will have the value True if the components related with
    * it must been shown
    */

   public void showFields (boolean b1, boolean b2, boolean b3) {

        JLabel1.setVisible(b1);
        JLabel2.setVisible(b2);
        JLabel4.setVisible(b3);
        JTextField1.setVisible(b1);
        JTextField2.setVisible(b2);
        JTextField4.setVisible(b3);
   }


   /**
    * Show/Hides the labels, textfields and buttons related with the
    * files names parameters
    *
    * @param b True if the components must been shown
    */

   public void showFilesTextFields (boolean b) {
      outputFileTextField.setVisible(b);
      exactFileTextField.setVisible(b);
      JLabel5.setVisible(b);
      JLabel6.setVisible(b);
      openErrorFileButton.setVisible(b);
      openExactFileButton.setVisible(b);
   }


   /**
    * Shows/Hides the fields related with the SimpleLazyPenniless algorithm
    *
    * @param b True if the component must been shown
    */

   public void showLazyFields (boolean b) {
      joinComboBox.setVisible(b);
      joinLabel.setVisible(b);
      cacheCheckBox.setVisible(b);
      heuristicComboBox.setVisible(b);
      heuristicLabel.setVisible(b);
   }


   /**
    * Stores the parameters input in the dialog in a vector. The
    * method check the method that has been selected
    */

   public Vector getParameters() {
      Vector parameters = new Vector();
      int index = methodComboBox.getSelectedIndex();

      // The value of this field is always a double
      getDoubleValue (JTextField4,parameters);

      return parameters;
   }


   /**
    * Stores the auxiliary files names in a vector.
    *
    * @see IDPropagationDialog#getStringValue
    */

   public Vector getAuxiliaryFilesNames() {

      Vector filesNames = new Vector();
        getStringValue (outputFileTextField,filesNames,
                     "The output error file given is not correct");
        getStringValue (exactFileTextField,filesNames,
                     "The exact results file given is not correct");
      return filesNames;
   }


   /**
    * Fill the fields of the dialog with the values stored in
    * the vector <CODE>parameters</CODE> and in the vector
    * <CODE>fileNames</CODE>.
    */

   public void fillTextFields (Vector parameters, Vector filesNames) {
      Integer number;
      Double lastfield;
      Boolean b;

      if (parameters == null)
         return;
      int size = parameters.size();

      if (size>0) {
	lastfield = (Double) parameters.elementAt(0);
        JTextField4.setText(lastfield.toString());

        if (filesNames == null)
          return;

        else {
	  outputFileTextField.setText((String) filesNames.elementAt(0));
          exactFileTextField.setText((String) filesNames.elementAt(1));
        }
      }
   }


   /**
    * <P>Shows the radio buttons with the algorithm that can be
    * executed for the selected method. </P>
    * <P>This method set the positions and the text of the radio
    * buttons too.</P>
    *
    * @param method
    */

   public void setMethodType (int method) {
  
      if (method == VARIABLE_ELIMINATION) {
        showRadioButton(generalRadioButton,"Variable Elimination, general case",240);
        showRadioButton(treeRadioButton,"Variable Elimination with Potential Trees",240);
        showRadioButton(treeAndConstraintsRadioButton,"Variable Elimination with Potential Trees and Constraints",340);
		showRadioButton(this.withoutDivsRadioButton,null,240);
		showRadioButton(this.withDivsPoliciesAndUtilitiesRadioButton,null,240);
		showRadioButton(this.withDivsOnlyPoliciesRadioButton,null,240);
		showRadioButton(tatmanAndShachterPoliciesAndUtilitiesRadioButton,null,240);
		showRadioButton(tatmanAndShachterOnlyPoliciesRadioButton,null,240);
        showFields(false, false, false);
        sortAndBoundCheckBox.setVisible(false);
        showFilesTextFields(false);
        methodTypePanel.setBorder(new TitledBorder("Variable Elimination"));
        generalRadioButton.setSelected(true);
      }
      else if (method == ARC_REVERSAL) {
        showRadioButton(generalRadioButton,"Arc Reversal, general case",240);
        showRadioButton(treeRadioButton,"Arc Reversal with Potential Trees",240);
        showRadioButton(treeAndConstraintsRadioButton,"Arc Reversal with Potential Trees and Constraints",300);
		showRadioButton(this.withoutDivsRadioButton,null,240);
		showRadioButton(this.withDivsPoliciesAndUtilitiesRadioButton,null,240);
		showRadioButton(this.withDivsOnlyPoliciesRadioButton,null,240);
		showRadioButton(tatmanAndShachterPoliciesAndUtilitiesRadioButton,null,240);
		showRadioButton(tatmanAndShachterOnlyPoliciesRadioButton,null,240);
        showFields(false, false, false);
        sortAndBoundCheckBox.setVisible(false);
        showFilesTextFields(false);
        methodTypePanel.setBorder(new TitledBorder("Arc Reversal"));
        generalRadioButton.setSelected(true);
      }
      else if (method == VARIABLE_ELIMINATION_FOR_IDWSV){
		showRadioButton(this.withDivsPoliciesAndUtilitiesRadioButton,"With divisions, optimal policies and utilities",240);
		showRadioButton(this.withDivsOnlyPoliciesRadioButton,"With divisions, only optimal policies",240);
		showRadioButton(this.withoutDivsRadioButton,"Without divisions, only optimal policies",240);
      	showRadioButton(generalRadioButton,null,240);
		showRadioButton(treeRadioButton,null,240);
		showRadioButton(treeAndConstraintsRadioButton,null,300);
		showRadioButton(tatmanAndShachterPoliciesAndUtilitiesRadioButton,null,240);
		showRadioButton(tatmanAndShachterOnlyPoliciesRadioButton,null,240);
		withDivsPoliciesAndUtilitiesRadioButton.setSelected(true);
		      	
      	methodTypePanel.setBorder(new TitledBorder("Variable Elimination for ID with super-value nodes"));
      }
		if (method == TATMAN_AND_SHACHTER) {
			showRadioButton(tatmanAndShachterPoliciesAndUtilitiesRadioButton,"Tatman and Shachter, optimal policies and utilities",240);
			showRadioButton(tatmanAndShachterOnlyPoliciesRadioButton,"Tatman and Shachter, only optimal policies",240);
			showRadioButton(this.withoutDivsRadioButton,null,240);
			showRadioButton(this.withDivsPoliciesAndUtilitiesRadioButton,null,240);
			showRadioButton(this.withDivsOnlyPoliciesRadioButton,null,240);
			showRadioButton(generalRadioButton,null,240);
			showRadioButton(treeRadioButton,null,240);
			showRadioButton(treeAndConstraintsRadioButton,null,300);
			showFields(false, false, false);
			sortAndBoundCheckBox.setVisible(false);
			showFilesTextFields(false);
			methodTypePanel.setBorder(new TitledBorder("Tatman and Shachter"));
			tatmanAndShachterPoliciesAndUtilitiesRadioButton.setSelected(true);
		}
   }


   /**
    * Show the radioButton <CODE>rb</CODE> depending on the value
    * of <CODE>text</CODE>. This method set also the width of the
    * radio button.
    */

   public void showRadioButton (JRadioButton rb, String text, int width) {
      if (text == null)
         rb.setVisible(false);
      else {
         rb.setText (text);
         Rectangle r = rb.getBounds();
         r.width=width;
         rb.setBounds(r);
         rb.setVisible(true);
      }
   }



   /**
    * Class that handles the action events that occurs in the
    * IDPropagationDialog
    */

	class SymAction implements java.awt.event.ActionListener
	{
		public void actionPerformed(java.awt.event.ActionEvent event)
		{
			Object object = event.getSource();
			if (object == okButton)
				okButton_actionPerformed(event);
			else if (object == cancelButton)
				cancelButton_actionPerformed(event);
			else if (object == openErrorFileButton)
				openErrorFileButton_actionPerformed(event);
			else if (object == openExactFileButton)
				openExactFileButton_actionPerformed(event);
			else if (object == methodComboBox)
				methodComboBox_actionPerformed(event);
		}
	}


	/**
	 * This method executes the actions that must be taken when the
	 * user click the ok button. This actions are:
	 * <LI>Set the index of the method selected, using the index of
	 * the methodComboBox and looking for the radio button that is
	 * selected (if it is necessary.</LI>
	 * <LI>Get the parameters of the method selected, checking all
	 * the fields displayed. All this fields must contain correct
	 * values - if this do not happen it is impossible to exit from
	 * this dialog-.</LI>
	 * <LI>Pass all the information obtained to the InferencePanel object</LI>
	 */

	void okButton_actionPerformed(java.awt.event.ActionEvent event)
	{
	   int index = methodComboBox.getSelectedIndex();
	   switch (index) {
		  case 0:if (this.withDivsPoliciesAndUtilitiesRadioButton.isSelected()){
							index=0;
						}
						else if (this.withDivsOnlyPoliciesRadioButton.isSelected()){
							index=1;
						}
						else{//this.withoutDivsRadioButton.isSelected()
							index=2;
						}
						break;
		 case 1:if (tatmanAndShachterPoliciesAndUtilitiesRadioButton.isSelected()){
					index=3;
				}
				else {
					index=4;
				}
				break;
	      case 2: if (generalRadioButton.isSelected()) {
                        index=5;
	              }
	              else if (treeRadioButton.isSelected()) {
                        index=6;
                      }
                      else {
                        index=7;
                      }
	              break;
	      case 3: if (generalRadioButton.isSelected()) {
                        index=8;
                      }
                      else if (treeRadioButton.isSelected()) {
                        index=9;
                      }
	              else {
                        index=10;
                      }
	              break;
	   }

           inferencePanel.setInferenceMethod(index);
           inferencePanel.setParameters(getParameters());

           if (outputFileTextField.isVisible())
              inferencePanel.setAuxiliaryFilesNames(getAuxiliaryFilesNames());
           else inferencePanel.setAuxiliaryFilesNames(null);

           dispose();
	}


        /**
         * Method executed when the cancel button is clicked
         */

	void cancelButton_actionPerformed(java.awt.event.ActionEvent event)
	{
	   dispose();
	}


	/**
	 * Open a file chooser when the button is clicked
	 */

	void openErrorFileButton_actionPerformed(java.awt.event.ActionEvent event)
	{
		if (fileChooser.showOpenDialog(null)==JFileChooser.APPROVE_OPTION) {
		   File f = fileChooser.getSelectedFile();
		   outputFileTextField.setText(f.getPath());
		}

	}


	/**
	 * Open a file chooser when the button is clicke
	 */

	void openExactFileButton_actionPerformed(java.awt.event.ActionEvent event)
	{
		if (fileChooser.showOpenDialog(null)==JFileChooser.APPROVE_OPTION) {
		   File f = fileChooser.getSelectedFile();
		   exactFileTextField.setText(f.getPath());
		}

	}


	/**
	 * Shows/Hides all necessary fields when the methodComboBox
	 * changes
	 */

	void methodComboBox_actionPerformed(java.awt.event.ActionEvent event)
	{
	   int i = methodComboBox.getSelectedIndex();

           if (i>=0) {
              methodTypePanel.setVisible(true);

	      switch (i) {
			case 0: setMethodType(VARIABLE_ELIMINATION_FOR_IDWSV);
					break;
			case 1: setMethodType(TATMAN_AND_SHACHTER);
					break;
	        case 2: setMethodType(VARIABLE_ELIMINATION);
                    break;
	        case 3: setMethodType(ARC_REVERSAL);
	                break;
	         
	      }

	

		int iMethod;
		iMethod=inferencePanel.getInferenceMethod();
		switch (iMethod){
			case 0:
				withDivsPoliciesAndUtilitiesRadioButton.setSelected(true);
				break;
			case 1:
				withDivsOnlyPoliciesRadioButton.setSelected(true);
				break;
			case 2:
				withoutDivsRadioButton.setSelected(true);
				break;
			case 3:
				tatmanAndShachterPoliciesAndUtilitiesRadioButton.setSelected(true);
				break;
			case 4:
				tatmanAndShachterOnlyPoliciesRadioButton.setSelected(true);
				break;
			case 5:
			case 8:
				generalRadioButton.setSelected(true);
				generalRadioButton_itemStateChanged((java.awt.event.ItemEvent) null);
				break;
			case 6:
			case 9:
				treeRadioButton.setSelected(true);
				treeRadioButton_itemStateChanged((java.awt.event.ItemEvent) null);
				break;
			case 7:
			case 10:
				treeAndConstraintsRadioButton.setSelected(true);
				treeAndConstraintsRadioButton_itemStateChanged((java.awt.event.ItemEvent) null);
				break;
			
		}
			
				
		}
	      
              	
	}


	/**
	 * Class that handles the events that occurs on the generalRadioButton.
	 */

        class SymItem implements java.awt.event.ItemListener
	{
		public void itemStateChanged(java.awt.event.ItemEvent event)
		{
                    Object object = event.getSource();
                    if (object == generalRadioButton)
                      generalRadioButton_itemStateChanged(event);
		    else if (object == treeRadioButton)
		      treeRadioButton_itemStateChanged(event);
		    else if (object == treeAndConstraintsRadioButton)
		      treeAndConstraintsRadioButton_itemStateChanged(event);
		}
	}

	void generalRadioButton_itemStateChanged(java.awt.event.ItemEvent event)
	{
	   int i = methodComboBox.getSelectedIndex();
	   showFields(false, false, false);
	}

	void treeRadioButton_itemStateChanged(java.awt.event.ItemEvent event)
	{
	   int i = methodComboBox.getSelectedIndex();
	   showFields(false, false, true);
	}

	void treeAndConstraintsRadioButton_itemStateChanged(java.awt.event.ItemEvent event)
	{
	   int i = methodComboBox.getSelectedIndex();
	   showFields(false, false, true);
	}

}