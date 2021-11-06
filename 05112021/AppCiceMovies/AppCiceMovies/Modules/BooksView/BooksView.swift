//
//  BooksView.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/11/21.
//

import SwiftUI

struct BooksView: View {
    
    @State private var showButtonMenu = false
    @ObservedObject var viewModel = BookViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                headerNavigationView
                subMenuNavigationView
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        if self.viewModel.arrayBooks != nil && !(self.viewModel.arrayBooks?.isEmpty ?? false) {
                            ForEach(self.viewModel.arrayBooks ?? []) { item in
                                NavigationLink(destination: DetailBookView(model: item)) {
                                    BookCell(model: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                self.viewModel.fetchBooksApple()
            }
        }
    }
    
    var headerNavigationView: some View  {
        ZStack{
            Text("Books").font(.system(size: 20))
            HStack(spacing: 20) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "slider.horizontal.3")
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "cart")
                }
            }
            .padding(.horizontal, 8)
            .font(.callout)
            .foregroundColor(.black)
        }
    }
    var subMenuNavigationView: some View {
        VStack{
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Select your book")
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "person.circle").font(.largeTitle)
                }
            }
            .padding(.horizontal, 8)
            .font(.callout)
            .foregroundColor(.black)
        }
    }
}

struct BookCell: View {
    
    var model: ResultBooksViewModel
    @ObservedObject var viewModel = ImageLoader()
    
    @State private var gradientA: [Color] = [Color.red, Color.black]
    
    init(model: ResultBooksViewModel) {
        self.model = model
        self.viewModel.loadImage(whit: URL(string: model.artworkUrl100 ?? "")!)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            if self.viewModel.image != nil {
                Image(uiImage: self.viewModel.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: gradientA),
                                         startPoint: .bottom,
                                         endPoint: .top))
            }
            HStack{
                VStack(alignment: .leading, spacing: 10) {
                    Text(self.model.artistName ?? "").font(.callout).lineLimit(1)
                    Text(self.model.releaseDate ?? "").fontWeight(.semibold).lineLimit(1)
                }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "equal")
                }
                .padding(.trailing, 10)
            }
            .foregroundColor(.black)
        }
        .padding(.horizontal, 10)
        
    }
}

struct BooksView_Previews: PreviewProvider {
    static var previews: some View {
        BooksView()
    }
}
