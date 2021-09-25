//
//  CochesCell.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import UIKit

protocol CochesCellProtocol {
    func configuracionCell(data: CochesModel)
}

class CochesCell: UITableViewCell, ReuseIdentifierProtocol {
    
   
    
    @IBOutlet weak var nombreLBL: UILabel!
    @IBOutlet weak var colorLBL: UILabel!
    @IBOutlet weak var imagenImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CochesCell: CochesCellProtocol {
    func configuracionCell(data: CochesModel) {
        self.nombreLBL.text = data.nombre
        self.colorLBL.text = data.color
        self.imagenImageView.image = data.imagen
    }
}
