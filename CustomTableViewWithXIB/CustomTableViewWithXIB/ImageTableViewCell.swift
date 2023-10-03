//
//  ImageTableViewCell.swift
//  CustomTableViewWithXIB
//
//  Created by 耿露 on 10/2/23.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblImage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
