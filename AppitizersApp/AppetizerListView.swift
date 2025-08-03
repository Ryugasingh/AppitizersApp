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
        ZStack{
            NavigationView(){
                List(viewModel.appetizers){ appitizers in
                    AppitizerListCell(appitizers: appitizers)
                        .onTapGesture {
                            viewModel.isShowingDeatilView = true
                            viewModel.selectedAppitizer = appitizers
                        }
                }
                .navigationTitle("🍘 Appitizers")
                .disabled(viewModel.isShowingDeatilView)
            }
            .onAppear {
                viewModel.getAppitizers()
            }
            .blur(radius: viewModel.isShowingDeatilView ? 20 : 0)
            
            if viewModel.isShowingDeatilView {
                AppitizerDetailView(appetizer: viewModel.selectedAppitizer!, isShowingDetail: $viewModel.isShowingDeatilView)
            }
            if(viewModel.isLoading){
                ProgressView()
                    .tint(.green)
                    .frame(width: 100, height: 100)
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
