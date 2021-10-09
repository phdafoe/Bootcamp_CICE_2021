//
//  CategoriaCell.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 9/10/21.
//

import UIKit

class CategoriaCell: UITableViewCell, ReuseIdentifierProtocol {
    
    
    @IBOutlet weak var nombreCategoriaLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
