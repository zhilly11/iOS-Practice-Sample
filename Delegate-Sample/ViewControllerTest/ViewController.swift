//
//  ViewController.swift
//  ViewControllerTest
//
//  Created by 최지혁 on 2022/09/06.
//

import UIKit

class ViewController: UIViewController, testDelegate {
    
    @IBOutlet weak var firstStcokLabel: UILabel!
    
    var stockValue = Stock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstStcokLabel.text = String(stockValue.stock)
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        let editVC = storyboard?.instantiateViewController(identifier: "StockViewController") as! EditStockViewController
        editVC.delegate = self
        editVC.newStock = stockValue.stock
        
        //present(editVC, animated: true, completion: nil)
        show(editVC, sender: nil)
    }
    
    func sendData(amount: Double) {
        stockValue.stock = amount
        firstStcokLabel.text = String(stockValue.stock)
    }
    
}

