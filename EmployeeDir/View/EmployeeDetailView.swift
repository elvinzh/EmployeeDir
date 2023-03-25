//
//  EmployeeDetailView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeDetailView: View {
    var viewModel: EmployeeDetailViewModel
    var body: some View {
        ScrollView {
            
            AsyncImage(url: URL(string: viewModel.avatar!)) { image in
                image.resizable()
            } placeholder: {
                Image("Portrait_Placeholder").resizable()
            }
                .scaledToFill()
            
            VStack(alignment: .leading) {
                HStack {
                    
                    Text(viewModel.team)
                    Spacer()
                    Text(viewModel.employeeType)
                }
                .padding(.vertical)
                .font(.headline)
                
                if let phoneNumber = viewModel.phoneNumber {
                    Text("PhoneNumber: " + phoneNumber)
                        .foregroundColor(Color.gray)
                }
                Text("Email: " + viewModel.email)
                    .foregroundColor(Color.gray)
                if let biography = viewModel.biography {
                    Text(biography)
                        .font(.body)
                        .padding(.top)
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            Spacer()
        }.navigationTitle(viewModel.name)
    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailView(viewModel: EmployeeDetailViewModel(employee: mockEmployee1))
    }
}
