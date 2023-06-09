//
//  EmployeeViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import Foundation

class EmployeeViewModel: Identifiable, Equatable {
    static func == (lhs: EmployeeViewModel, rhs: EmployeeViewModel) -> Bool {
        return lhs.employee == rhs.employee
    }
    
    private let employee: Employee
    
    var name: String {
        employee.fullName
    }
    
    var team: String {
        employee.team
    }
    
    var avatar: String? {
        employee.photoUrlSmall
    }
    
    func generateEmployeeDetailViewModel() -> EmployeeDetailViewModel {
        return EmployeeDetailViewModel(employee: employee)
    }
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    
}
