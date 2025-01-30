//
////  moviePosterView.swift
////  Moviesime
////
////  Created by Nouf on 27/01/2025.
////
//
//import SwiftUI
//
//struct moviePosterView: View {
//    var poster: String
//    var body: some View {
//        AsyncImage(url: URL(String: poster)){
//            image in image.resizable()
//        } Placeholder: {
//            ZStack{
//                Rectangle()
//                    .fill(Color.gray)
//                ProgressView()
//            }
//        }.frame(width: 208, height: 275)
//    }
//}
//
//#Preview {
//    moviePosterView()
//}
