//
//  CustomPageViewController.swift
//  CursoAluraSwiftViagens
//
//  Created by Rodrigo Paixão on 20/11/19.
//  Copyright © 2019 Rodrigo Paixão. All rights reserved.
//

import UIKit

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    lazy var subViewController: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController1") as! ViewController1,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setViewControllers([subViewController[0]], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }

    // MARK - UIPageViewControllerDataSource
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewController.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        return subViewController[currentIndex-1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewController.firstIndex(of: viewController) ?? 0
        if currentIndex >= subViewController.count-1 {
            return nil
        }
        return subViewController[currentIndex+1]
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
