//
//  Models.swift
//  Cash Register
//
//  Created by Arch Umeshbhai Patel on 2025-02-21.
//

import Foundation


class Product {
    var id : UUID = UUID()
    var name: String = ""
    var quantity : Int = 0
    var price : Int = 0
    
    init(name: String, quantity: Int, price: Int) {
        self.name = name
        self.quantity = quantity
        self.price = price
    }
}


class ProductManager{
    var productList : [Product] = [
        Product(name: "Pants", quantity: 100, price: 20),
        Product(name: "Shoes", quantity: 50, price: 50),
        Product(name: "Hats", quantity: 40, price: 30),
        Product(name: "Tshirts", quantity: 100, price: 15),
        Product(name: "Dresses", quantity: 200, price: 80),
    ]
        
        
    func addNewStudent(newProduct: Product) {
        productList.append(newProduct)
    }
        
    func deleteOneStudent(idtodelete: UUID)  {
        productList.removeAll { product in
            return product.id == idtodelete
        }
    }
    
    func updateQuantity(productID:UUID, newQuatity:Int){
        let product = productList.first { Product in
                Product.id == productID
            }
        if (product != nil) {
            product?.quantity = newQuatity
        }
    }
    
    func buyProduct(productID:UUID, newQuatity:Int){
        let product = productList.first { Product in
                Product.id == productID
            }
        if (product != nil) {
            product?.quantity -= newQuatity
        }
    }
    
    func isAvaliable(productID:UUID, quatity:Int) -> Bool{
        let product = productList.first { Product in
                Product.id == productID
            }
        if (product != nil && quatity <= product!.quantity) {
            return true
        }
        else{
            return false
        }
    }
}
