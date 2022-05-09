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
    @State var isLoginType: Bool = false
    
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
                        Text(verbatim: "Ejemplo@gmail.com")
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
                Text("Password").foregroundColor(.white)
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
                    .background(.white)
                
                Button(action: {
                    print("Olvidaste la contraseña")
                }, label:{
                    Text("Forgot password")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(Color("dark-cian"))
                }).padding(.bottom)
                
                //                Button login
                
                Button(action: {
                    login()
                    
                }, label: {
                    Text("LOGIN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,  alignment: Alignment.center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color("dark-cian"), lineWidth: 1)
                                .shadow(color: .white, radius: 6)
                        )
                    
                })
                
                //                Social Network section
                
                Text("Login with social network")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 64, leading: 0, bottom: 24, trailing: 0))
                
                
                HStack(alignment: .center){
                    Spacer()
                    
                    Button(action: {
                        print("Open Facebook login")
                    }, label: {
                        Text("Facebook")
                            .font(.caption)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,  alignment: Alignment.center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.white).opacity(0.1))
                            )
                    })
                    Spacer()
                    Button(action: {
                        print("Open Twitter login")
                    }, label: {
                        Text("Twitter")
                            .font(.caption)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,  alignment: Alignment.center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color(.white).opacity(0.1))
                    }).cornerRadius(8)
                    Spacer()
                }
                
                
                
            }.padding(.horizontal, 24)
            
        }
    }
}

func login(){
    print("Estoy logueandome")
}


struct SignUpView : View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var confirmPassword : String = ""
    
    var body: some View{
        ScrollView{
            VStack{
                Spacer()
                
                //Profile section
                
                VStack(alignment: .center){
                    Text("Choose to profile picture ")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text("You can change or modify later")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .fontWeight(.light)
                    Button(action: takePhoto, label: {
                        ZStack{
                            Image("profile")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 100)
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .background(Color(.white).opacity(0.2))
                                .cornerRadius(50)
                            
                        }
                    }).padding()
                }
                Spacer()
                //            Form
                VStack(alignment: .leading){
                    Text("Email*").foregroundColor(Color("dark-cian"))
                    // Input field email
                    ZStack(alignment: .leading){
                        if email.isEmpty {
                            Text(verbatim: "Ejemplo@gmail.com")
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
                    Text("Password").foregroundColor(.white)
                    // Input field password
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
                        .background(.white)
                        .padding(.bottom)
                    
                    // Input field confirm password
                    ZStack(alignment: .leading){
                        if password.isEmpty {
                            Text("Confirm your password")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        SecureField("", text: $password)
                    }
                    Divider()
                        .frame( height: 0.8)
                        .background(.white)
                        .padding(.bottom)
                    
                    //                Button login
                    
                    Button(action: {
                        signUp()
                        
                    }, label: {
                        Text("LOGIN")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,  alignment: Alignment.center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color("dark-cian"), lineWidth: 1)
                                    .shadow(color: .white, radius: 6)
                            )
                        
                    })
                }
                
                Spacer()
                
                VStack{
                    
                    //                Social Network section
                    
                    Text("Login with social network")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 64, leading: 0, bottom: 24, trailing: 0))
                    
                    
                    
                    
                    HStack(alignment: .center){
                        Spacer()
                        
                        Button(action: {
                            print("Open Facebook login")
                        }, label: {
                            Text("Facebook")
                                .font(.caption)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity,  alignment: Alignment.center)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color(.white).opacity(0.1))
                                )
                        })
                        Spacer()
                        Button(action: {
                            print("Open Twitter login")
                        }, label: {
                            Text("Twitter")
                                .font(.caption)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity,  alignment: Alignment.center)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .background(Color(.white).opacity(0.1))
                        }).cornerRadius(8)
                        Spacer()
                    }
                    
                    
                    
                }
                
            }
            .padding(.horizontal, 24)
            
        }
    }
}

func takePhoto(){
    print("Tomando foto...")
}

func signUp(){
    print("Estoy registrandome")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

