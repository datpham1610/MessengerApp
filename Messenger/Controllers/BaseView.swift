//
//  BaseViewController.swift
//  FinalLesson
//
//  Created by PDD on 04/09/2023.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    let viewIndicator = UIView()
    var loadingIndicator: NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIndicator()
        // Do any additional setup after loading the view.
    }
    
    func setupIndicator(){
        viewIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        viewIndicator.layer.cornerRadius = 10
        viewIndicator.layer.masksToBounds = true
        view.addSubview(viewIndicator)

        viewIndicator.translatesAutoresizingMaskIntoConstraints = false
        viewIndicator.widthAnchor.constraint(equalToConstant: 60).isActive = true
        viewIndicator.heightAnchor.constraint(equalToConstant: 60).isActive = true
        viewIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewIndicator.isHidden = true
        
        let frame = CGRect(x: 15, y: 15, width: 30, height: 30)
        loadingIndicator = NVActivityIndicatorView(frame: frame, type: .lineScale, color: .white, padding: 0)
        viewIndicator.addSubview(loadingIndicator!)
        
    }
    
    func startAnimating(){
        viewIndicator.isHidden = false
        view.isUserInteractionEnabled = false
        loadingIndicator?.startAnimating()
        view.bringSubviewToFront(viewIndicator)
    }
    
    func stopAnimating(){
        viewIndicator.isHidden = true
        view.isUserInteractionEnabled = true
        loadingIndicator?.stopAnimating()
    }
    
    func RoundCorner(views: [UIView], radius: CGFloat){
        views.forEach { v in
            v.layer.cornerRadius = radius
            v.layer.masksToBounds = true
        }
    }
    
}
