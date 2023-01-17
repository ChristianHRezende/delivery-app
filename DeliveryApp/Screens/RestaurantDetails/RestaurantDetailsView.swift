//
//  RestaurantDetailsView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class RestaurantDetailsView: UIView {
    
    private var restaurant:Restaurant!
    private var restaurantDetails:RestaurantDetails!

    
    private lazy var restaurantInfoView:RestaurantInfoView = {
        let view = RestaurantInfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func updateView(with restaurantDetails: RestaurantDetails,restaurant:Restaurant) {
        self.restaurant = restaurant
        self.restaurantDetails = restaurantDetails
        
        self.restaurantInfoView.updateData(with: restaurant)
    }
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews(){
        self.backgroundColor = .lightGray
        
        self.addSubview(restaurantInfoView)
      
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.restaurantInfoView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.restaurantInfoView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.restaurantInfoView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
    }
}

#if DEBUG
import SwiftUI

struct RestaurantDetailsView_Preview: PreviewProvider {
    static var previews: some View {
        RestaurantDetailsView().showPreview()
    }
}
#endif

