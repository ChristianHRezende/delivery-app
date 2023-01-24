//
//  RestaurantDetailsView.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

final class RestaurantDetailsView: UIView {
    
    
    private let containerView:UIView = {
        let view  = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let restaurantInfoView:RestaurantInfoView = {
        let view = RestaurantInfoView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let ratingView:RatingView = {
        let view = RatingView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let menuList:MenuListView = {
        let view = MenuListView(frame: .zero, style: .plain)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func updateView(with restaurantDetails: RestaurantDetails,restaurant:Restaurant) {
        
        self.restaurantInfoView.updateData(with: restaurant)
        self.ratingView.updateData(with: restaurantDetails)
        self.menuList.updateView(with: restaurantDetails.menu)
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
        self.backgroundColor = .white
        
        self.addSubview(containerView)
        
        
        containerView.addSubview(restaurantInfoView)
        containerView.addSubview(ratingView)
        containerView.addSubview(menuList)
        
    }
    
    private func setupConstraints(){
        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        
        let  restaurantInfoViewConstraints = [
            restaurantInfoView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0),
            restaurantInfoView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0),
            restaurantInfoView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
        ]
        
        let  ratingViewConstraints = [
            ratingView.topAnchor.constraint(equalTo: self.restaurantInfoView.bottomAnchor, constant: 0),
            ratingView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 0),
            ratingView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 0),
        ]
        
        let menuListConstraints = [
            self.menuList.topAnchor.constraint(equalTo: self.ratingView.bottomAnchor, constant: 0),
            self.menuList.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.menuList.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.menuList.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            self.menuList.heightAnchor.constraint(greaterThanOrEqualToConstant: 600)
        ]
        
        NSLayoutConstraint.activate(
            containerViewConstraints +
            restaurantInfoViewConstraints +
            ratingViewConstraints +
            menuListConstraints
        )
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

