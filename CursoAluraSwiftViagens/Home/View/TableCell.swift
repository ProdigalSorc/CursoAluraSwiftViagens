//
//  TableCell.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 20/11/19.
//  Copyright © 2019 Rodrigo Paixão. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var qtdDias: UILabel!
    @IBOutlet weak var preco: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var titulo: UILabel!

    public func bind(_ viagem: Viagem){
        titulo.text = viagem.titulo
        qtdDias.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        preco.text = "R$ \(viagem.preco)"
        imagem.image = UIImage(named: viagem.caminhoDaImagem)
        imagem.translatesAutoresizingMaskIntoConstraints = false
        imagem.clipsToBounds = true
        imagem.layer.cornerRadius = 10
        imagem.layer.masksToBounds = true
    }
}
