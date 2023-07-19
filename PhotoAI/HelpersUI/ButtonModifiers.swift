//
//  ButtonModifiers.swift
//  PhotoAI
//
//  Created by Jakub Ruranski on 19/07/2023.
//

import SwiftUI
import Foundation



struct ButtonModifier: ViewModifier {
    
    var backgroundColor = Color(.black)
    var padding: CGFloat = 8
    var radius: CGFloat = 8
    var opacity: Double = 1.0
     
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(backgroundColor.opacity(opacity))
            .mask(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: radius, style: .continuous).stroke((backgroundColor.darker(by: 10) ?? backgroundColor).opacity(0.7), lineWidth: 2).blendMode(.overlay))
            .shadow(color: (backgroundColor == Color(.systemBackground) ? Color.black : backgroundColor).opacity(opacity > 0.5 ? 0.14 : 0.2), radius: 8 + radius / 2, x: 0, y: 4)
    }
    
}

struct BlurButtonModifier: ViewModifier {
    
    var background = BlurView(style: .systemThinMaterial)
    var padding: CGFloat = 8
    var radius: CGFloat = 6
    var opacity: Double = 1.0
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(background.opacity(opacity))
            .mask(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: radius, style: .continuous).stroke((Color(.systemGray5)).opacity(0.9), lineWidth: 3).blendMode(.overlay))
          //  .shadow(color: Color.black.opacity(0.14), radius: 8, x: 0, y: 4)
    }
    
}



struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    var style: UIBlurEffect.Style
    
    
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor)
        
        ])
        
        
        
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<BlurView>) {
        
    }
    
    
    
    
}


// MARK: Extensions
extension UIColor {
    
    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

extension Color {
    func lighter(by percentage: CGFloat = 30.0) -> Color? {
        return self.adjust(by: abs(percentage) )
    }
    
    func darker(by percentage: CGFloat = 30.0) -> Color? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    func adjust(by percentage: CGFloat = 30.0) -> Color? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        let clr = UIColor(self)
        if clr.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return Color(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0))
        } else {
            return nil
        }
    }
}
