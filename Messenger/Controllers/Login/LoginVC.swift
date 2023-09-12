//
//  LoginVC.swift
//  Messenger
//
//  Created by PDD on 07/09/2023.
//

import UIKit
import Toast_Swift
import FirebaseAuth

class LoginVC: BaseViewController {
    
    private let imageView = UIImageView()
    private let emailFied = UITextField()
    private let passwordField = UITextField()
    private let loginBtn = UIButton()
    let colorPlaceholder = [NSAttributedString.Key.foregroundColor:UIColor.systemGray]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        setupView()
    }
    
    func setupView(){
        
        //Setup ImageView
        setupImageView()
        
        //setupField
        setupEmailField()
        setupPasswordField()
        
        //setupButton
        setupLoginBtn()
    }
    
    func setupImageView(){
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.width/4).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.width/4).isActive = true
    }
    
    func setupEmailField(){
        emailFied.autocapitalizationType = .none
        emailFied.autocorrectionType = .no
        emailFied.returnKeyType = .continue
        emailFied.layer.cornerRadius = 5
        emailFied.layer.borderWidth = 1
        emailFied.layer.borderColor = UIColor.lightGray.cgColor
        emailFied.textColor = .black
        emailFied.attributedPlaceholder = NSAttributedString(string: "Email Adress...",
                                                             attributes: colorPlaceholder)
        
        //setting Padding
        emailFied.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailFied.leftViewMode = .always
        emailFied.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        emailFied.rightViewMode = .always
        emailFied.delegate = self
        
        view.addSubview(emailFied)
        
        emailFied.translatesAutoresizingMaskIntoConstraints = false
        emailFied.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        emailFied.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailFied.widthAnchor.constraint(equalToConstant: view.width / 1.5).isActive = true
        emailFied.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    func setupPasswordField(){
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.returnKeyType = .done
        passwordField.layer.cornerRadius = 5
        passwordField.layer.borderWidth = 1
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.textColor = .black
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password...",
                                                                 attributes: colorPlaceholder)
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        
        //setting Padding
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordField.leftViewMode = .always
        passwordField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordField.rightViewMode = .always
        
        view.addSubview(passwordField)
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: emailFied.bottomAnchor, constant: 20).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalToConstant: view.width / 1.5).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    func setupLoginBtn(){
        loginBtn.setTitle("Log In", for: .normal)
        loginBtn.backgroundColor = .link
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.cornerRadius = 3
        loginBtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.addTarget(self, action: #selector(actionLogIn), for: .touchUpInside)
        view.addSubview(loginBtn)

        loginBtn.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30).isActive = true
        loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true

    }
    
    @objc func didTapRegister(){
        let vc = RegisterVC()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func actionLogIn(){
        startAnimating()
        self.view.endEditing(true)
        
        emailFied.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailFied.text, let password = passwordField.text,
              !email.isEmpty, !password.isEmpty, password.count >= 6 else {
                  self.view.makeToast("Please enter all information")
                  stopAnimating()
                  return
              }
        
        //Login
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if err != nil {
                self.view.makeToast(err?.localizedDescription)
                self.stopAnimating()
            } else {
                self.navigationController?.dismiss(animated: true, completion: nil )
                self.stopAnimating()
            }
        }
    }

}

extension LoginVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailFied {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            actionLogIn()
        }
        
        return true
    }
}
