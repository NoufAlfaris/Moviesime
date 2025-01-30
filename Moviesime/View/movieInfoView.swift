//
//  movieInfoView.swift
//  Moviesime
//
//  Created by Nouf on 27/01/2025.
//

import SwiftUI

struct movieInfoView: View {
//    var duration: String
//    var Language: [String]
//    var Genre: [String]
//    var ageRate: String
//    var story: String
//    var IMDB: Double
    var movie: Movie
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            HStack(alignment: .top /*,spacing: 119*/){
                VStack(alignment: .leading, spacing: 8){
                    Text("Duration")
                        .font(.system(size: 18, weight: .semibold))
                    
                    Text("\(movie.runtime)")
                        .font(.system(size:15, weight: .medium))
                        .foregroundColor(.detailGray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
//                Spacer()
                
                VStack(alignment: .leading,spacing: 8){
                    Text("Language")
                        .font(.system(size: 18, weight: .semibold))
//                    HStack(spacing: 4){
//                        ForEach(movie.language, id: \.self){ lang in
                        Text("\(movie.language.joined(separator: ", "))")
                                .font(.system(size:15, weight: .medium))
                                .foregroundColor(.detailGray)
                                .frame(width: 130, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                                
//                        }
//                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 50)
//                .offset(y: 10)
            } //end first hstak
            //            .frame(width:370 , height: 100 )
//            VStack(alignment: .leading){
                HStack(alignment: .top){
                VStack(alignment: .leading,spacing: 8){
                    Text("Genre")
                        .font(.system(size: 18, weight: .semibold))
//                        .offset(y: 30)
//                    HStack(alignment: .bottom, spacing: 4){
//                        VStack(alignment: .leading){
                        Text("\(movie.genre.joined(separator: ", "))")
                            .font(.system(size:15, weight: .medium))
                            .foregroundColor(.detailGray)
                            .frame(width: 130/*, height: 60*/, alignment: .leading)
//                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                          
//                            ForEach(movie.genre, id:\.self){
//                                genre in
//                                Text("\(genre).")
//                                    .font(.system(size:15, weight: .medium))
//                                    .foregroundColor(.detailGray)
//                                    .multilineTextAlignment(.leading)
//                                
//                                
//                            }
//                            .frame(width: 90)
//                            .multilineTextAlignment(.leading)
//                        }.frame(width: 90)
//                    }
//                    .frame(width: 130, height: 60)
//                    .frame(width: 100)
//                    .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
//                .offset(y: 20)
//                Spacer()
                
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Age")
                        .font(.system(size: 18, weight: .semibold))
                    //
                    Text(movie.rating == "PG-13" ? "+13" : movie.rating == "R" ? "+17" : "All ages")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.detailGray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 50)
//                .offset(x: -85)
                
            } //end 2nd hstack
        //}
//            .frame(width:370 , height: 100 )
            
            VStack(alignment: .leading , spacing: 8){
                Text("Story")
                    .font(.system(size: 18, weight: .semibold))
                Text("\(movie.story)")
                    .font(.system(size:15, weight: .medium))
                    .foregroundColor(.detailGray)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 22)
                    .fixedSize(horizontal: false, vertical: true)
                
                
                Text("IMDb Rating")
                    .font(.system(size: 18, weight: .semibold))
                
                Text(String(format: "%.1f / 10", movie.imDBRating))
                    .font(.system(size:15, weight: .medium))
                    .foregroundColor(.detailGray)
            }//story
            
        }/* .frame(width:370 , height: 100 )*/
        .padding()
    }
}

#Preview {
    movieInfoView(movie: Movie(name: "name", rating: "PG-13", genre: ["Drama", "Action" , "Adventure", "Thriller", "Romance"], poster: "url", language: ["Spanish", "English", "French"], imDBRating: 9, runtime: "2 h 39 min", story: "ياليل ابو لمبة fff ff  f f  f  fe  e q f e w fwe  feef  ewejf jef  fewf fefeeeeeee gtrgtrggr ggtrg trgtrgtrgtr frgefrtg rtgfrgtrg  trgtrgt"))
}
