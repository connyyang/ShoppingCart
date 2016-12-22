//
//  ShoppingCart.swift
//  ShoppingCart
//
//  Created by Conny Yang on 22/12/2016.
//  Copyright © 2016 Conny Yang. All rights reserved.
//

import UIKit

class ShoppingCart
{
    var selectedItems : [String : (Product, Int)] = [:]
    
    var shoppingProduct : [(Product, Int)] = []
    
    var total : Double = 0.0
    
    static func calTotal(shopCart : [String : (Product, Int)]) -> Double
    {
        var total : Double = 0.0
        for (_ , (product,qty)) in shopCart
        {
            total = total + product.productPrice * Double(qty)
        }
        
        return total
    }
    
    func addItem(uid : String , product : Product, qty: Int)
    {
        selectedItems[uid] = (product, qty)

    }
    
    func removeItem(uid : String)
    {
        selectedItems.removeValue(forKey: uid)
    }
    
    func reset()
    {
        selectedItems = [:]
        total = 0
    }
}
