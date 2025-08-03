//
//  Alert.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 13/11/24.
//

import SwiftUI

struct AlertItem : Identifiable {
    var id: UUID = UUID()
    var title: String
    var message: String
    var dismissButton : Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: "Server Error", message: "There is some problem with the server. Please try again later.", dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: "Server Error", message: "Invalid response from the server  pls try contacting support", dismissButton: .default(Text("OK")))
    static let invalidURL = AlertItem(title: "Server Error", message: "There is some issue with the URL please check it", dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: "Server Error", message: "Unable to complete your response. Please try again later.", dismissButton: .default(Text("OK")))
    static let invalidForm = AlertItem(title: "Incomplete Form", message: "Please check all the fields of the form are completed", dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: "Invalid Email", message: "Please check your email address", dismissButton: .default(Text("OK")))
}
