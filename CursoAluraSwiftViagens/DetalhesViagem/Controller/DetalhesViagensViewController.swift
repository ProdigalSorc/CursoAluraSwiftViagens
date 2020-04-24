//
//  DetalhesViagensViewController.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 22/04/20.
//  Copyright © 2020 Rodrigo Paixão. All rights reserved.
//

import UIKit

class DetalhesViagensViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    var pacoteSelecionado:PacoteViagem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }
    }

    @IBAction func botaoVolar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
