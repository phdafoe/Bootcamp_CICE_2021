//
//  ListaTareasViewController.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import UIKit

class ListaTareasViewController: UIViewController {
    
    var arrayTareas: [DownloadNewModel] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var listaTareasTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionTV()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SaveFavoritesPresenter.shared.getAllLocal { results in
            if let resultsDes = results {
                self.arrayTareas = resultsDes.downloads ?? []
                self.listaTareasTV.reloadData()
            }
        } failure: { error in
            debugPrint(error?.debugDescription ?? "")
        }
    }
    
    private func configuracionTV(){
        self.listaTareasTV.delegate = self
        self.listaTareasTV.dataSource = self
        self.listaTareasTV.register(UINib(nibName: CategoriaCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: CategoriaCell.defaultReuseIdentifier)
    }
}

extension ListaTareasViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayTareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTareas = self.listaTareasTV.dequeueReusableCell(withIdentifier: CategoriaCell.defaultReuseIdentifier, for: indexPath) as! CategoriaCell
        cellTareas.nombreCategoriaLBL.text = self.arrayTareas[indexPath.row].newTask
        return cellTareas
    }
    
    
}
