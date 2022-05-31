//
//  RegisterViewModel.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Combine

class RegisterViewModel: ObservableObject {
    
    @Published var registerResponse: RegisterReponse?
    @Published var isLoading: Bool = false
    @Published var isApiAlert: Bool = false
    @Published var alertText: String?
    
    private var cancellableSet: Set<AnyCancellable> = []
    var apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager.shared) {
        self.apiManager = apiManager
    }
    
    func doRegister(username: String, password: String) {
        isLoading = true
        apiManager.doRegister(registRequest: RegisterRequest(username: username, password: password))
            .sink { (response) in
                self.isLoading = false
                if let error = response.error {
                    self.isApiAlert = true
                    self.alertText = error.localizedDescription
                } else if let data = response.value {
                    self.isApiAlert = true
                    self.alertText = "Your account [\(username)] is successfully created"
                    self.registerResponse = data
                }
            }.store(in: &cancellableSet)
    }
    
}
