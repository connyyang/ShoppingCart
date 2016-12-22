//
//  CheckoutViewController.swift
//  ShoppingCart
//
//  Created by Conny Yang on 21/12/2016.
//  Copyright © 2016 Conny Yang. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    
    var shoppingCart : ShoppingCart!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    @IBOutlet weak var standardIcon: UIButton!
    
    @IBOutlet weak var expressIcon: UIButton!
    
    var totalPrice : Double = 0.0
    
    let expressFee : Double = 15
    
    var totalPriceIncludeDeliver : Double = 0
    
    @IBAction func confirmOrderDidTap(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Confirm Order", message: "Please confirm that you want to make a payment of \(totalPriceIncludeDeliver)", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (action) in
            
            let feedbackController = UIAlertController(title: "Thank you!", message: "Your payment of \(self.totalPriceIncludeDeliver) was processed successfully!\nPlease check your email for our order receipt email and shipping information.", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            let shopmoreAction = UIAlertAction(title: "Let's Shop More", style: UIAlertActionStyle.default, handler: { (action) in
                self.shoppingCart.reset()
                self.navigationController!.popViewController(animated: true)
            })
            
            feedbackController.addAction(shopmoreAction)
            self.present(feedbackController, animated: true, completion: nil)
            
            
            
            })
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func standardIconDidTap(_ sender: Any) {
        
       standardIcon.isEnabled = false
        expressIcon.isEnabled = true
        
        totalPriceIncludeDeliver = totalPrice
        
        totalPriceLabel.text = "$\(totalPriceIncludeDeliver)"
    }
    
    
    @IBAction func expressIconDidTap(_ sender: Any) {
        standardIcon.isEnabled = true
        expressIcon.isEnabled = false
        
        totalPriceIncludeDeliver = totalPrice + expressFee
        totalPriceLabel.text = "$\(totalPriceIncludeDeliver)"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPrice = ShoppingCart.calTotal(shopCart: shoppingCart.selectedItems)
        shoppingCart.total = totalPrice
        totalPriceLabel.text = "$\(totalPrice)"
        
        standardIcon.isEnabled = false
        
        totalPriceIncludeDeliver = totalPrice
    }

    
}
