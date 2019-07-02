//
//  ExpandableHeaderForAddition.swift
//  otlob
//
//  Created by yasmeen on 6/30/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit
protocol ExpandableHeaderForAdditionDelegate {
    func ToggleSection(Header : ExpandableHeaderForAddition , section : Int)
}
class ExpandableHeaderForAddition: UITableViewHeaderFooterView {
    var delegate : ExpandableHeaderForAdditionDelegate?
    var section : Int!
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SelectHeaderAction)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("error from required init ")
    }
    @objc func SelectHeaderAction(gestureRecognizer : UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableHeaderForAddition
        delegate?.ToggleSection(Header: self, section: cell.section)
    }
    func custumInit(title : String , section : Int , delegate : ExpandableHeaderForAdditionDelegate){
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.darkGray
        self.contentView.backgroundColor = UIColor.white
    }
    

}
