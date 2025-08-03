//
//  AccountView.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 05/11/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        NavigationView(){
            Form {
                Section(header: Text("personal info")){
                    TextField("First Name", text: $viewModel.name)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("E-mail", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker("Birthdate", selection: $viewModel.birthday , displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Data")
                    }
                }
                
                Section(header: Text("Request")){
                    Toggle("Extra napkins", isOn: $viewModel.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.extraRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
                .navigationTitle(" 🧾 Account")
        }
        .alert(item: $viewModel.alertItem) { item in
            Alert(title: Text(item.title), message: Text(item.message), dismissButton: item.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
