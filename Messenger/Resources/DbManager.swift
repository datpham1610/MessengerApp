//
//  DbManager.swift
//  Messenger
//
//  Created by PDD on 12/09/2023.
//

import Foundation
import FirebaseDatabase
import UIKit

final class DbManager{
    static let shared = DbManager()
    private let db = Database.database().reference()
}

struct ChatAppUser{
    var firstName: String
    var lastName: String
    var emailAddress: String
    var safeEmail: String{
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
//    let photoProfileURL: String
}

//Acount Management
extension DbManager {
    
    public func userExists(with email: String,
                           completion: @escaping ((Bool) -> Void)){
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        db.child(safeEmail).observeSingleEvent(of: .value) { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
        }
    }
    
    public func insertUser(with user: ChatAppUser){
        db.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}
