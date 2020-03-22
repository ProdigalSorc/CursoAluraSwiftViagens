//
//  PacotesViagensViewController.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 22/03/20.
//  Copyright © 2020 Rodrigo Paixão. All rights reserved.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource {
   
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    
    let listaViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagem.dataSource = self
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
       

}
