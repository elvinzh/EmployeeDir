//
//  MainView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
