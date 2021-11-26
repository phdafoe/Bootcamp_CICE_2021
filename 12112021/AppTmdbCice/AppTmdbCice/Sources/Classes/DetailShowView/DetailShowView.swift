//
// Created on 20/11/21.
// DetailShowView.swift - Very brief description
//


import SwiftUI

struct DetailShowView: View {
    
    // MARK: ObservedObject -> MVVM Dependencies
    @ObservedObject var viewModel: DetailShowViewModel
    private let imageLoader = ImageLoader()
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    @State private var selectedTrailer: ResultVideos?
    
    var body: some View {
        ScrollView{
            VStack{
                
                headerView
                
                VStack(alignment: .leading, spacing: 30){
                    HStack{
                        Text(self.viewModel.model?.genreText ?? "")
                        Text("·")
                        Text(self.viewModel.model?.yearText ?? "")
                    }
                    
                    Text(self.viewModel.model?.overview ?? "")
                        .font(.title2)
                    
                    HStack{
                        if !(self.viewModel.model?.ratingText.isEmpty ?? false) {
                            Text(self.viewModel.model?.ratingText ?? "")
                                .foregroundColor(.red)
                        }
                        Text(self.viewModel.model?.scoreText ?? "")
                        Spacer()
                    }
                    
                    Text("Starring")
                        .font(.title)
                        .fontWeight(.bold)
                    ScrollView(.horizontal, showsIndicators: true) {
                        if self.viewModel.model?.cast != nil && !(self.viewModel.model?.cast?.isEmpty ?? false) {
                            MovieCastCrrousel(model: self.viewModel.model?.cast ?? [])
                        }
                    }
                    .padding(.bottom, self.viewModel.arrayShowsRecommendation.isEmpty ? 100 : 0)
                    
                    HStack(alignment: .top, spacing: 4) {
                        if self.viewModel.model?.crew != nil && !(self.viewModel.model?.crew?.isEmpty ?? false) {
                            VStack(alignment: .leading, spacing: 4) {
                                if self.viewModel.model?.directors != nil && !(self.viewModel.model?.directors?.isEmpty ?? false ) {
                                    Text("Directors")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.top)
                                    ForEach((self.viewModel.model?.directors!.prefix(2))!) { item in
                                        Text(item.name ?? "")
                                    }
                                }
                                if self.viewModel.model?.producers != nil && !(self.viewModel.model?.producers?.isEmpty ?? false ) {
                                    Text("Producer[s]")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.top)
                                    ForEach((self.viewModel.model?.producers!.prefix(2))!) { item in
                                        Text(item.name ?? "")
                                    }
                                }
                                if self.viewModel.model?.screenWriters != nil && !(self.viewModel.model?.screenWriters?.isEmpty ?? false ) {
                                    Text("Writer[s]")
                                        .font(.title)
                                        .fontWeight(.bold)
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
                        VStack(alignment: .leading, spacing: 20){
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
                        .padding(.bottom, self.viewModel.arrayShowsRecommendation.isEmpty ? 100 : 0)
                        
                    }
                    
                    Group{
                        if !self.viewModel.arrayShowsRecommendation.isEmpty {
                            ShowsPosterCarrouselView(title: "Recommended for you",
                                                     isPosterFromShowsView: true,
                                                     showsModel: self.viewModel.arrayShowsRecommendation)
                        }
                    }
                    .padding(.bottom, 100)
                }
                .padding([.horizontal, .top], 20)
                .background(
                    roundedShape()
                        .fill(Color.black)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: -50)
                )
                .padding(.top, -50)
                
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        .sheet(item: self.$selectedTrailer, content: { trailer in
            SafariView(url: trailer.youtubeURL!)
        })
        .onAppear {
            self.viewModel.fetchDataDetailShowModel()
        }
    }
    
    var headerView: some View {
        ZStack(alignment: .topLeading) {
            if self.viewModel.model?.posterUrl != nil {
                MovieDetailImage(imageURL: self.viewModel.model!.posterUrl,
                                 imageLoderVM: imageLoader)
                    .listRowInsets(EdgeInsets(top: 0,
                                              leading: 20,
                                              bottom: 0,
                                              trailing: 20))
            }
            
            HStack{
                Button(action: {
                    self.presenterMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40,
                                    leading: 20,
                                    bottom: 0,
                                    trailing: 0))
                
            }
            .foregroundColor(.red)
        }
    }
    
}

//struct DetailShow_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailShowView(model: DetailShowModel.stubbedDetailShowModel)
//            .environment(\.colorScheme, .dark)
//    }
//}


