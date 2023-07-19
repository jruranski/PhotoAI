//
//  FAQSection.swift
//  PhotoAI
//
//  Created by Jakub Ruranski on 19/07/2023.
//

import SwiftUI

struct FAQSection: View {
    let faqItems: [FAQItem] = [FAQItem(question: "What file formats of photos do you accept for creating an AI model?", answer: "We accept JPG, PNG, WebP and AVIF files only. HEIC is not supported now, so you'll have to convert those to JPG first"), .init(question: "What type of photos should I upload for creating an AI model?", answer: "We recommend uploading photos with high variety, a mix of close-up selfies and full body shots in a variety of places, angles, clothes and expressions. Do not upload photos with low variety, group photos, other people, sunglasses, hats, photos where your face is cut off or not visible."),FAQItem(question: "What file formats of photos do you accept for creating an AI model?", answer: "We accept JPG, PNG, WebP and AVIF files only. HEIC is not supported now, so you'll have to convert those to JPG first"), .init(question: "What type of photos should I upload for creating an AI model?", answer: "We recommend uploading photos with high variety, a mix of close-up selfies and full body shots in a variety of places, angles, clothes and expressions. Do not upload photos with low variety, group photos, other people, sunglasses, hats, photos where your face is cut off or not visible."),FAQItem(question: "What file formats of photos do you accept for creating an AI model?", answer: "We accept JPG, PNG, WebP and AVIF files only. HEIC is not supported now, so you'll have to convert those to JPG first"), .init(question: "What type of photos should I upload for creating an AI model?", answer: "We recommend uploading photos with high variety, a mix of close-up selfies and full body shots in a variety of places, angles, clothes and expressions. Do not upload photos with low variety, group photos, other people, sunglasses, hats, photos where your face is cut off or not visible.")]
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Frequently Asked Questions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
            }.padding()
            
//            HStack {
//                Image("random-ai-image")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 100)
                
                // the questions
                
            VStack(spacing: 10) {
                    ForEach(faqItems, id: \.id) { item in
                        FAQRow(question: item.question, answer: item.answer)
                    }
                }
                
          //  }
            
            
            
        }.background(Color.black)
        
        
    }
}

struct FAQSection_Previews: PreviewProvider {
    static var previews: some View {
        FAQSection()
    }
}


struct FAQItem {
    let id = UUID()
    var question: String = ""
    var answer: String  = ""
}
