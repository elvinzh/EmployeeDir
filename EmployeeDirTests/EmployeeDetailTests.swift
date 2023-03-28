//
//  EmployeeDetailTests.swift
//  EmployeeDirTests
//
//  Created by Elvin Zhang on 2023-03-27.
//

import XCTest
@testable import EmployeeDir

let mockEmployeeOnlyRequiredInfo = Employee(uuid: "0d8fcc12-4d0c-425c-8355-390b312b909c", fullName: "Justine Mason", emailAddress: "jmason.demo@squareup.com", team: "Point of Sale", employeeType: .fullTime)

final class EmployeeDetailTests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testDetailName () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployee1)
        XCTAssertEqual(mockEmployee1.fullName, viewModel.name)
    }
    
    func testDetailTeam () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployee1)
        XCTAssertEqual(mockEmployee1.team, viewModel.team)
    }
    
    func testDetailPhoneNumeber () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployee1)
        XCTAssertEqual(mockEmployee1.phoneNumber, viewModel.phoneNumber)
    }
    
    func testDetailNoPhoneNumeber () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployeeOnlyRequiredInfo)
        XCTAssertNil(viewModel.phoneNumber)
    }
    
    func testDetailEmail () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployee1)
        XCTAssertEqual(mockEmployee1.emailAddress, viewModel.email)
    }
    
    func testDetailAvatar () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployee1)
        XCTAssertEqual(mockEmployee1.photoUrlLarge, viewModel.avatar)
    }
    
    func testDetailNoAvatar () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployeeOnlyRequiredInfo)
        XCTAssertNil(viewModel.avatar)
    }
    
    func testDetailBiography () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployee1)
        XCTAssertEqual(mockEmployee1.biography, viewModel.biography)
    }
    
    func testDetailNoBiography () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployeeOnlyRequiredInfo)
        XCTAssertNil(viewModel.biography)
    }
    
    func testDetailEmployeeType () throws {
        let viewModel = EmployeeDetailViewModel(employee: mockEmployee1)
        XCTAssertEqual("Full-time", viewModel.employeeType)
    }
}
