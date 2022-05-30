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
    @Published var isLoginSuccess: Bool = false
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
    }
    
    func doLogin(username: String, password: String) {
        apiManager.doLogin(loginRequest: LoginRequest(username: username, password: password))
            .sink { (response) in
                if let error = response.error {
                    print("ERROR: \(error)")
                    self.isLoginSuccess = false
                } else if let data = response.value {
                    self.loginResponse = data
                    self.isLoginSuccess = true
                    UserDefaults.standard.set(data.token, forKey: "user_token")
                    UserDefaults.standard.set(data.username, forKey: "user_username")
                    UserDefaults.standard.set(data.accountNo, forKey: "user_account_number")
                }
            }.store(in: &cancellableSet)
    }
    
}
