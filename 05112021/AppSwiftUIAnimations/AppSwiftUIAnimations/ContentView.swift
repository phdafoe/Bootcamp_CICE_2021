//
//  ContentView.swift
//  AppSwiftUIAnimations
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: self.change ? 120 : 0, y: self.change ? 300 : 0)
                .animation(.easeInOut)
            
            Spacer()
            
            Button("Change") {
                self.change.toggle()
            }
            
        }
    }
}

struct CurvasAnimation: View {
    
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText(title: "Animaciones con curvas")
            
            Group{
                Text("1")
                GeometryReader { gr in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gr.size.width - 40) : 40, y: 40)
                        .animation(.easeIn(duration: 2))
                }
                
                Text("2")
                GeometryReader { gr in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gr.size.width - 40) : 40, y: 40)
                        .animation(.linear(duration: 2))
                }
                
                Text("3")
                GeometryReader { gr in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (gr.size.width - 40) : 40, y: 40)
                        .animation(.easeOut(duration: 2))
                }
            }
            
            Button("Move") {
                self.move.toggle()
            }
        }
        .font(.title)
        .padding(.bottom)
    }
}

struct CurvasAnimationDos: View {
    
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText(title: "Esta es otra prueba")
            SubTitleText(subtitle: "Vamos a probar con mas animaciones")
            Spacer()
            HStack {
                Spacer()
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
                    .offset(x: self.change ? -250 : 0, y: self.change ? -450 : 0)
                    .animation(.easeInOut)
            }
            .padding()
            
            Button("Change") {
                self.change.toggle()
            }
            .padding(.bottom)
        }
        .font(.title)
    }
}

struct MenuAnimation: View {
    
    @State private var showButtonMenu = false
    @State private var shouldShowText = false
    @State private var shouldShowTextDos = false
    @State private var shouldShowTextTres = false
    @State private var shouldShowTextCuatro = false
    @State private var shouldShowTextCinco = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: 20) {
                    TitleText(title: "Menu Flotante")
                    SubTitleText(subtitle: "Como les gusta a los Androides")
                    Spacer()
                }
                
                Group {
                    boton1
                    boton2
                    boton3
                    boton4
                    boton5
                    botonMenu
                }
                .foregroundColor(.white)
                .animation(.default)
                
                Group {
                    NavigationLink("", destination: Text("bag.badge.plus"), isActive: self.$shouldShowText)
                    NavigationLink("", destination: Text("gauge.badge.plus"), isActive: self.$shouldShowTextDos)
                    NavigationLink("", destination: Text("calendar.badge.plus"), isActive: self.$shouldShowTextTres)
                    NavigationLink("", destination: Text("calendar.badge.plus"), isActive: self.$shouldShowTextCuatro)
                    NavigationLink("", destination: Text("calendar.badge.plus"), isActive: self.$shouldShowTextCinco)
                }
            }
        }
    }
    
    var boton1: some View {
        Button(action: {
            self.showButtonMenu.toggle()
            self.shouldShowText.toggle()
        }) {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        }
        .background(Circle().fill(Color.green).shadow(color: Color.black.opacity(0.3),
                                                       radius: 10,
                                                       x: 4,
                                                       y: 4))
        .offset(x: 0, y: self.showButtonMenu ? -150 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    var boton2: some View {
        Button(action: {
            self.showButtonMenu.toggle()
            self.shouldShowTextDos.toggle()
        }) {
            Image(systemName: "gauge.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : 90))
        }
        .background(Circle().fill(Color.green).shadow(color: Color.black.opacity(0.3),
                                                       radius: 10,
                                                       x: 4,
                                                       y: 4))
        .offset(x: self.showButtonMenu ? -150 : 0, y: 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    var boton3: some View {
        // Boton 3
        Button(action: {
            self.showButtonMenu.toggle()
            self.shouldShowTextTres.toggle()
        }) {
            Image(systemName: "calendar.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : 90))
        }
        .background(Circle().fill(Color.green).shadow(color: Color.black.opacity(0.3),
                                                       radius: 10,
                                                       x: 4,
                                                       y: 4))
        .offset(x: self.showButtonMenu ? -100 : 0, y: self.showButtonMenu ? -100 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    var boton4: some View {
        // Boton 4
        Button(action: {
            self.showButtonMenu.toggle()
            self.shouldShowTextCuatro.toggle()
        }) {
            Image(systemName: "calendar.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : 90))
        }
        .background(Circle().fill(Color.green).shadow(color: Color.black.opacity(0.3),
                                                       radius: 10,
                                                       x: 4,
                                                       y: 4))
        .offset(x: self.showButtonMenu ? -100 : 0, y: self.showButtonMenu ? -200 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    var boton5: some View {
        // Boton 4
        Button(action: {
            self.showButtonMenu.toggle()
            self.shouldShowTextCinco.toggle()
        }) {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : 90))
        }
        .background(Circle().fill(Color.green).shadow(color: Color.black.opacity(0.3),
                                                       radius: 10,
                                                       x: 4,
                                                       y: 4))
        .offset(x: self.showButtonMenu ? -200 : 0, y: self.showButtonMenu ? -100 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    var botonMenu: some View {
        // Boton de animacion de todo
        Button(action: {
            self.showButtonMenu.toggle()
        }) {
            Image(systemName: "plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 45 : 0))
        }
        .background(Circle().fill(Color.green).shadow(color:  Color.black.opacity(0.3),
                                                      radius: 10,
                                                      x: 4,
                                                      y: 4))
    }
}

struct GestureDrag: View {
    
    @GestureState private var menuOffset = CGSize.zero
    @State private var currentMenuY: CGFloat = 0.0
    @State private var showNewText = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TitleText(title: "Gesture Drag")
                SubTitleText(subtitle: "Podemos mover la animacion y completar el movimiento")
                Spacer()
                VStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 100, height: 100)
                        .overlay(
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(.white)
                                .offset(x: 0, y: -20)
                        )
                        .offset(x: 0, y: -40)
                    Button(action: {
                        self.currentMenuY = UIScreen.main.bounds.height * 0.50
                        self.showNewText.toggle()
                    }) {
                        Text("Button").foregroundColor(.black)
                    }
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.80)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.green).shadow(color: Color.black.opacity(0.3),
                                                                                        radius: 10,
                                                                                        x: 5,
                                                                                        y: 5))
                .padding(.bottom, -35)
                .offset(x: 0, y: self.currentMenuY + self.menuOffset.height)
                .gesture(
                    DragGesture()
                        .updating(self.$menuOffset,
                                  body: { value, menuOffset, transaction in
                                      menuOffset = value.translation
                                  })
                        .onEnded({ value in
                            if value.translation.height > 100 {
                                self.currentMenuY = UIScreen.main.bounds.height * 0.50
                            } else {
                                self.currentMenuY = 0
                            }
                        })
                )
                .animation(.default)
                
                Group {
                    NavigationLink(
                        "",
                        destination: Text("Hola Chic@s"),
                        isActive: self.$showNewText)
                }

            }
            .edgesIgnoringSafeArea(.bottom)
            .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        //CurvasAnimation()
        //CurvasAnimationDos()
        //MenuAnimation()
        GestureDrag()
    }
}



