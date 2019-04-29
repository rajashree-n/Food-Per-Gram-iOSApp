//
//  SignupViewController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/23/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
var activeUser = [User]()
class SignupViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupBtnPressed(_ sender: Any) {
        if passwordTextField.text != confirmpasswordTextField.text {
            
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
          //  self.present(alertController, animated: true, completion: nil)
        }
            
        else if passwordTextField.text?.isEmpty ?? true || usernameTextField.text?.isEmpty ?? true || emailTextField.text?.isEmpty ?? true {
            
            let alertController = UIAlertController(title: "Incomplete Data", message: "Please re-type", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
           // self.present(alertController, animated: true, completion: nil)
        }
        else  {
            let db = Firestore.firestore()
            db.collection("users").document(emailTextField.text!).setData([
                "email": emailTextField.text!,
                "password": passwordTextField.text!,
                "username": usernameTextField.text!,
                "profileURL" : "https://cdn.onlinewebfonts.com/svg/img_332705.png"
                ]) { err in
                   
                
                if err == nil {
                    activeUser.append(User(name: self.usernameTextField.text!, email: self.emailTextField.text!, userimg: "https://cdn.onlinewebfonts.com/svg/img_332705.png"))
//                    act.append(prof(name: self.usernameTextField.text!, email: self.emailTextField.text!, userimg: "https://cdn.onlinewebfonts.com/svg/img_332705.png"))
                    self.performSegue(withIdentifier: "UserAlready", sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: err?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @IBAction func haveAccount(_ sender: Any) {
        self.performSegue(withIdentifier: "UserAlready", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
