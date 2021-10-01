//
//  PerfilCell.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import UIKit

// Output
protocol PerfilCellDelegate: AnyObject {
    func muestraAlerta(_ cell: UITableViewCell, info userData: UserData)
    func muestraPickerImageView(_ cell: UITableViewCell)
    func navegaDetallePerfil(_ cell: UITableViewCell, info userData: UserData)
}

// Input
protocol PerfilCellProtocol {
    func configuracionCell(data: UserData)
}

class PerfilCell: UITableViewCell, ReuseIdentifierProtocol {
    
    weak var delegate: PerfilCellDelegate?
    var model: UserData?
    
    // MARK: - IBOutlets
    @IBOutlet weak var twiterLBL: UILabel!
    @IBOutlet weak var perfilImagen: UIImageView!
    @IBOutlet weak var perfilNombreLBL: UILabel!
    @IBOutlet weak var perfilDescripcionLBL: UILabel!
    @IBOutlet weak var perfilPuestoActualLBL: UILabel!
    
    @IBOutlet weak var editarPerfilBTN: UIButton!
    @IBOutlet weak var editarBTN: UIButton!
    @IBOutlet weak var envioEmailBTN: UIButton!
    
    // MARK: - IBActions
    @IBAction func muestraAlertaEmailACTION(_ sender: Any) {
        if let modelDes = self.model{
            self.delegate?.muestraAlerta(self, info: modelDes)
        }
    }
    
    @IBAction func editarImagenPerfilACTION(_ sender: Any) {
        self.delegate?.muestraPickerImageView(self)
    }
    
    @IBAction func editarACTION(_ sender: Any) {
        if let modelDes = self.model{
            self.delegate?.navegaDetallePerfil(self, info: modelDes)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuredUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configuredUI() {
        self.perfilImagen.layer.cornerRadius = self.perfilImagen.frame.width / 2
        self.editarPerfilBTN.layer.cornerRadius = self.editarPerfilBTN.frame.width / 2
        self.editarBTN.layer.cornerRadius = self.editarBTN.frame.width / 2
        self.envioEmailBTN.layer.cornerRadius = 10
    }
    
}

extension PerfilCell: PerfilCellProtocol{
    
    func configuracionCell(data: UserData) {
        self.model = data
        self.twiterLBL.text = data.usuarioTwitterPerfil
        self.perfilImagen.image = UIImage(named: data.imagenPerfil ?? "thor")
        self.perfilNombreLBL.text = data.nombrePerfil
        self.perfilDescripcionLBL.text = data.descripcionPerfil
        self.perfilPuestoActualLBL.text = data.puestoactualPerfil
    }
}


