//
//  PerfilCell.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import UIKit

protocol PerfilCellProtocol {

    func configuracionCelda(data: ArrayContact)
    
}

class PerfilCell: UITableViewCell, ReuseIdentifierProtocol {
    
    // MARK: IBOutlets
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myUsarioTwitter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuracionUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuracionUI() {
        self.myImagenPerfil.layer.cornerRadius = self.myImagenPerfil.frame.width / 2
        self.myImagenPerfil.layer.borderWidth = 1
        self.myImagenPerfil.layer.borderColor = UIColor.gray.cgColor
    }
    
}

extension PerfilCell: PerfilCellProtocol {
    
    func configuracionCelda(data: ArrayContact) {
        self.myImagenPerfil.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.myUsarioTwitter.text = data.usernameTwitter
    }
    
    
}
