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
    
    private func filteredEmployees(searchText: String) -> [Employee] {
        guard !searchText.isEmpty else { return employees }
        return employees.filter { employee in
            employee.fullName.contains(searchText)
        }
    }
    
    func filteredEmployeeViewModels(searchText: String) -> [EmployeeViewModel] {
        filteredEmployees(searchText: searchText).map { employee in
            EmployeeViewModel(employee: employee)
        }
    }
    
    func fetchEmployeeList() {
        Task {
            do {
                let result = try await APIService.fetchEmployees()
                employees.removeAll()
                employees.append(contentsOf:result)
            } catch {
            }
        }
    }
    
    func testMalformedEmployeeList() {
        Task {
            do {
                let result = try await APIService.fetchMalformedEmployees()
                employees.removeAll()
                employees.append(contentsOf:result)
            } catch {
            }
        }
    }
    
    init() {
        fetchEmployeeList()
    }
    
    init(mockData: Bool) {
        if mockData {
            employees.append(contentsOf: [mockEmployee1, mockEmployee2])
        } else {
            fetchEmployeeList()
        }
    }
}
