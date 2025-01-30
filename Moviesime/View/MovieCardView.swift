//
//  MovieCardView.swift
//  Moviesime
//
//  Created by Nouf on 23/01/2025.
//

import Foundation
import SwiftUI

struct MovieCardView: View {
    var url: String
    var title: String
    var rate: Double
    var genre: [String]
    var runtime: String
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: url)) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                    ProgressView()
                }
                
                 }
            .frame(width: 355, height: 429)
            .cornerRadius(7)
            .clipped()
            
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0.4), Color.clear]), startPoint: .bottom, endPoint: .top)
            VStack(alignment: .leading, spacing: 5) {
                //                Spacer()
                //                Spacer()
                //                Spacer()
                //                Spacer()
                //
                
                HStack{
                    Text(title)
                      //  .font(.title2) هذا حق فيقما
                        .bold()
                        .font(.title2)
                        .foregroundColor(.white)
                        Spacer()
//                        .font(.system(size:24, weight: .bold))
//                        .frame(width: 200)
                
                }
                
                
                HStack(spacing: 0){
                    ForEach(0..<5, id: \.self) {
                        index in
                        Image(systemName: index < Int(rate/2) ? "star.fill" : "star")
                            .foregroundColor(.accent)
                            .font(.system(size: 11))
                    }
                }
                HStack(alignment: .bottom){
                    Text(String(format: "%.1f", rate/2))
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                    Text("out of 5")
                        .font(.system(size: 12, weight: .medium))
                        .padding(.top, 5)
                        .foregroundColor(.white)
                }
                Text("\(genre[0]). \(runtime)")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white)
                
                //                Spacer()
                //                Spacer()
            }
            
            .frame(width: 355, height: 400)
            .multilineTextAlignment(.leading)
            .padding(.trailing, -10)
            .padding(.top, 290)
        }.navigationBarBackButtonHidden(true)
    }
    
}


#Preview {
//    MoviesCenterView()
    MovieCardView( url: "https://i.pinimg.com/736x/88/c8/20/88c8204e1017437290af9db9a02d83f6.jpg", title: "Title", rate: 9, genre: ["Action", "Adventure", "Fantasy", "Science Fiction"], runtime: "2 Hours")
}
