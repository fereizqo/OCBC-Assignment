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
    @Published var isLoading: Bool = false
    @Published var isApiAlert: Bool = false
    @Published var alertText: String?
    @Published var username: String = ""
    @Published var balanceResponse: BalanceResponse?
    
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
        getTransactions()
        getBalance()
        getUserData()
    }
    
    func getTransactions() {
        isLoading = true
        apiManager.getTransactions()
            .sink { (response) in
                self.isLoading = false
                if let error = response.error {
                    self.isApiAlert = true
                    self.alertText = error.localizedDescription
                } else if let transactionResponse = response.value, let data = transactionResponse.data {
                    self.isApiAlert = false
                    self.transactionDictionary = data.groupedBy(dateComponents: [.day])
                }
            }.store(in: &cancellableSet)
    }
    
    func getBalance() {
        apiManager.getBalance()
            .sink { (response) in
                if let error = response.error {
                    self.isApiAlert = true
                    self.alertText = error.localizedDescription
                } else if let data = response.value {
                    self.isApiAlert = false
                    self.balanceResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
    func getUserData() {
        if let username = UserDefaults.standard.string(forKey: "user_username") {
            self.username = username
        }
    }
    
    func logOut() {
        UserDefaults.standard.removeObject(forKey: "user_username")
        UserDefaults.standard.removeObject(forKey: "user_token")
        UserDefaults.standard.removeObject(forKey: "user_account_number")
    }
    
}
