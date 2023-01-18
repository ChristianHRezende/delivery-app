//
//  RestaurantDetailsView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

final class RestaurantDetailsView: UIView {
    
    private lazy var restaurantInfoView:RestaurantInfoView = {
        let view = RestaurantInfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ratingView:RatingView = {
        let view = RatingView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func updateView(with restaurantDetails: RestaurantDetails,restaurant:Restaurant) {
        
        self.restaurantInfoView.updateData(with: restaurant)
        self.ratingView.updateData(with: restaurantDetails)
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews(){
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews(){
        self.backgroundColor = .lightGray
        
        self.addSubview(restaurantInfoView)
        self.addSubview(ratingView)
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([

            restaurantInfoView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0.5),
            restaurantInfoView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            restaurantInfoView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            ratingView.topAnchor.constraint(equalTo: self.restaurantInfoView.bottomAnchor, constant: 0),
            ratingView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            ratingView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
        ])
    }
    
    
}

#if DEBUG
import SwiftUI

struct RestaurantDetailsView_Preview: PreviewProvider {
    static var previews: some View {
        let view = RestaurantDetailsView()
        view.updateView(with: .stub(), restaurant: .stub())
        return view.showPreview()
        
    }
}
#endif

