//
//  MenuItemListHeaderView.swift
//  DeliveryApp
//
//  Created by Christian Rezende on 20/01/23.
//

import UIKit

class MenuItemListHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "MenuItemListHeaderView"

    private let  categoryLabel:UILabel = {
        
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 20, weight: .semibold)
        return view
    }()
    
    func setupView(_ category:String){
        self.categoryLabel.text = category
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    init(){
        super.init(reuseIdentifier: MenuItemListHeaderView.identifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setupViews(){
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews(){
        self.contentView.addSubview(categoryLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 21),
            categoryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            categoryLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)

        ])
    }
    
    
}



#if DEBUG
import SwiftUI

struct MenuItemListHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        
        let view = MenuItemListHeaderView()
        view.setupView("Café da manhã")
        return view.showPreview()
    }
}

#endif
