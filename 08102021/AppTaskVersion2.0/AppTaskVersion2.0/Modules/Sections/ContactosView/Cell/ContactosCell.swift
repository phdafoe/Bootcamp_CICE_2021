//
//  ContactosCell.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import UIKit

protocol ContactosCellProtocol {
    
    func configuracionCelada(data: ArrayContact)
}


class ContactosCell: UITableViewCell, ReuseIdentifierProtocol {

    // MARK: - IBOutlets
    
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var myNombrePerfil: UILabel!
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myApellidoPerfil: UILabel!
    
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
        self.myContentView.layer.cornerRadius = 10
    }
    
}

extension ContactosCell: ContactosCellProtocol {
    
    func configuracionCelada(data: ArrayContact) {
        self.myNombrePerfil.text = data.firstName
        self.myApellidoPerfil.text = data.lastName
        self.myImagenPerfil.image = UIImage(named: data.imageProfile ?? "placeholder")
    }

}
