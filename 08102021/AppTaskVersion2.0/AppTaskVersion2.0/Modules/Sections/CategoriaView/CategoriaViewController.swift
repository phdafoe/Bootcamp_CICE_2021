//
//  CategoriaViewController.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 9/10/21.
//

import UIKit

protocol CategoriaViewControllerOutputDelegate: AnyObject {
    func nombreCategoriaSeleccionada(_ viewController: UIViewController, withIndexPath categoriaSelecionada: String)
}


class CategoriaViewController: UIViewController {
    
    // MARK: Variables
    weak var delegateOutput: CategoriaViewControllerOutputDelegate?
    
    var nombreCategoriaSeleccionada = ""
    var seleccioIndexPath = IndexPath()
    let listaCategorias = ["Sin Categoría", "Tienda de Apple", "Bar con los Amigos", "En la librería", "En el Corte Inglés", "En el Mercadona", "En Casa", "En el Parque", "Peluquería", "Barbería", "En el trabajo"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var cotegoriaTV: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupArrayData()
        self.configuracionTV()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Metodos privados
    private func setupArrayData() {
        for index in 0..<listaCategorias.count{
            if self.listaCategorias[index] == self.nombreCategoriaSeleccionada {
                self.seleccioIndexPath = IndexPath(row: index, section: 0)
            }
        }
    }
    
    private func configuracionTV(){
        self.cotegoriaTV.delegate = self
        self.cotegoriaTV.dataSource = self
        self.cotegoriaTV.register(UINib(nibName: CategoriaCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CategoriaCell.defaultReuseIdentifier)
    }

}

extension CategoriaViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoriaCell = self.cotegoriaTV.dequeueReusableCell(withIdentifier: CategoriaCell.defaultReuseIdentifier, for: indexPath) as! CategoriaCell
        
        categoriaCell.nombreCategoriaLBL.text = self.listaCategorias[indexPath.row]
        
        return categoriaCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath != self.seleccioIndexPath {
            self.seleccioIndexPath = indexPath
            self.nombreCategoriaSeleccionada = listaCategorias[indexPath.row]
            self.delegateOutput?.nombreCategoriaSeleccionada(self, withIndexPath: self.nombreCategoriaSeleccionada)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
