//
//  TransactionModel.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import Combine
import SwiftUI


// MARK: - TransactionModel



class TransactionModel: ObservableObject  {
    enum Category: String, CaseIterable {
        case food
        case health
        case entertainment
        case shopping
        case travel
    }
    
    enum Provider: String {
        case amazon
        case americanAirlines
        case burgerKing
        case cvs
        case exxonmobil
        case jCrew
        case starbucks
        case timeWarner
        case traderJoes
        case uber
        case wawa
        case wendys
    }
    
    var id: Int = 0
    var name: String = ""
    var category: Category
    var amount: Double
    let date: Date
    let accountName: String
    var provider: Provider? = nil
    
    init(id: Int,
         name: String,
         category: Category,
         amount: Double,
         date: Date,
         accountName: String,
         provider: Provider) {
        self.id = id
        self.name = name
        self.category = category
        self.amount = amount
        self.date = date
        self.accountName = accountName
        self.provider = provider
        
    }
}

extension TransactionModel: Identifiable {}

// MARK: - Category

extension TransactionModel.Category: Identifiable {
    var id: String {
        rawValue
    }
}

extension TransactionModel.Category {
    static subscript(index: Int) -> Self? {
        guard
            index >= 0 &&
            index < TransactionModel.Category.allCases.count
        else {
            return nil
        }
        
        return TransactionModel.Category.allCases[index]
    }
}

