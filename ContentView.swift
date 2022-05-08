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
    
    @State var email : String = ""
    @State var password : String = ""
    
    var body: some View{
        ScrollView{
//            lable
            VStack(alignment: .leading){
                Text("Email").foregroundColor(Color("dark-cian"))
                // Input field email
                ZStack(alignment: .leading){
                    if email.isEmpty {
                        Text("Ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $email)
                }
                Divider()
                    .frame( height: 0.8)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
//   Input field password
                Text("Password").foregroundColor(.gray)
                // Input field email
                ZStack(alignment: .leading){
                    if password.isEmpty {
                        Text("Enter the password")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("", text: $password)
                }
                Divider()
                    .frame( height: 0.8)
                    .background(.gray)
                    .padding(.bottom)

            }.padding(.horizontal, 24)
            
        }
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
