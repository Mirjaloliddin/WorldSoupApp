//
//  ViewController.swift
//  WorldApp
//
//  Created by Murtazaev Mirjaloliddin Kamolovich on 22/02/23.
//

import UIKit
import SnapKit
import SDWebImage

class TabBarViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .separator
        
          let homeVC = UINavigationController(rootViewController: HomeVC())
          let cardVC = UINavigationController(rootViewController: CardVC())
          let quizVC = UINavigationController(rootViewController: QuizVC())
          let infoVC = UINavigationController(rootViewController: InfoVC())
          let settingsVC = UINavigationController(rootViewController: SettingsVC())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        cardVC.tabBarItem.image = UIImage(systemName: "photo.artframe")
        quizVC.tabBarItem.image = UIImage(systemName: "puzzlepiece")
        infoVC.tabBarItem.image = UIImage(systemName: "info.circle")
        settingsVC.tabBarItem.image = UIImage(systemName: "gearshape")
        
        homeVC.title = "Home"
        cardVC.title = "Card"
        quizVC.title = "Quiz"
        infoVC.title = "Info"
        settingsVC.title = "Settings"
        
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .darkGray
        tabBar.barTintColor = .systemYellow
        tabBarItem.badgeColor = .yellow
        
        setViewControllers([homeVC, cardVC, quizVC, infoVC, settingsVC], animated: true)
    }
}
extension UIImage {
    static func resizeImage(named: String, h: CGFloat, w: CGFloat) -> UIImage {
        guard let image = UIImage(named: named) else { return UIImage() }
        let targetSize = CGSize(width: w, height: h)
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        return newImage
    }
}


