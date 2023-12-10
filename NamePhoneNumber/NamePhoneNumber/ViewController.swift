//
//  ViewController.swift
//  NamePhoneNumber
//
//  Created by 耿露 on 12/9/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var nameTxtField : UITextField?
    var phoneTxtField : UITextField?
    
    
    var names: [String] = [String]()
    var phoneNumbers: [String] = [String]()


    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    @IBAction func addNameAndPhoneNumber(_ sender: Any) {
        let alertController = UIAlertController(title: "Name and Phone number", message: "", preferredStyle: .alert)
                
                let saveButton = UIAlertAction(title: "Save", style:.default) { action in
                    guard let name = self.nameTxtField?.text else {return }
                    guard let phoneNumber = self.phoneTxtField?.text else {return }

                    self.names.append(name)
                    self.phoneNumbers.append(phoneNumber)
                    self.tblView.reloadData()

                }
                let cancelButton = UIAlertAction(title: "Cancel", style:.cancel) { action in
                    print("I am in the cancel")
                }
                alertController.addAction(saveButton)
                alertController.addAction(cancelButton)

                
                alertController.addTextField{ txtField in
                    txtField.placeholder = "Type Name"
                    self.nameTxtField = txtField
                }
                
                alertController.addTextField{ txtField in
                    txtField.placeholder = "Type phoneNumber"
                    self.phoneTxtField = txtField
                }
                self.present(alertController, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name: \(names[indexPath.row]) Phone: \(phoneNumbers[indexPath.row])"
        return cell
    }
}

