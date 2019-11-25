//
//  LabelTitle.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 20/11/19.
//  Copyright © 2019 Rodrigo Paixão. All rights reserved.
//

import UIKit


protocol LabelTitleDelegate {
    func addController(controller: UIViewController)
}

class LabelTitle: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    
    private var pageController: CustomPageViewController!
    var delegate: LabelTitleDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        pageController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomPageViewController") as? CustomPageViewController
        contentView.addSubview(pageController.view)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadData()
    }
    
    func loadData(){
        delegate?.addController(controller: pageController)
    }

}
