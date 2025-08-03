//
//  AppitizersListViewModel.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 12/11/24.
//

import SwiftUI

final class AppitizersListViewModel : ObservableObject {
    
    @Published var appetizers: [Appitizers] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDeatilView: Bool = false
    @Published var selectedAppitizer : Appitizers?
    
    
    func getAppitizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .unableToCompleteRequest:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
