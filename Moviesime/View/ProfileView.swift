//
//  ProfileView.swift
//  Moviesime
//
//  Created by Nouf on 29/01/2025.
//


import SwiftUI

struct ProfileView: View {
    var savedMovies: [Movie] = []
    var user: User
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading , spacing: 50){
                    Spacer()
                    HStack{
                        AsyncImage(url: URL(string: user.profile_image)) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                            ProgressView()
                        }
                        
                    }
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    
                        VStack(alignment: .leading, spacing: 4){
                            Text("\(user.name)")
                                .font(.system(size: 18, weight: .medium))
//                            Text("nouf@gmail.com")
                            Text("\(user.email)")
                                .font(.system(size: 12, weight: .regular))
//                                .foregroundColor(.blue)
                                .textContentType(.none) //it detects its a liink so we need to do this:| سويفت ماتصير ذكية الا ب اغبى وقت
                                .tint(.white)
                        }
                        Spacer()
                        
                        NavigationLink(destination: EditProfileView(user: user)){
                            Image(systemName: "chevron.right")
                                .foregroundColor(.textFieldGray)
                        }
                        
                    
                    }.padding()
                        .background(Color.reviewBackground)
                        .cornerRadius(8)
                    
                    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Saved Movies")
                            .font(.system(size: 22 , weight: .semibold))
                       
                        if savedMovies.isEmpty {
                                
                                VStack {
                                    Spacer()
                                
                                    VStack(alignment: .center, spacing: 16) {
                                        Image("moviesime")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 74, height: 47)
                                        
                                        Text("No saved movies yet, start saving your favorites!")
                                            .font(.system(size: 14.65, weight: .medium))
                                            .multilineTextAlignment(.center)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .padding(.horizontal, 20)
                                    }
                                    .frame(maxWidth: 230)
//
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.top, 100)
                        }
//                        if savedMovies.isEmpty{
//                            
//                            VStack(alignment: .center){
//                                Image("moviesime")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 74, height: 47)
//                                
//                                Text("No saved movies yet, start saving your favorites!")
//                                    .font(.system(size: 14.65, weight: .medium))
//                                    .frame(width: 219, height:34)
//                                    .multilineTextAlignment(.center)
//                                    .fixedSize(horizontal: false, vertical: true)
//                                
//                            }
//                        }
                        
                    }
                    
                }
            }.navigationTitle("Profile")
                .navigationBarBackButtonHidden(true)
                
        }
        
    }
}
#Preview{
    ProfileView(user: User(profile_image: "", email: "", name: "nn", password: ""))
}
