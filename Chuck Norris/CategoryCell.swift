//
//  CategoryCell.swift
//  Chuck Norris
//
//  Created by Kayron Cabral on 11/06/2018.
//  Copyright © 2018 Kayron Cabral. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    static let identifier = "Category"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
