//
//  ServiceNetwork.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Combine
import Alamofire

protocol NetworkServiceProtocol {
    func sendRequest<T,Y>(type: T.Type, method: HTTPMethod, endPoint: Endpoint, parameters: Y?) -> AnyPublisher<DataResponse<T, NetworkError>, Never> where T: Codable, Y: Codable
}

class NetworkService {
    static let shared: NetworkServiceProtocol = NetworkService()
    private init() { }
}


extension NetworkService: NetworkServiceProtocol {
    
    func sendRequest<T: Codable, Y: Codable>(type: T.Type, method: HTTPMethod, endPoint: Endpoint, parameters: Y?) -> AnyPublisher<DataResponse<T, NetworkError>, Never> {
        let endpoint = Endpoint.login()
        let headers = HTTPHeaders(endpoint.headers)
        
        return AF.request(endpoint.url, method: method, parameters: parameters, headers: headers)
            .validate()
            .publishDecodable(type: T.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0) }
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}

class APIManager {
    static let shared = APIManager()
    
    func doLogin(loginRequest: LoginRequest) -> AnyPublisher<DataResponse<LoginResponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: LoginResponse.self, method: .post, endPoint: Endpoint.login(), parameters: loginRequest)
    }
    
    func doRegister(registRequest: RegisterRequest) -> AnyPublisher<DataResponse<BalanceResponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: RegisterReponse.self, method: .post, endPoint: Endpoint.register(), parameters: registRequest)
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
    
    func doTransfer(transferRequest: TransferRequest) -> AnyPublisher<DataResponse<BalanceResponse, NetworkError>, Never> {
        NetworkService.shared.sendRequest(type: TransferResponse, method: .post, endPoint: Endpoint.transfer(), parameters: transferRequest)
    }
    
}
