//
//  EmployeeListView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeListView: View {
    var viewModel: EmployeeListViewModel
    var body: some View {
        NavigationView {
            List(viewModel.employeeViewModels) { employeeViewModel in
                NavigationLink(destination: EmployeeDetailView(viewModel: employeeViewModel.generateEmployeeDetailViewModel())) {
                    EmployeeRow(viewModel: employeeViewModel)
                }
            }.navigationTitle("Employees")
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(viewModel: EmployeeListViewModel())
    }
}
