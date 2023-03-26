//
//  EmployeeListView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeListView: View {
    var viewModel: EmployeeListViewModel
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List(viewModel.filteredEmployeeViewModels(searchText: searchText)) { employeeViewModel in
                NavigationLink(destination: EmployeeDetailView(viewModel: employeeViewModel.generateEmployeeDetailViewModel())) {
                    EmployeeRow(viewModel: employeeViewModel)
                }
            }
            .navigationTitle("Employees")
            .toolbar {
                Button("Test") {
                    
                }
            }
        }.searchable(text: $searchText, prompt:"Search for employees")
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(viewModel: EmployeeListViewModel())
    }
}
