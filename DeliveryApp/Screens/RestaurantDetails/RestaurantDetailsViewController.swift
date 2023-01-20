//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    private let deliveryApi = DeliveryApi()
    
    private var restaurant:Restaurant!

    private  var restaurantDetailsView: RestaurantDetailsView = {
        let restaurantDetailsView = RestaurantDetailsView()
        return restaurantDetailsView
    }()

    init(_ restaurant:Restaurant) {
        super.init(nibName: nil, bundle: nil)
        self.restaurant = restaurant
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
    
        self.view = restaurantDetailsView
    }

    override func viewDidLoad() {

        deliveryApi.fetchRestaurantDetails { restaurantDetails in

            guard let restaurantDetails = restaurantDetails else {
                return
            }
            
            DispatchQueue.main.async {

                self.restaurantDetailsView.updateView(with: restaurantDetails,restaurant: self.restaurant)
            }
        }
    }
}

#if DEBUG
import SwiftUI

struct RestaurantDetailsViewController_Preview: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsViewController(.stub()).showPreview()
    }
}
#endif
