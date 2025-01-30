//
//  moviePeopleView.swift
//  Moviesime
//
//  Created by Nouf on 28/01/2025.
//

import SwiftUI

struct moviePeopleView: View {
    var director: DirectorRecord
//    var cast: [ActorRecord]
    
    
    @StateObject var vm = MovieViewModel()
//    var movie: MovieRecord
//   
    var body: some View {

        VStack(alignment: .leading, spacing: 24){
            ScrollView(.horizontal, showsIndicators: false){
                
                
                VStack(alignment: .center, spacing: 12){
                    
                    Text("Director")
                        .font(.system(size: 18, weight: .semibold))
                    AsyncImage(url: URL(string: director.fields.image)) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        ZStack{
                            Rectangle()
                                .fill(Color.gray)
                            ProgressView()
                        }
                        
                    }
                    .frame(width: 76, height: 76)
                    .clipShape(Circle())
                    
                    Text("\(director.fields.name)")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.detailGray)
                    
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
            VStack( spacing: 12){
                HStack{
                    Text("Stars")
                        .font(.system(size: 18, weight: .semibold))
                    Spacer()
                }
                HStack(spacing: 40){
                    ForEach(vm.actors, id: \.self){ actorRecord in
                        VStack(alignment: .center, spacing: 12){
                            AsyncImage(url: URL(string: actorRecord.fields.image)) { image in
                                image.resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ZStack{
                                    Rectangle()
                                        .fill(Color.gray)
                                    ProgressView()
                                }
                                
                            }
                            .frame(width: 76, height: 76)
                            .clipShape(Circle())
                            Text("\(actorRecord.fields.name)")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.detailGray)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    Spacer()
                }
            }
        }
        }
    
    }
}

//#Preview {
//    moviePeopleView(director: Director(name: "John smith", image: "https://i.pinimg.com/736x/f3/18/41/f3184105d70f553a0eeed26f97122864.jpg"), cast: [Actor(image: "https://i.pinimg.com/736x/f3/18/41/f3184105d70f553a0eeed26f97122864.jpg", name: "John ssmith"),Actor(image: "https://i.pinimg.com/736x/f3/18/41/f3184105d70f553a0eeed26f97122864.jpg", name: "Maya"),Actor(image: "https://i.pinimg.com/736x/f3/18/41/f3184105d70f553a0eeed26f97122864.jpg", name: "Jack")])
//}
