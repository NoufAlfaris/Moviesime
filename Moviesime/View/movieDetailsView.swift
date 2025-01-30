//
//  movieDetailsView.swift
//  Moviesime
//
//  Created by Nouf on 27/01/2025.
//

import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct movieDetailsView: View {
//    @State var isScrolled = false
    @State var showInline = false
    @State var scrollOffset: CGFloat = 0
    var movie: Movie
    var movieRecrod: MovieRecord? {
        return vm.movieRecord.first(where: { $0.fields == movie })
    }
    @StateObject var vm = MovieViewModel()
    @Environment(\.dismiss) var dismiss
    func titleAndImageBar() -> some View {
        ZStack(alignment: .bottomLeading){
            AsyncImage(url: URL(string: movie.poster)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipped()
//                    .ignoresSafeArea()
//                    .edgesIgnoringSafeArea(.top)
//                    Spacer()
            } placeholder: {
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                    ProgressView()
                }
                
//                Spacer()
                
            }
            
       
            .padding()
            .frame(width: 355, height: 429)
            .cornerRadius(7)
            .clipped()
            
            
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0.5), Color.clear]), startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            
            if !showInline{
                VStack{
                Spacer()
                HStack{
                    Text("\(movie.name)")
                        .font(.largeTitle)
                        .bold()
                        .frame(alignment: .leading)
                        .padding(.leading, 15)
                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
            
        }
        .navigationBarBackButtonHidden(true)
//        .frame(height: 429)
        .edgesIgnoringSafeArea(.top)
//        .padding()
//        .frame(width: 355, height: 429)
        


    }
    var body: some View {
        NavigationView{
            ScrollView {
                
                VStack(spacing: 0){
                    //                    VStack{
                    titleAndImageBar()
                        .overlay(GeometryReader { geo in
                            Color.clear.preference(
                                key: ScrollOffsetPreferenceKey.self,
                                value: geo.frame(in: .global).minY
                            )
                        })
                        .frame(height: 400)
                        .navigationBarBackButtonHidden(true)
                    //                        .background(GeometryReader { geo in
                    //                                                    Color.clear
                    //                                                        .onChange(of: geo.frame(in: .global).minY) { value in
                    //                                                            // Update showInline based on scroll position
                    //                                                            showInline = value <= -300
                    //                                                        }
                    //                                                })
                    //                                                .frame(height: 429)
                    //                                                .onAppear {
                    //                                                    // Reset scroll offset when appearing
                    //                                                    scrollOffset = 0
                    //                                                }
                    //                                                .background(GeometryReader { geo in
                    //                                                    Color.clear
                    //                                                        .onChange(of: geo.frame(in: .global).minY) { value in
                    //                                                            // If the image is scrolled out of view (threshold of 429)
                    //                                                            if value <= -429 {
                    //                                                                showInline = true
                    //                                                            } else {
                    //                                                                showInline = false
                    //                                                            }
                    //                                                        }
                    //                                                })
                    //                        .frame(width: 355, height: 429)
                    //                        .background(GeometryReader { geometry in
                    //                            Color.clear.onAppear{
                    //                                DispatchQueue.main.async{
                    //                                    showInline = geometry.frame(in: .global).minY <= -300
                    //                                }
                    //                            }
                    //                            .onChange(of: geometry.frame(in: .global).minY) { newOffset in
                    //                                showInline = newOffset <= -300
                    //                            }
                    //
                    //                        })
                    //                            .edgesIgnoringSafeArea(.all)
                    //                    }
                    
                    
                    //                        .background(GeometryReader { geometry in
                    //                                                Color.clear
                    //                                                    .preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .global).minY)
                    //                                            })
                    //
                    //                        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    //                                                   // Determine if the titleAndImageBar is scrolled past the height (429)
                    //                                                   if value <= -429 { // The view has scrolled out of view
                    //                                                       showInline = true
                    //                                                   } else {
                    //                                                       showInline = false
                    //                                                   }
                    //                                               }
                    
                    movieInfoView(movie: movie)
                    //                        .frame(width:370 , height: 100 )
                    
                    
                    Divider()
                        .overlay(.gray)
                        .padding([.top, .bottom], 40)
                    
                    moviePeopleView(director: DirectorRecord(id: "recNA2IpWz1MVjvoy", createdTime: "2025-01-06T08:39:18.000Z", fields: Director(name: "Nolan", image: "https://upload.wikimedia.org/wikipedia/commons/0/05/Francis_Ford_Coppola_2011_CC.jpg")))
                    //                    moviePeopleView(director: <#T##Director#>, cast: <#T##[Actor]#>)
                    
                    
                    Divider()
                        .overlay(.gray)
                        .padding([.top, .bottom], 40)
                    if let movieRecrod = self.movieRecrod {
                        RatingView(movie: movieRecrod)
                    }
                    else{
                        Text("No reviews")
                    }
                    
//                    Rating
//                    ForEach(0..<10, id: \.self) { _ in
//                        Text("Hi")
//                            .padding(.vertical, 4)
//                    }
                    
//                    Divider()
//                        .overlay(.gray)
//                        .padding([.top, .bottom], 40)
                    
                    //                    RatingView()
                    
                }
                //                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                //                                    withAnimation {
                //                                        showInline = value <= -300
                //                                    }
                //                                }
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    DispatchQueue.main.async {
                        let newShowInline = value <= -300
                        if newShowInline != showInline {
                            withAnimation {
                                showInline = newShowInline
                            }
                        }
                    }
                }
                //}
                //                .NavigationBarCustomStyle()
                .navigationTitle(self.showInline ? "Name" : "")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                
                                
                                
               
                //                .navigationBarHidden(true)
                //                .navigationBarHidden(showInline ? false: true)
                .toolbar {
                    //                    if showInline {
                    ToolbarItem(placement: .navigationBarLeading){
                        if showInline{
                            Button(action: {dismiss()}){
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .font(.system(size: 16.55))
                                    .offset(x: -2)
                                    .background(Circle().fill(Color.white.opacity(0.8)).frame(width:32, height: 32))
                                
                            }
                        }
                        
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing){
                        if showInline{
                            HStack(spacing: 15){
                                //                            if showInline{
                                Button(action: {} ) {
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                    
                                        .font(.system(size: 16.55))
                                        .offset(y: -2)
                                    //                                    .offset(x: -2)
                                        .background(Circle().fill(Color.white.opacity(0.8)).frame(width:32, height: 32))
                                }
                                //                            }
                                //
                                if showInline{
                                    
                                    Button(action: {}) {
                                        Image(systemName: "bookmark")
                                            .resizable()
                                            .font(.system(size: 16.55))
                                            .frame(width: 17 , height: 20 )
                                        //                                    .offset(x: -2)
                                            .background(Circle().fill(Color.white.opacity(0.8)).frame(width:32, height: 32))
                                    }
                                }
                            }
                            
                        }
                        
                        //                }//if
                    }
                }
//                .navigationBarBackButtonHidden(true)
                //            .onAppear {
                //                         // ScrollView content height change handling (e.g., title bar height of 429)
                //                         scrollOffset = 0
                //                     }
                //                     .onChange(of: scrollOffset) { newValue in
                ////                         showInline = newValue <= -300
                //                         // Adjust scroll offset logic here (optional)
                //                     }
            }
        }
        
    }
}
    

#Preview {
//    movieDetailsView(movie: Movie(name: "Test", rating: "Test", genre: ["Spanish","Spanish", "Spanish",  "English", "French"], poster: "Test", language: ["Test", "test", "test", "test", ], imDBRating: 0, runtime: "Test", story: "Test Test Test test test kdlnvelkwfhneljj fekjfhewjd fkfhelwhdn fkehflb 3d wfkghej mdewlje fer fer f frefewd f e f rg  y t f e ee  tt t y h hhg  ede fref e dqsdjd"))
}
