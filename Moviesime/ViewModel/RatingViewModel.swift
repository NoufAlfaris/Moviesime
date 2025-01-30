//
//  RatingViewModel.swift
//  Moviesime
//
//  Created by Nouf on 29/01/2025.
//

import Foundation
final class RatingViewModel: ObservableObject {
    private let apiKey = "Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001"
    
    @Published var reviews: [ReviewRecord] = []
    @Published var hasError: Bool = false
    @Published var error: UserError?
    
    init(){
        self.fetchReviews()
    }
    func fetchReviews(){
        hasError = false
        let reviewUrlString = "https://api.airtable.com/v0/appsfcB6YESLj4NCN/reviews"
        guard let url = URL(string: reviewUrlString) else { return }
        //        if let url = URL(string: productUrlString) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        
        URLSession
            .shared
            .dataTask(with: request) { [weak self] data, response, error in
                
                DispatchQueue.main.async{
                    
                    
                    if let error = error {
                        self?.hasError = true
                        self?.error = UserError.custom(error: error)
                    } else {
//                        print(String(data: data!, encoding: .utf8))
                        let decoder = JSONDecoder()
                        print("Hi")
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        if let data = data {
                                     do {
                                         let data = try decoder.decode(AllReviews.self, from: data)
                                         self?.reviews = data.records/*.map{$0.fields}*/
                                         
                                     } catch {
                                         self?.hasError = true
                                         self?.error = UserError.failedToDecode
                                         print("failed to decode \(self?.error)")
                                     }
                                 } else {
                                     self?.hasError = true
                                     self?.error = UserError.failedToDecode
                                     print("")
                                 }
                             }
//                        if let data = data,
//                           let movies = try? decoder.decode([Movie].self, from: data) {
//                            self?.movies = movies
//                            print(self?.movies.count)
//                        } else {
//                            self?.hasError = true
//                            self?.error = UserError.failedToDecode
//                            print("error")
//                        }
//                    }
                }
            }.resume()
    }
    
    
    func postReview(review: ReviewRecord) {
        hasError = false
        guard let url = URL(string: "https://api.airtable.com/v0/appsfcB6YESLj4NCN/reviews") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            
            let jsonData = try encoder.encode(review)
            print("JSON Data: \(String(data: jsonData, encoding: .utf8) ?? "Invalid JSON")")
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { jsonData, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        self.hasError = true
                        self.error = UserError.failedToFeedback(error)
                        print("Network Error: \(error.localizedDescription)")
                    }
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 201 {
                        DispatchQueue.main.async {
                            print("Success: Review posted")
                        }
                    } else {
                        DispatchQueue.main.async {
                            print("Error: HTTP \(httpResponse.statusCode)")
                            if let data = jsonData {
                                print("Response Body: \(String(data: data, encoding: .utf8) ?? "Invalid Data")")
                            }
                        }
                    }
                }
            }.resume()
        } catch {
            print("Encoding Error: \(error.localizedDescription)")
        }
    }
}



extension RatingViewModel{
    enum UserError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case failedToFeedback(Error)
        
        var errorDescription: String? {
            switch self {
            case .custom(error: let error):
                return error.localizedDescription
            case .failedToDecode:
                return "Failed to decode data"
            case .failedToFeedback(error: let error):
                return "Failed to send feedback: \(error.localizedDescription)"
            }
        }
    }
}
