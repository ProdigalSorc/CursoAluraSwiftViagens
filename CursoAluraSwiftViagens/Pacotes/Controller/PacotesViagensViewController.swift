//
//  PacotesViagensViewController.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 22/03/20.
//  Copyright © 2020 Rodrigo Paixão. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
   
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    let listaComTodasViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<Viagem> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContadorLable()
        colecaoPacotesViagem.register(UINib(nibName: "PacoteViagemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PacoteViagemCollectionViewCell")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaViagens.count
    }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "PacoteViagemCollectionViewCell", for: indexPath) as! PacoteViagemCollectionViewCell
        celulaPacote.bind(listaViagens[indexPath.row])
        return celulaPacote
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let larguraCelula = collectionView.bounds.width / 2
        return CGSize(width: larguraCelula - 15, height: 160)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "self.titulo contains %@", searchText)
            let lista = listaViagens as NSArray
            let listaFiltrada:Array<Viagem> = lista.filtered(using: filtroListaViagem) as! Array
            listaViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = self.atualizaContadorLable()
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContadorLable() -> String {
        return listaViagens.count == 1 ? "1 pacote encontrado" : "\(listaViagens.count) pacotes encontrados"
    }

}
