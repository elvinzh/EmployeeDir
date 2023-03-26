//
//  APIService.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-25.
//

import Foundation

class APIService {
    
    static func fetchEmployees() async throws -> [Employee] {
        return try await fetchEmployeesFrom(url: URL(string:"https://s3.amazonaws.com/sq-mobile-interview/employees.json")!)
    }
    
    static func fetchMalformedEmployees() async throws -> [Employee] {
        return try await fetchEmployeesFrom(url: URL(string:"https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json")!)
    }
    
    static func fetchEmptyEmployees() async throws -> [Employee] {
        return try await fetchEmployeesFrom(url: URL(string:"https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json")!)
    }
    
    private static func fetchEmployeesFrom(url: URL) async throws -> [Employee] {
        let (data, _) = try await URLSession.shared.data(from:url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let employees = try decoder.decode(Employees.self, from: data)
        return employees.employees
    }
}
