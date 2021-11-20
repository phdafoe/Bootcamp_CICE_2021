//
//  MoviesPosterCarrouselView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import SwiftUI

struct MoviesPosterCarrouselView: View {
    
    var title: String
    var isPosterFromMoviesView: Bool
    var moviesModel: [MoviesShowsModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color(UIColor.cyan).opacity(0.3))
                    .frame(width: 50, height: 5)
            }.padding(.bottom, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(self.moviesModel) { movie in
                        NavigationLink(destination: DetailMovieCoordinator.view(dto: DetailMovieCoordinatorDTO(movieObject: movie))) {
                            MoviePosterCell(model: movie,
                                            isPoster: self.isPosterFromMoviesView)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct MoviePosterCell: View {
    
    @ObservedObject var imageLoaderVM = ImageLoader()
    private var isPoster: Bool
    private var modelData: MoviesShowsModel
    
    init(model: MoviesShowsModel, isPoster: Bool? = true) {
        self.modelData = model
        self.isPoster = isPoster ?? false
        if isPoster ?? false {
            self.imageLoaderVM.loadImage(whit: model.posterUrl)
        } else {
            self.imageLoaderVM.loadImage(whit: model.backdropUrl)
        }
    }
    
    var body: some View {
        VStack{
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
                    
                } else {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .cornerRadius(8)
                }
            }
            .frame(width: self.isPoster ? 240 : 270, height: self.isPoster ? 306 : 150)
            
            if !self.isPoster {
                Text(self.modelData.name ?? "")
                    .fontWeight(.semibold)
                    .padding(.top, 15)
                    .lineLimit(1)
            }
        }
    }
}

//struct MoviesPosterCarrouselView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesPosterCarrouselView(title: "Now Playing",
//                                  isPosterFromMoviesView: false,
//                                  moviesModel: MoviesModel.stubbedMoviesNowPlaying)
//    }
//}
