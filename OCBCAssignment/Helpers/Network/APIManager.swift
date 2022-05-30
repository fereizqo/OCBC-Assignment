//
//  APIManager.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Alamofire
import Combine

protocol APIManagerProtocol {
    func doLogin(loginRequest: LoginRequest) -> AnyPublisher<DataResponse<LoginResponse, NetworkError>, Never>
    func doRegister(registRequest: RegisterRequest) -> AnyPublisher<DataResponse<RegisterReponse, NetworkError>, Never>
    func getBalance() -> AnyPublisher<DataResponse<BalanceResponse, NetworkError>, Never>
    func getTransactions() -> AnyPublisher<DataResponse<TransactionResponse, NetworkError>, Never>
    func getPayees() -> AnyPublisher<DataResponse<PayeeReponse, NetworkError>, Never>
    func doTransfer(transferRequest: TransferRequest) -> AnyPublisher<DataResponse<TransferResponse, NetworkError>, Never>
}

final class APIManager: APIManagerProtocol {
    static let shared = APIManager()
    
    func doLogin(loginRequest: LoginRequest) -> AnyPublisher<DataResponse<LoginResponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: LoginResponse.self, method: .post, endPoint: Endpoint.login(), parameters: loginRequest.toDictionary)
    }
    
    func doRegister(registRequest: RegisterRequest) -> AnyPublisher<DataResponse<RegisterReponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: RegisterReponse.self, method: .post, endPoint: Endpoint.register(), parameters: registRequest.toDictionary)
    }
    
    func getBalance() -> AnyPublisher<DataResponse<BalanceResponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: BalanceResponse.self, method: .get, endPoint: Endpoint.balance(), parameters: nil)
    }
    
    func getTransactions() -> AnyPublisher<DataResponse<TransactionResponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: TransactionResponse.self, method: .get, endPoint: Endpoint.transactions(), parameters: nil)
    }
    
    func getPayees() -> AnyPublisher<DataResponse<PayeeReponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: PayeeReponse.self, method: .get, endPoint: Endpoint.payees(), parameters: nil)
    }
    
    func doTransfer(transferRequest: TransferRequest) -> AnyPublisher<DataResponse<TransferResponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: TransferResponse.self, method: .post, endPoint: Endpoint.transfer(), parameters: transferRequest.toDictionary)
    }
    
}

