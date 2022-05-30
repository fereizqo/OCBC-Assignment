//
//  TransferViewModel.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Combine

class TransferViewModel: ObservableObject {
    
    @Published var transferResponse: TransferResponse?
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
    }
    
    func doTransfer(recipAccountNo: String, amount: Double, description: String) {
        apiManager.doTransfer(transferRequest: TransferRequest(receipientAccountNo: recipAccountNo, amount: amount, description: description))
            .sink { (response) in
                if let error = response.error {
                    print("ERROR: \(error)")
                } else if let data = response.value {
                    self.transferResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
}
