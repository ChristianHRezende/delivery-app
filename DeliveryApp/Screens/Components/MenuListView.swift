//
//  MenuListView.swift
//  DeliveryApp
//
//  Created by Rodrigo Soares on 01/12/22.
//

import UIKit

class MenuListView: UITableView {
    private var menuItemsTableSections:[String:[MenuItem]]?
    private var keysMenuItems:Set<String>?
    
    func updateView(with menuItems:[MenuItem]){
        var menuItemsSection:[String:[MenuItem]]?
        var keys:Set<String>?
        
        // MARK: create a library with section and its values cells
        menuItems.forEach { item in
            if  menuItemsSection != nil {
                if menuItemsSection![item.category] != nil {
                    menuItemsSection![item.category]!.append(item)
                }else {
                    menuItemsSection![item.category] = [item]
                }
            }else{
                menuItemsSection = [item.category: [item]]
            }
            if keys != nil {
                keys!.insert(item.category)
            }else {
                keys = [item.category]
            }
            
        }
        
        menuItemsTableSections = menuItemsSection
        keysMenuItems = keys
        
        self.reloadData()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        setupViews()
    }
    
    init(){
        super.init(frame: .zero, style: .plain)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews(){
        
        self.register(MenuItemCellView.self, forCellReuseIdentifier: MenuItemCellView.identifier)
        self.register(MenuItemListHeaderView.self, forHeaderFooterViewReuseIdentifier: MenuItemListHeaderView.identifier)
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
    }
    
}

extension MenuListView: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let keys = keysMenuItems  {
            return keys.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let menuItems = menuItemsTableSections {
            if let keys = keysMenuItems {
                let key:String = Array(keys)[section]
                return menuItems[key]!.count
            }
            
        }
        return 0
    }
    
    // MARK: not custom Section Header
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        if let keys  =  keysMenuItems {
    //            return Array(keys)[section]
    //        }
    //        return ""
    //    }
    
    
    
    // MARK: custom Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = dequeueReusableHeaderFooterView(withIdentifier: MenuItemListHeaderView.identifier) as? MenuItemListHeaderView
        
        guard let menuHeaderView = view else {
            fatalError("The MenuItemListHeaderView is nil")
        }
        if let keys = keysMenuItems {
            menuHeaderView.setupView(Array(keys)[section])
        }
        
        return menuHeaderView
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: MenuItemCellView.identifier) as? MenuItemCellView else{
            fatalError("cell is not from a MenuItemCellView type")
        }
        if let menuItems = menuItemsTableSections {
            if let keys = keysMenuItems {
                let category = Array(keys)[indexPath.section]
                let name = menuItems[category]?[indexPath.row].name ?? ""
                cell.setupCell(MenuItem(category: category, name: name, price: 20))
            }
        }
        return cell
    }
}

#if DEBUG
import SwiftUI

struct MenuListView_Preview: PreviewProvider {
    static var previews: some View {
        
        let view = MenuListView()
        view.updateView(
            with:
                [
                    MenuItem(category: "Market", name: "bread", price: 2),
                    MenuItem(category: "Market", name: "drink", price: 2),
                    MenuItem(category: "Bar", name: "beer", price: 2),
                    MenuItem(category: "Bar", name: "wine", price: 2),
                    
                ]
        )
        
        return view.showPreview()
    }
}

#endif
