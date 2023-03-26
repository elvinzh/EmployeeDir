//
//  APIService.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-25.
//

import Foundation


class APIService {
    
    enum HttpError: Error {
        case InvalidURL
        case InvalidServerResponse
    }
    
    static func fetchCompleteEmployees() async -> ([Employee]?, String?) {
        return await fetchEmployeeFrom(url: "https://s3.amazonaws.com/sq-mobile-interview/employees.json")
    }
    
    static func fetchMalformedEmployees() async -> ([Employee]?, String?) {
        return await fetchEmployeeFrom(url: "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json")
    }
    
    static func fetchEmptyEmployees() async -> ([Employee]?, String?) {
        return await fetchEmployeeFrom(url: "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json")
    }
    
    private static func fetchEmployeeFrom(url: String) async -> ([Employee]?, String?) {
        do {
            let data = try await getDataFrom(url: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let employees = try decoder.decode(Employees.self, from: data)
            return (employees.employees, nil)
        } catch is DecodingError {
            return (nil, "Server data is malformed.")
        } catch {
            return (nil, "Failed to load employees from server.")
        }
    }
    
    private static func getDataFrom(url: String) async throws -> Data {
        guard let requestUrl = URL(string: url) else {
            throw HttpError.InvalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from:requestUrl)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw HttpError.InvalidServerResponse
        }
        
        return data
    }
}
