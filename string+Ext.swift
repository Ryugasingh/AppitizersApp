//
//  string+Ext.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 29/03/25.
//

import SwiftUI

extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
}
