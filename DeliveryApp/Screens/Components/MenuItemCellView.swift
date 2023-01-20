//
//  MenuItemCellView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class MenuItemCellView: UITableViewCell {
    
    let identifier = "MenuItemCellView"
    
    private let infoView:UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let labelName:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 15, weight: .regular)
        return view
    }()
    
    private let labelPrice:UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textColor = .lightGray
        return view
    }()
    
    private let menuItemImage:UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "pizza.jpeg")
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    func setupCell(_ menu:MenuItem){
        labelName.text = menu.name
        labelPrice.text = "R$\(Float(menu.price))"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    init(){
        super.init(style: .default, reuseIdentifier: identifier)
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
        infoView.addSubview(labelName)
        infoView.addSubview(labelPrice)
        
        self.addSubview(infoView)
        self.addSubview(menuItemImage)
    }
    
    private func setupConstraints(){
        
        let infoViewConstraints = [
            infoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            infoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            infoView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            infoView.heightAnchor.constraint(greaterThanOrEqualToConstant: 64)
        ]
        
        let labelNameConstraints = [
            labelName.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 18),
            labelName.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15),
            labelName.widthAnchor.constraint(equalToConstant: 263)
        ]
        
        let labelPriceConstraints = [
            labelPrice.topAnchor.constraint(equalTo: self.labelName.bottomAnchor, constant: 0),
            labelPrice.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15),
            labelName.widthAnchor.constraint(equalToConstant: 263)
        ]
        
        let menuItemImageConstraints = [
            menuItemImage.widthAnchor.constraint(equalToConstant: 64),
            menuItemImage.heightAnchor.constraint(equalToConstant: 64),
            menuItemImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            menuItemImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ]
         
        
        NSLayoutConstraint.activate(
            infoViewConstraints +
            labelNameConstraints +
            labelPriceConstraints +
            menuItemImageConstraints
        )
        
    }
    
}



#if DEBUG
import SwiftUI

struct MenuItemCellView_Preview: PreviewProvider {
    static var previews: some View {
        let view = MenuItemCellView()
        view.setupCell(MenuItem(category: "Cáfé da manhã", name: "Copo Pão de Queijo + Suco de Laranja", price: 20))
        return view.showPreview()
    }
}
#endif

