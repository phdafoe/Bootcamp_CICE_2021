//
//  DetailFashionView.swift
//  AppCiceFashion
//
//  Created by Andres Felipe Ocampo Eljaiek on 30/10/21.
//

import SwiftUI

struct DetailFashionView: View {
    
    var model: Row
    @State private var mySize = ""
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    
    var body: some View {
        ScrollView {
            VStack {
                headerInformation
                bodyInformation
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    var headerInformation: some View {
        ZStack(alignment: .topLeading) {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack{
                GeometryReader { proxy in
                    
                    Button(action: {
                        self.presenterMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            
                    }
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                    .padding([.leading, .top], 10)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    .offset(x: proxy.size.width - 80, y: 25)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "cart")
                    }
                    .offset(x: proxy.size.width - 40, y: 25)
                    
                }
            }
            .foregroundColor(.black)
        }
    }
    var bodyInformation: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                VStack{
                    Text(model.name).font(.largeTitle)
                    Text(model.price).fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 10){
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                    Circle().fill(Color.green).frame(width: 20, height: 20)
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                }
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n \n Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a \n type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n \n  Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n \n Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \n \n Lorem Ipsum is simply dummy text of the printing.")
                .font(.subheadline)
            
            Text("Select Size").font(.largeTitle)
            
            HStack{
                ForEach(customSize, id: \.self) { item in
                    Button(action: {
                        self.mySize = item
                    }) {
                        Text(item)
                            .padding()
                            .border(Color.black, width: self.mySize == item ? 1.5 : 0)
                    }
                    .foregroundColor(.black)
                }
            }
            
            HStack{
                Button(action: {
                    
                }) {
                    Text("Add to Cart")
                        .padding()
                        .border(Color.black, width: 1.5)
                }
                .foregroundColor(.black)
                Spacer()
                Button(action: {
                    
                }) {
                    Text("buy now")
                        .padding()
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
            }
        }
        .padding()
        .background(
            roundedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -50)
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


struct DetailFashionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFashionView(model: Row(id: 0,
                                     name: "Fire and Summer",
                                     image: "p1",
                                     price: "€199"))
    }
}
