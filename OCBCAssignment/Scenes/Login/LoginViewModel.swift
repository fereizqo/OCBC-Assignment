//
//  LoginViewModel.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var loginResponse: LoginResponse?
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
    }
    
    func doLogin(username: String, password: String) {
        apiManager.doLogin(loginRequest: LoginRequest(username: username, password: password))
            .sink { (response) in
                print("RESPONSE: \(response)")
                if let error = response.error {
                    print("ERROR: \(error)")
                } else if let data = response.value {
                    self.loginResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
}
