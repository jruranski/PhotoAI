//
//  ReviewsHighlightCard.swift
//  PhotoAI
//
//  Created by Jakub Ruranski on 19/07/2023.
//

import SwiftUI

struct ReviewsHighlightCard: View {
    var review: String = "World’s First AI Photographer: users can type in a text prompt that will generate any type of image they want to see of the model"
    var imageName: String = "petapixel"
    
    var body: some View {
        VStack {
            Text(review)
                
                .fontWeight(.medium)
            WhiteImage(image: UIImage(named: imageName))
                .frame(height: 30)
        }.foregroundColor(.white)
        .frame(width: 300) //TODO: temp
        .modifier(ButtonModifier(backgroundColor: .purple, padding: 8, radius: 8, opacity: 0.8))
    }
}

struct ReviewsHighlightCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsHighlightCard()
    }
}
