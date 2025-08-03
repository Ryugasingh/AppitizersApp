//
//  AppitizerDetailView.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 22/03/25.
//

import SwiftUI

struct AppitizerDetailView: View {
    
    let appetizer: Appitizers
    @Binding var isShowingDetail : Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .scaledToFit()
                .frame(width: 300 , height: 225)
            
            Text(appetizer.name)
                .padding(.top , 15)
                .fontWeight(.semibold)
                .font(.title2)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack(spacing: 40){
                VStack(spacing: 5){
                    Text("Calories")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.calories)")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack{
                    Text("Carb")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.calories)")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack{
                    Text("Protiens")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.calories)")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
            }
            Spacer()
            Button{
                
            }label: {
                Text("\(appetizer.price , specifier: "%.2f") Add to cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260 , height: 50)
                    .foregroundStyle(.white)
                    .background(Color.brandPrimary)
                    .clipShape(RoundedRectangle(cornerRadius : 12))
            }
            .padding(.bottom , 30)
            
        }
        .frame(width: 300 , height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        }label: {
            ZStack{
                Circle()
                    .frame(width : 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44 , height: 44)
                    .foregroundStyle(.black)
                
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppitizerDetailView(appetizer: MockData.sampleAppitizer, isShowingDetail : .constant(true))
}
