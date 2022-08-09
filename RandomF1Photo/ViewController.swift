//
//  ViewController.swift
//  RandomF1Photo
//
//  Created by FRIDAY on 9.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageview: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
                button.layer.shadowColor = UIColor.black.cgColor
                button.layer.shadowOpacity = 0.2
                button.layer.shadowOffset = CGSize(width: 4, height: 4)
                button.layer.shadowRadius = 5.0
                button.layer.masksToBounds = false
                button.layer.cornerRadius = 25
                button.layer.masksToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(imageview)
        imageview.frame = CGRect(x: 0, y: 0, width: 350, height: 500)
        imageview.center = view.center
        imageview.layer.shadowColor = UIColor.black.cgColor
                imageview.layer.shadowOpacity = 0.2
                imageview.layer.shadowOffset = CGSize(width: 4, height: 4)
                imageview.layer.shadowRadius = 5.0
                imageview.layer.masksToBounds = false
        imageview.layer.cornerRadius = 7
        imageview.layer.masksToBounds = true
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        RandomPhoto()
    }
    
    
    @objc func didTapButton(){
        RandomPhoto()
        
        
    }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            button.frame = CGRect(x: 30, y: view.frame.size.height-70-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 50)
        }

    func RandomPhoto () {
        let urlString = "https://source.unsplash.com/random/700x1000/?formula1"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageview.image = UIImage(data: data)
    }

}

