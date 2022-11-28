//
//  RegisterViewController.swift
//  TestApp
//
//  Created by Martin Richter on 25.11.22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    @IBOutlet weak var birthdateTF: UITextField!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var registerBTN: UIButton!
    
    let genders = ["Männlich", "Weiblich", "Doof"]
    let genderPicker = UIPickerView()
    let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardDismissable()
        
        
        registerBTN.isEnabled = false
              
        userNameTF.delegate = self
        nameTF.delegate = self
        surnameTF.delegate = self
        birthdateTF.delegate = self
        genderTF.delegate = self
        passwordTF.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    // KEYBOARD OVERLAPS VIEW
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 && (passwordTF.isFirstResponder) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notifaction: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    
    // DISMISS KEYBOARD OUTSIDE
    
    @objc func dismissKeyboardTouchOutside() {
        self.view.endEditing(true)
    }
    
    func keyboardDismissable() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // DATA PICKER
    
    
}

// TEXTFIELDS
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

// PICKERS
