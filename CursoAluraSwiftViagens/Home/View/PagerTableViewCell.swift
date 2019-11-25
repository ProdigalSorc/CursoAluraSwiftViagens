//
//  PagerTableViewCell.swift
//  CursoAluraSwiftViagens
//
//  Created by FOTON on 21/11/19.
//  Copyright © 2019 Rodrigo Paixão. All rights reserved.
//

import UIKit

protocol PagerTableViewCellDelegate {
    func addController(controller: UIViewController)
}

class PagerTableViewCell: UITableViewCell {
    
    private var pageController: CustomPageViewController!
    var delegate: PagerTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        pageController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomPageViewController") as? CustomPageViewController
        contentView.addSubview(pageController.view)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        pageController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomPageViewController") as? CustomPageViewController
        contentView.addSubview(pageController.view)
        
        pageController.view.frame = contentView.frame
    }
    
    func loadData(){
        delegate?.addController(controller: pageController)
    }
    
}
