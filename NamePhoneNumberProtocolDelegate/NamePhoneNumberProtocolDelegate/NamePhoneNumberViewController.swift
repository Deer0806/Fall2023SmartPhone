//
//  NamePhoneNumberViewController.swift
//  NamePhoneNumberProtocolDelegate
//
//  Created by 耿露 on 12/9/23.
//

import UIKit

class NamePhoneNumberViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    var sendNamePhoneDelegate: SendNamePhoneNumberDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveNamePhone(_ sender: Any) {
        guard let name = name.text else {return}
        guard let phoneNumber = phoneNumber.text else {return}
        
        sendNamePhoneDelegate?.sendNamePhoneNumber(name: name, phoneNumber: phoneNumber)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
