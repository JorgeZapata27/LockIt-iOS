//
//  PageViewController.swift
//  LockItPasswordData
//
//  Created by JJ Zapata on 4/28/19.
//  Copyright © 2019 JJ Zapata. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var subViewControllers:[UIViewController] = {
       return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController1"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController3")
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int
    {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let currentIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if (currentIndex <= 0)
        {
            return nil
        }
        return subViewControllers[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        let currentIndex: Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if (currentIndex >= subViewControllers.count-1)
        {
            return nil
        }
        return subViewControllers[currentIndex+1]
    }

}
