//
//  ProductStore.swift
//  ShoppingCart
//
//  Created by Conny Yang on 21/12/2016.
//  Copyright © 2016 Conny Yang. All rights reserved.
//

import UIKit


class ProductStore
{

    class func getAllProducts() -> [Product]
    {
        var products : [Product] = []

        let ipadPro = Product(productID: "uid1234", productName: "iPad Pro", productPrice: 599.0, productQty: 0 , productImg : #imageLiteral(resourceName: "img_ipad"))
        
        let appleWatch = Product(productID: "uid12222", productName: "Apple Watch", productPrice: 299.0, productQty: 0, productImg: #imageLiteral(resourceName: "img_watch"))
        
        let appleTV = Product(productID: "uid15643", productName: "Apple TV", productPrice: 399.0, productQty: 0, productImg: #imageLiteral(resourceName: "img_tv"))
        
        products.append(ipadPro)
        products.append(appleWatch)
        products.append(appleTV)
        
        return products
    }
}
