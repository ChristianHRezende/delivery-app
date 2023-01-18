//
//  RestaurantInfoView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class RestaurantInfoView: UIView {
    private var restaurant:Restaurant?
    
    private let restaurantNameLabel:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 22, weight: .bold)
        return view
    }()
    
    private let restaurantDeliveryTimeLabel:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 15)
        return view
    }()
    
    private let restaurantImage:RestaurantImageView = {
        let view = RestaurantImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    

    private let mainDetailsView:UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData(with restaurant:Restaurant){
        self.restaurantNameLabel.text = restaurant.name
        self.restaurantDeliveryTimeLabel.text = "\(restaurant.category) + \(restaurant.deliveryTime.min)-\(restaurant.deliveryTime.max)"
    }
    
    
    private func setupViews(){
        
        self.mainDetailsView.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews(){
        
        self.mainDetailsView.addSubview(restaurantNameLabel)
        self.mainDetailsView.addSubview(restaurantDeliveryTimeLabel)
        self.mainDetailsView.addSubview(restaurantImage)
        
        self.addSubview(self.mainDetailsView)
        
    }
    
    private func setupConstraints(){
        
        let restaurantNameConstraints = [
            restaurantNameLabel.topAnchor.constraint(equalTo: self.mainDetailsView.topAnchor, constant: 21),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: self.mainDetailsView.leadingAnchor, constant: 21),
        ]
        
        let restaurantDeliveryTimeLabelConstraints = [
            self.restaurantDeliveryTimeLabel.topAnchor.constraint(equalTo: self.restaurantNameLabel.bottomAnchor, constant: 10),
            self.restaurantDeliveryTimeLabel.leadingAnchor.constraint(equalTo: self.mainDetailsView.leadingAnchor, constant: 21),
           
            self.restaurantDeliveryTimeLabel.bottomAnchor.constraint(equalTo: self.mainDetailsView.bottomAnchor, constant: -23.5)
        ]
        
        let restaurantImageConstraints = [
            self.restaurantImage.heightAnchor.constraint(equalToConstant: 48),
            self.restaurantImage.widthAnchor.constraint(equalToConstant: 48),
            self.restaurantImage.centerYAnchor.constraint(equalTo: self.mainDetailsView.centerYAnchor),
            self.restaurantImage.trailingAnchor.constraint(equalTo: self.mainDetailsView.trailingAnchor, constant: -19)
        ]
        
        let mainDetailsViewConstraints =  [
            self.mainDetailsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.mainDetailsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 102)

        ]
        
        
        NSLayoutConstraint.activate(
            mainDetailsViewConstraints +
            restaurantNameConstraints +
            restaurantDeliveryTimeLabelConstraints +
            restaurantImageConstraints
        )
    }
}
    


#if DEBUG
import SwiftUI

struct RestaurantInfoView_Preview: PreviewProvider {
    static var previews: some View {
        let emptyView = RestaurantInfoView()
        emptyView.updateData(with: .stub())
        return emptyView.showPreview()
    }
}

#endif
