//
// Created on 20/11/21.
// DetailShowView.swift - Very brief description
//


import SwiftUI

struct DetailShowView: View {
    
    // MARK: ObservedObject -> MVVM Dependencies
    @ObservedObject var viewModel: DetailShowViewModel
    
    var body: some View {
        VStack{
            Text("hello world!")
                .fontWeight(.bold)
        }
        .onAppear{
            
        }
    }
}

struct DetailShow_Previews: PreviewProvider {
    static var previews: some View {
        DetailShowView(viewModel: DetailShowViewModel())
            .environment(\.colorScheme, .dark)
    }
}


