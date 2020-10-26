//
//  UIViewController.swift
//  events
//
//  Created by Guilherme Colombini on 26/10/20.
//  Copyright © 2020 Guilherme Colombini. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with title: String = "", message: String = "", actionTitle: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlert(with error: ServiceError) {
        presentAlert(with: "Error", message: error.localizedDescription, actionTitle: "Ok")
    }
}
