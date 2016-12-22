//
//  ShoppingViewController.swift
//  ShoppingCart
//
//  Created by Conny Yang on 21/12/2016.
//  Copyright © 2016 Conny Yang. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    @IBOutlet weak var itemName1: UILabel!
    
    @IBOutlet weak var itemPrice1: UILabel!
    
    @IBOutlet weak var itemQty1: UILabel!
    
    @IBOutlet weak var itemImage1: UIImageView!
    
    
    var itemQuantity1 : Int = 0
    
    @IBOutlet weak var itemName2: UILabel!
    
    @IBOutlet weak var itemPrice2: UILabel!
    
    @IBOutlet weak var itemQty2: UILabel!
    
    @IBOutlet weak var itemImage2: UIImageView!
    
    
    var itemQuantity2 : Int = 0
    
    @IBOutlet weak var itemName3: UILabel!
    
    @IBOutlet weak var itemPrice3: UILabel!
    
    @IBOutlet weak var itemQty3: UILabel!
    
    @IBOutlet weak var itemImage3: UIImageView!
    
    
    var itemQuantity3 : Int = 0

    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var item1Stepper: UIStepper!
    
    var totalPrice : Double = 0
    
    var shoppingCart : ShoppingCart!
    
    var products : [Product] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        products = ProductStore.getAllProducts()
        
        shoppingCart = ShoppingCart()
        
        
        
        updateUI()
        
      //  item1Stepper.wraps = true
      //  item1Stepper.autorepeat = true
      //  item1Stepper.maximumValue = 10
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if shoppingCart.total == 0
        {
            shoppingCart.reset()
            
            itemQuantity1 = 0
            itemQuantity2 = 0
            itemQuantity3 = 0
            updateUI()
        }
        
    }
    
    @IBAction func stepper1DidTap(_ sender: UIStepper) {
        
        itemQty1.text = Int(sender.value).description
        
        itemQuantity1 = Int(sender.value)
        
       // products[0].productQty = itemQuantity1
        
        updateShoppingCart(qty : itemQuantity1, product : products[0])
        
        updateUI()
        
        //print(shoppingCart)
    }
 

    @IBAction func stepper2DidTap(_ sender: UIStepper) {
        
        itemQty2.text = Int(sender.value).description
        
        itemQuantity2 = Int(sender.value)
        
      //  products[1].productQty = itemQuantity2
        
        updateShoppingCart(qty : itemQuantity2, product : products[1])
        
        updateUI()
    }
    

    @IBAction func stepper3DidTap(_ sender: UIStepper) {
        
        itemQty3.text = Int(sender.value).description
        
        itemQuantity3 = Int(sender.value)
        
     //   products[2].productQty = itemQuantity3
        
        updateShoppingCart(qty : itemQuantity3, product : products[2])
        
        updateUI()
    }

    @IBAction func placeOrder(_ sender: Any) {
    }
    
    func updateShoppingCart(qty : Int, product : Product)
    {
        let uid = product.productID
        //product.productQty = qty
        if qty == 0
        {
           // shoppingCart.removeValue(forKey: uid)
            
            shoppingCart.removeItem(uid: uid)
        }
        else
        {
           // shoppingCart[uid] = product
            shoppingCart.addItem(uid: uid, product: product, qty: qty)
        }
    }
    
    func updateUI()
    {
        
        let item1 = products[0]
        itemName1.text = item1.productName
        itemPrice1.text = "$"+String(item1.productPrice)
        itemQty1.text = String(itemQuantity1)
        itemImage1.image = item1.productImg
        
        let item2 = products[1]
        itemName2.text = item2.productName
        itemPrice2.text = "$"+String(item2.productPrice)
        itemQty2.text = String(itemQuantity2)
        itemImage2.image = item2.productImg

        let item3 = products[2]
        itemName3.text = item3.productName
        itemPrice3.text = "$"+String(item3.productPrice)
        itemQty3.text = String(itemQuantity3)
        itemImage3.image = item3.productImg
        
        totalPrice = ShoppingCart.calTotal(shopCart: shoppingCart.selectedItems)
        shoppingCart.total = totalPrice
        total.text = String(totalPrice)
    }
    
    func resetUI()
    {
        let item1 = products[0]
        itemName1.text = item1.productName
        itemPrice1.text = "$"+String(item1.productPrice)
        itemQty1.text = String(itemQuantity1)
        itemImage1.image = item1.productImg
        
        let item2 = products[1]
        itemName2.text = item2.productName
        itemPrice2.text = "$"+String(item2.productPrice)
        itemQty2.text = String(itemQuantity2)
        itemImage2.image = item2.productImg
        
        let item3 = products[2]
        itemName3.text = item3.productName
        itemPrice3.text = "$"+String(item3.productPrice)
        itemQty3.text = String(itemQuantity3)
        itemImage3.image = item3.productImg
    }
 

    struct StoryBoard
    {
        static var showCheckoutView = "ShowCheckoutView"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoryBoard.showCheckoutView
        {
            if let checkoutViewController = segue.destination as? CheckoutViewController
            {
                checkoutViewController.shoppingCart = shoppingCart
            }
            
        }
    }
}
