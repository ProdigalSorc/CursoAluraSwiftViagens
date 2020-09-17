//
//  ConfirmacaoPagamentoViewController.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 17/09/20.
//  Copyright © 2020 Rodrigo Paixão. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {
    
    var pacote: PacoteViagem?

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelHotel: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var labelQuantidadePessoas: UILabel!
    @IBOutlet weak var labelDescricao: UILabel!
    @IBOutlet weak var botaoVoltarPraHome: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacote {
            imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            labelTituloPacoteViagem.text = pacote.viagem.titulo.uppercased()
            labelHotel.text = pacote.nomeDoHotel
            labelData.text = pacote.dataViagem
            labelDescricao.text = pacote.descricao
            self.imagemPacoteViagem.layer.cornerRadius = 10
            self.imagemPacoteViagem.layer.masksToBounds = true
            self.botaoVoltarPraHome.layer.cornerRadius = 8
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func botaoVoltarHome(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }

}
