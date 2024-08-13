//
//  APIRequestConfiguration.swift
//
//
//  Created by Abdalazem Saleh on 2024-03-17.
//

import Foundation

protocol APIRequestConfiguration {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var images: ImageDictionary? { get }
    var headers: HTTPHeaders? { get }
    var queryParameters: QueryParameters? { get }
}

extension APIRequestConfiguration {
    var baseHeaders: HTTPHeaders {
        let headers = [
            "Accept": "application/json",
            "X-API-Key": "sand_afe1f1ab-f72f-475f-b898-17ab37f5eda9"
        ]
        return headers
    }
    
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.liteapi.travel"
        components.path = path
        components.queryItems = queryParameters?.map {_ in
            URLQueryItem(name: "countryCode", value: "EG")
        }
        return components
    }
    
    func asURLRequest() throws -> URLRequest {
        
        /// Propertys
        
        let boundary = "Boundary-\(UUID().uuidString)"
        
        /// URL
        
        guard let url = components.url else { throw SessionDataTaskError.invalidURL }
        
        /// Request
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.method
        
        /// Headers
        
        var requestHeaders = baseHeaders
        requestHeaders["Content-Type"] = "multipart/form-data; boundary=\(boundary)"
        requestHeaders.forEach {
            urlRequest.addValue($1, forHTTPHeaderField: $0)
        }
        
        /// Request body
        
        var requestBody = Data()
        
        /// Request parameters
        
        if let parameters = parameters {
            appendParametersToBody(parameters)
        }
        
        if let images = images {
            appendDataToBody(imagesData: images)
        }
        
        /// Append parameters to request body
        
        func appendParametersToBody(_ parameters: Parameters) {
            for (key, value) in parameters {
                if let arrayValue = value as? [String] {
                    appendArrayValue(arrayValue, forKey: key, to: &requestBody, using: boundary)
                } else if let stringValue = value as? String {
                    appendStringValue(stringValue, forKey: key, to: &requestBody, using: boundary)
                }
            }
            requestBody.append("--\(boundary)--\r\n".data(using: .utf8)!)
        }
        
        /// Handel append of values to specific key
        
        func appendArrayValue(_ value: [String], forKey key: String, to requestBody: inout Data, using boundary: String) {
            for (index, item) in value.enumerated() {
                let formattedKey = "\(key)[\(index)]"
                appendMultipartHeader(for: formattedKey, to: &requestBody, using: boundary)
                appendMultipartData(item, to: &requestBody)
            }
        }
        
        /// Handel append value to key
        
        func appendStringValue(_ value: String, forKey key: String, to requestBody: inout Data, using boundary: String) {
            appendMultipartHeader(for: key, to: &requestBody, using: boundary)
            appendMultipartData(value, to: &requestBody)
        }
        
        
        /// Append multipart header
        
        func appendMultipartHeader(for key: String, to requestBody: inout Data, using boundary: String) {
            requestBody.append("--\(boundary)\r\n".data(using: .utf8)!)
            requestBody.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
        }
        /// Append multipartdata
        
        func appendMultipartData(_ value: String, to requestBody: inout Data) {
            requestBody.append("\(value)\r\n".data(using: .utf8)!)
        }
        
        /// Append data to body
        
        func appendDataToBody(imagesData: [String: Any])  {
            for (key, value) in imagesData {
                if let imageArrayData = value as? [Data] {
                    appendImageDataArray(key: key, imageArrayData: imageArrayData)
                } else if let singleImageData = value as? Data {
                    appendSingleImageData(key: key, imageData: singleImageData)
                }
            }
        }
        
        /// Append an array of image data to request body
        
        func appendImageDataArray(key: String, imageArrayData: [Data]) {
            for (index, imageData) in imageArrayData.enumerated() {
                let fieldName = "\(key)_\(index)"
                appendImageData(fieldName: fieldName, imageData: imageData)
            }
        }
        
        /// Append a single image data to request body
        
        func appendSingleImageData(key: String, imageData: Data) {
            appendImageData(fieldName: key, imageData: imageData)
        }
        
        /// Append image data to request body
        
        func appendImageData(fieldName: String, imageData: Data) {
            requestBody.append("--\(boundary)\r\n".data(using: .utf8)!)
            requestBody.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fieldName)hell.png\"\r\n".data(using: .utf8)!)
            requestBody.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
            requestBody.append(imageData)
            requestBody.append("\r\n".data(using: .utf8)!)
        }
        
        urlRequest.httpBody = requestBody
        
        return urlRequest
    }
}

typealias HTTPHeaders = [String: String]
typealias Parameters = [String: Any]
typealias ImageDictionary = [String: Any]
typealias QueryParameters = [String: String]
