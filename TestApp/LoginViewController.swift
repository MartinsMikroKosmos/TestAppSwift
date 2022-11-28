//
//  ViewController.swift
//  TestApp
//
//  Created by Martin Richter on 25.11.22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginBTN: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tab outside the Keyboard to hide
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Keyboard Types and delegate
        userNameTF.keyboardType = .default
        userNameTF.delegate = self
        passwordTF.keyboardType = .default
        passwordTF.delegate = self
        
        // Login Button disable
        loginBTN.isEnabled = false
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func LogIn(_ sender: UITextField) {
        let username = userNameTF.text
        let password = passwordTF.text
        
            
            if userNameTF.text == "" || passwordTF.text == ""{
            } else if (username != "Martin" || password != "1234"){
                loginBTN.isEnabled = false
                let alert = UIAlertController(title: "Achtung", message: "Benutzername oder Passwort falsch", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Erneut eingeben", style: .cancel))
                present(alert, animated: true)
            } else {
                loginBTN.isEnabled = true
            }
            
        }
        
    }
    

