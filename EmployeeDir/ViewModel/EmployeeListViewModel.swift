//
//  EmployeeListViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import Foundation

let mockEmployeeList = [mockEmployee1, mockEmployee2]

class EmployeeListViewModel: ObservableObject {
    
    @Published private(set) var employees = [Employee]()
    
    private(set) var employeeViewModels = [EmployeeViewModel]()
    private(set) var errorMsg: String? {
        didSet {
            alertError = errorMsg != nil && errorMsg!.count > 0
        }
    }
    @Published var alertError = false
    
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
    
    @MainActor
    private func updateEmployee(employees: [Employee]?, errorMsg: String?) {
        if employees != nil {
            self.employees = employees!
        } else {
            self.errorMsg = errorMsg
        }
    }
    
    private func fetchEmployeeList() {
        Task {
            let (employees, errorMsg) = await APIService.fetchCompleteEmployees()
            await updateEmployee(employees: employees, errorMsg: errorMsg)
        }
    }
    
    func testMalformedEmployeeList() {
        Task {
            let (employees, errorMsg) = await APIService.fetchMalformedEmployees()
            await updateEmployee(employees: employees, errorMsg: errorMsg)
        }
    }
    
    func testEmptyEmployeeList() {
        Task {
            let (employees, errorMsg) = await APIService.fetchEmptyEmployees()
            await updateEmployee(employees: employees, errorMsg: errorMsg)
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
