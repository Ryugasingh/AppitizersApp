//
//  AppitizerListCell.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 07/11/24.
//

import SwiftUI

struct AppitizerListCell: View {
    let appitizers : Appitizers
    var body: some View {
        HStack{
            Image(appitizers.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(12)
            VStack(alignment : .leading , spacing: 5){
                Text(appitizers.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appitizers.price ,specifier : "%.2f" )")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppitizerListCell(appitizers: MockData.sampleAppitizer)
}
