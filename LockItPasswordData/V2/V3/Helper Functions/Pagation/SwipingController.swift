//
//  SwipingController.swift
//  autolayout_lbta
//
//  Created by Brian Voong on 10/12/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "icon", headerText: "Welcome To LockIt!!", bodyText: "Your Personal Password Manager"),
        Page(imageName: "NoDocs", headerText: "Enough With Your Locked Doc", bodyText: "Start Using LockIt's Technology And Only Have To Remember 1 Password!"),
        Page(imageName: "Countries", headerText: "Global Audience", bodyText: "See Our Global User Base!"),
        Page(imageName: "CustomAccounts", headerText: "Custom Accounts", bodyText: "Start Adding Custom Accounts, By Adding Icons From Our App Gallery Or Your Photo Library"),
        Page(imageName: "icon", headerText: "Start Now!", bodyText: "Start Relying On LockIt, And Let Us Do The Memory For You, With Unlimited Storage, And Free Memory!!"),
        Page(imageName: "icon", headerText: "Redirecting!", bodyText: "")
    ]

    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemYellow, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        var indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        print(indexPath)
//        print(nextIndex + 1)
//        print(nextIndex + 1)
        let nextPage = nextIndex + 2
        print(nextIndex)
        if nextPage == 7 {
            UserDefaults.standard.set(true, forKey: "DONEORNOT")
            let controller = LLoginController()
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count - 1
        pc.currentPageIndicatorTintColor = .systemYellow
        pc.pageIndicatorTintColor = .systemGray
        return pc
    }()
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView?.backgroundColor = .systemBackground
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isScrollEnabled = false
        collectionView?.isPagingEnabled = true
    }
    
}
