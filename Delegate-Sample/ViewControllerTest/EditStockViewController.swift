//
//  StockView.swift
//  ViewControllerTest
//
//  Created by 최지혁 on 2022/09/06.
//

import UIKit

protocol testDelegate {
    func sendData(amount: Double)
}

class EditStockViewController: UIViewController {
    @IBOutlet weak var secondStockLabel: UILabel!
    @IBOutlet weak var secondStepper: UIStepper!
    
    var newStock: Double = 0
    var delegate: testDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondStepper.stepValue = 1
        secondStepper.value = newStock
        secondStockLabel.text = String(newStock)
    }
   
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        delegate?.sendData(amount: newStock)
    }
     
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        newStock = secondStepper.value
        secondStockLabel.text = String(newStock)
    }
}
