//
//  LoginModal.swift
//  Capstone
//
//  Created by Anuntaya Kitiporn on 29/4/2566 BE.
//
import Foundation

class LoginViewModel: ObservableObject {
    var username: String = ""
    var password: String = ""
    

    @Published var isAuthenticated: Bool = false
    @Published var isNotAuthenticated: Bool = false

    
    func login() {
        
        let defaults = UserDefaults.standard
        
        Webservice().login(username: username.localizedLowercase, password: password) { result in
            switch result {
                case .success(let token):
                    defaults.setValue(token, forKey: "jsonwebtoken")
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                self.isNotAuthenticated = true

      
 
            }
        }
    }
    
}


