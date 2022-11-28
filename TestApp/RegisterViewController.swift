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
        createDatePicker()
        
        
        registerBTN.isEnabled = false
              
        userNameTF.delegate = self
        nameTF.delegate = self
        surnameTF.delegate = self
        birthdateTF.delegate = self
        genderTF.delegate = self
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderTF.inputView = genderPicker
        
        passwordTF.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    
    // DATE PICKER
    
    @objc func datePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        birthdateTF.text = dateFormatter.string(from: datePicker.date)

        genderTF.becomeFirstResponder()
    }
    
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        birthdateTF.inputView = datePicker
        birthdateTF.inputAccessoryView = createToolBar()
    }
    
    // TOOLBAR
    
    func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar()
        
        toolbar.sizeToFit()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePressed))
        toolbar.setItems([button], animated: true)
        
        return toolbar
    }
    
    // DATA TRANSFER
    
    
}


// TEXTFIELDS

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}


// PICKERS

extension RegisterViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case genderPicker:
            return genders.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case genderPicker:
            return genders[row]
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView{
        case genderPicker:
            genderTF.text = genders[row]
        default: print("Picker nicht bekannt")
        }
        passwordTF.becomeFirstResponder()
    }
}
