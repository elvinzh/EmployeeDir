//
//  MainView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: OnboardingViewModel
    var body: some View {
        if viewModel.showedOnboarding {
            
            TabView {
                EmployeeListView()
                    .environmentObject(EmployeeListViewModel())
                    .tabItem {
                        Label("Employees", systemImage: "person.3")
                    }
                
                SettingView(viewModel: SettingViewModel())
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
            
        } else {
            VStack {
                Text(viewModel.onboardingText)
                Spacer().frame(height: 20)
                Button("Get Started") {
                    viewModel.showedOnboarding = true
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: OnboardingViewModel())
    }
}
