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
    
    @State private var selectedTrailer: ResultVideos?
    
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
            ScrollView(.horizontal, showsIndicators: true) {
                if self.model.cast != nil && !(self.model.cast?.isEmpty ?? false) {
                    MovieCastCrrousel(model: self.model.cast ?? [])
                }
            }
            
            HStack(alignment: .top, spacing: 4) {
                if self.model.crew != nil && !(self.model.crew?.isEmpty ?? false) {
                    VStack(alignment: .leading, spacing: 4) {
                        if self.model.directors != nil && !(self.model.directors?.isEmpty ?? false ) {
                            Text("Directors")
                                .font(.headline)
                                .padding(.top)
                            ForEach(self.model.directors!.prefix(2)) { item in
                                Text(item.name ?? "")
                            }
                        }
                        if self.model.producers != nil && !(self.model.producers?.isEmpty ?? false ) {
                            Text("Producer[s]")
                                .font(.headline)
                                .padding(.top)
                            ForEach(self.model.producers!.prefix(2)) { item in
                                Text(item.name ?? "")
                            }
                        }
                        if self.model.screenWriters != nil && !(self.model.screenWriters?.isEmpty ?? false ) {
                            Text("Writer[s]")
                                .font(.headline)
                                .padding(.top)
                            ForEach(self.model.screenWriters!.prefix(2)) { item in
                                Text(item.name ?? "")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            if self.model.youtubeTrailers != nil && !(self.model.youtubeTrailers?.isEmpty ?? false) {
                Text("Trailers")
                    .font(.title)
                    .fontWeight(.bold)
                ForEach(self.model.youtubeTrailers!) { item in
                    Button {
                        self.selectedTrailer = item
                    } label: {
                        HStack{
                            Text(item.name ?? "")
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color.red)
                        }
                    }

                }
            }
            
            
        }
        .background(
            roundedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -50)
        )
        .sheet(item: self.$selectedTrailer, content: { trailer in
            SafariView(url: trailer.youtubeURL!)
        })
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

struct MovieCastCrrousel: View {
    
    let model: [Cast]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(self.model) { item in
                        MovieCastCell(modelCast: item)
                    }
                }
            }
        }
    }
}

struct MovieCastCell: View {
    
    let modelCast: Cast
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.white.opacity(0.3))
                .frame(width: 5, height: 100)
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.modelCast.name ?? "")
                        .font(.headline)
                }
            }
        }
        .onAppear {
            self.imageLoaderVM.loadImage(whit: self.modelCast.profilePathUrl)
        }
    }
}

struct roundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}


struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(model: DetailMovieModel.stubbedDetailMovieModel)
            .environment(\.colorScheme, .dark)
    }
}
