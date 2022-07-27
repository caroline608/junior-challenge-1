//
//  TotalSpentView.swift
//  TechChallenge
//
//  Created by Caroline Cruz on 7/15/22.
//

import SwiftUI

struct TotalSpentView: View {
    
//    var totalSpent: TransactionModel
    @ObservedObject var transactions: TransactionListViewModel
    var body: some View {
        
        
        HStack(alignment: .center) {
           
                Text("Total spent:")
                    .fontWeight(.regular)
                    .secondary()
                Spacer()
            

            VStack(alignment: .trailing) {
                Text(transactions.selectedCategory?.rawValue ?? "all")
                    .font(.headline)
                    .foregroundColor(transactions.selectedCategory?.color)
     
                Text("$\(transactions.totalSpent(for: transactions.selectedCategory?.rawValue ?? "all"))")
                    .fontWeight(.bold)
                    .secondary()
            }
            

        }
        
      
        .padding()
        .frame(width: 350, height: 80, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.accentColor, lineWidth: 2))
      
        
        
                    
    }
       
}

struct TotalSpentView_Previews: PreviewProvider {
    static var previews: some View {
       
        TotalSpentView( transactions: TransactionListViewModel(transactions: ModelData.sampleTransactions))
       
        
    }
        
}
