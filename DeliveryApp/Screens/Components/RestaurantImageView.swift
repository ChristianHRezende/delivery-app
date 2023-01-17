//
//  RestaurantImageView.swift
//  DeliveryApp
//
//  Created by Christian Rezende on 10/01/23.
//

import UIKit

class RestaurantImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 24
        self.clipsToBounds = true
        self.image = UIImage(named: "restaurant-logo")

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

#if DEBUG
import SwiftUI

struct RestaurantImageView_Preview: PreviewProvider {
    static var previews: some View {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        let view = RestaurantImageView(frame: CGRect(x: 0, y: 0, width: 54, height: 54))
        
        container.addSubview(view)
      
        return container.showPreview()
    }
}

#endif
