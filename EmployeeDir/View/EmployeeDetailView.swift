//
//  EmployeeDetailView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeDetailView: View {
    var employeeDetailViewModel: EmployeeDetailViewModel
    var body: some View {
        ScrollView {
            
            AsyncImage(url: URL(string: employeeDetailViewModel.avatar!)) { image in
                image.resizable()
            } placeholder: {
                Image("Portrait_Placeholder").resizable()
            }
                .scaledToFill()
            
            VStack(alignment: .leading) {
                HStack {
                    
                    Text(employeeDetailViewModel.team)
                    Spacer()
                    Text(employeeDetailViewModel.employeeType)
                }
                .padding(.vertical)
                .font(.headline)
                
                if let phoneNumber = employeeDetailViewModel.phoneNumber {
                    Text("PhoneNumber: " + phoneNumber)
                        .foregroundColor(Color.gray)
                }
                Text("Email: " + employeeDetailViewModel.email)
                    .foregroundColor(Color.gray)
                if let biography = employeeDetailViewModel.biography {
                    Text(biography)
                        .font(.body)
                        .padding(.top)
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            Spacer()
        }.navigationTitle(employeeDetailViewModel.name)
    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailView(employeeDetailViewModel: EmployeeDetailViewModel(employee: mockEmployee1))
    }
}
