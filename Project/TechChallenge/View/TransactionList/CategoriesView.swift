//
//  CategoriesView.swift
//  TechChallenge
//
//  Created by Caroline Cruz on 7/12/22.
//

import SwiftUI
import Combine

struct CategoriesView: View {
    
    var category:
    TransactionModel.Category.AllCases

    
//    ["all", "food", "health" , "entertainment",
//     "shopping","travel"]
    
//    //    method to filter transction list
//        func filterCatergories(category: String) -> [TransactionModel] {
//            for category in transactions where category.contains(selectedCategory){
//                return transactions}
//        }
//
//
    
    @ObservedObject var transactions: TransactionListViewModel
   
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top) {
                Button {
                    transactions.selectedCategory = nil
                } label: {
                    Text("all")
                    
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(8.0)
                    .foregroundColor(.white)
                    
                }
                .background(Color.black)
                .cornerRadius(15.0)
                .frame(height: 80.0)
            
               
                ForEach(category) {
                    category in
                    Button { //assign category to button
                        transactions.selectedCategory = category
                    } label: {
                        Text(category.rawValue)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(8.0)
                    }
                    .background(category.color)
                    .cornerRadius(15.0)
                    .frame(height: 80.0)
                }
            }

        }.background(Color.accentColor.opacity(0.8))
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        
        CategoriesView(category: TransactionModel.Category.allCases, transactions: TransactionListViewModel(transactions: ModelData.sampleTransactions))
    }
}

//extension String: Identifiable {
//    public typealias ID = Int
//    public var id: Int {
//        return hash
//    }
//}
