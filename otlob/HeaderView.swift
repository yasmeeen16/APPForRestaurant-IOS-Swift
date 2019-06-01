//
//  HeaderView.swift
//  otlob
//
//  Created by yasmeen on 5/30/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
protocol  headerDelegate {
    func callHeader(idx : Int)
}
class HeaderView: UIView {
    var secindex: Int?
    var delegate : headerDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn : UIButton = {
        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width , height: self.frame.height))
        
              btn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btn.setTitleColor(UIColor.darkGray, for: .normal)        //btn.titleLabel?.textColor = UIColor.white
        
        var lineView = UIView(frame: CGRect(x: 0, y: btn.frame.height-2, width: btn.frame.size.width, height: 2))
        lineView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        btn.addSubview(lineView)
        
        btn.addTarget(self, action: #selector(onClickHeaderView), for: .touchUpInside)
        return btn
    }()
    
    @objc func onClickHeaderView(){
        if let idx = secindex{
            delegate?.callHeader(idx: idx)
        }
    }
}
