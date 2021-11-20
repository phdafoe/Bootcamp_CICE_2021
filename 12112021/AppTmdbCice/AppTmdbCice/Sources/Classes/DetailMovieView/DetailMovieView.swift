//
//  DetailMovieView.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/11/21.
//

import SwiftUI

struct DetailMovieView: View {
    
    @ObservedObject var viewModel: DetailMovieViewModel
    @State private var selectedTrailer: ResultVideos?
    private let imageLoader = ImageLoader()
    
    var body: some View {
        List{
            if self.viewModel.model?.posterUrl != nil {
                MovieDetailImage(imageURL: self.viewModel.model!.posterUrl,
                                 imageLoderVM: imageLoader)
                    .listRowInsets(EdgeInsets(top: 0,
                                              leading: 20,
                                              bottom: 0,
                                              trailing: 20))
            }
            
            
            HStack{
                Text(self.viewModel.model?.genreText ?? "")
                Text("·")
                Text(self.viewModel.model?.yearText ?? "")
                Text(self.viewModel.model?.durationText ?? "")
            }
            
            Text(self.viewModel.model?.overview ?? "")
                .font(.title2)
            
            HStack{
                if !(self.viewModel.model?.ratingText.isEmpty ?? false) {
                    Text(self.viewModel.model?.ratingText ?? "")
                        .foregroundColor(.red)
                }
                Text(self.viewModel.model?.scoreText ?? "")
            }
            
            Text("Starring")
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: true) {
                if self.viewModel.model?.cast != nil && !(self.viewModel.model?.cast?.isEmpty ?? false) {
                    MovieCastCrrousel(model: self.viewModel.model?.cast ?? [])
                }
            }
            
            HStack(alignment: .top, spacing: 4) {
                if self.viewModel.model?.crew != nil && !(self.viewModel.model?.crew?.isEmpty ?? false) {
                    VStack(alignment: .leading, spacing: 4) {
                        if self.viewModel.model?.directors != nil && !(self.viewModel.model?.directors?.isEmpty ?? false ) {
                            Text("Directors")
                                .font(.headline)
                                .padding(.top)
                            ForEach((self.viewModel.model?.directors!.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                        if self.viewModel.model?.producers != nil && !(self.viewModel.model?.producers?.isEmpty ?? false ) {
                            Text("Producer[s]")
                                .font(.headline)
                                .padding(.top)
                            ForEach((self.viewModel.model?.producers!.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                        if self.viewModel.model?.screenWriters != nil && !(self.viewModel.model?.screenWriters?.isEmpty ?? false ) {
                            Text("Writer[s]")
                                .font(.headline)
                                .padding(.top)
                            ForEach((self.viewModel.model?.screenWriters!.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            if self.viewModel.model?.youtubeTrailers != nil && !(self.viewModel.model?.youtubeTrailers?.isEmpty ?? false) {
                Text("Trailers")
                    .font(.title)
                    .fontWeight(.bold)
                ForEach((self.viewModel.model?.youtubeTrailers)!) { item in
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
                    .buttonStyle(PlainButtonStyle())

                }
            }
            
            Group{
                if !self.viewModel.arrayMoviesRecommended.isEmpty {
                    MoviesPosterCarrouselView(title: "Recommended for you",
                                              isPosterFromMoviesView: true,
                                              moviesModel: self.viewModel.arrayMoviesRecommended)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(item: self.$selectedTrailer, content: { trailer in
            SafariView(url: trailer.youtubeURL!)
        })
        .listStyle(PlainListStyle())
        .onAppear {
            self.viewModel.fetchDataDetailMovieModel()
        }
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


//struct DetailMovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailMovieView(model: DetailMovieModel.stubbedDetailMovieModel)
//            .environment(\.colorScheme, .dark)
//    }
//}
