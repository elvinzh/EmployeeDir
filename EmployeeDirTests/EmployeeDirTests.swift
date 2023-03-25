//
//  EmployeeDirTests.swift
//  EmployeeDirTests
//
//  Created by Elvin Zhang on 2023-03-24.
//

import XCTest
@testable import EmployeeDir

final class EmployeeDirTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testJsonDecoding() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let json = """
        {
            "uuid" : "some-uuid",
            "full_name" :"Eric Rogers",
            "phone_number" : "5556669870",
            "email_address" : "erogers.demo@squareup.com",
            "biography": "A short biography describing the employee.",
            "photo_url_small" : "https://some.url/pathl.jpg",
            "photo_url_large" : "https://some.url/path2.jpg",
            "team" : "Seller",
            "employee_type" : "FULL_TIME",
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let employeeFromJson = try decoder.decode(Employee.self, from: json)
        
        let employee = Employee(uuid: "some-uuid", fullName: "Eric Rogers", phoneNumber: "5556669870", emailAddress: "erogers.demo@squareup.com", biography: "A short biography describing the employee.", photoUrlSmall: "https://some.url/pathl.jpg", photoUrlLarge: "https://some.url/path2.jpg", team: "Seller", employeeType: .fullTime)
        
        XCTAssert(employeeFromJson == employee)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
