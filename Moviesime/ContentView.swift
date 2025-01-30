//
//  ContentView.swift
//  Moviesime
//
//  Created by Nouf on 21/01/2025.
//



import SwiftUI

struct ContentView: View {
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading){
            Text("**name**: \(movie.name)")
            Text("**rating**: \(movie.rating)")
            Divider()
            Text("**poster**: \(movie.poster)")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 4)
    }
}
//
//#Preview {
//    ContentView(movie: .init(from: <#any Decoder#>, id: "1", product_Name: "1", product_Desc: "1", product_Image: "!"))
//}
