//
//  AddReviewView.swift
//  Moviesime
//
//  Created by Nouf on 21/01/2025.
//



import Foundation
import SwiftUI

struct AddReviewView: View {
    @State var rate: Double? = nil
    @State var review_text: String = ""
    @State var movie_id: String = ""
    @State var user_id: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none // No decimals
        formatter.maximum = 10         // Assuming a maximum rating of 5
        formatter.minimum = 1         // Assuming a minimum rating of 1
        return formatter
    }
    
    @StateObject var vm = RatingViewModel()
    var body: some View {
       
        NavigationView{
            VStack (alignment: .center){
                TextField("rate", value: $rate, formatter: NumberFormatter()).keyboardType(.numberPad)
                TextField("review text", text: $review_text)
                TextField("movie id", text: $movie_id)
                TextField("user id", text: $user_id)
                
                Button("Submit"){
                    submitReview()
                }
            }
        }
            .navigationTitle("Add Reviewa")
    
    }
    
    
    
    func submitReview() {
        guard rate != 0, !review_text.isEmpty, !movie_id.isEmpty, !user_id.isEmpty else {
            alertMessage = "Please fill all fields"
            showAlert = true
            return
        }
        let review = Review(rate: rate ?? 0, review_text: review_text, movie_id: movie_id, user_id: user_id)
        let reviewData = ReviewRecord(fields: review)
        vm.postReview(review: reviewData)
        
        
    }
    
}
