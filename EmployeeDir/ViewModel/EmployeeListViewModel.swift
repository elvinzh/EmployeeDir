//
//  EmployeeListViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import Foundation

class EmployeeListViewModel: ObservableObject {
    
    let apiService: APIService
    
    @Published private var employees = [Employee]()
    @Published var alertError = false
    private(set) var errorMsg: String? {
        didSet {
            alertError = errorMsg != nil && errorMsg!.count > 0
        }
    }
    
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
            print("updateEmployee ")
            print(self.employees)
        } else {
            self.errorMsg = errorMsg
        }
    }
    
    func fetchEmployeeList() -> Task<Void, Error> {
        return Task {
            let (employees, errorMsg) = await apiService.fetchEmployees()
            await updateEmployee(employees: employees, errorMsg: errorMsg)
        }
    }
    
    func testMalformedEmployeeList() {
        Task {
            let (employees, errorMsg) = await apiService.fetchMalformedEmployees()
            await updateEmployee(employees: employees, errorMsg: errorMsg)
        }
    }
    
    func testEmptyEmployeeList() {
        Task {
            let (employees, errorMsg) = await apiService.fetchEmptyEmployees()
            await updateEmployee(employees: employees, errorMsg: errorMsg)
        }
    }
    
    init(apiService: APIService) {
        self.apiService = apiService
        fetchEmployeeList()
    }
}
