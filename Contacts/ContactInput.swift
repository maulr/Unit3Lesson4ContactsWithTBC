//
//  ContactInput.swift
//  Contacts
//
//  Created by Ron Mauldin on 9/17/14.
//  Copyright (c) 2014 maulr. All rights reserved.
//

import UIKit

protocol dataUpdated:NSObjectProtocol {
    
    func didUpdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String)
}


class ContactInput: UIViewController, UITextFieldDelegate {
    
    //Properties
    var name = ""
    var phoneNumber = ""
    var delegate: dataUpdated?
    
    
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    
    //Textfield delegates
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        if textField.tag == 1 {
            
            self.name = textField.text
        }
            
        else {
            
            self.phoneNumber = textField.text
        }
        
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.delegate = self
        self.phoneField.delegate = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if name != "" && phoneNumber != "" {
            self.delegate!.didUpdateContact(self, aName: self.name, aPhoneNumber: self.phoneNumber)
        }
    }
    
    
}


/*protocol dataUpdated: NSObjectProtocol {
    func didupdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String)
}

class ContactInput: UIViewController, UITextFieldDelegate {
    
    //Properties 
    var delegate: dataUpdated?
    var name = "name"
    var phoneNumber = "phoneNumber"
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    
    // TextField delegates
    func textfieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        if textField.tag == 1 {
            self.name = textField.text
        }
        
        else {
            self.phoneNumber = textField.text
        }
        textField.resignFirstResponder()
        return true
    }
    
    
    

   //LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.phoneField.delegate = self
        
        
               // Do any additional setup after loading the view.
       }
    
    override func  viewWillDisappear(animated: Bool) {
        if name != "" && phoneNumber != "" {
            self.delegate!.didupdateContact(self, aName: self.name, aPhoneNumber: self.phoneNumber)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}*/
