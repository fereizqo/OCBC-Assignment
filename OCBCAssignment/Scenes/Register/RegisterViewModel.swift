//
//  RegisterViewModel.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Combine

class RegisterViewModel: ObservableObject {
    
    @Published var registerResponse: RegisterReponse?
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
    }
    
    func doRegister(username: String, password: String) {
        apiManager.doRegister(registRequest: RegisterRequest(username: username, password: password))
            .sink { (response) in
                if let error = response.error {
                    print("ERROR: \(error)")
                } else if let data = response.value {
                    self.registerResponse = data
                    print("RESPONSE: \(data)")
                }
            }.store(in: &cancellableSet)
    }
    
}
