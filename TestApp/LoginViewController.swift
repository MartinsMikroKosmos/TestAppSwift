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
    
    
    

    @IBAction func LogIn(_ sender: UIButton) {
        var username = userNameTF.text
        var password = passwordTF.text
        
       
    }
    
}

