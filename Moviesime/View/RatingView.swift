//
//  RatingView.swift
//  Moviesime
//
//  Created by Nouf on 28/01/2025.
//

import SwiftUI

struct RatingView: View {
    @StateObject var vm = RatingViewModel()
    @StateObject var uservm = userViewModel()
    
    var movie: MovieRecord
    var filteredReviews: [ReviewRecord] {
        return vm.reviews.filter { $0.fields.movie_id == movie.id }

    }
    //        return vm.reviews.filter{
    //            $0.movie_id == $0.uservm.movieRecord.id
    ////            searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased())
    //        }
//    @State var user: User? = nil
//    @State var userExists: Bool = false
    @State var userRateAverage: Double = 0
    
    func computeUserRateAverage() -> Double {
        return filteredReviews.reduce(0, { $0 + $1.fields.rate/2 }) / Double(filteredReviews.count) 
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
           Text("Rating & Reviews")
                .font(.system(size: 18, weight: .semibold))
            VStack(alignment: .leading){
                if !filteredReviews.isEmpty {
                Text(String(format: "%.1f", computeUserRateAverage()))
                    .font(.system(size: 39, weight: .semibold))
                    .foregroundColor(.detailGray)
                Text("out of 5")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.detailGray)
                    .padding(.bottom, 16)
                } else{
                    Text("No reviews yet")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.gray)
                }
                
                ScrollView(.horizontal){
                    HStack(alignment: .top, spacing: 5) {

                        ForEach(/*vm.reviews*/filteredReviews, id: \.self){ reviewRecord in
                            VStack(alignment: .leading){
                                HStack{
                                    
                                    if let user = checkUserExist(reviewRecord: reviewRecord) {
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
                                    .frame(width: 38, height: 38)
                                    .clipShape(Circle())
                                    } else {
                                        Image(systemName: "person.crop.circle.fill")
                                            .font(.system(size: 30))
                                            .frame(width: 38, height: 38)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 4){
//                                        let user = uservm.users.first(where: {$0.id == reviewRecord.fields.id})
//                                        if checkUserExist(ReviewRecords: reviewRecord){
//                                            Text("\(user.name)")
//                                                .font(.system(size: 13, weight: .medium))
//                                        }
//                                        else{
//                                            Text("anonymous")
//                                                .font(.system(size: 13, weight: .medium))
//                                        }
                                        if let user = checkUserExist(reviewRecord: reviewRecord) {
                                            Text("\(user.name)")
                                                .font(.system(size: 13, weight: .medium))
                                        } else {
                                            Text("anonymous")
                                                .font(.system(size: 13, weight: .medium))
                                        }
//                                        Text(uservm.users.id.contains(reviewRecord.fields.userId) ? "\(uservm.users.name)" : "anonymous")
//                                            .font(.system(size: 13, weight: .medium))
                                        HStack(spacing: 0){
                                            ForEach(0..<5, id: \.self) {
                                                index in
                                                Image(systemName: index < Int(reviewRecord.fields.rate/2) ? "star.fill" : "star")
                                                    .foregroundColor(.accent)
                                                    .font(.system(size: 11))
                                            }
                                        }
                                    }
                                }
                                
//                                .frame(alignment: .leading)
//                                Spacer()
                                VStack{
                                    Text("\(reviewRecord.fields.review_text)")
                                        .font(.system(size:13, weight: .regular))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 22)
                                        .frame(width: 258, alignment: .leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .padding()
                            .background(Color.reviewBackground)
                            .cornerRadius(8)
                  
                        }
                    }
                }
            }
        }
    }
    
    func checkUserExist(reviewRecord: ReviewRecord) -> User? {
        if let userRecord = uservm.users.first(where: { $0.id == reviewRecord.fields.user_id }){
            return userRecord.fields
        }
        return nil
    }
    
//    func checkUserExist(ReviewRecords: ReviewRecord) -> Bool{
//        if let maybeUser = uservm.users.first(where: {$0.id == ReviewRecord.id}){
//            self.$user = maybeUser
//            return true
//        }
//        else {
////            userExists = false
//            return false
//        }
//        
//    }
}

#Preview {
    RatingView(movie: MovieRecord(id: "recNqwfe096z7LDwZ", createdTime: "2025-01-25T13:16:32.000Z", fields: Movie(name: "name", rating: "PG-13", genre: ["Drama", "Action" , "Adventure", "Thriller", "Romance"], poster: "url", language: ["Spanish", "English", "French"], imDBRating: 9, runtime: "2 h 39 min", story: "ياليل ابو لمبة fff ff  f f  f  fe  e q f e w fwe  feef  ewejf jef  fewf fefeeeeeee gtrgtrggr ggtrg trgtrgtrgtr frgefrtg rtgfrgtrg  trgtrgt")))
}
