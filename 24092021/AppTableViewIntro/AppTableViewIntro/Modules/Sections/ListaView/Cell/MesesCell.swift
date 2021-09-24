//
//  MesesCell.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/9/21.
//

import UIKit

protocol MesesCellProtocol {
    func configuracionCell(data: String)
}


class MesesCell: UITableViewCell, ReuseIdentifierProtocol {
    
    // MARK: - IBOutles
    @IBOutlet weak var mesesLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MesesCell: MesesCellProtocol {
    
    internal func configuracionCell(data: String) {
        self.mesesLBL.text = data
    }
}
