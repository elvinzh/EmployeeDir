//
//  EmployeeListView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeListView: View {
    @EnvironmentObject var viewModel: EmployeeListViewModel
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
                Button("Mal") {
                    viewModel.testMalformedEmployeeList()
                }
                Button("Empty") {
                    viewModel.testEmptyEmployeeList()
                }
            }
        }
        .searchable(text: $searchText, prompt:"Search for employees")
        .alert(isPresented: $viewModel.alertError) {
            Alert(
                title: Text(viewModel.errorMsg!),
                dismissButton: .cancel()
            )
        }
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView().environmentObject(EmployeeListViewModel(mockData: true))
    }
}
