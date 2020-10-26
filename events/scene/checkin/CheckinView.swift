//
//  CheckinView.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

class CheckinView: UIView {
    var nameTextField: UITextField!
    var emailTextField: UITextField!
    var confirmButton: Button!
    
    init() {
        super.init(frame: .zero)
        
        instantiateViews()
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func instantiateViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        nameTextField = UITextField(frame: .zero)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Insira seu nome"
        nameTextField.textAlignment = .center
        nameTextField.layer.cornerRadius = 8
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.borderWidth = 1.5
        
        emailTextField = UITextField(frame: .zero)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Insira seu email"
        emailTextField.textAlignment = .center
        emailTextField.layer.cornerRadius = 8
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1.5
        
        confirmButton = Button(title: "Confirmar check-in", style: .filled, size: .small)
    }
    
    func buildViewHierarchy() {
        addSubviews([
            nameTextField,
            emailTextField,
            confirmButton
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 35),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
