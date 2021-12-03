//
// Created on 3/12/21.
// PeopleView.swift - Very brief description
//


import SwiftUI

struct PeopleView: View {
    
    // MARK: ObservedObject -> MVVM Dependencies
    @ObservedObject var viewModel: PeopleViewModel
    
    var body: some View {
        VStack{
            Text("hello world!")
                .fontWeight(.bold)
        }
        .onAppear{
            
        }
    }
}

struct People_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(viewModel: PeopleViewModel())
            .environment(\.colorScheme, .dark)
    }
}


