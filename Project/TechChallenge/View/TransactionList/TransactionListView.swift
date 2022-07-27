//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    
   
    @ObservedObject var transactions: TransactionListViewModel
    
    let category:[TransactionModel.Category]
//   let transactions: [TransactionModel] = ModelData.sampleTransactions
    
   
    
    var body: some View {
        
        VStack {
            CategoriesView(category: category, transactions: transactions)
        
        Spacer()

        
        
        List {
            
            ForEach(transactions.filterCategories(category: transactions.selectedCategory?.rawValue ?? "")) { transaction in
                TransactionView(transaction: transaction)
            }
            
        }

            HStack(alignment: .center){
                TotalSpentView(transactions: transactions)
            }
           
        }
        .animation(.easeIn)
        .listStyle(PlainListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Transactions")
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(transactions: TransactionListViewModel(transactions: ModelData.sampleTransactions),category: TransactionModel.Category.allCases)
    }
}
#endif


