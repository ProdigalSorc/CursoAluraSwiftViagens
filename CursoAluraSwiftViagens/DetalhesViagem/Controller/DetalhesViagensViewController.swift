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
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    var pacoteSelecionado:PacoteViagem?
    @IBOutlet weak var textFieldData: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentaScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }
    }
    
    @objc func aumentaScroll(notification:Notification){
        self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
    }
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextFiel(sender:)), for: .valueChanged)
    }
    
    @available(iOS 13.0, *)
    @IBAction func botaoFinalizarCompra(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(identifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacote = pacoteSelecionado
        self.present(controller, animated: true, completion: nil)
        
    }
    
    @objc func exibeDataTextFiel(sender: UIDatePicker){
        let formatador = DateFormatter()
        formatador.dateFormat = "dd MM yyyy"
        self.textFieldData.text = formatador.string(from: sender.date)
    }
    
    @IBAction func botaoVolar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
