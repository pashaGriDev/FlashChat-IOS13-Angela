//
//  SceneDelegate.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 14.03.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let welcomViewController = UIViewController(nibName: "WelcomViewController", bundle: nil)
        window?.rootViewController = UINavigationController(rootViewController: welcomViewController)
        window?.makeKeyAndVisible()
    }
}

