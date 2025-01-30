//
//  EditProfileView.swift
//  Moviesime
//
//  Created by Nouf on 29/01/2025.
//

import SwiftUI

struct EditProfileView: View {

//    @State var fullNameArr = self.user.name.components(separatedBy: " ")
    @State var first = /*fullNameArr[0]*/ "first"
    @State var last =   /*fullNameArr[1]*/ "last"
    @State var isEditing: Bool = false
    @State var showImagePicker = false
    @Environment(\.dismiss) var dismiss
    @State var isSignedOut: Bool = false
    
    var user: User
    var body: some View {
        NavigationView{
            VStack{
                if isEditing{
                    Button(action: {showImagePicker = true}){
                        AsyncImage(url: URL(string: user.profile_image)) {
                            image in
                            ZStack {
                                image.resizable()
                                    .scaledToFill()
                                Image(systemName: "camera")
                                    .foregroundColor(.accent)
                            }
                        } placeholder: {
                            ZStack{
                                EmptyView()
                                Image(systemName: "camera")
                                    .foregroundColor(.accent)
                            }
                            
                        }
                        .frame(width: 78, height: 78)
                        .overlay(.gray.opacity(0.3))
                        .clipShape(Circle())
//                        .sheet(isPresented: $showImagePicker){
////                            ImagePicker(
//                        }
//                        .overlay(.gray.opacity(0.3))
                    }
                    
                } else {
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
                .frame(width: 78, height: 78)
                .clipShape(Circle())
            }
                
                List{
                    HStack{
                        Text("First Name")
                            .font(.system(size: 18, weight: .medium))
                            .padding(.trailing, 30)
                        if isEditing{
                            TextField("First Name", text: $first)
                        } else {
                            Text("\(user.name.split(separator: " ").first ?? "First Name")")
                                
                        }
                    }
                    HStack{
                        Text("Last Name")
                            .font(.system(size: 18, weight: .medium))
                            .padding(.trailing, 30)
                        if isEditing{
                            TextField("Last Name", text: $last)
                        } else {
                            Text("\(user.name.split(separator: " ").last ?? "Last Name")")
                        }
                    }
                    
                }
                
                if !isEditing{
                    Button(action: {
                        isSignedOut = true
                        dismiss()
//                        isSignedOut = true
                        
                    }) {
                        ZStack{
//                            Rectangle()
//                                .fill(Color.signOutGray)
                            Text("Sign out")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .medium))
                                .padding()
                                .frame(width: 364, height: 41)
                                .background(Rectangle()
                                    .fill(Color.signOutGray)
                                    .cornerRadius(8))
                        }
                    }
                    .fullScreenCover(isPresented: $isSignedOut) {
                        SignInView()
                    }
                }
            
                
            }
            .navigationTitle(isEditing ? "Edit Profile" : "Profile info")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                    if isEditing{
                        Button(action: {
                            isEditing = false
                            //save / update function whatever
                        }){
                            Text("Save")
                                .font(.system(size: 16, weight: .medium))
                        }
                    } else{
//                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {isEditing = true}){
                                Text("Edit")
                                    .font(.system(size: 16, weight: .medium))
                            }
                        }
                    }
                }
        }
        
    }
}

//#Preview {
//    EditProfileView()
//}
