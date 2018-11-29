//
//  SignUpViewController.swift
//  iosFinalProject
//
//  Created by Jiehan Wang on 11/12/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var verifiedPasswordField: UITextField!
    
    var userEmail = ""
    var userName = ""
    var userPassword = ""
    var userVerifiedPassWord = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.emailField.delegate = self
        self.passwordField.delegate = self
        self.verifiedPasswordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailField {
            if textField.text != nil {
                self.userEmail = textField.text!
            }
        } else if textField == self.passwordField {
            if textField.text != nil {
                self.userPassword = textField.text!
            }
        } else if textField == self.nameField {
            if textField.text != nil {
                self.userName = textField.text!
            }
        } else if textField == self.verifiedPasswordField {
            if textField.text != nil {
                self.userVerifiedPassWord = textField.text!
            }
        }
    }

    @IBAction func toLogIn(_ sender: Any) {
        performSegue(withIdentifier: "toLogIn", sender: self)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        guard let name = nameField.text else { return }
        guard let verifiedPassword = verifiedPasswordField.text else { return }
        if email == "" || password == "" || name == "" || verifiedPassword == "" {
            let alertController = UIAlertController(title: "Form Error.", message: "Please fill in form completely.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    let changeRequest = user?.user.createProfileChangeRequest()
                    changeRequest?.displayName = name
                    changeRequest?.commitChanges { (error) in
                        if error == nil {
                            
                        } else {
                            print("Error when setting user name.")
                        }
                    }
                    let alertController = UIAlertController(title: "Congratulations!", message: "You've sucessfully created an account.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
                        self.performSegue(withIdentifier: "toLogIn", sender: self)
                    })
                    alertController.addAction(action)
                    self.present(alertController, animated: true, completion: nil)
                    
                } else if password != verifiedPassword {
                    let alertController = UIAlertController(title: "Verification Error.", message: "The two passwords do not match.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.verifiedPasswordField.textColor = UIColor.red
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Sign Up Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
