//
//  EymployeeDetailViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-25.
//

import Foundation

class EmployeeDetailViewModel {
    
    private let employee: Employee
    
    var name: String {
        employee.fullName
    }
    
    var team: String {
        employee.team
    }
    
    var phoneNumber: String? {
        employee.phoneNumber
    }
    
    var email: String {
        employee.emailAddress
    }
    
    var avatar: String? {
        employee.photoUrlLarge
    }
    
    var biography: String? {
        employee.biography
    }
    
    var employeeType: String {
        switch employee.employeeType {
        case .contractor:
            return "Contractor"
        case .partTime:
            return "Part-time"
        default:
            return "Full-time"
        }
    }
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    
}
