//
//  ProductImage.swift
//  DeliveryApp
//
//  Created by Christian Rezende on 22/12/22.
//

import UIKit

class ProductImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 14
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

#if DEBUG
import SwiftUI

struct ProductImageView_Preview: PreviewProvider {
    static var previews: some View {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        let view = ProductImageView(frame: CGRect(x: 0, y: 0, width: 54, height: 54))
        
        view.image = UIImage(named: "pizza.jpeg")
        container.addSubview(view)
      
        return container.showPreview()
    }
}

#endif
