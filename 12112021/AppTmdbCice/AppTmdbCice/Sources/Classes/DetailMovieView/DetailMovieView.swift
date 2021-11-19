//
//  DetailMovieView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import SwiftUI

struct DetailMovieView: View {
    
    //@ObservedObject private var viewModel: DetailMovieViewModel
    //var movieIdentifier: String
    var model: DetailMovieModel
    
    init(model: DetailMovieModel? = nil) {
        self.model = model!
    }
    
    private let imageLoader = ImageLoader()
    
    var body: some View {
        List{
            MovieDetailImage(imageURL: self.model.posterUrl,
                             imageLoderVM: imageLoader)
                .listRowInsets(EdgeInsets(top: 0,
                                          leading: 20,
                                          bottom: 0,
                                          trailing: 20))
            
            HStack{
                Text(self.model.genreText)
                Text("·")
                Text(self.model.yearText)
                Text(self.model.durationText)
            }
            
            Text(self.model.overview ?? "")
                .font(.title2)
            
            HStack{
                if !self.model.ratingText.isEmpty {
                    Text(self.model.ratingText)
                        .foregroundColor(.red)
                }
                Text(self.model.scoreText)
            }
            
            Text("Starring")
                .font(.title)
                .fontWeight(.bold)
            
            
        }
        .listStyle(PlainListStyle())
    }
}

struct MovieDetailImage: View {
    
    let imageURL: URL
    @ObservedObject var imageLoderVM: ImageLoader
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 10)
            if self.imageLoderVM.image != nil {
                Image(uiImage: self.imageLoderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
        }
        .onAppear {
            self.imageLoderVM.loadImage(whit: imageURL)
        }
    }
}


struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(model: DetailMovieModel.stubbedDetailMovieModel)
    }
}
