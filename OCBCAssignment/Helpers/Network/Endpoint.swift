//
//  Endpoint.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 30/05/22.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "green-thumb-64168.uc.r.appspot.com"
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: String] {
        return ["Content-Type": "application/json",
                "Accept": "application/json"]
    }
    
    static func login() -> Self {
        return Endpoint(path: "/login")
    }
    
    static func register() -> Self {
        return Endpoint(path: "/register")
    }
    
    static func balance() -> Self {
        return Endpoint(path: "/balance")
    }
    
    static func transactions() -> Self {
        return Endpoint(path: "/transactions")
    }
    
    static func payees() -> Self {
        return Endpoint(path: "/payees")
    }
    
    static func transfer() -> Self {
        return Endpoint(path: "/transfer")
    }
}
