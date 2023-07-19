//
//  FAQRow.swift
//  PhotoAI
//
//  Created by Jakub Ruranski on 19/07/2023.
//

import SwiftUI

struct FAQRow: View {
    @State private var selected = false
    var question: String = "What type of photos should I upload for creating an AI model?"
    var answer = "We recommend uploading photos with high variety, a mix of close-up selfies and full body shots in a variety of places, angles, clothes and expressions. Do not upload photos with low variety, group photos, other people, sunglasses, hats, photos where your face is cut off or not visible."
    
    
    
    var body: some View {
        VStack {
            HStack {
                Text(question)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
                
                Image(systemName: "xmark")
                    .font(.body)
                    .fontWeight(.medium)
                    .rotationEffect(.degrees(selected ? 0 : 45))
                    .padding(.leading, 4)
                 //   .animation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.3), value: selected)
            }
                
            
            .foregroundColor(.white)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.4)) {
                    self.selected.toggle()
                }
            }
            if selected {
                Text(answer)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                  //  .padding(.horizontal)
                    .opacity(selected ? 1 : 0)
                    
                    .animation(.easeIn.delay(0.5), value: selected)
            }
        }.transition(.slide)
            .padding(.horizontal)
    }
}

struct FAQRow_Previews: PreviewProvider {
    static var previews: some View {
        FAQSection()
    }
}
