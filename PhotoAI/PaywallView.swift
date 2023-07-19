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
    
    let reviews: [(name: String, imageName: String)] = [("", ""), ("", ""), ("", "")]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            
            VStack {
                
                // top half of the signon page
                VStack {
                    
                    // logo and buttons
                    
                    HStack {
                        HStack(spacing: 0) {
                            Image(uiImage: UIImage(named: "logo")!)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 32, height: 32, alignment: .leading)
                                .padding(8)
                            Text("PHOTO")
                                .fontWeight(.heavy)
                            Text("AI")
                        }
                        .foregroundStyle(.linearGradient(colors: [Color.purple, Color.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                        Spacer()
                        
                        Text("Billing")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .modifier(ButtonModifier(backgroundColor: .black, padding: 8, radius: 8, opacity: 0.4))
                        Text("Take photo")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .modifier(ButtonModifier(backgroundColor: .purple, padding: 8, radius: 8, opacity: 0.4))
                        
                    }.padding(.top, 40)
                        .padding(.trailing, 8)
                    
                    
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
                    
                }.padding(.top)
                .background(
                    
                    Image("dark-signon-background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .bottom, content:  {
                            Image(uiImage: UIImage(named: "wave")!)
                                .resizable()
                            
                                .frame( height: 90)
                        })
                    
                )
                
                // light section
                VStack {
                    HStack {
                        Text("")
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(reviews, id: \.name) { review in
                                ReviewsHighlightCard()
                            }
                        }.padding(.leading)
                    }
                    Spacer()
                }
                .frame(height: 900)
                
                
                .background(
                    
                    Image("light-signon-background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(alignment: .top, content: {
                            Rectangle()
                                .fill(LinearGradient(colors: [Color.black, Color.clear], startPoint: .top, endPoint: .bottom))
                                .frame(height: 160)
                        })
                )
                
                
                // FAQ section
                
               
                FAQSection()
                
                Spacer()
                
            } // main vstack
            
        } // scroll view
        .edgesIgnoringSafeArea(.top)
        .background(Color.black)
        
        
    }
}

struct PaywallView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallView()
    }
}
