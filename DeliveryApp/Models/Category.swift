//
//  Category.swift
//  DeliveryApp
//
//  Created by José Vitor Scheffer Boff dos Santos on 16/12/22.
//

import Foundation

struct Category: Decodable, Hashable {
  
    let name: String
    let imageName: String
    let restaurantList:[Restaurant]
    
    static func == (lhs: Category, rhs: Category) -> Bool {
       return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
    }
}



#if DEBUG
extension Category {
    
    static func stub() -> Category {
        Category(
            name: "Mercado",
            imageName: "pizza.jpeg",
            restaurantList: [.stub(),.stub(),.stub()]
        )
    }
    
}
#endif
