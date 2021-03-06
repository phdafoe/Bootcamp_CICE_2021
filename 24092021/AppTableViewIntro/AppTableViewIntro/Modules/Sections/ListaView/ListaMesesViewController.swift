//
//  ListaMesesViewController.swift
//  AppTableViewIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 24/9/21.
//

import UIKit

class ListaMesesViewController: UIViewController, ReuseIdentifierViewControllerProtocol {
    
    
    // MARK: - Variables
    let arrayMeses = ["Enero", "Febrero", "Marzo", "Abril"]
    
    // MARK: - IBOUtlets
    @IBOutlet weak var listaMesesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meses"
        self.configuracionTableView()
    }
    
    // MARK: - Metodos privados
    private func configuracionTableView() {
        self.listaMesesTableView.delegate = self
        self.listaMesesTableView.dataSource = self
        self.listaMesesTableView.register(UINib(nibName: MesesCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: MesesCell.defaultReuseIdentifier)
    }
    
}

extension ListaMesesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMeses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellMeses = self.listaMesesTableView.dequeueReusableCell(withIdentifier: MesesCell.defaultReuseIdentifier, for: indexPath) as! MesesCell
        
        cellMeses.configuracionCell(data: self.arrayMeses[indexPath.row])
        
        return cellMeses
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = arrayMeses[indexPath.row]
        let vc = DetalleLIstaMesesViewController()
        vc.data = model
        self.show(vc, sender: nil)
        //self.present(vc, animated: true, completion: nil)
    }
}


