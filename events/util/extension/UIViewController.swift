//
//  UIViewController.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with title: String = "", message: String = "", actionTitle: String = "", _ completion: (() -> ())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default) { _ in
            completion?()
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlert(with error: ServiceError) {
        presentAlert(with: "Error", message: error.localizedDescription, actionTitle: "Ok")
    }
}
