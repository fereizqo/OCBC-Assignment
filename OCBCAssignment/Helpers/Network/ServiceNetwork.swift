//
//  ServiceNetwork.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Combine
import Alamofire

protocol NetworkServiceProtocol {
    // func doLogin(loginRequest: LoginRequest) -> AnyPublisher<DataResponse<LoginResponse, NetworkError>, Never>
    // func fetch<T>(type: T.Type, endPoint: Endpoint) -> AnyPublisher<T, Error> where T: Decodable
    func sendRequest<T>(type: T.Type, endPoint: Endpoint, parameters: [String: Any]?) -> AnyPublisher<DataResponse<T, NetworkError>, Never> where T: Decodable
}

class NetworkService {
    static let shared: NetworkServiceProtocol = NetworkService()
    private init() { }
}


extension NetworkService: NetworkServiceProtocol {
    
    func sendRequest<T: Decodable>(type: T.Type, endPoint: Endpoint, parameters: [String: Any]?) -> AnyPublisher<DataResponse<T, NetworkError>, Never> {
        let endpoint = Endpoint.login()
        let headers = HTTPHeaders(endpoint.headers)
        
        return AF.request(endpoint.url, method: .post, parameters: parameters, headers: headers)
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
    
    func doLogin(loginRequest: LoginRequest) -> AnyPublisher<DataResponse<LoginResponse, NetworkError>, Never> {
        let endpoint = Endpoint.login()
        let headers = HTTPHeaders(endpoint.headers)
        
        return AF.request(endpoint.url, method: .post, parameters: loginRequest, headers: headers)
            .validate()
            .publishDecodable(type: LoginResponse.self)
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
    
}
