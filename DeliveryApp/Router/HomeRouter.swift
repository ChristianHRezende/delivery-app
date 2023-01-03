//
//  HomeRouter.swift
//  DeliveryApp
//
//  Created by Christian Rezende on 02/01/23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    static var navigationController:UINavigationController? {get,set}
    
    static func goToRestaurantListView()->Void
}

class HomeRouter:HomeRouterProtocol{
    
    static var navigationController:UINavigationController?
    
    init(navigationController:UINavigationController) {
        HomeRouter.navigationController = navigationController
    }
    
    static func goToRestaurantListView(){
        navigationController?.pushViewController(RestaurantListViewController(), animated: true)
    }
    
}
