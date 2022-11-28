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
        registerBTN.isEnabled = false
              
        userNameTF.delegate = self
        nameTF.delegate = self
        surnameTF.delegate = self
        birthdateTF.delegate = self
        genderTF.delegate = self
        passwordTF.delegate = self

    }
    
    // KEYBOARD OVERLAPS VIEW
    
    
    
    
    // DISMISS KEYBOARD OUTSIDE
    
    // DATA PICKER
    
    
}

// TEXTFIELDS
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

// PICKERS
