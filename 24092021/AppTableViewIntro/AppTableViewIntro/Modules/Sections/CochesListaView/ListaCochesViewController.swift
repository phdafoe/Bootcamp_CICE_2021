//
//  ListaCochesViewController.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 25/9/21.
//

import UIKit

class ListaCochesViewController: UIViewController {
    
    // MARK: - Variables
    var arrayCochesData: [CochesModel] = []
    var imagenCoche = UIImage(named: "audi")
    
    // MARK: - IBOutlets
    @IBOutlet weak var listaCochesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionTV()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Metodos privados
    private func configuracionUI() {
        self.title = "Coches"
        for item in 0..<23{
            let modelData = CochesModel(nombre: "Audi",
                                        color: "Verde",
                                        imagen: imagenCoche)
            arrayCochesData.append(modelData)
            print("\(arrayCochesData[item])")
        }
    }
    
    private func configuracionTV() {
        self.listaCochesTableView.delegate = self
        self.listaCochesTableView.dataSource = self
        self.listaCochesTableView.register(UINib(nibName: CochesCell.defaultReuseIdentifier,
                                                 bundle: nil),
                                           forCellReuseIdentifier: CochesCell.defaultReuseIdentifier)
    }

}

extension ListaCochesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCochesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCoches = self.listaCochesTableView.dequeueReusableCell(withIdentifier: CochesCell.defaultReuseIdentifier, for: indexPath) as! CochesCell
        cellCoches.configuracionCell(data: self.arrayCochesData[indexPath.row])
        return cellCoches
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
