//
//  WhiteImage.swift
//  PhotoAI
//
//  Created by Jakub Ruranski on 19/07/2023.
//

import SwiftUI

struct WhiteImage: View {
    var image = UIImage(named: "mkbhd")
    var body: some View {
        Image(uiImage: image ?? UIImage())
            .resizable()
            
            .renderingMode(.template)
            .foregroundColor(.white)
            .aspectRatio(contentMode: .fit)
            
    }
}

struct WhiteImage_Previews: PreviewProvider {
    static var previews: some View {
        WhiteImage()
            
    }
}
