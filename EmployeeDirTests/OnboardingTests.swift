//
//  OnboardingTests.swift
//  EmployeeDirTests
//
//  Created by Elvin Zhang on 2023-03-27.
//

import XCTest
@testable import EmployeeDir

final class OnboardingTests: XCTestCase {
    
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testFirstLaunch() throws {
        let userDefaults = UserDefaults.init(suiteName: "UnitTestMockUserDefaults")!
        let onboardingViewModel = OnboardingViewModel(userDefaults: userDefaults)
        XCTAssertFalse(onboardingViewModel.showedOnboarding)
    }
    
    func testSecondFirstLaunch() throws {
        let userDefaults = UserDefaults.init(suiteName: "UnitTestMockUserDefaults")!
        let firstViewModel = OnboardingViewModel(userDefaults: userDefaults)
        XCTAssertFalse(firstViewModel.showedOnboarding)
        firstViewModel.showedOnboarding = true
        let secondViewModel = OnboardingViewModel(userDefaults: userDefaults)
        XCTAssertTrue(secondViewModel.showedOnboarding)
    }
}
