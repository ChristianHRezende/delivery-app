//
//  RatingView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class RatingView: UIView {

    
    private let ratingLabel:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 15)

        return view
    }()
    
    private let ratingQtdLabel:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .lightGray
        view.font = .systemFont(ofSize: 13)

        return view
    }()
    
    private let ratingDetailsView:UIView = {
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
    
    func updateData(with restaurantDetails:RestaurantDetails){
        func countStars(_ detailsScore:Float) -> String {
            var starsString = ""
            let value = Int(round(detailsScore))
            for _ in 0..<value {
                starsString += "★"
            }
           
            return starsString
        }
        self.ratingLabel.text = "\(restaurantDetails.reviews.score) \(countStars(restaurantDetails.reviews.score))"
        self.ratingQtdLabel.text = "\(restaurantDetails.reviews.count) avaliações"
    }
    
    private func setupViews(){
        self.ratingDetailsView.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews(){
        
        self.ratingDetailsView.addSubview(ratingLabel)
        self.ratingDetailsView.addSubview(ratingQtdLabel)
        
        self.addSubview(self.ratingDetailsView)
        
    }
    
    private func setupConstraints(){
      
        let ratingDetailsViewConstraints = [
            self.ratingDetailsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.ratingDetailsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.heightAnchor.constraint(greaterThanOrEqualToConstant: 73)
        ]
        
        let ratingLabelConstraints = [
            self.ratingLabel.topAnchor.constraint(equalTo:  self.ratingDetailsView.topAnchor, constant: 24.5),
            self.ratingLabel.leadingAnchor.constraint(equalTo: self.ratingDetailsView.leadingAnchor, constant: 21),
            self.ratingLabel.bottomAnchor.constraint(equalTo: self.ratingDetailsView.bottomAnchor, constant: -29.5)
        ]
        
        let ratingQtdLabelConstraints = [
            self.ratingQtdLabel.topAnchor.constraint(equalTo: self.ratingDetailsView.topAnchor, constant: 24.5),
            self.ratingQtdLabel.trailingAnchor.constraint(equalTo: self.ratingDetailsView.trailingAnchor, constant: -19),
        ]
        
        NSLayoutConstraint.activate(
            ratingDetailsViewConstraints +
            ratingLabelConstraints +
            ratingQtdLabelConstraints
        )
    }
}

#if DEBUG
import SwiftUI

struct RatingView_Preview: PreviewProvider {
    static var previews: some View {
        let view = RatingView()
        view.updateData(with: .stub())
        return view.showPreview()
    }
}

#endif
