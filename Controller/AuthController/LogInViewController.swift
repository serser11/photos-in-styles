//
//  LogInViewController.swift
//  iosFinalProject
//
//  Created by Jiehan Wang on 11/12/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var userEmail = ""
    var userPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailField.delegate = self
        self.passwordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInPressed(_ sender: Any) {
        guard let emailText = emailField.text else { return }
        guard let passwordText = passwordField.text else { return }
        
        if emailText == "" || passwordText == "" {
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields
            let alertController = UIAlertController(title: "Log In Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            // email and password fields are not blank, let's try logging in the user!
            // you'll need to use `emailText` and `passwordText`, and a method found in this
            // api doc https://firebase.google.com/docs/auth/ios/start
            // if the error == nil, segue to the main page using `performSegue` with identifier
            // `segueLogInToMainPage`
            // if there is an error signing in (error != nil), present the following alert:
            
            Auth.auth().signIn(withEmail: emailText, password: passwordText) { (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "logInToMainPage", sender: self)
                } else if error != nil {
                    let alertController = UIAlertController(title: "Log In Error", message:error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
            
            
        }
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
            self.performSegue(withIdentifier: "toSignUp", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "logInToMainPage", sender: self)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailField {
            if textField.text != nil {
                self.userEmail = textField.text!
            }
        } else {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        }
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
