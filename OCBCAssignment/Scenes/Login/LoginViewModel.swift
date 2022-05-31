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
    @Published var isLoading: Bool = false
    @Published var isApiAlert: Bool = false
    @Published var alertText: String?
    
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
        checkSession()
    }
    
    func doLogin(username: String, password: String) {
        isLoading = true
        apiManager.doLogin(loginRequest: LoginRequest(username: username, password: password))
            .sink { (response) in
                self.isLoading = false
                if let error = response.error {
                    self.isLoginSuccess = false
                    self.isApiAlert = true
                    self.alertText = error.localizedDescription
                } else if let data = response.value {
                    self.isLoginSuccess = true
                    self.isApiAlert = false
                    self.loginResponse = data
                    UserDefaults.standard.set(data.token, forKey: "user_token")
                    UserDefaults.standard.set(data.username, forKey: "user_username")
                    UserDefaults.standard.set(data.accountNo, forKey: "user_account_number")
                }
            }.store(in: &cancellableSet)
    }
    
    func checkSession() {
        if let _ = UserDefaults.standard.string(forKey: "user_token") {
            isLoginSuccess = true
        }
    }
    
}
