////
////  StarRatingView.swift
////  Moviesime
////
////  Created by Nouf on 27/01/2025.
////
//
//import SwiftUI
//
//struct StarRatingView: View {
//    var rating: Double
//    var body: some View {
//        HStack{
//            ForEach(0..<5, id: \.self) {
//                index in
//                Image(systemName: index < Int(rating/2) ? "star.fill" : "star")
//                    .foregroundColor(.accent)
//            }
//        }
//    }
//}
//
//#Preview {
//    StarRatingView(rating: 9.3)
//}
