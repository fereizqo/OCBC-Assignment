//
//  DashboardViewModel.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var transactionDictionary: [Date: [TransactionData]] = [:]
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
        getTransactions()
    }
    
    func getTransactions() {
        apiManager.getTransactions()
            .sink { (response) in
                if let error = response.error {
                    print("ERROR: \(error)")
                } else if let transactionResponse = response.value, let data = transactionResponse.data {
                    self.transactionDictionary = data.groupedBy(dateComponents: [.day])
                    print("DATA: \(self.transactionDictionary)")
                }
            }.store(in: &cancellableSet)
    }
    
    func logOut() {
        UserDefaults.standard.removeObject(forKey: "user_username")
        UserDefaults.standard.removeObject(forKey: "user_token")
        UserDefaults.standard.removeObject(forKey: "user_account_number")
    }
    
}
