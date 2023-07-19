//
//  PaywallView.swift
//  PhotoAI
//
//  Created by Jakub Ruranski on 18/07/2023.
//

import SwiftUI

struct PaywallView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let logoNames = ["techcrunch", "the-sun", "mkbhd", "msn", "yahoo-news"]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            
            VStack {
                
                // top half of the signon page
                VStack {
                    
                    // logo and buttons
                    
                    HStack {
                        Image("logo")
                        Spacer()
                        
                        Text("Billing")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .modifier(ButtonModifier(backgroundColor: .black, padding: 8, radius: 8, opacity: 0.4))
                        Text("Take photo")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .modifier(ButtonModifier(backgroundColor: .purple, padding: 8, radius: 8, opacity: 0.4))
                        
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("📸 Take photographs with AI")
                            .font(.largeTitle)
                        
                        Text("Take stunning photos with the first AI Photographer")
                            .font(.subheadline)
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                    //            Text("Save money and use AI to do a photo shoot from your laptop or phone instead of hiring an expensive photographer. Create AI models (of yourself!) and do photo shoots in different poses, places and styles. Try on clothes you upload on your own AI model. Turn around time of just 14 seconds.")
                    //                .font(.body)
                    //                .foregroundColor(.white)
                    //                .opacity(0.8)
                    //                .padding()
                    
                    
                    
                    SignUpCard()
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Text("as seen on")
                                .foregroundColor(.white)
                            ForEach(logoNames, id: \.self) {logoName in
                                WhiteImage(image: UIImage(named: logoName))
                                    .frame(height: 20)
                            }
                        }
                            
                        }
                    .frame(height: 100)
                    .padding(.leading)
                        .padding(.vertical)
                    
                    }
                .background(
                    
                    Image("dark-signon-background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                )
                
                
                VStack {
                    VStack {
                        Text("World’s First AI Photographer: users can type in a text prompt that will generate any type of image they want to see of the model")
                        WhiteImage(image: UIImage(named: "petapixel"))
                    }
                }.background(
                    
                    Image("light-signon-background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .top, content: {
                            Rectangle()
                                .fill(LinearGradient(colors: [Color.black, Color.clear], startPoint: .top, endPoint: .bottom))
                                .frame(height: 160)
                        })
                )
                
            } // main vstack
            
        } // scroll view
        .background(Color.black)
        
        
    }
}

struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}
