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
            Spacer()
            Color(red: 19/255, green: 30/255, blue: 53/255)
                .ignoresSafeArea()
            
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 24)
                SingInSignUpView()
            }
        }
    }
}

struct SingInSignUpView :View{
    @State var isLoginType: Bool = true
    
    var body: some View{
        VStack{
            HStack{
                
                Spacer()
                Button("LOGIN"){
                    print("Pantalla de inicio de sesión")
                    isLoginType = true
                }
                .foregroundColor(
                    isLoginType ? .white : .gray
                )
                Spacer()
                Button("SIGN UP"){
                    print("Pantalla de registro de sesión")
                    isLoginType = false
                }
                .foregroundColor(
                    isLoginType ? .gray : .white
                )
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if isLoginType == true {
                LoginView()
            } else {
                SignUpView()
            }
        }
    }
}

struct LoginView : View {
    
    var body: some View{
        Text("LoginView")
    }
}


struct SignUpView : View {
    
    var body: some View{
        Text("SignUpView")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
