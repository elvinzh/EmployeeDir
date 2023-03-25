//
//  EmployeeListViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import Foundation

let mockEmployeeList = [mockEmployee1, mockEmployee2]

class EmployeeListViewModel {
    
    private var employees = [Employee]()
    
    private(set) var employeeViewModels = [EmployeeViewModel]()
    
    func fetchEmployeeList() {
        employees.removeAll()
        employees.append(contentsOf: mockEmployeeList)
    }
    
    func filteredEmployeeViewModels(searchText: String) -> [EmployeeViewModel] {
        filteredEmployees(searchText: searchText).map { employee in
            EmployeeViewModel(employee: employee)
        }
    }
    
    private func filteredEmployees(searchText: String) -> [Employee] {
        guard !searchText.isEmpty else { return employees }
        return employees.filter { employee in
            employee.fullName.contains(searchText)
        }
    }
    
    init() {
        fetchEmployeeList()
    }
}
