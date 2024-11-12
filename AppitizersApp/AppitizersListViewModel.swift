//
//  AppitizersListViewModel.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 12/11/24.
//

import SwiftUI

final class AppitizersListViewModel : ObservableObject {
    
    @Published var appetizers: [Appitizers] = []
    
    func getAppitizers() {
        DispatchQueue.main.async {
            NetworkManager.shared.getAppetizers { result in
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let Error):
                    print(Error.localizedDescription)
                }
                
            }
        }
    }
    
}
