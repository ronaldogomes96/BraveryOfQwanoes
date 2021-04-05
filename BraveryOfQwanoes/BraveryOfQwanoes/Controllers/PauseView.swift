//
//  PauseView.swift
//  BraveryOfQwanoes
//
//  Created by Anderson Alencar on 24/03/21.
//

import UIKit

class PauseView: UIView {

    lazy var title: UILabel = {
        let title = UILabel()
        title.text = "Pause"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var descriptionPause: UILabel = {
        let title = UILabel()
        title.text = "Swip para cima para retonar ao menu ou swip para direita para retornar ao jogo"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config() {
        self.addSubview(title)
        self.addSubview(descriptionPause)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            descriptionPause.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            descriptionPause.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            descriptionPause.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            descriptionPause.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        self.backgroundColor = .red
    }
    
}
