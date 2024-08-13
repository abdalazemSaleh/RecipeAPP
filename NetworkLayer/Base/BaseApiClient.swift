//
//  BaseApiClient.swift
//
//
//  Created by Abdalazem Saleh on 2024-03-17.
//

import Foundation

protocol BaseAPIClientProtocol {
    func perform<T: Decodable>(_ configuration: APIRequestConfiguration) async throws -> T?
}

struct BaseAPIClient: BaseAPIClientProtocol {
    @discardableResult
    func perform<T>(_ configuration: APIRequestConfiguration) async throws -> T? where T : Decodable {
        let request = try configuration.asURLRequest()
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200
        else {
            if let response = response as? HTTPURLResponse {
                let statusCode = response.statusCode
                switch statusCode {
                case 1009, 1020:
                    throw SessionDataTaskError.noInternetConnection
                case 404:
                    throw SessionDataTaskError.notFound
                case 400:
                    throw SessionDataTaskError.notAuthorized
                case 500 ... 599:
                    throw SessionDataTaskError.server
                default:
                    throw SessionDataTaskError.noData
                }
            }
            throw SessionDataTaskError.unknow
        }
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    }
}
