//
//  ViewController.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 21/09/19.
//  Copyright © 2019 Rodrigo Paixão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabelaViagens: TableView!
    @IBOutlet weak var viewPacotes: UIView!
    @IBOutlet weak var viewHoteis: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewPacotes.layer.cornerRadius = 10
        self.viewHoteis.layer.cornerRadius = 10
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tabelaViagens.tableDelegate = self
    }
}

extension ViewController: TableViewDelegate {
    func doAsUWant() {
        
    }
}
