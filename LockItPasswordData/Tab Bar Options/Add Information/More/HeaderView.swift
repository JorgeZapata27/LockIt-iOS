//
//  HeaderView.swift
//  
//
//  Created by JJ Zapata on 6/1/19.
//

import UIKit

class HeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        btn.backgroundColor = .darkGray
        btn.titleLabel?.textColor = .white
        btn.addTarget(self, action: #selector(onClickHeaderView), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func onClickHeaderView()
    {
        print("Header View")
    }

}
