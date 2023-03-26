//
//  APIService.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-25.
//

import Foundation

class APIService {
    
    static func fetchEmployees() async -> ([Employee]?, String?) {
        return await fetchEmployeesFrom(url: URL(string:"https://s3.amazonaws.com/sq-mobile-interview/employees.json")!)
    }
    
    static func fetchMalformedEmployees() async -> ([Employee]?, String?) {
        return await fetchEmployeesFrom(url: URL(string:"https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json")!)
    }
    
    static func fetchEmptyEmployees() async -> ([Employee]?, String?) {
        return await fetchEmployeesFrom(url: URL(string:"https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json")!)
    }
    
    private static func fetchEmployeesFrom(url: URL) async -> ([Employee]?, String?) {
        do {
            let (data, _) = try await URLSession.shared.data(from:url)
            print("data=\(data)")
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let employees = try decoder.decode(Employees.self, from: data)
            NSLog("Success")
            return (employees.employees, nil)
        } catch is DecodingError {
            return (nil, "Server data is malformed.")
        } catch {
            print("error=\(error)")
            return (nil, "Failed to load employees.")
        }
    }
}
