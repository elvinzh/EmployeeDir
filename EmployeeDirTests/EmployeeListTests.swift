//
//  EmployeeListTests.swift
//  EmployeeDirTests
//
//  Created by Elvin Zhang on 2023-03-27.
//

import XCTest
@testable import EmployeeDir

let mockEmployee1 = Employee(uuid: "0d8fcc12-4d0c-425c-8355-390b312b909c", fullName: "Justine Mason", phoneNumber: "5553280123", emailAddress: "jmason.demo@squareup.com", biography: "Engineer on the Point of Sale team.", photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg", team: "Point of Sale", employeeType: .fullTime)

let mockEmployee2 = Employee(uuid: "a98f8a2e-c975-4ba3-8b35-01f719e7de2d", fullName: "Camille Rogers", phoneNumber: "5558531970", emailAddress: "crogers.demo@squareup.com", biography: "Designer on the web marketing team.", photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/small.jpg", photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/large.jpg", team: "Public Web & Marketing", employeeType: .partTime)


let mockEmployee3 = Employee(uuid: "a98f8a2e-c975-4ba3-8b35-01f73l2ji3c", fullName: "David Jackson", phoneNumber: "51423432243", emailAddress: "david.demo@squareup.com", biography: "Bio.", photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/small.jpg", photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/large.jpg", team: "Engineering", employeeType: .contractor)

final class EmployeeListTests: XCTestCase {
    
    var mockApiService: MockAPIService!
    var employeeListViewModel: EmployeeListViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockApiService = MockAPIService()
        mockApiService.setMockData(mockEmployees: [mockEmployee1, mockEmployee2], mockErrorMsg: nil)
        employeeListViewModel = EmployeeListViewModel(apiService: mockApiService)
    }

    override func tearDownWithError() throws {
        employeeListViewModel = nil
        mockApiService = nil
        try super.tearDownWithError()
    }
    
    func testFetchEmployeesSuccess() async throws {
        mockApiService.setMockData(mockEmployees: [mockEmployee1, mockEmployee2], mockErrorMsg: nil)
        let task = employeeListViewModel.fetchEmployeeList()
        try await task.value
        let employeeViewModels = employeeListViewModel.filteredEmployeeViewModels(searchText: "")
        
        let expectedEmployeeViewModels = [EmployeeViewModel(employee: mockEmployee1), EmployeeViewModel(employee: mockEmployee2)]
        XCTAssertEqual(expectedEmployeeViewModels, employeeViewModels)
        XCTAssertNil(employeeListViewModel.errorMsg)
        XCTAssertFalse(employeeListViewModel.alertError)
    }
    
    
    func testFetchEmployeesMalformed() async throws {
        mockApiService.setMockData(mockEmployees: nil, mockErrorMsg: "Server data is malformed.")
        let task = employeeListViewModel.fetchEmployeeList()
        try await task.value
        
        XCTAssertEqual("Server data is malformed.", employeeListViewModel.errorMsg)
        XCTAssertTrue(employeeListViewModel.alertError)
    }
    
    func testFetchEmployeesInvalidResponse() async throws {
        mockApiService.setMockData(mockEmployees: nil, mockErrorMsg: "Failed to load employees from server.")
        let task = employeeListViewModel.fetchEmployeeList()
        try await task.value
        
        XCTAssertEqual("Failed to load employees from server.", employeeListViewModel.errorMsg)
        XCTAssertTrue(employeeListViewModel.alertError)
    }
    
    
    func testSearchEmployees() async throws {
        mockApiService.setMockData(mockEmployees: [mockEmployee1, mockEmployee2, mockEmployee3], mockErrorMsg: nil)
        let task = employeeListViewModel.fetchEmployeeList()
        try await task.value
        
        let employeeViewModels = employeeListViewModel.filteredEmployeeViewModels(searchText: "son")
        let expectedEmployeeViewModels = [EmployeeViewModel(employee: mockEmployee1), EmployeeViewModel(employee: mockEmployee3)]
        
        XCTAssertEqual(expectedEmployeeViewModels, employeeViewModels)
    }
    
    func testSearchEmployeesEmptyResult() async throws {
        mockApiService.setMockData(mockEmployees: [mockEmployee1, mockEmployee2, mockEmployee3], mockErrorMsg: nil)
        let task = employeeListViewModel.fetchEmployeeList()
        try await task.value
        
        let employeeViewModels = employeeListViewModel.filteredEmployeeViewModels(searchText: "Jeff")
        let expectedEmployeeViewModels: [EmployeeViewModel] = []
        
        XCTAssertEqual(expectedEmployeeViewModels, employeeViewModels)
    }
    
}
