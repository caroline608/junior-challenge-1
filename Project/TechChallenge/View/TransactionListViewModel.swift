//
//  ViewModel.swift
//  TechChallenge
//
//  Created by Caroline Cruz on 7/16/22.
//

import SwiftUI
import Combine


class TransactionListViewModel: ObservableObject {
    @Published var transactions: [TransactionModel]
    @Published var selectedCategory: TransactionModel.Category?
   
    init(transactions: [TransactionModel]){
        self.transactions = transactions
    }
    
    func filterCategories(category:String) -> [TransactionModel] {
        var filtered:[TransactionModel] = []
        for category in transactions where category.category.rawValue == selectedCategory?.rawValue {
            filtered.append(category)
        }
        return filtered
    }
    
    func totalSpent(for category: String) -> Double {
        var total = 0.0
        let filteredTransaction = filterCategories(category: selectedCategory?.rawValue ?? "all")
        
        total = filteredTransaction.map(\.amount).reduce(0.0, +)

        return total

        }
        
        
    
}
