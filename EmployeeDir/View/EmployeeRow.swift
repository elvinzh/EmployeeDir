//
//  EmployeeRow.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct EmployeeRow: View {
    var viewModel: EmployeeViewModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: viewModel.avatar!)) { image in
                image.resizable()
            } placeholder: {
                Image("Portrait_Placeholder").resizable()
            }
                .scaledToFill()
                .frame(width: 60.0, height: 60.0)
                .cornerRadius(10.0)
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.headline)
                    .fontWeight(.regular)
                
                Text(viewModel.team)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct EmployeeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmployeeRow(viewModel: EmployeeViewModel(employee: mockEmployee1))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
