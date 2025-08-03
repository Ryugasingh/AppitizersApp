//
//  RemoteImage.swift
//  AppitizersApp
//
//  Created by Sambhav Singh on 22/03/25.
//

import Foundation
import SwiftUI

final class ImageLoader : ObservableObject {
    @Published var image : Image? = nil
    
    func load (fromUrlString urlString : String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiimage in
            guard let uiimage = uiimage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("placeholder").resizable()
    }
}

struct AppetizerRemoteImage : View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromUrlString: urlString)
            }
    }
}
