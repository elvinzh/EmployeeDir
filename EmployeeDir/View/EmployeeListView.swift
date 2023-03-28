//
//  EmployeeListView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeListView: View {
    @EnvironmentObject private var viewModel: EmployeeListViewModel
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            VStack {
                let items = viewModel.filteredEmployeeViewModels(searchText: searchText)
                if items.isEmpty {
                    List {
                        HStack {
                            Spacer()
                            Text("No content")
                            Spacer()
                        }.listRowBackground(Color.clear)
                    }
                    
                } else {
                    List(items) { employeeViewModel in
                        let detailViewModel = employeeViewModel.generateEmployeeDetailViewModel()
                        NavigationLink(destination: EmployeeDetailView(viewModel: detailViewModel, imageLoader: ImageLoader(url: detailViewModel.avatar))) {
                            EmployeeRow(viewModel: employeeViewModel, imageLoader:ImageLoader(url:employeeViewModel.avatar))
                        }
                    }
                }
                
            }
            .navigationTitle("Employees")
            .refreshable {
                viewModel.fetchEmployeeList(delay: 1)
            }
            .searchable(text: $searchText, prompt:"Search for employees")
            .toolbar {
                Button("Malformed") {
                    viewModel.testMalformedEmployeeList()
                }
                Button("Empty") {
                    viewModel.testEmptyEmployeeList()
                }
            }
        }
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
        EmployeeListView().environmentObject(EmployeeListViewModel(apiService: APIService.shared))
    }
}
