//
//  RestaurantListViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

struct RestaurantListViewConfiguration {
    
    let restaurants: [Restaurant]
}

class RestaurantListViewController: UIViewController {
    
    private let restaurantListView:RestaurantListView = {
        let view = RestaurantListView(frame: .zero)
        return view
    }()
    
    init(navigationController:UINavigationController, category:Category) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = category.name
        
        self.restaurantListView.setNavigationController(navigationController)
        
        self.restaurantListView.updateTableView(restaurants: category.restaurantList)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = restaurantListView
    }
}
