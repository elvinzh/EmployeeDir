//
//  SettingViewModel.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-25.
//

import Foundation


struct SettingViewModel {
    private let infoDictionary = Bundle.main.infoDictionary
    
    private let failedToLoadErrorInfo = "Failed to load"
    
    private func bundleInfoValueForKey(key: String) -> String {
        return infoDictionary?[key] as? String ?? failedToLoadErrorInfo
    }
    
    var list: [(title: String, content: String)] {
        [
            ("AppName", bundleInfoValueForKey(key: "CFBundleDisplayName")),
            ("BundleID", bundleInfoValueForKey(key: "CFBundleIdentifier")),
            ("Version", bundleInfoValueForKey(key: "CFBundleVersion")),
            ("Creator", "Elvin Zhang"),
        ]
    }
}
