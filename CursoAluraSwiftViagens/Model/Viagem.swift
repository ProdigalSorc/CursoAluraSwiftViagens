//
//  Viagem.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 21/09/19.
//  Copyright © 2019 Rodrigo Paixão. All rights reserved.
//

import UIKit

//necessário colocar @objcMembers para filtrar o objeto
@objcMembers class Viagem: NSObject{
    let titulo: String
    let quantidadeDeDias: Int
    let preco: String
    let caminhoDaImagem: String
    
    init(titulo:String, quantidadeDeDias: Int, preco:String, caminhoDaImagem:String) {
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
}
