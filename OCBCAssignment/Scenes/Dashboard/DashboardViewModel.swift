//
//  DashboardViewModel.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var transactionResponse: TransactionResponse?
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
    }
    
    func getTransactions() {
        apiManager.getTransactions()
            .sink { (response) in
                if let error = response.error {
                    print("ERROR: \(error)")
                } else if let data = response.value {
                    self.transactionResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
}
