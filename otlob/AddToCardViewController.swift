//
//  AddToCardViewController.swift
//  otlob
//
//  Created by yasmeen on 6/1/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class AddToCardViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var AddToCardOutlet: UIButton!
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var BackgroundViewOfText: UIView!
    @IBOutlet weak var ShowInstructionOutlet: UIButton!
    @IBOutlet weak var textviewField: UITextView!
    var flagToShoworder = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        textviewField.text = "Placeholder"
        textviewField.textColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ShowInstructionsAction(_ sender: Any) {
        ///menuoutlet.titleLabel?.text = (sender as AnyObject).titleLabel??.text
        UIView.animate(withDuration: 0.25, animations:{
            self.BackgroundViewOfText.isHidden = !self.BackgroundViewOfText.isHidden
            self.textviewField.isHidden = !self.textviewField.isHidden
            self.view.layoutIfNeeded()
            
        })

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textviewField.textColor == UIColor.lightGray {
            textView.text = nil
            textviewField.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textviewField.text.isEmpty {
            textviewField.text = "Placeholder"
            textviewField.textColor = UIColor.lightGray
        }
    }
    
  
    
    @IBAction func AddToCardAction(_ sender: Any) {
        if self.flagToShoworder == 0{
        AddToCardOutlet.setTitle("Show order", for: .normal)
           // self.flagToShoworder = 1
        }else{
            performSegue(withIdentifier: "ShowMyOrder", sender: self)
        }
       
    }
    
    @IBAction func ShoworderAction(_ sender: Any) {
        self.flagToShoworder = 1

    }
    @IBAction func ReduceOrderAction(_ sender: Any) {
        if Int(orderNumber.text!)! - 1 > 0{
        orderNumber.text = String(Int(orderNumber.text!)! - 1)
        }
    }
    
    @IBAction func IncreaseOrderAction(_ sender: Any) {
        orderNumber.text = String(Int(orderNumber.text!)! + 1)
        
    }
    
    
}
