//
//  UITableView+CellRegister.swift
//  ECobranca
//
//  Created by Euler Carvalho on 26/12/18.
//  Copyright © 2018 Euler Carvalho. All rights reserved.
//

import UIKit

public protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
extension UITableViewHeaderFooterView: ReusableView { }

public protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: NibLoadableView { }
extension UITableViewHeaderFooterView: NibLoadableView { }

public extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath? = nil) -> T {
        if let indexPath = indexPath, let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T {
            return cell
        }
        
        if let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as? T {
            return cell
        }
        
        assert(false, "Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        return UITableViewCell() as! T
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
            assert(false, "Could not dequeue headerFooterView with identifier: \(T.defaultReuseIdentifier)")
            return UITableViewHeaderFooterView() as! T
        }
        return headerFooterView
    }
}
