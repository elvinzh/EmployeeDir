//
//  EmployeeListView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeListView: View {
    var employeeListViewModel: EmployeeListViewModel
    var body: some View {
        NavigationView {
            List(employeeListViewModel.employeeViewModels) { employeeViewModel in
                NavigationLink(destination: EmployeeDetailView(employeeDetailViewModel: employeeViewModel.generateEmployeeDetailViewModel())) {
                    EmployeeRow(employeeViewModel: employeeViewModel)
                }
            }.navigationTitle("Employees")
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(employeeListViewModel: EmployeeListViewModel())
    }
}
