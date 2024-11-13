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
    
    
    func getAppitizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
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
