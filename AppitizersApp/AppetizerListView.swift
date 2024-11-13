//
//  AppetizerListView.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 05/11/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppitizersListViewModel()
    var body: some View {
        NavigationView(){
            List(viewModel.appetizers){ appitizers in
                AppitizerListCell(appitizers: appitizers)
            }
            .navigationTitle("🍘 Appitizers")
            
        }
        .onAppear {
            viewModel.getAppitizers()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
        }
    }
    
}

#Preview {
    AppetizerListView()
}
