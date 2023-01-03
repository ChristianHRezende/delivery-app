//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let deliveryApi = DeliveryApi()

    lazy var homeView: HomeView = {
        
        let homeView = HomeView(self.navigationController)
        homeView.addressView.delegate = self
        return homeView
    }()
    
    private lazy var addressView: AddressView = {
        let addressView = AddressView()

        return addressView
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Delivery App"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        deliveryApi.fetchRestaurants { restaurants in

            guard let restaurants = restaurants else {
                return
            }

            DispatchQueue.main.async {
                let tableView = self.homeView.tableView
                
                tableView.updateTableView(restaurants: restaurants)
                
                let categoryListView = self.homeView.categoryCollectionView
                
                categoryListView.updateView(restaurants.map({ restaurant in
                    let restaurantListByCategory = restaurants.filter { currentRestaurant in
                        currentRestaurant.category == restaurant.category
                    }
                    return Category(name: restaurant.category, imageName: "pizza.png",restaurantList: restaurantListByCategory)
                }))
                
            }
        }
        
    }

    override func viewDidLoad() {

        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    override func loadView() {
        self.view = homeView
    }
    
}

extension HomeViewController: AddressViewDelegate {
    
    func pushAddresSearchView() {
        let controller = AddressSearchViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

#if DEBUG
import SwiftUI

struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        HomeViewController().showPreview()
    }
}
#endif
 
