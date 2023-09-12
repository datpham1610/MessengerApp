//
//  ViewController.swift
//  Messenger
//
//  Created by PDD on 06/09/2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    let btnSignOut = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
        btnSignOut.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        btnSignOut.setTitle("Sign Out", for: .normal)
        btnSignOut.setTitleColor(.black, for: .normal)
        btnSignOut.addTarget(self, action: #selector(SignOut) , for: .touchUpInside)
        view.addSubview(btnSignOut)
    }
    
    @objc func SignOut(){
        do { try Auth.auth().signOut() }
        catch { print("already logged out") }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }
    
    private func validateAuth(){
        if Auth.auth().currentUser == nil {
            let vc = LoginVC()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false, completion: nil)
        } else {
            
        }
    }
    
}

