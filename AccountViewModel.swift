//
//  AccountViewModel.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 28/03/25.
//

import SwiftUI

final class AccountViewModel : ObservableObject {
    
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var birthday: Date = Date()
    @Published var extraNapkins : Bool = false
    @Published var extraRefills : Bool = false
    @Published var alertItem : AlertItem?
    
    var isValidForm : Bool {
        guard !name.isEmpty, !lastName.isEmpty, !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        guard email.isValidEmail() else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
    }
}
