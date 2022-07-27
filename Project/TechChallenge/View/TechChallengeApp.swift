//
//  TechChallengeApp.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

@main
struct TechChallengeApp: App {

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    TransactionListView(transactions: TransactionListViewModel(transactions: ModelData.sampleTransactions), category: TransactionModel.Category.allCases)
                }
                .tabItem {
                    Label("Transactions", systemImage: "list.bullet")
                }
                
                NavigationView {
                    InsightsView()
                }
                .tabItem {
                    Label("Insights", systemImage: "chart.pie.fill")
                }
            }
        }
    }
}
