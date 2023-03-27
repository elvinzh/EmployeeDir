//
//  EmployeeDetailView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeDetailView: View {
    var viewModel: EmployeeDetailViewModel
    @StateObject var imageLoader: ImageLoader
    var body: some View {
        ScrollView {
            GeometryReader { geo in
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width)
                        .clipped()
                } else {
                    Image("Portrait_Placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.width)
                        .clipped()
                    
                }
            }
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.team)
                    Spacer()
                    Text(viewModel.employeeType)
                }
                .padding(.bottom)
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
            .padding()
            
            Spacer()
        }.navigationTitle(viewModel.name)
    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailView(viewModel: EmployeeDetailViewModel(employee: mockEmployee1), imageLoader: ImageLoader())
    }
}
