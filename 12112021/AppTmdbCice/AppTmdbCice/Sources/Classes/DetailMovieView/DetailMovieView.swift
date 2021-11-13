//
//  DetailMovieView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import SwiftUI

struct DetailMovieView: View {
    
    @ObservedObject var viewModel: DetailMovieViewModel
    var movieIdentifier: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(viewModel: DetailMovieViewModel(), movieIdentifier: "\(580489)")
    }
}
