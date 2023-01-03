//
//  HomeView+Updating.swift
//  DeliveryApp
//
//  Created by Christian Rezende on 23/12/22.
//

import UIKit


extension HomeViewController:UISearchResultsUpdating {
    
    private func findMatches(searchString:String) -> NSCompoundPredicate{
        var searchItemsPredicate = [NSPredicate]()
        
        let keyPath = Restaurant.ExpressionKeys.name.rawValue
        
        let nameExpression = NSExpression(forKeyPath: keyPath)
        
        let searchStringExpression = NSExpression(forConstantValue: searchString)
        
        let nameSearchComparisonPredicate =
        NSComparisonPredicate(leftExpression: nameExpression, rightExpression: searchStringExpression,
                              modifier: .direct,
                              type:.contains,
                              options: [.caseInsensitive,.diacriticInsensitive])
        
        searchItemsPredicate.append(nameSearchComparisonPredicate)
        
        // Hear we can append more predicate by property of the entity
        
        let finalCompoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: searchItemsPredicate)
        
        return finalCompoundPredicate
        
    }
    
    func updateSearchResults(for searchController:UISearchController){
        let tableView = self.homeView.tableView
        let searchResults = tableView.restaurantList
        
        let whitespaceCharacterSet = CharacterSet.whitespaces
        let strippedString = searchController.searchBar.text!.trimmingCharacters(in: whitespaceCharacterSet)
        let searchItems = strippedString.components(separatedBy: " ") as [String]
        
        if(searchItems.count == 0 || searchItems[0].isEmpty){
            return
        }
        let andMatchPredicates: [NSPredicate] = searchItems.map { searchString in
            findMatches(searchString:searchString)
        }
        
        let finalCompoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: andMatchPredicates)
        
        let filteredResults =  searchResults.filter{
            finalCompoundPredicate.evaluate(with: $0)
        }
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("search bar")
        let searchController = searchController
        print("searchController",searchController)
        let textSearchBar = searchController.searchBar.text
        if (!textSearchBar!.isEmpty){
            updateSearchResults(for: searchController)
        }
        
    }
    
}
