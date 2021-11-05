//
//  Components.swift
//  AppSwiftUIAnimations
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/11/21.
//

import SwiftUI

struct TitleText: View {
    var title = ""
    var body: some View {
        Text(title).font(.largeTitle)
    }
}

struct SubTitleText: View {
    
    var subtitle: String
    
    var body: some View {
        Text(subtitle).font(.title).foregroundColor(.gray)
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        //Components()
        TitleText()
    }
}
