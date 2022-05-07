//
//  ContentView.swift
//  GameStream
//
//  Created by Romel Palomino on 07/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 19/255, green: 30/255, blue: 53/255)
                .ignoresSafeArea()
            
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 250)
                SingInSignUpView()
            }
        }
    }
}

struct SingInSignUpView :View{
    var body: some View{
        VStack{
            HStack{
                Text("inicio de sesión")
                    .colorInvert()
                Text("Registrate")
                    .colorInvert()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
