//
//  EmployeeListViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import Foundation

let mockEmployeeList = [mockEmployee1, mockEmployee2]

class EmployeeListViewModel {
    
    private(set) var employeeViewModels = [EmployeeViewModel]()
    
    func fetchEmployeeList() {
        employeeViewModels.removeAll()
        for employee in mockEmployeeList {
            employeeViewModels.append(EmployeeViewModel(employee: employee))
        }
    }
    
    init() {
        fetchEmployeeList()
    }
}
