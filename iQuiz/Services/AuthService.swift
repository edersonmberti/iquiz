//
//  AuthenticationService.swift
//  iQuiz
//
//  Created by Ederson Machado Berti on 08/08/21.
//

import Foundation
import Firebase

protocol AuthServiceProtocol {
    
    func isAuthenticated() -> Bool
    func signIn(withEmail email: String, password: String, completion: AuthDataResultCallback?)
    func signOut()
    func registerUser(with data: Registration, completion: @escaping(Error?) -> Void)
}

struct AuthService: AuthServiceProtocol {
    
    func isAuthenticated() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func signIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Failed to sign out")
        }
    }
    
    func registerUser(with data: Registration, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let data: [String: Any] = ["email": data.email,
                                        "fullname": data.fullname,
                                        "uid": uid]
            
            COLLECTION_USERS.document(uid).setData(data, completion: completion)
        }
    }
}
