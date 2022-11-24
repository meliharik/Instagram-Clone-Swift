//
//  RegisterViewController.swift
//  Instagram
//
//  Created by melih arik on 11/24/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createActionBtnClicked(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authData, error) in
                
                if error != nil {
                    self.makeAlert(header: "Error", text: error!.localizedDescription)
                } else {
                    
                    let firestore = Firestore.firestore()
                    let dictionary = ["email": self.emailTextField.text, "username": self.usernameTextField.text] as [String:Any]
                    
                    
                    
                    firestore.collection("Users").addDocument(data: dictionary) { error in
                        if error != nil {
                            print(error?.localizedDescription)
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toHomeVC", sender: nil)
                }
                
                
            }
        } else {
            makeAlert(header: "Error", text: "Username or password is empty")
        }
    }
    
    func makeAlert(header:String,text:String){
        // create the alert
        let alert = UIAlertController(title: header, message: text, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
}
