//
//  LoginViewController.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 14.03.23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "1@2.com"
        passwordTextField.text = "123456"
        
        // TODO: изменить цвет кнопки назад в навигатор контроллере
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.backgroundColor = nil
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let self = self else { return }
                if let error {
                    // выдает ошибку на языке устройства
                    // можно потом сделать алерт
                    print(error.localizedDescription)
                } else {
                    let chatViewController = ChatViewController()
                    self.navigationController?.pushViewController(chatViewController, animated: true)
                }
            }
        }
    }
}
