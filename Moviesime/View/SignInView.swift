//
//  SignInView.swift
//  Moviesime
//
//  Created by Nouf on 22/01/2025.
//

import Foundation
import SwiftUI

struct SignInView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var isShowingPass: Bool = false
    @FocusState var focusField: field?
    @State var showAlert :Bool = false
    @Environment(\.dismiss) var dismiss
    @State var isLoggedIn: Bool = false
    @State var user: User? = nil
    @StateObject var vm = userViewModel( )
    enum field{
        case username, password
    }
    
    var buttonColor: Color {
        if !username.isEmpty && !password.isEmpty {
            return .accent
        }
        return .disableGray
    }
    
    
    public var body: some View {
        ZStack{
            Image("signInBackground")
                .resizable()
                .ignoresSafeArea()
                .frame(height: 998)
                .padding(.bottom, 240)
            
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0.85), Color.clear]), startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 8){
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("Sign in")
                    .font(.system(size: 40, weight: .bold))
                
                Text("You'll find what you're looking for in the ocean of movies.")
                    .font(.system(size: 18, weight: .medium))
                    .padding(.bottom, 12)
                
                
                
                
                //                VStack(alignment: .leading, spacing: 24) {
                Text("Email")
                    .font(.system(size: 18, weight: .medium))
                    .padding(.top, 12)
                
                TextField("Enter your email", text: $username)
                    .padding(13)
                    .background(Color.textFieldGray)
                    .cornerRadius(8)
                    .opacity(0.5)
                    .focused($focusField, equals: .username)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(focusField == .username ? Color.accent : Color.clear, lineWidth: 2)
                    )
                    .padding(.bottom, 24)
                
                Text("Password")
                    .font(.system(size: 18, weight: .medium))
                if isShowingPass{
                    ZStack{
                        TextField("Enter your password", text: $password)
                            .padding(13)
                            .background(Color.textFieldGray)
                            .cornerRadius(8)
                            .opacity(0.5)
                        //                } //end inner vstack
                        //
                        //                    .padding(.bottom, 24)
                            .focused($focusField, equals: .password)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(focusField == .password ? Color.accent : Color.clear, lineWidth: 2)
                            )
                            .padding(.bottom, 24)
                        
                        Button(action : {isShowingPass.toggle()})
                        {
                            Image(systemName: "eye.slash.fill")
                                .font(.system(size: 18))
                                .frame(width:24, height: 30)
                                .padding(.leading, 330)
                                .padding(.bottom, 20)
                                .foregroundColor(.white)
                                
                        }
                    }
                }
                else {
                    ZStack{
                        SecureField("Enter your password", text: $password)
                            .padding(13)
                            .background(Color.textFieldGray)
                            .cornerRadius(8)
                            .opacity(0.5)
                        //                } //end inner vstack
                        //
                        //                    .padding(.bottom, 24)
                            .focused($focusField, equals: .password)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(focusField == .password ? Color.accent : Color.clear, lineWidth: 2)
                            )
                            .padding(.bottom, 24)
                        if !password.isEmpty{
                            Button(action : {isShowingPass.toggle()})
                            {
                                Image(systemName: "eye")
                                    .font(.system(size: 18))
                                    .frame(width:20, height: 30)
                                    .padding(.leading, 330)
                                    .padding(.bottom, 20)
                                    .foregroundColor(.white)
                                //                                .frame(width:50)
                            }.frame(width: 23)
                        }
                        
                    }
            }
                
                
                
                
                Button(action:{
                    signIn(email: self.username, password: self.password)
                }) {
                   
                        Text("Sign in")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.textFieldGray)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(buttonColor).cornerRadius(8)
                            .padding(.horizontal, 4)
                }
                .disabled(username.isEmpty || password.isEmpty)
                .fullScreenCover(isPresented: $isLoggedIn) {
                    MoviesCenterView(user: user ?? User(profile_image: "No Image", email: "", name: "anonymous", password: ""))
                }
                
                
                Spacer()
                Spacer()
                
                
            }.padding(.leading, 10) //end vstack
        } //end zstack
        
    }
    
    func signIn(email: String, password: String){
        if let userRecord = vm.validUser(email: email, password: password){
            print(userRecord)
            print("valid")
            self.user = userRecord.fields
            print(self.user)
            isLoggedIn = true
//            user = userRecord.fields
//            MoviesCenterView(user: userRecord.fields)
            dismiss()
        }
        else{
            isLoggedIn = false
            showAlert = true
        }
    }
//   func getBorder() -> some View {
//        Rectangle()
//            .stroke(.accent, lineWidth: 100)
//    }
    
}


#Preview {
    SignInView()
}
