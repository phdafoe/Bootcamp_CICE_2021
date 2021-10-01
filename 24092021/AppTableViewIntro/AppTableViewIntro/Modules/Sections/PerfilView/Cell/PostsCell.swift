//
//  PostsCell.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import UIKit

protocol PostsCellProtocol{
    func configuracionCell(data: String)
}

class PostsCell: UITableViewCell, ReuseIdentifierProtocol {
    
    
    @IBOutlet weak var descripcionPostLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PostsCell: PostsCellProtocol {
    func configuracionCell(data: String) {
        self.descripcionPostLBL.text = data
    }
}
