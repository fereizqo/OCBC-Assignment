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
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
        getPayees()
    }
    
    func doTransfer(receipAccountNo: String, amount: Double, description: String) {
        apiManager.doTransfer(transferRequest: TransferRequest(receipientAccountNo: receipAccountNo, amount: amount, description: description))
            .sink { (response) in
                if let error = response.error {
                    print("ERROR: \(error)")
                } else if let data = response.value {
                    self.transferResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
    func getPayees() {
        apiManager.getPayees()
            .sink { (response) in
                if let error = response.error {
                    print("ERROR: \(error)")
                } else if let data = response.value {
                    self.payeeResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
}
