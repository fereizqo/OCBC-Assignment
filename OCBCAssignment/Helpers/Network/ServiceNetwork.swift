//
//  ServiceNetwork.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Combine
import Alamofire

protocol NetworkServiceProtocol {
    func sendRequest<T>(type: T.Type, method: HTTPMethod, endPoint: Endpoint, parameters: [String: Any]?) -> AnyPublisher<DataResponse<T, NetworkError>, Never> where T: Codable
}

class NetworkService {
    static let shared: NetworkServiceProtocol = NetworkService()
    private init() { }
}


extension NetworkService: NetworkServiceProtocol {
    
    func sendRequest<T: Codable>(type: T.Type, method: HTTPMethod, endPoint: Endpoint, parameters: [String: Any]?) -> AnyPublisher<DataResponse<T, NetworkError>, Never> {
        
        let headers = HTTPHeaders(endPoint.headers)
        var encoding: ParameterEncoding = JSONEncoding.default
        
        switch method {
        case .get:
            encoding = URLEncoding(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)
            // URLEncoding(destination: .httpBody, arrayEncoding: .noBrackets, boolEncoding: .literal)
        default:
            encoding = JSONEncoding.default
        }
        
        print("response url: \(endPoint.url)")
        
        return AF.request(endPoint.url, method: method, parameters: parameters, encoding: encoding, headers: headers)
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
