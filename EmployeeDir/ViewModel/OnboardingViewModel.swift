//
//  OnboardingViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    let userDefaults: UserDefaults
    @Published var showedOnboarding: Bool {
        didSet {
            userDefaults.set(showedOnboarding, forKey: "showedOnboarding")
        }
    }
    
    var onboardingText: String {
        return "Hello, this is Employee Directory."
    }
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        showedOnboarding = self.userDefaults.bool(forKey: "showedOnboarding")
    }
}
