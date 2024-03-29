//
//  SceneDelegate.swift
//  BusBooking
//
//  Created by user on 16/08/22.
//

import UIKit
import Authentication

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene
        let navigation = setupNavigationController()
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
    private func setupNavigationController() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: AuthenticationUser().isUserLogged ? HomeViewController() : LoginViewController())
        navigation.navigationBar.standardAppearance = setupAppearenceBar()
        navigation.navigationBar.isTranslucent = false
        navigation.navigationBar.tintColor = .white
        navigation.navigationBar.scrollEdgeAppearance = navigation.navigationBar.standardAppearance
        return navigation
    }
    
    private func setupAppearenceBar() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor : UIColor.white,
                                               .font: UIFont.systemFont(ofSize: 30, weight: .heavy)]
        appearance.titleTextAttributes = [.foregroundColor : UIColor.white,
                                               .font: UIFont.systemFont(ofSize: 25, weight: .medium)]
        appearance.backgroundColor = Colors.mainColor
        return appearance
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

