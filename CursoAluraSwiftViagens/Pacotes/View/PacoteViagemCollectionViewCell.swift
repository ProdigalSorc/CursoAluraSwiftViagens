//
//  PacoteViagemCollectionViewCell.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 22/03/20.
//  Copyright © 2020 Rodrigo Paixão. All rights reserved.
//

import UIKit

class PacoteViagemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagemViagem: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    public func bind(_ viagem: Viagem){
        labelTitulo.text = viagem.titulo
        labelQuantidadeDeDias.text = "\(viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(viagem.preco)"
        imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        self.layer.cornerRadius = 8
    }
    
}
