//
//  MoviesCenterView.swift
//  Moviesime
//
//  Created by Nouf on 23/01/2025.
//

import Foundation
import SwiftUI

struct MoviesCenterView: View {
    @State var searchText: String = ""
    @StateObject var vm = MovieViewModel()
    var user: User
    var filteredMovies: [Movie] {
        return vm.movies.filter{
            searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var highRated: [Movie] {
        return filteredMovies
            .filter { $0.imDBRating >= 9 }
            .sorted { $0.imDBRating > $1.imDBRating }
    }
    
     var dramaMovies: [Movie]{
         return filteredMovies.filter { $0.genre.contains("Drama")}
    }
    
    var crimeMovies: [Movie]{
        return filteredMovies.filter { $0.genre.contains("Crime")}
    }
    
    var actionMovies: [Movie]{
        return filteredMovies.filter { $0.genre.contains("Action")}
    }
    
    var comedyMovies: [Movie]{
        return filteredMovies.filter { $0.genre.contains("Comedy")}
    }
    
    var horrorMovies: [Movie]{
        return filteredMovies.filter { $0.genre.contains("Horror")}
    }
    
    var thrillerMovies: [Movie]{
        return filteredMovies.filter { $0.genre.contains("Thriller")}
    }
    
    var romanceMovies: [Movie]{
        return filteredMovies.filter { $0.genre.contains("Romance")}
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 40){
                    
                    //                    HStack {
                    if searchText.isEmpty{
                        VStack(alignment: .leading){
                            Text("High Rated")
                                .font(.system(size: 22, weight: .semibold))
                            //                            .padding()
                            //                        Spacer()
                            //
                            //                    }.padding(.leading, 15)
                            
                            //
                            //                        TabView{
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                HStack(spacing: 20){
                                    
                                    ForEach(highRated, id: \.self){ movie in
                                        NavigationLink(destination: movieDetailsView(movie: movie)){
                                            MovieCardView(url: movie.poster, title: movie.name, rate: movie.imDBRating, genre: movie.genre, runtime: movie.runtime)
                                                .frame(width:355, height: 429)
                                        }
                                        
                                        
                                        
                                    }
                                    
                                }
                                
                                
                            }
                        }
//                        }.tabViewStyle(.page)
                        
                        if !dramaMovies.isEmpty{
                            VStack(alignment: .leading){
                            Text("Drama")
                                .font(.system(size: 22, weight: .semibold))
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    ForEach(dramaMovies, id: \.self){ movie in
                                        NavigationLink(destination: movieDetailsView(movie: movie)){
                                        AsyncImage(url: URL(string: movie.poster)){
                                            image in image.resizable()
                                        } placeholder: {
                                            ZStack{
                                                Rectangle()
                                                    .fill(Color.gray)
                                                ProgressView()
                                            }
                                        }.frame(width: 208, height: 275)
                                    }
                                    }
                                }
                            }
                        }
                        }
                        
                        if !actionMovies.isEmpty{
                            VStack(alignment: .leading){
                            Text("Action")
                                .font(.system(size: 22, weight: .semibold))
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    
                                        ForEach(actionMovies, id: \.self){ movie in
                                            NavigationLink(destination: movieDetailsView(movie: movie)){
                                            AsyncImage(url: URL(string: movie.poster)){
                                                image in image.resizable()
                                            } placeholder: {
                                                ZStack{
                                                    Rectangle()
                                                        .fill(Color.gray)
                                                    ProgressView()
                                                }
                                            }.frame(width: 208, height: 275)
                                        }
                                    }
                                }
                            }
                        }
                        }
                        
                        if !crimeMovies.isEmpty{
                            VStack(alignment: .leading){
                                Text("Crime")
                                    .font(.system(size: 22, weight: .semibold))
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(crimeMovies, id: \.self){ movie in
                                            NavigationLink(destination: movieDetailsView(movie: movie)){
                                                AsyncImage(url: URL(string: movie.poster)){
                                                    image in image.resizable()
                                                } placeholder: {
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(Color.gray)
                                                        ProgressView()
                                                    }
                                                }.frame(width: 208, height: 275)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        if !comedyMovies.isEmpty{
                            VStack(alignment: .leading){
                                Text("Comedy")
                                    .font(.system(size: 22, weight: .semibold))
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(comedyMovies, id: \.self){ movie in
                                            NavigationLink(destination: movieDetailsView(movie: movie)){
                                                AsyncImage(url: URL(string: movie.poster)){
                                                    image in image.resizable()
                                                } placeholder: {
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(Color.gray)
                                                        ProgressView()
                                                    }
                                                }.frame(width: 208, height: 275)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        if !horrorMovies.isEmpty{
                            VStack(alignment: .leading){
                                Text("Horror")
                                    .font(.system(size: 22, weight: .semibold))
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(dramaMovies, id: \.self){ movie in
                                            NavigationLink(destination: movieDetailsView(movie: movie)){
                                                AsyncImage(url: URL(string: movie.poster)){
                                                    image in image.resizable()
                                                } placeholder: {
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(Color.gray)
                                                        ProgressView()
                                                    }
                                                }.frame(width: 208, height: 275)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        if !thrillerMovies.isEmpty{
                            VStack(alignment: .leading){
                                Text("Thriller")
                                    .font(.system(size: 22, weight: .semibold))
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(dramaMovies, id: \.self){ movie in
                                            NavigationLink(destination: movieDetailsView(movie: movie)){
                                                AsyncImage(url: URL(string: movie.poster)){
                                                    image in image.resizable()
                                                } placeholder: {
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(Color.gray)
                                                        ProgressView()
                                                    }
                                                }.frame(width: 208, height: 275)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        if !romanceMovies.isEmpty{
                            VStack(alignment: .leading){
                                Text("romance")
                                    .font(.system(size: 22, weight: .semibold))
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(dramaMovies, id: \.self){ movie in
                                            NavigationLink(destination: movieDetailsView(movie: movie)){
                                                AsyncImage(url: URL(string: movie.poster)){
                                                    image in image.resizable()
                                                } placeholder: {
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(Color.gray)
                                                        ProgressView()
                                                    }
                                                }.frame(width: 208, height: 275)
                                            }.navigationBarBackButtonHidden(true)
                                        }
                                    }
                                }
                            }
                        }
                        
                      
                    
                } //end if
                    else {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(0..<filteredMovies.count, id: \.self) { rowIndex in
                                HStack(spacing: 14) {
                                    ForEach(0..<2, id: \.self) { columnIndex in
                                        let movieIndex = rowIndex * 2 + columnIndex
                                        if movieIndex < filteredMovies.count {
                                            NavigationLink(destination: movieDetailsView(movie: filteredMovies[movieIndex])){
                                                AsyncImage(url: URL(string: filteredMovies[movieIndex].poster)){
                                                    image in
                                                    image.resizable()
                                                        .scaledToFill()
                                                } placeholder: {
                                                    ZStack{
                                                        Rectangle()
                                                            .fill(Color.gray)
                                                        ProgressView()
                                                    }
                                                    
                                                }
                                                .frame(width: 172, height: 237)
                                                .cornerRadius(7)
                                                .clipped()
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }

//                        ForEach(filteredMovies, id: \.self){ movie in
//                            VStack{
//                                ForEach(0..<2, id: \.self) {
//                                    index in
//                                    AsyncImage(url: URL(string: filteredMovies[index].poster))
//                                }
//                            }
//                        }
                    }
                        
                    }
                }
                
                .searchable(text: $searchText, prompt: "Search for Movie name, actors ...")
                .navigationTitle("Movies Center")
                .navigationBarBackButtonHidden(true)
                .padding()
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        NavigationLink(destination: ProfileView(user: user)) {
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
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        }
                    }
                }
                
                
            }
        }
    }
    

#Preview {
    MoviesCenterView(user: User(profile_image: "https://source.unsplash.com/200x200/?person", email: "alia@romero.com", name: "Alia Romero", password: "alia@romero.com"))
}
