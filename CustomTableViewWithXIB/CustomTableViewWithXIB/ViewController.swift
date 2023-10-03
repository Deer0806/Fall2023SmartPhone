//
//  ViewController.swift
//  CustomTableViewWithXIB
//
//  Created by 耿露 on 10/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let imageNames = ["BBQ", "ChineseBBQ", "Duck", "Taco", "Korean", "Curry", "DimSum", "Hotpot",]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self)?.first as! ImageTableViewCell
        cell.imgView?.image = UIImage(named: imageNames[indexPath.row])
        cell.lblImage.text = imageNames[indexPath.row]
        
        
        return cell
    }
    

}

