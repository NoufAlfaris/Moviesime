//
//  MovieListViewTest.swift
//  Moviesime
//
//  Created by Nouf on 21/01/2025.
//


import SwiftUI

struct MovieListViewTest: View {
    
//    @StateObject var vm = MovieViewModel()
    @StateObject var reviewVM = RatingViewModel()
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    List{
//                        ForEach(vm.movies, id: \.self) { movie in
////                            ContentView(movie: movie)
////                                .listRowSeparator(.hidden)
//                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("movies")
                    Text("\(reviewVM.reviews.count)")
                    NavigationLink(destination: AddReviewView()) {
                        Text("Add Review")
                    }
                }
                
            }/*.onAppear(perform: vm.fetchMovies)*/
        }
    }
}


#Preview {
    MovieListViewTest()
}

