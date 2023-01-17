//
//  RestaurantListView.swift
//  DeliveryAppChallenge
//
//

import UIKit

class RestaurantListView: UITableView {
    
    var restaurantList: [Restaurant] = []
    
    private var navigationController:UINavigationController?
    
    func setNavigationController(_ navigationController:UINavigationController?){
        self.navigationController = navigationController
    }
    
    func updateTableView(restaurants: [Restaurant]) {
        self.restaurantList = restaurants
        
        self.reloadData()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.backgroundColor = .white
        
        self.register(RestaurantCellView.self, forCellReuseIdentifier: "RestaurantCellView")
        self.delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRestaurant = restaurantList[indexPath.row]
        goToRestaurantDetail(selectedRestaurant)
    }
    
    func goToRestaurantDetail(_ selectedRestaurant:Restaurant){
        guard let navigationController = navigationController else {
            fatalError("navigationController is null")
        }
        navigationController.pushViewController(RestaurantDetailsViewController(selectedRestaurant), animated: true)
    }
    
}

extension RestaurantListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "RestaurantCellView") as! RestaurantCellView
        
        cell.setupCell(restaurant: restaurantList[indexPath.row])
        return cell
    }
}

#if DEBUG
import SwiftUI

struct RestaurantListView_Preview: PreviewProvider {
    static var previews: some View {
        let restaurantListView = RestaurantListView()
        
        restaurantListView.updateTableView(restaurants: [.stub(), .stub(), .stub(), .stub(), .stub()])
        return restaurantListView.showPreview()
    }
}
#endif
