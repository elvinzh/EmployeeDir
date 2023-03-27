//
//  OnboardingViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-25.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var showedOnboarding: Bool {
        didSet {
            UserDefaults.standard.set(showedOnboarding, forKey: "showedOnboarding")
        }
    }
    
    var onboardingText: String {
        return "Hello, this is Employee Directory."
    }
    
    init() {
        showedOnboarding = UserDefaults.standard.bool(forKey: "showedOnboarding")
    }
}
