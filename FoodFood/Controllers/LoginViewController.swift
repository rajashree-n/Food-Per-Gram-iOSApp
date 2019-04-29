//
//  LoginViewController.swift
//  FoodFood
//
//  Created by Rajashree Naik on 4/23/19.
//  Copyright © 2019 Rajashree Naik. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
var act = [prof]()
var post = [PostReceipe]()
var saved = [PostReceipe]()
var feed = [PostReceipe]()
var us = [prof]()
class LoginViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(act.count)
//        for post in act {
//            print("checking post array...................")
//            print(post.email)
//        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        performLogin()
        
    }
    
    
    func performLogin() {
         let db = Firestore.firestore()
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
//        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//            if let error = error {
//                print(error)
//                let alertController = UIAlertController(title: "Error", message: "Unable to login", preferredStyle: .alert)
//                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//                alertController.addAction(defaultAction)
//                self.present(alertController, animated: true, completion: nil)
//                return
//            }
        
       
            guard let _ = self.emailTextField.text, let _ = self.passwordTextField.text else { return }
        

                
                
                let docRef = db.collection("users").document(self.emailTextField.text!)
                
                docRef.getDocument { (document, error) in
                    if let city = document.flatMap({
                        $0.data().flatMap({ (data) in
                            return prof(data)
                        })
                    }) {
                      //  print("Users: \(city)")
                        act.append(city)
                     //   print(act[0].userimg)
                    } else {
                        
                        return
                    }
                }

                
                
                db.collection("posts").document(self.emailTextField.text!).collection(self.emailTextField.text!).getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Error getting documents: \(err)")
                        } else {
                            for document in querySnapshot!.documents {
                               // print("\(document.documentID) => \(document.data())")
                                post.append(PostReceipe(document.data()))
                            }
                     //        print(post.count)
                           
                        }
                }
                
                db.collection("saved").document(self.emailTextField.text!).collection(self.emailTextField.text!).getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                        
                    } else {
                        for document in querySnapshot!.documents {
                            // print("\(document.documentID) => \(document.data())")
                            saved.append(PostReceipe(document.data()))
                        }
                        
                    }
                }
                
                db.collection("feedposts").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            // print("\(document.documentID) => \(document.data())")
                            feed.append(PostReceipe(document.data()))
                        }
                        
                    }
                }

                
                
                
                        //activeUser.append(act[0])
                        self.performSegue(withIdentifier: "loggedin", sender: self)
                        //print(dataDescription.)
                
                

    }
    
    @IBAction func goToSignUp(_ sender: Any) {
         self.performSegue(withIdentifier: "NewUser", sender: self)
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
