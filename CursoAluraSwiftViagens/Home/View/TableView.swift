//
//  TableView.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 20/11/19.
//  Copyright © 2019 Rodrigo Paixão. All rights reserved.
//

import UIKit

protocol TableViewDelegate: class {
    func doAsUWant()
    func addController(controller: UIViewController)
}

class TableView: UITableView {
    weak var tableDelegate: TableViewDelegate?
    
    let listaViagens:Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override init(frame: CGRect, style: UITableView.Style) {
          super.init(frame: frame, style: style)
          
          setup()
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          
          setup()
      }
      
      private func setup() {
          setupTableView()
      }
      
    private func setupTableView() {
        dataSource = self
        delegate = self
        separatorStyle = .none
        sectionHeaderHeight = UITableView.automaticDimension
        rowHeight = UITableView.automaticDimension
        
        self.register(UINib(nibName: "LabelTitle", bundle: nil), forCellReuseIdentifier: "LabelTitle")
//        self.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        self.register(UINib(nibName: "PagerTableViewCell", bundle: nil), forCellReuseIdentifier: "PagerTableViewCell")
    }
}

extension TableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
//        cell.layoutIfNeeded()
//
//        let infoVC = storyboard.instantiateViewControllerWithIdentifier("CustomPageViewController")
//        self.addChildViewController(infoVC)
//        cell.contentView.addSubview(infoVC.view)
//
//        infoVC.view.translatesAutoresizingMaskIntoConstraints = false
//        cell.contentView.addConstraint(NSLayoutConstraint(item: infoVC.view, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: cell.contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0.0))
//        cell.contentView.addConstraint(NSLayoutConstraint(item: infoVC.view, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: cell.contentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0))
//        cell.contentView.addConstraint(NSLayoutConstraint(item: infoVC.view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: cell.contentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0))
//        cell.contentView.addConstraint(NSLayoutConstraint(item: infoVC.view, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: cell.contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0))
//
//        infoVC.didMoveToParentViewController(self)
//        infoVC.view.layoutIfNeeded()
//
        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTitle", for: indexPath) as! LabelTitle {
//
//            cell.labelTitle.text = "Titulo novo"
//
//            return cell
//        }
//
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
//
//        let viagemAtual = listaViagens[indexPath.row]
//        cell.titulo.text = viagemAtual.titulo
//        cell.qtdDias.text = "\(viagemAtual.quantidadeDeDias) dias"
//        cell.preco.text = viagemAtual.preco
//        cell.imagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
//        cell.imagem.translatesAutoresizingMaskIntoConstraints = false
//        cell.imagem.clipsToBounds = true
//        cell.imagem.layer.cornerRadius = 10
//        cell.imagem.layer.masksToBounds = true
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PagerTableViewCell", for: indexPath) as! PagerTableViewCell
        cell.delegate = self
        cell.loadData()
        return cell
        
    }
}

extension TableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let viagemAtual = listaViagens[indexPath.row]
        let currentImage = UIImage(named: viagemAtual.caminhoDaImagem)
        let imageRatio = currentImage?.getImageRatio() ?? 0
        return tableView.frame.width / imageRatio
    }
}


extension UIImage {
    func getImageRatio() -> CGFloat {
    let imageRatio = CGFloat(self.size.width / self.size.height)
    return imageRatio
    }
}

extension TableView: PagerTableViewCellDelegate {
    func addController(controller: UIViewController) {
        tableDelegate?.addController(controller: controller)
    }
}
