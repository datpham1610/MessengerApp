//
//  RegisterVC.swift
//  Messenger
//
//  Created by PDD on 07/09/2023.
//

import UIKit
import Toast_Swift
import FirebaseAuth

class RegisterVC: BaseViewController {
    
    private let imageView = UIImageView()
    private let emailFied = UITextField()
    private let passwordField = UITextField()
    private let passwordConfirmField = UITextField()
    private let firstnameField = UITextField()
    private let lastnameField = UITextField()
    private let registerBtn = UIButton()
    let colorPlaceholder = [NSAttributedString.Key.foregroundColor:UIColor.systemGray]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Register"
        // Do any additional setup after loading the view.

        setupView()
    }
    
    func setupView(){
        
        //Setup ImageView
        setupImageView()
        
        //setupField
        setupFirstNameField()
        setupLastNameField()
        setupEmailField()
        setupPasswordField()
        setupPasswordField2()
        
        //setupButton
        setupRegisterBtn()
    }
    
    func setupImageView(){
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.isUserInteractionEnabled = true
        imageView.frame = CGRect.init(x: 0, y: 0, width: view.width/4, height: 0)
        imageView.layer.cornerRadius = imageView.width / 2.0
        let gesture = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gesture)
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.width/4).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.width/4).isActive = true
    }
    
    @objc func chooseImage(){
        presentPhotoActionSheet()
    }
    
    func setupFirstNameField(){
        firstnameField.autocapitalizationType = .none
        firstnameField.autocorrectionType = .no
        firstnameField.returnKeyType = .continue
        firstnameField.layer.cornerRadius = 5
        firstnameField.layer.borderWidth = 1
        firstnameField.layer.borderColor = UIColor.lightGray.cgColor
        firstnameField.textColor = .black
        firstnameField.attributedPlaceholder = NSAttributedString(string: "First Name...", attributes: colorPlaceholder)
        
        //setting Padding
        firstnameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        firstnameField.leftViewMode = .always
        firstnameField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        firstnameField.rightViewMode = .always
        firstnameField.delegate = self
        
        view.addSubview(firstnameField)
        
        firstnameField.translatesAutoresizingMaskIntoConstraints = false
        firstnameField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        firstnameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstnameField.widthAnchor.constraint(equalToConstant: view.width / 1.5).isActive = true
        firstnameField.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    func setupLastNameField(){
        lastnameField.autocapitalizationType = .none
        lastnameField.autocorrectionType = .no
        lastnameField.returnKeyType = .continue
        lastnameField.layer.cornerRadius = 5
        lastnameField.layer.borderWidth = 1
        lastnameField.layer.borderColor = UIColor.lightGray.cgColor
        lastnameField.textColor = .black
        lastnameField.attributedPlaceholder = NSAttributedString(string: "Last name ...", attributes: colorPlaceholder)
        
        //setting Padding
        lastnameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        lastnameField.leftViewMode = .always
        lastnameField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        lastnameField.rightViewMode = .always
        lastnameField.delegate = self
        
        view.addSubview(lastnameField)
        
        lastnameField.translatesAutoresizingMaskIntoConstraints = false
        lastnameField.topAnchor.constraint(equalTo: firstnameField.bottomAnchor, constant: 20).isActive = true
        lastnameField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lastnameField.widthAnchor.constraint(equalToConstant: view.width / 1.5).isActive = true
        lastnameField.heightAnchor.constraint(equalToConstant: 40).isActive = true

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
        emailFied.topAnchor.constraint(equalTo: lastnameField.bottomAnchor, constant: 20).isActive = true
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
        passwordField.textContentType = .newPassword
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
    
    func setupPasswordField2(){
        passwordConfirmField.autocapitalizationType = .none
        passwordConfirmField.autocorrectionType = .no
        passwordConfirmField.returnKeyType = .done
        passwordConfirmField.layer.cornerRadius = 5
        passwordConfirmField.layer.borderWidth = 1
        passwordConfirmField.textColor = .black
        passwordConfirmField.textContentType = .newPassword
        passwordConfirmField.layer.borderColor = UIColor.lightGray.cgColor
        passwordConfirmField.attributedPlaceholder = NSAttributedString(string: "Password...",
                                                                 attributes: colorPlaceholder)
        passwordConfirmField.isSecureTextEntry = true
        passwordConfirmField.delegate = self
        
        //setting Padding
        passwordConfirmField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordConfirmField.leftViewMode = .always
        passwordConfirmField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        passwordConfirmField.rightViewMode = .always
        
        view.addSubview(passwordConfirmField)
        
        passwordConfirmField.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        passwordConfirmField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordConfirmField.widthAnchor.constraint(equalToConstant: view.width / 1.5).isActive = true
        passwordConfirmField.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }

    
    func setupRegisterBtn(){
        registerBtn.setTitle("Register", for: .normal)
        registerBtn.backgroundColor = .systemGreen
        registerBtn.setTitleColor(.white, for: .normal)
        registerBtn.layer.masksToBounds = true
        registerBtn.layer.cornerRadius = 3
        registerBtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerBtn)
        
        registerBtn.addTarget(self, action: #selector(actionRegister), for: .touchUpInside)

        registerBtn.topAnchor.constraint(equalTo: passwordConfirmField.bottomAnchor, constant: 30).isActive = true
        registerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        registerBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true

    }
    
    @objc func actionRegister(){
        view.endEditing(true)
        let firstName = firstnameField.text
        let lastName = lastnameField.text
        let email = emailFied.text
        let password = passwordField.text
        let confirmPassword = passwordConfirmField.text
        
        firstnameField.resignFirstResponder()
        lastnameField.resignFirstResponder()
        emailFied.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        startAnimating()
        if firstName == "" || lastName == "" || email == "" || password == "" || confirmPassword == "" {
            view.makeToast("Please enter all information to create new account")
            stopAnimating()
            return
        } else if (password!.count < 6) {
            view.makeToast("Password must be more than 6 characters")
            stopAnimating()
            return
        } else if (password != confirmPassword) {
            view.makeToast("password and confirmation password are not match")
            stopAnimating()
            return
        }
        
        //Register account
        DbManager.shared.userExists(with: email!) { exists in
            guard !exists else {
                self.view.makeToast("Looke like user account for that email address already exists")
                self.stopAnimating()
                return
            }
        }
        
        Auth.auth().createUser(withEmail: email!, password: password!, completion: { result, err in
            if err != nil {
                self.view.makeToast(err!.localizedDescription)
                self.stopAnimating()
            } else {
                let user = result?.user
                self.view.makeToast("Created user successfully")
                DbManager.shared.insertUser(with: ChatAppUser(firstName: firstName!,
                                                              lastName: lastName!,
                                                              emailAddress: email!))
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.dismiss(animated: true)
                }
                self.stopAnimating()
            }
        })
    }
}

extension RegisterVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailFied {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            actionRegister()
        }
        return true
    }
}

extension RegisterVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func presentPhotoActionSheet(){
        let action = UIAlertController(title: "Profile Picture",
                                       message: "How would you like to select a picture",
                                       preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "Cancel",
                                       style: .cancel,
                                       handler: nil))
        action.addAction(UIAlertAction(title: "Take Photo",
                                       style: .default,
                                       handler: { _ in
            self.presentCamera()
        }))
        action.addAction(UIAlertAction(title: "Choose Photo",
                                       style: .default,
                                       handler: { _ in
            self.presentPhoto()
        }))
        present(action, animated: true, completion: nil)
    }
    
    func presentCamera(){
        let image = UIImagePickerController()
        image.sourceType = .camera
        image.delegate = self
        image.isEditing = true
        present(image, animated: true, completion: nil)
        
    }
    
    func presentPhoto(){
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        image.isEditing = true
        present(image, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = selectedImage
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
