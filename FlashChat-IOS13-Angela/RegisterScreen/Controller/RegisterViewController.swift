//
//  RegisterViewController.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 14.03.23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: изменить цвет кнопки назад в навигатор контроллере
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        print("registerButtonPressed")
        let email = emailTextField.text ?? "not value"
        let password = passwordTextField.text ?? "not value"
        print("\(email) : \(password)")
        
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}
