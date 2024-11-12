//
//  DataModel.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 06/11/24.
//

import Foundation

struct Appitizers : Decodable , Identifiable {
    let id : Int
    let name : String
    let description : String
    let imageURL : String
    let price : Double
    let calories : Int
    let protein : Int
    let carbs : Int
}

struct AppitizersResponse : Decodable {
    let request : [Appitizers]
}


struct MockData {
    static let sampleAppitizer = Appitizers(id: 001,
                                            name: "Meat Balls",
                                            description: "This is not tasty at all",
                                            imageURL: "asian-flank-steak",
                                            price: 999,
                                            calories: 9,
                                            protein: 90,
                                            carbs: 78)
    
    static let appitizers = [sampleAppitizer , sampleAppitizer , sampleAppitizer]
}
