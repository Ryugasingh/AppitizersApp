//
//  APError.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 09/11/24.
//

import Foundation

enum APError : Error {
    case invalidResponse
    case invalidData
    case invalidURL
    case unableToCompleteRequest
}
