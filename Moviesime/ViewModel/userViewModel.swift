//
//  userViewModel.swift
//  Moviesime
//
//  Created by Nouf on 30/01/2025.
//

import Foundation
final class userViewModel: ObservableObject {
//    @StateObject var vm = MovieViewModel()
    private let apiKey = "Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001"
    @Published var hasError: Bool = false
    @Published var error: UserError?
    @Published var users: [UserRecord] = []
    @Published var user: User? = nil

    init(){
        self.fetchUsers()
    }
    
    func fetchUsers(){
        hasError = false
        let userUrlString = "https://api.airtable.com/v0/appsfcB6YESLj4NCN/users"
        guard let url = URL(string: userUrlString) else { return }
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
                                         let data = try decoder.decode(AllUsers.self, from: data)
                                         self?.users = data.records/*.map{$0.fields}*/
                                         
                                     } catch {
                                         self?.hasError = true
                                         self?.error = UserError.failedToDecode
                                         print("error 1")
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
    
    func validUser(email: String, password: String) -> UserRecord?{
        /*if let user =*/ return self.users.first(where: {$0.fields.email == email && $0.fields.password == password})
//        {
//            return true
//        }
//        return false
    }
}

extension userViewModel{
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
