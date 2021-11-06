//
//  DetailBookView.swift
//  AppCiceMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/11/21.
//

import SwiftUI

struct DetailBookView: View {
    
    var model: ResultBooksViewModel
    @ObservedObject var viewModel = ImageLoader()
    @SwiftUI.Environment(\.presentationMode) var presentationMode
    
    @State private var selectedShowWebView = false
    
    init(model: ResultBooksViewModel) {
        self.model = model
        self.viewModel.loadImage(whit: URL(string: model.artworkUrl100 ?? "")!)
    }
    
    var body: some View {
        ScrollView {
            VStack{
                headerInformation
                bodyInformation
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    var headerInformation: some View {
        ZStack(alignment: .topLeading) {
            
            if self.viewModel.image != nil {
                Image(uiImage: self.viewModel.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.black.opacity(0.5))
                .clipShape(Circle())
               
                Spacer()
                
                Text(model.artistName ?? "").fontWeight(.semibold).lineLimit(1)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "cart")
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "slider.horizontal.3")
                }
            }
            .padding()
            .background(Color.white.opacity(0.5))
            .foregroundColor(Color.black)
        }
    }
    var bodyInformation: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                VStack{
                    Text(model.artistName ?? "").font(.largeTitle)
                    Text(model.releaseDate ?? "").fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 20) {
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                    Circle().fill(Color.green).frame(width: 20, height: 20)
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                }
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n \n Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. ")
                .font(.subheadline)
            
            HStack{
                Button(action: {
                    
                }) {
                    Text("Add to Cart").padding().border(Color.gray, width: 1)
                }
                .foregroundColor(.black)
                Spacer()
                Button(action: {
                    self.selectedShowWebView.toggle()
                }) {
                    Text("Go to Web").padding().border(Color.gray, width: 1)
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
            }
            .sheet(isPresented: self.$selectedShowWebView) {
                SafariView(url: URL(string: self.model.url ?? "")!)
            }
            
        }
        .padding()
        .background(
            roundedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2),
                        radius: 10,
                        x: 0,
                        y: -50)
        )
        .padding(.top, -40)
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

struct DetailBookView_Previews: PreviewProvider {
    static var previews: some View {
        DetailBookView(model: ResultBooksViewModel(artistName: "AQUI ANDRES",
                                                   id: "12345",
                                                   releaseDate: "10022012",
                                                   artworkUrl100: "600x631bb",
                                                   url: "nain"))
    }
}
