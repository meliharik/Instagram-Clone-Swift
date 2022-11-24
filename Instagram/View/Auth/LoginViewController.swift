//
//  LoginViewController.swift
//  Instagram
//
//  Created by melih arik on 11/24/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameOrEmailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func toRegisterVCBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "toRegisterVC", sender: nil)
    }
    
    @IBAction func logInBtnClicked(_ sender: Any) {
        if usernameOrEmailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().signIn(withEmail: usernameOrEmailTextField.text!, password: passwordTextField.text!) { (authData, error) in
                
                if error != nil {
                    self.makeAlert(header: "Error", text: error!.localizedDescription)
                } else {
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
