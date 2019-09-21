//
//  ViewController.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 21/09/19.
//  Copyright © 2019 Rodrigo Paixão. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource  {

    @IBOutlet weak var tabelaViagens: UITableView!
    
    let listaViagens:Array<String> = ["Rio de Janeiro", "Ceara", "São Paulo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listaViagens[indexPath.row]
        
        return cell
    }
}

