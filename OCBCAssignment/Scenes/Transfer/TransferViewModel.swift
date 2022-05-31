//
//  TransferViewModel.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Combine

class TransferViewModel: ObservableObject {
    
    @Published var transferResponse: TransferResponse?
    @Published var payeeResponse: PayeeReponse?
    @Published var isLoading: Bool = false
    @Published var isApiAlert: Bool = false
    @Published var alertText: String?
    
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
        getPayees()
    }
    
    func doTransfer(receipAccountNo: String, amount: Double, description: String) {
        isLoading = true
        apiManager.doTransfer(transferRequest: TransferRequest(receipientAccountNo: receipAccountNo, amount: amount, description: description))
            .sink { (response) in
                self.isLoading = false
                if let error = response.error {
                    self.isApiAlert = true
                    self.alertText = error.localizedDescription
                } else if let data = response.value {
                    self.isApiAlert = false
                    self.transferResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
    func getPayees() {
        isLoading = true
        apiManager.getPayees()
            .sink { (response) in
                self.isLoading = false
                if let error = response.error {
                    self.isApiAlert = true
                    self.alertText = error.localizedDescription
                } else if let data = response.value {
                    self.isApiAlert = false
                    self.payeeResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
}
