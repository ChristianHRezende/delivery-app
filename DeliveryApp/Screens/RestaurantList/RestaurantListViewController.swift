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
    
    let restaurantListView = RestaurantListView()
    

    init(category:Category) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = category.name
        self.restaurantListView.updateTableView(restaurants: category.restaurantList)
        self.restaurantListView.setNavigationController(self.navigationController)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = restaurantListView
    }
    
    
    
}
