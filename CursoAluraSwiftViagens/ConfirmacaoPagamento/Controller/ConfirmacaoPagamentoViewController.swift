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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pacote = pacote {
            labelHotel.text = pacote.nomeDoHotel
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
