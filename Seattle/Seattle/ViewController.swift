//
//  ViewController.swift
//  Seattle
//
//  Created by 耿露 on 12/10/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cities = ["Seattle1","Seattle2", "Seattle3", "Seattle4", "Seattle5", "Seattle6", "Seattle7", "Seattle8", "Seattle9", "Seattle10"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =   Bundle.main.loadNibNamed("SeattleTableViewCell", owner: self)?.first as! SeattleTableViewCell
        cell.imageView?.image = UIImage(named: "Seattle\(indexPath.row)")
        cell.lblSeattle.text = cities[indexPath.row]
        return cell
    }
}



