//
//  SettingViewTests.swift
//  EmployeeDirTests
//
//  Created by Elvin Zhang on 2023-03-27.
//

import XCTest
@testable import EmployeeDir

final class SettingViewTests: XCTestCase {
    
    var settingViewModel: SettingViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        settingViewModel = SettingViewModel()
    }

    override func tearDownWithError() throws {
        settingViewModel = nil
        try super.tearDownWithError()
    }
    
    func testSettings() throws {
        let expectedList = [
            ("AppName", "Employee Directory"),
            ("BundleID", "com.elvin.EmployeeDir"),
            ("Version", "1"),
            ("Creator", "Elvin Zhang"),
        ]
        
        XCTAssertEqual(expectedList.count, settingViewModel.list.count)
        for index in 0..<expectedList.count {
            XCTAssertEqual(expectedList[index].0, settingViewModel.list[index].title)
            XCTAssertEqual(expectedList[index].1, settingViewModel.list[index].content)
        }
    }
}
