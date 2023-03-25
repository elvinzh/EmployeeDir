//
//  SettingView.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import SwiftUI

struct SettingView: View {
    var viewModel: SettingViewModel
    var body: some View {
        NavigationView {
            List(viewModel.list, id: \.title) { (title, content) in
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    Text(content)
                }
                .padding(.vertical, 8.0)
                
            }.navigationTitle("Setting")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(viewModel: SettingViewModel())
    }
}
