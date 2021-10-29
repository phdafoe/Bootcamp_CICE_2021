//
//  HeaderComponents.swift
//  AppIntroSwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/10/21.
//

import SwiftUI

struct HeaderComponents: View {
    var body: some View {
        VStack(spacing: 20) {
            CustomTitle(title: "Header Components")
            CustomSubtitle(subtitle: "Estamos aprendiendo SwiftUI")
            CustomDescription(descriptionText: "Estamos con la base de gestion de Subcomponentes")
        }
    }
}

struct HeaderComponents_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponents()
    }
}

struct CustomTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .padding(.horizontal, 20)
            .font(.largeTitle)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(20)
    }
}


struct CustomSubtitle: View {
    var subtitle: String
    var body: some View {
        Text(subtitle)
            .padding(.horizontal, 20)
            .font(.title2)
            .foregroundColor(.gray)
    }
}

struct CustomDescription: View {
    var descriptionText: String
    var body: some View {
        Text(descriptionText)
            .padding(.all)
            .font(.title)
            .foregroundColor(.black)
    }
}



