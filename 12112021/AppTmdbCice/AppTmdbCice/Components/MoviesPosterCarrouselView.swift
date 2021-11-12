//
//  MoviesPosterCarrouselView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import SwiftUI

struct MoviesPosterCarrouselView: View {
    
    var title: String
    var moviesModel: [ResultNowPlaying]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color(UIColor.cyan).opacity(0.3))
                    .frame(width: 50, height: 5)
            }.padding(.bottom, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(self.moviesModel) { movie in
                        MoviePosterCell(model: movie)
                    }
                }
            }
        }
    }
}

struct MoviePosterCell: View {
    
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: ResultNowPlaying) {
        self.imageLoaderVM.loadImage(whit: model.posterUrl)
    }
    
    var body: some View {
        ZStack{
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(radius: 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 1)
                    )
                
            }
        }
        .frame(width: 240, height: 306)
    }
}

struct MoviesPosterCarrouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesPosterCarrouselView(title: "Now Playing",
                                  moviesModel: MoviesNowPlayingServerModel.stubbedMoviesNowPlaying)
    }
}
