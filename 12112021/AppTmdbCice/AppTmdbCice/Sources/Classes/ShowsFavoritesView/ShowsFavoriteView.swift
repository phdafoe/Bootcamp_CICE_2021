//
// Created on 3/12/21.
// ShowsFavoriteView.swift - Very brief description
//


import SwiftUI

struct ShowsFavoriteView: View {
    
    // MARK: ObservedObject -> MVVM Dependencies
    @ObservedObject var viewModel: ShowsFavoriteViewModel
    
    var body: some View {
        VStack{
            Text("hello world!")
                .fontWeight(.bold)
        }
        .onAppear{
            self.viewModel.fetchDataDetailMovie()
        }
    }
}

struct ShowsFavorite_Previews: PreviewProvider {
    static var previews: some View {
        ShowsFavoriteView(viewModel: ShowsFavoriteViewModel())
            .environment(\.colorScheme, .dark)
    }
}


